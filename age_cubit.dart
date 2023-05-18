import 'package:age/db/models/age_model.dart';
import 'package:age/db/db_functions.dart';
import 'package:bloc/bloc.dart';

part 'age_state.dart';

class AgeCubit extends Cubit<AgeState> {
  AgeCubit() : super(AgeInitial());
  var dataAgeModel = AgeModel(name: "name", age: "age");

  // Getting all data from Hive Box and emit the state
  // always have a call to this function after every CRUD operation to set the UI.

  void getAllData() async {
    List<AgeModel> temp;
    temp = await getAllDataFromBox();
    emit(AgeState(listAges: state.listAges = temp));
  }

  // Save an entry with name and details
  void saveData(String name, String age) async {
    dataAgeModel = AgeModel(name: name, age: age);
    var temp = await addAge(dataAgeModel);
    getAllData();
  }

  // Updates an entry with change in name and/or details
  void updateData(AgeModel ageModelUpdate) async {
    var temp = await updateSingleData(ageModelUpdate);
    getAllData();
  }

  void registerUpdation(AgeModel ageModelUpdate) async {
    print("registerUpdation called" + ageModelUpdate.key.toString());

    emit(AgeState(listAges: state.listAges, dataAgeModel: ageModelUpdate));
  }

  //Delete a selected Entry
  void deleteData(int ageId) async {
    var temp = await deleteAge(ageId);
    getAllData();
  }
}
