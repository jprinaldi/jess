(clear)

(deftemplate cell (slot row) (slot col) (slot value))

(deffacts init
	(cell (row 1) (col 1) (value 1))
	(cell (row 1) (col 2) (value 0))
	(cell (row 1) (col 3) (value 0))
	(cell (row 1) (col 4) (value 0))
	(cell (row 2) (col 1) (value 0))
	(cell (row 2) (col 2) (value 4))
	(cell (row 2) (col 3) (value 0))
	(cell (row 2) (col 4) (value 0))
	(cell (row 3) (col 1) (value 2))
	(cell (row 3) (col 2) (value 3))
	(cell (row 3) (col 3) (value 1))
	(cell (row 3) (col 4) (value 4))
	(cell (row 4) (col 1) (value 0))
	(cell (row 4) (col 2) (value 0))
	(cell (row 4) (col 3) (value 0))
	(cell (row 4) (col 4) (value 0))
	)

(defrule put-1
	?fact <- (cell (row ?r1) (col ?c1) (value 0))
	(cell (row ?r2) (col ?c2) (value 2 &: (or (eq ?r2 ?r1) (eq ?c2 ?c1))))
	(cell (row ?r3) (col ?c3) (value 3 &: (or (eq ?r3 ?r1) (eq ?c3 ?c1))))
	(cell (row ?r4) (col ?c4) (value 4 &: (or (eq ?r4 ?r1) (eq ?c4 ?c1))))
	=>
	(assert (cell (row ?r1) (col ?c1) (value 1)))
	(retract ?fact)
	)

(defrule put-2
	?fact <- (cell (row ?r1) (col ?c1) (value 0))
	(cell (row ?r2) (col ?c2) (value 1 &: (or (eq ?r2 ?r1) (eq ?c2 ?c1))))
	(cell (row ?r3) (col ?c3) (value 3 &: (or (eq ?r3 ?r1) (eq ?c3 ?c1))))
	(cell (row ?r4) (col ?c4) (value 4 &: (or (eq ?r4 ?r1) (eq ?c4 ?c1))))
	=>
	(assert (cell (row ?r1) (col ?c1) (value 2)))
	(retract ?fact)
	)

(defrule put-3
	?fact <- (cell (row ?r1) (col ?c1) (value 0))
	(cell (row ?r2) (col ?c2) (value 1 &: (or (eq ?r2 ?r1) (eq ?c2 ?c1))))
	(cell (row ?r3) (col ?c3) (value 2 &: (or (eq ?r3 ?r1) (eq ?c3 ?c1))))
	(cell (row ?r4) (col ?c4) (value 4 &: (or (eq ?r4 ?r1) (eq ?c4 ?c1))))
	=>
	(assert (cell (row ?r1) (col ?c1) (value 3)))
	(retract ?fact)
	)

(defrule put-4
	?fact <- (cell (row ?r1) (col ?c1) (value 0))
	(cell (row ?r2) (col ?c2) (value 1 &: (or (eq ?r2 ?r1) (eq ?c2 ?c1))))
	(cell (row ?r3) (col ?c3) (value 2 &: (or (eq ?r3 ?r1) (eq ?c3 ?c1))))
	(cell (row ?r4) (col ?c4) (value 3 &: (or (eq ?r4 ?r1) (eq ?c4 ?c1))))
	=>
	(assert (cell (row ?r1) (col ?c1) (value 4)))
	(retract ?fact)
	)

(watch all)
(reset)
(run)
(facts)
