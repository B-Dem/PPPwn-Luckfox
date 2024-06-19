#!/bin/bash

echo "__________________                  "
echo "| ___ \ ___ \ ___ \                 "
echo "| |_/ / |_/ / |_/ /_      ___ __    "
echo "|  __/|  __/|  __/\ \ /\ / / '_ \   "
echo "| |   | |   | |    \ V  V /| | | |  "
echo "\_|   \_|   \_|     \_/\_/ |_| |_|  "
echo "                                    " 
echo " _                _     __          "
echo "| |              | |   / _|         "
echo "| |    _   _  ___| | _| |_ _____  __"
echo "| |   | | | |/ __| |/ /  _/ _ \ \/ /"
echo "| |___| |_| | (__|   <| || (_) >  < "
echo "\_____/\__,_|\___|_|\_\_| \___/_/\_\ "

echo "By: https://github.com/0x1iii1ii/PPPwn-Luckfox"
echo "Edited by https://github.com/B-Dem"
echo ""
echo "Credit :"
echo "TheFl0w for Original PPPwn Exploit"
echo "https://github.com/TheOfficialFlow/PPPwn"
echo "Xfangfang for PPPwn_CPP"
echo "https://github.com/xfangfang/PPPwn_cpp"

# Display the list of firmware versions
echo "Please select your PS4 firmware version:"
echo "1) 9.00"
echo "2) 9.60"
echo "3) 10.00"
echo "4) 10.01"
echo "5) 11.00"
echo ""
# Prompt the user for the selection
read -p "Enter your choice (1/2/3/4/5): " FW_CHOICE

# Set the firmware version based on the user's choice
declare -A fw_versions=(
    [1]="900"
	[2]="960"
    [3]="1000"
    [4]="1001"
    [5]="1100"
)

FW_VERSION=${fw_versions[$FW_CHOICE]}

if [ -z "$FW_VERSION" ]; then
    echo "Invalid choice. Exiting."
    exit 1
fi

# Confirm the firmware version selection
echo "You have selected firmware $FW_VERSION. Is this correct? (y/n)"
read -p "Enter your choice: " CONFIRMATION

if [[ $CONFIRMATION != "y" ]]; then
    echo "Firmware selection not confirmed. Exiting."
    exit 1
fi

# Define the paths for the stage1 and stage2 files based on the firmware version
STAGE1_FILE="stage1/$FW_VERSION/stage1.bin"
STAGE2_FILE="stage2/$FW_VERSION/stage2.bin"

# Create the execution script with the user inputs
cat <<EOL > pppwn_script.sh
#!/bin/bash

# Define variables
FW_VERSION=$FW_VERSION
STAGE1_FILE="$STAGE1_FILE"
STAGE2_FILE="$STAGE2_FILE"

# Disable eth0
ifconfig eth0 down

# Wait a second
sleep 1

# Enable eth0
ifconfig eth0 up

# Wait a second
sleep 1

# Change to the directory containing the pppwn executable
cd /home/pico/PPPwn-Luckfox/

# Execute the pppwn command with the desired options
./pppwn --interface eth0 --fw \$FW_VERSION --stage1 "\$STAGE1_FILE" --stage2 "\$STAGE2_FILE" -a -t 5 -nw -wap 2

# Check if the pppwn command was successful
if [ \$? -eq 0 ]; then
    echo "PPPwn successfully executed !"
    sleep 10
    ifconfig eth0 down
	sleep 5
	systemctl halt
else
    echo "PPPwn execution failed ! Exiting script."
    exit 1
fi
EOL

# Make the pppwn and script executable
chmod +x pppwn_script.sh
chmod +x pppwn

# Create the pppwn.service file
cat <<EOL > pppwn.service
[Unit]
Description=PPPwn Script Service
After=network.target

[Service]
Type=simple
ExecStart=/home/pico/PPPwn-Luckfox/pppwn_script.sh

[Install]
WantedBy=multi-user.target
EOL

# Move and enable the service file
sudo mv pppwn.service /etc/systemd/system/
sudo chmod +x /etc/systemd/system/pppwn.service
sudo systemctl enable pppwn.service

echo "Install completed! Rebooting..."

sudo reboot
