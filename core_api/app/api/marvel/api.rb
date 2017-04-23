module Marvel
  class API < Grape::API
    format :json

    desc 'List all comics from Marvell'
    get '/comics' do
      Rails.cache.fetch("comics/#{Comic.count}/ordered_comics", expires_in: 12.hours) do
        { comics: Comic.ordered_all }
      end
    end
  end
end
