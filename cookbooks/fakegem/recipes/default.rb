directory "/tmp/fakegem" do
  owner "root"
    group "root"
    mode "0755"
    action :create
end
directory "/tmp/fakegem/lib" do
  owner "root"
    group "root"
    mode "0755"
    action :create
end

directory "/tmp/fakegem/lib/loader" do
  owner "root"
    group "root"
    mode "0755"
    action :create
end

cookbook_file "/tmp/fakegem/lib/loader.rb" do
  source "loader.rb"
  mode "644"
  owner "root"

end
cookbook_file "/tmp/fakegem/lib/loader/version.rb" do
  source "version.rb"
  mode "644"
  owner "root"

end

cookbook_file "/tmp/fakegem/Gemfile" do
  source "Gemfile"
  mode "644"
  owner "root"

end

cookbook_file "/tmp/fakegem/Gemfile.lock" do
  source "Gemfile.lock"
  mode "644"
  owner "root"

end

cookbook_file "/tmp/fakegem/loader.gemspec" do
  source "loader.gemspec"
  mode "644"
  owner "root"

end



execute "create bundled gems" do
  command "cd /tmp/fakegem;bundle install --deployment"
  only_if do  
    Gem.source_index.find_name('passenger').empty?
  end
end

ruby_block "load dependencies" do
  block do
    Dir.glob("/tmp/fakegem/vendor/bundle/ruby/1.8/cache/*.gem").each do |gem|
      next if gem =~ /^passenger/
      Chef::Log.info("installing #{gem}")
      `gem install #{gem}`
    end
  end 
  
end



