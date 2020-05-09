#=

Secret Handshake Decoding table:
1    - 'Wink'
10   - 'Double Wink'
100  - 'Run'
1000 - 'Jump'

10000 - reverse the message

=#

msg = ["Wink", "Double Wink", "Run", "Jump"]  # storing messages in a list
decoded_msg = String[]  # initializing list to store decoded messages

println("Enter the Decimal Code Number: ")
code = readline() # getting coded input
code = parse(Int, code) # converting string to integer

# convert_binary function takes in Integer and returns it's binary value
function convert_binary(n)
    s = ""
    while n > 0
        s = s * string(floor(Int,n % 2))
        n = floor(n/2)
    end
    return reverse(s)
end

binary = convert_binary(code)
println("Binary Value: ", binary)
len = length(binary)

# checking for length of the binary string
if len < 6
    for i  = len : -1 : 1  # running loop backwards
        if binary[i] == '1' && len - i + 1 < 5 # checking the position of the bit
            global decoded_msg
            push!(decoded_msg,msg[len - i + 1])  # adding the message to decode list

        elseif binary[i] == '1' && len - i + 1 == 5
            decoded_msg = reverse(decoded_msg, dims = 1)
        end
    end
    print("Decoded Message: ", decoded_msg)
else  # if the code exceeds 6 digits then the code is Invalid
    print("Invalid Code")
end
