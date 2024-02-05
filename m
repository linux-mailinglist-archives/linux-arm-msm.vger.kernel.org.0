Return-Path: <linux-arm-msm+bounces-9772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80136849507
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 09:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E688F1F21A77
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 08:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1C601173D;
	Mon,  5 Feb 2024 08:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ajHR7gKq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93C511190
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Feb 2024 08:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707120257; cv=none; b=NSlUzPCC63Jl6ursQWZSCHbe8KaNDlEfN6hsiIae/D97ayey7lt9mtW/n5oRmjIuXbULBXW3CfgWbqWrMBwtaymtjZU2pp3+jEZ5015UWylU7ZEnvaEpr+kcCDnsA+8hxIwrzPRee1/iV/uVkqHxC6hIuFhhTb+/AgLQJAHIzaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707120257; c=relaxed/simple;
	bh=TrE/p3ttE3stmZdiihuuez4I8ZtTs4vsKSjS4QC8bbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RSa2GuPD5E33jQ9qVX3CPs6Xb30eujAlXy5v2HyStHqbQ9dQFIgalcQnkFyp3C9SYxR/uXadNFuYvYoH/f73El8FtTmZbO8fdW6dy1b2K7tRstmHCF1+MY+uzC2PxjpG9wPOGHpwJfDBks/l8pD3JU/LSJZfxdgVdROxsrdm/Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ajHR7gKq; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a30e445602cso1067368066b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Feb 2024 00:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707120254; x=1707725054; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ly53AiJS3SoOsXrI7rwMSWndr6ZfowNIwWczf0zRPgE=;
        b=ajHR7gKqw7Cuv9SrcI9H8/UsB6/Q4xcDabTUkBAxFG19RJAzsFQACJ8varAJKAIToy
         QP1V6ROBeXLqz2BWeIVc7yiXIauMIk31Tc5tT6VomJil44ZsaxZNtOsButyN+qNAbIiw
         43gFHNuus28ZFamTN6xc9k6ZIOpz0jforAmXed7YbWgNgFMA517WoJuHms+NTXQJIewQ
         rmfe7DV6vGILd1CWsA8zfVG5B4kIjsZMX8MvmYsuloMgeR0iHHWWLCv/uJbQfgXiRIOC
         m/d3Z4+3zLFnOocvx188btnvwlkSfqW7V+ZJE29yRnInyGFLE1JijaIAYiwe4cmcrGnM
         KUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707120254; x=1707725054;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ly53AiJS3SoOsXrI7rwMSWndr6ZfowNIwWczf0zRPgE=;
        b=iArvmku2ekwnQZ5vVDp5xxx8N8yd2Xu5rUwXrA/wYLJCPtZPOwC9MVzNXtBPao7Lr/
         IFjNiEEAolKbuKNJ6Wfc3XAy+Gu8nc5tdk4QnmO19jbMxGGM/hgEi3nNmgsfrD3GvTM8
         JKBUGUJCpnDF27r5JxGzTQ3N0FBk/R2WTepb3vcjNvFVzScDYl3LK8cCDPQvIMrN36Km
         U62S64IJeyDE68riDM/zw7Bgl9rAYSPpUiORkQwzdMIA2uSIMMUCud7EEwSz75WoqXHl
         wFvzOBq4NK3exFZKO/MU7ZtJapiYW7EBW2lBPWa4CaD8zG3gjtMzQpxqxuio0E2yL747
         Dlsg==
X-Gm-Message-State: AOJu0YzugeBZQDWajsAjGDGzYSCG5Vo/cvkXMJ29soYX/N1GvAhJ0aWm
	L8TZdQCHn8SD1EflVB6w+7Mqmr9XnFIYiQxbIGLfAwTLkVmubijRcOR9SWGBeMY=
X-Google-Smtp-Source: AGHT+IFSigaVXMIkg070FfzpRmT4ZkCo0EOQNsSqGCQz0cCkYGX3PBTgbtEWdEXoN3W/UXXniPCYoA==
X-Received: by 2002:a17:906:d294:b0:a31:818c:ffe0 with SMTP id ay20-20020a170906d29400b00a31818cffe0mr5072466ejb.19.1707120254210;
        Mon, 05 Feb 2024 00:04:14 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW/uUJodGhb9aEg7ZFXJMNzZn2x8furlJgVBImMlXUIqNGaA46B1mD23WUP4c+bIEHKdeHXcybt6izRMILO/QNHXMV5oYxgAEkUp409PRVNmr45D40PpwOHV2NueuWwvSSrWx+6i2Fv4hfn8QOnskaRIqVn18Rr8rKlISQjuZiT5jsgu5Kj5DBeDJ61iUv5u7nsGzpdFFqVRyUeH2+egNrh9/imqtrnU7cxRyBL3FuDLk/6gRmymNmZ1hiEwo6zKr01UmNdorZz7r5RZ6UAmgUdSLPP3wZaHkcftRCiO2l/BFPy55qHrUOhhnGcm8alWWSJl/bDNi0bV+W8VIF7ZltOviqfiKl3j5BpIcPWaHzSgpeVnEiF
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id kq8-20020a170906abc800b00a30cd599285sm4004822ejb.223.2024.02.05.00.04.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 00:04:13 -0800 (PST)
Message-ID: <04fa81b1-e47e-4cf9-8e59-3a1777a13879@linaro.org>
Date: Mon, 5 Feb 2024 09:04:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] soc: qcom: socinfo: add SoC Info support for
 QCM8550 and QCS8550 platform
Content-Language: en-US
To: Tengfei Fan <quic_tengfan@quicinc.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 dmitry.baryshkov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20240119100621.11788-1-quic_tengfan@quicinc.com>
 <20240119100621.11788-4-quic_tengfan@quicinc.com>
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
In-Reply-To: <20240119100621.11788-4-quic_tengfan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/01/2024 11:06, Tengfei Fan wrote:
> Add SoC Info support for QCM8550 and QCS8550 platform.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>

NAK.

Drop my tag.

Best regards,
Krzysztof


