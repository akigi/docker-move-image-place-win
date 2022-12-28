@echo off

echo "Quit Docker DesktopからDockerを停止させ、"
echo "WSL上の「docker-desktop」および「docker-desktop-data」が停止していることを確認してください。"
wsl --list --verbose

set newdir="E:\mydocker\wsl"


mkdir "%newdir%\distro"
mkdir "%newdir%\data"

wsl --export docker-desktop "%newdir%\distro\docker-desktop.tar"
wsl --export docker-desktop-data "%newdir%\data\docker-desktop-data.tar"

wsl --unregister docker-desktop
wsl --unregister docker-desktop-data

wsl --import docker-desktop "%newdir%\distro" "%newdir%\distro\docker-desktop.tar"
wsl --import docker-desktop-data "%newdir%\data" "%newdir%\distro\docker-desktop-data.tar"

echo "完了しました。"
wsl --list --verbose
