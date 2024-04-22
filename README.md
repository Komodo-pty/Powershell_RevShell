# Powershell_RevShell
Generate an encoded reverse shell for Powershell using a Linux system.

This isn't designed to bypass AntiVirus.

Depending on the context which this code is executed from, the reverse shell may be spawned as a 32-Bit process instead of a 64-bit process. The output shows optional syntax which *may* be able to spawn the shell as a 64-bit process, but it doesn't spawn shells as reliably as the default method. 

#Dependencies

Requires pwsh. See the following link for further details.

https://learn.microsoft.com/en-us/powershell/scripting/install/install-ubuntu?view=powershell-7.4
