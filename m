Return-Path: <linux-arm-msm+bounces-98775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLgGHuIOvGkirwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 15:57:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 011E52CD496
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 15:57:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E38E3059AAF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 14:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79033DCD96;
	Thu, 19 Mar 2026 14:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XDKawPQv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1463DC4A0
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 14:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773932051; cv=none; b=TWrUFKpVIWYwJD3J0+NtvCgKDd/wNzNr033HqrxAsn9T/qRLe7f+53QzhQ5+ZY5/RuKhxdlPnzHWrNQ0N1lrvv+X5cl6p56iSaVcDASQiu5bhutDhH8Kx0MdQ4CnPukD/rdHVSPEG/exdPzRTFDhWelpGPn9BGcBily/f9xkx3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773932051; c=relaxed/simple;
	bh=ogaWxCjijDVcPcWs+oqcUcgpVtLeEpTz+9Padk7Av/U=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=RSOTm8RRQeeWfQWJtl0om9QJtmrDmpG+YHUN68Rxn6Y5e67smTrK5nU/h3IOW5EZrM1w+jPKfcjG0Jz4yEl6imzdEYMkBKAMbl/F5VGo6iyrOokp6g3jRkhyB3goQ68ZhQfik9H8zpmpnKI4lDVZsnTA8Ijh2buxuWkIXbgPvSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XDKawPQv; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso9010265e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 07:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773932048; x=1774536848; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fYfxz+rNELIteGsbKAMavpc3Lvzth4lh50wrsIwCT58=;
        b=XDKawPQvBL7Mjc9CoTWGI8wActlJm6DmT3ai+tDO92lsfnzpviNoyHvEzqyihuCRoq
         C4ZZu2Cz5/6w2GNsyrjBJBlklmbhykks0zV2EwUHFK24V3YBqYor4hyCIncVGb2GLmyg
         dx5Y26egCaPdq4G8KMYesdRU2szFRHELtsg8T25hyk56+Xc5f2moFjx+QyetaglUFl9a
         Mqawg3TtRNSlNfrUznAMAoxZTGw9GU5q59CKf9NZwDkFj2bOPb+SAQQ/Cs4sfCzDCSm+
         KhlJvIc9DY5/nW6iPfsTqFP9d/34An7l7/FSjoiVSIIgGSlpIZypeQdnJIm5XzD7D4wq
         Adzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773932048; x=1774536848;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYfxz+rNELIteGsbKAMavpc3Lvzth4lh50wrsIwCT58=;
        b=OZsawHHeyyk/YG3TrctoHfZ45y+Y42lZ8qb0mNteUYO+ueo6Ghg4sfzAQcKjJdk8CP
         fYMyVYrcBiptmonl0MIP1anvzU0k+dnRKWDkI6ecml7d3kh4DTGema9f5RJECd73AXmI
         VCqkbvufcBRbY1oEMaoPmDWG5I3ma770DXwTZMaLL0s/b74s6p785zXkCveQgImC3ljZ
         EY0M8fB3duu0BQjF7wBsJOzhmQgxxZUaXkVa5cg9cEIe+P5wtuIQ3s0zk2J148Y4mssX
         ezUGbuZcdYKDP0BgiMskLMDtdaCUaeUmAS/oBs7OxsBYz1jwjdIOM0vVyL1q+AzGruCV
         cgrg==
X-Forwarded-Encrypted: i=1; AJvYcCXjiZUUwUOOLYqbLY4BiyKpw0JH8FoiHdN/TerCL3jho89AYx4C/bz1mFfNlov43FWXF+lAawYXPF9QYvUE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0yjK415eOVFAiRiT/Iy6U99UA7yOcLsMTIHBM4ZdcQOCk8Zpb
	IbxrhxgcObDb8o3uZ9zu9U5KErOefu1Lt1eJzSdXv0/0soQpjim/oX2O1j/HazCjMqQ=
X-Gm-Gg: ATEYQzwALhe3PplP8ZqOJUuqk6owfs3EpgXfohQSq19a1hFF0X6IV9wJF5cFLCGoXAf
	aj+B1jW5NkoG9Figh56P5AX955S14kvObx4+z6vFN3ce/2YOIqAjuc0Q2HJBZ7nEQhrGoIq82cu
	KBabGQVZVfA7fGcBGwaIV8y/482g16VRWgN0m8AA4Invb0Qx6twAO1b9Dfr4B4J8H+P/9GdKTRR
	ZV6nrCptKm1AUgPxeKqrR9Vp6WFutOZe4rsajGvWfSwb74TkSIqhjZs5cqnuC1d2lBGu1nlmhYP
	mtGmOpaCykpEi8RbAZHGujlJJr3bHkbiSSlTfxMPDLId7mjjUNH/sVdgFKMMQAAtUHVt+BBzzAG
	/cc5wHQvMwYYEQnmAWUcf31QhDXaCnpBNuS8AJ8SrrJvJxXSU1xLIsFAZ3WytfOwUHB+4pXg/Bg
	dpqKplYTqevueA9/LpGq7ZxNhZnQc5ggMyWpFvTBkMM990lTIpbhg0/JXRPb447HnlbIk2GV1q2
	Voeo9Y=
