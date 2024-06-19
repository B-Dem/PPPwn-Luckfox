# PPPwn-Luckfox

### PPPwn-Luckfox is a program that run the PPPwn exploit on low-cost Linux board.<br>



- Original work by theflow <a href=https://github.com/TheOfficialFloW/PPPwn>PPPwn</a>. 

- Thanks to xfangfang for <a href=https://github.com/xfangfang/PPPwn_cpp>PPPwn-CPP</a> an executable re-write of PPPwn in C++ for Cortex-A7 compatible with Luckfox Pico Boards.

- Thanks to SiSTRo for his <a href=https://github.com/GoldHEN/GoldHEN>GoldHen</a> releases. 

- Thanks to <a href=https://github.com/stooged/PI-Pwn>Stooged</a> for the inspiration.<br>

## Note :

- Currently support PS4 version: `9.00, 9.60, 10.00, 10.01, 11.00`
- The average PPPwned time is around `1min - 2min` sometimes it load under `1 minute`
- Using `pppwn` nightly build from xfangfang PPPwn_cpp <be>

## Tested Version :

- [x] 9.00
- [x] 9.60
- [x] 10.00
- [x] 10.01
- [x] 11.00
      
## What it does : 

The goal here is to setup the Luckfox pico to automatically try and jailbreak the console, all you need to do is wait until the process completes. Once it PPPwned the process will stop. <br>

## Requirements :

- An SD Card of 8GB or above
- Luckfox Pico/Pro/Max/Plus/Mini
- An Ethernet Cable
- USB Type-C for power to the board
- A USB drive formatted in exFAT / FAT32  (only use for the first time to load GoldHEN)

## Supported Boards :

- <b>Luckfox Pico Pro</b><br>
- <b>Luckfox Pico Max</b><br>
- <b>Luckfox Pico Plus</b><be>
- <b>Luckfox Pico Mini *</b><br>
- <b>Luckfox Pico *</b><br>

## Firmware Installation :

1. Download your Firmware <a href=https://drive.google.com/drive/folders/1r6Ulc_crJar1entKbK7GEJSq14HXL8ao>Here</a> 
After you download, extract one of the zip files according to your Luckfox Pico models. <br>

2. Now Download <a href=https://drive.google.com/file/d/1ALo4G7rEaF1GNhUHINoYHT_RGWGddzYw>SocToolKit</a>, unzip it and open `SocToolKit.exe`.


3. Refer to the table below to find out your Chip model

Luckfox Models  | Chip Type
------------- | -------------
Luckfox Pico Pro/Max  | RV1106
Luckfox Pico/Plus/Mini  | RV1103 

4. Now you need to Flash your SD Card: <br>
  a. In SocToolKit select `SDtool`.<br>
  b. Plug your SD card in your Computer and select it in the `Usb Disk` drop down menu.<br>
  c. Select SD card booting.<br>
  d. Import all the `.img` file from the Firmware you Downloaded earlier except the `update.img`.<br>
  e. Click on `Create SD Card`.<br>


5. After done, eject your SD card and place it into the Luckfox, power it using USB Type-C, and connect it to the internet by plugging the LAN cable into your router.<br> 
6. To loggin to your Luckfox:

      You need to log in using SSH: 
      Normally the Luckfox will setup a static IP that will be : 172.32.0.70
      Now open cmd and type : `ssh pico@172.32.0.70`

Login Details :

```sh
Login: pico
Password: luckfox
```

7. After you log in, run the following commands and follow the setup instruction:

```sh
git clone https://github.com/0x1iii1ii/PPPwn-Luckfox.git
cd PPPwn-Luckfox
chmod +x install.sh
sudo ./install.sh
```

Once the Luckfox reboots pppwn will run automatically.<be>

## How to update :
Only use this command when you want to update to the latest released version of PPPwn-Luckfox.<br>

To update :

Log in to your luckfox with ssh, then run the following commands and follow the setup instruction:
```sh
cd PPPwn-Luckfox
git pull
sudo ./install.sh
```

When the Luckfox will reboot it will be updated to the last version

## * Special Note for Luckfox Pico/Mini
Ignore this if you use Pro/Max/Plus version. 
For these 2 boards, there's no Ethernet port, to make it work you need to solder the LAN Port (RJ45) cable to it, either female or male is fine.

## Hardware Installation :

1. You simply need to connect the LAN cable from Luckfox Pico to the PS4 and power the Luckfox from the PS4 via a USB Type-C cable or other sources.

## On your PS4:<br>

- Go to `Settings` and then `Network`<br>
- Select `Set Up Internet connection` and choose `Use a LAN Cable`<br>
- Choose `Custom` setup and choose `PPPoE` for `IP Address Settings`<br>
- Enter `ppp` for `PPPoE User ID` and `PPPoE Password`<br>
- Choose `Automatic` for `DNS Settings` and `MTU Settings`<br>
- Choose `Do Not Use` for `Proxy Server`<br>

For GoldHen you need to place the `goldhen.bin` file to the root of a USB drive and plug it into the console.<br>
Once Goldhen has been loaded for the first time it will be copied to the consoles internal HDD and the USB drive is no longer required.<br>
To update Goldhen just repeat the above process, and the new version will be copied to the internal HDD<br>

## Upcoming Updates :

- No SD card
- Faster Boot time
- Faster PPPwn execution
- Higher success rate