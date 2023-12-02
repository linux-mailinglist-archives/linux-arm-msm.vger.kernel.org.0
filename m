Return-Path: <linux-arm-msm+bounces-3019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BE7801C57
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 12:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3800281BC7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 11:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FBEB11732;
	Sat,  2 Dec 2023 11:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MpxeUPic"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 809F2134
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 03:12:07 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c9f099cf3aso4788901fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 03:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701515526; x=1702120326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ye7uYp1nmAK2nKeV+Qnc2ULdi2skK6GG5U5rkpVgBoU=;
        b=MpxeUPic8LNnPUQ57uD4G28VlI3hu8YzgVf+9PSRfrkFN6k8Y82vIqwrUTf84z4Hq2
         fjcCiXynPEkG9EBnPWHBN4jjsVAsLw6yhthjcNIP+g1/BHsbUZzDnRvgvTcOdddGFc62
         hctRbERcKgJIFueQjgNSoX//FZL/JVYzyiUaRKc5RraNdLrlV3SttnsBOwCvyi2DvCni
         MDiYqF3LGrlMWotoedsTUyzqb9+piBQu9MVP1MuyXen3yXxadOn6qu+ZaWUOT23y6ngt
         eXVkcnlXzbmaZy/FJzL2UL6E1xNn6ZjLrdT4Ch8O4N2UzAr68XtsmJI0lcAcUJC9v1zP
         +qOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701515526; x=1702120326;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ye7uYp1nmAK2nKeV+Qnc2ULdi2skK6GG5U5rkpVgBoU=;
        b=U2d7bo6dTW/jko6Tu6RpljTGoOwp1srHvt6WB11jxI81kFpcAlfY9oFvOPmpGMJJ7k
         MFexk84W98rr3YFnh93wWbY34dwFICcGiox9dYki/8Hpv6R4FYYKPVvpjfVahxA3lvcF
         Wxp0GVVAf1s8lWUB0i0LxyG5DmMDx7tG4cZ+fWOGB2ogAcFJNjGjxJUSXAjDMxUjU1Hj
         AHTPwBwomtTQUFksqjgYzRrzOW9oTx2CG3QnZv99pYcV2j2ZAGWzk6dd3GtwpgadnQqR
         BSSRu7F0jxOXMAhQDLVCIinBJj1crqzdLbNdFah36IUIgMkSISGqwksev+79oxsQd3R8
         bQPQ==
X-Gm-Message-State: AOJu0YzuE8unWiojv9Xjtr2iE6Hr5/JVBJbTmT4H7WL2RxvMTwh6kmDO
	5syU69P0QjoR1SVAvHrLtjRy+Q==
X-Google-Smtp-Source: AGHT+IGvGjkThsYR3UUVLQAlKIxV9cBXcsJZftyrwSYfFBkAKYldOtihnoBuJqklB3k+/mK35PAMHQ==
X-Received: by 2002:a2e:81d1:0:b0:2c9:ed9f:9dff with SMTP id s17-20020a2e81d1000000b002c9ed9f9dffmr517970ljg.88.1701515525554;
        Sat, 02 Dec 2023 03:12:05 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id l21-20020a2ea315000000b002c9bae02ca9sm687112lje.18.2023.12.02.03.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Dec 2023 03:12:05 -0800 (PST)
Message-ID: <67c2f17d-4405-4a44-8215-202759957885@linaro.org>
Date: Sat, 2 Dec 2023 13:12:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] drm/msm: add arrays listing formats supported by
 MDP4/MDP5 hardware
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
 <20230708010407.3871346-2-dmitry.baryshkov@linaro.org>
 <47635658-6424-7f95-97e8-0955e262fec1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <47635658-6424-7f95-97e8-0955e262fec1@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/12/2023 03:36, Abhinav Kumar wrote:
> 
> 
> On 7/7/2023 6:03 PM, Dmitry Baryshkov wrote:
>> MDP4 and MDP5 drivers enumerate supported formats each time the plane is
>> created. As the list of supported image formats is constant, create
>> corresponding data arrays to be used by MDP4 and MDP5 drivers.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/mdp_format.c | 49 +++++++++++++++++++++++++--
>>   drivers/gpu/drm/msm/disp/mdp_kms.h    |  5 +++
>>   2 files changed, 52 insertions(+), 2 deletions(-)
>>
> 
> After going through the patch series, as commented in patch 17 I am 
> totally fine with migrating to drmm-managed APIs but I dont like to 
> maintain 3 format arrays.
> 
> Can we keep the existing format mechanism to avoid having two more arrays?

For DPU we have exactly the same idea: single formats data array 
describing and per-usecase arrays, like plane RGB arrays, plane YUV+RGB 
array, WB arrays.

