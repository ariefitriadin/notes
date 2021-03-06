# Linux

_Table of Contents_

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
<!-- generated with [DocToc](https://github.com/thlorenz/doctoc) -->

- [Get your operating system information](#get-your-operating-system-information)
- [Get your hardware information](#get-your-hardware-information)
- [Remove the green background color from the directory listing](#remove-the-green-background-color-from-the-directory-listing)
- [Display line numbers in your cat output](#display-line-numbers-in-your-cat-output)
- [Print a file from line to line](#print-a-file-from-line-to-line)
- [Copy files from Linux to Windows](#copy-files-from-linux-to-windows)
- [Find all files containing a string](#find-all-files-containing-a-string)
- [List running processes](#list-running-processes)
- [Services commands](#services-commands)
- [CLI Tools](#cli-tools)
- [Validate shell scripts](#validate-shell-scripts)
- [Arch](#arch)
  - [Update the system](#update-the-system)
  - [Search for a package](#search-for-a-package)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Get your operating system information

```sh
cat /etc/os-release
# or
lsb_release -a
```

## Get your hardware information

```sh
lshw -short
```

## Remove the green background color from the directory listing

```sh
dircolors -p > ~/.dircolors
vim ~/.dircolors
# Remove ;41 ;42 ;43 ;44 from the lines beginning with
# SETUID, SETGID, CAPABILITY, STICKY_OTHER_WRITABLE, OTHER_WRITABLE and STICKY
vim ~/.bashrc
# Append the following line
eval 'dircolors ~/.dircolors' > /dev/null
```

- [Source](https://unix.stackexchange.com/questions/94498/what-causes-this-green-background-in-ls-output)

## Display line numbers in your cat output

```sh
cat -n <file-path>
```

## Print a file from line to line

```sh
sed -n 10,20p <file-path>
```

## Copy files from Linux to Windows

- Install `openssh-server` and `net-tools` on Linux

- Intall `Putty` on Windows (with [Chocolatey](https://chocolatey.org/packages/putty))

```sh
# Assuming 192.168.10.12 is your Linux IP address,
# write the following command in a shell on Windows:
pscp user@192.168.10.12:/source/path/on/linux/* c:\Destination\Path\On\Windows
```

## Find all files containing a string

```sh
grep -Rin "string" .
```

`R` = recursive

`i` = ignore case

`n` = show the line number and content

`.` = starting from the current directory

Use `l` instead of `n` to show the file name only.

## List running processes

```sh
ps aux | grep procName
pgrep -f procName
top
htop
```

## Services commands

```sh
# List running services
ls /etc/init.d

# Start/stop a service
sudo -u root bash
/etc/init.d/<my-service> start/stop
# if you don't find there, check
/var/spool/cron/*
# if not there, check:
/etc/monit.d/*
```

## CLI Tools

- [Witowski Favorite CLI Tools](https://switowski.com/blog/favorite-cli-tools)

## Validate shell scripts

- [ShellCheck](https://www.shellcheck.net/)

## Arch

### Update the system

```sh
sudo pacman -Syu
```

- `S` = Synchronize packages. Packages are installed directly from the remote repositories, including all dependencies required to run the packages
- `y` = Download a fresh copy of the master package database from the server(s) defined in pacman.conf
- `u` = Upgrades all packages that are out-of-date

### Search for a package

To search for example for _OpenJDK_, run:

```sh
sudo pacman -Ss OpenJDK
```

- `S` = Synchronize packages. Packages are installed directly from the remote repositories, including all dependencies required to run the packages
- `s` = Search each package in the sync databases for names or descriptions that match regexp

### Install Java through SDKMAN on Arch

```
sudo pacman -S which unzip zip
```

source "/root/.sdkman/bin/sdkman-init.sh"
