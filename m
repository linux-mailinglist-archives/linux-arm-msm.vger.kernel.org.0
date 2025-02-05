Return-Path: <linux-arm-msm+bounces-46944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8036DA28C1F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 14:44:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A78191889D27
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 13:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38FDD14F136;
	Wed,  5 Feb 2025 13:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rVf3N9aw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AE813A244
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Feb 2025 13:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738762929; cv=none; b=L9j0c4k6hr4Fllmx9Qf9aT7eVIHKdZDsSsUz2N7EH9LatDvrH2yqvPNV8ha8IL+IKlqZksCP0atRZkf6IqqV82mBjtFLwh7vEEnbcJYaFojrmrrNsubiVkE/PQA4QDH1COYlRp/tadSHTcTOENdSDqJfYgf7PwDEZkRxxPbAsmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738762929; c=relaxed/simple;
	bh=Tr6gk8mwOM8rUcgX6ppWE8DRWNUKdp0BJaNSlHBDD7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X3dRufAn0y/k064XLLFuKwycvTsahttUQhBGlozOg7py+th+aZmIdjMGH7wAqYjotCcpwHwkSHw5ULnoywPW+gJDBOhOOZ3L7sID322CuT83L3u1PA65TKr5CqgojlkNZERy/cF50Ql3/jDbhcSHgdCaPI6a6SaC3nyayoH54Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rVf3N9aw; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434f398a171so7814925e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2025 05:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738762925; x=1739367725; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RmTWR3E4/fyFZTzGOvOGvOYig/SbNCWhanmwAwdSBik=;
        b=rVf3N9awwEmageBo7nnPdWZuwlLoI1PkjrZ5j5XfoPtiHM3GIezi25eAQojy6OVKri
         zgCAwJBnlfjgfLckqH9/uHKkpOhDS59QWAGj2VxJoMehzJzm5B54qbXeutY7ucsWR02e
         +7akd/nhktjhoGfncd5Rrl/8hzuzSKuq8x3fkO8YSqlBjrBFHfepT2RFVD4SzVpXcshR
         duy/EDCgA+GrUX3gScGwrUsKc6nOJKAkIGKn67HYlbdT8JAXb31q8Xy3+13z78r8AEBg
         STF0ekM8bPtSCQdRxGLCxpnxzwTB4lZuLr6PSKLHI2pMVX/cEqE41ji0T3ShCIJKWsZw
         bvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738762925; x=1739367725;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RmTWR3E4/fyFZTzGOvOGvOYig/SbNCWhanmwAwdSBik=;
        b=tl+rnlIO4RA5scQ5zCxYcgiChfytBlPU85EPlkxnN8X+54AXgJdB7V80naXiP3/Hlx
         7XM5K9SdTjfRTEtXsR3QCtJDZz1eXo1Oj4mwGEq5ohli9fCKCcUIaUgK4zhR65MyOjRP
         Bakuck/ruBrOo9Fy/FwVDq+mJJgeb5ixZmsKx4HJYwDYVfwJGH8CkYwS57/LGFSO1Vbl
         VcvsDPhsLfUgz4vKXPQlJyLqRDF4ouKC1B9tm8gRcXJlNZwU+ZMZn8mzwIM/nLo6S3/f
         uWzVPyxAQTpcd06i/4WTHVAR1+z5a027kV30q93eDVujiUhsd1+ADJkmXMyub1FNc3mZ
         YACg==
X-Forwarded-Encrypted: i=1; AJvYcCVWNpMx4ZPHGwKl8gvRIc+7b030Gf7mI6Q9BeBj40m6TiJqyCAQr1f7NUqTYtDubsPFc7ppDai7cvZh1HIR@vger.kernel.org
X-Gm-Message-State: AOJu0YxPZ8oCfW7Jrmpl6GrfuR77MEHHhvClthQKy7YipmaQzol6A6g9
	VQGg5kgo/PL43HCf8rywgZdFrgEbr1MmBLyNdLPFofZ9DaLVwnB6RT6/QfYBKok=
X-Gm-Gg: ASbGncs9URua8hqQwTDuVTRnV5uT9jG5cowaig1JoHUvUWRTBykqx7fWo86xeaZPBhg
	eoL0O8++3+wWQczlJ/CYlbVQp/LD4gSQyMuDcmIVPyGnRbyHDU2EUPifa/98AMdtZfC3KCYwzFp
	fqGN5R+TYngt+x5mx0umXQZtx36Z8EgvOUPsZ/9K3bZFQ5hlYbtHQONnVJgoDa+4zKsN5BWbI6q
	lFWp3r99g2Ujc2iM22q+6nkxtF3YDUgtr0cB8NAAw6+4aFJ8OzQoiKXpSQaKQIlP33gxVoFhSlq
	J8Pv2TUZdOzSvAdslJEwvlVaSkoibvdR/3g=
