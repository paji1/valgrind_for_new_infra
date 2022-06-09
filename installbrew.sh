# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    installbrew.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tel-mouh <tel-mouh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/23 15:22:15 by tel-mouh          #+#    #+#              #
#    Updated: 2022/06/09 08:04:09 by tel-mouh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash


GREEN='\033[1;32m'
NC='\033[0m'

ls ~/goinfre/homebrew &> /dev/null
LS=$?

echo $PATH | egrep "(home)?brew" > /dev/null
GREP=$?

if [ $LS -eq 0 ] && [ $GREP -eq 0 ]
then
	echo "brew is already installed"
	exit 1
fi
if [ $GREP -ne 0 ]
then
	echo "export PATH=$HOME/goinfre/homebrew/bin:$PATH" >> ~/.zshrc
fi

if [ $LS -ne 0 ]
then
	printf "$GREEN instaling Brew ... $NC "
	mkdir ~/goinfre/homebrew > /dev/null 2>&1
	curl --silent -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C ~/goinfre/homebrew > /dev/null 2>&1
	if [ $? -ne 0 ]
	then
		printf " ----> X"
	else
		printf "$GREEN ----> √ $NC\n"
	fi
		
fi
export PATH="$HOME/goinfre/homebrew/bin:$PATH"
printf "$GREEN instaling Valgrind ... \n $NC take few minute$NC \n "
brew tap LouisBrunner/valgrind > /dev/null 2>&1
brew install --HEAD LouisBrunner/valgrind/valgrind
if [ $? -ne 0 ]
then
	printf " ----> X"
else
	printf "$GREEN valgrind installed successfully √$NC\n"
fi