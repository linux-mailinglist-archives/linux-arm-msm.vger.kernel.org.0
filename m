Return-Path: <linux-arm-msm+bounces-31956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6BE97BB7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 13:20:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52904282DF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 11:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C6D176248;
	Wed, 18 Sep 2024 11:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSsRzUDZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDE4291E;
	Wed, 18 Sep 2024 11:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726658417; cv=none; b=q92RJ+1oY3iqgcWHmZhSyxrpUGms5RIdqfRazBYueW+3ii+bzTSwOc3Ec2zdaDWZ1h6m2DCgJ6VxVDP1OtuatGWTbpc4IMGNAmteYBT0QP9xsEVjVq78k57ld8JOy44mq47TBmBsSOO/+hFzvvnjf5U2Yv/jTjGq6dP53ahFw30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726658417; c=relaxed/simple;
	bh=XiZ6+d8X7LwgUFmSBEdWE0PwprK122/IfjVSoBF/aoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KUyGeGnOBN2v6w9OQF4hiEZVyyDXJz1YUisk1iLaViFft2017W9GRzzusowui1BG2dc5GloBpCfiEX1AamqtPLJTzEaaTzv1ZrgwjXN5TP5JcmK8PZc5fQDGDkDg6GwgA18FWh5qpUsbEUrwiLrQXhdT83J8nQDwRgHLV4FoFlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSsRzUDZ; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c251ba0d1cso8607655a12.3;
        Wed, 18 Sep 2024 04:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726658414; x=1727263214; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJsWJdrG2Kc8YkboHwPy2HHcJI536qKQX7JA14yR9wk=;
        b=bSsRzUDZN+Fx6R/YuFZYkWWLgiBfLZxemxMEDadL1GKq3SPYfIXeH3VOlgTVMLpXag
         2vZTvnj04p2yX9INZ5FB4/srsH1xWWy+8XKmMKzNh0tUa4Z+0bdr4tFFFpoJa8mK5hob
         XPbKxghmQD1d/OkxG/JRKErXRidNIUaR941Cq9ZnPOUc5l08VL+kg7f30dpjqYP0VH0q
         Zo6H56f1d2bwtb2cnUUOYZasjkMGhsxwLBCWtV+LhEtyZw/OWizlTsmIKvb02PjCT50y
         QfZxLrZYAx6Am7Pd7M4kLRfgsg367T/QdEm44LNdqujUykAiPVKq6HeE/rXInRwS/86A
         7P7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726658414; x=1727263214;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yJsWJdrG2Kc8YkboHwPy2HHcJI536qKQX7JA14yR9wk=;
        b=e4BYbldLAyyMZykbKcd60sojhkkqPVNl8AWwsPMRHg6IIdaJ8GG1/o5Xx67M7lHswj
         Hkw04Xw/7mm3vslu44b4CYjdHPH7xC91wxBHGMpmMys5DgkLx0YJl2j5SSfKkn6ZbbeI
         hD323/VIGik8ocu/Cv0F/iW6zMYS5rxNHCe/Wn7egF38PdPOdIjxrQByY4f6HAbie8Pt
         u04mIqMbCoMNQ1OKGMXoDJs5raOORzIX2F/dlK8fYEd18r+79MjsfFaTmIX/M8CJJ2XZ
         ux7LAZs8I+5FM2hzSb1jhWJ2X1jr3L2rNwlNIFGDF3bRt4rS6UDTUexzVaMOa8oh2Pgb
         MmyA==
X-Forwarded-Encrypted: i=1; AJvYcCWxVCh+sm9VTQzjfDZTB5EfJF9mmE9kFr1C3F/Y+DLIdjJJHJV/S675aNd9dYvAr+VdzwsISC56fIYjWDWq@vger.kernel.org, AJvYcCXoh9+pcF/J0/+hMmeZZIfvp+T6D9zNlp8BFPvylyNqG7G0gtXTNLnuWgnztWKnQGESHO41vpMRmts=@vger.kernel.org
X-Gm-Message-State: AOJu0Yybrdcqa8iE2mC5xCdL3LGbvMlK8qLNex4UxFltSq3V8EVFlrBH
	XX2IKJhriaQl8Zg5EqdCb5g5HSUSMp2pbVr9RtkVYtgZoh/G8Emm
