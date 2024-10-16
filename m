Return-Path: <linux-arm-msm+bounces-34641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 536AC9A14C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 23:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEE8B1F237C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 21:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A18B1D1747;
	Wed, 16 Oct 2024 21:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1f9QGmc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68E013B298;
	Wed, 16 Oct 2024 21:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729114100; cv=none; b=RXeZB5UJygMg6+Lxwhj2EYo6N+GbSIFAl9yEavePbYi0jAD5ZRMQwScA10nNNBsm1jqeBDOPiFeDPad/RB9B006MutpZjtTBVUCtk5/l6amiW7qKpTv8NgO4sQnnTQcNwA74JuhgOXywe0m/zu44xFdUaDaOlppUscf3ZKo5AWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729114100; c=relaxed/simple;
	bh=5PhXO9+lGo8DXD+77zpwvx1TmCrT2UDumS9RD2YFaFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uUKVKWdhQUXqs/jAbIsYZD7RiIRCeQxfe3qNiViaIWQZOyV0RoNYKPwvVPaeTwLOz7EcsuQLX+8Fz57ljtoUFNOlwe2DttDsNJ88TcFotB31WWHKtgTUWvfCEvg8QMKz3mN+QCf/efa9m7mKxFH5+HFGREoXWGeI7606BElGmSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W1f9QGmc; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37d5689eea8so161236f8f.1;
        Wed, 16 Oct 2024 14:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729114097; x=1729718897; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J5CWN7tpBnupHcpZl+OhrCbgO2xISPYJhOm4vkK3JRU=;
        b=W1f9QGmcz/4zAzdTiOKJcbWf5JF57PUMN/feACGG6if6a5GtlDDAY0wbJFKBYawNCR
         y0EFsNOg9Gkw0JyVhbE+SYjj1Zj5lHYWmV4WpYWsRbyAcWwJCyvznDvmo7Mf+3tKvfGX
         g08mQHVqMMcBRqij6yNBu3NtIDqpaY2vsMCNU0Bt1WnkXcXb5JC4bpZDLNSE+zLd8KaF
         rbESxNNOYvFyxYf10HIYdHforWJr315f090xk8WmWfiEfKsKMGZiPYTNLe7f3bckF0FD
         HvYRTowJmkxnmNqLgK5e1iH1S3IEpF8v6mZeJEH5PXWxb/qjxa+c7/fp24fLauPlGdUN
         9orA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729114097; x=1729718897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J5CWN7tpBnupHcpZl+OhrCbgO2xISPYJhOm4vkK3JRU=;
        b=pOdqvJIxoKhENpC2YeFlbZkp9KvnG3F7JTEY09syet9LsNgnjZbcBY8KeT3muAZ8UF
         LOb4004Pcu84qGw1lTFJm2T8kGU2tcuaBa3qV4azWsjmO/QSHEazE5CFeGFs5ASdEhQe
         TZQeaB/R5lFXENkrtXAzlCeRDlKIpezsCVGVI67fAGDWPhG3jYTJOuZltArlKCmZ7GT7
         XSmTkZMt5GWgrPswkdiXtpG4VqwBEikXkgZN6nChvGZO0/wHh0kLfvUPuqgqXfSBdiCl
         sBduH2YOdHllzSfjRtkU3b5d1ZhxfOKiQU2EoEXYAVv2lFNz/fcLWQZ70/9Q75hW0sZx
         sCdw==
X-Forwarded-Encrypted: i=1; AJvYcCVOtKSonIpJYsvYuR0FM18oeHXX2u8Mj1ymnE/jdPB9J6UrCWo1rrLgd71ntPUzk03Ft91J1RHbyLIqrvHL@vger.kernel.org, AJvYcCWI7dZpFDcNtQpVCbL3QskpP9sjU6eBeQ/eQvk+zSrPwf4t5wWMOydx2JuyiFxEVyDAlH7wXPYJQGsLoKQ+@vger.kernel.org, AJvYcCWJgaI1har6VMDKXtgkX4SBzDvztZOViVqRkVlS5gvUOSffNMiA+4LDjQO0qYUYLMroK9a/jjOrBUvM@vger.kernel.org
X-Gm-Message-State: AOJu0YxU7SO5J3tjcv9irsBsZ8hGJbTLwq9L+FL3uqWMDIuva8fkTsc7
	3BYgTD+G7TF6dD19p7WE6fmdQ8WmJPxOsV5ZX+Eq/tkmyQny9C2o
