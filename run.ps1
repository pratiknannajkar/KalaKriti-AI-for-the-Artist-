# Project-local launcher (convenience)
# Usage: from project folder run: .\run.ps1

# If the parent helper exists, delegate to it (keeps single source of truth)
$parent = Join-Path $PSScriptRoot '..\run.ps1'
if (Test-Path $parent) {
    Write-Host "Delegating to parent run.ps1 at: $parent"
    & $parent
    return
}

Write-Host "No parent run.ps1 found — activating .venv and starting app locally"

if (-Not (Test-Path '.venv')) {
    Write-Host ".venv not found in project. Create it with: python -m venv .venv"
    exit 1
}

# Activate venv for this session
. .\.venv\Scripts\Activate.ps1

# Ensure BASE_URL points to local server for QR links
$env:BASE_URL = "http://127.0.0.1:8000"

# Start uvicorn
uvicorn app:app --reload --host 127.0.0.1 --port 8000
