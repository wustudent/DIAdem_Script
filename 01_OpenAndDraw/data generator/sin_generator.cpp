#include<iostream>
#include<iomanip>
#include<fstream>
#include <math.h>
using namespace std;

int main()
{
	double A,ohm,phi,k,a,b,T,step,y,x;
	char* name=new char[99];
	cout<<setfill('*')<<setw(50)<<'*'<<endl;
	cout<<"This program is made to generate a specfied Sin data,"<<endl;
	cout<<"which looks like y=Asin(wx+f)+k [aT,bT]";
	cout<<"Please input the A:"<<endl;
	cin>>A;
	cout<<"Please input w(o):"<<endl;
	cin>>ohm;
	cout<<"Please input f(o):"<<endl;	
	cin>>phi;
	cout<<"Please input k:"<<endl;
	cin>>k;
	cout<<"Please input a:"<<endl;
	cin>>a;
	cout<<"Please input b:"<<endl;
	cin>>b;
	cout<<"Please input step (T/?):"<<endl;
	cin>>step;
	cout<<"Please input the name of this file:"<<endl;
	cin>>name;
	cout<<"Calculating:"<<endl;
	T=2*M_PI/fabs(ohm/180*M_PI);
	ofstream file;
	file.open(name);
	file<<"Time,Scale"<<endl;
	for(x=a*T;x<=b*T;x+=(T/step))
	{
		y=A*sin(ohm/180*M_PI*x+phi/180*M_PI)+k;
		file<<x<<','<<y<<endl;
		cout<<'.';
	}
	file.close();
	cout<<endl<<name<<" is saved"<<endl;
	return 0;
} 
