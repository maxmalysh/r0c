#!/bin/bash
set -e

[ -e r0c/__main__.py ] || cd ..
[ -e r0c/__main__.py ] || cd ~/dev/r0c
[ -e r0c/__main__.py ] || exit 1

find -iname \*.pyc -delete
find -iname __pycache__ -delete

