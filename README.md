# cruzviz-vim

I use MacVim for web development (HTML/CSS/JavaScript) and Python coding. This is the .vimrc file I use to make it pretty and more IDE-like.

I'm really not a wizard with Vim and vi commands, I slowly learn new shortcuts here and there, and am nowhere near using them all. I still use all the standard Mac system commands like Command-z, Command-c, and Command-v for undo, copy, and paste inside Vim. This README documents what I do know and try to use. I am sharing the vimrc and this README for two reasons: 1) in case it helps anybody else, especially beginners, and 2) for my future self, because I forget how to do anything in vim if I stop using it for a few months, and I will surely have to install it on a new machine someday, which I need to remember how to do.

## Getting started with Vim - the super basic basics
Vim has 3 main "modes" - NORMAL, INSERT, and VISUAL.

1) When you first open Vim, it is in NORMAL mode, with a fat cursor that covers a whole character space. This is actually a command mode where you can skip your cursor around easily, save (write) the file, and generally perform various tricks. Hit `<esc>` (the Escape key) to enter NORMAL mode from any other mode, or to cancel any partially constructed NORMAL mode command.

2) INSERT mode is what some of us might consider "normal" word processing mode: there is a skinny cursor in between subsequent character spaces, and you type on the keyboard to add text to the file. From NORMAL mode, you can enter INSERT mode by typing `i` (insert) to place the skinny cursor just to the left of the NORMAL fat cursor, or `a` (append) to place the skinny cursor to the right.

3) VISUAL mode is for selecting text. From NORMAL mode, type `v` (visual) to enter VISUAL mode, with your current location as the starting point. Once you hit `v` and start moving the cursor around, you are highlighting everything in between the starting point and the cursor.

## Initial set-up
* Install a nice modern graphical version of vim. gVim for Windows, MacVim for Mac. I use MacVim.
  * `mvim {new filename}` entered at a terminal window opens a new file inside MacVim. `mvim .vimrc` from the directory containing .vimrc will open the .vimrc file inside MacVim.
* I set the font vim uses to be [Hack](http://sourcefoundry.org/hack/), so that font needs to be installed on your system beforehand.
* Install all the Vundle plug-ins by typing `:PluginInstall<return>` in NORMAL mode (from inside the open .vimrc file).
* Install any popular linters you might need for the type of coding you do (such as `pylint` for Python) and make sure they are accessible (i.e. in your $PATH). [Syntastic](https://github.com/scrooloose/syntastic) does syntax checking using external system-installed linters. Read the FAQ at the Syntastic GitHub site if you're having problems. If everything is working correctly, you should see some errors appear when you save (`:w`) a code file with improper syntax - for example, saving a *.py file which has some PEP8 violations - which then disappear after you fix the errors and re-save.
* Make sure the .vimrc file resides in your home directory, otherwise it won't be used. This is usually the default directory when you open a new terminal. On my MacBook, it's the directory `/Users/<myusername>`, which contains Applications, Desktop, and Documents, among others. This directory isn't actually accessible through the Finder, you need to use a terminal, xterm or command prompt of some kind to get here.

# CHEAT SHEET (stuff I actually use)

##NORMAL mode:

1) File commands: `:w` to save/write the file and find syntax errors; `:wq` to save and then quit (close the window), `:q!` to quit without saving changes. These only apply to the current window, not to all open files inside Vim.

2) `/{stuff}` searches the file for all instances of `{stuff}` and highlights them all. Once that is done, you can type `N` or `n` to jump around all these instances (backwards and forwards, respectively). To turn the highlighting off again, type `\ ` - that's <backslash><spacebar>.

2) Jumping around:
  * `$` jumps to end of line, `0` jumps to beginning of line
  * `W`/`w` jumps to next word, `B`/`b` jumps to previous word
  * `{line number}G` jumps to a specific line number, or `G` by itself goes to end of file

4) Delete a whole line with `dd` or delete {x} lines with `d{x}<c-r>`

##VISUAL mode:

1) To de-indent or indent highlighted lines, `<` or `>` respectively.

2) Use all the jumping around commands from NORMAL mode to quickly highlight what you need

3) You can access the system clipboard for cutting, copying, or pasting-over using the usual Command-x, Command-c, Command-v (on a Mac). To paste in a brand new chunk of text rather than overwriting existing text, it is better to enter INSERT mode to get the cursor placed correctly and then use Command-V.

##EMMET

Emmet (aka Zen Coding) is a system for writing cumbersome chunks of HTML very efficiently. Emmet shortcuts can be used in any file with a *.html extension.

See the [Emmet cheatsheet](http://docs.emmet.io/cheat-sheet/).

To implement inside Vim, write out the Emmet shortcut (i.e. `html:5>table>th>td*6^tr*5>td*6`) in INSERT mode. Then hit <esc>, the Escape key, to enter NORMAL mode. Make sure the cursor is covering the last character of your Emmet shortcut. Then hit <tab>, the Tab key. Done! If you don't like it, Command-z to undo it and try again.
