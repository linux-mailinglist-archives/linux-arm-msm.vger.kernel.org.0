Return-Path: <linux-arm-msm+bounces-24288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 424B79182D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 15:42:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C32981F220F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 13:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7DE184119;
	Wed, 26 Jun 2024 13:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kndbby9u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E671836FD
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 13:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719409340; cv=none; b=QfYBEg5DzXtH56dSHFpsf1AIELALxGCVa4EhdjIcCyM22hJqPNzNLf/Q8yNlD/IILAkE1cZ9PcPmaVkdfNuSZV+4nmBShy+wAponER4yEfzc9Xc9Pdb2yr2Bykosj2gXeVPLcIOjmlsBQM8HIgfWoO6Vm5k5udO13i1E4PFSCnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719409340; c=relaxed/simple;
	bh=G6GyLrPxIJA6BepJXCLQUuFU9Oo5t/0slMuFQKBEb9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eR5N2OivoHmuiCPO7c5Ab2yBMUJLJLn0HpLtGD1MUD3A2iYY/NUBTdZrthjvL8UaOa21w1VGG7A9BgMXYi7ogFccJNKltZda8gaMGhDJyu/U8k6aDITH7dfDtxroQ+uIhgZ87iC/JHZ8a1hN+AyRU/IddQKoYK+CHr/um0aR7ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kndbby9u; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a6fe118805dso465702566b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 06:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719409337; x=1720014137; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jTXxPmLrWcDLxWQcA61tAzuHvB6N4vS5qqMUk8CYcTE=;
        b=kndbby9uCmbEX7dC/xprFEAUpW03mjpHvmUdZ3AFGWIHfCqxUfoFDuWZIz2nD8FflB
         Cdqu7ErCtAcxeDsaK0ReOg30OdVZs8KT/GXlUoZphG8BQMBaVJKJ2OOlQqjmef4Lw3SK
         OHTEeNkXUdUVVzVpX3a6EwUBPw8ESH7LvtG870Y2XsyaY3+Fv/XW2tTNm/p41ECmoyDL
         ZbFmGwLv10Xge2IAcg1ZAIuqWpUcbEvEc84aGFE5+tPKBtj7PDnddUuJdRTEpJUdvJP+
         bP/pwbWZ82/CIhvQkveSafiNZCI1eNEHiNxhU5x+WdOPKqwBxzwK8r5+foyl7mGFVn7y
         VkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719409337; x=1720014137;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jTXxPmLrWcDLxWQcA61tAzuHvB6N4vS5qqMUk8CYcTE=;
        b=mSFKsKOMPU/nlLb4QnCuCt+Fs7rLZFx63wDyZlPxNdd3hABKDgXkiFvkTQbeC+GBm8
         C3q67Gk9/lWZfwLMGazg8X6nzKgMX0DQESIyysV4CiHo13vGolExH7MmQUUSGj0HiDBB
         GzgtGbkgc/gLL0OI9cufxnkq0mpLuScganDSRZTuquD3F8Id4xlFT1MObKvB6CHNBPc1
         GNcwcXdP6HULI8ZDKcR/0qzGfU/RQFz6ATlss2bLzKAwZImalLtdkIiB6pCRGl9xz23d
         V7Em7V9a6FcjfJiBEHRGMJmIyvfjDWwy1X77tfQ6kN7qajHf05Dd7eUxaqFiPqa7UrUM
         X/ng==
X-Forwarded-Encrypted: i=1; AJvYcCWvRBFO/BKJaerkj0jA8RpxhrFPANmAocg36cxe9RCwM8IieRAbppWgGC1GDtjoH3Onqr+ZOd7retl2yt7ekWGBNScoj5MUfBbPsLhxQA==
X-Gm-Message-State: AOJu0YyOmdAFTB22Te78ELv8/zpvSZyKtuUKdzNPLFeMspk3XGWRcQEe
	bISH5Fkw5Gdj9tCmeFg1ZcdKDNfihYVR8YyzRo4q3FAe+zDFmKXtq+1U02I8PkY=
X-Google-Smtp-Source: AGHT+IHbbmYwAFIwJdfdBQVcmTumFs5wYR9NHjq2jWwg2REG+VKa/MnbYMvIunoF4rA5s/OlT7Mkxg==
X-Received: by 2002:a17:906:e085:b0:a6f:b7d5:f80c with SMTP id a640c23a62f3a-a7245c85a4amr627079366b.15.1719409337359;
        Wed, 26 Jun 2024 06:42:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a725fe640ebsm243709466b.196.2024.06.26.06.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 06:42:16 -0700 (PDT)
Message-ID: <4106f2be-be0b-4263-9e61-c3a29e837a7c@linaro.org>
Date: Wed, 26 Jun 2024 15:42:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] pinctrl: qcom: add sm4250 lpi pinctrl
To: Linus Walleij <linus.walleij@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alexey.klimov@linaro.org
References: <20240612-sm4250-lpi-v4-0-a0342e47e21b@linaro.org>
 <CACRpkdZyupZmV+e=L0KR8ospH9P=wdUrMFvBnGXyfhLhW3-=PQ@mail.gmail.com>
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
In-Reply-To: <CACRpkdZyupZmV+e=L0KR8ospH9P=wdUrMFvBnGXyfhLhW3-=PQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/06/2024 12:04, Linus Walleij wrote:
> On Sat, Jun 22, 2024 at 6:49 PM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
> 
>> Add support for sm4250 lpi pinctrl.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> No major protests against v4 so patches applied!

There was a protest from Alexey, that driver does not probe correctly.
Can you still drop it? Not sure if worth revert, though, better to fix
incrementally.

Best regards,
Krzysztof


