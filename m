Return-Path: <linux-arm-msm+bounces-24393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DC7919AC9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 00:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33B111C20F45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 22:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9FA319306A;
	Wed, 26 Jun 2024 22:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BfKutt2A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC46168483
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 22:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719441655; cv=none; b=FTart0HUD3DWZHgPciQqo66XqOr5mYBnmzBMOnd0nNvMuYP4SWW37IujRsKk/dX+/XbjN4WVB57UKnEtnFGofMvsaaNNfgjZVYVj3QQfgw9CbCT/pJLjt5Cz1X6X+myShp2l6fY5ukC0Q1YlJFgNSkv6hlwykxEnfJmuUyt65pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719441655; c=relaxed/simple;
	bh=GNZbPGkqmPc4rH7ugcmel6+9l1/+c8fibLHekmnoXOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kq+uSUNSu+EWl6gGPzEAyQxdlvNXH44FqexlG/24g/GmXq2j6QiSx3+kKI2R0kHFDllEQG5devCupnosAtRQNy0WD+kP7jFommC8zppZS4LcozZCfn7Bx+3GenFXSynrznSqd22RBQvjXyHdFX4hq/0iN62hWF1MKnmMVH1NKf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BfKutt2A; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-57d2fc03740so1039016a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 15:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719441652; x=1720046452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DiJIwUHGJKAddL1l5PHQCjx9Ibq/P+A4R2VYZRioi9Y=;
        b=BfKutt2AkYxme8KqLTSI0oRJwZ0WLBc9WqzfQ4/wUUHgjeaeRD19KA4TeeuTMm7NO1
         iv6ZOPSsDarErpOuqvdCM1hVsFii1ysVK3ClrhitgWxhQcpsYnXjC9F7va5B9LlaCxC4
         r+219bgzjyRm9fBDTpVFGwx1NpzbzCXniAddUg91M23unqziT3cxHtuQ23lvODV63DQa
         1rnCwb0Udz2j92ph1b0minGP9BoqQPyzc49HRLMGGXwQ0BD1yTb73LlNHMwpOW6/39Gm
         eS0bByjX4eGkM/flYH41dHEYqz34CN/xno8jVzFslJaUujmdMYzts92Ato8j0N/SKA0/
         UZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719441652; x=1720046452;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiJIwUHGJKAddL1l5PHQCjx9Ibq/P+A4R2VYZRioi9Y=;
        b=EMHYyWzei+x2PvSqb2THRkM8e9Z5HEnJ2L5LSMz7GO58s/hzqpUMgxoHX3z8xWn7aF
         8IvQ+M3RGfPWJR+1deefUJjH4+rqX0gN8u3Mon3a2Nq+HbSj3uOqu0AIf/3CfRhZzDxh
         q5c36humNGTCeLQi9P5HiRN5m7X/P8bzcmOCNodfpd3IWJ0SooNGIQ4HEGsX20TqqqMC
         V12cBYv9BLK/1zZNZH0LcRLWD89riNAWDA7w8meR5IDiVH3E8gRZdoSRSFSbO9baiQTl
         hgNiGckQXd6xqYzo1C36UoAzHCaGwNVchjlArY8dtwHyLRnHUDHJVzwx12dJLjymsDc9
         ru0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWL4P4PTZkXEJURX/SB8PlZN2fpAe1rSTlSJxWSwr8Z5S1Z59yG7nbOXLClG7Te8rejWv1FQjIA1HXOw4twAgr0gHy8alMdAGRy4yq67A==
X-Gm-Message-State: AOJu0Ywh71ZReMoIfPI3M75Pripg9DlzFl4Zh6ZNlXsmxs7f/C2IvT5r
	a+xePynXx2H7NfeqXVumkVQrrdCgxz8Hft/wM5L/DjeTM5mqVg6bqkVxG+xIviQ=
X-Google-Smtp-Source: AGHT+IHBDqzyAQaqAblMBYZ/REnw/xBnckkWEvFRfvbnVeW0ScRJWnXj7RChoQ3nKge40kbFdsUXOg==
X-Received: by 2002:a50:a417:0:b0:57c:9c5d:d195 with SMTP id 4fb4d7f45d1cf-57d4bdc9e02mr8073153a12.27.1719441651591;
        Wed, 26 Jun 2024 15:40:51 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-584d17b0618sm65946a12.57.2024.06.26.15.40.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 15:40:50 -0700 (PDT)
Message-ID: <c1ec95ac-3831-4d78-a572-c95c0ee493a2@linaro.org>
Date: Thu, 27 Jun 2024 00:40:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] drm/msm/adreno: Add support for X185 GPU
To: Rob Clark <robdclark@gmail.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
 <20240623110753.141400-3-quic_akhilpo@quicinc.com>
 <5947559d-30dd-4da1-93cc-a15dc65cb77d@linaro.org>
 <20240626082422.zcsari27yoskayuo@hu-akhilpo-hyd.qualcomm.com>
 <CAF6AEGvCaGq8ukxra_bzc=4pUf8y5NndKRagQspD0=uCZdBfoA@mail.gmail.com>
 <853849b4-69f2-488f-ab17-dc550c235e3d@linaro.org>
 <CAF6AEGsFExhokWqHka-cwFGqyYgo61OL=7F=o5ouRm-LoHh9Dw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CAF6AEGsFExhokWqHka-cwFGqyYgo61OL=7F=o5ouRm-LoHh9Dw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.06.2024 12:32 AM, Rob Clark wrote:
> On Wed, Jun 26, 2024 at 2:38 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> On 26.06.2024 8:43 PM, Rob Clark wrote:
>>> On Wed, Jun 26, 2024 at 1:24 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>
>>>> On Mon, Jun 24, 2024 at 03:53:48PM +0200, Konrad Dybcio wrote:
>>>>>
>>>>>
>>>>> On 6/23/24 13:06, Akhil P Oommen wrote:
>>>>>> Add support in drm/msm driver for the Adreno X185 gpu found in
>>>>>> Snapdragon X1 Elite chipset.
>>>>>>
>>>>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>>>> ---
>>>>>>
>>>>>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 19 +++++++++++++++----
>>>>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  6 ++----
>>>>>>   drivers/gpu/drm/msm/adreno/adreno_device.c | 14 ++++++++++++++
>>>>>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++++
>>>>>>   4 files changed, 36 insertions(+), 8 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>>> index 0e3dfd4c2bc8..168a4bddfaf2 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>>> @@ -830,8 +830,10 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
>>>>>>      */
>>>>>>     gmu_write(gmu, REG_A6XX_GMU_CM3_CFG, 0x4052);
>>>>>> +   if (adreno_is_x185(adreno_gpu)) {
>>>>>> +           chipid = 0x7050001;
>>>>>
>>>>> What's wrong with using the logic below?
>>>>
>>>> patchid is BITS(7, 0), not (15, 8) in the case of x185. Due to the
>>>> changes in the chipid scheme within the a7x family, this is a bit
>>>> confusing. I will try to improve here in another series.
>>>
>>> I'm thinking we should just add gmu_chipid to struct a6xx_info, tbh
>>>
>>> Maybe to start with, we can fall back to the existing logic if
>>> a6xx_info::gmu_chipid is zero so we don't have to add it for _every_
>>> a6xx/a7xx
>>
>> If X185 is not the only occurence, I'd second this..
> 
> basically all a7xx are "special" compared to the original logic, so we
> can start with using gmu_chipid for just a7xx

That works

Konrad

