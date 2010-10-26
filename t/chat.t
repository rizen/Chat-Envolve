use Test::More tests => 7;
use lib '../lib';
use DateTime;

use_ok( 'Chat::Envolve' );


my $chat = Chat::Envolve->new(api_key => '1111-abcdefghijklmnopqrstuvwxyz', client_ip => '127.0.0.1');

isa_ok($chat, 'Chat::Envolve');

is($chat->api_key, '1111-abcdefghijklmnopqrstuvwxyz', 'set api key');
is($chat->site_id, 1111, 'set site id');
is($chat->secret, 'abcdefghijklmnopqrstuvwxyz', 'set secret');

is($chat->sign_command_string('test'), '02e0f11ef9e2286babbe1c7e112cf5acd9ad5a47;test', 'signature works');

my $now = DateTime->now;
my $date = $now->year.';'.($now->month - 1).';'.$now->day;
is($chat->generate_command_string('test', foo=>'bar'), '127.0.0.1;'.$date.';v=0.1,c=test,foo=YmFy==', 'generate command string works');


