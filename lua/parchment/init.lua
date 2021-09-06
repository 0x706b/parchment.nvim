local lush = require 'lush'
local hsl  = lush.hsl

local c = {
  bg = hsl('#f1ede6'),
  bg0 = hsl('#F3ECE5'),
  bg1 = hsl('#e8e3df'),
  bg2 = hsl('#e9e3d0'),
  bg3 = hsl('#d4ccc6'),
  fg = hsl('#000000'),
  fg0 = hsl('#323232'),
  fg1 = hsl('#4A453F'),
  fg2 = hsl('#4A453F').li(20),
  fg3 = hsl('#9c9793'),

  n = {
    black = hsl('#000000'),
    -- red = hsl('#FF675D'),
    red = hsl('#ec444f'),
    yellow = hsl('#9E7400'),
    blue = hsl('#4190F7'),
    cyan = hsl('#2E998E'),
    green = hsl('#62B135'),
    magenta = hsl('#BA65DB'),
    white = hsl('#DDDDDD')
  },

  b = {
    black = hsl('#505050'),
    red = hsl('#e41507'),
    blue = hsl('#2981ca'),
    yellow = hsl('#E6BB00'),
    cyan = hsl('#20DDDD'),
    green = hsl('#329033'),
    magenta = hsl('#9805AE'),
    white = hsl('#ffffff')
  },

  git = {
    add    = hsl('#329033'),
    delete = hsl('#ec444f'),
    change = hsl('#2981ca')
  },

  d = {
    green = hsl('#194e00'),
    yellow = hsl('#cd9731')
  },
}

