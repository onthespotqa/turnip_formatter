require 'turnip_formatter/step_template/base'
require 'rspec/core/formatters/snippet_extractor'

module TurnipFormatter
  module StepTemplate
    class Source < Base
      on_failed :build

      def self.css
        <<-EOS
          pre.source {
              font-size: 12px;
              font-family: monospace;
              background-color: #073642;
              color: #dddddd;
          }

          pre.source code.ruby {
              padding: 0.1em 0 0.2em 0;
          }

          pre.source code.ruby .linenum {
              width: 75px;
              color: #fffbd3;
              padding-right: 1em;
          }

          pre.source code.ruby .offending {
              background-color: gray;
          }
        EOS
      end

      def build(example)
        code = extractor.snippet([location(example)])
        JSONBuilder::Compiler.generate do
          code code
        end
      end

      private

        def location(example)
          formatted_backtrace(example).first
        end

        def extractor
          @extractor ||= ::RSpec::Core::Formatters::SnippetExtractor.new
        end
    end
  end
end
