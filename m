Return-Path: <linux-arm-msm+bounces-98803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBuwHxsyvGnxuQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 18:27:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D73A92CFFAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 18:27:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D91630293D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 17:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034123D3338;
	Thu, 19 Mar 2026 17:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="CSsP2CxJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E140E30F816
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 17:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773941010; cv=none; b=JVDqg76dRKI6jI8MbF60qNiIt213el8JzBy/khUR3xJ7CXc5o0xJ1pFW4G6J39fZCM0CYFyJ7B3L7I9CkgGHTFZNgotl3oB+gg8Ur143tISavDF/rL2E7dSYfuPyEmUwfuiB37NRq3s+FKTitLe93ZcDsgIFydlPd0IpA0xircw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773941010; c=relaxed/simple;
	bh=HqJwKBFU+hiDzHVy+KJxp1Wjf8aZu+qrraEkACBF8Tw=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=aXC//qaAocbsIGzP2qeyb1yGSSldNWvldkE2pckuCALMO55IXIipYaPuQGOzs82piMxK5+j+1mle236eEgkv6aIhrzQqHUJP/7CUFTL7REh7WHE+HboBiZTL+ujhD3fpxWvn4WkiVVr1Zwrgx2nlKoCXqpTkTc6ijL8yg81StNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=CSsP2CxJ; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8cb4136d865so162436285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1773941007; x=1774545807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ja7EO2H78kHpMisRkGGD8HVMRsNc2KCgajfwyEKarFA=;
        b=CSsP2CxJqs01mdFg9ygju/O95rXi4C5uVajKM051Prw3GoflZ+42VUWZSfclUpjb0z
         A3GhoUA5jmQAGtsDBS2KARAo21MRDu35aEH+XmxQbCSkEEc+ZtCj1l6vGfdCznnDPklV
         bvCrxoER7CKJUVHeEAGlgicKt3Uu+UtQbvrPOMuACLLDmUR2394id4Se8jRxtsrsL0rS
         P2sdaS5Nn9jwYVfWJar7AFlfYyWrakxGspziA8IFeJPj34tgPANzVFqOqbUUPa67KPaK
         /6CUEofhrSbpFofM32eMH6/do3dhrthJfSwfuoH5DeysGdwyo8vzKiSP90OEWsii25zS
         wdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773941007; x=1774545807;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ja7EO2H78kHpMisRkGGD8HVMRsNc2KCgajfwyEKarFA=;
        b=A9sR0K1hvKKgAclWmw6+msw/j2EOt1Fd2+8cGImLrGrSKM0z2krKmpq5p7VG33OccG
         yh0bms4CjvvmUIgL1xTzSOyjImhMFH7F4tYdtRq/5EY4c692aPfUfC0IEisemMWqeHUi
         Uy6cQuYNhxR+0v7EaMY2RuOznQXMbcm7UuUTmvr+jJc7PT3lEIoyQaSf6tGqd2+F/llV
         UrIjwFz1syCVd8p89pGvOPqIQ58pYFoA3Q9RD6DItOkAOzn4kNrWTjfNMVuEJBzhsyAR
         n+AiPvXXrEtvDgBPrW/I1kMA5Ut01o4SJyu8Wnm8kW8hXEBtTq2KegEbEEI5h68FXRuo
         hv3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXnlYiPCcFyDlcLCtsYukp2tCdpaRQOerz7aegj1CJtZNyPinsAzn55Sa41HwJJVyayvIrZ6nK6t1qJXp+@vger.kernel.org
X-Gm-Message-State: AOJu0YwjC1sU2BnbjNq4c+dthgL4ZgOof9ThvXFi6NTQXUmcpROj6aDy
	BXoECEa26gDoyAlMzQnEmWWxBqDXGXNAreuroPOCY6LyOXpitP0sEVVnhMbjPO6XIuc=
X-Gm-Gg: ATEYQzy27xOFuTh5e56JevROcvF92mWOcpnHu3/7DRON/jdWNz9vxhK3t4dU7OYtB/y
	Uc4rYmjBowY/OdidzJU6ajnsUUdu40y0k9ERKc+htuus3KG3PagYuvtVnPOVjErP4U53nE8rujw
	QeNEMqNO6edipEkz7k0ktzjQln2F7uqPPEYl31V3gsHPffVpQfCyDSa/3JuBv176e8JpZZn/TiZ
	34cEnJw0WrvQhGm9JSk3zFw/6l0HqYZCySVN4kNhC6BzL4p9tBTUkaS9uB26I0jwGTy2aV3OGF0
	mMgfZk3+1V0mM4Kdd2vEYViDkLVt+BaMMFqEIawKr2QWIaNZxYY8PLQMZEgIAH9k8J7Ydqzix7m
	i12JabUkHTxTr6eJG2k8Cyr1fMLkY2/+6cJPcQcL/AlFc6L0NuTyGxFOIL/KLGCt55BBQbOGLeS
	KsJwM9jNGryDBrXIUafkp2WdZym+cxfLXpLia6ozBL0QtWVtzM/bYkmF88Y50WQ0tZFGK3Mw==
X-Received: by 2002:a05:620a:28ce:b0:8cd:8f18:d1f4 with SMTP id af79cd13be357-8cfc7b788f0mr8360585a.6.1773941006423;
        Thu, 19 Mar 2026 10:23:26 -0700 (PDT)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c8521521dsm1516736d6.8.2026.03.19.10.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 10:23:26 -0700 (PDT)
