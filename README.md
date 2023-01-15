# sinatra-rax

`sinatra-rax` is a minimal and modern Ruby/IRB console for Sinatra apps.

## Goals

1. Call `app.get '/'` to trigger a request
2. Easily call Sinatra helpers, such as `app.current_weather`
3. Set ivars like `app.set(name: 'bob', age: 25)`
4. Use templates like `app.erb :test` (using `name` from above)
5. Set ivars like `@name='mike'`, then `app.erb :test, scope: self`
6. Normal access to database calls, like `Sponsor[2]` to show a record
7. Call `routes` to show list sorted by route
8. Call `props` to show application settings

## Install

Install via `rubygems` with:

```
gem install sinatra-rax
```

Or, add to your `Gemfile` using `Bundler` with:

```
bundle add sinatra-rax
```

This will add an executable in your path, which you can launch by typing `rax`.

## Examples

```ruby
project/api> rax

development(main):001:0> app # an application instance (Sinatra::Application.new!)
=> #<Sinatra::Application:0x0000000108b1ae50
 @app=Sinatra::Application,
 @default_layout=:layout,
 @pinned_response=nil,
 @preferred_extension=nil,
 @request=#<Sinatra::Request:0x0000000108b1a838 @env={}, @params=nil>,
 @response=
  #<Sinatra::Response:0x0000000108addbb8
   @block=nil,
   @body=[],
   @buffered=true,
   @headers={},
   @length=0,
   @status=200,
   ...
 @template_cache=#<Tilt::Cache:0x0000000108b1aae0 @cache={}>>

development(main):002:0> app.app # the application class
=> Sinatra::Application

development(main):003:0> app.get '/ping' # mock a request

{
  "pong": true
}

=> #<Rack::MockResponse:0x00000001088f94c8
 @block=nil,
 @body=["{\n  \"pong\": true\n}"],
 @buffered=true,
 @cookies={},
 @errors="",
 @headers={"Content-Type"=>"application/json", "Content-Length"=>"18"},
 @length=18,
 @original_headers={"Content-Type"=>"application/json", "Content-Length"=>"18"},
 @status=200,
 ...

development(main):004:0> app.current_weather # call a helper method
=> "sunny and warm"

development(main):005:0> app.set(name: 'bob', age: 25); app.instance_variables # set instance vars
=>
[:@default_layout,
 :@preferred_extension,
 :@app,
 :@template_cache,
 :@pinned_response,
 :@request,
 :@response,
 :@_rack_test_sessions,
 :@_rack_test_current_session,
 :@name,
 :@age]

development(main):006:0> app.erb "Hello, <%= @name %> (age <%= @age %>)" # render a template
 => "Hello, bob (age 25)"

development(main):007:0> app.set(name: 'joe', age: 50).erb("Hello, <%= @name %> (age <%= @age %>)") # one step
=> "Hello, joe (age 50)"

development(main):008:0> @name = "waldo"; @age = 19; app.erb "Hello, <%= @name %> (age <%= @age %>)", scope: self # scoping
=> "Hello, waldo (age 19)"

development(main):009:0> Sponsor[2] # direct access to db models
=> #<Sponsor:0x00000001092bad40
 id: 2,
 slug: "tesla",
 name: "Tesla",
 link: "https://tesla.com",
 email: "info@tesla.com",
 logo: "tesla-logo.png",
 title: "Tesla",
 heading: "Accelerating sustainable transport and electric technology",
 subheading: nil,
 created_at: 2023-01-12 05:06:35.751006 UTC,
 updated_at: 2023-01-12 05:06:35.751006 UTC>

development(main):010:0> routes # show sorted routes and methods
get     "/"
post    "/access"
post    "/signin"
post    "/signin/assignpin"
post    "/signin/changepin"
post    "/signin/checkpin"
delete  "/users"
get     "/users"
get     "/users/:id"
=> nil

development(main):011:0> props # show app settings
absolute_redirects    true
add_charset           ["application/javascript", "application/xml", "application/xhtml+xml", /^text\//]
app_file              "/Users/shreeve/project/api/api.rb"
bind                  "localhost"
default_content_type  "text/html"
default_encoding      "utf-8"
dump_errors           true
empty_path_info       nil
environment           :development
handler_name          nil
lock                  false
logging               false
method_override       true
mustermann_opts       {}
port                  4567
prefixed_redirects    false
protection            {:reaction=>:deny, :except=>[:json_csrf, :frame_options, :xss_header, :http_origin]}
public                nil
public_dir            "/Users/shreeve/project/api/public"
public_folder         "/Users/shreeve/project/api/public"
quiet                 false
raise_errors          false
reload_templates      true
reloader              true
root                  "/Users/shreeve/project/api"
run                   false
running_server        nil
server                ["thin", "falcon", "puma", "HTTP", "webrick"]
session_secret        "--secret--"
session_store         Rack::Protection::EncryptedCookie
sessions              false
show_exceptions       false
static                false
static_cache_control  false
strict_paths          false
threaded              true
traps                 true
use_code              false
views                 "/Users/shreeve/project/api/views"
x_cascade             true
=> nil
```

## License

This software is licensed under terms of the MIT License.
