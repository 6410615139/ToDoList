//
//  NewItemView.swift
//  ToDoList
//
//  Created by Supakrit Nithikethkul on 8/3/2567 BE.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 50)
            
            Form {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                TDLButton(title: "Save", background: .pink) {
                    viewModel.save()
                    newItemPresented = false
                }
            }
            
        }
    }
}

#Preview {
    NewItemView(newItemPresented: .constant(true))
}
