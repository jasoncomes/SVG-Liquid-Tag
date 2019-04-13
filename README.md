# svg

*Takes the `path` of the svg and outputs/sanitizes it's content and embeds the svg within the designated area on the page.*

### **Usage**

    {% svg path:"/assets/img/logo.svg" %}

### Parameters

- `path` string. required.

### Return

- `svg` html

## **Example**

### Input

    {% svg path:"/assets/img/airbnb.svg" %}

### Output

    <?xml version="1.0" encoding="UTF-8"?>
    <svg width="512px" height="127px" viewBox="0 0 512 127" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" preserveAspectRatio="xMidYMid">
      <g fill-rule="nonzero">
        <path d="M16.6452675,0.05244444 L109.774486,0.05244444 C118.939918,0.05244444 126.419753,7.49540741 126.419753,16.6977119 L126.419753,109.832198 C126.419753,118.99763 118.97679,126.472198 109.774486,126.472198 L16.6452675,126.472198 C7.47983539,126.472198 1.42108547e-14,119.034502 1.42108547e-14,109.832198 L1.42108547e-14,16.655572 C1.42108547e-14,7.49540741 7.43769547,0.05244444 16.6452675,0.05244444" fill="#5468FF"></path>
      </g>
    </svg>
