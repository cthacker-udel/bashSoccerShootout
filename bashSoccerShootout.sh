
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
    
    if [ "$coinFlip" -eq 1 -a "$yourFlipGuess" -eq 1 ]; then
        echo "You have won the flip!, you get to shoot first"
        turn=1
    else
        echo "You have lost the flip!, you get to shoot second"
        turn=0
    fi


done
