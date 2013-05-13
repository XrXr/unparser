require 'abstract_type'
require 'concord'
require 'parser/all'

# Library namespace
module Unparser

  EMPTY_STRING = ''.freeze

  # Unparse ast into string
  #
  # @param [Parser::Node] node
  #
  # @return [String]
  #
  # @api private
  #
  def self.unparse(node)
    buffer = Buffer.new
    Emitter.visit(node, buffer)
    buffer.content
  end
end # Unparser

require 'unparser/buffer'
require 'unparser/emitter'
require 'unparser/emitter/literal'
require 'unparser/emitter/literal/dynamic'
require 'unparser/emitter/literal/regexp'
require 'unparser/emitter/literal/dynamic_body'
require 'unparser/emitter/assignment'
require 'unparser/emitter/singleton'

Unparser::Emitter::REGISTRY.freeze