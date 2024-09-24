Return-Path: <linux-arm-msm+bounces-32289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0EF984540
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 13:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21398B21EF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 11:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A2613A896;
	Tue, 24 Sep 2024 11:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQ/yUuuX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46DF824AD;
	Tue, 24 Sep 2024 11:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727178845; cv=none; b=qH+QkhGNkDbvcd7NbjILrktIE9VoslD+2Jq9BxepwS7cHy3S/E4wdzjSMPZjUPkm73bC/4H+Aq5aOoGZ8UrR1EFJcI9crAUAvLniicU+fPRFWnFuIgyoWRlhoosX5JJrqrIpEQ9oewoFJUVuxlPyiwI12WTad4/rLWg1KEzicUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727178845; c=relaxed/simple;
	bh=tDroJ9icDtC1SRKrZiecho3m3Q++AMQKX2Gw6pFw0ek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RX+4SXiOV32LKb6VHLDOoygfWf76vO2erTQv4LCsfjb9gFKi7Tit48x/sCH9lGN+UnQBoWkgW96Q78anioB2ULuGjfGyhvIJZkTpK2ix+6yt8Vls4+yjNe9zdIv4ctRHjPcN6Kb820Xl/I6xDgWEdecpJF0DAS9nX4U8ZOXWAbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQ/yUuuX; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c42f406e29so7808008a12.2;
        Tue, 24 Sep 2024 04:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727178842; x=1727783642; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dUmP2q9azp9rKVqdDQTloRT+lUgazV00spNcaMp4Gso=;
        b=bQ/yUuuXX6uc5akWu0fKp/+s2yCyNblx6TWj64qLmDr7sh82R1CKTDn2Er34tkVgbd
         gzOYtnBm8LYa0sEmllomSv0BcPwpokeU7t7bA9/q7nw7pYjaJgfNqSr8ic64cduJDqLX
         m4d09IK1F6X++CXKsO1T9hjFyKqDy4lj0J+q7mBSqJOGg2pS6R/ft/12ttk4UtFDXCHd
         JNJL/9lNvsSEKDvciSc+fd40gYy8bfdj8itvM9O37mNAebMix7of8bATecq+vEAJiY3V
         4xqu/7WZT9TtEDUecl3CZ+yQRPv+MZx+OrIycSVoFgznInS+fKeu4jL+5lJQYU0tEc15
         bJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727178842; x=1727783642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dUmP2q9azp9rKVqdDQTloRT+lUgazV00spNcaMp4Gso=;
        b=vXU3KA4mbw01YtNzF9DZ1vXtSo3lY7GgjoVwOpDCeAaKdUiMWLaHmWwOUzAVCIjYpt
         dqBIatWwWuK7gKHigqjiFw+YvVlktejA9gL6TH+4OiERx25iqhy5KRmKrQIS0qmoWbo9
         UnJXg7fKNGplbvcx8AUjNezZK1NU/lF8N66Tdc063xxk6ZKs+zFtxPSdJ/1jyU9FWIav
         54QCqA6RRvnh9Q/Kiz5nnmmgjGRucMMEEaANx2SMlaEzktwOxVgrp0OIcp6gg2iUu45L
         gNIS7RB42Wvj/wa6CfMeqXPDsMZgtPt6DzkK/sahmsR4v54DnF6L/VwXV0yg7f/g2cvs
         Yz8w==
X-Forwarded-Encrypted: i=1; AJvYcCVwLW0yWAEgNBTpvTmTdYkvJNNex0ywr2x9e7YPZ+g8OqpC/nE68nnI9xqHsdD9qabs398XMm3oX4MirNdN@vger.kernel.org, AJvYcCXSPQO/5BGQJzkFqZo/u4NVhia8dAprrKmmBuQhYxMPK4IsV96BAkFB3R1fte1GG0TZ65JxwnZuIprYWn8n@vger.kernel.org, AJvYcCXyW17A/AVAfvgLAS++cpCJ237RJMd1rm6emRWoS3N+0EhiVRg/CT0Wj4r6S7yLdlI8JlbZEJnO7KFl@vger.kernel.org
X-Gm-Message-State: AOJu0YwGNfxE/LrSMF/gbqxPVAjVRxlCquwwRpCrPwPZZvELhD2RUbXd
	d0kMzpmDB+u9BN/FtkHG+Z7NQJCy+WmFfiQ6VpdoXKTFeIqDsuG3
