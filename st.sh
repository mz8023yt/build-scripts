#!/bin/sh

svn st | grep -E "[AMD\!] " | grep -v "linux/sdk/root-fs/" | grep -v "linux/framework/wirelesstools/"
