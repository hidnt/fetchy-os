#!/usr/bin/env bash

set -ouex pipefail

echo "Building nvidia proprietary drivers"

cd /etc/yum.repos.d/

KERNEL_VERSION=$(rpm -qa kernel-cachyos-core | sed 's/kernel-cachyos-core-//')
if ! akmods --force --kernels "$KERNEL_VERSION" --rebuild; then
    cat /var/cache/akmods/nvidia/*.failed.log
    echo "Failed to build drivers"
    exit 1
fi

rpm -qa | grep nvidia

echo "Nvidia driver build completed"