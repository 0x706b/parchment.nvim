local uv = vim.loop
local terms = {
  kitty     = {ext="conf"},
}

-- Format each entry in a table, and concatenate them into a single string
local function concat_format(t)
  return table.concat(vim.tbl_map(function(x)
    return string.format(x[1], x[2])
  end, t), "\n")
end

-- Get the directory where the melange plugin is located
local function get_dir()
  return debug.getinfo(1).source:match("@?(.*/)"):gsub("lua/parchment/$", "")
end

-- Write the contents of a buffer to a file
local function write_file(file, buf)
  local fd = assert(uv.fs_open(get_dir() .. file, 'w', 420))
  uv.fs_write(fd, buf, -1)
  uv.fs_write(fd, '\n', -1)
  assert(uv.fs_close(fd))
end

function terms.kitty.build(colors)
  return concat_format {
    {"background %s", colors.bg};
    {"foreground %s", colors.fg};
    {"cursor     %s", colors.n.red};
    {"url_color  %s", colors.b.blue};

    {"selection_background    %s", colors.fg};
    {"selection_foreground    %s", colors.bg};

    -- normal
    {"color0  %s",  colors.fg};
    {"color1  %s",  colors.n.red};
    {"color2  %s",  colors.b.green};
    {"color3  %s",  colors.n.yellow};
    {"color4  %s",  colors.n.blue};
    {"color5  %s",  colors.n.magenta};
    {"color6  %s",  colors.fg2};
    {"color7  %s",  colors.fg2};
    -- bright
    {"color8  %s", colors.fg2};
    {"color9  %s", colors.b.red};
    {"color10 %s", colors.fg2};
    {"color11 %s", colors.b.yellow};
    {"color12 %s", colors.b.blue};
    {"color13 %s", colors.n.magenta};
    {"color14 %s", colors.fg1};
    {"color15 %s", colors.fg1};
  }
end

local function build(colors)
  for k, v in pairs(terms) do
    write_file(
        string.format("/term/%s/parchment.%s", k, v.ext),
        v.build(colors)
    )
  end
end

return { build = build }
