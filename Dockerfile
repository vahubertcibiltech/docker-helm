FROM alpine

LABEL maintainer Valentin Hubert <valentin.hubert@cibiltech.com>

RUN apk add --no-cache grep util-linux git curl openssh jq bash gettext build-base

RUN wget https://github.com/mikefarah/yq/releases/download/v4.6.1/yq_linux_amd64.tar.gz -O - | tar xz && mv yq_linux_amd64 /usr/bin/yq

COPY --from=alpine/helm /usr/bin/helm /usr/bin/helm
COPY --from=golang:1.16-alpine /usr/local/go/ /usr/local/go/
ENV PATH="/usr/local/go/bin:/root/go/bin/:${PATH}"

RUN GO111MODULE=on go get golang.stackrox.io/kube-linter/cmd/kube-linter
