# `r0c` telnet server

* retr0chat, irc-like chat service for superthin clients
* MIT-Licensed, 2018-01-07, ed @ irc.rizon.net
* https://github.com/9001/r0c

![screenshot of telnet connected to a r0c server](doc/r0c.png)


## summary

imagine being stuck on ancient gear, in the middle of nowhere, on a slow connection between machines that are even more archaic than the toaster you're trying to keep from falling apart

retr0chat is the lightweight, no-dependencies, runs-anywhere solution for when life gives you lemons

* tries to be irssi
* zero dependencies on python 2.6, 2.7, 3.x
* supports telnet, netcat, /dev/tcp clients
* fallbacks for inhumane conditions
  * linemode
  * no vt100 / ansi escape codes

## windows clients

* use [putty](https://the.earth.li/~sgtatham/putty/latest/w32/putty.exe) in telnet mode
* or [the powershell client](clients/powershell.ps1)
* or enable `Telnet Client` in control panel `->` programs `->` programs and features `->` turn windows features on or off, then press WIN+R and run `telnet r0c.int`

putty is the best option;
* windows-telnet has a bug (since win7) where unicode letters become unstable the more text you have on the screen (starts flickering and then disappear one by one)
* the powershell client wastes a LOT of data ~~(an entire kilobyte for each new message, totally unbelievable, who could possibly afford that)~~ because powershell's scrolling is glitchy af

## linux clients

most to least recommended

| client | example |
| :---   | :---    |
| telnet | `telnet r0c.int` |
| socat  | `socat -,raw,echo=0 tcp:r0c.int:531` |
| bash   | [mostly internals](clients/bash.sh) |
| netcat | `nc r0c.int 531` |

you can even `exec 147<>/dev/tcp/r0c.int/531;cat<&147 &while read -rN1 x;do printf '%s' "$x">&147;done` (disconnect using `exec 147<&-; killall cat #sorry`)

## documentation

not really but there is a [list of commands](doc/help-commands.md) and a [list of hotkeys](doc/help-hotkeys.md)