Subject: Re: [PATCH v3 4/4] drm/msm/dpu: fix video mode DSC INTF timing width
 calculation
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Alexander Koskovich <akoskovich@pm.me>
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
 <3f8763af-aad2-4d92-90c8-cfd290212503@linaro.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <7fb9dd9d-13f9-7bba-93d1-08f42dd6ee38@marek.ca>
Date: Thu, 19 Mar 2026 13:23:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <3f8763af-aad2-4d92-90c8-cfd290212503@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[marek.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-98803-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[marek.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[marek.ca:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathan@marek.ca,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[marek.ca:dkim,marek.ca:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: D73A92CFFAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 10:54 AM, Neil Armstrong wrote:
> On 3/19/26 15:40, Alexander Koskovich wrote:
>> On Thursday, March 19th, 2026 at 10:13 AM, Neil Armstrong 
>> <neil.armstrong@linaro.org> wrote:
>>
>>> Hi,
>>>
>>> On 3/19/26 12:58, Alexander Koskovich wrote:
>>>> Using bits_per_component * 3 as the divisor for the compressed INTF
>>>> timing width produces constant FIFO errors for the BOE BF068MWM-TD0
>>>> panel due to bits_per_component being 10 which results in a divisor
>>>> of 30 instead of 24.
>>>>
>>>> Regardless of the compression ratio and pixel depth, 24 bits of
>>>> compressed data are transferred per pclk, so the divisor should
>>>> always be 24.
>>>
>>> Not true with widebus, specify why 24 and because DSI widebus is not 
>>> implemented yet.
>>>

DSI widebus is implemented, and always used when available. The 
adjustment for DSI widebus just doesn't happen in this function.

>>>>
>>>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 9 ++++-----
>>>>    1 file changed, 4 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>>> index 0ba777bda253..5419ef0be137 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>>> @@ -122,19 +122,18 @@ static void drm_mode_to_intf_timing_params(
>>>>        }
>>>>
>>>>        /*
>>>> -     * for DSI, if compression is enabled, then divide the 
>>>> horizonal active
>>>> -     * timing parameters by compression ratio. bits of 3 
>>>> components(R/G/B)
>>>> -     * is compressed into bits of 1 pixel.
>>>> +     * For DSI, if DSC is enabled, 24 bits of compressed data are
>>>> +     * transferred per pclk regardless of the source pixel depth.
>>>>         */
>>>>        if (phys_enc->hw_intf->cap->type != INTF_DP && 
>>>> timing->compression_en) {
>>>>            struct drm_dsc_config *dsc =
>>>>                   dpu_encoder_get_dsc_config(phys_enc->parent);
>>>> +
>>> Drop this change
>>>
>>>>            /*
>>>>             * TODO: replace drm_dsc_get_bpp_int with logic to handle
>>>>             * fractional part if there is fraction
>>>>             */
>>>> -        timing->width = timing->width * drm_dsc_get_bpp_int(dsc) /
>>>> -                (dsc->bits_per_component * 3);
>>>> +        timing->width = timing->width * drm_dsc_get_bpp_int(dsc) / 24;
>>>
>>> It would be helpful to somehow show that 24 is 8 * 3, 8 being the 
>>> byte width and 3 the compression ratio.
>>
>> Can you clarify what the 3 represents? My panel should have a 3.75:1 
>> compression
>> ratio (30/8) so the final divisor of 24 would be wrong for my panel if 
>> its the
>> compression ratio?
> 
> So my guess is that while the exact ratio on the DSI lanes is 3.75:1, 
> the ratio
> used to calculate the INTF timings is 3, then the DSC encoder probably 
> does the
> magic to feed 10bpp into a 3.75:1 ratio over the DSI lanes.
> 

That's not how it works. INTF (which feeds DSI) is after DSC compression.

INTF timings are always in RGB888 (24-bit) units. Ignoring widebus 
details, the INTF timing should match what is programmed on the DSI side 
(hdisplay, which is calculated as bytes per line / 3).

(fwiw, the current "timing->width = ..." calculation here blames to me, 
but what I wrote originally was just "timing->width = timing->width / 3" 
with a comment about being incomplete.)

> In dsi_adjust_pclk_for_compression, the pclk is adjusted to take in 
> account bits_per_component,
> so I presume the actual DSI pclk _is_  timing->width * 
> drm_dsc_get_bpp_int(dsc) / (dsc->bits_per_component * 3),
> which is your 3.75:1, but the INTF needs to generate timing->width * 
> drm_dsc_get_bpp_int(dsc) / (8 * 3) pixels
> to the DSC encoder which will emit timing->width * 
> drm_dsc_get_bpp_int(dsc) / (dsc->bits_per_component * 3) pixels.
> 

The hdisplay calculation in dsi_adjust_pclk_for_compression (which only 
affects the clock rate) seems to be wrong, and I think Alexander's panel 
must be running at a 20% lower clock because of it. dsi_timing_setup has 
the right hdisplay adjustment.

> In any case, 24 _is_ 3 * 8, 3 being the DSC compression ratio on the 
> INTF side.
> 
> Dmitry, Konrad, could you help confirming this ?
> 
> Neil
> 
>>
>>>
>>>>            timing->xres = timing->width;
>>>>        }
>>>>    }
>>>>
>>>
>>>
>>>
>>
>> Thanks,
>> Alex
> 

