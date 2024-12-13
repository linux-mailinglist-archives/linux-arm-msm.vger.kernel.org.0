Return-Path: <linux-arm-msm+bounces-42108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCE09F134D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 18:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2C7E1885F8A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 17:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56081E32DD;
	Fri, 13 Dec 2024 17:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHkOMBsi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF071E285A;
	Fri, 13 Dec 2024 17:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734109833; cv=none; b=WIeizhI8708f8U78wsbJquzwqp+z2vT4xBq3sR6CSsJbhR/OBxy/B0xap/QFS93oTby1WJjjqMxnQltuQTI7qDocew9uAySJI5WNTl12VEHkqC+QM+cMceynL9vKj1MH68NeoKNXA6smUt9OKdJu4Zdm6PN/QbNA5WXnUdNJwlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734109833; c=relaxed/simple;
	bh=LhU+HE15BZOS4kXvkV2b36Coine4gm7UOwqTi//1uSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RKtxAnXxaBjF6JlC0CUR8pBZcQaqz+824hdmdGKsu3utvd1ZnAfm1yxotF6I5PztFmX9ba5Rtxb+ZuzvnYj7wD0O/V8UQDfCuqdWTYbUl6efHFGUsvlK0M1zsUXozUg3jrtb0Qxl2Nylg0ek+G6E0xvcGroGbqyHftXoGPf0pY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHkOMBsi; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d3e829ff44so5689389a12.0;
        Fri, 13 Dec 2024 09:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734109830; x=1734714630; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8b5rKCyf1HzYIFWFGSOUWYqDhnXmQIMtX7MQg3NxvIY=;
        b=VHkOMBsia9D50YvXxdNoNmoySWsErhOXY4L83jTfn8bhpNCulNBWa21QRbrbDi7VWy
         KCEH7nHM4GFtNH79YN3nDLy2sqRSgaP9sLjl+4cv53yqfsOTp1O+9iyeILddv7AoFY9y
         duoRDcRVdl6loC0EVW7BFRkpYm8jk+leqetTUrJeMR7k9UcyYVEiy6M0xjjM8BpJBxsY
         5rcis9WMUKfPKRkwUgXSkv42FBKOlpscL6c7EhcHFudAihEeaAYoUIrqljRfCXKH6gwr
         N7mEtzFfBxyD2eadM8WrivEadXxMj2FJquqem4QaXjATrgJl/rdv9VzcE96LWG/zmRPB
         2sfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734109830; x=1734714630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8b5rKCyf1HzYIFWFGSOUWYqDhnXmQIMtX7MQg3NxvIY=;
        b=CbvBgHn+FnEnYn/WrAtE32n5ZSE9CZH/nANJZ8etzPsvRS+uGmQ9XIEFalRnpyM7qF
         kNS74v2WrWuSV0oGJyZnHC6xgXH7jW5j4uoVGt75ckKd36y4I28kM80TrbNe9BVxOnD0
         j6xyEa07gR652GJnUlA6Jtfl38d3GBfTZkx/rtbxWlLgYEdzirN63M6hRputqim5cJj0
         herBApGw2ejnhvQ1odiw8pDuxYicnpWBzgZ4lx5rWv3Ts9DGbL7T5UXA87usLxU2UgDO
         PpsYvr8PyM3H7loXqf6Mv3aWuzLXXVNnmwkrSO8xZmA7ae4Z3pkBpE5bp9psOEMmmmwe
         oODg==
X-Forwarded-Encrypted: i=1; AJvYcCXj30uJhlkqVOgxJFNIIslVGKcOxRpPcSuyQ1wbnT5WPcS79garJIEYHbrUhSr9I9qojEEP7br7TFTx1Y4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTBc5ilCj5MoIFTVnlSK3hxteW1xqu1uO+xsPAJ48ctRmnjYIH
	ODSEtgI0zV7oQ5CV9LZNgZuKcJlL6ggM0mmPEXcPtFS3kGMCaDUT
X-Gm-Gg: ASbGncuv0u9HpJRyW4eeeaOf51D74GLK2DV/lSO/CO4sF+SSYOul8+LmX7hWg2pnHb4
	qslM31pUaUNJp9i63B3EfsJg5HhuGU2Hn6Qw+LNJu+VFUtBACCxfycPf4oYoTU8Kdh9Z/3Pqf/q
	89Fw7WxpiRhOCmAy4h2NLZ5Cl6l3gevMSrcNijd0NZ512RXCox6zl32SQQUCTnID9Mz+jAdpmEX
	iYDfy8rn2wtJ5+mx1WE4IfxNNkxlzKFSCzjAb4GGOJD6DJVpFi1V/qg1uJzycHiqf7hPZKiLBOX
	LLKg7a6j/f0d9UBdLyq0S2/fSaF9RyM=
