if status is-interactive
  # Commands to run in interactive sessions can go here
end

function wezsetcwd --on-event fish_prompt
  which wezterm 1>/dev/null 2>/dev/null && wezterm set-working-directory
end

function fish_rm_path --argument path
    set path (path resolve $path)
    set path_index (contains -i $path $fish_user_paths)

    if test $status -ne 0
        echo $path not in fish_user_paths
        return 1
    end

    echo Removing $path at index $path_index from fish_user_paths

    set -e fish_user_paths[$path_index]
end

alias l "ls -lah"

# Set up fzf key bindings
fzf --fish | source
