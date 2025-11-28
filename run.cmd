@echo off
echo ===============================
echo   Starting KalaKriti Project...
echo ===============================

REM Activate virtual environment
call venv\Scripts\activate

REM Open your local web app in browser
start "" http://localhost:8000/app.html

REM Run the FastAPI server
uvicorn app:app --reload --port 8000

pause


venv\Scripts\activate
uvicorn app:app --reload --port 8000
