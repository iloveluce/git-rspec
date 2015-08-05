#!/usr/bin/env ruby

def quick_find(file_path)
    if /\bspec\b|_spec\.rb$/.match(file_path)
        puts "here"
        for path in code_paths(file_path)
            return path if File.file?(path)
        end

    elsif /\b(?:app|lib)\b/.match(file_path)
        puts "or here"
        spec_paths(file_path).each do | path |
            puts path
            puts "why"
            return path if File.file?(path)
        end
    end
    puts("RSpec: quick find failed")
end

def spec_paths(file_path)

    return [
        batch_replace(file_path, "\b(?:app|lib)\b", "spec"),
        batch_replace(file_path, "\b(\w+)\.rb", "\1_spec.rb") ,
        # batch_replace(file_path,
        #     (/\blib\b/, File.join("spec", "lib")), (/\b(\w+)\.rb/, /\1_spec.rb/))
    ]
end

def batch_replace(string, target, replacement)
    string = string.gsub(Regexp.new target, replacement)
    puts string
    return string
end
puts "usage: git rspec <commit-ish>..."
if ARGV[0]
    commit = ARGV[0]
else
    commit= "HEAD"
end
app_path="cd `git rev-parse --show-toplevel`"
result = `#{app_path}`
file_paths_command = "git diff-tree --no-commit-id --name-only -r #{commit}"
file_paths = `#{file_paths_command}`
file_paths =  file_paths.split()
puts file_paths
for path in file_paths
    quick_find(path)
end






# def code_paths(file_path):
# 	file_path = re.sub(r"\b(\w+)_spec\.rb$", r"\1.rb", file_path)
# 	return [
# 	    re.sub(r"\bspec\b", "app", file_path),
# 	    re.sub(r"\bspec\b", "lib", file_path),
# 	    re.sub(r"\b{}\b".format(os.path.join("spec", "lib")), "lib", file_path)
# 	]