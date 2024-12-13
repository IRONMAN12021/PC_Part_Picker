class CompatibilityChecker {
  // Check CPU and Motherboard compatibility with error message
  Map<String, dynamic> checkCpuMotherboardCompatibility(String cpuSocket, String motherboardSocket) {
    if (cpuSocket == motherboardSocket) {
      return {'isCompatible': true, 'message': 'CPU and motherboard socket match.'};
    } else {
      return {
        'isCompatible': false,
        'message': 'Incompatible CPU and motherboard socket. CPU socket: $cpuSocket, Motherboard socket: $motherboardSocket'
      };
    }
  }

  // Check if the selected CPU cooler fits in the case
  Map<String, dynamic> checkCpuCaseCompatibility(double cpuCoolerHeight, double caseMaxCoolerHeight) {
    if (cpuCoolerHeight <= caseMaxCoolerHeight) {
      return {'isCompatible': true, 'message': 'CPU cooler fits in the case.'};
    } else {
      return {
        'isCompatible': false,
        'message': 'Incompatible CPU cooler height. Cooler height: $cpuCoolerHeight mm, Case max height: $caseMaxCoolerHeight mm'
      };
    }
  }

  // Check if the motherboard fits in the case
  Map<String, dynamic> checkMotherboardCaseCompatibility(String motherboardFormFactor, String caseSupportedFormFactor) {
    if (motherboardFormFactor == caseSupportedFormFactor || caseSupportedFormFactor == 'ATX' || caseSupportedFormFactor == 'Micro-ATX') {
      return {'isCompatible': true, 'message': 'Motherboard form factor is compatible with the case.'};
    } else {
      return {
        'isCompatible': false,
        'message': 'Incompatible motherboard form factor. Motherboard: $motherboardFormFactor, Case supports: $caseSupportedFormFactor'
      };
    }
  }

  // Check RAM compatibility with motherboard
  Map<String, dynamic> checkRamCompatibility(String ramType, String motherboardRamType) {
    if (ramType == motherboardRamType) {
      return {'isCompatible': true, 'message': 'RAM type is compatible with the motherboard.'};
    } else {
      return {
        'isCompatible': false,
        'message': 'Incompatible RAM type. RAM type: $ramType, Motherboard RAM type: $motherboardRamType'
      };
    }
  }

  // Check storage compatibility with motherboard
  Map<String, dynamic> checkStorageCompatibility(String storageType, List<String> motherboardSupportedStorageTypes) {
    if (motherboardSupportedStorageTypes.contains(storageType)) {
      return {'isCompatible': true, 'message': 'Storage type is compatible with the motherboard.'};
    } else {
      return {
        'isCompatible': false,
        'message': 'Incompatible storage type. Storage type: $storageType, Motherboard supports: ${motherboardSupportedStorageTypes.join(', ')}'
      };
    }
  }

  // Check if the power supply fits in the case
  Map<String, dynamic> checkPowerSupplyCompatibility(String powerSupplyFormFactor, String caseSupportedFormFactor) {
    if (powerSupplyFormFactor == caseSupportedFormFactor || caseSupportedFormFactor == 'ATX' || caseSupportedFormFactor == 'SFX') {
      return {'isCompatible': true, 'message': 'Power supply form factor is compatible with the case.'};
    } else {
      return {
        'isCompatible': false,
        'message': 'Incompatible power supply form factor. Power supply: $powerSupplyFormFactor, Case supports: $caseSupportedFormFactor'
      };
    }
  }

  // Check GPU compatibility with case (if the GPU fits)
  Map<String, dynamic> checkGpuCaseCompatibility(double gpuLength, double caseMaxGpuLength) {
    if (gpuLength <= caseMaxGpuLength) {
      return {'isCompatible': true, 'message': 'GPU fits in the case.'};
    } else {
      return {
        'isCompatible': false,
        'message': 'Incompatible GPU size. GPU length: $gpuLength mm, Case max length: $caseMaxGpuLength mm'
      };
    }
  }

  // Check if PSU wattage is enough for the components
  Map<String, dynamic> checkPsuPowerCompatibility(int totalPowerRequired, int psuWattage) {
    if (totalPowerRequired <= psuWattage) {
      return {'isCompatible': true, 'message': 'PSU has enough wattage for the selected components.'};
    } else {
      return {
        'isCompatible': false,
        'message': 'Insufficient PSU wattage. Total power required: $totalPowerRequired W, PSU wattage: $psuWattage W'
      };
    }
  }

  // Check if PSU has the required power cables
  Map<String, dynamic> checkPsuCableCompatibility(List<String> psuCables, List<String> requiredCables) {
    for (var requiredCable in requiredCables) {
      if (!psuCables.contains(requiredCable)) {
        return {
          'isCompatible': false,
          'message': 'Missing required PSU cable: $requiredCable. Available cables: ${psuCables.join(', ')}'
        };
      }
    }
    return {'isCompatible': true, 'message': 'PSU has the required cables.'};
  }
}