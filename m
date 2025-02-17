Return-Path: <linux-arm-msm+bounces-48207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF602A38245
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 12:51:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1ACA3A6740
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 11:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42201C2EF;
	Mon, 17 Feb 2025 11:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pHJSnr9M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D12217716
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 11:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739793088; cv=none; b=IcV9sNN3YeBB0eHNXwu8kItVHgzVsLgdPAXocbgBh8jf9rqjxxwLnQqc3viIhtqZn4onu0tS0sR+QfUQRV6YkRk9iJwf0bqld7URtNhKFUHESXTfzLHU3fjHl0EyYzxpWUXrzEWEttpZuRWsHDUMsb8nGmV+WheaBQwAVqwhhm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739793088; c=relaxed/simple;
	bh=YsS0x3alkz+uADboN3Hi2gyIMnCLX42kRHxLemzP7mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RikTbGqWenJQreQCXcLbUgLwdM6qmewmakgidTlOC2VTFaJtQJU7d0pJNZm3zG/+9KjgosjmcrtWSV/Np1i3sqIe4WwOUqBS1w8mBF5raRM9FA0ThhpD3XqwGdul7T5E7On901IgAPssDxuvmJUAb/ISv0xseXZYFhJrIBn4CTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pHJSnr9M; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4394a2af558so5551885e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 03:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739793084; x=1740397884; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=boBaE8FsMd5PXMpwiaXXEagFXKd5QEZ8O/kcdHJADSE=;
        b=pHJSnr9Mxh+XO60csTpPv0uJK7mdb0/tc6eBDqvJvLi3SRneZmnyFDnQTcYIJLT0DP
         uSWOY1XJrl51dRgjhQJyy3NRUkTZw4ZOo/KCX2mc4OtX1q9ZEdS7VhG4tyUBG4QAl7TZ
         UzvM1y2S+lM7ltjgJc+jrUrAtvbbjyud02XZefRTc8DZelmiQK6BzsTjTfnLvZN3YKuq
         OMNh+KNkaIEUNB6GmBQF5RSC/PqumO4ivIeNHg25vuuXFpblXPuQNukL7tibw5fyUbvT
         1bR4WXQOkVS/YQG2TNv3M5008+fbQT2UZJ3/zOHp0hgE7XrtbLskDuKLyslbHpw3qJKm
         DCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739793084; x=1740397884;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=boBaE8FsMd5PXMpwiaXXEagFXKd5QEZ8O/kcdHJADSE=;
        b=cWfyu8edj9BQ+TJVQ2bwMPo6uqUW11/CXkCkBFDb5vp9SHPxaRW3zEFV6DdZay6sAv
         4IEgyf2Lk9De2YMc0RzVDU2wIq1THhnC9rJ/4CqJMVpmYcuFeyk2aMxTxowxzMzOfZeF
         feFHI0o6QMfhoq4LyKhX0KHj66lrn37j+g7izTsTVQ44ZppYjA5Upc1E3nLVwQJjOcim
         R3ifX3B6ZyIG11WLZrcXA9c7NHOc+OPJGTsx9zfkzJVuDAXkQwRvaVlYMhIx6D45s0cL
         RBf4kZVoMOlOcgJEl1qZp18BR5mVXFMwflXvmr6Sxl8fwNp4uoyTac3VzD0b+nh0BFBe
         Et2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWY0Zv/V1FEsUxRyFrP5I0r1Pf8C4zvLiMDAOwj67UaSDzHoOBshuMkUOKlXkEDx5m8KqBf+lUvn2MTR1Nk@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf/mo0XqeGlP0mQ68noVFGnLVvVQXiTypEKQVkkaOStbgKUGeV
	49d0yhARCqTcK8r8FyCB5Cog5cGiQQR/p+9pE0+WH4qb0XYkKuQWh7Sv/lcrJOI=
X-Gm-Gg: ASbGncu67f40pqSc1HyN76zx+pBdIaf6nWugMkDPMa3d3Zk1jMTm4VtoleFzz6Mstoj
	3EZtn8x7YJ1fo3jG3kf+nPJt0H9a0DpUNSUW3nWQ6d7at8vD5x99My5LYT6T16WRmQZztKtl4CR
	n0vxELxN3DD6XwGfSl/VA/17F8bfrCvkxuZAP9Uny1Vhl81vySNFJt5uhiJPJqxiYXbK+VIo9vv
	7Ohhq/VPo1uqRqpFFg/eEEiB1PKflYMbsvbziBt7mQejt/uJIaWdd1mtuZ+CgS2ivsviaW0tm+X
	G5g+RJeXgEVJm9cuYjee3VmuIUjABBQlZDY=