X-Google-Smtp-Source: AGHT+IG4mBL0U4ZnMOKXMqwNyakKje1boFmWs0OmDTl3djpfOcLYydP6lSw31xXpkwvjWI3DP54Brw==
X-Received: by 2002:adf:ce83:0:b0:37d:4cf9:e085 with SMTP id ffacd0b85a97d-37d86bdc2c4mr3677507f8f.25.1729114096729;
        Wed, 16 Oct 2024 14:28:16 -0700 (PDT)
Received: from [192.168.1.17] (host-80-104-113-188.retail.telecomitalia.it. [80.104.113.188])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c98d4d680csm2061359a12.6.2024.10.16.14.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 14:28:16 -0700 (PDT)
Message-ID: <281503da-6ac3-496f-8051-d4e03979c1ef@gmail.com>
Date: Wed, 16 Oct 2024 23:28:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v8,09/12] drm/msm/a6xx: Add traces for preemption
To: Rob Clark <robdclark@gmail.com>
Cc: Kees Bakker <kees@ijzerbout.nl>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
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
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20241003-preemption-a750-t-v8-9-5c6cb9f256e0@gmail.com>
 <1b9afb20-d608-464c-ae6b-c535564b7e5a@ijzerbout.nl>
 <eb1a0381-05c3-4ef8-b6de-96824d587a7d@gmail.com>
 <CAF6AEGu0b5EXjvjDn1DTy2zCSDp7yFpGvGoAb3Kc91Y9HK+=pg@mail.gmail.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <CAF6AEGu0b5EXjvjDn1DTy2zCSDp7yFpGvGoAb3Kc91Y9HK+=pg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/16/24 10:33 PM, Rob Clark wrote:
> On Wed, Oct 16, 2024 at 5:13 AM Antonino Maniscalco
> <antomani103@gmail.com> wrote:
>>
>> On 10/8/24 11:10 PM, Kees Bakker wrote:
>>> Op 03-10-2024 om 18:12 schreef Antonino Maniscalco:
>>>> Add trace points corresponding to preemption being triggered and being
>>>> completed for latency measurement purposes.
>>>>
>>>> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>> Tested-by: Rob Clark <robdclark@gmail.com>
>>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
>>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
>>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
>>>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  6 ++++++
>>>>    drivers/gpu/drm/msm/msm_gpu_trace.h       | 28 +++++++++++++++++++++
>>>> +++++++
>>>>    2 files changed, 34 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/
>>>> drm/msm/adreno/a6xx_preempt.c
>>>> index
>>>> 21e333cb6342d33425eb96f97bcc853e9b041b36..6803d5af60cc8fb0f2a52ee160ffdbf0e8ef0209 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>>>> @@ -7,6 +7,7 @@
>>>>    #include "a6xx_gpu.h"
>>>>    #include "a6xx_gmu.xml.h"
>>>>    #include "msm_mmu.h"
>>>> +#include "msm_gpu_trace.h"
>>>>    /*
>>>>     * Try to transition the preemption state from old to new. Return
>>>> @@ -174,6 +175,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
>>>>        set_preempt_state(a6xx_gpu, PREEMPT_NONE);
>>>> +    trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
>>>> +
>>>>        /*
>>>>         * Retrigger preemption to avoid a deadlock that might occur
>>>> when preemption
>>>>         * is skipped due to it being already in flight when requested.
>>>> @@ -294,6 +297,9 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>>>>         */
>>>>        ring->restore_wptr = false;
>>>> +    trace_msm_gpu_preemption_trigger(a6xx_gpu->cur_ring->id,
>>>> +        ring ? ring->id : -1);
>>>> +
>>> There is no need for the ternary operator. "ring" should be non-NULL,
>>> otherwise the code would have already crashed.
>>> So the change can just be
>>>       trace_msm_gpu_preemption_trigger(a6xx_gpu->cur_ring->id, ring->id);
>>
>> You are right, we had a similar cleanup but I missed this particular
>> one, thanks for pointing me at it! I apologize for the late response but
>> I've been at XDC and therefore unable to look at my email. I will point
>> this out to Rob since this series is in msm-next to see if I need to
>> send a separate patch to clean this.
> 
> Yes, please send a new commit, I don't want to re-write history on msm-next

Makes sense.
I noticed somebody else has already sent the patch for it 
https://lore.kernel.org/linux-arm-msm/20241011052315.4713-1-everestkc@everestkc.com.np/

> 
> BR,
> -R
> 
>> Best regards,
>> --
>> Antonino Maniscalco <antomani103@gmail.com>


Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>

