{ config, pkgs, ...}:
let 
  aliases = {
    c = "bat";
    ll = "ls -l";
    la = "ls -a";
    lla = "ls -a -l";
    ".." = "cd ..";
    "nfu" = "nix flake update --flake ~/.nix --extra-experimental-features flakes";
    "hms" = "home-manager switch --flake ~/.nix --extra-experimental-features flakes";
  };
in 
{
  programs = {
    bash = {
      enable = true;
      shellAliases = aliases;
    };
    git = {
      enable = true;
      userEmail = "99330393+Captain7O9@users.noreply.github.com";
      userName = "Captain7O9";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
    vscode = {
      enable = true;
      userSettings = {
        "workbench.iconTheme"= "material-icon-theme";
        "editor.cursorSmoothCaretAnimation"= "on";
        "editor.formatOnSave"= true;
        "editor.indentSize"= "tabSize";
        "editor.tabSize"= 2;
        "editor.defaultFormatter"= "esbenp.prettier-vscode";
        "[nix]"= {
          "editor.tabSize"= 2;
        };
        "github.copilot.enable"= {
          "*"= false;
          "plaintext"= false;
          "markdown"= false;
          "scminput"= false;
        };
        "window.zoomLevel" = 2.5;
        "editor.fontFamily"= "'JetBrainsMono NF', 'monospace', monospace";
        "editor.fontLigatures"= true;
      };
      keybindings = [
          {
            key = "ctrl+shift+alt+a";
            command = "workbench.panel.chatEditing";
            when = "workbench.panel.chat.view.edits.active";
          }
          {
            key = "ctrl+shift+alt+i";
            command = "-workbench.panel.chatEditing";
            when = "workbench.panel.chat.view.edits.active";
          }
          {
            key = "ctrl+shift+alt+o";
            command = "github.copilot.completions.disable";
          }
      ];
    };
  };
}