# CentOS Atomic &nbsp; [![build-ublue](https://github.com/fantastic-fedora/CentOS-Atomic/actions/workflows/build.yml/badge.svg)](https://github.com/blue-build/template/actions/workflows/build.yml)

Fedora Atomic Desktops use rpm-ostree, which is the best distribution method for stability. But Fedora is also very up to date, so it is probably not fitting for a business environment.

CentOS Stream is the upstream of RHEL, but downstream of Fedora. It is a good middleground, for a stable workstation.

CentOS Steam and RHEL will eventually adopt `rpm-ostree` as the distribution method, and [CentOS-bootc](https://github.com/CentOS/centos-bootc/) is a fully bootable rpm-ostree based image, which you can find [here](https://quay.io/repository/centos-bootc/centos-bootc-dev?tab=tags)

This project consumes this image, and adds the packages needed for a good desktop experience to it.

## Installation

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase --reboot ostree-unverified-registry:ghcr.io/fantastic-fedora/CentOS-Atomic:latest
  ```

- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase --reboot ostree-image-signed:docker://ghcr.io/fantastic-fedora/CentOS-Atomic:latest
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the CentOS Stream version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key /path/to/cosign.pub ghcr.io/fantastic-fedora/CentOS-Atomic
```
