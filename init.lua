local config = require("kamaizen.config")

local M = {}

function M.setup(user_config)
	config.setup(user_config)

	local client = vim.lsp.start_client(config.config)

	if not client then
		vim.notify("KamaiZen failed to connect")
		return
	end

	vim.api.nvim_create_autocmd("FileType", {
		pattern = config.config.filetypes,
		callback = function()
			vim.lsp.buf_attach_client(0, client)
		end,
	})
end

return M
