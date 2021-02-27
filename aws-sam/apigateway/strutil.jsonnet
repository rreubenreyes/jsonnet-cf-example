local stripCurlyBraces(str) = std.stripChars(str, '{}');
local capitalize(str) = std.asciiUpper(std.substr(str, 0, 1)) + std.substr(str, 1, std.length(str) - 1);
local splitPath(pathStr) = std.split(pathStr, '/');

local pathToTitleCase(pathArr, end) = std.join(
  '',
  std.slice(
    std.map(
      capitalize, std.filterMap(function(x) x != '', stripCurlyBraces, std.prune(pathArr)),
    ), 0, end, 1
  )
);

{
  stripCurlyBraces:: stripCurlyBraces,
  capitalize:: capitalize,
  splitPath:: splitPath,
  pathToTitleCase:: pathToTitleCase,
}
