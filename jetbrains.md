Parace que añadiendo esta línea en la configuración de VM de los IDES se solucionan todos los problemas (además de con las reglas de ventanas configuradas).  

> -Dawt.toolkit.name=WLToolkit

Se puede hacer de dos formas distintas:

1. Con el IDE abierto, menú Help > Add Custom VM settings

2. Editando el archivo de configuración, habrá que cambiar `PyCharm2025.2` por el ide correcto, `.config/JetBrains/PyCharm2025.2/pycharm64.vmoptions`
