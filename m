Return-Path: <linux-arm-msm+bounces-14344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE5D87E452
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 08:50:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8841B20CCF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 07:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD7623748;
	Mon, 18 Mar 2024 07:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="phwocX+S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA65F22F0F
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 07:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710748235; cv=none; b=RI+zNqzzYo49QufqjR+fRoAXnIMQFot3vzkZghgxpaAuTvAmHaW5j2jcj7OrUQnupLXi64WCDwK5CivzzNfi9yP+R0X3ucTBigO0kV6Ff6BClf4rTIYSs/WEy45F6skKGbuuam0szhgh5iU8jxEJuNm61bMwmRh6xAh1XvidfAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710748235; c=relaxed/simple;
	bh=kyTGEIAwksXOu2KDGlKbcXYFvvk1iUgCjJ96gS7a+xg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZJgmlbUU9SE4/jJfAadl6XyvsOYRWSEzqZu6S4dzqefBQ7nHy+z+FpDqjJCwnCC+Rf+NoAX4B0g9JzzUPUaq0reYOoOUbOBsFHaCjphFQEyX5yGmWIK01KExaJYDTNZB/m68J8C26A6pCtZcZSQK7h0cxokr1uPEZVlMk/sq2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=phwocX+S; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5a0932aa9ecso1510246eaf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 00:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710748233; x=1711353033; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lgirHDL8INO+0bARdIgG+dI929ZynykA4OTta1cLum8=;
        b=phwocX+SZ/5OpTSa6B8c1M4Rcxp7RV9mkpY1vlRkGpaN7QB/7B6Tcozc66X9rqCVyA
         9RJ1DQbPTC2pfH/IiqFMe9WSGyBpBJO5iXxKZZDIj1ZWzel1ZgiBAueQr826PhaOngtw
         pz9abjEsIsF6Hpdms4ZshGEsyqUt8a2t6EQ5RZKp+BRaC7tdyYZh28nCnMz6i/r8eMfW
         6HX7gErJFtYAKJrLkD6Zh++/esEOJl5Z2YeY9stHyppjhXGyhsZ3MuoF3mgNboSzbaKu
         R49zSaStUTtU6Q8wzgi4bP7Igq5Hh6sQ74Xckzihnpq3LywxwzvDBeDwwNznceG617Os
         PXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710748233; x=1711353033;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lgirHDL8INO+0bARdIgG+dI929ZynykA4OTta1cLum8=;
        b=NMBL6XNsORHqdGjspoONdzzDlCmoAqqIfpozjkvzWYXmZQCvZavO0uTA+euIqObUT+
         NoxmUy62Xx4sIRzmbHIU608KiS79uWhM8p5nU6MmdsPwaBqSLtTJ62G9lUWrQ3O6UrQg
         aDeNWLoJi/VdyfFogaNYW1+EjVXkJ5X2hqIpSacV5+sSzifL4HiVKuM8PA6eER3TWPRS
         +2jiYtb05Tc9rMYfnyeEALv6OrxjFf5y4JO/YUN6JKT10xs53icxYZTMnF1rIlwIiim+
         OWT/TYwjGSIVhXtwUVQ0y8ha+hhgTq5aC6EK/LUhkrQl66Bq3ioCs7sri8fojCjoA30C
         4OdQ==
X-Gm-Message-State: AOJu0YxdbNokCeJH8Zm+1Vr2y5KqxzchCi+mInOFfNSUfWSY1Dla/6Vp
	zY+fxmPrHG0r+lXOmlKjIXfI5U1kQx0Uz8VAJ5ufcBBYT/g32fXX27XbcUq31Bs=
X-Google-Smtp-Source: AGHT+IEqoi+WcD1L3E4XB7ObMHi2t55Pg9JXjvWfFk1gfg58GaE9EbcJKOYbeP5x//usQ6eXma/iCQ==
X-Received: by 2002:a05:6820:2714:b0:5a4:91c1:967b with SMTP id db20-20020a056820271400b005a491c1967bmr3900050oob.1.1710748232710;
        Mon, 18 Mar 2024 00:50:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id bm8-20020a056820188800b005a4b2172e48sm420608oob.41.2024.03.18.00.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 00:50:32 -0700 (PDT)
Message-ID: <c3abdf10-ebb8-4b77-beeb-65409b08d7c1@linaro.org>
Date: Mon, 18 Mar 2024 08:50:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] clk: qcom: lpassaudiocc-sc7280: Add support for
 LPASS resets for QCM6490
Content-Language: en-US
To: Taniya Das <quic_tdas@quicinc.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240318053555.20405-1-quic_tdas@quicinc.com>
 <20240318053555.20405-3-quic_tdas@quicinc.com>
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
In-Reply-To: <20240318053555.20405-3-quic_tdas@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/03/2024 06:35, Taniya Das wrote:
> On the QCM6490 boards the LPASS firmware controls the complete clock
> controller functionalities. But the LPASS resets are required to be from
> the high level OS for the LPASS SW driver could assert/deassert the
> audio resets.
> 
> Fixes: a9dd26639d05 ("clk: qcom: lpass: Add support for LPASS clock controller for SC7280")
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/lpassaudiocc-sc7280.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
> index c43d0b1af7f7..d68139762a80 100644
> --- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
> +++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>   */
> 
>  #include <linux/clk-provider.h>
> @@ -721,6 +722,7 @@ static const struct qcom_cc_desc lpass_audio_cc_reset_sc7280_desc = {
> 
>  static const struct of_device_id lpass_audio_cc_sc7280_match_table[] = {
>  	{ .compatible = "qcom,sc7280-lpassaudiocc" },
> +	{ .compatible = "qcom,qcm6490-lpassaudiocc" },

Why q is after s? Really, keep the order.

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, lpass_audio_cc_sc7280_match_table);
> @@ -752,6 +754,13 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
>  	struct regmap *regmap;
>  	int ret;
> 
> +	if (of_device_is_compatible(pdev->dev.of_node, "qcom,qcm6490-lpassaudiocc")) {

This does not scale. Use match data.

> +		ret = qcom_cc_probe_by_index(pdev, 1, &lpass_audio_cc_reset_sc7280_desc);

No, qcm6490 does not have two IO maps, according to your binding.

Best regards,
Krzysztof


