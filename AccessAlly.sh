#!/bin/bash
echo "

                                                                
     .oo                                         .oo 8 8        
    .P 8                                        .P 8 8 8        
   .P  8 .oPYo. .oPYo. .oPYo. .oPYo. .oPYo.    .P  8 8 8 o    o 
  oPooo8 8    ' 8    ' 8oooo8 Yb..   Yb..     oPooo8 8 8 8    8 
 .P    8 8    . 8    . 8.       'Yb.   'Yb.  .P    8 8 8 8    8 
.P     8 .YooP' .YooP' .Yooo' .YooP' .YooP' .P     8 8 8 .YooP8 
..:::::..:.....::.....::.....::.....::.....:..:::::......:....8 
::::::::https://www.linkedin.com/in/hamidbash/:::::::::::::ooP'.
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::...::

                                                                                      
"
echo "Welcome to the File Management System!" 

show_menu(){ #This line functions to show the list of what you do.
	echo " " #This line functions to create space.
	echo "1. Create a File" 
	echo "2. Create a File with Echo"
	echo "3. Create a Directory"
	echo "4. Delete a File"
	echo "5. Delete a File with Force"
	echo "6. Delete a Directory"
	echo "7. Delete a Directory and its Contents"
	echo "8. Copy a File"
	echo "9. Copy a File and its Contents"
	echo "10. Move a File"
	echo "11. Rename a File"
	echo "12. Change Permission a File/Directory"
	echo "13. Change User:Group a File/Directory"
	echo "14. Show Details of Files and Directories"
	echo " "
}


while true; do #This line is used to repeat the command based on the selected menu option, and it will continue running until the command is stopped directly.
	show_menu #This line functions to call the order that was placed at line 19.
	read -p "What do you want (1-14) : " choose #This line functions to ask what you want to do.
	echo ""
	case $choose in #This line is the initial statement of the condition.
		1) 
			read -p "File name ? " filename 
			touch $filename
			echo "File $filename has been successfully created."
			;;
		2)
			read -p "What do you want to say ? " saynow 
			read -p "File name ? " filename 
			echo $saynow > $filename
			echo "File $filename has been successfully created."
			;;
		3)
			read -p "What Directory name ? " dirname
			mkdir $dirname
			echo "Folder $dirname has been successfully created."
			;;
		4)
			read -p "What is the name of the File you want to delete ? " filename
			rm $filename
			echo "File $filename has been successfully removed."
			;;
		5)
			read -p "What File do you want to force delete ? " filename
            rm -f $filename
            echo "File $filename has been successfully force removed."
            ;;
		6)
			read -p "What Directory do you want to delete ? " dirname
            rmdir $dirname
            echo "Folder $dirname has been successfully force removed."
            ;;
		7)
			read -p "What Directory do you want to delete and its Contents ? " dirname
            rm -r $dirname
            echo "Folder $dirname has been successfully force removed."
            ;;
		8)
			read -p "What File do you want to duplicate ? " originalfile			
			read -p "What is the name of the new File ? " newfile
			cp $originalfile $newfile
			echo "File $newfile has been successfully copied."
			;;
		9)
			 read -p "What Directory do you want to duplicate ? " originaldir
             read -p "What is the name of the new Directory ? " newdir
             cp -r $originaldir $newdir
             echo "Directory $newdir has been successfully copied."
             ;;
		10)
			 echo "You are here now $(pwd)"			 
			 read -p "What File do you want to move ? " originalfile
             read -p "Where do you want to move it ? (/usr/dir0/file.txt)" newfile
             mv $originalfile $newfile
             echo "File $newfile has been successfully moved."
             ;;
		11)
			 read -p "What File do you want to change ? " originalfile
             read -p "What is the name of the new File ? " newfile
             mv $originalfile $newfile
             echo "File $newfile has been successfully copied."
             ;;
		12)
			 echo "(r)READ (w)WRITE (x)EXECUTE"
			 read -p "What permission for owner ? (rwx) " chmodowner
			 read -p "What permission for group ? (rwx) " chmodgroup
			 read -p "What permission for other ? (rwx) " chmodother
			 read -p "What File do you want to change permission ? " filename
			 chmod u+$chmodowner,g+$chmodgroup,o+$chmodother $filename
			 echo "File $filename has been successfully change permission."
			 ls -l $filename
			 ;;
		13)
			 read -p "What name for user ? " username
             read -p "What name for group ? " groupname
			 read -p "What File do you want to change ? " filename
             chown $username:$groupname $filename
             echo "File $filename has been successfully change owner or group."
             ;;
		14)
			 echo "This is all the files from the directory $(pwd)"
			 ls -la --color
			 ;;
		esac #End of the condition at line 43.
while true; do #This line is a confirmation loop to determine whether to return to the previous loop, which is line 39, or not.
		
		read -p "Anything else you want ? (yes/no) : " confirm
		if [[ "$confirm" == "yes" ]]; then #This line is a confirmation of the 'yes' option.
			echo "Yeah, i like it." #If the user chooses yes, then show the text 'Yeah, I like it.
			break #And this is the command to end the loop at line 127.
		elif [[ "$confirm" == "no" ]]; then #This line is a confirmation of the 'no' option.
			echo "I miss u so much bro. Thanks for using me!" #If the user chooses yes, then show the text  "I miss u so much bro. Thanks for using me!"
			exit #this is command to exit application
		else #This section is an option if the user answers with something other than yes or no.
			echo "I don't like it. I'm just asking for a yes or no." #and then this text displayed
		fi 
	done #end of code loop while line 127
	done #end of code loop while line 39
