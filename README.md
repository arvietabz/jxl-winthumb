# jxl-winthumb

A JPEG XL (*.jxl) WIC decoder to render thumbnails on Windows File Explorer or view images on any WIC-capable image viewers.

## How to install

1. Download the dll file from https://github.com/arvietabz/jxl-winthumb/tree/main/target
   1. ARM 64bit Windows gets `_aarch64.dll`
   2. Intel/AMD 64bit Windows gets `_x86_64.dll`
   3. Intel/AMD 32bit Windows gets `_i686.dll`
1. Open a terminal window as administrator
1. Move to your download directory
1. `regsvr32 jxl_winthumb_(arch).dll`, or to uninstall, `regsvr32 /u jxl_winthumb_(arch).dll`.

You might need to restart `explorer.exe` or any programs that use the dll before updating it. Get the list of such programs using `tasklist /m jxl_winthumb.dll` and kill them e.g. with `taskkill /f /im explorer.exe && start explorer.exe`.

## HDR tone mapping

This build adds HDR (High Dynamic Range) JPEG XL support: HDR images are automatically tone-mapped to SDR when rendering thumbnails, similar to [ImageGlass](https://github.com/d2phap/ImageGlass). No extra configuration is needed — just install the DLL as described above.

## Thumbnail fix (clearing the thumbnail cache)

Windows caches generated thumbnails aggressively. If your thumbnails look wrong (e.g. washed-out or oversaturated HDR images, stale previews after an update), the old cached thumbnails must be deleted so Explorer regenerates them with the new decoder:

1. Close all File Explorer windows.
2. Stop Explorer and delete the cached thumbnails:
   ```cmd
   taskkill /f /im explorer.exe
   del /f /s /q %LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db
   del /f /q %LocalAppData%\Microsoft\Windows\Explorer\iconcache_*.db
   start explorer.exe
   ```
   Alternatively, run **Disk Cleanup** (`cleanmgr`) as administrator and tick **Thumbnails**, then click OK.
3. If thumbnails still don't refresh for a specific folder, browse away from it and back, or reboot.

### Updating to a new version of the DLL

Because the DLL is loaded by `explorer.exe` and WIC-capable apps, you cannot overwrite it while they are running:

1. Find processes holding the DLL: `tasklist /m jxl_winthumb.dll`
2. Kill them (Explorer in particular): `taskkill /f /im explorer.exe`
3. Unregister the old version: `regsvr32 /u jxl_winthumb.dll` (elevated prompt)
4. Replace the file, then re-register: `regsvr32 jxl_winthumb.dll`
5. Clear the thumbnail cache as shown above and restart Explorer: `start explorer.exe`

### Troubleshooting registration errors

* **`DllRegisterServer failed with error code 0x80004005`** — usually means the terminal isn't elevated, or the file is blocked. Run Command Prompt *as administrator*, and right-click the DLL → Properties → tick **Unblock**. Also make sure you use `%windir%\System32\regsvr32.exe` (64-bit) for the x64 DLL.
* Thumbnails not appearing at all — check that Folder Options is not set to *"Always show icons, never thumbnails"*, and that Explorer's preview pane settings allow thumbnails.

## Build environment

Use the stable Rust toolchain. Current toolchain as of 26th February 2024 is 1.75.0.

## Helpful resources

* [Integration with Windows Photo Gallery and Windows Explorer](https://docs.microsoft.com/en-us/windows/win32/wic/-wic-integrationregentries)
* [Using Kind Names](https://docs.microsoft.com/en-us/windows/win32/properties/building-property-handlers-user-friendly-kind-names)

## Inspired by

* [Intercom thumbnail provider example](https://github.com/Rantanen/intercom/tree/88d6a3c0470150805740b75ed23ec15131ec7469/samples/thumbnail_provider)
* [FlifWICCodec](https://github.com/peirick/FlifWICCodec/)
* [flif_windows_plugin](https://github.com/fherzog2/flif_windows_plugin/)
* [jpegxl-wic](https://github.com/mirillis/jpegxl-wic)
