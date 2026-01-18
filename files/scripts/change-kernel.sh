#!/usr/bin/env bash

set -ouex pipefail

echo "Setting up CachyOS kernel"

cd /etc/yum.repos.d/
wget https://copr.fedorainfracloud.org/coprs/bieszczaders/kernel-cachyos/repo/fedora-$(rpm -E %fedora)/bieszczaders-kernel-cachyos-fedora-$(rpm -E %fedora).repo

rpm-ostree override remove \
    kernel \
    kernel-core \
    kernel-modules \
    kernel-modules-core \
    kernel-modules-extra \
    nvidia \
    --install kernel-headers \
    --install kernel-cachyos \
    --install kernel-cachyos-devel-matched

echo "CachyOS kernel setup completed"