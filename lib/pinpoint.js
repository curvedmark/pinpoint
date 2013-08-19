module.exports = pinpoint;

function pinpoint(input, options) {
	if (!options) options = {};
	var showLines = options.showLines || 9;
	var indent = options.indent || '';
	var line = options.line - 1;
	var column = options.column - 1;

	var lines = input.split(/\r\n|[\r\n]/);
	var length = lines.length;

	var start = line;
	var end = line + 1;
	for (var i = 0; i < showLines - 1; ++i) {
		if (i % 2) {
			if (end < length) ++end;
			else if (start > 0) --start;
			else break;
		} else {
			if (start > 0) --start;
			else if (end < length) ++end;
			else break;
		}
	}

	var maxDigits = end.toString().length;
	lines = lines.slice(start, end).map(function (line, i) {
		i += start + 1;
		return pad(i, maxDigits) + '| ' + line;
	});
	var arrowLine = repeat('-', maxDigits + 2 + column) + '^';
	lines.splice(line - start + 1, 0, arrowLine);

	return indent + lines.join('\n' + indent)
}

function pad(num, count) {
	return repeat(' ', count - num.toString().length) + num;
}

function repeat(str, count) {
	return new Array(count + 1).join(str);
}