Return-Path: <linux-arm-msm+bounces-32694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CD3988B22
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 22:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7FA81F2136F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 20:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E269219308E;
	Fri, 27 Sep 2024 20:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i379LYSX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0739F1C0DD7;
	Fri, 27 Sep 2024 20:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727468128; cv=none; b=TN6dzb8ffCqSpbN5xv/cL6UkYbXe1E0obuRsSTYp2YGz/QWFIqM4JiyXl1vUUwtrDh+5e3arZzu1Ev0FOo15jkyRhEL3IhDCFF5aJDotDfTY1UEWRJSExi+WtEaQfH44ulg5cK/ZL/wUCO3g+rgKzTHoo7AbEXl14RhJ8cctP9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727468128; c=relaxed/simple;
	bh=ek8QD245r6lFUWHgAu5IKfQNlnFycA+9qL9ruUcoRB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Luv60SUpmCA4JJfmrdwc4TQDe1hrr6vFcaFo90sdNGdCttBtrSPcSdiGs63rRXruE5KwZD+658jvGwj1w7VtVQMF3qqxkxzapz8Kx9/gbRBeVNUjarnRXfHtZHRlsUjG44OGtNehbDq9MVAXIeNvPTrFKfo0L3WsYilqfbQV3d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i379LYSX; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5365aa568ceso3185654e87.0;
        Fri, 27 Sep 2024 13:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727468125; x=1728072925; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QIMNxc9i5uywt236vnRMCdmiBIxZF4zCqaMPF6coLfc=;
        b=i379LYSXm0VyD1ot7Gx7SM4HA684MhDsqToXpAIzGTXBgtoknHqR5pTk3gzJ/d9ViU
         xTTUFDzTgWe7Kk0ricYyIaHm0C74KoNREADVN9aSSL7FiPYt82zcsOw/BDVsFK9sXh6X
         nY6TMS5UHBuUv0IuFyFmXYb3DLF10F7X8iBxgUjmulA//CSPnu7NTKl5d1CpY2g3wFGN
         MuliFRhVGsP4O8/FulBIXapVsNiucJfEe/d43Tc43Jjy9CVB0cSUX7bFL6Qxp4zBRSx9
         tYHnLY5mBLF6nQ/lDRnRxKJ7Z4KKUUcGtcuIEfR3IiVIYj3ZEUG/LfgliSNgbR2c/prp
         Kghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727468125; x=1728072925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QIMNxc9i5uywt236vnRMCdmiBIxZF4zCqaMPF6coLfc=;
        b=AgwJG2kkN5HDcm0qtM4T5F1t7jBPw1pF2GQwqO1JfwdgPi817vvqdDnQ84zFvPQhYm
         LMuBq/YvypLFKqRlj7CLOd5FmueapZyAsMFASubt6JKY1U5nTqVKfEJtjow1p75VWgP9
         qQizr8OGeHagUqzKDUZ641YwZBuyEg6EXamWuKi25ueOf0zt8z+Qt65KGgyRKG7pHTbA
         C6v33E8eKYx//gSDlM3HIfm1FX3lY6Rr3oRVOGFuLo2zkaqKd/zXT/homhEXuh042zdX
         48JWvBC+s6EV09quUBuwhx6Iz/uZh2ucIjPvo4WzHPlmVZT0cEgb4VX/aDrf9u1q3RaB
         pvYA==
X-Forwarded-Encrypted: i=1; AJvYcCUcsJyuhiZRr8dey2vTveUW+3B4f8xSsA+MASHLEIdLMNslGwi6WFA5IqRVeu2Hqa5Ma2hAu6ti95pLP52N@vger.kernel.org, AJvYcCVw09DN2K7TTG1UpEHmIeIYNKXqk5bq05FZh1J8V84uEXh8qk78VSYfpBFpTf3vpbybQQq7Ba4b2R68@vger.kernel.org, AJvYcCXMsPAzqswo4M3n5wEtNBTvt91dkRl5NtHTQJCFqtIPF720h+9DmZKUVDw09IXTMj6JIzJcHkei3puW4N7e@vger.kernel.org
X-Gm-Message-State: AOJu0YzFFNwJ8vtEvj0EBGMmCbdboKNQJxQ4hQXSBews6evzVKypjOWo
	3s22/W4ckXZPRoqBS0vTtLIdITrQY5JNky6OBYkF0cKiO1w1Urwk
