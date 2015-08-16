#! /bin/bash
# Crontab examples
# */1 *    * * *   root    bash /home/pi/ac/monitor.sh
# */5 *    * * *   root    gnuplot /home/pi/ac/gnuplot.cfg

# set the time formats used below
time=$(date +%F-%H:%M:%S)
day=$(date +%F)
gnu_time=$(date +%H:%M)

# Run the monitor.py script to see if the switch is activated or not
status=$(python ~pi/ac/monitor.py)
# Save the results to todays log file
echo "$time $gnu_time $status" >> /home/pi/ac/logs/$day.log

# Create the unique gnuplot file
cat /home/pi/ac/gnuplot > /home/pi/ac/gnuplot.cfg
echo "plot '/home/pi/ac/logs/$day.log' using 3:xtic(2) with boxes title '$day'" >> /home/pi/ac/gnuplot.cfg
