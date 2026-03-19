Return-Path: <linux-arm-msm+bounces-98709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKg2HPvQu2k4owIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:33:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DD12A2C9870
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:33:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C694F301F164
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E9538B14C;
	Thu, 19 Mar 2026 10:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KANm/jRz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874D437AA99
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773916409; cv=none; b=iFO3T9u7xbnlF7Jre2ypae3jfXUm/RxH1NVG8FnQqpCXdrwgwvDP9guB1whPi4tdggPEoKdfgBciBvKjUEqV3trGZo6TwEHLDugpgl98mD/P7xFWiB1vb0+6bG9ov2zTq2OaEeibYmPStiiFijW2dOGxMQx8rCW1M8KxOhgmKuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773916409; c=relaxed/simple;
	bh=LB9475tVL3n9Qwmvm7hVWtEZg7/8iA41jkMdL9/Bvv4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NNzoobRgKIrXeW0cb14bzhn/7FmCn73r65ZzGyzdZV26zn4r0oRrsr5kn8i3tNNtEsd1Yv8NRd+q57THAi4swiiRGnqCFy4fBzE8fIPLIEicS9VNEj3iGPVZIA1/Ku3peWgorBlthdKe+mlwJc/ZZzVeBXcrDEWb6GNUcLvoco4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KANm/jRz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486b9675d36so3883495e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 03:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773916406; x=1774521206; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ErO3x4eMWQB/57fETjq+oKLlpjxWHpiaCaJPFs1ooGg=;
        b=KANm/jRz9/b/M+5hOA9H74odeiYa22K5xxQSFt3Im5LBVcbFhWsxW4CrJHSmaJS3nU
         KHnNvTq8vkQdUjMG9FlPREz33I4lOvZJ2Ya55V0IKSdiiyIo0q3GJnDJ1vl3hkhOx1me
         nuyTAirFYfIANpmxmWkzqRmcz9cPFZtLSGQCsjyzkEetclXAIQZRmMQLANXL5xqajNDG
         6Cn/4GcZeL9yxRCrPogb9b5HRZmMBRq6tJHMrVjM6c24aGsTHX3FTs8zn1aqL97U69+c
         zXFnFQgUlDqimX51g+UCa2KXbF6jWgfAA6vK2umupjG6DfLL4jvJfqZRgRv46cS0x2gJ
         8Q9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773916406; x=1774521206;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ErO3x4eMWQB/57fETjq+oKLlpjxWHpiaCaJPFs1ooGg=;
        b=F551/vB9IwDrMJtiak3tYUTR4+DVlThoONa/kclwoEYeG+1Ko6sxK/rz/yPKXUXpmT
         3o3cCHGnMr7Dz7aLUl5YpMD2PEA9D51H8Ut2aFpLrQqTGXvJpMNpEBbJsw/gBDy6frpx
         xSB2PUa7+g5STXi8SKGq+8P7HdcGSLQQju+cBWs4g2bYbCwtd9oP5uilr0JalRY9GXay
         3sSKcGGINkXTCenixNEBDs2VddJQ5QsjyzavuXC0FFF/VmO/Htu+TDiljpDY60LfirSP
         gHNj2SbcjsnhNLZDcwo0XEBhjtywfyHEC6Q3bY8B49jHLxNGwxsZ6Brcz6+Rm0mxk9eo
         8IAA==
X-Forwarded-Encrypted: i=1; AJvYcCWAldS0Yjg4M08QWKsBlhwxI7gWmLy0NX5sP9+wD90vn9ei9mWr3j0fVL3UZd4QjDFaF6gp4xaJO2b079C7@vger.kernel.org
X-Gm-Message-State: AOJu0YykbB5hKdd5Tle1R58sdHOh13UHcj4c5/bV8uR0z6FdDTciuUa+
	dqHngT2C8iajbK2x64wERv21tOrQSMtKN19x+uMpqCJIBQM9qWUnNliYNpZVRNAye80=
