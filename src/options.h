#ifndef OPTIONS_H
#define OPTIONS_H

/* The default name for conf, log, pid files */
#define DEFAULTNAME "bopm"

/* file extensions */
/* config */
#define CONFEXT "conf"

/* log file */
#define LOGEXT "log"

/* PID file */
#define PIDEXT "pid"

/* Maximum commands to queue */
#define COMMANDMAX 32

/* How long (in seconds) between rebuilds of the negative cache.  The negcache
 * is only rebuilt to free up memory used by entries that are too old.  You
 * probably don't need to tweak this unless you have huge amounts of people
 * connecting (hundreds per minute).  Default is 12 hours.
 */
#define NEG_CACHE_REBUILD (60 * 60 * 12)

/* Defines time in which bot will timeout * if no data is received
 * (default 15 min) */
#define NODATA_TIMEOUT 900

#endif /* OPTIONS_H */
