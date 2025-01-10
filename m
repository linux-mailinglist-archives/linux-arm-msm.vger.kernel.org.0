Return-Path: <linux-arm-msm+bounces-44715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 674C2A08AD3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 09:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DDAB7A32A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 08:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00909207A28;
	Fri, 10 Jan 2025 08:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gFKxMwmX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF16F20896B
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 08:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736499572; cv=none; b=MaCSQ4IXesFsqaOHnqA572zib6enkNXmvkuhNovQM6bWJqRdRLdsIfnvH+wyVOgAjlh7+gPuU8I8LLsAsS0IBNtbxqpt9JkGSVWltSOwhb3JQgJlRG2nXGUWwStO0LUxsFPwleaFWGTjc3Iew8c8+S0dAU+ntjIDlAG20Iyyr1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736499572; c=relaxed/simple;
	bh=HXD+3vBFq3ftj+fQdTwmu+nD89WB1mRYA0tNbZJ/EaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R2gGJbXSU7+4rJ8JI1OYjrNEJzHXs+968fh6OlrYJvSskkR3ERCDAKo9++Pe+4Yz9vEABrEh5vPJOfC+PkOG9iZCew476EF4vBxEdUxxIJPcb86XIv7qHV9gtG2xXxzMqPkqcACpMPYakHpAn3TOHYqk6chYIiTBCcGW0hT+nP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gFKxMwmX; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43637977fa4so2186665e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 00:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736499569; x=1737104369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7hGLjdZowT5PE1ZxrLTVLx1p/trcvoJO2svUWorXuAc=;
        b=gFKxMwmXEhmdfGIqlLZPA7m1MSuArnl8tgSDOVcMWoL/4MmYwrLpwry/CVFqLZmi84
         mFg0ZV5Jxp2+dIGPFXQu6pZHjBLCyRRyrudd4tSlWI++81/hpX7P3vvaLCLjT85L8pCH
         l08S3CbU4eHmmIXGxkX/lfMWBMYBVMXCWJQTET6KloPnb9NwgMOzJADEDTir/kuzDvsa
         EsjItDb1pt81tjLR8Rp3z3WCERaFYFWDeuZ6z4qDXcHLAYvmYwF/iy9Qd+69bO0tIrjC
         z2TUr/mEEk01jS1ujDfHuBSAo/AYxC8XFzg7bnNW44GYr41b3aNPAoBFQTY/BQ9cfxHZ
         kwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736499569; x=1737104369;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7hGLjdZowT5PE1ZxrLTVLx1p/trcvoJO2svUWorXuAc=;
        b=Ad/GOYA+P/L823rCW0jyAlvC1limQ55a0i2v1GmprXF+RvGwTM4YdOh3tZcH4n+Rmr
         3HLgAkxffdvzgIJ60zFsdSD1foeDHdZkoDZolRGg+8KmpFm3n4O6SWdDo21wp6Wy5sDq
         ITj+ueWbgjekh7v3BoTKm++UNaxMOSMyNUiEHjxh8Ul4CMCSVcQEjV/x7XYwSgcT5saw
         +4acDcSjuwSaCQ3dQ3dBwSWcFp1z5WqtJmh6/SrTfgwBo0rlWjDFklMmeDm1Bb/N9k1c
         Mh8wgc+Ca8wP9He1ZCHWl1NDaB+6l1wbIJ75QJ5touViKOKPpt0tQFzFyGDhapT8oBGw
         FKUg==
X-Forwarded-Encrypted: i=1; AJvYcCWLHcf9SBzg9LwLeA0YRU26IuXTDa4qSif/p09BqrlsGbNHr+5zJ6VGr90u75u+gM0NnHVI9vZAUEvSk8W0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3yc16/C1MgUbVFYne2Rvd2grHYJGQrnDtC8/j6CCNsqmHJRL1
	8wBRZa3yf9nIhAp7DW2ehAG5TuPPejeSLfH9PGTLL/hXU3ru38nGABzx+n3dcdQ=
X-Gm-Gg: ASbGncuQvMfrVxkPoi/LKFaW0jZ93etMeS1xJj+uajd+R3b1kw/6gbRcBtjyFwXb1Da
	mrnvT8cfm3fXbMPg/BYUhZGJxqb57kqKj5EL0mRleC7d9fMGCXdHkpMsEtLACV41U/ncYhCbjNR
	QkvuXYE5k9OvbVVlBFTIc8IqSb/FMoRKCcSPq199gJDN8tcrlMI50D/vTD6utoxztrMStJ2tZ8n
	ZBfisiI99Yr0rhX8mSgwjp32ZWsBIjXDXmG+Jhv/ChqcoCHUq1RcU5Caxs311EFafTUS0FvQlj1
