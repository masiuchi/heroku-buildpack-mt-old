#!/usr/bin/env perl
use strict;
use warnings;

use File::Spec;

my ( $database_url )  = $ARGV[0];

my ( $user, $pass, $host, $db, $port ) = $database_url =~ m{^postgres://([^:@/]+):([^:@/]+)@([^:@/]+):([^:@/]+)/([^:@/]+)$};

print <<"__EOF__";
CGIPath /
StaticWebPath /mt-static
StaticFilePath /app/www/mt-static

ObjectDriver DBI:postgres
DBHost $host
DBPort $port
Database $db
DBUser $user
DBPassword $pass

DefaultLanguage en_US
__EOF__
