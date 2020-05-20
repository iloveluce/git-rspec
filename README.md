# git-rspec
## Description
Hey you! Yea you! You just made a commit but you don't know which spec files where affected by it. This script will attempt to find all spec files that were affected by your committ change so that you can run rspec on those files.

## Installation
```curl https://raw.githubusercontent.com/lucianoiscool/git-rspec/master/git-rspec > git-rspec && chmod 700 git-rspec && sudo mv git-rspec /usr/local/bin```

## Usage

```sh 
git rspec -h
usage: git rspec [-h] [-d] [-v] [-c [commit-ish] | -n | -s | -u]

Run rspec files associated with a change in your repo

optional arguments:
  -h, --help        show this help message and exit
  -d, -dryrun       Only show the associated spec files (and do not run them)
  -v, -verbose      output more information about files
  -c [commit-ish]   A commit or range of commits (e.g. HEAD~2..HEAD) you would
                    like to analyze
  -n, -notcommited  Default: Use staged and unstaged file changes instead of a
                    commit
  -s, -staged       Using staged file changes instead of a commit
  -u, -unstaged     Using unstaged file changes instead of a commit
```
