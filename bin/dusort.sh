#!/bin/sh
#
# sort a "du" listing by directory size
# usage:  du | dusort

FILES=
TFORM=0
while test $# -ge 1; do
    case $1 in
    -t)	TFORM=1; ;;
    *)  FILES="$FILES $1"; ;;
    esac
    shift
done


#build complex keys so that subdirectories move with parent
awk '{ size[ $2] = $1 }
END {
	for (i in size) {
		printf "%s ", i;
		oj = 1; l = length(i);
		#build up an aggregate key from all its parents
		for (j = 1; j <= l; ) {
			for (; j <= l; j++) if (substr(i,j,1) == "/") break;
			name = substr(i, oj, j-oj);
			j++;
			printf "%d ", size[name];
		}
		#print itself once more to compare ahead of its children
		printf "%d\n", size[i];
	}
}'  $FILES |

#sort numerically
sort -r -n -k 1,1 -k 2,2 -k 3,3 -k 4,4 -k 5,5 -k 6,6 -k 7,7 -k 8,8 |

#just print the path and its size. In two popular flavors.
awk '{if('$TFORM') printf "%s(%d)\n", $1, $NF; else
		   printf "%8d\t%s\n", $NF, $1}' |

#indent directories
# This awk could be combined with the previous one
# but it really performs a separate function.
# Cut it off and put it in a separate file called 'ind' if you like it.
#
# ind: indent output from du or find
#
awk '
BEGIN {blank="                                                          "}
{
    for (s=length; s > 0 && substr($0, s, 1) > " " ; s--)
	;
    for (e=length; substr($0, e, 1) != "/" && e > s+1; e--)
	;
    print  substr($0, 1, s) substr(blank, 1, e-s-1) substr($0, e);
}
'

