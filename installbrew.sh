# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    installbrew.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tel-mouh <tel-mouh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/23 15:22:15 by tel-mouh          #+#    #+#              #
#    Updated: 2022/06/09 03:56:43 by tel-mouh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

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
	mkdir ~/goinfre/homebrew > /dev/null 2>&1
	curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C ~/goinfre/homebrew
fi
PATH="$HOME/goinfre/homebrew/bin:$PATH"
exec zsh
brew tap LouisBrunner/valgrind
brew install --HEAD LouisBrunner/valgrind/valgrind