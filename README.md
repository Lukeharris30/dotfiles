# dotfiles

Personal configuration files for fish, zellij, ghostty, and neovim.

## Setup on a new machine

### 1. Clone the repo

```sh
git clone --bare https://github.com/Lukeharris30/dotfiles.git ~/.dotfiles
```

### 2. Check out the files

```sh
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
```

If git complains about existing files being overwritten, back them up and try again:

```sh
mkdir -p ~/.dotfiles-backup
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout 2>&1 \
  | grep "^\s" \
  | awk '{print $1}' \
  | xargs -I{} mv ~/{} ~/.dotfiles-backup/{}
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
```

### 3. Pull the neovim config

```sh
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME submodule update --init
```

### 4. Hide untracked files

```sh
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config status.showUntrackedFiles no
```

### 5. Add the dotfiles alias to fish

Add this to `~/.config/fish/config.fish` inside the `if status is-interactive` block if it isn't already there (it will be after step 2):

```fish
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Restart your shell and the `dotfiles` alias will be available.

## Day-to-day usage

Track a new config file:

```sh
dotfiles add ~/.config/ghostty/config.ghostty
dotfiles commit -m "add ghostty config"
dotfiles push
```

Update a tracked file after editing it:

```sh
dotfiles add ~/.config/zellij/config.kdl
dotfiles commit -m "update zellij keybinds"
dotfiles push
```

Check what's tracked and what has changed:

```sh
dotfiles status
dotfiles diff
```

## What's tracked

| File | Description |
|------|-------------|
| `.config/fish/config.fish` | Fish shell config — PATH, aliases, zellij auto-launch |
| `.config/zellij/config.kdl` | Zellij keybinds and settings |
| `.config/ghostty/config.ghostty` | Ghostty terminal config |
| `.config/nvim/` | Neovim config (submodule → [Lukeharris30/nvim](https://github.com/Lukeharris30/nvim)) |
