Return-Path: <linux-arm-msm+bounces-31610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5860B976B1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 15:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90740B21B66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 13:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B62693D556;
	Thu, 12 Sep 2024 13:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1wa281v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6E51A4E89;
	Thu, 12 Sep 2024 13:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726148960; cv=none; b=JNAsNzgvySTNZFIkdEn/Dg2rVK5B8zE5ypSPwHgrGNbx50l54uXLkjLtocfWxjIVICjEOTeXEFHyVd+4xT8BQhjiNS2GeZQJw3VZArSNoQr284qtgFvsQBfnDsgNAm3bWO6bxLF6qM+Q7jcy7C4L12MecuHOmQaIAgeu/+kaDis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726148960; c=relaxed/simple;
	bh=Od9UKycpshIbATZhQuQC5iHEP2oUpXFxbIlY9kQ4Z68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=soDl3Si/+ul61QwAXeU90lELtuUS5FIjxn9kX2EezMiSgxxJNQLbr3IemB1JZWKgZoKo1wiBTHJr1xXzi4qEcuDosRcjjnpIqmPprtDDKbBTeCsB5daQr/uydethytPmtPysq7oR+irqAzwgtWCQ2d/AAIN6ITSHzbtd6jm7Wgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1wa281v; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a8a789c4fc5so350658466b.0;
        Thu, 12 Sep 2024 06:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726148957; x=1726753757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a2OjWKLmyq0FeFvsJuG2LPAGav69Q4+sdvymKC2ChyU=;
        b=m1wa281vV8BaSJn1TbmYf/4SUwV6Put3H9zTyUnMYCH9+EvtAeARB/2SKWBw6Pq59J
         4T9GIXeHLlwsRCDxFknbTxg2kgaHm++u0RysQWgOw/W4R7EFUj+h9VMto2wvn34bYSHv
         D0/tW20qp0kq7pUIICxTyV9jZoYWIexXmmYI15uPXWJm0BcqIQa2SrWwTS9dM0foj60Q
         ON5wrmUQXOkq5EiZ/rtUEdv/73w/asQztqVSHSN9h1jgPtArnZldso9PGwhR6fzwvl5o
         dhff4wGgduA3CTxTbU5cb0NSyzQiVO8Zbrh6MwyDswM28cagMNvSR+uO+EqExWI5C9D1
         x1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726148957; x=1726753757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a2OjWKLmyq0FeFvsJuG2LPAGav69Q4+sdvymKC2ChyU=;
        b=C5jurI/zB4pQn7WeibO+QBMDuTWZ3O/yvfmHG0detFLBpYp/tk5R4z9yqGdGfndzqE
         hUE9OhMsNbeIyYIClxm6Bkbr0tpXd3CPuvt/P0dZTsoMqYbgXJk0Eq4mEw1yD0IsbYW/
         IfnZKRNAB2ihV/LzSwRLwRmW7h9v5arBQ+6Rwza//13sD/bIUvCjwVpMLu8ZEDpq5INm
         Q5+s6qx2eEtTHZewCzoFuYCOUWXI/h3oJuwATHwwCMUmg7wmU+O530k2zFIriosinNRM
         AHmVknaGN+wKiN5ieJsIHeOBTehE7cIyJHdxbSJXoUBvBOq+uiTfbxm5ChpkaHoEbBET
         An7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxQt+26U3+F4c1c+fQGTIDYvWWY48IbW2CIk/QwaL6WKrN7UhjraAvpo/vtR5px8OkCdBEzBbidCLAREJW@vger.kernel.org, AJvYcCX0q3R/myxYNLH7iahRSymCspbGOG+tTnnl2K0mb+hM9FnUe7yHg6GizhkJ5CbmxMCMbZ/x1pQjMeU83MlT@vger.kernel.org, AJvYcCXZE3Co0y43MTH1vtk29kuBWj4DjXIcKEvkL3lMvMQuBlg7HP0FI+JdVLxrD5jE2ocks7yyaWQsCOMA@vger.kernel.org
X-Gm-Message-State: AOJu0YzIqOUOeKcAeL+ZOalG5BYKm/cOGF3Pshp7C7m1PL3OstcfXugl
	fcrTrN0F4PeFtvHuoBj1hIe4cS6hMPTB60zfiUNuO/OzR6Y6kFEV
X-Google-Smtp-Source: AGHT+IFgwyMDp/MZic/cfpTexvX05RgAKFVg3x47fitCbcG38c/untHaUT2m9nTNxOkCOe8V0IaNlg==
X-Received: by 2002:a17:907:6d20:b0:a8d:592d:f56 with SMTP id a640c23a62f3a-a8ffae3a29fmr789264166b.31.1726148956571;
        Thu, 12 Sep 2024 06:49:16 -0700 (PDT)
