@echo off
chcp 65001
title Data Extractor GUI Builder

echo.
echo ========================================
echo   Data Security Extractor - GUI Builder
echo ========================================
echo.

echo [1/4] Building application...
pyinstaller --onefile --name DataExtractorGUI --add-data "config.json;." --add-data "app.ico;." --windowed data_extractor_gui.py

echo.
echo [2/4] Creating release directory...
if exist "DataExtractorGUI_Release" rmdir /s /q "DataExtractorGUI_Release"
mkdir "DataExtractorGUI_Release"

echo [3/4] Copying files...
if exist "dist\DataExtractorGUI.exe" (
    copy "dist\DataExtractorGUI.exe" "DataExtractorGUI_Release\"
) else (
    echo ERROR: Executable not found in dist folder!
    goto :error
)

if exist "config.json" (
    copy "config.json" "DataExtractorGUI_Release\"
)

if exist "app.ico" (
    copy "app.ico" "DataExtractorGUI_Release\"
)

echo.
echo ========================================
echo   BUILD COMPLETED SUCCESSFULLY!
echo ========================================
echo.
echo Output: DataExtractorGUI_Release folder
echo.
echo Important: Make sure app.ico and config.json are in the same folder as the exe!
echo.
pause
exit

:error
echo.
echo ========================================
echo   BUILD FAILED!
echo ========================================
echo.
pause