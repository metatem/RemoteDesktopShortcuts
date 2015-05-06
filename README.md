RemoteDesktopShortcuts
======================
This is a PowerShell script for creating Remote Desktop Connection files (.rdp) from a template.
It also adds a shortcut which can be pinned to the taskbar or the start screen by the user.

Instructions
------------
1. Run the NewConnection.ps1 script (right click -> Run with PowerShell)
  * It will create a new folder RemoteDesktops
  * Inside you will find the new .rdp file and a shortcut to it
  * You can pin the shortcut to the start screen or the taskbar
  * You can delete the shortcut once it is pinned

2. If you want to save the password for the remote computer you must:
  * Manually edit the .rdp file (right click -> Edit)
  * Check the "Allow me to save credentials" checkbox
  * Click the "Save" button
  * Click the "Connect" button
  * If a dialog is displayed telling you that the publisher can't be identified click "Don't ask me again..." and "Connect"
  * Then enter your credentials and check the box to save your credentials
  * After this you should be able to connect without entering the credentials using the pinned shortcut
  