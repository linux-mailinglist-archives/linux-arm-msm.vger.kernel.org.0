Return-Path: <linux-arm-msm+bounces-40176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A039E3401
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 08:20:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEC3C16805F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 07:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2760A18A6B7;
	Wed,  4 Dec 2024 07:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pTqVvx5v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C7D189BB3
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 07:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733296822; cv=none; b=qv9wi969IDTPR1YtqPYOhEN6O7New0sGCbq19T4SrjGJ0alpD10PRBuGbCFVmtMmABzzDQkmZd6Pv1EIu2ul3hEr4kCuVaA84yLZGT1ztgEjll1iKwtUyUl0O4/euwjNXM4QKSNoPC1wCtkhd8UcplWjlSpqsAoRMeLVIxQJB0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733296822; c=relaxed/simple;
	bh=XpmoIiWrZXqhLQEQWwxSoIfz5XrHLpHxVKKToCPUMPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g6DenrDO+tIJmXi5S7fm+Dk7qS8BbEieJEtEJeSBCSIKNUDL/9JrCZqi+FRxwVmEOxiWSyZq7tZfAngJ6CDCD5rbqL+iRm0gZZBnPWC4NT3HEz1tBAm2Maep7JhXHasCxsU4x549Iy50jfdwwbtQVJuOoZI205r6zWzLOwcZvwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pTqVvx5v; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434a12d106dso6477975e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 23:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733296817; x=1733901617; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=I+OP2XRDFxzd5buc9U05AnExcMaJ2h2jyO60oxfRF98=;
        b=pTqVvx5vgmoauPKOBzKkA/mN2LMWgog+GtpHv1hNUDXfHfgWae0ZmbgsTw3iVQM+uq
         5FpN9gjCUIuCpxEsDuOGGwCR27X7DzfoC6juFoWO7LbVhe1yZalPpsxESqMzo+ZlqrMM
         ITMEmbfVvJHAbR+QB8ZpKMni6pDF5WiOTmZTo520MBeOqoBMGthXHZmx+ssDUPkmJv7v
         DSUT0aRlaD8dO+d5YUiNmvmfTyQUPF38UgKg2z9SuGxZIbqZSFEbMjAfGnPXn6GMt3yW
         xK7h0B4poXx9HJR3bGSu6WRUOJQhMto30ee5/IHWKctKHu4+lC2BnMANe+t1DOA9kasN
         /YvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733296817; x=1733901617;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+OP2XRDFxzd5buc9U05AnExcMaJ2h2jyO60oxfRF98=;
        b=ts/RxtBguoSbqzzNuNRayF2p8pZwI0I7kJeP0/Dk2mmrj0o6KQmMpfB3UVWtIuoBEY
         H3t4kGENiH9FqfHt9zpjS8c1JfMMYa+FIrwWN0qcIwlspmcCwmGdEP575U8aaJWrg9iL
         EPPkZ/HCLiPk6ZXSPG97wnI7VY1aHcNXeyqseoDXboOIAe1C7BT8Bv9iiXQI8PdAOu4T
         x8lyVjOlRkGmJInvVLjycLWDp5kImMwcalrJt6zbAGvP9nxWt5zDDR4revBD2bc0gTng
         WoYN8qYKF4JaTj/yrFC4IOjcL/byosJiUvgO9my3+WMx68KEPimLddjRU4dAmtN4bHBu
         reLA==
X-Forwarded-Encrypted: i=1; AJvYcCVheEwLM7Af1UOwbP36HiG/mpVWytwtRt6LhVPg2FEDETytmw18MM7ocHWzZ5IxQxshneMk3H3JfapDlGnV@vger.kernel.org
X-Gm-Message-State: AOJu0YyCkpnzLlDNyirbJ9x1bf+RxVZx5mCSVc3dF70YT6p5ulhY+SwP
	T6TXUoixB5KJ3h/dXIPzoRbxQ6m45tOtDtGUT/4+OR3+Qjovx53caQR7BPLGCL4=
X-Gm-Gg: ASbGncu33X+8776NiQ8HhuXVa6/zVbH77gxRzgt1xl39xMg2PQvlE7Xfd+auxZvQmUA
	P5eQhWNVJBVhGLXEkSFtR11gTqqVO953RTUpX2Co8UHuoLrTlDtPB0aKfvxJ5PV5SpoU7vJglet
	a3lExJtgU9xQ+xkg7k5K1kAUHiqaYmAqJtCNeivgKgPAzekRqB2OcApE3eBId2aO4bap7cC7ePg
	rdGAfWgsqbM6SwewhGxmaNRL2ad7qSq+cM+Mr1mM/2j6I5jWOzhm2LNDjlJV2TCDcTNBQ==
X-Google-Smtp-Source: AGHT+IFfknQJGQBVSOwzPgEsFxW8cK20G/wE7a7QGLZHB47TqnSr1ax1QA/1qIxHJps91S0sgtvZ1Q==
X-Received: by 2002:a05:600c:511b:b0:434:a0cb:6d24 with SMTP id 5b1f17b1804b1-434d117123emr16931885e9.3.1733296817631;
        Tue, 03 Dec 2024 23:20:17 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52cbd72sm14308375e9.44.2024.12.03.23.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 23:20:17 -0800 (PST)
Message-ID: <f65e1559-b409-4906-aabb-eb24b5b0fcf2@linaro.org>
Date: Wed, 4 Dec 2024 08:20:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100-crd: Drop duplicate DMIC
 supplies
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
 Johan Hovold <johan@kernel.org>
References: <20241203-x1e80100-va-mic-bias-v1-0-0dfd4d9b492c@linaro.org>
 <20241203-x1e80100-va-mic-bias-v1-2-0dfd4d9b492c@linaro.org>
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
In-Reply-To: <20241203-x1e80100-va-mic-bias-v1-2-0dfd4d9b492c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/12/2024 18:44, Stephan Gerhold wrote:
> The WCD938x codec provides two controls for each of the MIC_BIASn outputs:
> 
>  - "MIC BIASn" enables an internal regulator to generate the output
>    with a configurable voltage (qcom,micbiasN-microvolt).
> 
>  - "VA MIC BIASn" enables "pull-up mode" that bypasses the internal
>    regulator and directly outputs fixed 1.8V from the VDD_PX pin.
>    This is intended for low-power VA (voice activation) use cases.
> 
> The audio-routing setup for the X1E80100 CRD currently specifies both
> as power supplies for the DMICs, but only one of them can be active
> at the same time. In practice, only the internal regulator is used
> with the current setup because the driver prefers it over pull-up mode.
> 
> Make this more clear by dropping the redundant routes to the pull-up
> "VA MIC BIASn" supply. There is no functional difference except that we
> skip briefly switching to pull-up mode when shutting down the microphone.
> 
> Fixes: 4442a67eedc1 ("arm64: dts: qcom: x1e80100-crd: add sound card")

If there is no functional difference and this is just redundant, then
there is nothing to fix, so drop the tag. But the point is that users
might want the low-power VA. You claim they don't want... sure, I am
fine with that but there is nothing to fix in such case.

> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 4 ----
>  1 file changed, 4 deletions(-)
> 



Best regards,
Krzysztof

