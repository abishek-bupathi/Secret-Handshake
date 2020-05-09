""""

Secret Handshake Decoding table:
1    - 'Wink'
10   - 'Double Wink'
100  - 'Run'
1000 - 'Jump'

10000 - reverse the message

"""

msg = ["Wink", "Double Wink", "Run", "Jump"]  # storing messages in a list
decoded = []  # initializing list to store decoded messages

code = int(input('Enter the Decimal Code Number: '))  # getting coded input


# convert_binary function takes in number as arguments and return the binary value
def convert_binary(num):
    s = ''
    while num > 0:
        s = s + str(num % 2)
        num = int(num/2)
    s = s[::-1]  # reversing the string
    return s


binary = convert_binary(code)
length = len(binary)
print("Binary Value: " + binary)

# checking for length of the binary string
if length < 6:
    for i in range(length - 1, -1, -1):  # running loop backwards
        if binary[i] == '1' and (length - i - 1) < 4:  # checking the position of the bit
            decoded.append(msg[length - i - 1])  # adding the message to decode list
        elif binary[i] == '1' and (length - i - 1) == 4:  # checking if the list should be reversed
            decoded.reverse()  # reversing the decoded message list
    print("Decoded Message: ", decoded)
else:  # if the code exceeds 6 digits then the code is Invalid
    print('Invalid Code')


