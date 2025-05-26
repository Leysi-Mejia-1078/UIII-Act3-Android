import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  Details({
    Key? key,
    required this.sucursalId,
    required this.sucursalName,
    required this.sucursalDescription, // This will now be treated as the address/direction
    required this.sucursalTel,
    required this.sucursalCorreo,
    required this.sucursalHora,
    required this.sucursalEmp,
  }) : super(key: key);

  final String sucursalId;
  final String sucursalName;
  final String sucursalDescription; // Renamed conceptually to 'sucursalAddress'
  final String sucursalTel;
  final String sucursalCorreo;
  final String sucursalHora;
  final String sucursalEmp;

  // Helper widget to create a consistent detail row
  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Card( // Using Card for a distinct visual separation
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.blueAccent),
          title: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
          subtitle: Text(
            value,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Details",
          style: TextStyle(color: Colors.white), // AppBar title color
        ),
        backgroundColor: Colors.deepPurpleAccent, // AppBar background color changed to lilac purple
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white), // Back icon color
        ),
      ),
      body: Container(
        color: Colors.grey.shade100, // Light background for the body
        child: ListView(
          padding: const EdgeInsets.all(8.0), // Padding around the list
          children: [
            // Branch Name
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              child: Card(
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  leading: const Icon(
                    Icons.store_mall_directory_rounded, // Icon for branch name
                    color: Colors.blueAccent,
                    size: 30.0,
                  ),
                  title: Text(
                    sucursalName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10.0), // Spacing between sections

            // Branch Address/Direction (separated from the name)
            _buildDetailRow(Icons.location_on, 'Dirección:', sucursalDescription), // Using sucursalDescription as address

            const SizedBox(height: 10.0), // Spacing between sections

            // Individual detail rows
            _buildDetailRow(Icons.fingerprint, 'ID Sucursal:', sucursalId),
            _buildDetailRow(Icons.phone, 'Teléfono:', sucursalTel),
            _buildDetailRow(Icons.email, 'Correo:', sucursalCorreo),
            _buildDetailRow(Icons.access_time, 'Horario de atención:', sucursalHora),
            _buildDetailRow(Icons.person, 'Encargado:', sucursalEmp),

            const SizedBox(height: 20.0), // Spacing before potential action buttons

            // Example of a delete button, if needed (placed outside the list tiles)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Action for deleting the branch
                  print('Delete button pressed'); // For demonstration
                  // Implement your delete logic here, perhaps showing a confirmation dialog
                },
                icon: const Icon(Icons.delete, color: Colors.white),
                label: const Text(
                  'Eliminar Sucursal',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent, // Button color
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 3.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}