Received: from [192.168.1.17] (host-87-20-168-161.retail.telecomitalia.it. [87.20.168.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25833c90sm749673066b.25.2024.09.12.06.49.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 06:49:16 -0700 (PDT)
Message-ID: <83141e2a-c132-4dc0-ad23-344f745b7010@gmail.com>
Date: Thu, 12 Sep 2024 15:49:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] Preemption support for A7XX
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
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sharat Masetty <smasetty@codeaurora.org>
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
 <20240906195827.at7tgesx55xt6k5o@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <20240906195827.at7tgesx55xt6k5o@hu-akhilpo-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/6/24 9:58 PM, Akhil P Oommen wrote:
> On Thu, Sep 05, 2024 at 04:51:18PM +0200, Antonino Maniscalco wrote:
>> This series implements preemption for A7XX targets, which allows the GPU to
>> switch to an higher priority ring when work is pushed to it, reducing latency
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
> 
> Antonino, can you please test this once with per-process pt disabled to
> ensure that is not broken? It is handy sometimes while debugging.
> We just need to remove "adreno-smmu" compatible string from gpu smmu
> node in DT.
> 

Removing that from the DT causes a crash inside 
`msm_iommu_pagetable_create` as it seems `create_private_address_space` 
is assigned unconditionally in a6xx_gpu.c . I tested it with the 
following change:

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 9e5a83b885f0..4111f5fd9721 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -832,11 +832,11 @@ msm_gpu_create_private_address_space(struct 
msm_gpu *gpu, struct task_struct *ta
          * If the target doesn't support private address spaces then return
          * the global one
          */
-       if (gpu->funcs->create_private_address_space) {
-               aspace = gpu->funcs->create_private_address_space(gpu);
-               if (!IS_ERR(aspace))
-                       aspace->pid = get_pid(task_pid(task));
-       }
+       /* if (gpu->funcs->create_private_address_space) { */
+       /*      aspace = gpu->funcs->create_private_address_space(gpu); */
+       /*      if (!IS_ERR(aspace)) */
+       /*              aspace->pid = get_pid(task_pid(task)); */
+       /* } */

         if (IS_ERR_OR_NULL(aspace))
                 aspace = msm_gem_address_space_get(gpu->aspace);

and it appears to work.

> -Akhil.
> 
>> ---
>> Changes in v3:
>> - Added documentation about preemption
>> - Use quirks to determine which target supports preemption
>> - Add a module parameter to force disabling or enabling preemption
>> - Clear postamble when profiling
>> - Define A6XX_CP_CONTEXT_SWITCH_CNTL_LEVEL fields in a6xx.xml
>> - Make preemption records MAP_PRIV
>> - Removed user ctx record (NON_PRIV) and patch 2/9 as it's not needed
>>    anymore
>> - Link to v2: https://lore.kernel.org/r/20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com
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
>> - Link to v1: https://lore.kernel.org/r/20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com
>>
>> ---
>> Antonino Maniscalco (10):
>>        drm/msm: Fix bv_fence being used as bv_rptr
>>        drm/msm: Add a `preempt_record_size` field
>>        drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
>>        drm/msm/A6xx: Implement preemption for A7XX targets
>>        drm/msm/A6xx: Sync relevant adreno_pm4.xml changes
>>        drm/msm/A6xx: Use posamble to reset counters on preemption
>>        drm/msm/A6xx: Add traces for preemption
>>        drm/msm/A6XX: Add a flag to allow preemption to submitqueue_create
>>        drm/msm/A6xx: Enable preemption for A750
>>        Documentation: document adreno preemption
>>
>>   Documentation/gpu/msm-preemption.rst               |  98 +++++
>>   drivers/gpu/drm/msm/Makefile                       |   1 +
>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   7 +-
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 331 +++++++++++++++-
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h              | 166 ++++++++
>>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c          | 430 +++++++++++++++++++++
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   9 +-
>>   drivers/gpu/drm/msm/msm_drv.c                      |   4 +
>>   drivers/gpu/drm/msm/msm_gpu_trace.h                |  28 ++
>>   drivers/gpu/drm/msm/msm_ringbuffer.h               |   8 +
>>   drivers/gpu/drm/msm/msm_submitqueue.c              |   3 +
>>   drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   7 +-
>>   .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  39 +-
>>   include/uapi/drm/msm_drm.h                         |   5 +-
>>   14 files changed, 1094 insertions(+), 42 deletions(-)
>> ---
>> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
>> change-id: 20240815-preemption-a750-t-fcee9a844b39
>>
>> Best regards,
>> -- 
>> Antonino Maniscalco <antomani103@gmail.com>
>>

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