X-Received: by 2002:a05:600c:8b2e:b0:485:2a4b:7bc3 with SMTP id 5b1f17b1804b1-486f4440fb2mr118026975e9.4.1773932047740;
        Thu, 19 Mar 2026 07:54:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8e54:fbaf:8cb6:e9f7? ([2a01:e0a:106d:1080:8e54:fbaf:8cb6:e9f7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184962bsm16678526f8f.7.2026.03.19.07.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 07:54:07 -0700 (PDT)
Message-ID: <3f8763af-aad2-4d92-90c8-cfd290212503@linaro.org>
Date: Thu, 19 Mar 2026 15:54:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 4/4] drm/msm/dpu: fix video mode DSC INTF timing width
 calculation
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me>
 <20260319-dsi-rgb101010-support-v3-4-85b99df2d090@pm.me>
 <1360a31d-669e-48df-a1be-f0af4a253cd7@linaro.org>
 <3gLK4s97giqqXagfHKhfiIHbfbl2snwfOj9dcTNGPUYi10w9-1EdATqzz1LPCVTpz4bLFYOm8u_Fl8PfC7t5yabows4UCzRKVwjraEWW6hc=@pm.me>
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
In-Reply-To: <3gLK4s97giqqXagfHKhfiIHbfbl2snwfOj9dcTNGPUYi10w9-1EdATqzz1LPCVTpz4bLFYOm8u_Fl8PfC7t5yabows4UCzRKVwjraEWW6hc=@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-98775-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pm.me:email,linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 011E52CD496
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 15:40, Alexander Koskovich wrote:
> On Thursday, March 19th, 2026 at 10:13 AM, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
>> Hi,
>>
>> On 3/19/26 12:58, Alexander Koskovich wrote:
>>> Using bits_per_component * 3 as the divisor for the compressed INTF
>>> timing width produces constant FIFO errors for the BOE BF068MWM-TD0
>>> panel due to bits_per_component being 10 which results in a divisor
>>> of 30 instead of 24.
>>>
>>> Regardless of the compression ratio and pixel depth, 24 bits of
>>> compressed data are transferred per pclk, so the divisor should
>>> always be 24.
>>
>> Not true with widebus, specify why 24 and because DSI widebus is not implemented yet.
>>
>>>
>>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 9 ++++-----
>>>    1 file changed, 4 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>> index 0ba777bda253..5419ef0be137 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>> @@ -122,19 +122,18 @@ static void drm_mode_to_intf_timing_params(
>>>    	}
>>>
>>>    	/*
>>> -	 * for DSI, if compression is enabled, then divide the horizonal active
>>> -	 * timing parameters by compression ratio. bits of 3 components(R/G/B)
>>> -	 * is compressed into bits of 1 pixel.
>>> +	 * For DSI, if DSC is enabled, 24 bits of compressed data are
>>> +	 * transferred per pclk regardless of the source pixel depth.
>>>    	 */
>>>    	if (phys_enc->hw_intf->cap->type != INTF_DP && timing->compression_en) {
>>>    		struct drm_dsc_config *dsc =
>>>    		       dpu_encoder_get_dsc_config(phys_enc->parent);
>>> +
>> Drop this change
>>
>>>    		/*
>>>    		 * TODO: replace drm_dsc_get_bpp_int with logic to handle
>>>    		 * fractional part if there is fraction
>>>    		 */
>>> -		timing->width = timing->width * drm_dsc_get_bpp_int(dsc) /
>>> -				(dsc->bits_per_component * 3);
>>> +		timing->width = timing->width * drm_dsc_get_bpp_int(dsc) / 24;
>>
>> It would be helpful to somehow show that 24 is 8 * 3, 8 being the byte width and 3 the compression ratio.
> 
> Can you clarify what the 3 represents? My panel should have a 3.75:1 compression
> ratio (30/8) so the final divisor of 24 would be wrong for my panel if its the
> compression ratio?

So my guess is that while the exact ratio on the DSI lanes is 3.75:1, the ratio
used to calculate the INTF timings is 3, then the DSC encoder probably does the
magic to feed 10bpp into a 3.75:1 ratio over the DSI lanes.

In dsi_adjust_pclk_for_compression, the pclk is adjusted to take in account bits_per_component,
so I presume the actual DSI pclk _is_  timing->width * drm_dsc_get_bpp_int(dsc) / (dsc->bits_per_component * 3),
which is your 3.75:1, but the INTF needs to generate timing->width * drm_dsc_get_bpp_int(dsc) / (8 * 3) pixels
to the DSC encoder which will emit timing->width * drm_dsc_get_bpp_int(dsc) / (dsc->bits_per_component * 3) pixels.

In any case, 24 _is_ 3 * 8, 3 being the DSC compression ratio on the INTF side.

Dmitry, Konrad, could you help confirming this ?

Neil

> 
>>
>>>    		timing->xres = timing->width;
>>>    	}
>>>    }
>>>
>>
>>
>>
> 
> Thanks,
> Alex


