FROM ubuntu:21.04

RUN apt-get update  \
  && apt-get install -y --no-install-recommends \
    ca-certificates \
    fontconfig \
    git \
    gcc \
    iputils-ping \
    libevent-dev \
    libncurses-dev \
    locales \
    make \
    procps \
    wget \
    tmux \
  && apt-get purge -y gcc make \
  && apt-get -y autoremove \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
  && locale-gen
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8

WORKDIR /root

ENV TERM=xterm-256color


