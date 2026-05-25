import { ApiProperty } from "@nestjs/swagger";
import { IsNotEmpty, IsString, IsOptional, IsEmail } from "class-validator";

export class CreateClienteDto {

    @ApiProperty()
    @IsString()
    @IsNotEmpty()
    nombre!: string;

    @ApiProperty({ required: false })
    @IsEmail({}, { message: 'El formato del correo no es válido' })
    @IsOptional()
    correo?: string;

    @ApiProperty({ required: false })
    @IsString()
    @IsOptional()
    telefono?: string;
}