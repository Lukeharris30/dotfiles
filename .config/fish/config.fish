# PATH setup — runs for every shell, BEFORE the interactive block below
# so the zellij auto-launch can find binaries in ~/.local/bin.
# fish does not read ~/.profile / ~/.bash_profile, so user bin dirs
# must be added here explicitly.
set -gx VOLTA_HOME "$HOME/.volta"
fish_add_path $VOLTA_HOME/bin $HOME/.local/bin $HOME/bin

if status is-interactive
    # Commands to run in interactive sessions can go here

    # Dotfiles bare repo alias
    alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

    # Auto-launch zellij, but only when not already inside a session.
    # The ZELLIJ guard prevents recursive nesting when zellij spawns
    # new fish panes/tabs.
    if not set -q ZELLIJ
        zellij attach
    end
end
