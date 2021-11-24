param(
    # mail importance (0=low, 1=normal, 2=high)
    [Parameter(Mandatory=$false)]
    [Int]
    [ValidateRange(0,1440)]
    $ad = 200
)

Write-Host $ad + "minutes..................."

## set-executionpolicy unrestricted

########################
#click
########################
$cSource = @'
using System;
using System.Drawing;
using System.Runtime.InteropServices;
using System.Windows.Forms;
public class Clicker
{
//https://msdn.microsoft.com/en-us/library/windows/desktop/ms646270(v=vs.85).aspx
[StructLayout(LayoutKind.Sequential)]
struct INPUT
{
public int type; // 0 = INPUT_MOUSE,
// 1 = INPUT_KEYBOARD
// 2 = INPUT_HARDWARE
public MOUSEINPUT mi;
}
//https://msdn.microsoft.com/en-us/library/windows/desktop/ms646273(v=vs.85).aspx
[StructLayout(LayoutKind.Sequential)]
struct MOUSEINPUT
{
public int dx ;
public int dy ;
public int mouseData ;
public int dwFlags;
public int time;
public IntPtr dwExtraInfo;
}
//This covers most use cases although complex mice may have additional buttons
//There are additional constants you can use for those cases, see the msdn page
const int MOUSEEVENTF_MOVED = 0x0001 ;
const int MOUSEEVENTF_LEFTDOWN = 0x0002 ;
const int MOUSEEVENTF_LEFTUP = 0x0004 ;
const int MOUSEEVENTF_RIGHTDOWN = 0x0008 ;
const int MOUSEEVENTF_RIGHTUP = 0x0010 ;
const int MOUSEEVENTF_MIDDLEDOWN = 0x0020 ;
const int MOUSEEVENTF_MIDDLEUP = 0x0040 ;
const int MOUSEEVENTF_WHEEL = 0x0080 ;
const int MOUSEEVENTF_XDOWN = 0x0100 ;
const int MOUSEEVENTF_XUP = 0x0200 ;
const int MOUSEEVENTF_ABSOLUTE = 0x8000 ;
const int screen_length = 0x10000 ;
//https://msdn.microsoft.com/en-us/library/windows/desktop/ms646310(v=vs.85).aspx
[System.Runtime.InteropServices.DllImport("user32.dll")]
extern static uint SendInput(uint nInputs, INPUT[] pInputs, int cbSize);
public static void LeftClickAtPoint(int x, int y)
{
//Move the mouse
INPUT[] input = new INPUT[3];
input[0].mi.dx = x*(65535/System.Windows.Forms.Screen.PrimaryScreen.Bounds.Width);
input[0].mi.dy = y*(65535/System.Windows.Forms.Screen.PrimaryScreen.Bounds.Height);
input[0].mi.dwFlags = MOUSEEVENTF_MOVED | MOUSEEVENTF_ABSOLUTE;
//Left mouse button down
input[1].mi.dwFlags = MOUSEEVENTF_LEFTDOWN;
//Left mouse button up
input[2].mi.dwFlags = MOUSEEVENTF_LEFTUP;
SendInput(3, input, Marshal.SizeOf(input[0]));
}
}
'@
Add-Type -TypeDefinition $cSource -ReferencedAssemblies System.Windows.Forms, System.Drawing
#Send a click at a specified point
#1366*768  60=1H
$n = $ad
while ($n -gt 0) {
    $n = $n - 1
    if($n%2){
        #Write-Host "$n"+"odd"
        
        #teams
        Start-Sleep -s 5
        [Clicker]::LeftClickAtPoint(800, 810)
        Start-Sleep -s 5
        [Clicker]::LeftClickAtPoint(801, 810)
        #OutLook
        Start-Sleep -s 5
        [Clicker]::LeftClickAtPoint(444, 810)
        Start-Sleep -s 5
        [Clicker]::LeftClickAtPoint(442, 810)
        #EXEL
        Start-Sleep -s 5
        [Clicker]::LeftClickAtPoint(541, 810)
        Start-Sleep -s 5
        [Clicker]::LeftClickAtPoint(542, 810)
        #IE
        Start-Sleep -s 5
        [Clicker]::LeftClickAtPoint(345, 810)
        Start-Sleep -s 6
        [Clicker]::LeftClickAtPoint(346, 810)
        #Screen-Center-source
        Start-Sleep -s 5
        [Clicker]::LeftClickAtPoint(789, 429)
        Start-Sleep -s 5
        [Clicker]::LeftClickAtPoint(790, 444)

        #LOCAL-Editer
        Start-Sleep -s 5
        [Clicker]::LeftClickAtPoint(472, 855)
        Start-Sleep -s 6
        [Clicker]::LeftClickAtPoint(474, 855)
    }else{
        #Write-Host "$n"+"even"

        #OutLook
        Start-Sleep -s 5
        [Clicker]::LeftClickAtPoint(444, 810)
        Start-Sleep -s 5
        [Clicker]::LeftClickAtPoint(442, 810)
        #teams
        Start-Sleep -s 5
        [Clicker]::LeftClickAtPoint(800, 810)
        Start-Sleep -s 5
        [Clicker]::LeftClickAtPoint(801, 810)
        #Folder
        Start-Sleep -s 5
        [Clicker]::LeftClickAtPoint(491, 810)
        Start-Sleep -s 5
        [Clicker]::LeftClickAtPoint(492, 810)
        #SAKURA
        Start-Sleep -s 5
        [Clicker]::LeftClickAtPoint(750, 810)
        Start-Sleep -s 6
        [Clicker]::LeftClickAtPoint(751, 810)
        #Screen-Center-source
        Start-Sleep -s 5
        [Clicker]::LeftClickAtPoint(789, 429)
        Start-Sleep -s 5
        [Clicker]::LeftClickAtPoint(790, 444)
        #LOCAL-Editer
        Start-Sleep -s 5
        [Clicker]::LeftClickAtPoint(472, 855)
        Start-Sleep -s 6
        [Clicker]::LeftClickAtPoint(474, 855)
    }

}

########################
#MOVE        
########################
# Add-Type -AssemblyName System.Windows.Forms
# Add-Type -AssemblyName Microsoft.VisualBasic
# #[Microsoft.VisualBasic.Interaction]::AppActivate('Form1 (mxy.mxy.com)')
# [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point(200,310)