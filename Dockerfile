# Base image with Ubuntu
FROM debian:12-slim

# Set default platform
ARG PLATFORM=linux

# Install dependencies
RUN apt update && apt install -y \
    python3 \
    python3-pip \
    git \
    mercurial \
    autoconf2.13 \
    build-essential \
    curl \
    libgtk-3-dev \
    libdbus-glib-1-dev \
    libxt-dev \
    unzip \
    wget


# Clone Mercury source
RUN git clone https://github.com/D3fau4/Mercury.git /mercury

# Navigate to the Mercury folder
WORKDIR /mercury

ENV HG_SRC_DIR = /mercury/mozilla-unified

# Set up the Mozilla and Mercury sources
RUN ./bootstrap.sh --$PLATFORM && ./setup.sh

# Build Mercury
CMD ["./build.sh"]
