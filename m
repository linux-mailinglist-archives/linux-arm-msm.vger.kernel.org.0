Return-Path: <linux-arm-msm+bounces-31349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B57E1971D8C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 17:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3A311C223CA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 15:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1101A716;
	Mon,  9 Sep 2024 15:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byGg9ZYQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E881B27D;
	Mon,  9 Sep 2024 15:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725894538; cv=none; b=ZBJ/6GafjA9vh8Vvy5o3g7WccWRW6KzmM4vBBNzEZXu1LxIrb3Dh+0Jhvx8onOOypyXL62Bd5wpaumspvRibjNmVAX0Z1OJoK86ka+4v6wFKk+VY1DFRwe4H5Khp1dJ6FDPmDvlVjPkIaow4E9vVV07ubBYk7p8eW7ISIx90NtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725894538; c=relaxed/simple;
	bh=59tJEvTdtj/+93adkxu/2EYoGeSantt9k0cFWiu6xOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J7zYQSaWqDuJ0x1YCMfonMox0gHYVx9mp5Awz+JOYs/qHhtqO6S0A+jK4Xy9akCTMdYuLlddOyfERtSElndt2UXbUWR670Y98k1e11phOdpf4ZiWKEMSFN+s4goSL7wm623TqdMZ/0HORlTjWNVb4ndzIbH6yLMbhBMutAAUYDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=byGg9ZYQ; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f75de9a503so23665141fa.0;
        Mon, 09 Sep 2024 08:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725894535; x=1726499335; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=erOfIg5fQXx54gTTQlJYEfyRSx79pT0WOxzbWVH3BNM=;
        b=byGg9ZYQRAqaEuGFGenlYlI1YA4XHexNPtbjU5MLPNT3MgEL4KWpJtE7/roA79iGZa
         +dbu6GQuet8xvp5xzFMi/OsVNeZ5ua7uRKONv/U0RUGug457b5nRlR22+9MQ2QzYXQiR
         TeGlOFWWDz7qyQ7hz+YOlg5BZSsJSWli5KTdpIabIFFCWOOH5ZE/jaiJKp8u9PApiGNq
         55LuHgkPyGhyzlCNKd53z5mS5xby+5iRS7tyY6L1XQKlvttLG4KDaxYpnI5KvLpMgHFv
         Ot3//yFjq6Hxd5euFB7b5YoKwGgroUK/Unl7eXEQzDk62UMK71HPZ8rUJC/K+4D4mRkN
         halg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725894535; x=1726499335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=erOfIg5fQXx54gTTQlJYEfyRSx79pT0WOxzbWVH3BNM=;
        b=JZOs+HXgGDF/E2/bTiWSjT/7kpi7e4v7YgkBhiXqCQBGATshVjSgfgJ9KlXYbiU9qz
         mJWZRZhVeBsRLLW2CbYNEinLFoimxbyNhDi9BUbbehFF01NIQjBNPx/ckQ+XTjTpgo5G
         ATa2UyzqgVIIxfHRihnqpC8eTYGAoU7SuJ4gDwWKJdUGAuFLhkTgvt4B9L0uwz21LSQM
         m9ln53KvbzooONHO2WwTypZsIQerL7Jgfw2sd1hH5BmO6NHt+grIG9gogmQqmjGiquIM
         WsQFpjmMSmmCuKOgRh0fNPol0oF7ENG/+M1rOYxC9qabh510HAvYLJLRmdeZMdZ7DfG3
         hqvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpodyfS94FY2x5Mrf7PpMxub/7S4lhyc/inAe9BLzMCLJXZOxYNu1OOt6Wg2Ni+YidoL+UqQAJ+Wms@vger.kernel.org, AJvYcCV/mgKWYq1+bNpTvWm135fo2SyWG7QexF+BJ/45i7jHjU15i5w7SfYeZHxESb4zK7di5E1kHuurFyFoZZn4@vger.kernel.org, AJvYcCW2yTIMJn1f+vVO9o8Ma9sXQCRWkZoaj2UNkiGp/DEtyb78dEaDFr4smc8kgFFV8o9OnhZlXujtKG/0tSXP@vger.kernel.org
X-Gm-Message-State: AOJu0YynLXgWrlrLNz7F9ikkLjRAUv8LBfBy0VjkBnKNmn4ZZ0M7BODF
	A4JZv9LfUHWowu/l8tPuNjQEf2JfFT54EiGAfoUhiu8CHDbi4vIa