---@diagnostic disable: undefined-global
local theme = lush(function ()
  return {
    Normal { fg = c.fg, bg = c.bg },
    NormalTransparent { fg = c.fg },
    Comment { fg = c.b.green },
    Operator { fg = c.b.red, gui = 'bold' },
    Delimiter { fg = c.n.red },
    Visual { bg = c.bg3 },
    CursorLine { bg = c.bg1 },
    SignColumn { bg = c.bg1 },
    LineNr { fg = c.fg, bg = c.bg1 },
    CursorLineNr { bg = c.bg1 },
    MatchParen { bg = c.b.yellow },
    Directory {},
    EndOfBuffer { fg = c.fg3 },
    Whitespace { fg = c.fg3 },
    VertSplit { fg = c.fg3 },

    Error { fg = c.b.red, gui = 'bold' },
    ErrorMsg { fg = c.b.red, gui = 'bold' },
    Warning { fg = c.n.yellow, gui = 'bold' },
    WarningMsg { fg = c.n.yellow, gui = 'bold' },
    MoreMsg { fg = c.b.green, gui = 'bold' },

    Search { bg = c.b.yellow },
    IncSearch { bg = c.b.yellow },

    Pmenu { bg = c.bg1 },
    PmenuSel { bg = c.bg3 },
    PmenuSbar { bg = c.bg3 },
    PmenuThumb { bg = c.fg3 },

    TabLine { fg = c.fg3 },
    TabLineSel { fg = c.fg },
    TabLineFill { fg = c.fg3 },

    StatusLine { fg = c.fg1, bg = c.bg1 },

    PreProc { gui = 'bold' },
    Keyword { gui = 'bold' },
    Constant {},
    Identifier {},
    Special { gui = 'bold' },
    Function {},
    Statement { gui = 'bold' },
    String { fg = c.d.green },
    Number { fg = c.b.blue },
    Type { fg = c.b.blue, gui = 'bold' },
    Title { gui = 'bold' },
    Underlined { gui = 'underline' },

    GitSignsAdd { SignColumn, fg = c.git.add },
    GitSignsDelete { SignColumn, fg = c.git.delete },
    GitSignsChange { SignColumn, fg = c.git.change },

    DiffAdd { bg = c.n.green.li(50) },
    DiffDelete { bg = c.n.red.li(50) },
    DiffChange { bg = c.n.blue.li(50) },
    DiffText { bg = c.n.blue.li(50), gui = 'underline' },

    CocHighlightText { gui = 'underline,bold' },
    CocErrorHighlight { sp = c.b.red, gui = 'undercurl' },
    CocWarningHighlight { sp = c.n.yellow, gui = 'undercurl' },
    CocInfoHighlight { sp = c.b.blue, gui = 'undercurl' },
    CocHintHighlight { sp = c.b.blue, gui = 'undercurl' },
    CocErrorSign { fg = c.b.red, bg = c.bg1 },
    CocWarningSign { fg = c.n.yellow, bg = c.bg1 },
    CocInfoSign { fg = c.b.blue, bg = c.bg1 },
    CocHintSign { fg = c.b.blue, bg = c.bg1 },
    HighlightedyankRegion { fg = c.bg, bg = c.n.blue, gui = 'bold' },
    -- typescript
    typescriptObjectLabel { fg = c.fg },
    typescriptCall { fg = c.fg, gui = 'italic' },
    typescriptOperator { fg = c.n.red, gui = 'bold' },
    typesciptTypeReference { Type },
    typescriptTypeParameter { Type },
    typescriptTypeReference { Type },
    typescriptTypeParameter { Type },
    typescriptArrowFunc { Statement },
    typescriptParens { Delimiter },
    typescriptBraces { Delimiter },
    typescriptArrowFuncArg { typescriptCall },
    typescriptTypeBrackets { Delimiter },
    typescriptDotNotation { Delimiter },
    typescriptTypeAnnotation { Delimiter },
    typescriptBinaryOp { typescriptOperator },
    typescriptTernaryOp { typescriptOperator },
    typescriptTypeQuery { typescriptOperator },
    typescriptMappedIn { typescriptOperator },
    typescriptAssign { typescriptOperator },
    typescriptUnaryOp { typescriptOperator },
    typescriptBracket { Delimiter },
    typescriptPredefinedType { Special },
    typescriptTypeArguments { Delimiter },
    typescriptInterfaceName { Type },
    typescriptClassName { Type },
    typescriptAliasDeclaration { Type },
    typescriptNull { Number },
    typescriptBoolean { Number },
    tsxIntrinsicTagName { Special },
    tsxTagName { Type },
    tsxTag { Delimiter },
    tsxCloseTag { Delimiter },
    tsxCloseString { Delimiter },
    tsxAttrib { NormalTransparent },
    tsxEqual { Delimiter },
    typescriptDocNotation { fg = c.b.green, gui = 'bold,italic' },
    typescriptDocTags { typescriptDocNotation },
    jsxTagName { Special },
    jsxComponentName { Type },
    jsxOpenPunct { Delimiter },
    jsxClosePunct { Delimiter },
    jsxCloseString { Delimiter },
    jsxAttrib { NormalTransparent },
    Parchment { lush = c }
  }
end)

require 'parchment.build'.build(c)

return theme

--[[
   [ .mtk1 { color: #000000; }
   [ .mtk2 { color: #f1ede6; }
   [ .mtk3 { color: #329033; }
   [ .mtk4 { color: #448c27; }
   [ .mtk5 { color: #960000; }
   [ .mtk6 { color: #660000; }
   [ .mtk7 { color: #e41507; }
   [ .mtk8 { color: #2981ca; }
   [ .mtk9 { color: #194e00; }
   [ .mtk10 { color: #808080; }
   [ .mtk11 { color: #ec444f; }
   [ .mtk12 { color: #eaebe6; }
   [ .mtk13 { color: #aaaaaa; }
   [ .mtk14 { color: #202020; }
   [ .mtk15 { color: #ffffdd; }
   [ .mtk16 { color: #ffdddd; }
   [ .mtk17 { color: rgba(150, 0, 0, 0.08); }
   [ .mtk18 { color: #ddffdd; }
   [ .mtk19 { color: #777777; }
   [ .mtk20 { color: #434343; }
   [ .mtk21 { color: #ddddff; }
   [ .mtk22 { color: #316bcd; }
   [ .mtk23 { color: #cd9731; }
   [ .mtk24 { color: #cd3131; }
   [ .mtk25 { color: #800080; }
   [ .mtki { font-style: italic; }
   [ .mtkb { font-weight: bold; }
   [ .mtku { text-decoration: underline; text-underline-position: under; }
   ]]
