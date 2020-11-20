# image-cleanup
Organize your photos by renaming and moving it to specific folders.

* [Prerequisites](#prerequisites)
* [Setup](#setup)
* [Running the Script](#running-the-script)
* [Cleaning Up](#cleaning-up)
* [Configuration](#configuration)

#### <a name="prerequisites"></a>Prerequisites
1. A folder under your user profile labelled `Repository`.
2. A destination folder or drive.

#### <a name="setup"></a>Setup
1. Download and extract the `image-cleanup.zip` folder under your user profile.

**Example**:
```
C:\Users\nshireme\image-cleanup\image-cleanup.tcl
```
2. Place all the folders that contain the images you want to rename and move into your `Repository` folder.

**Example**:
```
C:\Users\nshireme\Repository\Landscape
  - bram-z-bramz-ravine-environment-unreal-03.jpg
  - maxresdefault.jpg
  - unreal-engine-4-landscape-uhd-4k-wallpaper.jpg
C:\Users\nshireme\Repository\Outer Space
  - 17520.jpg
  - 39632.jpg
  - 9639.jpg
```
#### <a name="running-the-script"></a>Running the Script

1. Open `cmd.exe` and change the directory to `image-cleanup`.

**Example**:
```batch
C:\Users\nshireme>cd image-cleanup
C:\Users\nshireme\image-cleanup>
```
2. Run the `image-cleanup.tcl` script.

**Example**:
```batch
C:\Users\nshireme>tclsh image-cleanup.tcl
```

**Output**:
```
Source: Landscape/bram-z-bramz-ravine-environment-unreal-03.jpg  Destination: R:Pictures/Landscape/1.jpg
Source: Landscape/maxresdefault.jpg  Destination: R:Pictures/Landscape/2.jpg
Source: Landscape/unreal-engine-4-landscape-uhd-4k-wallpaper.jpg  Destination: R:Pictures/Landscape/3.jpg
Source: Outer Space/17520.jpg  Destination: R:Pictures/Outer Space/1.jpg
Source: Outer Space/39632.jpg  Destination: R:Pictures/Outer Space/2.jpg
Source: Outer Space/39639.jpg  Destination: R:Pictures/Outer Space/3.jpg
```
The script will continue the count from where you left off the next time you collect more photos that already have a destination folder. 

#### <a name="cleaning-up"></a>Cleaning Up
You don't have to remove any folders manually, the script will do it for you. 
```
Removing Landscape
Removing Outer Space
image-cleanup.tcl exiting.
```
#### <a name="configuration"></a>Configuration

**Changing the destination folder**:

1. Open the `image-cleanup.tcl` in any text editor, locate the `destination` variable.
```
set destination_parent "R:\Pictures" # <-- Change this, but leave the quotes.
```
