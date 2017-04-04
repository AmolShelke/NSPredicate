//
//  ViewController.h
//  Day18_Predicate
//
//  Created by Student P_04 on 20/03/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
- (IBAction)searchAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *searchText;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property NSArray *namelist;
@property NSArray *phonelist;
@property NSArray *resultArray;
@property (weak,nonatomic)NSString *title;

@end