X-Google-Smtp-Source: AGHT+IEwkrz+PoZxV4MO0Kjo8rXrqQ8ksbadzeeixn9+7H03IOjhaq561a8mPD+Elnwcr7igIHcNDw==
X-Received: by 2002:a05:600c:4e52:b0:434:a339:ec67 with SMTP id 5b1f17b1804b1-436eba35780mr19968995e9.3.1736499569224;
        Fri, 10 Jan 2025 00:59:29 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e92dc4sm79327445e9.39.2025.01.10.00.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 00:59:28 -0800 (PST)
Message-ID: <4fc7fdd5-36cd-42e6-af4a-e0e429f9f50b@linaro.org>
Date: Fri, 10 Jan 2025 09:59:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 08/11] drm/msm/dsi: Add support for SM8750
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
 <20250109-b4-sm8750-display-v1-8-b3f15faf4c97@linaro.org>
 <3p7kjok5jzwvgt7dxuad26xgdkjd52v4gbtuudvgkeoj33skqn@afl2ddtsq7s2>
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
In-Reply-To: <3p7kjok5jzwvgt7dxuad26xgdkjd52v4gbtuudvgkeoj33skqn@afl2ddtsq7s2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/01/2025 00:18, Dmitry Baryshkov wrote:
> On Thu, Jan 09, 2025 at 02:08:35PM +0100, Krzysztof Kozlowski wrote:
>> Add support for DSI PHY v7.0 on Qualcomm SM8750 SoC which comes with two
>> differences worth noting:
>>
>> 1. ICODE_ACCUM_STATUS_LOW and ALOG_OBSV_BUS_STATUS_1 registers - their
>>    offsets were just switched.  Currently these registers are not used
>>    in the driver, so the easiest is to document both but keep them
>>    commented out to avoid conflict.
>>
>> 2. DSI PHY PLLs, the parents of pixel and byte clocks, cannot be used as
>>    parents before they are prepared and initial rate is set.  Therefore
>>    assigned-clock-parents are not working here and driver is responsible
>>    for reparenting clocks with proper procedure: see dsi_clk_init_6g_v2_9().
> 
> Isn't it a description of CLK_SET_PARENT_GATE and/or

No - must be gated accross reparent - so opposite.

> CLK_OPS_PARENT_ENABLE ?

Yes, but does not work. Probably enabling parent, before
assigned-clocks-parents, happens still too early:

[    1.623554] DSI PLL(0) lock failed, status=0x00000000
[    1.623556] PLL(0) lock failed
[    1.624650] ------------[ cut here ]------------
[    1.624651] disp_cc_mdss_byte0_clk_src: rcg didn't update its
configuration.

Or maybe something is missing in the DSI PHY PLL driver?

