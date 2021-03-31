FROM alpine/helm

LABEL maintainer Valentin Hubert <valentin.hubert@cibiltech.com>

RUN apk add --no-cache grep util-linux git curl openssh jq bash gettext

RUN wget https://github.com/mikefarah/yq/releases/download/v4.6.1/yq_linux_amd64.tar.gz -O - | tar xz && mv yq_linux_amd64 /usr/bin/yq
