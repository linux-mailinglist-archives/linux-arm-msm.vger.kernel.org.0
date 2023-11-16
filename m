Return-Path: <linux-arm-msm+bounces-799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6B77EE036
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 12:56:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D44071C209E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 11:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501A0C147;
	Thu, 16 Nov 2023 11:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fm93XQ36"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77069187
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 03:56:36 -0800 (PST)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7789aed0e46so40644185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 03:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700135795; x=1700740595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6sduR18SAGL/LrSQHVtqPdn++QC3UjL5bC7BaWYG+KE=;
        b=Fm93XQ361inLUqfBuF59B5NVoT7vQ3nd9ddJpzVFKHH2mZIDomKs3UPbyW/1x884LM
         thx0qBGleO+OMdocW01XCPl1Mtubem1lc6xE/SBMbMslx9GqHmr5cCE+uXbRJSkiTn5w
         tk9D1w+15aNfbCTp0itMJulDDBbM7VAUWL3/d0PDbxzLAX6tasH8+qSd0gMNbRKYhdyf
         f+hMK1WedRfZsFy3HdIlxXxKBdWLjUiS+pXEsAmdQ6D6v9tQUH8aoKJUMr77y34PUvtd
         sfGUjKFwBlbeD3/k5E9rXANxSVyM1k+nPQDOIoGgVMsu7vfmZLDZ7VRvK8b1eiD1+m6O
         8V8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700135795; x=1700740595;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6sduR18SAGL/LrSQHVtqPdn++QC3UjL5bC7BaWYG+KE=;
        b=WcVbcX4uQ8RtVexMn6u+W4Y5clEYUSCb9/1lffa2JH4iqNyN9iDZXY9wrIyhITcz2I
         /rTBBxBTgkiKGvcS+E+w1/fT6rKBS63p/g+17isCVFvEbwmvqLSpk7654dv7oI63SEkY
         y3spxAzWrSKXuHYGgJYkTH1E7Gc9iu5KA4AVJHS/uTXeBac68jTKqgL7iGebd68mBYg5
         302nbIPJvR+5xty/suz72LwTh96Ec5IDcfDYAX8H2IKkR25LYY+u5Oefzjpv3l/VY0QJ
         VR3KdXBva7UxNraEv7f0TZ38wUlDF8XyO77Rl7M6XuMtCbcm42/EbVprHjMNc8ZMDjXR
         Q8rg==
X-Gm-Message-State: AOJu0YzGyTjfp0nHIadOnh+4814Y04T08Oj9OurABDCDM1wiDSF8YQY6
	o00aJvcnt5Uj9BojX3Qr0TqmUQ==
X-Google-Smtp-Source: AGHT+IFGiq+EEnneJQhbyMpvhM5nd0O8GlvkBn6OEiICIj/lDbbqEaBBZyC3Z30TIPhx9JFCSDNNNQ==
X-Received: by 2002:ad4:4089:0:b0:675:b904:9bc1 with SMTP id l9-20020ad44089000000b00675b9049bc1mr8608767qvp.49.1700135795582;
        Thu, 16 Nov 2023 03:56:35 -0800 (PST)
Received: from [192.168.212.13] ([12.191.197.195])
        by smtp.gmail.com with ESMTPSA id l15-20020ad4408f000000b00670867d7bdfsm1315936qvp.122.2023.11.16.03.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 03:56:35 -0800 (PST)
Message-ID: <834cbb58-3a88-4ba6-8db6-10440a4d0893@linaro.org>
Date: Thu, 16 Nov 2023 12:56:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] dt-bindings: net: ipq4019-mdio: Document ipq5332
 platform
Content-Language: en-US
To: Luo Jie <quic_luoj@quicinc.com>, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, andrew@lunn.ch,
 hkallweit1@gmail.com, linux@armlinux.org.uk, robert.marko@sartura.hr
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_srichara@quicinc.com
References: <20231115032515.4249-1-quic_luoj@quicinc.com>
 <20231115032515.4249-10-quic_luoj@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231115032515.4249-10-quic_luoj@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/11/2023 04:25, Luo Jie wrote:
> On platform IPQ5332, the MDIO address of qca8084 can be programed
> when the device tree property "fixup" defined, the clock sequence
> needs to be completed before the PHY probeable.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  .../bindings/net/qcom,ipq4019-mdio.yaml       | 138 +++++++++++++++++-
>  1 file changed, 130 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml b/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml
> index 3407e909e8a7..7ff92be14ee1 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml
> @@ -15,11 +15,13 @@ properties:
>        - enum:
>            - qcom,ipq4019-mdio
>            - qcom,ipq5018-mdio
> +          - qcom,ipq5332-mdio
>  
>        - items:
>            - enum:
>                - qcom,ipq6018-mdio
>                - qcom,ipq8074-mdio
> +              - qcom,ipq9574-mdio
>            - const: qcom,ipq4019-mdio
>  
>    "#address-cells":
> @@ -30,19 +32,47 @@ properties:
>  
>    reg:
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 5
>      description:
> -      the first Address and length of the register set for the MDIO controller.
> -      the second Address and length of the register for ethernet LDO, this second
> -      address range is only required by the platform IPQ50xx.
> +      the first Address and length of the register set for the MDIO controller,
> +      the optional second, third and fourth address and length of the register
> +      for ethernet LDO, these three address range are required by the platform
> +      IPQ50xx/IPQ5332, the last address and length is for the CMN clock to
> +      select the reference clock.
> +
> +  reg-names:
> +    minItems: 1
> +    maxItems: 5

You must describe the items and constrain them per each variant.

>  
>    clocks:
> -    items:
> -      - description: MDIO clock source frequency fixed to 100MHZ
> +    minItems: 1
> +    maxItems: 5
> +    description:

Doesn't this make all other variants with incorrect constraints?

> +      MDIO system clock frequency fixed to 100MHZ, and the GCC uniphy
> +      clocks enabled for resetting ethernet PHY.
>  
>    clock-names:
> -    items:
> -      - const: gcc_mdio_ahb_clk
> +    minItems: 1
> +    maxItems: 5
> +
> +  phy-reset-gpio:

No, for multiple reasons. It's gpios first of all. Where do you see such
property? Where is the existing definition?

Then it is "reset-gpios" if this is MDIO. Why do you put phy properties
in MDIO?

> +    minItems: 1
> +    maxItems: 3
> +    description:
> +      GPIO used to reset the PHY, each GPIO is for resetting the connected
> +      ethernet PHY device.
> +
> +  phyaddr-fixup:
> +    description: Register address for programing MDIO address of PHY devices

You did not test code which you sent.

> +
> +  pcsaddr-fixup:
> +    description: Register address for programing MDIO address of PCS devices
> +
> +  mdio-clk-fixup:
> +    description: The initialization clocks to be configured
> +
> +  fixup:
> +    description: The MDIO address of PHY/PCS device to be programed

Please do not send untested code.


...

> +
> +      qca8kphy2: ethernet-phy@3 {
> +        reg = <3>;
> +        fixup;
> +      };
> +
> +      qca8kphy3: ethernet-phy@4 {
> +        reg = <4>;
> +        fixup;
> +      };
> +
> +      qca8kpcs0: pcsphy0@5 {
> +        compatible = "qcom,qca8k_pcs";
> +        reg = <5>;
> +        fixup;
> +        };

Fix indentation.

Best regards,
Krzysztof