> 
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  drivers/gpu/drm/msm/dsi/dsi.h                      |  2 +
>>  drivers/gpu/drm/msm/dsi/dsi_cfg.c                  | 25 +++++++
>>  drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |  1 +
>>  drivers/gpu/drm/msm/dsi/dsi_host.c                 | 80 ++++++++++++++++++++++
>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |  2 +
>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |  1 +
>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 78 +++++++++++++++++++--
>>  .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  | 14 ++++
> 
> Please separate DSI and PHY changes.
> 
>>  8 files changed, 197 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> index 7754dcec33d06e3d6eb8a9d55e53f24af073adb9..e2a8d6fcc45b6c207a3018ea7c8744fcf34dabd2 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> @@ -205,6 +205,17 @@ static const struct msm_dsi_config sm8650_dsi_cfg = {
>>  	},
>>  };
>>  
>> +static const struct msm_dsi_config sm8750_dsi_cfg = {
>> +	.io_offset = DSI_6G_REG_SHIFT,
>> +	.regulator_data = sm8650_dsi_regulators,
>> +	.num_regulators = ARRAY_SIZE(sm8650_dsi_regulators),
>> +	.bus_clk_names = dsi_v2_4_clk_names,
>> +	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
>> +	.io_start = {
>> +		{ 0xae94000, 0xae96000 },
>> +	},
>> +};
>> +
>>  static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
>>  	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
>>  	{ .supply = "refgen" },
>> @@ -257,6 +268,18 @@ static const struct msm_dsi_host_cfg_ops msm_dsi_6g_v2_host_ops = {
>>  	.calc_clk_rate = dsi_calc_clk_rate_6g,
>>  };
>>  
>> +static const struct msm_dsi_host_cfg_ops msm_dsi_6g_v2_9_host_ops = {
>> +	.link_clk_set_rate = dsi_link_clk_set_rate_6g_v2_9,
>> +	.link_clk_enable = dsi_link_clk_enable_6g,
>> +	.link_clk_disable = dsi_link_clk_disable_6g,
>> +	.clk_init_ver = dsi_clk_init_6g_v2_9,
>> +	.tx_buf_alloc = dsi_tx_buf_alloc_6g,
>> +	.tx_buf_get = dsi_tx_buf_get_6g,
>> +	.tx_buf_put = dsi_tx_buf_put_6g,
>> +	.dma_base_get = dsi_dma_base_get_6g,
>> +	.calc_clk_rate = dsi_calc_clk_rate_6g,
>> +};
>> +
>>  static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
>>  	{MSM_DSI_VER_MAJOR_V2, MSM_DSI_V2_VER_MINOR_8064,
>>  		&apq8064_dsi_cfg, &msm_dsi_v2_host_ops},
>> @@ -300,6 +323,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
>>  		&sm8550_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>>  	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_8_0,
>>  		&sm8650_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>> +	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_9_0,
>> +		&sm8750_dsi_cfg, &msm_dsi_6g_v2_9_host_ops},
>>  };
>>  
>>  const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>> index 120cb65164c1ba1deb9acb513e5f073bd560c496..859c279afbb0377d16f8406f3e6b083640aff5a1 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>> @@ -30,6 +30,7 @@
>>  #define MSM_DSI_6G_VER_MINOR_V2_6_0	0x20060000
>>  #define MSM_DSI_6G_VER_MINOR_V2_7_0	0x20070000
>>  #define MSM_DSI_6G_VER_MINOR_V2_8_0	0x20080000
>> +#define MSM_DSI_6G_VER_MINOR_V2_9_0	0x20090000
>>  
>>  #define MSM_DSI_V2_VER_MINOR_8064	0x0
>>  
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 2218d4f0c5130a0b13f428e89aa30ba2921da572..ced28ee61eedc0a82da9f1d0792f17ee2a5538c4 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -119,6 +119,15 @@ struct msm_dsi_host {
>>  	struct clk *pixel_clk;
>>  	struct clk *byte_intf_clk;
>>  
>> +	/*
>> +	 * Clocks which needs to be properly parented between DISPCC and DSI PHY
>> +	 * PLL:
>> +	 */
>> +	struct clk *byte_src_clk;
>> +	struct clk *pixel_src_clk;
>> +	struct clk *dsi_pll_byte_clk;
>> +	struct clk *dsi_pll_pixel_clk;
>> +
>>  	unsigned long byte_clk_rate;
>>  	unsigned long byte_intf_clk_rate;
>>  	unsigned long pixel_clk_rate;
>> @@ -269,6 +278,38 @@ int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host)
>>  	return ret;
>>  }
>>  
>> +int dsi_clk_init_6g_v2_9(struct msm_dsi_host *msm_host)
>> +{
>> +	struct device *dev = &msm_host->pdev->dev;
>> +	int ret;
>> +
>> +	ret = dsi_clk_init_6g_v2(msm_host);
>> +	if (ret)
>> +		return ret;
>> +
>> +	msm_host->byte_src_clk = devm_clk_get(dev, "byte_src");
>> +	if (IS_ERR(msm_host->byte_src_clk))
>> +		return dev_err_probe(dev, PTR_ERR(msm_host->byte_src_clk),
>> +				     "can't get byte_src clock\n");
>> +
>> +	msm_host->dsi_pll_byte_clk = devm_clk_get(dev, "dsi_pll_byte");
>> +	if (IS_ERR(msm_host->dsi_pll_byte_clk))
>> +		return dev_err_probe(dev, PTR_ERR(msm_host->dsi_pll_byte_clk),
>> +				     "can't get dsi_pll_byte clock\n");
>> +
>> +	msm_host->pixel_src_clk = devm_clk_get(dev, "pixel_src");
>> +	if (IS_ERR(msm_host->pixel_src_clk))
>> +		return dev_err_probe(dev, PTR_ERR(msm_host->pixel_src_clk),
>> +				     "can't get pixel_src clock\n");
>> +
>> +	msm_host->dsi_pll_pixel_clk = devm_clk_get(dev, "dsi_pll_pixel");
>> +	if (IS_ERR(msm_host->dsi_pll_pixel_clk))
>> +		return dev_err_probe(dev, PTR_ERR(msm_host->dsi_pll_pixel_clk),
>> +				     "can't get dsi_pll_pixel clock\n");
> 
> How is this going to work in the bonded DSI mode when DSI1 is being fed
> by the DSI0 PLL? For existing platforms this is being handled by
> changing the parents in DT.

I don't see the problem - you just put different clock as input in DTS?

Please trim your replies, so we won't need to keep scrolling to figure
out that there is nothing more to read.

Best regards,
Krzysztof

