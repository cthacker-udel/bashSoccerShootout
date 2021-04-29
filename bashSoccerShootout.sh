
echo -e "\n##################################\n"
echo -e "\nWelcome to Bash Soccer Shootout!\n"
echo -e "####################################\n"

sleep 3

echo -e "\n"
read -p " Player : Name your team >>>     " teamPlayer
echo -e "\n"

sleep 1

read -p " Player : Choose computer's team name >>>    " teamComputer
echo -e "\n"
sleep 1

playerscore=0
computerscore=0
totalkicksplayer=0
totalkickscomputer=0
overtime=0
overtimerounds=1


display_menu(){

cat <<EOF

    --- MENU ---

    1) Normal Shot
    2) Chip shot
    3) Stutter step shot

EOF

}

display_score(){

cat <<EOF

    ---- SCORE ----

    $teamPlayer : $playerscore
    
    $teamComputer : $computerscore

EOF


}


while true; do

    echo -e "\nFlipping coin to see who gets the first flip"
    echo -e "\nFlipping coin"
    coinflip=$(shuf -i 1-3 -n 1)
    sleep 2
    computerFlipGuess=$(shuf -i 1-2 -n 1)
    if [ "$computerFlipGuess" -eq 1 ]; then
        echo -e "\nComputer guesses heads, you guess tails"
        yourFlipGuess=2
    else
        yourFlipGuess=1
    fi
    
    if [ "$coinflip" -eq 1 -a "$yourFlipGuess" -eq 1 ]; then
        echo "You have won the flip!, you get to shoot first"
        turn=1
    else
        echo "You have lost the flip!, you get to shoot second"
        turn=0
    fi
    while [ "$turn" -eq 1 -o "$turn" -eq 0 ]; do
        display_score
        sleep 3
        if [ "$overtime" -eq 1 -a "$totalkicksplayer" -eq "$totalkickscomputer" ]; then
            if [ "$playerscore" -gt "$computerscore" ]; then
                echo -e "\n$teamPlayer WINS OVERTIME!!!"
                exit 0
            elif [ "$playerscore" -lt "$computerscore" ]; then
                echo -e "\n$teamComputer WINS OVERTIME!!!"
                exit 0
            else
                echo -e "\nTIE after $overtimerounds of overtime!"
                sleep 2
                ((overtimerounds++))
            fi
        fi
        if [ "$totalkicksplayer" -eq 5 -a "$totalkickscomputer" -eq 5 ]; then
            if [ "$playerscore" -gt "$computerscore" ]; then
                echo -e "\n $teamPlayer WINS!!"
                exit 0
            elif [ "$playerscore" -lt "$computerscore" ]; then
                echo -e "\n $teamComputer WINS!!"
                exit 0
            else
                echo -e "\n -----> ENTERING OVERTIME <-----"
                sleep 3
                overtime=1
            fi
        fi
        if [ "$turn" -eq 1 ]; then
            echo -e "\nPlayer taking shot"
            ((totalkicksplayer++))
            display_menu
            read playerShot
            if [ "$playerShot" -lt 1 -o "$playerShot" -gt 3 ]; then
                echo -e "\nEntered invalid option, switching to computer's turn, missed shot"
                sleep 2
                turn=0
            else
                sleep 2
                if [ "$playerShot" -eq 1 ]; then
                    computerGoalie=$(shuf -i 1-3 -n 1)
                    if [ "$computerGoalie" -eq 3 ]; then
                        echo -e "\nShot Blocked!"
                        sleep 2
                        turn=0
                    else
                        echo -e "\n$teamPlayer SCORES!!"
                        sleep 2
                        turn=0
                        ((playerscore++))
                    fi
                elif [ "$playerShot" -eq 2 ]; then
                    computerGoalie=$(shuf -i 1-2 -n 1)
                    if [ "$computerGoalie" -eq 2 ]; then
                        echo -e "\nShot Blocked!"
                        sleep 2
                        turn=0
                    else
                        echo -e "\n$teamPlayer SCORES!!"
                        sleep 2
                        turn=0
                        ((playerscore++))
                    fi
                else
                    computerGoalie=$(shuf -i 1-4 -n 1)
                    if [ "$computerGoalie" -eq 4 ]; then
                        echo -e "\nShot Blocked!"
                        sleep 2
                        turn=0
                    else
                        echo -e "\n$teamPlayer SCORES!!"
                        sleep 2
                        turn=0
                        ((playerscore++))
                    fi
                fi
            fi
                    
        else
            ((totalkickscomputer++))
            echo -e "\nComputer choosing shot"
            computerChoice=$(shuf -i 1-3 -n 1)
            case $computerChoice in
                1)
                    echo -e "\nComputer chooses normal shot"
                    sleep 2
                    playerGoalie=$(shuf -i 1-3 -n 1)
                    if [ "$playerGoalie" -eq 3 ]; then
                        echo "Shot Blocked!"
                        sleep 2
                        turn=1
                    else
                        echo -e "\n$teamComputer SCORES!!"
                        sleep 2
                        turn=1
                        ((computerscore++))
                    fi
                    ;;
                2)
                    echo -e "\nComputer chooses stutter step shot"
                    sleep 2
                    playerGoalie=$(shuf -i 1-2 -n 1)
                    if [ "$playerGoalie" -eq 1 ]; then
                        echo -e "\nShot Blocked!"
                        sleep 2
                        turn=1
                    else
                        echo -e "\n$teamComputer SCORES!!"
                        sleep 2
                        turn=1
                        ((computerscore++))
                    fi
                    ;;
                3)
                    echo -e "\nComputer chooses chip shot"
                    sleep 2
                    playerGoalie=$(shuf -i 1-4 -n 1)
                    if [ "$playerGoalie" -eq 3 ]; then
                        echo -e "\nShot Blocked!"
                        sleep 2
                        turn=1
                    else
                        echo -e "\n$teamComputer SCORES!"
                        sleep 2
                        turn=1
                        ((computerscore++))
                    fi
                    ;;
            esac
        fi
    
    done


done
