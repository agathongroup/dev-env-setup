#!/bin/sh

# Check the shell type being used
SHELL_TYPE="$SHELL"

# Set configuration variables based on type of shell used (bash vs zsh)
if [ $SHELL_TYPE == '/bin/zsh' ]
then
  PROFILE=".zprofile"
  SOURCE_FILE=".zshrc"
else
  PROFILE=".bash_profile"
  SOURCE_FILE=".bashrc"
fi

RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
MAGENTA="\033[35m"
CYAN="\033[36m"
LIGHTGRAY="\033[37m"
DEFAULT="\033[0;39m"

printf "\n${LIGHTGRAY}==============================================================================
Welcome to Agathon! Setting up your computer...
==============================================================================${DEFAULT}\n"

# Create configuration files if they don't already exist
eval "touch ~/$SOURCE_FILE ~/$PROFILE"
eval "echo [ -r ~/$SOURCE_FILE ] && . ~/$SOURCE_FILE > ~/$PROFILE"
eval "chmod 600 ~/{$SOURCE_FILE,$PROFILE}"

# Install XCode Command Line Tools
printf "\n${BLUE}Installing XCode Command Line Tools...${DEFAULT}\n"
eval "xcode-select --install"

# Install Homebrew for macOS package management
printf "\n${YELLOW}Installing Homebrew for macOS package management...${DEFAULT}\n"
eval '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'

# Install NVM for Node.js version management
printf "\n${GREEN}Installing NVM for Node.js version management...${DEFAULT}\n"
eval "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash"
eval "nvm install node --lts"
eval "nvm alias default node"

# Install Yarn for Node.js dependency management
printf "\n${CYAN}Installing Yarn for Node.js dependency management...${DEFAULT}\n"
eval "brew install yarn --ignore-dependencies"

# Install Composer for PHP dependency management
printf "\n${MAGENTA}Installing Composer for PHP dependency management...${DEFAULT}\n"
eval "brew install composer"

# Install rbenv for Ruby version management. This also installs `ruby-build`.
printf "\n${RED}Installing rbenv for Ruby version management...${DEFAULT}\n"
eval "brew install rbenv"

# Install VirtualBox for running virtual machines
printf "\n${BLUE}Installing VirtualBox for running virtual machines...${DEFAULT}\n"
eval "brew cask install virtualbox"

# Install Vagrant for virtual environment management
printf "\n${CYAN}Installing Vagrant for virtual environment management...${DEFAULT}\n"
eval "brew cask install vagrant"

# Follow the instructions on GitHub to generate a new SSH key and add it to your GitHub account.
printf "\n${LIGHTGRAY}==============================================================================
${GREEN}You're all set!
${LIGHTGRAY}Lastly, follow the instructions in the links below to generate a new SSH key and then add the key to your GitHub account.
${YELLOW}https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#generating-a-new-ssh-key
${YELLOW}https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account
${LIGHTGRAY}Opening links above now...
==============================================================================${DEFAULT}\n"

eval "open https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#generating-a-new-ssh-key"
eval "open https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account"