X-Google-Smtp-Source: AGHT+IE8EPABHPKcFeHpVATpu7tuky6dQjHYjgLf94kz5qKXEiVH4u1yWKm/bGjhuRu/mHAskiDTxQ==
X-Received: by 2002:a05:6000:1869:b0:385:de67:229e with SMTP id ffacd0b85a97d-38db4904424mr826959f8f.11.1738762925361;
        Wed, 05 Feb 2025 05:42:05 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d93369fsm22035425e9.3.2025.02.05.05.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 05:42:04 -0800 (PST)
Message-ID: <1ac208a7-ec63-42fe-b496-5a2e7fd615f2@linaro.org>
Date: Wed, 5 Feb 2025 14:42:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-2-862b136c5d22@linaro.org>
 <u4qho7u2nu2x6qxkfxpeakotmbdgoha3e5csmsamaanlxziiif@22kzxupzibj7>
 <12275e11-eadc-48be-b8c3-9463cdf92698@linaro.org>
 <vfqfbpxc3zrerrb2hyis6h4kgk7aqfljwb7sxlduwlkqprmodg@rjjfsgwr5c6j>
 <2e96ae62-3114-4c7b-bea7-27f6e2009634@linaro.org>
 <t4zn2gv3mbn3nqlh5h3l3ej5zxs4wa74ncgymonci7v45w47ai@qmmtxbelichw>
 <6cba59b9-4852-4cad-95eb-dfecb2e44dc4@linaro.org>
 <CAA8EJppUkLYfHUcNcJA5or4ZVJsbTe74a6GGV1CR6zqCWmVjRA@mail.gmail.com>
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
In-Reply-To: <CAA8EJppUkLYfHUcNcJA5or4ZVJsbTe74a6GGV1CR6zqCWmVjRA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/02/2025 12:23, Dmitry Baryshkov wrote:
>>>>>>>> +
>>>>>>>> +static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
>>>>>>>> +{
>>>>>>>> +        dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
>>>>>>>>  }
>>>>>>>>
>>>>>>>>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
>>>>>>>>  {
>>>>>>>> -        u32 data;
>>>>>>>> +        u32 cfg_1 = BIT(5) | BIT(4);
>>>>>>>
>>>>>>> Please define these two bits too.
>>>>>>
>>>>>> Why? They were not defined before. This only moving existing code.
>>>>>
>>>>> Previously it was just a bit magic. Currently you are adding them as
>>>>
>>>> No, previous code:
>>>>
>>>> writel(data | BIT(5) | BIT(4), pll->phy->base +
>>>> REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>>>>
>>>> This is a mask and update in the same time, because:
>>>>      (data & (BIT(5) | BIT(4)) | BIT(5) | BIT(4)
>>>> is just redudant.
>>>>
>>>> I did not do any logical change, I did not add any mask or field.
>>>> Everything was already there.
>>>
>>> Yes... and no. Previously it was just writel(foo | BIT(5) | BIT(4)). Now
>>
>> You did not address my comment. Previous code was:
>>
>> (foo & (BIT(5) | BIT(4)) | BIT(5) | BIT(4)
>>
>> Just for shorter syntax it was written different way:
>>
>> foo | BIT(5) | BIT(4)
> 
> Previously it was a simple writel() with some bit magic. Now you call


The mask was already there, just implied.

> dsi_pll_cmn_clk_cfg1_update() passing the register bit field through
> the 'mask' argument. I'm asking to get those masks defined. Is it
> possible?

Just like before, because implied mask is being removed due to code
redundancy.

I repeat it for third time already.

> 
> Yes, the code is equivalent and results in the same values being
> written to the same registers.
> At the same time you have added a logical entity, a masked write. I
> want to be able to understand if bits 4 and 5 are a part of the same
> register field or they belong to two different fields and can be

I know you want to understand it and this is achieved in separate patch,
because understanding this is not related to this commit.

> written separately. I really don't understand why are we spending so
> much time arguing about a simple #define. Okay, in case of drm/msm it
> is not a #define, it is <reg><bitfield/></reg>. The net result is the
> same.

I also don't get why simple fix could not be just applied and it has to
become some sort of big refactoring.

Best regards,
Krzysztof