X-Google-Smtp-Source: AGHT+IGkJL//X+kqU8sabMH0PI5OVgEF+IaVrZQNoMpHg3MVdr5Eugls2cldt1I5ssFMsvT2HFJ7mw==
X-Received: by 2002:a05:6402:2684:b0:5d0:96a:aa90 with SMTP id 4fb4d7f45d1cf-5d63c2edcb2mr3265877a12.17.1734109829557;
        Fri, 13 Dec 2024 09:10:29 -0800 (PST)
Received: from [192.168.1.17] (host-87-6-174-125.retail.telecomitalia.it. [87.6.174.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652f25a39sm5036a12.69.2024.12.13.09.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 09:10:29 -0800 (PST)
Message-ID: <30fadc96-d531-4cde-a717-c5983908ea04@gmail.com>
Date: Fri, 13 Dec 2024 18:10:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm/msm: Add UABI to request perfcntr usage
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 open list <linux-kernel@vger.kernel.org>
References: <20241205165419.54080-1-robdclark@gmail.com>
 <eca60b8e-8a8a-41c4-816a-d084822646f1@quicinc.com>
 <de6cfac6-84a0-4160-b279-c23e10f96872@gmail.com>
 <96e918d7-6e29-4d0a-8e9d-b77232c37ef0@quicinc.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <96e918d7-6e29-4d0a-8e9d-b77232c37ef0@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/13/24 5:50 PM, Akhil P Oommen wrote:
> On 12/12/2024 9:44 PM, Antonino Maniscalco wrote:
>> On 12/12/24 4:58 PM, Akhil P Oommen wrote:
>>> On 12/5/2024 10:24 PM, Rob Clark wrote:
>>>> From: Rob Clark <robdclark@chromium.org>
>>>>
>>>> Performance counter usage falls into two categories:
>>>>
>>>> 1. Local usage, where the counter configuration, start, and end read
>>>>      happen within (locally to) a single SUBMIT.  In this case, there is
>>>>      no dependency on counter configuration or values between submits,
>>>> and
>>>>      in fact counters are normally cleared on context switches, making it
>>>>      impossible to rely on cross-submit state.
>>>>
>>>> 2. Global usage, where a single privilaged daemon/process is sampling
>>>>      counter values across all processes for profiling.
>>>>
>>>> The two categories are mutually exclusive.  While you can have many
>>>> processes making local counter usage, you cannot combine global and
>>>> local usage without the two stepping on each others feet (by changing
>>>> counter configuration).
>>>>
>>>> For global counter usage, there is already a SYSPROF param (since global
>>>> counter usage requires disabling counter clearing on context switch).
>>>> This patch adds a REQ_CNTRS param to request local counter usage.  If
>>>> one or more processes has requested counter usage, then a SYSPROF
>>>> request will fail with -EBUSY.  And if SYSPROF is active, then REQ_CNTRS
>>>> will fail with -EBUSY, maintaining the mutual exclusivity.
>>>>
>>>> This is purely an advisory interface to help coordinate userspace.
>>>> There is no real means of enforcement, but the worst that can happen if
>>>> userspace ignores a REQ_CNTRS failure is that you'll get nonsense
>>>> profiling data.
>>>>
>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>> ---
>>>> kgsl takes a different approach, which involves a lot more UABI for
>>>> assigning counters to different processes.  But I think by taking
>>>> advantage of the fact that mesa (freedreno+turnip) reconfigure the
>>>> counters they need in each SUBMIT, for their respective gl/vk perf-
>>>> counter extensions, we can take this simpler approach.
>>>
>>> KGSL's approach is preemption and ifpc safe (also whatever HW changes
>>> that will come up in future generations). How will we ensure that here?
>>>
>>> I have plans to bring up IFPC support in near future. Also, I brought up
>>> this point during preemption series. But from the responses, I felt that
>>> profiling was not considered a serious usecase. Still I wonder how the
>>> perfcounter extensions work accurately with preemption.
>>
>> So back then I implemented the postamble IB to clear perf counters and
>> that gets disabled when sysprof (so global usage) is happening. The
>> kernel is oblivious to "Local isage" of profiling but in that case
>> really what we want to do is disable preemption which in my
>> understanding can be done from userspace with a PKT. In my understanding
>> this had us covered for all usecases.
> 
> I think this wasn't mentioned at that time. Which UMD PKT in a6x+ did
> you mean?

Ah, I thought it wasmentioned, sorry.
The packet I was referring to is:
	<doc> Make next dword 1 to disable preemption, 0 to re-enable it. </doc>
	<value name="CP_PREEMPT_DISABLE" value="0x6c" variants="A6XX"/>

BTW you mentioned wanting to look into IFPC. Since I too wanted to look 
into implementing it wonder if you could let me know when you planned on 
working on it.

> 
> -Akhil.
> 
>>
>> So what would you expect instead we should do kernel side to make
>> profiling preemption safe?
>>
>>>
>>> -Akhil
>>>
>>>>
>>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.c |  2 +
>>>>    drivers/gpu/drm/msm/msm_drv.c           |  5 ++-
>>>>    drivers/gpu/drm/msm/msm_gpu.c           |  1 +
>>>>    drivers/gpu/drm/msm/msm_gpu.h           | 29 +++++++++++++-
>>>>    drivers/gpu/drm/msm/msm_submitqueue.c   | 52 ++++++++++++++++++++++++-
>>>>    include/uapi/drm/msm_drm.h              |  1 +
>>>>    6 files changed, 85 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/
>>>> drm/msm/adreno/adreno_gpu.c
>>>> index 31bbf2c83de4..f688e37059b8 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>> @@ -441,6 +441,8 @@ int adreno_set_param(struct msm_gpu *gpu, struct
>>>> msm_file_private *ctx,
>>>>            if (!capable(CAP_SYS_ADMIN))
>>>>                return UERR(EPERM, drm, "invalid permissions");
>>>>            return msm_file_private_set_sysprof(ctx, gpu, value);
>>>> +    case MSM_PARAM_REQ_CNTRS:
>>>> +        return msm_file_private_request_counters(ctx, gpu, value);
>>>>        default:
>>>>            return UERR(EINVAL, drm, "%s: invalid param: %u", gpu-
>>>>> name, param);
>>>>        }
>>>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/
>>>> msm_drv.c
>>>> index 6416d2cb4efc..bf8314ff4a25 100644
>>>> --- a/drivers/gpu/drm/msm/msm_drv.c
>>>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>>>> @@ -377,9 +377,12 @@ static void msm_postclose(struct drm_device
>>>> *dev, struct drm_file *file)
>>>>         * It is not possible to set sysprof param to non-zero if gpu
>>>>         * is not initialized:
>>>>         */
>>>> -    if (priv->gpu)
>>>> +    if (ctx->sysprof)
>>>>            msm_file_private_set_sysprof(ctx, priv->gpu, 0);
>>>>    +    if (ctx->counters_requested)
>>>> +        msm_file_private_request_counters(ctx, priv->gpu, 0);
>>>> +
>>>>        context_close(ctx);
>>>>    }
>>>>    diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/
>>>> msm_gpu.c
>>>> index 82f204f3bb8f..013b59ca3bb1 100644
>>>> --- a/drivers/gpu/drm/msm/msm_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
>>>> @@ -991,6 +991,7 @@ int msm_gpu_init(struct drm_device *drm, struct
>>>> platform_device *pdev,
>>>>        gpu->nr_rings = nr_rings;
>>>>          refcount_set(&gpu->sysprof_active, 1);
>>>> +    refcount_set(&gpu->local_counters_active, 1);
>>>>          return 0;
>>>>    diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/
>>>> msm_gpu.h
>>>> index e25009150579..83c61e523b1b 100644
>>>> --- a/drivers/gpu/drm/msm/msm_gpu.h
>>>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
>>>> @@ -195,12 +195,28 @@ struct msm_gpu {
>>>>        int nr_rings;
>>>>          /**
>>>> -     * sysprof_active:
>>>> +     * @sysprof_active:
>>>>         *
>>>> -     * The count of contexts that have enabled system profiling.
>>>> +     * The count of contexts that have enabled system profiling plus
>>>> one.
>>>> +     *
>>>> +     * Note: refcount_t does not like 0->1 transitions.. we want to
>>>> keep
>>>> +     * the under/overflow checks that refcount_t provides, but allow
>>>> +     * multiple on/off transitions so we track the logical value
>>>> plus one.)
>>>>         */
>>>>        refcount_t sysprof_active;
>>>>    +    /**
>>>> +     * @local_counters_active:
>>>> +     *
>>>> +     * The count of contexts that have requested local (intra-submit)
>>>> +     * performance counter usage plus one.
>>>> +     *
>>>> +     * Note: refcount_t does not like 0->1 transitions.. we want to
>>>> keep
>>>> +     * the under/overflow checks that refcount_t provides, but allow
>>>> +     * multiple on/off transitions so we track the logical value
>>>> plus one.)
>>>> +     */
>>>> +    refcount_t local_counters_active;
>>>> +
>>>>        /**
>>>>         * lock:
>>>>         *
>>>> @@ -383,6 +399,13 @@ struct msm_file_private {
>>>>         */
>>>>        int sysprof;
>>>>    +    /**
>>>> +     * @counters_requested:
>>>> +     *
>>>> +     * Has the context requested local perfcntr usage.
>>>> +     */
>>>> +    bool counters_requested;
>>>> +
>>>>        /**
>>>>         * comm: Overridden task comm, see MSM_PARAM_COMM
>>>>         *
>>>> @@ -626,6 +649,8 @@ void msm_submitqueue_destroy(struct kref *kref);
>>>>      int msm_file_private_set_sysprof(struct msm_file_private *ctx,
>>>>                     struct msm_gpu *gpu, int sysprof);
>>>> +int msm_file_private_request_counters(struct msm_file_private *ctx,
>>>> +                      struct msm_gpu *gpu, int reqcntrs);
>>>>    void __msm_file_private_destroy(struct kref *kref);
>>>>      static inline void msm_file_private_put(struct msm_file_private
>>>> *ctx)
>>>> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/
>>>> msm/msm_submitqueue.c
>>>> index 7fed1de63b5d..1e1e21e6f7ae 100644
>>>> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
>>>> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
>>>> @@ -10,6 +10,15 @@
>>>>    int msm_file_private_set_sysprof(struct msm_file_private *ctx,
>>>>                     struct msm_gpu *gpu, int sysprof)
>>>>    {
>>>> +    int ret = 0;
>>>> +
>>>> +    mutex_lock(&gpu->lock);
>>>> +
>>>> +    if (sysprof && (refcount_read(&gpu->local_counters_active) > 1)) {
>>>> +        ret = UERR(EBUSY, gpu->dev, "Local counter usage active");
>>>> +        goto out_unlock;
>>>> +    }
>>>> +
>>>>        /*
>>>>         * Since pm_runtime and sysprof_active are both refcounts, we
>>>>         * call apply the new value first, and then unwind the previous
>>>> @@ -18,7 +27,8 @@ int msm_file_private_set_sysprof(struct
>>>> msm_file_private *ctx,
>>>>          switch (sysprof) {
>>>>        default:
>>>> -        return UERR(EINVAL, gpu->dev, "Invalid sysprof: %d", sysprof);
>>>> +        ret = UERR(EINVAL, gpu->dev, "Invalid sysprof: %d", sysprof);
>>>> +        goto out_unlock;
>>>>        case 2:
>>>>            pm_runtime_get_sync(&gpu->pdev->dev);
>>>>            fallthrough;
>>>> @@ -43,7 +53,45 @@ int msm_file_private_set_sysprof(struct
>>>> msm_file_private *ctx,
>>>>          ctx->sysprof = sysprof;
>>>>    -    return 0;
>>>> +out_unlock:
>>>> +    mutex_unlock(&gpu->lock);
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +int msm_file_private_request_counters(struct msm_file_private *ctx,
>>>> +                      struct msm_gpu *gpu, int reqctrs)
>>>> +{
>>>> +    int ret = 0;
>>>> +
>>>> +    mutex_lock(&gpu->lock);
>>>> +
>>>> +    if (reqctrs && (refcount_read(&gpu->sysprof_active) > 1)) {
>>>> +        ret = UERR(EBUSY, gpu->dev, "System profiling active");
>>>> +        goto out_unlock;
>>>> +    }
>>>> +
>>>> +    if (reqctrs) {
>>>> +        if (ctx->counters_requested) {
>>>> +            ret = UERR(EINVAL, gpu->dev, "Already requested");
>>>> +            goto out_unlock;
>>>> +        }
>>>> +
>>>> +        ctx->counters_requested = true;
>>>> +        refcount_inc(&gpu->local_counters_active);
>>>> +    } else {
>>>> +        if (!ctx->counters_requested) {
>>>> +            ret = UERR(EINVAL, gpu->dev, "Not requested");
>>>> +            goto out_unlock;
>>>> +        }
>>>> +        refcount_dec(&gpu->local_counters_active);
>>>> +        ctx->counters_requested = false;
>>>> +    }
>>>> +
>>>> +out_unlock:
>>>> +    mutex_unlock(&gpu->lock);
>>>> +
>>>> +    return ret;
>>>>    }
>>>>      void __msm_file_private_destroy(struct kref *kref)
>>>> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
>>>> index 2342cb90857e..ae7fb355e4a1 100644
>>>> --- a/include/uapi/drm/msm_drm.h
>>>> +++ b/include/uapi/drm/msm_drm.h
>>>> @@ -91,6 +91,7 @@ struct drm_msm_timespec {
>>>>    #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
>>>>    #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
>>>>    #define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
>>>> +#define MSM_PARAM_REQ_CNTRS  0x15 /* WO: request "local" (intra-
>>>> submit) perfcntr usage  */
>>>>      /* For backwards compat.  The original support for preemption was
>>>> based on
>>>>     * a single ring per priority level so # of priority levels equals
>>>> the #
>>>
>>
>>
>> Best regards,
> 


Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>

