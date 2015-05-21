function varargout = Transmitter(varargin)
% TRANSMITTER MATLAB code for Transmitter.fig
%      TRANSMITTER, by itself, creates a new TRANSMITTER or raises the existing
%      singleton*.
%
%      H = TRANSMITTER returns the handle to a new TRANSMITTER or the handle to
%      the existing singleton*.
%
%      TRANSMITTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRANSMITTER.M with the given input arguments.
%
%      TRANSMITTER('Property','Value',...) creates a new TRANSMITTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Transmitter_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Transmitter_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Transmitter

% Last Modified by GUIDE v2.5 20-May-2015 16:28:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Transmitter_OpeningFcn, ...
                   'gui_OutputFcn',  @Transmitter_OutputFcn, ...
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


% --- Executes just before Transmitter is made visible.
function Transmitter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Transmitter (see VARARGIN)

% Choose default command line output for Transmitter
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Transmitter wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Transmitter_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
filename = handles.filename;
fileInfo = dir(filename);
fileSize = fileInfo.bytes/1024;
contents = (get(hObject,'Value'));
switch contents
    case 1
        t=fileSize/6;
        strH = sprintf('%.2f s', t);
        set(handles.edit2,'String',strH);
    case 2
        t=fileSize/9;
        strH = sprintf('%.2f s', t);
        set(handles.edit2,'String',strH);
    case 3
          t=fileSize/12;
          strH = sprintf('%.2f s', t);
        set(handles.edit2,'String',strH);
    case 4
        t=fileSize/18;
        strH = sprintf('%.2f s', t);
        set(handles.edit2,'String',strH);
    case 5
        t=fileSize/24;
        strH = sprintf('%.2f s', t);
        set(handles.edit2,'String',strH);
    case 6
        t=fileSize/36;
        strH = sprintf('%.2f s', t);
        set(handles.edit2,'String',strH);  
    case 7
        t=fileSize/48;
        strH = sprintf('%.2f s', t);
        set(handles.edit2,'String',strH);  
    case 8
        t=fileSize/54;
        strH = sprintf('%.2f s', t);
        set(handles.edit2,'String',strH);  
end



% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile({'*.jpg';'*.mp3';'*wav';'*.mp4';'*avi'},'File Selector');
file = strcat(pathname,filename);
handles = guidata(hObject);
if strfind(filename,'jpg')> 0
    g = figure;
    imshow(file);
elseif strfind(filename,'mp3')> 0
    [y,f]=audioread(filename);
    pl=audioplayer(y,f);
    handles.pl=pl;
    resume(pl);
    guidata(hObject,handles);
elseif strfind(filename,'avi')> 0
    implay(file);
    [y,f]=audioread(filename);
    pl=audioplayer(y,f);
    handles.pl=pl;
    resume(pl);
    guidata(hObject,handles);
 end;
 handles.filename = filename;
 guidata(hObject,handles);
 


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
items = get(hObject,'String');
index_selected = get(hObject,'Value');
switch index_selected
    case 1
        strH = sprintf('2,41 GHz');
        set(handles.edit3,'String',strH);
    case 2
        strH = sprintf('2,415 GHz');
        set(handles.edit3,'String',strH);
    case 3
        strH = sprintf('2,42 GHz');
        set(handles.edit3,'String',strH);
    case 4
        strH = sprintf('2,425 GHz');
        set(handles.edit3,'String',strH);        
    case 5
        strH = sprintf('2,43 GHz');
        set(handles.edit3,'String',strH);
    case 6
        strH = sprintf('2,435 GHz');
        set(handles.edit3,'String',strH);
    case 7
        strH = sprintf('2,44 GHz');
        set(handles.edit3,'String',strH);
    case 8
        strH = sprintf('2,445 GHz');
        set(handles.edit3,'String',strH);              
    case 9
        strH = sprintf('2,45 GHz');
        set(handles.edit3,'String',strH);
    case 10
        strH = sprintf('2,455 GHz');
        set(handles.edit3,'String',strH);
    case 11
        strH = sprintf('2,46 GHz');
        set(handles.edit3,'String',strH);
    case 12
        strH = sprintf('2,465 GHz');
        set(handles.edit3,'String',strH);  
    case 13
        strH = sprintf('2,47 GHz');
        set(handles.edit3,'String',strH);        
end;

% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('The file has been successfully transmitted!','Transmission complete');
    



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in uipanel6.
function uipanel6_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel6 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
    case 'radiobutton1'
        set(handles.radiobutton3,'Enable','on'); 
        set(handles.radiobutton4,'Enable','on');  
    case 'radiobutton2'
        set(handles.radiobutton3,'Enable','off');
        set(handles.radiobutton4,'Enable','off');
        
end


% --- Executes when selected object is changed in uipanel16.
function uipanel16_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel16 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)