X-Google-Smtp-Source: AGHT+IHQGK1XWDK0fxlB6FflHsYkNhurTWaq10UOXiMznBIujmMLFUq8kQYDLfUnHiiGnjT2eyaWxA==
X-Received: by 2002:a05:6512:31c1:b0:536:5625:511f with SMTP id 2adb3069b0e04-5389fc7d145mr4416291e87.45.1727468124570;
        Fri, 27 Sep 2024 13:15:24 -0700 (PDT)
Received: from [192.168.1.17] (host-87-19-160-215.retail.telecomitalia.it. [87.19.160.215])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2997507sm168172766b.204.2024.09.27.13.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 13:15:24 -0700 (PDT)
Message-ID: <a035fb73-e2b8-4928-b136-b3b99996bc84@gmail.com>
Date: Fri, 27 Sep 2024 22:15:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/11] drm/msm/a6xx: Implement preemption for a7xx
 targets
To: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sharat Masetty <smasetty@codeaurora.org>
References: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
 <20240926-preemption-a750-t-v6-5-7b6e1ef3648f@gmail.com>
 <CAF6AEGviMOLoZKHf4DX9mEj84Y5Xx2hH4tvrkRVLsYyQz35Bwg@mail.gmail.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <CAF6AEGviMOLoZKHf4DX9mEj84Y5Xx2hH4tvrkRVLsYyQz35Bwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/27/24 6:29 PM, Rob Clark wrote:
> On Thu, Sep 26, 2024 at 2:17 PM Antonino Maniscalco
> <antomani103@gmail.com> wrote:
>>
>> This patch implements preemption feature for A6xx targets, this allows
>> the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
>> hardware as such supports multiple levels of preemption granularities,
>> ranging from coarse grained(ringbuffer level) to a more fine grained
>> such as draw-call level or a bin boundary level preemption. This patch
>> enables the basic preemption level, with more fine grained preemption
>> support to follow.
>>
>> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>> ---
>>   drivers/gpu/drm/msm/Makefile              |   1 +
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 283 +++++++++++++++++++++-
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 +++++++++++++
>>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 377 ++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/msm_ringbuffer.h      |   7 +
>>   5 files changed, 825 insertions(+), 11 deletions(-)
>>
> 
> [snip]
> 
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 6e065500b64d6d95599d89c33e6703c92f210047..355a3e210335d60a5bed0ee287912271c353402a 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> 
> [snip]
> 
>> @@ -784,6 +1015,16 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
>>                  msm_gem_object_set_name(a6xx_gpu->shadow_bo, "shadow");
>>          }
>>
>> +       a6xx_gpu->pwrup_reglist_ptr = msm_gem_kernel_new(gpu->dev, PAGE_SIZE,
>> +                                                        MSM_BO_WC  | MSM_BO_MAP_PRIV,
>> +                                                        gpu->aspace, &a6xx_gpu->pwrup_reglist_bo,
>> +                                                        &a6xx_gpu->pwrup_reglist_iova);
> 
> Couldn't this also be MSM_BO_GPU_READONLY?  And same for the
> preempt_postamble_ptr, I assume?

So for pwrup_reglist_ptr, it contains the cpu_gpu_lock struct that needs 
to be written by the gpu. The list itself is part of that struct.

> 
> Also, it looks like we are only writing the smmu_info from the
> kernel.. is there any way that could be split out into a RO buffer?

For preempt_postamble_ptr, and smmu_info I think it should be possible 
so I'll work on that.

> 
> BR,
> -R
> 
>> +
>> +       if (IS_ERR(a6xx_gpu->pwrup_reglist_ptr))
>> +               return PTR_ERR(a6xx_gpu->pwrup_reglist_ptr);
>> +
>> +       msm_gem_object_set_name(a6xx_gpu->pwrup_reglist_bo, "pwrup_reglist");
>> +
>>          return 0;
>>   }
>>


Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>

