📨 Módulo Message - MoveClub Latam
🎯 Descripción
Este es un módulo educativo básico en Move que demuestra cómo almacenar y recuperar mensajes en la blockchain. Es perfecto para comenzar a aprender los conceptos fundamentales de Move Programming Language.
🧩 Conceptos Clave Demostrados
1. Recursos (Resources)

Uso de la ability key para almacenamiento global
Manejo de recursos con move_to y move_from
Lectura de recursos con borrow_global

2. Abilities

key: Permite almacenar el recurso en cuentas
store: Permite almacenar dentro de otras estructuras
drop: Permite descartar la estructura automáticamente

3. Funciones

public entry fun: Funciones llamables mediante transacciones
public fun: Funciones de lectura (view functions)
acquires: Declaración de acceso a recursos

4. Manejo de Cuentas

Uso del tipo signer para autenticación
Verificación de existencia con exists<T>()
Obtención de direcciones con signer::address_of()

💻 Código del Módulo
movemodule first_module::message {
    use std::string;
    use std::signer;

    struct MessageHolder has key, store, drop {
        message: string::String,
    }

    public entry fun set_message(account: &signer, message: string::String) acquires MessageHolder {
        let account_addr = signer::address_of(account);
        if (exists<MessageHolder>(account_addr)) {
            move_from<MessageHolder>(account_addr);
        };
        move_to(account, MessageHolder{ message });
    }

    public fun get_message(account_addr: address): string::String acquires MessageHolder {
        assert!(exists<MessageHolder>(account_addr), 0);
        let message_holder = borrow_global<MessageHolder>(account_addr);
        message_holder.message
    }
}
🚀 Cómo Usar
1. Establecer un Mensaje
move// Llamar la función set_message con tu cuenta
set_message(account, string::utf8(b"Hola MoveClub Latam!"));
2. Obtener un Mensaje
move// Leer el mensaje de una dirección específica
let mensaje = get_message(@0x123...);
📋 Flujo de Ejecución

Primera vez: Se crea un MessageHolder y se almacena en tu cuenta
Actualizaciones: Si ya existe un mensaje, se elimina el anterior y se crea uno nuevo
Lectura: Cualquiera puede leer tu mensaje público usando tu dirección

⚠️ Consideraciones Importantes

Cada cuenta solo puede tener un MessageHolder
El mensaje anterior se sobrescribe al establecer uno nuevo
Se requiere una transacción (gas) para establecer mensajes
La lectura es gratuita (función view)

🛠️ Prerrequisitos

Move Compiler instalado
CLI de Aptos
Cuenta con fondos para gas

📚 Recursos de Aprendizaje
Documentación Oficial

Move Book (Español) - Documentación oficial traducida
Move Language Documentation - Documentación oficial en inglés
Aptos Developer Docs - Guías y tutoriales de Aptos
Sui Developer Docs - Guías y tutoriales de Sui

Tutoriales y Cursos

Move Prover Tutorial - Verificación formal en Move
Move by Example - Ejemplos prácticos paso a paso
Awesome Move - Colección curada de recursos

Comunidad MoveClub Latam

Discord MoveClub Latam - Únete a nuestra comunidad
GitHub MoveClub Latam - Repositorio de recursos
Twitter/X - Últimas noticias y actualizaciones
YouTube Channel - Tutoriales en video

Herramientas

Move Playground - Editor online para probar código
Aptos Explorer - Explorador de blockchain Aptos
Sui Explorer - Explorador de blockchain Sui

Artículos y Blogs

Understanding Move Resources - Profundización en recursos
Move vs Solidity - Comparación de lenguajes
Security Best Practices - Mejores prácticas de seguridad

🤝 Contribuir
¿Encontraste un error o tienes una sugerencia?

Abre un issue
Envía un pull request
Comparte en la comunidad de MoveClub Latam

👥 Comunidad
Este proyecto es parte de la iniciativa MoveClub Latam para educar y promover el desarrollo con Move en América Latina.
¡Únete a nosotros y aprende Move juntos! 🚀
📝 Licencia
MIT License - Libre para usar y modificar

Hecho con ❤️ por MoveClub Latam