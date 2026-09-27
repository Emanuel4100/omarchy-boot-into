import QtQuick

// Intentionally empty. Everything this plugin does lives in
// bin/omarchy-boot-into and the System-menu entries in extras/; the manifest
// schema just requires at least one kind with a loadable entry point.
Item {
  // Injected by the omarchy-shell host.
  property var shell: null
}
