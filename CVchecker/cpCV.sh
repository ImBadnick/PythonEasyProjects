#!/bin/bash

case "$1" in 
    (1) if [ -s "CVmenu.py" ]; then
            echo "1" | python3 CVmenu.py
        else 
            echo "CVmenu.py doesn't exists or its empty" 1>&2
        fi  ;;
    (2) if [ -s "CVmenu.py" ]; then
            echo "2" | python3 CVmenu.py
        else 
            echo "CVmenu.py doesn't exists or its empty" 1>&2
        fi  ;;
    (3) if [ -s "CVmenu.py" ]; then
            echo "3" | python3 CVmenu.py
        else 
            echo "CVmenu.py doesn't exists or its empty" 1>&2
        fi  ;;
    (4) if [ -s "CVmenu.py" ]; then
            echo "4" | python3 CVmenu.py
        else 
            echo "CVmenu.py doesn't exists or its empty" 1>&2   
        fi  ;; 

    ("matlab") if [ -d "COVID-19-REPORTS/" ]; then
            if [ -d "../../MatlabProjects/CVchecker/COVID-19-REPORTS/" ]; then
                find COVID-19-REPORTS/*.csv -exec cp {} ../../MatlabProjects/CVchecker/COVID-19-REPORTS/ \;
                echo "copy of files done with success."
            else 
                echo "Creating the matlab covid directory"
                mkdir ../../MatlabProjects/CVchecker/COVID-19-REPORTS/
                find COVID-19-REPORTS/*.csv -exec cp {} ../../MatlabProjects/CVchecker/COVID-19-REPORTS/ \;
                echo "copy of files done with success."
            fi
        else 
            if [ -s "CVmenu.py" ]; then
                mkdir "COVID-19-REPORTS"
                echo "3" | python3 CVmenu.py
                if [ -d "../../MatlabProjects/CVchecker/COVID-19-REPORTS/" ]; then
                    find COVID-19-REPORTS/*.csv -exec cp {} ../../MatlabProjects/CVchecker/COVID-19-REPORTS/ \;
                    echo "copy of files done with success."
                else 
                    echo "Creating the matlab covid directory"
                    mkdir ../../MatlabProjects/CVchecker/COVID-19-REPORTS/
                    find COVID-19-REPORTS/*.csv -exec cp {} ../../MatlabProjects/CVchecker/COVID-19-REPORTS/ \;
                    echo "copy of files done with success."
                fi
            else 
                echo "CVmenu.py doesn't exists or its empty" 1>&2
            fi
        fi  ;;

    (*) echo "$0: Not the right args" 1>&2;; 
esac
        