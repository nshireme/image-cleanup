proc rename_images {folder destination number_of_images} {
	foreach image [lsort -dictionary [glob -nocomplain -directory $folder -type f *]] {
		 set destination_image [file join $destination [incr number_of_images][file extension $image]]
		 
		 if {![file exist $destination_image]} {
			 puts "Source: $image  Destination: $destination_image" 
			 file rename $image $destination_image
		 }
	}
}

proc remove_empty_folders {folders} {
	foreach folder $folders {
		set folder_length [llength [glob -nocomplain -directory $folder -type f *]]
	    
        if {$folder_length eq 0} {
			puts "Removing $folder"
			file delete $folder
	    }
	} 
}

set repository [file join $env(userprofile) "Repository"]
set destination_parent "R:\Pictures"

cd $repository

try {
	
	# Setup an empty to list to store all the folders we processed. 
	set empty_folders {}
	# Using a for loop we create a list of all the folder in the repository that we have to process.
	foreach folder [lsort -dictionary [glob -type d *]] {
		set image_path [file join $repository $folder]
		set destination_child [file join $destination_parent $folder]
		
		# Create a destination directory to store all our renamed images. 
		file mkdir $destination_child 
		# Get the number of images from the source. 
		set number_of_images [llength [glob -nocomplain -directory $destination_child -type f *]]
		
		# Calling rename_images and passing the subfolders in the repository. 
		rename_images $folder $destination_child $number_of_images
	
		set number_images_source [llength [glob -nocomplain -directory $folder -type f *]]
		# When the wor is done, we append the folder the the list.
		lappend empty_folders $folder
	}
	# When the work is done, we can remove all the empty folders. 
	remove_empty_folders $empty_folders 
} trap {POSIX ENOENT} {errormessage} {
   puts "$errormessage"
} trap {POSIX EEXIST} {error_message} {
   puts "$error_message"
} trap {TCL OPERATION GLOB NOMATCH} {error_message} {
   puts "$repository is empty"
} finally {
   puts "$argv0 exiting."
}
