use Test::More tests => 7;
use lib '../lib';
use DateTime;

use_ok( 'Chat::Envolve' );


my $chat = Chat::Envolve->new(api_key => '1111-abcdefghijklmnopqrstuvwxyz');

isa_ok($chat, 'Chat::Envolve');

is($chat->api_key, '1111-abcdefghijklmnopqrstuvwxyz', 'set api key');
is($chat->site_id, 1111, 'set site id');
is($chat->secret, 'abcdefghijklmnopqrstuvwxyz', 'set secret');

is($chat->sign_command_string('test'), '0b7b069585cfe50b2aab60a4f5869ed23ea7a832;test', 'signature works');
my $date = time() * 1000;
like($chat->generate_command_string('login', fn=>'JT'), qr/\d+;v=0.2,c=login,fn=SlQ=/, 'generate command string works');


