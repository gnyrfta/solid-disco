#!/bin/bash
#Rename user_name -> user TRIES -> SCORE
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c";
SECRET_NUMBER=$(( $RANDOM % 1000 ));
TRIES=0;
echo $SECRET_NUMBER;
echo  "Enter your username:"
read USERNAME;
RESULT_USER_QUERY=$($PSQL "select user_name from users where user_name='$USERNAME'");
if [[ $RESULT_USER_QUERY == "" ]]
then
echo "Welcome, $USERNAME! It looks like this is your first time here."
RESULT_INSERT=$($PSQL "insert into users (user_name) values ('$USERNAME')");
else
GAMES_PLAYED=$($PSQL "select games_played from users where user_name='$USERNAME'");
BEST_GAME=$($PSQL "select best_game from users where user_name='$USERNAME'");
echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses." 
fi
echo "Guess the secret number between 1 and 1000:"
read GUESS

while ! [[ "$GUESS" =~ ^[0-9]+$ ]]
do
echo "That pattern does not begin with digits." 
read GUESS
done

while [[ $GUESS -ne $SECRET_NUMBER ]] 
do
TRIES=$(( $TRIES + 1 ))
if ! [[ "$GUESS" =~ ^[0-9]+$ ]]
then
echo "That is not an integer, guess again." 
read GUESS
elif [[ $GUESS -lt $SECRET_NUMBER ]]
then
echo "It's higher than that, guess again:"
read GUESS
elif [[ $GUESS -gt $SECRET_NUMBER ]]
then
echo "It's lower than that, guess again:"
read GUESS

fi
  while ! [[ "$GUESS" =~ ^[0-9]+$ ]]
  do
  echo "That pattern does not begin with digits." 
  read GUESS
  done
done
OLD_GAMES_PLAYED=$($PSQL "select games_played from users where user_name='$USERNAME'");
OLD_HIGHSCORE=$($PSQL "select best_game from users where user_name='$USERNAME'");
echo "This is old highscore: $OLD_HIGHSCORE";
echo "This is score: $TRIES";
NEW_GAMES_PLAYED=$(( $OLD_GAMES_PLAYED + 1 ));
RESULT_INSERT_GAMES_PLAYED=$($PSQL "update users set games_played=$NEW_GAMES_PLAYED where user_name='$USERNAME'");
if [[ $TRIES -lt $OLD_HIGHSCORE ]] || [[ $OLD_HIGHSCORE -eq 0 ]]
then
RESULT_INSERT_GAMES_PLAYED=$($PSQL "update users set best_game=$TRIES where user_name='$USERNAME'");
fi
echo "You guessed it in $TRIES tries. The secret number was $SECRET_NUMBER. Good job!"