X-Google-Smtp-Source: AGHT+IEYRIRAjoJwEF3v61Fg8BoF+Xi79gge+X1kwzAKmORNuEYSRvDi7XfFgjdome3hdviGnZukyg==
X-Received: by 2002:a2e:a202:0:b0:2f6:62a1:25fe with SMTP id 38308e7fff4ca-2f751f2b0d4mr68764151fa.23.1725894534768;
        Mon, 09 Sep 2024 08:08:54 -0700 (PDT)
Received: from [192.168.1.17] (host-95-246-172-178.retail.telecomitalia.it. [95.246.172.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd76fc4sm3135915a12.78.2024.09.09.08.08.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 08:08:54 -0700 (PDT)
Message-ID: <74e8bca6-dc4a-41fb-b7a3-1281ea89ae97@gmail.com>
Date: Mon, 9 Sep 2024 17:08:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] drm/msm/A6xx: Add traces for preemption
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
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
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
 <20240905-preemption-a750-t-v3-7-fd947699f7bc@gmail.com>
 <20240906201101.vccq54s4nmlmgeoz@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <20240906201101.vccq54s4nmlmgeoz@hu-akhilpo-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/6/24 10:11 PM, Akhil P Oommen wrote:
> On Thu, Sep 05, 2024 at 04:51:25PM +0200, Antonino Maniscalco wrote:
>> Add trace points corresponding to preemption being triggered and being
>> completed for latency measurement purposes.
>>
>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  7 +++++++
>>   drivers/gpu/drm/msm/msm_gpu_trace.h       | 28 ++++++++++++++++++++++++++++
>>   2 files changed, 35 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> index ec44f44d925f..ca9d36c107f2 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> @@ -7,6 +7,7 @@
>>   #include "a6xx_gpu.h"
>>   #include "a6xx_gmu.xml.h"
>>   #include "msm_mmu.h"
>> +#include "msm_gpu_trace.h"
>>   
>>   /*
>>    * Try to transition the preemption state from old to new. Return
>> @@ -143,6 +144,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
>>   
>>   	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
>>   
>> +	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
>> +
>>   	/*
>>   	 * Retrigger preemption to avoid a deadlock that might occur when preemption
>>   	 * is skipped due to it being already in flight when requested.
>> @@ -264,6 +267,10 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>>   	 */
>>   	ring->skip_inline_wptr = false;
>>   
>> +	trace_msm_gpu_preemption_trigger(
>> +		a6xx_gpu->cur_ring ? a6xx_gpu->cur_ring->id : -1,
> 
> Can't we avoid this check?
>
Sorry yeah you had requested this change but I had forgotten to do it.

> -Akhil.
> 
>> +		ring ? ring->id : -1);
>> +
>>   	spin_unlock_irqrestore(&ring->preempt_lock, flags);
>>   
>>   	gpu_write64(gpu,
>> diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
>> index ac40d857bc45..7f863282db0d 100644
>> --- a/drivers/gpu/drm/msm/msm_gpu_trace.h
>> +++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
>> @@ -177,6 +177,34 @@ TRACE_EVENT(msm_gpu_resume,
>>   		TP_printk("%u", __entry->dummy)
>>   );
>>   
>> +TRACE_EVENT(msm_gpu_preemption_trigger,
>> +		TP_PROTO(int ring_id_from, int ring_id_to),
>> +		TP_ARGS(ring_id_from, ring_id_to),
>> +		TP_STRUCT__entry(
>> +			__field(int, ring_id_from)
>> +			__field(int, ring_id_to)
>> +			),
>> +		TP_fast_assign(
>> +			__entry->ring_id_from = ring_id_from;
>> +			__entry->ring_id_to = ring_id_to;
>> +			),
>> +		TP_printk("preempting %u -> %u",
>> +			  __entry->ring_id_from,
>> +			  __entry->ring_id_to)
>> +);
>> +
>> +TRACE_EVENT(msm_gpu_preemption_irq,
>> +		TP_PROTO(u32 ring_id),
>> +		TP_ARGS(ring_id),
>> +		TP_STRUCT__entry(
>> +			__field(u32, ring_id)
>> +			),
>> +		TP_fast_assign(
>> +			__entry->ring_id = ring_id;
>> +			),
>> +		TP_printk("preempted to %u", __entry->ring_id)
>> +);
>> +
>>   #endif
>>   
>>   #undef TRACE_INCLUDE_PATH
>>
>> -- 
>> 2.46.0
>>

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