X-Google-Smtp-Source: AGHT+IGi9yee6Kch5zdJ4lFrZTfsijfYVXzBLjsh/4rp46Su5Z2UqTtgWBeW4d6pbu+ipSku6+B+DQ==
X-Received: by 2002:a05:6000:1f87:b0:38d:e078:4393 with SMTP id ffacd0b85a97d-38f33f38ce7mr3015012f8f.6.1739793084535;
        Mon, 17 Feb 2025 03:51:24 -0800 (PST)
Received: from [192.168.1.20] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395aef82edsm146414205e9.38.2025.02.17.03.51.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 03:51:23 -0800 (PST)
Message-ID: <0e3068a7-29be-47c8-ab6f-caecccf275fd@linaro.org>
Date: Mon, 17 Feb 2025 12:51:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01]
 bitfields and simplify saving
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
References: <20250214-drm-msm-phy-pll-cfg-reg-v3-0-0943b850722c@linaro.org>
 <20250214-drm-msm-phy-pll-cfg-reg-v3-4-0943b850722c@linaro.org>
 <vuqd6hfiobmbnll7flgltiivhbhksgz6r4uaxlmsp6dvfgmirv@mt5zkhgfl5ak>
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
In-Reply-To: <vuqd6hfiobmbnll7flgltiivhbhksgz6r4uaxlmsp6dvfgmirv@mt5zkhgfl5ak>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/02/2025 16:20, Dmitry Baryshkov wrote:
> On Fri, Feb 14, 2025 at 04:08:44PM +0100, Krzysztof Kozlowski wrote:
>> Add bitfields for PHY_CMN_CLK_CFG0 and PHY_CMN_CLK_CFG1 registers to
>> avoid hard-coding bit masks and shifts and make the code a bit more
>> readable.  While touching the lines in dsi_7nm_pll_save_state()
>> resulting cached->pix_clk_div assignment would be too big, so just
>> combine pix_clk_div and bit_clk_div into one cached state to make
>> everything simpler.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Changes in v3:
>> 1. Use FIELD_GET
>> 2. Keep separate bit_clk_div and pix_clk_div
>> 3. Rebase (some things moved to previous patches)
>>
>> Changes in v2:
>> 1. New patch
>> ---
>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 12 +++++++-----
>>  drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml |  1 +
>>  2 files changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> index 798168180c1ab6c96ec2384f854302720cb27932..a8a5b41b63fb78348038c8f9fbb141aab2b07c7a 100644
>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> @@ -572,11 +572,11 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
>>  	cached->pll_out_div &= 0x3;
>>  
>>  	cmn_clk_cfg0 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
>> -	cached->bit_clk_div = cmn_clk_cfg0 & 0xf;
>> -	cached->pix_clk_div = (cmn_clk_cfg0 & 0xf0) >> 4;
>> +	cached->bit_clk_div = FIELD_GET(DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__MASK, cmn_clk_cfg0);
>> +	cached->pix_clk_div = FIELD_GET(DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__MASK, cmn_clk_cfg0);
>>  
>>  	cmn_clk_cfg1 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>> -	cached->pll_mux = cmn_clk_cfg1 & 0x3;
>> +	cached->pll_mux = cmn_clk_cfg1 & DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK;
> 
> FIELD_GET.

Ack

> 
>>  
>>  	DBG("DSI PLL%d outdiv %x bit_clk_div %x pix_clk_div %x pll_mux %x",
>>  	    pll_7nm->phy->id, cached->pll_out_div, cached->bit_clk_div,
>> @@ -598,7 +598,8 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>>  	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
>>  				   DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0(cached->bit_clk_div) |
>>  				   DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4(cached->pix_clk_div));
>> -	dsi_pll_cmn_clk_cfg1_update(pll_7nm, 0x3, cached->pll_mux);
>> +	dsi_pll_cmn_clk_cfg1_update(pll_7nm, DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK,
>> +				    cached->pll_mux);
> 
> DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL(cached->pll_mux)
> 
>>  
>>  	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw,
>>  			pll_7nm->vco_current_rate,
>> @@ -739,7 +740,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
>>  		u32 data;
>>  
>>  		data = readl(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>> -		writel(data | 3, pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>> +		writel(data | DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK,
> 
> data | DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL(3)
Ack

Best regards,
Krzysztof

