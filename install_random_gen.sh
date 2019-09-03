#!/bin/bash
clear
# Get Current working directory...
dir=$(pwd)
cd $dir
mkdir test
echo "installing random number generater in your linux."
echo "This directory ${dir} will be the installation location for the app"
#ask user to verify that the app will install in this directory...
read -p "please verify [yes], [no]:  " answer
echo "your answer: $answer"
if [ "$answer" = "yes" ];
then
    echo "Accepted!"
else
    echo "Rejected!"
    exit
fi
clear
echo "|o------|"
echo "updating and upgrading your system..."
$(apt-get update)
$(apt-get -y upgrade)
clear
echo "|oo-----|"
echo "installing necessary packages"
$(apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev)
clear
echo "|ooo----|"
echo "Getting python pyenv"
$(git clone https://github.com/pyenv/pyenv.git ~/.pyenv)
clear
#echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
#echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
#echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc
#exec "$SHELL"
clear
echo "|oooo---|"
echo "Installing python 3"
pyenv install 3.7.2
pyenv global 3.7.2
clear
echo "ooooo--|"
echo "Creating py Virtual Env"
python -m venv $dir/randomNum/env
