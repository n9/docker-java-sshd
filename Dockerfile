ARG BASE_IMAGE_VERSION
ARG BASE_IMAGE=eclipse-temurin:$BASE_IMAGE_VERSION

FROM $BASE_IMAGE

ENV DATA_ROOT /data
ENV USER_HOME "${DATA_ROOT}/home"
ENV USER_NAME user

RUN adduser --home "${USER_HOME}" --shell /bin/bash "${USER_NAME}" && \
    chown $USER_NAME:$USER_NAME /data

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends bash git nano openssh-server && \
    rm -rf /var/lib/apt/lists/*

USER $USER_NAME