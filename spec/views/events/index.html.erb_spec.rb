require 'spec_helper'

describe 'events/index' do
  before(:each) do
    @event1 = stub_model(Event, name: 'EuroAsia Scrum',
                         category: 'Scrum',
                         description: 'EuroAsia Scrum and Pair hookup',
                         is_all_day: false,
                         from_date: 'Mon, 17 Feb 2013',
                         from_time: '2000-01-01 09:00:00 UTC',
                         to_date: 'Mon, 17 Feb 2013',
                         to_time: '2000-01-01 09:30:00 UTC',
                         repeats: 'daily',
                         repeats_every_n_days: 1,
                         repeat_ends: 'never',
                         repeat_ends_on: 'Mon, 17 Jun 2014',
                         time_zone: 'Eastern Time (US & Canada)')

    @event2 = stub_model(Event, name: 'Daily Scrum',
                         category: 'Scrum',
                         description: 'Daily Scrum and Pair hookup',
                         is_all_day: false,
                         from_date: 'Mon, 17 Feb 2013',
                         from_time: '2000-01-01 16:00:00 UTC',
                         to_date: 'Mon, 17 Feb 2013',
                         to_time: '2000-01-01 16:30:00 UTC',
                         repeats: 'daily',
                         repeats_every_n_days: 1,
                         repeat_ends: 'never',
                         repeat_ends_on: 'Mon, 17 Jun 2014',
                         time_zone: 'Eastern Time (US & Canada)')

    @events = [@event1, @event2]
    assign(:events, @events)
  end

  context 'for signed in and not signed in users' do
    it 'renders a list of events' do
      render
      rendered.should have_text 'AgileVentures Events'
      @events.each do |event|
        rendered.should have_link event.name, :href => event_path(event)
      end

    end
  end

  context 'for signed in users' do
    before :each do
      view.stub(:user_signed_in?).and_return(true)
    end
    it 'should render a "New Event" link' do
      render
      rendered.should have_link 'New Event', :href => new_event_path
    end
  end

  context 'for visitors' do
    before :each do
      view.stub(:user_signed_in?).and_return(false)
    end
    it 'should NOT render a "New Event" link' do
      render
      rendered.should_not have_link 'New Event', :href => new_event_path
    end
  end
end


