#!/usr/bin/env bash

# Tell build process to exit if there are any errors.
set -oue pipefail

echo "Disabling bluetooth"
systemctl disable bluetooth
systemctl mask bluetooth
