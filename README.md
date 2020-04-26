# homebrew-tidy

Find and remove potentially unwanted homebrew formulae.

## What is this?

This is an [external command](https://docs.brew.sh/External-Commands) for
[Homebrew](https://brew.sh/) that provides a new command: `tidy`. It will check
your installed formulae for anything that does not appear to be used by
anything, and ask if you would like to uninstall it. **Nothing will be
uninstalled until a final prompt at the end.** Many formulae have a laundry list
of dependencies, so `tidy` will repeat the process until it no longer detects
unused formulae. You will then receive the final prompt with the list of
formulae being uninstalled.

This similar in nature to
[beeftornado/homebrew-rmtree](https://github.com/beeftornado/homebrew-rmtree),
except it will prompt for each of the transitive dependencies to ensure nothing
is being uninstalled that you may want to keep.

## Un/Installation

Tap this repository to install the command:
```
$ brew tap jrweldon/tidy
```

Untap this repository to remove the command:
```
$ brew untap jrweldon/tidy
```

## Examples

**Example 1:**
I want to uninstall `vim`, which reveals `lua`, `python`, and `ruby` as no
longer being used by any formulae. I want to keep `python` and `ruby`, so I
answer **n**o, but answer **y**es to get rid of `lua`. It then detects that
`unzip` is a candidate, which I want to keep, so I answer **n**o.

```
$ brew tidy
Checking for formulae that might be able to be removed...

8 formulae are currently not used by anything:
git kind shellcheck vim xclip zsh zsh-completions golangci/tap/golangci-lint 
Uninstall git? [y/n] n
Uninstall kind? [y/n] n
Uninstall shellcheck? [y/n] n
Uninstall vim? [y/n] y
Uninstall xclip? [y/n] n
Uninstall zsh? [y/n] n
Uninstall zsh-completions? [y/n] n
Uninstall golangci/tap/golangci-lint? [y/n] n
Finished round of formulae. Checking for any new candidates...

3 formulae are currently not used by anything:
lua python ruby 
Uninstall lua? [y/n] y
Uninstall python? [y/n] n
Uninstall ruby? [y/n] n
Finished round of formulae. Checking for any new candidates...

1 formulae are currently not used by anything:
unzip 
Uninstall unzip? [y/n] n
Finished round of formulae. Checking for any new candidates...
No more candidates.

2 formulae will be uninstalled:
vim lua 
Are you absolutely certain you want to proceed? (enter option number)
1) Yes
2) No
#? 1
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/vim/8.2.0600... (1,888 files, 36.7MB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/lua/5.3.5_2... (28 files, 1.7MB)

```

**Example 2:**
I notice `xclip` is installed and I no longer want it, so I answer **y**es. That
begins a chain reaction of also uninstalling its dependencies. I proceed to
answer **y**es to all of the transitive dependencies, as I didn't want any of
them.

```
$ brew tidy
Checking for formulae that might be able to be removed...

7 formulae are currently not used by anything:
git kind shellcheck xclip zsh zsh-completions golangci/tap/golangci-lint 
Uninstall git? [y/n] n
Uninstall kind? [y/n] n
Uninstall shellcheck? [y/n] n
Uninstall xclip? [y/n] y
Uninstall zsh? [y/n] n
Uninstall zsh-completions? [y/n] n
Uninstall golangci/tap/golangci-lint? [y/n] n
Finished round of formulae. Checking for any new candidates...

1 formulae are currently not used by anything:
linuxbrew/xorg/xorg 
Uninstall linuxbrew/xorg/xorg? [y/n] y
Finished round of formulae. Checking for any new candidates...

21 formulae are currently not used by anything:
linuxbrew/xorg/libdmx linuxbrew/xorg/libfs linuxbrew/xorg/libpciaccess linuxbrew/xorg/libxaw linuxbrew/xorg/libxaw3d linuxbrew/xorg/libxcomposite linuxbrew/xorg/libxcursor linuxbrew/xorg/libxdamage linuxbrew/xorg/libxfont linuxbrew/xorg/libxft linuxbrew/xorg/libxinerama linuxbrew/xorg/libxkbfile linuxbrew/xorg/libxrandr linuxbrew/xorg/libxres linuxbrew/xorg/libxscrnsaver linuxbrew/xorg/libxshmfence linuxbrew/xorg/libxvmc linuxbrew/xorg/libxxf86dga linuxbrew/xorg/libxxf86vm linuxbrew/xorg/xdpyinfo linuxbrew/xorg/xtrans 
Uninstall linuxbrew/xorg/libdmx? [y/n] y
Uninstall linuxbrew/xorg/libfs? [y/n] y
Uninstall linuxbrew/xorg/libpciaccess? [y/n] y
Uninstall linuxbrew/xorg/libxaw? [y/n] y
Uninstall linuxbrew/xorg/libxaw3d? [y/n] y
Uninstall linuxbrew/xorg/libxcomposite? [y/n] y
Uninstall linuxbrew/xorg/libxcursor? [y/n] y
Uninstall linuxbrew/xorg/libxdamage? [y/n] y
Uninstall linuxbrew/xorg/libxfont? [y/n] y
Uninstall linuxbrew/xorg/libxft? [y/n] y
Uninstall linuxbrew/xorg/libxinerama? [y/n] y
Uninstall linuxbrew/xorg/libxkbfile? [y/n] y
Uninstall linuxbrew/xorg/libxrandr? [y/n] y
Uninstall linuxbrew/xorg/libxres? [y/n] y
Uninstall linuxbrew/xorg/libxscrnsaver? [y/n] y
Uninstall linuxbrew/xorg/libxshmfence? [y/n] y
Uninstall linuxbrew/xorg/libxvmc? [y/n] y
Uninstall linuxbrew/xorg/libxxf86dga? [y/n] y
Uninstall linuxbrew/xorg/libxxf86vm? [y/n] y
Uninstall linuxbrew/xorg/xdpyinfo? [y/n] y
Uninstall linuxbrew/xorg/xtrans? [y/n] y
Finished round of formulae. Checking for any new candidates...

7 formulae are currently not used by anything:
fontconfig linuxbrew/xorg/libfontenc linuxbrew/xorg/libxmu linuxbrew/xorg/libxpm linuxbrew/xorg/libxrender linuxbrew/xorg/libxtst linuxbrew/xorg/libxv 
Uninstall fontconfig? [y/n] y
Uninstall linuxbrew/xorg/libfontenc? [y/n] y
Uninstall linuxbrew/xorg/libxmu? [y/n] y
Uninstall linuxbrew/xorg/libxpm? [y/n] y
Uninstall linuxbrew/xorg/libxrender? [y/n] y
Uninstall linuxbrew/xorg/libxtst? [y/n] y
Uninstall linuxbrew/xorg/libxv? [y/n] y
Finished round of formulae. Checking for any new candidates...

4 formulae are currently not used by anything:
freetype util-linux linuxbrew/xorg/libxi linuxbrew/xorg/libxt 
Uninstall freetype? [y/n] y
Uninstall util-linux? [y/n] y
Uninstall linuxbrew/xorg/libxi? [y/n] y
Uninstall linuxbrew/xorg/libxt? [y/n] y
Finished round of formulae. Checking for any new candidates...

4 formulae are currently not used by anything:
libpng linuxbrew/xorg/libsm linuxbrew/xorg/libxext linuxbrew/xorg/libxfixes 
Uninstall libpng? [y/n] y
Uninstall linuxbrew/xorg/libsm? [y/n] y
Uninstall linuxbrew/xorg/libxext? [y/n] y
Uninstall linuxbrew/xorg/libxfixes? [y/n] y
Finished round of formulae. Checking for any new candidates...

2 formulae are currently not used by anything:
linuxbrew/xorg/libice linuxbrew/xorg/libx11 
Uninstall linuxbrew/xorg/libice? [y/n] y
Uninstall linuxbrew/xorg/libx11? [y/n] y
Finished round of formulae. Checking for any new candidates...

1 formulae are currently not used by anything:
linuxbrew/xorg/libxcb 
Uninstall linuxbrew/xorg/libxcb? [y/n] y
Finished round of formulae. Checking for any new candidates...

3 formulae are currently not used by anything:
linuxbrew/xorg/libpthread-stubs linuxbrew/xorg/libxau linuxbrew/xorg/libxdmcp 
Uninstall linuxbrew/xorg/libpthread-stubs? [y/n] y
Uninstall linuxbrew/xorg/libxau? [y/n] y
Uninstall linuxbrew/xorg/libxdmcp? [y/n] y
Finished round of formulae. Checking for any new candidates...

1 formulae are currently not used by anything:
linuxbrew/xorg/xorgproto 
Uninstall linuxbrew/xorg/xorgproto? [y/n] y
Finished round of formulae. Checking for any new candidates...
No more candidates.

45 formulae will be uninstalled:
xclip linuxbrew/xorg/xorg linuxbrew/xorg/libdmx linuxbrew/xorg/libfs linuxbrew/xorg/libpciaccess linuxbrew/xorg/libxaw linuxbrew/xorg/libxaw3d linuxbrew/xorg/libxcomposite linuxbrew/xorg/libxcursor linuxbrew/xorg/libxdamage linuxbrew/xorg/libxfont linuxbrew/xorg/libxft linuxbrew/xorg/libxinerama linuxbrew/xorg/libxkbfile linuxbrew/xorg/libxrandr linuxbrew/xorg/libxres linuxbrew/xorg/libxscrnsaver linuxbrew/xorg/libxshmfence linuxbrew/xorg/libxvmc linuxbrew/xorg/libxxf86dga linuxbrew/xorg/libxxf86vm linuxbrew/xorg/xdpyinfo linuxbrew/xorg/xtrans fontconfig linuxbrew/xorg/libfontenc linuxbrew/xorg/libxmu linuxbrew/xorg/libxpm linuxbrew/xorg/libxrender linuxbrew/xorg/libxtst linuxbrew/xorg/libxv freetype util-linux linuxbrew/xorg/libxi linuxbrew/xorg/libxt libpng linuxbrew/xorg/libsm linuxbrew/xorg/libxext linuxbrew/xorg/libxfixes linuxbrew/xorg/libice linuxbrew/xorg/libx11 linuxbrew/xorg/libxcb linuxbrew/xorg/libpthread-stubs linuxbrew/xorg/libxau linuxbrew/xorg/libxdmcp linuxbrew/xorg/xorgproto 
Are you absolutely certain you want to proceed? (enter option number)
1) Yes
2) No
#? 1
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/xclip/0.13_1... (11 files, 152.3KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/xorg/20170115_1... (3 files, 17.8KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libdmx/1.1.4... (27 files, 146.6KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libfs/1.0.8... (11 files, 170.5KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libpciaccess/0.16... (11 files, 200.7KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libxaw/1.0.13... (87 files, 1.2MB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libxaw3d/1.6.3... (85 files, 883.5KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libxcomposite/0.4.5... (23 files, 101.3KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libxcursor/1.2.0... (43 files, 160KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libxdamage/1.1.5... (12 files, 70.9KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libxfont/1.5.4... (25 files, 489.0KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libxft/2.3.3... (14 files, 230.9KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libxinerama/1.1.4... (16 files, 98.2KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libxkbfile/1.1.0... (15 files, 270.5KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libxrandr/1.5.2... (26 files, 182.4KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libxres/1.2.0... (17 files, 98.5KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libxscrnsaver/1.2.3... (22 files, 110.5KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libxshmfence/1.3... (10 files, 57KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libxvmc/1.0.12... (16 files, 172.7KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libxxf86dga/1.1.5... (32 files, 126.3KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libxxf86vm/1.1.4... (32 files, 111.8KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/xdpyinfo/1.3.2... (6 files, 92.3KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/xtrans/1.4.0... (15 files, 316.1KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/fontconfig/2.13.1_1... (535 files, 3.7MB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libfontenc/1.1.4... (10 files, 102KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libxmu/1.1.3... (36 files, 304.2KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libxpm/3.5.12... (15 files, 214KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libxrender/0.9.10... (12 files, 144.0KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libxtst/1.2.3... (22 files, 134.1KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libxv/1.0.11... (37 files, 168.6KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/freetype/2.10.1... (63 files, 2.6MB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/util-linux/2.35.1... (386 files, 18.7MB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libxi/1.7.10... (84 files, 576.5KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libxt/1.2.0... (310 files, 1.3MB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libpng/1.6.37... (29 files, 1.4MB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libsm/1.2.3... (13 files, 149KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libxext/1.3.4... (87 files, 369KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libxfixes/5.0.3... (12 files, 108.9KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libice/1.0.10... (16 files, 248.0KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libx11/1.6.9... (1,055 files, 5.8MB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libxcb/1.13.1... (2,425 files, 5.5MB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libpthread-stubs/0.4... (5 files, 22.0KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libxau/1.0.9... (21 files, 127.4KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/libxdmcp/1.1.3... (11 files, 105.6KB)
Uninstalling /home/linuxbrew/.linuxbrew/Cellar/xorgproto/2019.2... (227 files, 3.9MB)
```