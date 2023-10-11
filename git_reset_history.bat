echo | set /p ="git remote add origin " >  seturl.bat
git remote get-url --push origin        >> seturl.bat
echo.                                   >> seturl.bat
echo | set /p ="git config user.email " >> seturl.bat
git config user.email                   >> seturl.bat
echo.                                   >> seturl.bat
echo | set /p ="git config user.name "  >> seturl.bat
git git config user.name                >> seturl.bat
echo.                                   >> seturl.bat

rem Clear history on a all branch
rm -rf .git
git init
git config core.autocrlf false
git config gui.encoding utf-8
git config core.ignorecase false
call seturl.bat
git add .
git commit -m "Initial commit"
call seturl.bat
rm -f seturl.bat
git push -u --force origin master

rem REMEMBER TO DELETE ANY TAG BECAUSE TAG KEEP ITS OWN HISTORY COMMIT
git ls-remote --tags origin
git push --delete origin tagname
git tag --delete tagname
