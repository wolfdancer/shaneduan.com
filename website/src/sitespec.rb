require 'buildmaster'

class MySiteSpec < BuildMaster::SiteSpec
  def initialize
    root = File.dirname(__FILE__)
    @output_dir = File.join(root, 'output')
    @content_dir = File.join(root, 'content')
    @template_file = File.join(root, 'template.xhtml')
  end
  
  def center_class(content_path)
    if index_file? content_path
      return 'Content3Column'
    else
      return 'Content2Column'
    end
  end

  def index_file?(content_path)
    return content_path =~ /index/
  end
  
  def not_index_file?(content_path)
    return ! index_file?(content_path)
  end
  
  def release
    return '0.6.0'
  end
  
  def prerelease
    return 'n/a'
  end
  
  def snapshot
    return 'n/a'
  end
  
  def history(content_path)
    return content_path
  end
  
  def news_rss2
    return IO.read(File.join(@content_dir, 'news-rss2.xml'))
  end
end

site = BuildMaster::Site.new(MySiteSpec.new)
site.execute(ARGV)
