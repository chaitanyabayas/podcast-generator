FROM ubuntu:latest

# Set non-interactive mode for apt
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3.10-venv \
    build-essential \
    libyaml-dev \
    git && \
    ln -sf /usr/bin/python3.10 /usr/bin/python && \
    ln -sf /usr/bin/pip3 /usr/bin/pip && \
    pip install --upgrade pip setuptools wheel

# Install PyYAML
RUN pip install PyYAML

# Copy app files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make entrypoint executable
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
