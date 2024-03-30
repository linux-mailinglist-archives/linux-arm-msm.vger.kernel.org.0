Return-Path: <linux-arm-msm+bounces-15810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4208929DE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 10:05:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6ED971F21C0E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 09:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619DEBA57;
	Sat, 30 Mar 2024 09:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UQNzZuDF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6724EBA34
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 09:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711789509; cv=none; b=OrBDpk3VfF3FQNSpoAIpmuQMe/xa21kZ3zKaa1sGNYEgIAOrbP1QF+7o66CVX4IVN/t6/glgun/gbrViljxyEzRndtwGjdbB+F2A7qEHKAOlptemJQ2LR8uIrQsNk/h/UmcFH1RysF/8K7LVa8Hi9PrWf+4XKPUx2aFqo4cN2O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711789509; c=relaxed/simple;
	bh=BRPSbu5SXLCSBTdAcz9esHtN7vO2IfNM9BQEiL1ym18=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PRwH45OKBlGzMdPXtgS5taLQxFoTtjC75gxk3PXe2n7ztSryct/Qhnv2RUua39lIWuTCvep6wgzQZyu82XRmP70SCFrIqqt13guvpuEeeQj18Y+UxAbNMN1qfZgY+audtkYlB6mcQdigRzO6yr4bPTukgNdHNCV+i32QdArEXOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UQNzZuDF; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3434275ad73so97764f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 02:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711789506; x=1712394306; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cjfde955e+AfD7bCuWniLgBVv4tolPtzhxIYBfKnkBs=;
        b=UQNzZuDFtYsY1n/UKACajuGM4Ydes01PQR60kumU3NuhxsK8Ypjtt/Upq/OzRMk1q9
         oy+pH/25kUe8ZBtnDB9AU3jY9TRyzOSdY5bsXecMnhiV73yvhOyI8GokWn/2EIk7Zey1
         Q1dgzg/CREMXB3jMwXVGsxINeJ7mDDAR+AG2K7rhB6D2w+fjOPAIxyIfLDPVQHShMBER
         luVVJr4g6ztXPXAup+oEIZgAkJUSNJyvZ1bWixyePmjq9QXHeknA2ZME4OGWjUh52Rya
         fLvekdaNC/Q2oJFlzT8BxnmCKYG47I84ngGG0GCwQ/OA3ARxsisY960cN2ZDEHboJRRs
         VtwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711789506; x=1712394306;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cjfde955e+AfD7bCuWniLgBVv4tolPtzhxIYBfKnkBs=;
        b=TJ7uhEAKGf0kzlRqHvEnnKnE1q0Thh43W+0fbBL0/iYzZHeGq5FvPt7iY+KER/nyao
         qd/XGYkPfbBJ4tq3QVJ7TxrfwAKnSubPCT7HUx2Pl4iyExlQnypNL5FGi7NxuVAbvU8v
         p4mOistG0lqg7sfRhkArG/SRVWQIOstxFgThVdXxYX8QXisEef68k37AKEVg98izIcUd
         gkVUE2dPRaJKyT5/6WLZK9lnLbADAnhP3VwOM2BidKi5Uwktw2D8HxiA+6VOk0nOFhYr
         Hyp1efiN3a2JjQ1DqQ7BQnTN5A7gEknuLbtom7YPdSWiylC7IC+7LimMmJHVgdxKaMfm
         1xXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXctyHYM795u7GkoRE5ts/10uAIwhzlLTr4dRyZYVfxfkndjmKIaQG/Fqq7LKmOfeiHTIKFYrmRng+U4aStPsVHUDzxgX0r1IUlyZT2Og==
X-Gm-Message-State: AOJu0YxF9dZCqN4r2AadjlkBpzo+T2Fv5QRVYfqFb3vUM7FusD6d56wg
	oAoaxk6zwbFbLoJskLDHNKikMEvg6Kdm/EMdzvvaKo/tiWYzCFJ3/fU74pGkBKw=
X-Google-Smtp-Source: AGHT+IG2+IzU78xgARzqG1oeVmcbSAccuJka4sSnj1FR48vqsvncAIv0oanr1fRTfha5FvmBhLc2Gw==
X-Received: by 2002:a5d:6451:0:b0:341:b9ee:753d with SMTP id d17-20020a5d6451000000b00341b9ee753dmr2716884wrw.53.1711789505556;
        Sat, 30 Mar 2024 02:05:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id m11-20020adfa3cb000000b00341cd8e04a0sm6026940wrb.105.2024.03.30.02.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Mar 2024 02:05:05 -0700 (PDT)
Message-ID: <36547f9d-1331-4e9d-96dd-a36bd64c7cbf@linaro.org>
Date: Sat, 30 Mar 2024 10:05:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: pm6150: correct Type-C compatible
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Danila Tikhonov <danila@jiaxyga.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240328074544.5076-1-krzysztof.kozlowski@linaro.org>
 <7f28584c-0e9a-44bf-b0c1-7f7a2acfb847@gmail.com>
Content-Language: en-US
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
In-Reply-To: <7f28584c-0e9a-44bf-b0c1-7f7a2acfb847@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/03/2024 08:07, Gabor Juhos wrote:
> 2024. 03. 28. 8:45 keltezéssel, Krzysztof Kozlowski írta:
>> The first part of the compatible of Type-C node misses ending quote,
>> thus we have one long compatible consisting of two compatible strings
>> leading to dtbs_check warnings:
>>
>>   sc7180-idp.dtb: usb-vbus-regulator@1100: compatible:0: 'qcom,pm6150-vbus-reg,\n qcom,pm8150b-vbus-reg' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
>>   sc7180-idp.dtb: /soc@0/spmi@c440000/pmic@0/usb-vbus-regulator@1100: failed to match any schema with compatible: ['qcom,pm6150-vbus-reg,\n          qcom,pm8150b-vbus-reg']
>>
>> Reported-by: Rob Herring <robh@kernel.org>
>> Fixes: f81c2f01cad6 ("arm64: dts: qcom: pm6150: define USB-C related blocks")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/pm6150.dtsi | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/pm6150.dtsi b/arch/arm64/boot/dts/qcom/pm6150.dtsi
>> index 11158c2bd524..b20a639cddf3 100644
>> --- a/arch/arm64/boot/dts/qcom/pm6150.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/pm6150.dtsi
>> @@ -71,8 +71,8 @@ pm6150_vbus: usb-vbus-regulator@1100 {
>>  		};
>>  
>>  		pm6150_typec: typec@1500 {
>> -			compatible = "qcom,pm6150-typec,
>> -				      qcom,pm8150b-typec";
>> +			compatible = "qcom,pm6150-typec",
>> +				     "qcom,pm8150b-typec";
> 
> The warning in the commit description is related to the
> 'usb-vbus-regulator@1100' node, whereas this fixes the compatible of a different
> one.
> 
> Did you want to fix both?

D'oh! There are two of them! Thanks for the catch. Yes, I want to fix
both of them :)

Best regards,
Krzysztof


