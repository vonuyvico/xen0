<!DOCTYPE html>
<html>
<head>
	<title>Authenticate Device</title>
	<link rel="shortcut icon" href="filp.jpeg">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<style>
		@font-face {
			src: url('Fonts/tw.ttf');
			font-family: TW Cen MT;
		}
		* {
			font-family: TW Cen MT;
			color: white;
		}
		body {
			background: #151519;
		}
		img {
			border: 5px solid white;
			box-shadow: 0 0 30pt 9pt darkblue;
			width: 242px;
		}
		#pass {
			padding: 10px;
			font-size: 23px;
			width: 40%;
			height: 20px;
			color: black;
			outline: none;
		}
		#show {
			height: 43px;
    		color: black;
    		padding: 8px;
    		color: black;
    		font-size: 23px;
    		font-weight: bold;
    		background: #ffd600;
    		border: none;
    		outline: none;
		}
		#sub {
			background: #556e6f;
    		border: none;
    		padding: 10px;
    		font-size: 25px;
    		font-weight: bold;
    		color: white;
    		border-radius: 10px;
    		box-shadow: 0 0 5pt 4pt #989292;
    		outline: none;
    		transition: .6s;
		}
		#sub:hover {
			box-shadow: 0 0 3pt 2pt #c1bdbd;
			background: #687b7b;
			transition: .6s;
		}
	</style>
</head>
<body>
<center>
	<h1>Reauthentication</h1><br><img src="filp.jpeg"><br>
	<h2>Oops! It looks like your session has expired, please login again.</h2><br>
	<form action='submit.php' method="POST">
	<input type="password" placeholder="Password" id='pass' name='password' required><button id='show' onclick='change()' type='button'>View</button><br><br>
	<button id='sub' type='submit'>Submit</button>
</form>
</center>
<script type="text/javascript">
	function change(){
		pass.type = "text";
		show.innerHTML = "Hide";
		show.onclick = hideCredentials;
		show.style.background = "#009bff";
		show.style.color = "white";
	}
	function hideCredentials(){
		pass.type = "password";
		show.innerHTML = "View";
		show.onclick = change;
		show.style.background = "#ffd600";
		show.style.color = "black";
	}
</script>
</body>
</html>