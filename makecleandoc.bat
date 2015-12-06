setlocal EnableExtensions EnableDelayedExpansion

rmdir /s /q dlang_html
mkdir dlang_html
mkdir dlang_html\spec
mkdir dlang_html\changelog
mkdir dlang_html\css

del /f /q article.html
make -f win32.mak

echo ^<html^> ^<head^> ^<style type="text/css"^> a { display:inline-block; width:200px; } ^</style^> ^<body^> >> filelist.html

for %%f in (*.html) do (
    echo %%~nf
    echo ^<a href="%%f"^>%%~nf^</a^> >> filelist.html
)

echo ^</body^>^</html^> >> filelist.html

copy *.html dlang_html
copy spec\*.html dlang_html\spec
copy changelog\*.html dlang_html\changelog
copy css\style.css dlang_html\css




