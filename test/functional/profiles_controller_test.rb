require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:faheema).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render a 404 on profile not found" do
  	get :show, id: "doesnt exist"
  	assert_response :not_found
  end

  test "that variables are assigned on successful profile viewing" do
  	get :show, id: users(:faheema).profile_name
  	assert assigns(:user)
  	assert_not_empty assigns(:statuses)
  end

  test "Only Shows the correct users statuses" do
  	get :show, id: users(:faheema).profile_name
  	assigns(:statuses).each do |status|
  		assert_equal users(:faheema), status.user
  	end
  end
end
