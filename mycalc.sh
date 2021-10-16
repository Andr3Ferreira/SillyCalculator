#!bin/bash
#Assignment Number: Lab 09
#Student Name: Andre dos Santos Ferreira
#Student Number: 040992546
#Course and Lab seciton: CST8284 310
#Script file Name: mycalc
#Submission Date: Aug 5, 2021
#Description: Simple calculator that prompts the user for two numbers and offers two types of algebraic operations

#Add function taking 2 numbers and 1 string as parameters
function add()
{
	((result = $num1 + $num2)) 
	echo "The sum of $num1 plus $num2 equals $result"
	sleep 3 
	menu1 
}

#Subtraction function taking 2 numbers and 1 string as parameters
function subtract()
{
	((result = $num1 - $num2)) 
        echo "The difference of $num1 minus $num2 equals $result"
	sleep 3 
	menu1 
}

function addSecondNumber()
{
	clear #clean the screen
        read -p "Please enter the second integer number to add or X to exit: " num2
        case $num2 in
		X|x) 
                        clear 
                        exit;;
  		''|*[!0-9]*) 
                	echo "Invalid input!!" 
                        sleep 3 
                        addSecondNumber $num1;;
		*) 
                        add $num1 $num2;; 
        esac
}

function subSecondNumber()
{
        clear 
        read -p "Please enter the second integer number to subtract or X to exit: " num2 #secondNumber #read the second number
        case $num2 in #$secondNumber
		X|x) 
                        clear 
                        exit;; 
                ''|!=[0-9])#*[!0-9]* 
                        echo "Invalid input!!" 
                        sleep 3 
                        subSecondNumber $num1;; 
                *) 
                        subtract $num1 $num2;; 
        esac
}

#Menu 1 - Asks the user what's the choice wanted: calculation or exit
function menu1()
{
	clear 
	echo "C) Calculation"
        echo "X) Exit"
        read choice 
	case $choice in
                C|c) 
			menu2;; 
		X|x) 
			clear 
                        exit;;
		*) 
			echo "Invalid input!!" 
                        sleep 3 
                        menu1;; 
        esac
}

#Menu 2 - Asks the user for a second number or points X as the exit 
function menu2()
{
	clear
	read -p "Please enter an integer number or X to exit: " num1 
	case $num1 in 
		X|x)
			clear 
			exit;;
		''|*[!0-9]*) 
			echo "Invalid input!!" 
                        sleep 3 
                        menu2;; 
		*) 
			menu3 $num1;;
	esac
}

#Menu 3 - Provide two options of math operation (sum & subtraction) and a third option to exit
function menu3()
{
	clear 
	echo "+) Add"
        echo "-) Subtract"
        echo "X) Exit"
        read oper
        case  $oper in
        	+) 
		    addSecondNumber $num1;; 
                -)
                    subSecondNumber $num1;;
                X|x) 
			clear 
                        exit;;
                *) 
                        echo "Invalid input!!" 
			sleep 3
			menu3 $num1;;
	esac
}

#Program starts here!

clear
case $# in #recognize the number of parameter
	0) 
		menu1;;
	3) 
		case $oper in 
               		+) 
				add
        			sleep 3 
				clear 
				exit;;
                	-) 
				subtract
                                sleep 3 
				clear 
                                exit;;
                	*) 
		      		echo "Invalid operator!" 
                        	sleep 3 
				clear 
				exit;; 
		esac;;
	*) 
		echo "Invalid input!!" 
                sleep 3 
                clear 
                exit;; 
esac
		
		