Anyway. formats was one of the topics where we had a lot of duplication 
between mdp4/mdp5 and dpu anyway. I think I'm going to back up the 
patches 1, 10, 16, 17 (plane patches depend on the format arrays), push 
the rest of the patches to msm-next-lumag and send a series reworking 
all the formats handling.


> 
>> diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c 
>> b/drivers/gpu/drm/msm/disp/mdp_format.c
>> index 025595336f26..ba9abe8b3acc 100644
>> --- a/drivers/gpu/drm/msm/disp/mdp_format.c
>> +++ b/drivers/gpu/drm/msm/disp/mdp_format.c
>> @@ -81,8 +81,8 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
>>   #define BPC0A 0
>>   /*
>> - * Note: Keep RGB formats 1st, followed by YUV formats to avoid breaking
>> - * mdp_get_rgb_formats()'s implementation.
>> + * Note: Keep mdp_rgb_formats and mdp_rgb_yuv_formats in sync when 
>> adding
>> + * entries to this array.
>>    */
>>   static const struct mdp_format formats[] = {
>>       /*  name      a  r  g  b   e0 e1 e2 e3  alpha   tight  cpp cnt 
>> ... */
>> @@ -138,6 +138,51 @@ static const struct mdp_format formats[] = {
>>               MDP_PLANE_PLANAR, CHROMA_420, true),
>>   };
>> +const uint32_t mdp_rgb_formats[] = {
>> +    DRM_FORMAT_ARGB8888,
>> +    DRM_FORMAT_ABGR8888,
>> +    DRM_FORMAT_RGBA8888,
>> +    DRM_FORMAT_BGRA8888,
>> +    DRM_FORMAT_XRGB8888,
>> +    DRM_FORMAT_XBGR8888,
>> +    DRM_FORMAT_RGBX8888,
>> +    DRM_FORMAT_BGRX8888,
>> +    DRM_FORMAT_RGB888,
>> +    DRM_FORMAT_BGR888,
>> +    DRM_FORMAT_RGB565,
>> +    DRM_FORMAT_BGR565,
>> +};
>> +
>> +size_t mdp_rgb_num_formats = ARRAY_SIZE(mdp_rgb_formats);
>> +
>> +const uint32_t mdp_rgb_yuv_formats[] = {
>> +    DRM_FORMAT_ARGB8888,
>> +    DRM_FORMAT_ABGR8888,
>> +    DRM_FORMAT_RGBA8888,
>> +    DRM_FORMAT_BGRA8888,
>> +    DRM_FORMAT_XRGB8888,
>> +    DRM_FORMAT_XBGR8888,
>> +    DRM_FORMAT_RGBX8888,
>> +    DRM_FORMAT_BGRX8888,
>> +    DRM_FORMAT_RGB888,
>> +    DRM_FORMAT_BGR888,
>> +    DRM_FORMAT_RGB565,
>> +    DRM_FORMAT_BGR565,
>> +
>> +    DRM_FORMAT_NV12,
>> +    DRM_FORMAT_NV21,
>> +    DRM_FORMAT_NV16,
>> +    DRM_FORMAT_NV61,
>> +    DRM_FORMAT_VYUY,
>> +    DRM_FORMAT_UYVY,
>> +    DRM_FORMAT_YUYV,
>> +    DRM_FORMAT_YVYU,
>> +    DRM_FORMAT_YUV420,
>> +    DRM_FORMAT_YVU420,
>> +};
>> +
>> +size_t mdp_rgb_yuv_num_formats = ARRAY_SIZE(mdp_rgb_yuv_formats);
>> +
>>   /*
>>    * Note:
>>    * @rgb_only must be set to true, when requesting
>> diff --git a/drivers/gpu/drm/msm/disp/mdp_kms.h 
>> b/drivers/gpu/drm/msm/disp/mdp_kms.h
>> index b0286d5d5130..11402a859574 100644
>> --- a/drivers/gpu/drm/msm/disp/mdp_kms.h
>> +++ b/drivers/gpu/drm/msm/disp/mdp_kms.h
>> @@ -94,6 +94,11 @@ struct mdp_format {
>>   uint32_t mdp_get_formats(uint32_t *formats, uint32_t max_formats, 
>> bool rgb_only);
>>   const struct msm_format *mdp_get_format(struct msm_kms *kms, 
>> uint32_t format, uint64_t modifier);
>> +extern const uint32_t mdp_rgb_formats[];
>> +extern size_t mdp_rgb_num_formats;
>> +extern const uint32_t mdp_rgb_yuv_formats[];
>> +extern size_t mdp_rgb_yuv_num_formats;
>> +
>>   /* MDP capabilities */
>>   #define MDP_CAP_SMP        BIT(0)    /* Shared Memory 
>> Pool                 */
>>   #define MDP_CAP_DSC        BIT(1)    /* VESA Display Stream 
>> Compression    */

-- 
With best wishes
Dmitry


