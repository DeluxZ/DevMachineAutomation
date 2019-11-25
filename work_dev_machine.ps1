# Description: Install develop machine for work
# Author: Harrie Essing
# Developer settings and apps for work

#http://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/DeluxZ/DevMachineAutomation/master/work_dev_machine.ps1

# Install BoxStarter
Set-ExecutionPolicy RemoteSigned
. { iwr -useb http://boxstarter.org/bootstrapper.ps1 } | iex; get-boxstarter -Force

# Disable UAC
Disable-UAC

# Uninstall unecessary applications that come with Windows out of the box
Write-Host "Uninstall some applications that come with Windows out of the box" -ForegroundColor "Yellow"

function removeApp {
	Param ([string]$appName)
	Write-Output "Trying to remove $appName"
	Get-AppxPackage $appName | Remove-AppxPackage
	Get-AppXProvisionedPackage -Online | Where DisplayName -like $appName | Remove-AppxProvisionedPackage -Online
}

$Applications = @(
    Get-AppxPackage Microsoft.3DBuilder | Remove-AppxPackage                     # 3D Builder
    Get-AppxPackage Microsoft.Appconnector | Remove-AppxPackage                  # App Connector
    Get-AppxPackage Microsoft.BingFinance | Remove-AppxPackage                   # Money
    Get-AppxPackage Microsoft.BingFoodAndDrink | Remove-AppxPackage              # Food & Drink
    Get-AppxPackage Microsoft.BingHealthAndFitness | Remove-AppxPackage          # Health & Fitness
    Get-AppxPackage Microsoft.BingNews | Remove-AppxPackage                      # News
    Get-AppxPackage Microsoft.BingSports | Remove-AppxPackage                    # Sports
    Get-AppxPackage Microsoft.BingTranslator | Remove-AppxPackage                # Translator
    Get-AppxPackage Microsoft.BingTravel | Remove-AppxPackage                    # Travel
    Get-AppxPackage Microsoft.BingWeather | Remove-AppxPackage                   # Weather
    Get-AppxPackage Microsoft.CommsPhone | Remove-AppxPackage                    # Phone
    Get-AppxPackage Microsoft.ConnectivityStore | Remove-AppxPackage             # Microsoft Wi-Fi
    Get-AppxPackage Microsoft.FreshPaint | Remove-AppxPackage                    # Fresh Paint
    Get-AppxPackage Microsoft.GetHelp | Remove-AppxPackage                       # Get Help
    Get-AppxPackage Microsoft.Getstarted | Remove-AppxPackage                    # Get Started / Tips
    Get-AppxPackage Microsoft.Messaging | Remove-AppxPackage                     # Messaging
    Get-AppxPackage Microsoft.Microsoft3DViewer | Remove-AppxPackage             # View 3D
    Get-AppxPackage Microsoft.MicrosoftOfficeHub | Remove-AppxPackage            # Get Office
    Get-AppxPackage Microsoft.MicrosoftPowerBIForWindows | Remove-AppxPackage    # Microsoft Power BI Desktop
    Get-AppxPackage Microsoft.MicrosoftSolitaireCollection | Remove-AppxPackage  # Microsoft Solitaire Collectio
    Get-AppxPackage Microsoft.MicrosoftStickyNotes | Remove-AppxPackage          # Sticky Notes
    Get-AppxPackage Microsoft.MinecraftUWP | Remove-AppxPackage                  # Minecraft for Windows 10
    Get-AppxPackage Microsoft.MSPaint | Remove-AppxPackage                       # Paint 3D
    Get-AppxPackage Microsoft.NetworkSpeedTest | Remove-AppxPackage              # Network Speed Test
    #Get-AppxPackage Microsoft.Office.OneNote | Remove-AppxPackage                # OneNote Windows Store Version
    Get-AppxPackage Microsoft.Office.Sway | Remove-AppxPackage                   # Sway
    Get-AppxPackage Microsoft.OneConnect | Remove-AppxPackage                    # Paid Wi-Fi & Cellular
    Get-AppxPackage Microsoft.People | Remove-AppxPackage                        # People
    Get-AppxPackage Microsoft.Print3D | Remove-AppxPackage                       # Print 3D
    Get-AppxPackage Microsoft.SkypeApp | Remove-AppxPackage                      # Get Skype
    Get-AppxPackage Microsoft.Wallet | Remove-AppxPackage                        # Microsoft Wallet
    Get-AppxPackage Microsoft.Windows.Photos | Remove-AppxPackage                # Photos
    Get-AppxPackage Microsoft.WindowsAlarms | Remove-AppxPackage                 # Alarms & Clock
    #Get-AppxPackage Microsoft.WindowsCalculator | Remove-AppxPackage             # Calculator
    Get-AppxPackage Microsoft.WindowsCamera | Remove-AppxPackage                 # Camera
    Get-AppxPackage microsoft.windowscommunicationsapps | Remove-AppxPackage     # Calendar and Mail
    Get-AppxPackage Microsoft.WindowsFeedbackHub | Remove-AppxPackage            # Feedback Hub
    Get-AppxPackage Microsoft.WindowsMaps | Remove-AppxPackage                   # Maps
    Get-AppxPackage Microsoft.WindowsPhone | Remove-AppxPackage                  # Phone Companion
    Get-AppxPackage Microsoft.WindowsReadingList | Remove-AppxPackage            # Windows Reading List
    Get-AppxPackage Microsoft.WindowsSoundRecorder | Remove-AppxPackage          # Voice Recorder
    Get-AppxPackage Microsoft.XboxApp | Remove-AppxPackage                       # Xbox
    Get-AppxPackage Microsoft.XboxGameOverlay | Remove-AppxPackage               # Game Bar
    Get-AppxPackage Microsoft.XboxIdentityProvider | Remove-AppxPackage          # Xbox Live Login Provider for Programs/Games
    Get-AppxPackage Microsoft.XboxSpeechToTextOverlay | Remove-AppxPackage       # Xbox Speed to Text overlay
    Get-AppxPackage Microsoft.ZuneMusic | Remove-AppxPackage                     # Groove Music
    Get-AppxPackage Microsoft.ZuneVideo | Remove-AppxPackage                     # Movies & TV
);

foreach ($app in $Applications) {
    removeApp $app
}

# Install Windows Subsystem for Linux
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

# Enable Hyper-V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

# Install applications
choco install azure-data-studio -y                          # Azure Data Studio
                                                            # Catlight
choco install ditto -y                                      # Ditto
choco install docker-desktop -y                             # Docker Desktop
choco install git-fork -y                                   # Fork
choco install googlechrome -y                               # Google Chrome
choco install lastpass -y                                   # LastPass
choco install microsoftazurestorageexplorer -y              # Microsoft Azure Storage Explorer
choco install sql-server-management-studio -y               # Microsoft SQL Server Management Studio
choco install microsoft-teams -y                            # Microsoft Teams
choco install vscode -y                                     # Microsoft Visual Studio Code
choco install visualstudio2017enterprise --locale En-us -y  # Microsoft Visual Studio 2017 Enterprise
choco install visualstudio2019enterprise --locale En-us -y  # Microsoft Visual Studio 2019 Enterprise
choco install firefox --params "l=en-US" -y                 # Mozilla Firefox
choco install nodejs-lts -y                                 # NodeJS (LTS)
choco install nugetpackageexplorer -y                       # Microsoft Nuget Package Explorer
choco install poshgit -y                                    # Poshgit
choco install postman -y                                    # Postman
choco install slack -y                                      # Slack
                                                            # Spotbright
choco install diffmerge -y                                  # SourceGear DiffMerge
choco install stack -y                                      # Stack storage
choco install wsl-ubuntu-1804 -y                            # Ubuntu WSL
choco install whatsapp -y                                   # Whatsapp

# Visual Studio Code Extensions
#code --install-extension 1tontech.angular-material
#code --install-extension abierbaum.vscode-file-peek
#code --install-extension abusaidm.html-snippets
#code --install-extension Angular.ng-template
#code --install-extension AngularDoc.angulardoc-vscode
#code --install-extension Arjun.swagger-viewer
#code --install-extension bradlc.vscode-tailwindcss
#code --install-extension christian-kohler.path-intellisense
#code --install-extension cyrilletuzi.angular-schematics
#code --install-extension DennisMaxJung.vscode-dotnet-auto-attach
#code --install-extension eamodio.gitlens
#code --install-extension EditorConfig.EditorConfig
#code --install-extension eg2.tslint
#code --install-extension Equinusocio.vsc-material-theme
#code --install-extension esbenp.prettier-vscode
#code --install-extension formulahendry.auto-close-tag
#code --install-extension formulahendry.auto-rename-tag
#code --install-extension formulahendry.docker-explorer
#code --install-extension formulahendry.dotnet-test-explorer
#code --install-extension GitHub.vscode-pull-request-github
#code --install-extension GregorBiswanger.json2ts
#code --install-extension infinity1207.angular2-switcher
#code --install-extension jchannon.csharpextensions
#code --install-extension jeppeandersen.vstsbuildstatus
#code --install-extension jeppeandersen.vstsservicestatus
#code --install-extension johnpapa.Angular2
#code --install-extension jolaleye.horizon-theme-vscode
#code --install-extension karigari.chat
#code --install-extension KnisterPeter.vscode-github
#code --install-extension loiane.angular-extension-pack
#code --install-extension MarinhoBrandao.Angular2Tests
#code --install-extension ms-azure-devops.azure-pipelines
#code --install-extension ms-azuretools.vscode-azurefunctions
#code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
#code --install-extension ms-mssql.mssql
#code --install-extension ms-python.python
#code --install-extension ms-vscode.azure-account
#code --install-extension ms-vscode.azurecli
#code --install-extension ms-vscode.csharp
#code --install-extension ms-vscode.powershell
#code --install-extension ms-vscode.vscode-typescript-tslint-plugin
#code --install-extension ms-vsliveshare.vsliveshare
#code --install-extension ms-vsliveshare.vsliveshare-audio
#code --install-extension ms-vsliveshare.vsliveshare-pack
#code --install-extension ms-vsts.team
#code --install-extension msazurermtools.azurerm-vscode-tools
#code --install-extension msjsdiag.debugger-for-chrome
#code --install-extension NG-42.ng-fortytwo-vscode-extension
#code --install-extension PeterJausovec.vscode-docker
#code --install-extension rbbit.typescript-hero
#code --install-extension redhat.vscode-yaml
#code --install-extension ryanluker.vscode-coverage-gutters
#code --install-extension samcogan.arm-snippets
#code --install-extension SimonTest.simontest
#code --install-extension steoates.autoimport
#code --install-extension stringham.move-ts
#code --install-extension Summer.azure-event-hub-explorer
#code --install-extension UVBrain.Angular2
#code --install-extension vsciot-vscode.azure-iot-edge
#code --install-extension vsciot-vscode.azure-iot-toolkit
#code --install-extension vsciot-vscode.azure-iot-tools
#code --install-extension vsciot-vscode.vscode-iot-workbench

# Enable UAC
Enable-UAC
