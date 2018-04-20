#!/bin/bash
set -e
files=(".vimrc" ".vim" ".tmux.conf" ".config/fish" ".config/base16-shell")

repo=`pwd`
dest="$HOME"

mkdir -p "$dest"/.config
mkdir -p "$dest"/dotfiles-old

for file in "${files[@]}"
do
    echo "$dest/$file -> $repo/$file"

    if [ -f "$dest/$file" ] || [ -d "$dest/$file" ]
    then
        mv "$dest/$file" "$dest/dotfiles-old/"
    fi

    ln -s "$repo/$file" "$dest/$file"
done

echo "done"

# ln -s $repo/Code/User ~/Library/Application\ Support/Code/User
