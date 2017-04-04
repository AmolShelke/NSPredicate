//
//  ViewController.m
//  Day18_Predicate
//
//  Created by Student P_04 on 20/03/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import "ViewController.h"
#import "myTableViewCell.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchText.delegate=self;
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
    
    self.namelist=[NSArray arrayWithObjects:@"Ramesh",@"Ravindra",@"Ajay",@"Snehal",@"Nitin", nil];
    self.phonelist=[NSArray arrayWithObjects:@"9860944137",@"123456789",@"98765443210",@"7789123456",@"9087654345", nil];
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if(self.resultArray.count<=0)
    {
        return self.namelist.count;
    }
    else
        return self.resultArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    myTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell"];
    NSString *name,*cno;
    if(self.resultArray.count<=0)
    {
        name=[self.namelist objectAtIndex:indexPath.row];
        cno=[self.phonelist objectAtIndex:indexPath.row];
    }
    else
    {
        name=[self.resultArray objectAtIndex:indexPath.row];
        //cno=[self.phonelist objectAtIndex:indexPath.row];
    }
    cell.name.text=name;
    cell.contactNo.text=cno;
    self.title=cell.name.text;
    NSLog(@"hiii %@",name);
    return cell;
}
-(void)showMyAlertView:(NSString *)Title andMessage:(NSString *)message
{
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:Title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *Okalert=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        nil;
    }];

    UIAlertAction *cancelalert=[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        nil;
    }];
    
    
    [alert addAction:Okalert];
    [alert addAction:cancelalert];
    [self presentViewController:alert animated:YES completion:^{
        nil;
    }];
    
    
}
- (IBAction)searchAction:(id)sender {
    
   UITextField *search=sender;
    //NSString *search=textField.text;
    if(search==self.searchText && self.searchText.text.length>0)
    {
        NSPredicate *searchPredicate=[NSPredicate predicateWithFormat:@"SELF Contains[c]%@",search];
        NSLog(@"%@",searchPredicate);
        self.resultArray=[self.namelist filteredArrayUsingPredicate:searchPredicate];
        [self.myTableView reloadData];
        NSLog(@"%@",self.resultArray);
        
        
       // [self showMyAlertView:<#(NSString *)#> andMessage:<#(NSString *)#>]
        
        
    }
    
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //NSString *title=;
  // long int a=;
   // title=[NSString stringWithFormat:@"%ld",a];
    //self.title=
    
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
   // self.title=cell;
    [self showMyAlertView:self.title andMessage:@"hii"];
    
    
}
-(bool)textFieldShouldReturn:(UITextField *)textField{
    
    NSString *search=textField.text;
    if(textField==self.searchText && self.searchText.text.length>0)
    {
        NSPredicate *searchPredicate=[NSPredicate predicateWithFormat:@"SELF Contains[c]%@",search];
        NSLog(@"%@",searchPredicate);
        self.resultArray=[self.namelist filteredArrayUsingPredicate:searchPredicate];
        
        [self.myTableView reloadData];
        NSLog(@"%@",self.resultArray);
        
    }
    return YES;
}

@end
