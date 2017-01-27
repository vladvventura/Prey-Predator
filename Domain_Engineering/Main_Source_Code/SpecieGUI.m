function varargout = SpecieGUI(varargin)
% SPECIEGUI MATLAB code for SpecieGUI.fig
%      SPECIEGUI, by itself, creates a new SPECIEGUI or raises the existing
%      singleton*.
%
%      H = SPECIEGUI returns the handle to a new SPECIEGUI or the handle to
%      the existing singleton*.
%
%      SPECIEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPECIEGUI.M with the given input arguments.
%
%      SPECIEGUI('Property','Value',...) creates a new SPECIEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SpecieGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SpecieGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SpecieGUI

% Last Modified by GUIDE v2.5 28-Nov-2015 13:40:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SpecieGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @SpecieGUI_OutputFcn, ...
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


% --- Executes just before SpecieGUI is made visible.
function SpecieGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SpecieGUI (see VARARGIN)

% Choose default command line output for SpecieGUI
handles.output = hObject;

% Update handles structure
Preys_Checkbox(1) = handles.checkbox1;
Preys_Checkbox(2) = handles.checkbox2;
Preys_Checkbox(3) = handles.checkbox3;
Preys_Checkbox(4) = handles.checkbox4;
Hunting_Rate(1) = handles.checkbox5;
Hunting_Rate(2) = handles.checkbox6;
Food_Sources(1) = handles.checkbox7;
Food_Sources(2) = handles.checkbox8;
Food_Sources(3) = handles.checkbox9;
disp(Preys_Checkbox);
global Preys_Hrate ;
global Food_Meals;



% Preys_Hrate(2) = Preys_Checkbox(2);
% Preys_Hrate(3) = Preys_Checkbox(3);
% Preys_Hrate(4) = Preys_Checkbox(4);

% handles.Preys_Hrate = Preys_Hrate; 
handles.Preys_Checkbox = Preys_Checkbox;
handles.Hunting_Rate = Hunting_Rate;
handles.Food_Sources = Food_Sources;
guidata(hObject, handles);
Template = getappdata(0,'Template');
getSpecieName = getappdata(Template,'getSpecieName');

disp(getSpecieName);
disp(Preys_Hrate);
setappdata(0,'SpecieGUI',gcf);

% UIWAIT makes SpecieGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SpecieGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double
getNum_Meals=str2double( get(handles.edit7,'String')); 
SpecieGUI = getappdata(0,'SpecieGUI');
setappdata(SpecieGUI,'getNum_Meals',getNum_Meals);
getNum_Meals = getappdata(SpecieGUI,'getNum_Meals');

disp(getNum_Meals);




% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double
getAg_Factor=str2double( get(handles.edit6,'String')); 
SpecieGUI = getappdata(0,'SpecieGUI');
setappdata(SpecieGUI,'getAg_Factor',getAg_Factor);
getAg_Factor = getappdata(SpecieGUI,'getAg_Factor');

disp(getAg_Factor);

% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double
getEv_Factor=str2double( get(handles.edit5,'String')); 
SpecieGUI = getappdata(0,'SpecieGUI');
setappdata(SpecieGUI,'getEv_Factor',getEv_Factor);
getEv_Factor = getappdata(SpecieGUI,'getEv_Factor');

disp(getEv_Factor);


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
getHunting_Rate=str2double( get(handles.edit4,'String')); 
SpecieGUI = getappdata(0,'SpecieGUI');
setappdata(SpecieGUI,'getHunting_Rate',getHunting_Rate);
getHunting_Rate = getappdata(SpecieGUI,'getHunting_Rate');
disp(getHunting_Rate);

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5
Hunting_Rate = get(handles.Hunting_Rate, 'Value');
SpecieGUI = getappdata(0,'SpecieGUI');
setappdata(SpecieGUI,'Hunting_Rate',Hunting_Rate);
Hunting_Rate = getappdata(SpecieGUI,'Hunting_Rate');

disp(Hunting_Rate);

% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6
Hunting_Rate = get(handles.Hunting_Rate, 'Value');
SpecieGUI = getappdata(0,'SpecieGUI');
setappdata(SpecieGUI,'Hunting_Rate',Hunting_Rate);
Hunting_Rate = getappdata(SpecieGUI,'Hunting_Rate');

disp(Hunting_Rate);


function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
getDeath_Rate=str2double( get(handles.edit3,'String')); 
SpecieGUI = getappdata(0,'SpecieGUI');
setappdata(SpecieGUI,'getDeath_Rate',getDeath_Rate);
getDeath_Rate = getappdata(SpecieGUI,'getDeath_Rate');

disp(getDeath_Rate);

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


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
Preys_Checkbox = get(handles.Preys_Checkbox, 'Value');
SpecieGUI = getappdata(0,'SpecieGUI');
setappdata(SpecieGUI,'Preys_Checkbox',Preys_Checkbox );
Preys_Checkbox = getappdata(SpecieGUI,'Preys_Checkbox');

disp(Preys_Checkbox);

% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
Preys_Checkbox = get(handles.Preys_Checkbox, 'Value');
SpecieGUI = getappdata(0,'SpecieGUI');
setappdata(SpecieGUI,'Preys_Checkbox',Preys_Checkbox );
Preys_Checkbox = getappdata(SpecieGUI,'Preys_Checkbox');
disp(Preys_Checkbox );

% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3
Preys_Checkbox = get(handles.Preys_Checkbox, 'Value');
if(Preys_Checkbox{3} == 1)
    set(handles.edit15, 'enable', 'on')
else
    set(handles.edit15, 'enable', 'off')
end

SpecieGUI = getappdata(0,'SpecieGUI');
setappdata(SpecieGUI,'Preys_Checkbox',Preys_Checkbox );
Preys_Checkbox = getappdata(SpecieGUI,'Preys_Checkbox');
disp(Preys_Checkbox );

% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4
Preys_Checkbox = get(handles.Preys_Checkbox, 'Value');
if(Preys_Checkbox{4} == 1)
    set(handles.edit11, 'enable', 'on')
else
    set(handles.edit11, 'enable', 'off')
end
SpecieGUI = getappdata(0,'SpecieGUI');
setappdata(SpecieGUI,'Preys_Checkbox',Preys_Checkbox );
Preys_Checkbox = getappdata(SpecieGUI,'Preys_Checkbox');
disp(Preys_Checkbox );



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
getBirth_Rate =str2double( get(handles.edit2,'String')); 
SpecieGUI = getappdata(0,'SpecieGUI');
setappdata(SpecieGUI,'getBirth_Rate',getBirth_Rate);
getBirth_Rate= getappdata(SpecieGUI,'getBirth_Rate');

disp(getBirth_Rate);
    

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7
Food_Sources = get(handles.Food_Sources, 'Value');
if(Food_Sources{1} == 1)
    set(handles.edit19, 'enable', 'on')
else
    set(handles.edit19, 'enable', 'off')
end

SpecieGUI = getappdata(0,'SpecieGUI');
setappdata(SpecieGUI,'Food_Sources',Food_Sources);
Food_Sources = getappdata(SpecieGUI,'Food_Sources');
disp(Food_Sources);


% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox8
Food_Sources = get(handles.Food_Sources, 'Value');
if(Food_Sources{2} == 1)
    set(handles.edit20, 'enable', 'on')
else
    set(handles.edit20, 'enable', 'off')
end

SpecieGUI = getappdata(0,'SpecieGUI');
setappdata(SpecieGUI,'Food_Sources',Food_Sources);
Food_Sources = getappdata(SpecieGUI,'Food_Sources');
disp(Food_Sources);


% --- Executes on b`utton press in checkbox9.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox9
Food_Sources = get(handles.Food_Sources, 'Value');
if(Food_Sources{3} == 1)
    set(handles.edit21, 'enable', 'on')
else
    set(handles.edit21, 'enable', 'off')
end

SpecieGUI = getappdata(0,'SpecieGUI');
setappdata(SpecieGUI,'Food_Sources',Food_Sources);
Food_Sources = getappdata(SpecieGUI,'Food_Sources');
disp(Food_Sources);



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double
getInt_Population=str2double( get(handles.edit10,'String')); 
SpecieGUI = getappdata(0,'SpecieGUI');
setappdata(SpecieGUI,'getInt_Population',getInt_Population);
getInt_Population= getappdata(SpecieGUI,'getInt_Population');

disp(getInt_Population);

% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double
getPreys_Hunting =str2double( get(handles.edit11,'String')); 
% SpecieGUI = getappdata(0,'SpecieGUI');
% setappdata(SpecieGUI,'Preys_Hrate',getPreys_Hunting{4});
% Hunting_Rate = getappdata(SpecieGUI,'Hunting_Rate');
global Preys_Hrate
Preys_Hrate{4} = getPreys_Hunting;
disp(Preys_Hrate);

% SpecieGUI = getappdata(0,'SpecieGUI');
% % setappdata(SpecieGUI,'Preys_Checkbox',Preys_Checkbox );
% % Preys_Checkbox = getappdata(SpecieGUI,'Preys_Checkbox');

% disp(Preys_Checkbox);
% 
% Preys_Checkbox = get(handles.Preys_Checkbox, 'Value');




% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double
getPreys_Hunting =str2double( get(handles.edit15,'String')); 
global Preys_Hrate; 
Preys_Hrate{3} = getPreys_Hunting;
disp(Preys_Hrate);

% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit22_Callback(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit22 as text
%        str2double(get(hObject,'String')) returns contents of edit22 as a double
getNum_Drinks=str2double( get(handles.edit22,'String')); 
SpecieGUI = getappdata(0,'SpecieGUI');
setappdata(SpecieGUI,'getNum_Drinks',getNum_Drinks);
getNum_Drinks= getappdata(SpecieGUI,'getNum_Drinks');

disp(getNum_Drinks);

% --- Executes during object creation, after setting all properties.
function edit22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function uibuttongroup1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
