Return-Path: <linux-arm-msm+bounces-34585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BD79A091A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 14:14:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E710B253B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 12:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28CD208D64;
	Wed, 16 Oct 2024 12:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SY66MPp7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DF8208D6F;
	Wed, 16 Oct 2024 12:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729080824; cv=none; b=IHSU57Q4GhGJNeiwkDcvJTjpSnlRxIBQvkUW0sXlH/JTSvhtlO+e7U3y3vy27x+KOe0njG30CT71/A4mbkIUD4IJa5RUQDildgMqXrzuvHzezhFcZIkS3XU1tC66Nml3MGEiFY+85RFedpcV4qZBgzdBcIgx6ISzkE93vbOKwMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729080824; c=relaxed/simple;
	bh=GPs5C5W0bQDDzOr2JPqDh6O06I71YeSwM+tm3MiNfY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XS6UsMHYaN3L4FyTynH5Ww8s927bVzkojCi+mJehL5eXrM99HkpbFivKm3bGFVjfn8B4jqgZifmZ0WntSFRnnFblPgLHUav5FouAUGn/us7DSfjPCJVq9s70Ucp/kXcIVCpjtcDloR5GJaZsZ2WxdwgZCPHgEuGuxbwqXTEUzKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SY66MPp7; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539f7606199so3588975e87.0;
        Wed, 16 Oct 2024 05:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729080821; x=1729685621; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oukX+3+jCZdWa70CsJuXy2feZE0OKF+5+BRjIjFvtuo=;
        b=SY66MPp7t2Vyb9t82nfNXlr/TsgpKLcScrOJk5e7sIzpy1JNRwHnOfZPJ7bKoBYydq
         yGLzRbXwr2qPn/6M9ddfy3edo2tg3RWaZoUN4rdTgmfnByt9Nh6Kd9dlXcB3BvXhxwJ/
         CQFTx3FM3HJPjeIcUYZEZBA5HoYJj7GKzZoIbSsilS/vmNzs8sG2t44M3dleAbplkAHj
         rGdHEqVFpk6jlmtV7xt3MEIF54zoLf3jXmq59mnyMKkVgvHY8NqosAA0tgplKp37OayN
         fQLDsxXHEswDXTmWYnWWs4wkkyIB/O4NaeWP38XwZTnoJvPlw7ZZW14KQczjC63DaUAF
         u66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729080821; x=1729685621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oukX+3+jCZdWa70CsJuXy2feZE0OKF+5+BRjIjFvtuo=;
        b=lUka6SkT+QdPQ2T6kjr5J7SrYnYVZ1gSSRxINR64iH3TOv2662vNYBTFf39ncvvHsB
         ijoWvjcG9t5xh4oTp91ah4itIpcc1VM/xbQo8aBAKXf3Mm1T5zdoulu09ygFNhUTNtsn
         EcU/ots54N+7t+7U+5fWYG8zgWGS3B7KWmnnxTMbCIaK6312eJca0ZOQD5fG8euFUcoH
         buJQqV5/DZdTJ5JSSBXPVhXDPoDmXikfhsexnmJHS06wFogrN/102MKoo8VQAodCS8rx
         TrWuNtQMsB0lNhW0zsvjxC/7pNPlIb3Uc1VrW9I1xfBemeZ0007ZezbE4MMbO+5aE8Er
         CcoA==
X-Forwarded-Encrypted: i=1; AJvYcCWJxy/eR2nUsqLlphAJinqu7qxTbFeMuX3U4iU9xRodGAwx21+Ehs7snW/d1MJii3FPZnkoMNN/ZR0=@vger.kernel.org, AJvYcCWzdbrzQs3DgBv92rK1tjlhBIaTOyUVPV0SC9UiI3FoIQv4gzpeO6+eQHAPrIkppCh1PmD2v71X563s8A9F@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo5OSOPkEbQG8lIr66LPmkHclD9LpsY8J3VlldxO7/RHrXGK9G
	fE1OYG7EW81RQMmtIEw8j9St1mU9NbYY1ZLxeffYfTTM+UiyzyAp
X-Google-Smtp-Source: AGHT+IEjktlb7t+M19/RjoKUQZJoAvZfPZ5ttJRcYn6zBGsqkiOPb1LXIsCLUiPkaltBF4/BMPKyBQ==
X-Received: by 2002:a05:6512:2201:b0:52f:1a0:b49 with SMTP id 2adb3069b0e04-539da4e2d8bmr8251836e87.31.1729080820891;
        Wed, 16 Oct 2024 05:13:40 -0700 (PDT)
Received: from [192.168.1.17] (host-80-104-113-188.retail.telecomitalia.it. [80.104.113.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a29718b84sm177712966b.29.2024.10.16.05.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 05:13:40 -0700 (PDT)
Message-ID: <eb1a0381-05c3-4ef8-b6de-96824d587a7d@gmail.com>
Date: Wed, 16 Oct 2024 14:13:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v8,09/12] drm/msm/a6xx: Add traces for preemption
To: Kees Bakker <kees@ijzerbout.nl>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20241003-preemption-a750-t-v8-9-5c6cb9f256e0@gmail.com>
 <1b9afb20-d608-464c-ae6b-c535564b7e5a@ijzerbout.nl>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <1b9afb20-d608-464c-ae6b-c535564b7e5a@ijzerbout.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/8/24 11:10 PM, Kees Bakker wrote:
> Op 03-10-2024 om 18:12 schreef Antonino Maniscalco:
>> Add trace points corresponding to preemption being triggered and being
>> completed for latency measurement purposes.
>>
>> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> Tested-by: Rob Clark <robdclark@gmail.com>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  6 ++++++
>>   drivers/gpu/drm/msm/msm_gpu_trace.h       | 28 +++++++++++++++++++++ 
>> +++++++
>>   2 files changed, 34 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/ 
>> drm/msm/adreno/a6xx_preempt.c
>> index 
>> 21e333cb6342d33425eb96f97bcc853e9b041b36..6803d5af60cc8fb0f2a52ee160ffdbf0e8ef0209 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> @@ -7,6 +7,7 @@
>>   #include "a6xx_gpu.h"
>>   #include "a6xx_gmu.xml.h"
>>   #include "msm_mmu.h"
>> +#include "msm_gpu_trace.h"
>>   /*
>>    * Try to transition the preemption state from old to new. Return
>> @@ -174,6 +175,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
>>       set_preempt_state(a6xx_gpu, PREEMPT_NONE);
>> +    trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
>> +
>>       /*
>>        * Retrigger preemption to avoid a deadlock that might occur 
>> when preemption
>>        * is skipped due to it being already in flight when requested.
>> @@ -294,6 +297,9 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>>        */
>>       ring->restore_wptr = false;
>> +    trace_msm_gpu_preemption_trigger(a6xx_gpu->cur_ring->id,
>> +        ring ? ring->id : -1);
>> +
> There is no need for the ternary operator. "ring" should be non-NULL, 
> otherwise the code would have already crashed.
> So the change can just be
>      trace_msm_gpu_preemption_trigger(a6xx_gpu->cur_ring->id, ring->id);

You are right, we had a similar cleanup but I missed this particular 
one, thanks for pointing me at it! I apologize for the late response but 
I've been at XDC and therefore unable to look at my email. I will point 
this out to Rob since this series is in msm-next to see if I need to 
send a separate patch to clean this.

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>

