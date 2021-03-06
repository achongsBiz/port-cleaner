@ECHO OFF

REM Prompt for port number
SET /P port=Enter Port Number:
echo %port%

REM Loop through netstat results, parse out last column
FOR /F "tokens=5" %%T IN('netstat -ano ^| findstr %port%') DO (
    SET /A processID=%%T
)

REM Terminate process
echo Process ID to stop=%processID%
taskkill /f /pid %processID%
PAUSE