X-Google-Smtp-Source: AGHT+IF/8Y7rQzca7C7eeHtlv/vvB8DA92bCfXIe1Qckye3K8XNz1VVfg44bg9L/JO+PBLc3z+8nYA==
X-Received: by 2002:a17:907:d590:b0:a8d:470e:1793 with SMTP id a640c23a62f3a-a902950525emr2056039566b.21.1726658413115;
        Wed, 18 Sep 2024 04:20:13 -0700 (PDT)
Received: from [192.168.1.17] (host-82-59-132-21.retail.telecomitalia.it. [82.59.132.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610968c4sm576863966b.4.2024.09.18.04.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 04:20:12 -0700 (PDT)
Message-ID: <19925e9c-90c4-406f-9160-7f1e8da9352d@gmail.com>
Date: Wed, 18 Sep 2024 13:20:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/11] Preemption support for A7XX
To: neil.armstrong@linaro.org, Rob Clark <robdclark@gmail.com>,
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
 Sharat Masetty <smasetty@codeaurora.org>
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
 <c70392bb-bda1-48c7-824e-23d6f92f54ef@linaro.org>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <c70392bb-bda1-48c7-824e-23d6f92f54ef@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/18/24 9:46 AM, Neil Armstrong wrote:
> Hi,
> 
> On 17/09/2024 13:14, Antonino Maniscalco wrote:
>> This series implements preemption for A7XX targets, which allows the 
>> GPU to
>> switch to an higher priority ring when work is pushed to it, reducing 
>> latency
>> for high priority submissions.
>>
>> This series enables L1 preemption with skip_save_restore which requires
>> the following userspace patches to function:
>>
>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30544
>>
>> A flag is added to `msm_submitqueue_create` to only allow submissions
>> from compatible userspace to be preempted, therefore maintaining
>> compatibility.
>>
>> Preemption is currently only enabled by default on A750, it can be
>> enabled on other targets through the `enable_preemption` module
>> parameter. This is because more testing is required on other targets.
>>
>> For testing on other HW it is sufficient to set that parameter to a
>> value of 1, then using the branch of mesa linked above, `TU_DEBUG=hiprio`
>> allows to run any application as high priority therefore preempting
>> submissions from other applications.
>>
>> The `msm_gpu_preemption_trigger` and `msm_gpu_preemption_irq` traces
>> added in this series can be used to observe preemption's behavior as
>> well as measuring preemption latency.
>>
>> Some commits from this series are based on a previous series to enable
>> preemption on A6XX targets:
>>
>> https://lkml.kernel.org/1520489185-21828-1-git-send-email-smasetty@codeaurora.org
>>
>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>> ---
>> Changes in v4:
>> - Added missing register in pwrup list
>> - Removed and rearrange barriers
>> - Renamed `skip_inline_wptr` to `restore_wptr`
>> - Track ctx seqno per ring
>> - Removed secure preempt context
>> - NOP out postamble to disable it instantly
>> - Only emit pwrup reglist once
>> - Document bv_rptr_addr
>> - Removed unused A6XX_PREEMPT_USER_RECORD_SIZE
>> - Set name on preempt record buffer
>> - Link to v3: 
>> https://lore.kernel.org/r/20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com
>>
>> Changes in v3:
>> - Added documentation about preemption
>> - Use quirks to determine which target supports preemption
>> - Add a module parameter to force disabling or enabling preemption
>> - Clear postamble when profiling
>> - Define A6XX_CP_CONTEXT_SWITCH_CNTL_LEVEL fields in a6xx.xml
>> - Make preemption records MAP_PRIV
>> - Removed user ctx record (NON_PRIV) and patch 2/9 as it's not needed
>>    anymore
>> - Link to v2: 
>> https://lore.kernel.org/r/20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com
>>
>> Changes in v2:
>> - Added preept_record_size for X185 in PATCH 3/7
>> - Added patches to reset perf counters
>> - Dropped unused defines
>> - Dropped unused variable (fixes warning)
>> - Only enable preemption on a750
>> - Reject MSM_SUBMITQUEUE_ALLOW_PREEMPT for unsupported targets
>> - Added Akhil's Reviewed-By tags to patches 1/9,2/9,3/9
>> - Added Neil's Tested-By tags
>> - Added explanation for UAPI changes in commit message
>> - Link to v1: 
>> https://lore.kernel.org/r/20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com
>>
>> ---
>> Antonino Maniscalco (11):
>>        drm/msm: Fix bv_fence being used as bv_rptr
>>        drm/msm/A6XX: Track current_ctx_seqno per ring
>>        drm/msm: Add a `preempt_record_size` field
>>        drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
>>        drm/msm/A6xx: Implement preemption for A7XX targets
>>        drm/msm/A6xx: Sync relevant adreno_pm4.xml changes
>>        drm/msm/A6xx: Use posamble to reset counters on preemption
>>        drm/msm/A6xx: Add traces for preemption
>>        drm/msm/A6XX: Add a flag to allow preemption to submitqueue_create
>>        drm/msm/A6xx: Enable preemption for A750
>>        Documentation: document adreno preemption
>>
>>   Documentation/gpu/msm-preemption.rst               |  98 +++++
>>   drivers/gpu/drm/msm/Makefile                       |   1 +
>>   drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   2 +-
>>   drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   2 +-
>>   drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   2 +-
>>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   6 +-
>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   7 +-
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 325 
>> ++++++++++++++-
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h              | 174 ++++++++
>>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c          | 440 
>> +++++++++++++++++++++
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   9 +-
>>   drivers/gpu/drm/msm/msm_drv.c                      |   4 +
>>   drivers/gpu/drm/msm/msm_gpu.c                      |   2 +-
>>   drivers/gpu/drm/msm/msm_gpu.h                      |  11 -
>>   drivers/gpu/drm/msm/msm_gpu_trace.h                |  28 ++
>>   drivers/gpu/drm/msm/msm_ringbuffer.h               |  18 +
>>   drivers/gpu/drm/msm/msm_submitqueue.c              |   3 +
>>   drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   7 +-
>>   .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  39 +-
>>   include/uapi/drm/msm_drm.h                         |   5 +-
>>   20 files changed, 1117 insertions(+), 66 deletions(-)
>> ---
>> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
>> change-id: 20240815-preemption-a750-t-fcee9a844b39
>>
>> Best regards,
> 
> I've been running vulkan-cts 
> (1.3.7.3-0-gd71a36db16d98313c431829432a136dbda692a08 from Yocto)
> on SM8650-QRD, SM8550-QRD & SM8450-HDK boards with enable_preemption in 
> default value
> and forced to 1, and I've seen no regression so far
> 
> On SM8550, I've seen a few:
> platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg.constprop.0 [msm]] *ERROR* 
> Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 2743 timed out waiting for response
> platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg.constprop.0 [msm]] *ERROR* 
> Unexpected message id 2743 on the response queue
> but it's unrelated to preempt
> 
> and on SM8450:
> platform 3d6a000.gmu: [drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout 
> waiting for GMU OOB set GPU_SET: 0x0
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] 
> *ERROR* 7.3.0.1: hangcheck detected gpu lockup rb 0!
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] 
> *ERROR* 7.3.0.1:     completed fence: 331235
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] 
> *ERROR* 7.3.0.1:     submitted fence: 331236
> adreno 3d00000.gpu: [drm:a6xx_irq [msm]] *ERROR* gpu fault ring 0 fence 
> 50de4 status 00800005 rb 0000/0699 ib1 0000000000000000/0000 ib2 
> 0000000000000000/0000
> msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR* 
> 7.3.0.1: hangcheck recover!
> msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR* 
> 7.3.0.1: offending task: deqp-vk (/usr/lib/vulkan-cts/deqp-vk)
> msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR* 
> 7.3.0.1: hangcheck recover!
> leading to a VK_ERROR_DEVICE_LOST, but again unrelated to preempt support.
> 
> So you can also add:
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
> 
> Thanks,
> Neil

Thanks for testing! Enabling for those targets then.

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


