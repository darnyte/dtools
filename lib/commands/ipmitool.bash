#! /bin/bash
# Distributed Tools - dtools - lib/commands/ipmi.bash
# Copyright (C) 2008 Andrés J. Díaz <ajdiaz@connectical.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

# The runner is callled from main dt script, and pass one argument (the
# first one) which contains the remote hostname, and probably a list of
# arguments for that command passed to dt on command line.
run ()
{
	local h="$(dt_host "$1")"
	local u="$(dt_user "$1")"
	shift

	req ipmitool || E=3 err $"cannot found required binary ipmitool"

	ipmitool -H "$h" -U "$u" "$@"
}

help "manage IPMI interface on remote hosts" \
"usage: ipmitool [args]+

This command uses ipmitool(1) to send IMPI commands to remote hosts.
The -dt:user option sets the user who connect to remote host, also the
-dt:pass option set the IMPI password to use.
"

