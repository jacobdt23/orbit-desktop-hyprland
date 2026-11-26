#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "${HOME}/.config" "${HOME}/.local/bin" "${HOME}/.local/share/applications"

# 1. Install user configs
for dir in hypr-standalone waybar rofi dunst nvim-hyprland; do
    mkdir -p "${HOME}/.config/${dir}"
    cp -r "${REPO_DIR}/config/${dir}/." "${HOME}/.config/${dir}/"
done
cp "${REPO_DIR}/config/x-hyprland-standalone-mimeapps.list" "${HOME}/.config/"

# 2. Install helper binaries
install -m 755 "${REPO_DIR}/bin/start-hyprland-standalone" "${HOME}/.local/bin/"
install -m 755 "${REPO_DIR}/bin/orbit-nvim" "${HOME}/.local/bin/"
install -m 755 "${REPO_DIR}/bin/orbit-nvim-cli" "${HOME}/.local/bin/"

# 3. Install Orbit Files & Orbit Suite launchers + scoped .desktop entries
"${REPO_DIR}/apps/orbit-files/install-desktop.sh"
"${REPO_DIR}/apps/orbit-suite/install-suite.sh"

# 4. Optional: install system-wide Wayland session entry for SDDM/greeters
if [[ "${1:-}" == "--with-session" ]]; then
    sudo install -m 755 "${REPO_DIR}/bin/start-hyprland-standalone" /usr/local/bin/start-hyprland-standalone
    sudo install -m 644 "${REPO_DIR}/config/hypr-standalone/hyprland-standalone.desktop" /usr/share/wayland-sessions/hyprland-standalone.desktop
    echo "Installed Hyprland (Standalone) Wayland session."
fi

echo "Orbit Desktop installed successfully."
