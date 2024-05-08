Return-Path: <linux-arm-msm+bounces-19474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AB03A8BF731
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 09:39:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 214E9B21124
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 07:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777C922301;
	Wed,  8 May 2024 07:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QxIDHyNp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6D82C69C
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 May 2024 07:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715153936; cv=none; b=gV0aFiH+Ik1yAtWuHCeAbLu7TSJdX9FE+s8nOb+Om6ZmaEzRQlq/AC5RB5zs/NXjYp3Ujdq8FC9XVW3Ub8jCaGVqZaCYceWfucGGlEJ6JIya+86MrhuLvVs5JwrC/xGDWaa4u2FcvDJ5nkm+riTpsXRjLIzQc/kjF50s5K5Vtpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715153936; c=relaxed/simple;
	bh=SBOVOiXN9OCg9V9VD7kqhWTaeVgeQpnNKQnDqoUqV0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FFqzrSMXXE3zV+trczfGn7wXshBgBNWxBpiFJWjZk7tiD3gmfAdcD4R6Wm4TlUv+yg89KVGZ8kcQxIqi2Gj81B8Pyb7iimWV3XIbNY8s8OZUdZFosObonLU8YWoWyHHfX2f0t758gRPqO6BXvDBdFmZ6IVIbRRS9rWQb5gGLmUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QxIDHyNp; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a599a298990so1081741666b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 May 2024 00:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715153933; x=1715758733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T/vpm+eDDReEZuHygvnj1R98P6ydkB8dUdLS8P29jOU=;
        b=QxIDHyNpNAPxfy93emlocFOn/wP+5BWJZdjBcZ2/++iPZFuzp/P9AHdXWrx2Z5jJUP
         N3mnXq3bUCu4ykO0INZ8mfo/eUUxGtuKMcsjiuRjsjmYMpnZ9GeTt90MlJO7NbhRvXqq
         u9xzQ6ttaTb5ZUuccq9nVIZ5AuysyEwKm6JcEZOu52o8rD/hFZwUKmpolpV5rUYPXHem
         ZGJc5gad+McPtcIpzp7OOsV1/Dufo6pWBovksq7IXvHXlI8ajOdk3PzC1GrxoXGg4NlA
         rxJplq8T8hXSSQLuUknJ20wBVPheU+cP/DyY2x5z7gzy4maGMBRKKIIg+LRrGKbBK1uK
         kCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715153933; x=1715758733;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/vpm+eDDReEZuHygvnj1R98P6ydkB8dUdLS8P29jOU=;
        b=Q4YcFwva2q3PqN4ZTh/PE47OnQc2jZn9T7UyPQRfW2KS+5SLWtjcPQNii+F1+ZlTLj
         YO88+RXZtSe1GBr6ouuWfwWQaFNPkOcWCS8tr1tMVclhb7VA1qgcf+sRUsLWbIh8QZZY
         axv9vVYiiWzJZ4zxvOYKKmuQwJjelz0GpQA+sV7CGTBptPCt/9DOpMhvGYYeMCT07RD5
         /Ee4gW8BRn7zrAZi+w+BE5+UbGWDoPy4sjFQ8EvL1nRG5NCzd3A8JlaMiDIK5c5n+Wko
         behCO08c84ebSfGgfoVs2KpHDLcQxwVxc5BocNdEdJPjt29/iT4BdlirpuoyOFCexOAL
         RvQw==
X-Forwarded-Encrypted: i=1; AJvYcCXbFATgUD/BnR/H6kv768KOPZ7bWEQDPMwM+zW5Mwvj4W98BUcrQIWvq6l/PmPi6UsSJ6pmnrtRwrEbi59gpR40RWqWeRtKc0O2pW0DWw==
X-Gm-Message-State: AOJu0YzkOdV/S/ojHUcZYIc0iOP2ZlMSXHuJoJJqrHB/elrWuJ68LvIB
	F2USmUh0XG6yCHAGzOYjTSvdSRKo7qdKec0t5l+Z2cZ4WDdXiaPThjzVbxj4uwqDOGwHFDWM7Nb
	+
X-Google-Smtp-Source: AGHT+IGBXdSHHFhDpe76q3MwnNUtYi03w/2scTZQzPVTVse78zGwQZ2PIMd37gJMfGFtIhYUbzbNHw==
X-Received: by 2002:a17:906:6d7:b0:a58:832d:c3e8 with SMTP id a640c23a62f3a-a59fb9c88b2mr111539366b.58.1715153932845;
        Wed, 08 May 2024 00:38:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id o19-20020a170906601300b00a59b94a47f5sm4436127ejj.103.2024.05.08.00.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 00:38:52 -0700 (PDT)
Message-ID: <2f810036-1832-42ef-b896-e9470f469029@linaro.org>
Date: Wed, 8 May 2024 09:38:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs6490-rb3gen2: enable hdmi bridge
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Venkata Prahlad Valluru <quic_vvalluru@quicinc.com>, andersson@kernel.org
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 konrad.dybcio@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_nankam@quicinc.com, robh@kernel.org
References: <jr3ble6sxr5mr6cvm6ldvpyk5j4rucj3xy6vbha6ttoecte3d7@llu6qf6oasuc>
 <20240507163045.28450-1-quic_vvalluru@quicinc.com>
 <a32fa81d-bd70-4dfa-b512-e2adce4f8c35@linaro.org>
 <9a48b0a8-d1d7-8e2d-dafa-47e136a46c99@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
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
In-Reply-To: <9a48b0a8-d1d7-8e2d-dafa-47e136a46c99@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/05/2024 21:20, Abhinav Kumar wrote:
> 
> 
> On 5/7/2024 9:35 AM, Krzysztof Kozlowski wrote:
>> On 07/05/2024 18:30, Venkata Prahlad Valluru wrote:
>>> Rb3Gen2 has a lt9611uxc DSI-to-HDMI bridge on i2c0, with
>>> reset gpio from pm7250b gpio2 and irq gpio from tlmm gpio24.
>>> Bridge supplies are Vdd connected to input supply directly
>>> and vcc to L11c. Enable HDMI output, bridge and corresponding
>>> DSI output.
>>>
>>> Signed-off-by: Venkata Prahlad Valluru <quic_vvalluru@quicinc.com>
>>> ---
>>> v3: - Updated commit text
>>>      - Arranged nodes in alphabetical order
>>>      - Fixed signoff
>>>      - Fixed drive strength for lt9611_irq_pin
>>>      - Removed 'label' from hdmi-connector, which is optional
>>
>> Please respond to each Bjorn comment and explain how did you implement it...
>>
> 
> Yes, agreed. Even though it seems like you mostly just agreed to mine 
> and Bjorn's suggestions and decided to implement all those in v3 , it 
> would have been better to explicitly ack them or tell why you agreed or 
> what went wrong that you had not done it in v2 itself to close the loop.

The problem is that one or more were ignored... By responding to each of
them, I hope they will be finally read and understood instead of
repeating the same mistake three times.

Best regards,
Krzysztof


