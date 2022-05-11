#!/bin/bash

set -uex

CUDA="$1"
DOCKERFILE="Dockerfile"
OS="centos7"
BASE="centos:8"

case ${CUDA} in
  10.2 )
    CUDA_VERSION="10.2.89"
    CUDA_INSTALLER_URL="https://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda_10.2.89_440.33.01_linux.run"
    ;;
  11.0 )
    CUDA_VERSION="11.0.2"
    CUDA_INSTALLER_URL="https://developer.download.nvidia.com/compute/cuda/11.0.2/local_installers/cuda_11.0.2_450.51.05_linux.run"
    ;;
  11.1 )
    CUDA_VERSION="11.1.0"
    CUDA_INSTALLER_URL="https://developer.download.nvidia.com/compute/cuda/11.1.0/local_installers/cuda_11.1.0_455.23.05_linux.run"
    ;;
  11.2 )
    CUDA_VERSION="11.2.0"
    CUDA_INSTALLER_URL="https://developer.download.nvidia.com/compute/cuda/11.2.0/local_installers/cuda_11.2.0_460.27.04_linux.run"
    ;;
  11.3 )
    CUDA_VERSION="11.3.0"
    CUDA_INSTALLER_URL="https://developer.download.nvidia.com/compute/cuda/11.3.0/local_installers/cuda_11.3.0_465.19.01_linux.run"
    ;;
  11.4 )
    CUDA_VERSION="11.4.0"
    CUDA_INSTALLER_URL="https://developer.download.nvidia.com/compute/cuda/11.4.0/local_installers/cuda_11.4.0_470.42.01_linux.run"
    ;;
  11.5 )
    CUDA_VERSION="11.5.0"
    CUDA_INSTALLER_URL="https://developer.download.nvidia.com/compute/cuda/11.5.0/local_installers/cuda_11.5.0_495.29.05_linux.run"
    ;;
  11.6 )
    CUDA_VERSION="11.6.0"
    CUDA_INSTALLER_URL="https://developer.download.nvidia.com/compute/cuda/11.6.0/local_installers/cuda_11.6.0_510.39.01_linux.run"
    ;;
  11.6-aarch64 )
    CUDA_VERSION="11.6.0"
    CUDA_INSTALLER_URL="https://developer.download.nvidia.com/compute/cuda/11.6.0/local_installers/cuda_11.6.0_510.39.01_linux_sbsa.run"
    OS="centos8"
    DOCKERFILE="Dockerfile.centos8"
    ;;
  * )
    echo "Unknown CUDA version: ${CUDA}"
    exit 1
    ;;
esac

docker build -t "cupy/cupy-release-tools:cuda-runfile-${CUDA_VERSION}-${OS}" -f "${DOCKERFILE}" . \
    --build-arg CUDA_INSTALLER_URL="${CUDA_INSTALLER_URL}"

echo "Done. Run docker push cupy/cupy-release-tools:cuda-runfile-${CUDA_VERSION}-${OS} to push the image."
