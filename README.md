# Orbit Desktop

A standalone **Hyprland** desktop setup paired with the custom **Orbit Suite** of native Python **GTK 4 + Libadwaita** desktop apps and an isolated **LazyVim** configuration (`NVIM_APPNAME=nvim-hyprland`).

Designed to coexist cleanly alongside **COSMIC** and **Omarchy** using XDG session scoping (`XDG_CURRENT_DESKTOP=X-Hyprland-Standalone:Hyprland`).

## What's Inside

- **`apps/orbit-files`** — GTK 4 + Libadwaita file manager inspired by COSMIC Files & Thunar (tabs, split view, sidebar with bookmarks/mounts, list & grid views, preview pane, drag-and-drop, Trash).
- **`apps/orbit-suite`** — Companion GTK 4 + Libadwaita apps:
  - `orbit-view` — Image viewer with folder gallery, zoom, rotation, slideshow, and info drawer.
  - `orbit-launch` — Fuzzy `.desktop` app launcher with `= math` calculator and `> run` command mode.
  - `orbit-term` — Multi-tab terminal emulator (auto-uses native `vte4` if installed, or Python PTY fallback).
  - `orbit-edit` — Lightweight tabbed text editor (or use LazyVim via `orbit-nvim`).
- **`config/hypr-standalone`** — Standalone Hyprland 0.57+ Lua config (frosted-glass blur, dual 1080p@100Hz monitors, Tokyonight borders, NVIDIA stability flags, Orbit keybindings) + `hyprpaper.conf`.
- **`config/waybar`**, **`config/rofi`**, **`config/dunst`** — Frosted-glass top bar, bottom dock, launcher fallback, and notifications.
- **`config/nvim-hyprland`** — Isolated LazyVim setup with `tokyonight-night` and `hyprlang` Treesitter support.
- **`config/x-hyprland-standalone-mimeapps.list`** — Per-session MIME defaults scoped exclusively to `X-Hyprland-Standalone`.

## Quick Install

```bash
./install.sh
```

To also install the SDDM/Wayland login session (`/usr/share/wayland-sessions/hyprland-standalone.desktop` and `/usr/local/bin/start-hyprland-standalone`):

```bash
./install.sh --with-session
```
