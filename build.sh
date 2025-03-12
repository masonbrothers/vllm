#!/bin/bash

# Detect architecture
ARCH=$(uname -m)

if [[ "$ARCH" == "aarch64" || "$ARCH" == "arm64" ]]; then
    echo "Detected ARM architecture ($ARCH). Building ARM image..."
    docker build -f Dockerfile.arm -t vllm-cpu-env --shm-size=4g .
elif [[ "$ARCH" == "x86_64" ]]; then
    echo "Detected x86_64 architecture. Building CPU image..."
    docker build -f Dockerfile.cpu -t vllm-cpu-env --shm-size=4g .
else
    echo "Error: Unsupported architecture ($ARCH). Only ARM (aarch64, arm64) and x86_64 are supported."
    exit 1
fi

