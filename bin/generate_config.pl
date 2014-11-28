#!/usr/bin/env perl
use strict;
use warnings;

use File::Spec;

my ( $database_url, $build_dir )  = @ARGV[1,2];

my ( $user, $pass, $host, $db, $port ) = $database_url =~ m{^postgres://([^:@/]+):([^:@/]+)@([^:@/]+):([^:@/]+)/([^:@/]+)$};
my $static_file_path = File::Spec->catdir( $build_dir, 'mt-static' );

print <<"__EOF__";
CGIPath /
StaticWebPath /mt-static
StaticFilePath $static_file_path

ObjectDriver DBI:postgres
DBHost $host
DBPort $port
Database $db
DBUser $user
DBPassword $pass

DefaultLanguage en_US
__EOF__