X-Google-Smtp-Source: AGHT+IEDuZeatTHTzXNAP1F05oIalmK+urJ/GHnrONiBuimOJVyNqhjHGZTD/mT+lPcrij2DTICmBg==
X-Received: by 2002:a17:907:d3ce:b0:a8d:60e2:3972 with SMTP id a640c23a62f3a-a90d4ffdd3bmr1350867966b.23.1727178841932;
        Tue, 24 Sep 2024 04:54:01 -0700 (PDT)
Received: from [192.168.1.17] (host-87-7-171-42.retail.telecomitalia.it. [87.7.171.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9392f33ef0sm77162866b.12.2024.09.24.04.54.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 04:54:01 -0700 (PDT)
Message-ID: <29fee642-440a-4b68-909b-a7c391d5a842@gmail.com>
Date: Tue, 24 Sep 2024 13:53:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/11] Preemption support for A7XX
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
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
 Sharat Masetty <smasetty@codeaurora.org>
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
 <c70392bb-bda1-48c7-824e-23d6f92f54ef@linaro.org>
 <20240920170949.vp3642gghhey3pjb@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <20240920170949.vp3642gghhey3pjb@hu-akhilpo-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/24 7:09 PM, Akhil P Oommen wrote:
> On Wed, Sep 18, 2024 at 09:46:33AM +0200, Neil Armstrong wrote:
>> Hi,
>>
>> On 17/09/2024 13:14, Antonino Maniscalco wrote:
>>> This series implements preemption for A7XX targets, which allows the GPU to
>>> switch to an higher priority ring when work is pushed to it, reducing latency
>>> for high priority submissions.
>>>
>>> This series enables L1 preemption with skip_save_restore which requires
>>> the following userspace patches to function:
>>>
>>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30544
>>>
>>> A flag is added to `msm_submitqueue_create` to only allow submissions
>>> from compatible userspace to be preempted, therefore maintaining
>>> compatibility.
>>>
>>> Preemption is currently only enabled by default on A750, it can be
>>> enabled on other targets through the `enable_preemption` module
>>> parameter. This is because more testing is required on other targets.
>>>
>>> For testing on other HW it is sufficient to set that parameter to a
>>> value of 1, then using the branch of mesa linked above, `TU_DEBUG=hiprio`
>>> allows to run any application as high priority therefore preempting
>>> submissions from other applications.
>>>
>>> The `msm_gpu_preemption_trigger` and `msm_gpu_preemption_irq` traces
>>> added in this series can be used to observe preemption's behavior as
>>> well as measuring preemption latency.
>>>
>>> Some commits from this series are based on a previous series to enable
>>> preemption on A6XX targets:
>>>
>>> https://lkml.kernel.org/1520489185-21828-1-git-send-email-smasetty@codeaurora.org
>>>
>>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>>> ---
>>> Changes in v4:
>>> - Added missing register in pwrup list
>>> - Removed and rearrange barriers
>>> - Renamed `skip_inline_wptr` to `restore_wptr`
>>> - Track ctx seqno per ring
>>> - Removed secure preempt context
>>> - NOP out postamble to disable it instantly
>>> - Only emit pwrup reglist once
>>> - Document bv_rptr_addr
>>> - Removed unused A6XX_PREEMPT_USER_RECORD_SIZE
>>> - Set name on preempt record buffer
>>> - Link to v3: https://lore.kernel.org/r/20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com
>>>
>>> Changes in v3:
>>> - Added documentation about preemption
>>> - Use quirks to determine which target supports preemption
>>> - Add a module parameter to force disabling or enabling preemption
>>> - Clear postamble when profiling
>>> - Define A6XX_CP_CONTEXT_SWITCH_CNTL_LEVEL fields in a6xx.xml
>>> - Make preemption records MAP_PRIV
>>> - Removed user ctx record (NON_PRIV) and patch 2/9 as it's not needed
>>>     anymore
>>> - Link to v2: https://lore.kernel.org/r/20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com
>>>
>>> Changes in v2:
>>> - Added preept_record_size for X185 in PATCH 3/7
>>> - Added patches to reset perf counters
>>> - Dropped unused defines
>>> - Dropped unused variable (fixes warning)
>>> - Only enable preemption on a750
>>> - Reject MSM_SUBMITQUEUE_ALLOW_PREEMPT for unsupported targets
>>> - Added Akhil's Reviewed-By tags to patches 1/9,2/9,3/9
>>> - Added Neil's Tested-By tags
>>> - Added explanation for UAPI changes in commit message
>>> - Link to v1: https://lore.kernel.org/r/20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com
>>>
>>> ---
>>> Antonino Maniscalco (11):
>>>         drm/msm: Fix bv_fence being used as bv_rptr
>>>         drm/msm/A6XX: Track current_ctx_seqno per ring
>>>         drm/msm: Add a `preempt_record_size` field
>>>         drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
>>>         drm/msm/A6xx: Implement preemption for A7XX targets
>>>         drm/msm/A6xx: Sync relevant adreno_pm4.xml changes
>>>         drm/msm/A6xx: Use posamble to reset counters on preemption
>>>         drm/msm/A6xx: Add traces for preemption
>>>         drm/msm/A6XX: Add a flag to allow preemption to submitqueue_create
>>>         drm/msm/A6xx: Enable preemption for A750
>>>         Documentation: document adreno preemption
>>>
>>>    Documentation/gpu/msm-preemption.rst               |  98 +++++
>>>    drivers/gpu/drm/msm/Makefile                       |   1 +
>>>    drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   2 +-
>>>    drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   2 +-
>>>    drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   2 +-
>>>    drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   6 +-
>>>    drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   7 +-
>>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 325 ++++++++++++++-
>>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.h              | 174 ++++++++
>>>    drivers/gpu/drm/msm/adreno/a6xx_preempt.c          | 440 +++++++++++++++++++++
>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   9 +-
>>>    drivers/gpu/drm/msm/msm_drv.c                      |   4 +
>>>    drivers/gpu/drm/msm/msm_gpu.c                      |   2 +-
>>>    drivers/gpu/drm/msm/msm_gpu.h                      |  11 -
>>>    drivers/gpu/drm/msm/msm_gpu_trace.h                |  28 ++
>>>    drivers/gpu/drm/msm/msm_ringbuffer.h               |  18 +
>>>    drivers/gpu/drm/msm/msm_submitqueue.c              |   3 +
>>>    drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   7 +-
>>>    .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  39 +-
>>>    include/uapi/drm/msm_drm.h                         |   5 +-
>>>    20 files changed, 1117 insertions(+), 66 deletions(-)
>>> ---
>>> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
>>> change-id: 20240815-preemption-a750-t-fcee9a844b39
>>>
>>> Best regards,
>>
>> I've been running vulkan-cts (1.3.7.3-0-gd71a36db16d98313c431829432a136dbda692a08 from Yocto)
>> on SM8650-QRD, SM8550-QRD & SM8450-HDK boards with enable_preemption in default value
>> and forced to 1, and I've seen no regression so far
>>
>> On SM8550, I've seen a few:
>> platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg.constprop.0 [msm]] *ERROR* Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 2743 timed out waiting for response
>> platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg.constprop.0 [msm]] *ERROR* Unexpected message id 2743 on the response queue
>> but it's unrelated to preempt
>>
>> and on SM8450:
>> platform 3d6a000.gmu: [drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x0
>> msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 7.3.0.1: hangcheck detected gpu lockup rb 0!
>> msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 7.3.0.1:     completed fence: 331235
>> msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 7.3.0.1:     submitted fence: 331236
>> adreno 3d00000.gpu: [drm:a6xx_irq [msm]] *ERROR* gpu fault ring 0 fence 50de4 status 00800005 rb 0000/0699 ib1 0000000000000000/0000 ib2 0000000000000000/0000
>> msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR* 7.3.0.1: hangcheck recover!
>> msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR* 7.3.0.1: offending task: deqp-vk (/usr/lib/vulkan-cts/deqp-vk)
>> msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR* 7.3.0.1: hangcheck recover!
>> leading to a VK_ERROR_DEVICE_LOST, but again unrelated to preempt support.
>>
>> So you can also add:
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
>>
> 
> Niel,
> 
> On my x1e device, all submissions were somehow going into only a single
> ring, even the compositor's. Not sure why. So effectively preemption was
> not really exercised. I had to force one of the two benchmark I ran
> using the "highprio" mesa debug flag force submittions to ring 0.

I think that is because GL applications (so most compositors) run 
through zink which does not forward GL preemption to vulkan so yeah, for 
GL applications the only way of getting preemption is the debug flag.

Unfortunately this is not easy to fix in Zink because it creates one 
VkDevice at screen creation and uses it for all GL contexts. Since GL 
priority is provided per context and at context creation time Zink has 
no way of handling this.

Once TU will support more than one queue it will be possible for Zink to 
create one queue per priority then pick one at context creation time. 
Doing so would require a new vulkan extension for per queue global 
priority. I had started working on this some time ago 
https://gitlab.freedesktop.org/antonino/mesa/-/tree/priority_ext?ref_type=heads
but this solution will only be viable once TU can expose more than one 
queue.

> 
> If possible it is a good idea to check the new preemption traces to
> ensure preemption kicks in.
> 
> -Akhil
> 
>> Thanks,
>> Neil


Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>

