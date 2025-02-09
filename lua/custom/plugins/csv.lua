return {
  'hat0uma/csvview.nvim',
  ---@module "csvview"
  ---@type CsvView.Options
  opts = {
    parser = {
      --- The number of lines that the asynchronous parser processes per cycle.
      --- This setting is used to prevent monopolization of the main thread when displaying large files.
      --- If the UI freezes, try reducing this value.
      --- @type integer
      async_chunksize = 50,

      --- The delimiter character
      --- You can specify a string, a table of delimiter characters for each file type, or a function that returns a delimiter character.
      --- e.g:
      ---  delimiter = ","
      ---  delimiter = function(bufnr) return "," end
      ---  delimiter = {
      ---    default = ",",
      ---    ft = {
      ---      tsv = "\t",
      ---    },
      ---  }
      --- @type CsvView.Options.Parser.Delimiter
      delimiter = {
        default = ',',
        ft = {
          tsv = '\t',
        },
      },

      --- The quote character
      --- If a field is enclosed in this character, it is treated as a single field and the delimiter in it will be ignored.
      --- e.g:
      ---  quote_char= "'"
      --- You can also specify it on the command line.
      --- e.g:
      --- :CsvViewEnable quote_char='
      --- @type string
      quote_char = '"',

      --- The comment prefix characters
      --- If the line starts with one of these characters, it is treated as a comment.
      --- Comment lines are not displayed in tabular format.
      --- You can also specify it on the command line.
      --- e.g:
      --- :CsvViewEnable comment=#
      --- @type string[]
      comments = {
        -- "#",
        -- "--",
        -- "//",
      },
      keymaps = {
        -- Text objects for selecting fields
        textobject_field_inner = { 'if', mode = { 'o', 'x' } },
        textobject_field_outer = { 'af', mode = { 'o', 'x' } },
        -- Excel-like navigation:
        -- Use <Tab> and <S-Tab> to move horizontally between fields.
        -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
        -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
        jump_next_field_end = { '<Tab>', mode = { 'n', 'v' } },
        jump_prev_field_end = { '<S-Tab>', mode = { 'n', 'v' } },
        jump_next_row = { '<Enter>', mode = { 'n', 'v' } },
        jump_prev_row = { '<S-Enter>', mode = { 'n', 'v' } },
      },
    },
    cmd = { 'CsvViewEnable', 'CsvViewDisable', 'CsvViewToggle' },
  },
}
