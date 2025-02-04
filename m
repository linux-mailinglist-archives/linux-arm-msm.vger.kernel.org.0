Return-Path: <linux-arm-msm+bounces-46855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B9BA26E18
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 10:21:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9609F7A0FCB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 09:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49BC3206F37;
	Tue,  4 Feb 2025 09:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fYkrweth"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5263B205E26
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Feb 2025 09:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738660891; cv=none; b=ZdI3mAr17XxXx8zPLUQHpLu4DK3tn3e6d77xiwFgMoTN7T1K4o3Z9jnBqMAICGyQqf6OLWUabrYBec0r/8YzlddIhVN+6ByTw7Ur+ScLpUGH608+MoTB47T8mcA0maNeBUCJCGfb7fFox0e8W7XOuNAief8h6byCvEhThCQ3ZHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738660891; c=relaxed/simple;
	bh=UR4WUjMOCRbQAGCJXPesaWpaijzHGhicTObCGihf3RE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QR15SVwesKl0+FEcTFIbCbdTywU71dIvQL0yF3iNYHbzxaO9m++xVG/2m5eOw2skvBRCKwgT0QUISj3W6EiUo4Lcjp4e9aHCF4i4lSmFP1iX+b2J1vdaZxw7NlXaaJXye3njeNMzu3OjFZYh5BvM3c0aeGms71FspCKYT2J2U+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fYkrweth; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436203f1203so7086995e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2025 01:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738660887; x=1739265687; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MxDn6shiABuWq3wMV9vLvSmKWQSLFhundB+LooO/KY0=;
        b=fYkrwethrWz00EwPSirzeqLNJiQK6pdyTPkprv416lLdyiIGTImF++EjSWLj+cK14n
         ue6KeMAAnEbDEJ+lMxieHyLvTDVI5L8xvNI3T++y9CQuWkh97pExesq3whiL1IaXSvSD
         jfvgbv7DbrIUZLFQEmWP2eHx1FvjQDUpM/MQxtnzVfMuIys5b2GY1tJDUeTbX7jXxuh4
         DSvqlgBnQ7gLReZAnjBGzmVMzSNT1M1IKJORNYFat805iBvchfzirSFDmW8dxIm3iSvZ
         ZoPt0hKwIytvy4aB0PNdIOD6MgU/yRV57QQ6quplG50kFIusmu8+XsHwSxiiVldoOLUS
         lTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738660887; x=1739265687;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MxDn6shiABuWq3wMV9vLvSmKWQSLFhundB+LooO/KY0=;
        b=qPZU4awCUjjyhMCEp9AjE3OiHytGxy5SRgAkVDLM82IT66jjebDEARMxATtLTEJkP8
         bndGPBHKAy++4DAVnIH4rrYrUuHtFietrVqVzGEWRJIWQLq8wSNq8ldImE0ks4C3WQfX
         wTqre53TAvkgmIwkY3HYMrmJNUUWRTSDh3tNwvBSb7YL1lArzv+AZOqpjzt7oE4S9hvQ
         o6ChclLMUGSw2VfFu5kgSuNoGhyN8MKo9IpeEgZP38XnN8wjyzT50zXw/PyKJz2gfk9o
         Gl04/kW7IQRskVe5vJAxanDfHaTEg3lPg95FoqSO1BUUhwjc+bRUNgM2SO8U5TGGVsRe
         0Gzg==
X-Forwarded-Encrypted: i=1; AJvYcCWiqN+BbPeGveU0gKxzsbooELes4S1q29RmwxfsM6RSY2Pz+O2aC1W7fGJKoLNEgD0+o0EBSsNXUMecR0HC@vger.kernel.org
X-Gm-Message-State: AOJu0YwhQr3krs0LuYzphXjGatWx7mr0k1b0+Rlnbc66K67ZS8v5Ys50
	GzgLFCB0s7dv6qdbTQ6tPmZRpAKaUZ/MGglYFr2i3i/DDLpy2BGXfD84alBSdow=