X-Gm-Gg: ATEYQzw3zpOrlNHqblIfekW7yIshFU3mf5n4Q4U2UunsQOqh0xG91VDGylGbc5KQ3Kh
	8L55dykrtufS8/x14R9qT+EjA9U9PkcIOgWDDUvSVk6/t9Ojch91W5tXmzGrwSZvA0IKq+kYy4z
	D1/a8JW+SrtvmH970sFiX9YZPsUVw46n2uVUEV0BvvLbFRE4Vwxx28hCyApTkvIzj5uKVDI2qD6
	RxxJgpJOMeFNqjhXFty+bd317ARqVXuzVZCDGXrsSL+O+B+JrZSRn7jxRqj2mYu3OtA9MR8bo0v
	2l21Iz9XO71iqWfXgq4BrqCnPYhcHF9r6cdJgjgsULdGSSBaYWPtd0XINLSNbK7ATJ2gLyGAOyb
	a09TKQCvpMxliYQGaPS4/h2beU7Ib0oQeSiToK+60/jevf9wm6taANsYVOg8DxSw0GnqyZCiNDW
	iXMyVCvmMyWIpBvbhrVBjI/W5cwMdVVSf3CHc+mMqgvc+EodUx4GP+19MvCUgRkWgS4jfUo128Y
	ga/8z4=
