#!/usr/bin/perl

use inc::Module::Install;

name		('RT-Client-Commandline');
author		('Jesse Vincent <jesse@bestpractical.com>');
abstract	('A command line interface for RT from Best Practical Solutions');
license		('perl');
version		('0.01');
install_script	('bin/rt');

requires(
	Text::ParseWords => '0',
	HTTP::Request::Common => '0',
);
include('ExtUtils::AutoInstall');
auto_install();

WriteAll( sign => 1 );
