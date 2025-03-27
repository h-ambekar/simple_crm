ActiveAdmin.register Customer do

  # Permit parameters for ActiveAdmin forms
  permit_params :full_name, :phone_number, :email_address, :notes, :image

  # Show page with image preview
  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :email_address
      row :notes
      row :image do |customer|
        if customer.image.attached?
          image_tag customer.image.variant(resize_to_limit: [100, 100])
        else
          "No image uploaded"
        end
      end
    end
  end

  # Form to upload customer data and image
  form do |f|
    f.inputs do
      f.input :full_name
      f.input :phone_number
      f.input :email_address
      f.input :notes
      f.input :image, as: :file
    end
    f.actions
  end

end
