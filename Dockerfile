FROM ubuntu:trusty
MAINTAINER Alex Newman <alex@newman.pro>

# Let the container know that there is no TTY
ENV DEBIAN_FRONTEND noninteractive

# Install necessary packages for proper system state
RUN apt-get -y update && apt-get install -y \
    build-essential \
    git \
    cmake \
    pkg-config \
    libbz2-dev \
    libstxxl-dev \
    libstxxl-doc \
    libstxxl1 \
    libxml2-dev \
    libzip-dev \
    libboost-all-dev \
    lua5.1 \
    liblua5.1-0-dev \
    libluabind-dev \
    libluajit-5.1-dev \
    libtbb-dev
    
RUN git clone https://github.com/DennisOSRM/Project-OSRM.git /src \
 && mkdir –p /build \
 && cd /build \
 && cmake /src \
 && make \
 && mv /src/profiles/car.lua profile.lua \
 && mv /src/profiles/lib/ lib \
 && echo "disk=/tmp/stxxl,25000,syscall" > /build/.stxxl \
 && rm -rf /src
 
WORKDIR /build

# Cleanup --------------------------------

RUN apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Publish --------------------------------

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5000
