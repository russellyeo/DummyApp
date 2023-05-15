//
//  ProductDetailsView.swift
//  DummyApp
//
//  Created by Russell Yeo on 14/05/2023.
//

import SwiftUI

struct ProductDetailsView: View {
    @StateObject var viewModel: ProductDetailsViewModel
    @State var navigationTitle: String = ""
    
    init(product: Product, cartProvider: CartProvider) {
        let viewModel = ProductDetailsViewModel(product: product, cartProvider: cartProvider)
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    ImageCarouselView(imageURLs: viewModel.imageURLs)
                        .frame(width: geometry.size.width, height: geometry.size.width)
                        .aspectRatio(contentMode: .fit)
                    
                    Spacer()
                }
                Spacer()
                
                Text(viewModel.productDescription)
                    .multilineTextAlignment(.leading)
                    .padding(12)
                
                AddToCartButton {
                    viewModel.didTapAddToCart()
                }
            }
            .navigationTitle(viewModel.navigationTitle)
        }
        
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(
            product: ProductDTO.iPhoneX.model,
            cartProvider: CartProviderPreviewSupport()
        )
    }
}