X-Received: by 2002:a05:600c:8b85:b0:485:4135:5c92 with SMTP id 5b1f17b1804b1-486f41ffff7mr112681655e9.0.1773916405763;
        Thu, 19 Mar 2026 03:33:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8e54:fbaf:8cb6:e9f7? ([2a01:e0a:106d:1080:8e54:fbaf:8cb6:e9f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8ba4a74sm56533335e9.12.2026.03.19.03.33.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 03:33:25 -0700 (PDT)
Message-ID: <90623d8f-6eee-40e5-ace7-6bd701dd2868@linaro.org>
Date: Thu, 19 Mar 2026 11:33:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/3] drm/msm/dpu: fix video mode DSC INTF timing width
 for non 8 bit panels
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20260318-dsi-rgb101010-support-v2-0-698b7612eaeb@pm.me>
 <20260318-dsi-rgb101010-support-v2-3-698b7612eaeb@pm.me>
 <c9d14a74-8e59-43bb-827b-577c8f675c8f@linaro.org>
 <_varXMigTiaLa1CVxsqWY0wJNnR8xZGw5lAS8MmyxrVAjHPK1Mu-H-heiIMxB9SdcJoEhjUDUtUo8dZvTi_GsQwYKsuGnc1tsFlSDqoKfA0=@pm.me>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <_varXMigTiaLa1CVxsqWY0wJNnR8xZGw5lAS8MmyxrVAjHPK1Mu-H-heiIMxB9SdcJoEhjUDUtUo8dZvTi_GsQwYKsuGnc1tsFlSDqoKfA0=@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-98709-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: DD12A2C9870
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 09:48, Alexander Koskovich wrote:
> On Thursday, March 19th, 2026 at 4:35 AM, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
>> On 3/19/26 05:00, Alexander Koskovich wrote:
>>> Using bits_per_component * 3 as the divisor for the compressed INTF
>>> timing width produces constant FIFO errors for panels such as the BOE
>>> BF068MWM-TD0 which is a 10 bit panel.
>>>
>>> The downstream driver calculates the compressed timing width by
>>> dividing the total compressed bytes per line by 3 which does not depend
>>> on bits_per_component. Switch the divisor to 24 to match downstream.
>>>
>>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 12 +++++++-----
>>>    1 file changed, 7 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>> index 0ba777bda253..9b046a0e77aa 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>> @@ -122,19 +122,21 @@ static void drm_mode_to_intf_timing_params(
>>>    	}
>>>
>>>    	/*
>>> -	 * for DSI, if compression is enabled, then divide the horizonal active
>>> -	 * timing parameters by compression ratio. bits of 3 components(R/G/B)
>>> -	 * is compressed into bits of 1 pixel.
>>> +	 * For DSI, if DSC is enabled, use a fixed divisor of 24 rather than
>>> +	 * bits_per_component * 3 when calculating the compressed timing width.
>>> +	 *
>>> +	 * This matches the downstream driver and is required for panels with
>>> +	 * bits_per_component != 8.
>>>    	 */
>>>    	if (phys_enc->hw_intf->cap->type != INTF_DP && timing->compression_en) {
>>>    		struct drm_dsc_config *dsc =
>>>    		       dpu_encoder_get_dsc_config(phys_enc->parent);
>>> +
>>>    		/*
>>>    		 * TODO: replace drm_dsc_get_bpp_int with logic to handle
>>>    		 * fractional part if there is fraction
>>>    		 */
>>> -		timing->width = timing->width * drm_dsc_get_bpp_int(dsc) /
>>> -				(dsc->bits_per_component * 3);
>>> +		timing->width = timing->width * drm_dsc_get_bpp_int(dsc) / 24;
>>
>>
>>
>> @bits_per_component: Bits per component to code (8/10/12) <= how the DSC pixels are encoded in the stream
>> @bits_per_pixel: Target bits per pixel with 4 fractional bits, bits_per_pixel << 4 <= the target display pixels
>>
>> - bits_per_component is the transport width
>> - bits_per_pixel is the display width
>> - 3 is the DSC compression ratio
>>
>> So for a RGB101010 DSC display bits_per_pixel should be 10 << 4
>>
>> But here you say bits_per_component should be 8 ? can you share the downstream config of your panel ?
> 
> This is what is defined downstream for this panel, they're using 8:
> https://github.com/NothingOSS/android_kernel_msm-6.1_nothing_sm7635/blob/sm7635/b/mr/vendor/qcom/proprietary/display-devicetree/display/dsi-panel-rm69220-dsc-fhd-plus-120hz-vid-boe.dtsi
> 
>>
>> Are you sure about the bits_per_component & bits_per_pixel values you set in the dsc parameters ?
> 
> I'm pretty sure they're correct, here's the panel driver I have atm:
> https://github.com/AKoskovich/linux/blob/asteroids-6.19.y/drivers/gpu/drm/panel/panel-boe-bf068mwm-td0.c

So I looked at downstream, and bit-per-component is not used at all for the width calculation.

Here's the full downstream calculation with your panel:


intf_width = mode->timing.h_active;		=> 1080

slice_per_pkt = dsc_info->slice_per_pkt;	=> 2
slice_per_intf = DIV_ROUND_UP(intf_width, dsc_info->config.slice_width);	=> 1080/540 = 2

if (slice_per_pkt > slice_per_intf)
	slice_per_pkt = 1;

bpp = DSC_BPP(dsc_info->config);	=> 8

bytes_in_slice = DIV_ROUND_UP(dsc_info->config.slice_width * bpp, 8);	=> 540 * 8 / 8 = 540


dsc_info->bytes_per_pkt = bytes_in_slice * slice_per_pkt;	=> 540 * 2 = 1080
dsc_info->pkt_per_line = slice_per_intf / slice_per_pkt;	=> 2 / 2 = 1

...

phys->dce_bytes_per_line = comp_info->dsc_info.bytes_per_pkt * comp_info->dsc_info.pkt_per_line; => 1080 * 1 = 1080

...

if (p->compression_en) {
	if (p->wide_bus_en)
		data_width = DIV_ROUND_UP(p->dce_bytes_per_line, 6); => 1080 / 6 = 180
	else
		data_width = DIV_ROUND_UP(p->dce_bytes_per_line, 3); => 1080 / 3 = 360
}

So you're right, it should be a fixed (8 * 3) division, and a (8 * 6) in case of widebus, but DSI widebus is not yet handled.

Neil

> 
>>
>> Neil
>>
>>
>>>    		timing->xres = timing->width;
>>>    	}
>>>    }
>>>
>>
>>
> 
> Thanks,
> Alex


