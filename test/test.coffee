assert = require './assert'

test "middle portion", ->
	assert.generates {
		showLines: 3,
		line: 3,
		column: 1
	}, '''
		a
		b
		c
		d
		e
	''', '''
		2| b
		3| c
		---^
		4| d
	'''


test "top portion", ->
	assert.generates {
		showLines: 4,
		line: 2,
		column: 1
	}, '''
		a
		b
		c
		d
		e
	''', '''
		1| a
		2| b
		---^
		3| c
		4| d
	'''

test "bottom portion", ->
	assert.generates {
		showLines: 4,
		line: 4,
		column: 1
	}, '''
		a
		b
		c
		d
		e
	''', '''
		2| b
		3| c
		4| d
		---^
		5| e
	'''

test "showLines less that total lines", ->
	assert.generates {
		showLines: 4,
		line: 3,
		column: 1
	}, '''
		a
		b
		c
	''', '''
		1| a
		2| b
		3| c
		---^
	'''

test "showLines is even", ->
	assert.generates {
		showLines: 4,
		line: 3,
		column: 1
	}, '''
		a
		b
		c
		d
		e
	''', '''
		1| a
		2| b
		3| c
		---^
		4| d
	'''

test "pad line numbers", ->
	assert.generates {
		showLines: 2,
		line: 10,
		column: 1
	}, '''
		a
		b
		c
		d
		e
		f
		g
		h
		i
		j
		k
	''', '''
		 9| i
		10| j
		----^
	'''

test "indent", ->
	assert.generates {
		showLines: 2,
		indent: '**'
		line: 2,
		column: 1
	}, '''
		a
		b
		c
	''', '''
		**1| a
		**2| b
		**---^
	'''