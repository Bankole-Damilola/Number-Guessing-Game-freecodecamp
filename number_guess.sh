#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN_FUNC () {

  echo "Enter your username:"
  read USERNAME

  USER_CHECK $USERNAME
  CHECKS=$?

  # echo "$CHECKS"

  if [[ $CHECKS = 0 ]]
  then
    USER_DETAILS=$($PSQL "SELECT name, count(*), min(games_trial) FROM guess_table INNER JOIN username USING(username_id) WHERE name = '$USERNAME' GROUP BY name")
    echo "$USER_DETAILS" | while IFS="|" read NAME GAMES_PLAYED BEST_GAME
    do
      echo "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    done
  else
    echo "Welcome, $USERNAME! It looks like this is your first time here."
  
  fi

  GUESS_GAMES $USERNAME

}

USER_CHECK () {

  USER_IN_DB_RESULT=$($PSQL "SELECT username_id FROM username WHERE name = '$1'")
  # echo "$USER_IN_DB_RESULT"
  
  if [[ -z $USER_IN_DB_RESULT ]]
  then
    INSER_NEW_USER=$($PSQL "INSERT INTO username(name) VALUES('$1')")

    if [[ $INSER_NEW_USER = "INSERT 0 1" ]]
    then
      return 1
    fi

  fi

  return 0
}

GUESS_GAMES () {

  RANDOM_NUM=$(($RANDOM % 1000))
  NUMBER_OF_GUESSES_MADE=1

  # echo "$RANDOM_NUM"
  echo "Guess the secret number between 1 and 1000:"
  read USER_GUESS
  until [[ $USER_GUESS = $RANDOM_NUM ]]
  do
    if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
    then
      echo  "That is not an integer, guess again:"

    elif [[ $USER_GUESS -lt $RANDOM_NUM ]]
    then
      echo "It's higher than that, guess again:"

    else
      echo "It's lower than that, guess again:"

    fi

    NUMBER_OF_GUESSES_MADE=$(($NUMBER_OF_GUESSES_MADE + 1))

    read USER_GUESS
  done

  GAME_DETAILS $1 $NUMBER_OF_GUESSES_MADE
  CHECK_GAME_DETAILS=$?

  if [[ $CHECK_GAME_DETAILS = 0 ]]
  then
    echo "You guessed it in $NUMBER_OF_GUESSES_MADE tries. The secret number was $RANDOM_NUM. Nice job!"
  
  fi

}

GAME_DETAILS () {

  USERNAME_ID=$($PSQL "SELECT username_id FROM username WHERE name = '$1'")

    if [[ -n $USERNAME_ID ]]
    then
      INSERT_TO_GUESS_TABLE=$($PSQL "INSERT INTO guess_table(username_id, games_trial) VALUES($USERNAME_ID, $2)")
      
      if [[ $INSERT_TO_GUESS_TABLE = "INSERT 0 1" ]]
      then
        return 0
      
      fi
    fi

    return 1

}

MAIN_FUNC
