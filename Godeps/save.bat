set TEMP_DIR=D:\temp
if not exist %TEMP_DIR% ( mkdir %TEMP_DIR% )
if not exist %TEMP_DIR%\src (
    gen.bat
    move /y src %TEMP_DIR%\src
)
set CURDIR=%~dp0
set BASEDIR=%~dp0
set BASEDIR=%BASEDIR:\src\github.com\fananchong\go-discovery\Godeps\=\%
set GOPATH=%BASEDIR%;D:\temp
copy /y Godeps.json.template Godeps.json
cd %CURDIR%\..
if exist vendor ( rd /q /s vendor )
godep.exe update
godep.exe save ./...
cd %CURDIR%
pause