### BEGIN INIT INFO

# Provides:          jbsl
# Required-Start:
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description:  JetBrains products server Licensea
### END INIT INFO

IDEA_HOME="/opt/idea"
DIR_LICSRV=$IDEA_HOME"/license_server"
DAEMON='/home/evseevvd/Documents/IDEAS/IntelliJIDEALicenseServer_linux_amd64'
PID_FILE="/var/run/jbsl.pid"
PID=""
NAME=jbsl

DESC='JetBrains products server license'

#test -f $DAEMON || exit 0
. /lib/lsb/init-functions

case "$1" in

  start)
        log_daemon_msg "Starting $DESC" "$NAME"
        if start-stop-daemon -Sbvmx $DAEMON -p $PID_FILE; then
	    #$PID=`cat $PID_FILE`
            log_end_msg 0
        else
            log_end_msg 1
        fi
  ;;
  stop)
        log_daemon_msg "Stopping $DESC" "$NAME"
        if start-stop-daemon -Kvp $PID_FILE; then
            log_end_msg 0
        else
            log_end_msg 1
		#kill -9 $PID
        fi
  ;;
  restart|force-reload)
        log_daemon_msg "Restarting $DESC" "$NAME"
        start-stop-daemon --stop --quiet --retry 5 --exec $DAEMON
        if start-stop-daemon --start --quiet --exec $DAEMON; then
            log_end_msg 0
        else
            log_end_msg 1
        fi
  ;;
  status)
        status_of_proc "$DAEMON" "$NAME" && exit 0 || exit $?
  ;;
  *)
       echo "Usage: /etc/init.d/$NAME {start|stop|restart|force-reload|status}" >&2
       exit 1
  ;;
esac
exit 0
