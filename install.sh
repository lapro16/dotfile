#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"
repo_dir="$PWD"

backup_dir="$(mktemp -d "$HOME/dotfiles-backup.XXXXXX")"

for file in bash_aliases tmux.conf bashrc profile gitconfig; do
    target="$HOME/.$file"

    if [[ -e "$target" || -L "$target" ]]; then
        mv -- "$target" "$backup_dir/"
    fi

    ln -s -- "$repo_dir/$file" "$target"
done

echo "Настройки подключены"
echo "Прежние файлы сохранены в: $backup_dir"

