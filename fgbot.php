<?php
$paramStr = base64_decode($argv[2]);
$message = json_decode($paramStr, true);

// :TODO: Message counter

// :TODO: Response for message count reach limit

$response = [];

$isFromSelf = $message['out'];
if (array_key_exists('text', $message)) {
    $text = $message['text'];
} else {
    $text = '';
}
$firstLetter = substr($text, 0, 1);
if ('/' == $firstLetter) {
    // :TODO: Recognize command and do the job
    $to = '';
}

$response = [
    'to' => $to,
    'message' => $message['from']['print_name'] . ': ' . $text,
];
echo json_encode($response);
