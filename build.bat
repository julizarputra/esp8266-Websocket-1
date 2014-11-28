:: HOWTO USE:  build <folder> <comport ftdi>
:: example:    build at COM3
:: place the .bat file in your project folder with the pyton script
:: Tnx to the themadinventor https://github.com/themadinventor/esptool
:: full guide @ http://signusx.com/esp8266-windows-compilation-tutorial/
@echo off
echo hallooo %~dp0%1\firmware\0x00000.bin
if EXIST  %~dp0%1 (
    echo dir found
    if EXIST  %~dp0%1\firmware\ (
        echo dir firmware found, lets flash :D
        python esptool.py --port %2 write_flash 0x00000 %1\firmware\0x00000.bin 0x40000 %1\firmware\0x40000.bin
    ) else (
        echo I can't find the folder "firmware". Did you compile??
    )
) else (
   echo No project folder found :(
)
