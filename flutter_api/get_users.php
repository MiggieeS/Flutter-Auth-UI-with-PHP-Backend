<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");

// Handle preflight request
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

include 'db_config.php'; // Include database configuration

$sql = "SELECT * FROM users";
$result = $conn -> query($sql); 

$users = [] ; 

while ($row = $result -> fetch_assoc()){ // Fetch each user as an associative array
    $users[] = $row; // Add user to the users array
}

echo json_encode($users); // Output users as JSON

?>
