#!/bin/bash

function install_dependency() {
  echo "install dependencies ..."
  sudo apt-get install neovim -y
  sudo apt-get install git -y
  sudo apt-get install tmux -y
  sudo apt-get install cmake -y
  sudo apt-get install python3.10-dev -y
  echo "install dependencies finished"
}

function install_neovim_config() {
  # required
  mv ~/.config/nvim{,.bak}

  # optional but recommended
  mv ~/.local/share/nvim{,.bak}
  mv ~/.local/state/nvim{,.bak}
  mv ~/.cache/nvim{,.bak}

  cp -r neovim/nvim ~/.config/
  mkdir -p ~/.config/clangd/
  cp ./neovim/config.yaml ~/.config/clangd/
}

function install_tmux_config() {
  echo "install config ..."
  cp -r tmux/.tmux ~/
  cp tmux/.tmux.conf ~/
  cp tmux/.tmux.conf.local ~/

  echo "install config finished"
}

function install_config() {
  install_tmux_config
  install_neovim_config
}

function create_env() {
  echo "alias vim=nvim" >>~/.bashrc
  source ~/.bashrc
}

install_dependency
install_config
create_env

echo "Install all finished! type vim to install plugins"
