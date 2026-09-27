# Boot Into

Reboot once into another OS on the drive (Windows, another distro) or
straight into firmware setup, from Omarchy 4's System menu:

```
SUPER+SPACE → System → Logout / Boot To / Reboot / Shutdown
```

It reads the active UEFI boot entries from `efibootmgr` and sets `BootNext`,
so only the next boot goes to the chosen OS; the one after returns to the
normal boot order (Limine/Omarchy). Entries for the current OS, Limine, the
EFI shell, and removable/vendor devices are skipped. Setting `BootNext`
needs root, so you get a polkit prompt before the reboot.

## Install (Omarchy)

```bash
omarchy plugin add https://github.com/Emanuel4100/omarchy-boot-into.git
ln -sf ~/.config/omarchy/plugins/emanuel.boot-into/bin/omarchy-boot-into ~/.local/bin/
```

Requires `efibootmgr` (`sudo pacman -S efibootmgr`) and a UEFI system.

## Menu entry

Omarchy merges `default/omarchy/omarchy-menu.jsonc` with
`~/.config/omarchy/extensions/omarchy-menu.jsonc` (yours), and nothing
auto-writes to the latter. Paste
[`extras/omarchy-menu.jsonc`](extras/omarchy-menu.jsonc) into your own
extensions file.

The menu has no ordering field: rows appear in the order their ids are first
seen, defaults first. A new `system.boot-into` id on its own would land at
the very bottom, after Shutdown. To place it between Logout and Reboot, the
snippet hides the stock `system.reboot` / `system.shutdown` rows
(`"when":"false"`) and re-adds them as `system.reboot-now` /
`system.shutdown-now` after Boot To, with the same commands.

## Usage

```bash
omarchy-boot-into          # pick a target in the Omarchy menu picker, then reboot
omarchy-boot-into --list   # print icon<TAB>label<TAB>boot-number rows
```

## Files

- `manifest.json` — plugin manifest (`kinds: ["service"]`)
- `Service.qml` — empty; the manifest schema requires a loadable kind
- `bin/omarchy-boot-into` — the picker + `BootNext` reboot, symlinked into
  `~/.local/bin`
- `extras/omarchy-menu.jsonc` — System-menu entries to paste into your
  extensions file

## License

MIT
