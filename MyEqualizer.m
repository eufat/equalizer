function varargout = MyEqualizer(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MyEqualizer_OpeningFcn, ...
                   'gui_OutputFcn',  @MyEqualizer_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before MyEqualizer is made visible.
function MyEqualizer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MyEqualizer (see VARARGIN)
global stop C Fs;
stop=1;
Fs=44100;
C=zeros(1,5);
set(handles.C1_var,'min',-20);
set(handles.C1_var,'max',20);
set(handles.C1_var,'value',0);
set(handles.C1_var,'SliderStep',[0.025,0.05]);
set(handles.C1_val,'string',num2str(0));

set(handles.C2_var,'min',-20);
set(handles.C2_var,'max',20);
set(handles.C2_var,'value',0);
set(handles.C2_var,'SliderStep',[0.025,0.05]);
set(handles.C2_val,'string',num2str(0));

set(handles.C3_var,'min',-20);
set(handles.C3_var,'max',20);
set(handles.C3_var,'value',0);
set(handles.C3_var,'SliderStep',[0.025,0.05]);
set(handles.C3_val,'string',num2str(0));

set(handles.C4_var,'min',-20);
set(handles.C4_var,'max',20);
set(handles.C4_var,'value',0);
set(handles.C4_var,'SliderStep',[0.025,0.05]);
set(handles.C4_val,'string',num2str(0));

set(handles.C5_var,'min',-20);
set(handles.C5_var,'max',20);
set(handles.C5_var,'value',0);
set(handles.C5_var,'SliderStep',[0.025,0.05]);
set(handles.C5_val,'string',num2str(0));

equalizer_plot();
% Choose default command line output for MyEqualizer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MyEqualizer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MyEqualizer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function C1_var_Callback(hObject, eventdata, handles)
% hObject    handle to C1_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global C;
C(1)=get(hObject,'value');
set(handles.C1_val,'string',num2str(C(1)));

% --- Executes during object creation, after setting all properties.
function C1_var_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C1_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function C2_var_Callback(hObject, eventdata, handles)
% hObject    handle to C2_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global C;
C(2)=get(hObject,'value');
set(handles.C2_val,'string',num2str(C(2)));

% --- Executes during object creation, after setting all properties.
function C2_var_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C2_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function C3_var_Callback(hObject, eventdata, handles)
% hObject    handle to C3_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global C;
C(3)=get(hObject,'value');
set(handles.C3_val,'string',num2str(C(3)));

% --- Executes during object creation, after setting all properties.
function C3_var_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C3_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function C4_var_Callback(hObject, eventdata, handles)
% hObject    handle to C4_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global C;
C(4)=get(hObject,'value');
set(handles.C4_val,'string',num2str(C(4)));

% --- Executes during object creation, after setting all properties.
function C4_var_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C4_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function C5_var_Callback(hObject, eventdata, handles)
% hObject    handle to C5_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global C;
C(5)=get(hObject,'value');
set(handles.C5_val,'string',num2str(C(5)));

% --- Executes during object creation, after setting all properties.
function C5_var_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C5_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in plot_H.
function plot_H_Callback(hObject, eventdata, handles)
% hObject    handle to plot_H (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global C Fs;
equalizer_plot();

function equalizer_plot()
global C Fs;
[a,b,a1,b1,a2,b2,a3,b3,a4,b4,a5,b5]=coef();
H=0;
for i=1:5
    H=H+10^(C(i)/20)*abs(freqz(b{i},a{i},1024));
end
f = Fs*[0:1023]/2048;

semilogx(f,20*log10(H));
xlabel('Frequency [Hz]');
ylabel('Magnitude [dB]');
title('Audio Equalizator');
axis([10 Fs/2 -21 21]);
grid on;

figure('Name','Filter 1 (Low Pass)','NumberTitle','off');
freqz(b1,a1);

figure('Name','Filter 2 (Band Pass)','NumberTitle','off');
freqz(b2,a2);

figure('Name','Filter 3 (Band Pass)','NumberTitle','off');
freqz(b3,a3);

figure('Name','Filter 4 (Band Pass)','NumberTitle','off');
freqz(b4,a4);

figure('Name','Filter 5 (High Pass','NumberTitle','off');
freqz(b5,a5);

function [a,b,a1,b1,a2,b2,a3,b3,a4,b4,a5,b5]=coef()
global Fs;
%1.Filter
Fp1=250/(Fs/2);
[b1,a1]=butter(4,Fp1,'low');

%2.Filter
Fp2=[250 500]/(Fs/2);
[b2,a2]=butter(4,Fp2,'bandpass');

%3.Filter
Fp3=[500 2000]/(Fs/2);
[b3,a3]=butter(4,Fp3,'bandpass');

%4.Filter
Fp4=[2000 4000]/(Fs/2);
[b4,a4]=butter(4,Fp4,'bandpass');

%5.Filter
Fp5=4000/(Fs/2);
[b5,a5]=butter(4,Fp5,'high');
a={a1,a2,a3,a4,a5};
b={b1,b2,b3,b4,b5};

% --- Executes on button press in reset_H.
function reset_H_Callback(hObject, eventdata, handles)
% hObject    handle to reset_H (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Fs C;
C=zeros(1,5);
Fs=44100;
set(handles.C1_val,'string',num2str(0));
set(handles.C2_val,'string',num2str(0));
set(handles.C3_val,'string',num2str(0));
set(handles.C4_val,'string',num2str(0));
set(handles.C5_val,'string',num2str(0));

set(handles.C1_var,'value',0);
set(handles.C2_var,'value',0);
set(handles.C3_var,'value',0);
set(handles.C4_var,'value',0);
set(handles.C5_var,'value',0);

equalizer_plot();


function C1_val_Callback(hObject, eventdata, handles)
% hObject    handle to C1_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global C;
C(1)=str2num(get(hObject,'string'));
minn=get(handles.C1_var,'min');
maxx=get(handles.C1_var,'max');
if(C(1)<minn || C(1)>maxx)
    C(1)=get(handles.C1_var,'value');
    set(hObject,'string',num2str(0));
else
    set(handles.C1_var,'value',C(1));
end
% Hints: get(hObject,'String') returns contents of C1_val as text
%        str2double(get(hObject,'String')) returns contents of C1_val as a double


% --- Executes during object creation, after setting all properties.
function C1_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C1_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function C2_val_Callback(hObject, eventdata, handles)
% hObject    handle to C2_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of C2_val as text
%        str2double(get(hObject,'String')) returns contents of C2_val as a double
global C;
C(2)=str2num(get(hObject,'string'));
minn=get(handles.C2_var,'min');
maxx=get(handles.C2_var,'max');
if(C(2)<minn || C(2)>maxx)
    C(2)=get(handles.C2_var,'value');
    set(hObject,'string',num2str(0));
else
    set(handles.C2_var,'value',C(2));
end

% --- Executes during object creation, after setting all properties.
function C2_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C2_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function C3_val_Callback(hObject, eventdata, handles)
% hObject    handle to C3_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of C3_val as text
%        str2double(get(hObject,'String')) returns contents of C3_val as a double
global C;
C(3)=str2num(get(hObject,'string'));
minn=get(handles.C3_var,'min');
maxx=get(handles.C3_var,'max');
if(C(3)<minn || C(3)>maxx)
    C(3)=get(handles.C3_var,'value');
    set(hObject,'string',num2str(0));
else
    set(handles.C3_var,'value',C(3));
end

% --- Executes during object creation, after setting all properties.
function C3_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C3_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function C4_val_Callback(hObject, eventdata, handles)
% hObject    handle to C4_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of C4_val as text
%        str2double(get(hObject,'String')) returns contents of C4_val as a double
global C;
C(4)=str2num(get(hObject,'string'));
minn=get(handles.C4_var,'min');
maxx=get(handles.C4_var,'max');
if(C(4)<minn || C(4)>maxx)
    C(4)=get(handles.C4_var,'value');
    set(hObject,'string',num2str(0));
else
    set(handles.C4_var,'value',C(4));
end

% --- Executes during object creation, after setting all properties.
function C4_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C4_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function C5_val_Callback(hObject, eventdata, handles)
% hObject    handle to C5_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of C5_val as text
%        str2double(get(hObject,'String')) returns contents of C5_val as a double
global C;
C(5)=str2num(get(hObject,'string'));
minn=get(handles.C5_var,'min');
maxx=get(handles.C5_var,'max');
if(C(5)<minn || C(5)>maxx)
    C(5)=get(handles.C5_var,'value');
    set(hObject,'string',num2str(0));
else
    set(handles.C5_var,'value',C(5));
end

% --- Executes during object creation, after setting all properties.
function C5_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C5_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in load.
function load_Callback(hObject, eventdata, handles)
% hObject    handle to load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global file_name;
file_name=uigetfile('*wav','Select Audio File .wav');

% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global stop file_name C;
stop=1;
equalizer_play();

function equalizer_play()
global stop file_name C;
[x,Fs]=audioread(file_name);
[a,b]=coef();
%l_sector=2*Fs;
%Nb=round(length(x)/l_sector);
l_sector=length(x);
Nb = 1;
y=0;
for i=1:floor(Nb)
 disp('processing');
 sector=x((i-1)*l_sector+1:i*l_sector);
 for k=1:5
 y=y+filter(10^(C(k)/20)*b{k},a{k},sector);
 if(stop==0)
 break;
 end
 end
 player=audioplayer(y,Fs);

 player.playblocking;

 y=0;
 if(stop==0)
 break;
 end
end


% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global stop;
stop=0;
