$:.unshift File.dirname(__FILE__)

require 'diffy'

module AresMUSH
  module Website
        
    def self.plugin_dir
      File.dirname(__FILE__)
    end
 
    def self.shortcuts
      {}
    end
 
    def self.load_plugin
      self
    end
 
    def self.unload_plugin
    end
 
    def self.get_cmd_handler(client, cmd, enactor)       
      case cmd.root      
      when "website"
        return WebsiteCmd
      end
      
      nil
    end

    def self.get_event_handler(event_name) 
      case event_name
        when "WebCmdEvent"
          return WebCmdEventHandler
        when "ConfigUpdatedEvent", "GameStartedEvent"
          return WebConfigUpdatedEventHandler
      end
      
      nil
    end
    
    
    def self.get_web_request_handler(request)
      case request.cmd
        
      ## WIKI
      when "createWiki"
        return CreateWikiPageRequestHandler
      when "editWiki"
        return EditWikiPageRequestHandler
      when "wikiPage"
        return GetWikiPageRequestHandler
      when "wikiTagList"
        return GetWikiTagListRequestHandler
      when "wikiPageList"
        return GetWikiPageListRequestHandler
      when "wikiPageSource"
        return GetWikiPageSourceRequestHandler
      when "wikiPreview"
        return WikiPreviewRequestHandler
      when "wikiTag"
        return GetWikiTagRequestHandler

      ## FILES
      when "deleteFile"
        return FileDeleteRequestHandler
      when "files"
        return GetFilesRequestHandler
      when "updateFile"
        return FileUpdateRequestHandler
      when "uploadFile"
        return FileUploadRequestHandler

      ## LOGS
      when "logs"
        return GetLogsRequestHandler
      when "log"
        return GetLogRequestHandler
      
      ## TINKER
      when "getTinker"
        return GetTinkerRequestHandler
      when "saveTinker"
        return SaveTinkerRequestHandler
      
        
      ## MISC
      when "config"
        return GetConfigRequestHandler
      when "game"
        return GetGameInfoRequestHandler
      when "recentChanges"
        return GetRecentChangesRequestHandler
      when "sidebarInfo"
        return GetSidebarInfoRequestHandler
      end
      nil
    end
    
  end
end
