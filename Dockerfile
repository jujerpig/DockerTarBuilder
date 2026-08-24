FROM debian:10

RUN printf '%s\n' \
    'deb http://archive.debian.org/debian buster main contrib non-free' \
    'deb http://archive.debian.org/debian-security buster/updates main contrib non-free' \
    > /etc/apt/sources.list \
 && echo 'Acquire::Check-Valid-Until "false";' \
    > /etc/apt/apt.conf.d/99no-check-valid-until \
 && apt-get update \
 && apt-get install -y \
      build-essential \
      cmake \
      git \
      python3 \
      perl \
      pkg-config \
      vim-common \
      gdb \
      binutils \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /work
