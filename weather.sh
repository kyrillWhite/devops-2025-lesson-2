#!/usr/bin/bash

CITY=$1

{ read -r TEMP; read -r HUMID; read -r DATE; } < <(
  curl -s https://wttr.in/${CITY}?format=j1 \
    | jq -r '.current_condition[0] | .temp_C, .humidity, .localObsDateTime')

echo """
<html>
  <body>
    <h2>
      Weather in <b>${CITY}</b>
    </h2>
    <p>
      Observe time: ${DATE}
      <br />
      Temperature: ${TEMP}C
      <br />
      Humidity: ${HUMID}%
      <br />
    </p>
  </body>
</html>
"""
