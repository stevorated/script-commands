@echo off

:: Needs to be run as administrator.
:: Change the paths below to match the desired IDE.
:: Make sure you don't quote any of the paths in following lines, spaces are allowed.
SET LaunchPath=C:\Program Files\JetBrains\PhpStorm 2020.1.1\bin\phpstorm64.exe
SET IconPath=C:\Program Files\JetBrains\PhpStorm 2020.1.1\bin\phpstorm.ico
SET AppName=PhpStorm
 
echo Adding file entries
@reg add "HKEY_CLASSES_ROOT\*\shell\%AppName%" /t REG_SZ /v "" /d "Edit with %AppName%"   /f
@reg add "HKEY_CLASSES_ROOT\*\shell\%AppName%" /t REG_EXPAND_SZ /v "Icon" /d "%IconPath%,0" /f
@reg add "HKEY_CLASSES_ROOT\*\shell\%AppName%\command" /t REG_SZ /v "" /d "%LaunchPath% \"%%1\"" /f
 
echo Adding within a folder entries
@reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\%AppName%" /t REG_SZ /v "" /d "Open with %AppName%"   /f
@reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\%AppName%" /t REG_EXPAND_SZ /v "Icon" /d "%IconPath%,0" /f
@reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\%AppName%\command" /t REG_SZ /v "" /d "%LaunchPath% \"%%V\"" /f

echo Adding folder entries
@reg add "HKEY_CLASSES_ROOT\Directory\shell\%AppName%" /t REG_SZ /v "" /d "Open with %AppName%"   /f
@reg add "HKEY_CLASSES_ROOT\Directory\shell\%AppName%" /t REG_EXPAND_SZ /v "Icon" /d "%IconPath%,0" /f
@reg add "HKEY_CLASSES_ROOT\Directory\shell\%AppName%\command" /t REG_SZ /v "" /d "%LaunchPath% \"%%1\"" /f

pause