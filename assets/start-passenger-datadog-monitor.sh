#!/bin/sh
RETVAL=0
prog="passenger-datadog-monitor"
PIDFILE=/app/tmp/$prog.pid


start() {
        printf "%s\n" "Starting $prog: "
        PID=`nohup /app/bin/passenger-datadog-monitor > /app/tmp/passenger-datadog-monitor.log 2>&1 & echo $!`
        RETVAL=$?
        if [ $RETVAL -eq 0 ]; then
          echo "$PID" > $PIDFILE
          printf "%s\n" "Ok"
        fi
        return $RETVAL
}

return start()
