require 'test_helper'

class SiteLayoutTestTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", "http://news.railstutorial.org/", text:"News"
    get signup_path
    assert_select "title", full_title("Sign Up")
  end
end