X-Gm-Gg: ASbGncvV0UPPYNObzsLbrAE4T7bnS/gakVtuAkgoOQWOUwr4AUyR8IKPCog/NN6+JHO
	Y8DUVwxwIVtEjNkJMsg43DFknYha/lUzlHvjNPPdQzQB1zz2oerr0FcvNLyljypcro3zS0NHOFj
	/ptkYz+i0nB69Nj1SbVZUE+57+ESMkxhouuAz6pfaD/cG3VFJoCOz/q5R1yhrJvQDLIkZhT1oBt
	YZriIMBWYFxnqxKM9hZqiaEnRao84y2ZaIViFp4Tv7ioGwJgFfQLhwVhm9FrcsNwmEi3UXgJC0+
	X/9jABtRtgZ3oRVn3RXNusMcEmQ/CI1RCsc=
X-Google-Smtp-Source: AGHT+IHuAsbkXGxd/AEEKWOPNtGCZnolavSf2K5Iiz0RSlT60ZCByR9bM0szeITb48WA7qfXeizZ8g==
X-Received: by 2002:a05:600c:4f8e:b0:436:fb10:d595 with SMTP id 5b1f17b1804b1-438e17dad66mr76372095e9.1.1738660887443;
        Tue, 04 Feb 2025 01:21:27 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc12f88sm218334835e9.2.2025.02.04.01.21.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 01:21:26 -0800 (PST)
Message-ID: <12275e11-eadc-48be-b8c3-9463cdf92698@linaro.org>
Date: Tue, 4 Feb 2025 10:21:25 +0100
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
In-Reply-To: <u4qho7u2nu2x6qxkfxpeakotmbdgoha3e5csmsamaanlxziiif@22kzxupzibj7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/02/2025 18:41, Dmitry Baryshkov wrote:
> On Mon, Feb 03, 2025 at 06:29:19PM +0100, Krzysztof Kozlowski wrote:
>> PHY_CMN_CLK_CFG1 register is updated by the PHY driver and by a mux
>> clock from Common Clock Framework:
>> devm_clk_hw_register_mux_parent_hws().  There could be a path leading to
>> concurrent and conflicting updates between PHY driver and clock
>> framework, e.g. changing the mux and enabling PLL clocks.
>>
>> Add dedicated spinlock to be sure all PHY_CMN_CLK_CFG1 updates are
>> synchronized.
>>
>> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Changes in v2:
>> 1. Store BIT(4) and BIT(5) in local var in dsi_pll_enable_global_clk()
>> ---
>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 35 +++++++++++++++++++------------
>>  1 file changed, 22 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> index c164f845653816291ad96c863257f75462ef58e7..e26f53f7cde8f0f6419a633f5d39784dc2e5bb98 100644
>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> @@ -83,6 +83,9 @@ struct dsi_pll_7nm {
>>  	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG0 register */
>>  	spinlock_t postdiv_lock;
>>  
>> +	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG1 register */
>> +	spinlock_t pclk_mux_lock;
>> +
>>  	struct pll_7nm_cached_state cached_state;
>>  
>>  	struct dsi_pll_7nm *slave;
>> @@ -381,22 +384,32 @@ static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
>>  	spin_unlock_irqrestore(&pll->postdiv_lock, flags);
>>  }
>>  
>> -static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
>> +static void dsi_pll_cmn_clk_cfg1_update(struct dsi_pll_7nm *pll, u32 mask,
>> +					u32 val)
>>  {
>> +	unsigned long flags;
>>  	u32 data;
>>  
>> +	spin_lock_irqsave(&pll->pclk_mux_lock, flags);
>>  	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>> -	writel(data & ~BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>> +	data &= ~mask;
>> +	data |= val & mask;
>> +
>> +	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>> +	spin_unlock_irqrestore(&pll->pclk_mux_lock, flags);
>> +}
>> +
>> +static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
>> +{
>> +	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
>>  }
>>  
>>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
>>  {
>> -	u32 data;
>> +	u32 cfg_1 = BIT(5) | BIT(4);
> 
> Please define these two bits too.

Why? They were not defined before. This only moving existing code.


Best regards,
Krzysztof

