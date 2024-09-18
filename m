Return-Path: <linux-arm-msm+bounces-31965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A4397BEC3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 17:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FDFB1F22829
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 15:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3231BD4E2;
	Wed, 18 Sep 2024 15:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6XM6xnF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29481B9B52;
	Wed, 18 Sep 2024 15:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726673985; cv=none; b=Q5J0X3HmB67eqsUna1Cj3MiMYpwTU3+CqRJE/MtsByW5h9uHgnOiiUEfHxFouAgy1ObBkTqyq8mn+cwsAbb7C4pEwcVT5o7Z9P4dsmIqoFjHUI3Q+weoKfiXHMA845vp0toXSWm53QeLHWUfvNv56HgcS0ylN7IE5au3qnYEvYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726673985; c=relaxed/simple;
	bh=XAFYkYcg7OkcJfPD+u1Phg/RUxpV19K7sbGS1mkXQFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IBZLCPYkzLizu62ONhMrD90q4pJD+fhIr5C61ZgrF/jfI9/DdJnAIXu/6DDqj+gdns8/uFeykQMCfr8zPQYwLB9CUzODqPoTEUmKm/bM6yYWeBPWdWPCKSWGy58fo6RY486aG3Ma2yIDN9si4rATzh7nRJ6WthaZjiik5OQ6m10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M6XM6xnF; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3a0b5973fe0so7606975ab.3;
        Wed, 18 Sep 2024 08:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726673983; x=1727278783; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ejf5WVK3boc68idPhvPov2TvvaCezCWXm41kWPyYIv4=;
        b=M6XM6xnF/rVTWltBxFjWQSQWCU7HbgqgbXbVtvvjjsYCrpBvVC+MYXp8M0NYHWgDAD
         k1glsY6QPmMOfPVETIFCjf8Mh29I7IDSnd+ub3vjMDFzDj2SG4Dpd+NC25uFQk7dVsjp
         eluq9dbouQjzQBPcPiDs+8iPkWxabwumjzoK0CLp163NYaORKRGJNyJYyFEvFDDfjiVl
         oHLa30qc7RwL3m5F9WtLf3rUCurJb8RUYpM2X+izUAgV23oiY0xbLTTIiDcHAvaVnUXc
         9fEl3As3/mDsi9BuC6Kh3GdHAQA7tnhfWt1uNRM6uSuNO/Y20xk5tl1tVrEds5ZdR92f
         1qPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726673983; x=1727278783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ejf5WVK3boc68idPhvPov2TvvaCezCWXm41kWPyYIv4=;
        b=DXFF7y9bPAqtyFIp5AYyc0L+HBZocLxNJ4T22OlK85Hf/Muxu6CM7oExhAi8zyEv2u
         TsxV2IMNfX18GpnbEU2DoAZY+ibg7GlJIUjbk/eZYIijBuR9httLxDTokikdm0IIL+1d
         mdQ1wy0fgVQJ9wdoyNLUCZqvZeZtYr606XnTcLnJ5mA8JBAlgo8DNOgcCv0Hl1FCXYqM
         Nh/Xs6MboNmoiK5kuakHI5EOf5owZGFBL9TkjPcskfhJf9ex16Dm9N0ige+PBeCZMDWg
         5RyCpCwoV6PtiHL8YANnIcBV1w8JeIZR0EC5Rpa5FTqw2p/BQlZU0FP37L+AxJ/lG7tg
         cUsw==
X-Forwarded-Encrypted: i=1; AJvYcCUZIgOHxTd/5/9y5FjJrocYby2mdGsiqE2PFN5Nn7muK8DkKdSkuG2vqJlWSSa3UKJMBZgUtw0R/5bz@vger.kernel.org, AJvYcCWf5qdFdSMN7fhvNcxfKxpbXMWRCxFoVYtVyuyZJhaITPgADsHwMzTR5UIwFcdaLY7yfOImyg+phZiG5O5d@vger.kernel.org, AJvYcCXqP5HL43qOwxo1Y35SwvFmcpK8Inc9SbZwN1brJjNBEikeqUCFOjbLeeGCMpFQXmiag3pEexhWeT1Tg1xD@vger.kernel.org
X-Gm-Message-State: AOJu0YzzwMMJAqkQkR05zkR14TDgUWOk0jykS2KyWTROEuhDo9B3UngQ
	MehEgfsa1XyGtxJUMpORXwy760ITOdqCfpLvtz/VkGrLNs/nl/x3z8R9CM2tEyrJy1NCUuByq1I
	XLmbPZfI99Pbr/D8qad7N0W2IYIJJhud5
X-Google-Smtp-Source: AGHT+IFZ5wNRhQRSilBoHe+DSSgRsiYZDnxxl5+4d2d3D7knPWKzH/35DT36NBCfa+Z/ZxfaQpi3YWNLxOCg3QBpQ9c=
X-Received: by 2002:a92:c54d:0:b0:3a0:90d6:1f39 with SMTP id
 e9e14a558f8ab-3a090d6220dmr152064205ab.2.1726673982751; Wed, 18 Sep 2024
 08:39:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com> <c70392bb-bda1-48c7-824e-23d6f92f54ef@linaro.org>
In-Reply-To: <c70392bb-bda1-48c7-824e-23d6f92f54ef@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 18 Sep 2024 08:39:30 -0700
Message-ID: <CAF6AEGso-AZhmOb+V_bc6w5Bw4Yz1fhoPOXbC0uoLXQ7QGnLqQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] Preemption support for A7XX
To: neil.armstrong@linaro.org
Cc: Antonino Maniscalco <antomani103@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Akhil P Oommen <quic_akhilpo@quicinc.com>, Sharat Masetty <smasetty@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2024 at 12:46=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On 17/09/2024 13:14, Antonino Maniscalco wrote:
> > This series implements preemption for A7XX targets, which allows the GP=
U to
> > switch to an higher priority ring when work is pushed to it, reducing l=
atency
> > for high priority submissions.
> >
> > This series enables L1 preemption with skip_save_restore which requires
> > the following userspace patches to function:
> >
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30544
> >
> > A flag is added to `msm_submitqueue_create` to only allow submissions
> > from compatible userspace to be preempted, therefore maintaining
> > compatibility.
> >
> > Preemption is currently only enabled by default on A750, it can be
> > enabled on other targets through the `enable_preemption` module
> > parameter. This is because more testing is required on other targets.
> >
> > For testing on other HW it is sufficient to set that parameter to a
> > value of 1, then using the branch of mesa linked above, `TU_DEBUG=3Dhip=
rio`
> > allows to run any application as high priority therefore preempting
> > submissions from other applications.
> >
> > The `msm_gpu_preemption_trigger` and `msm_gpu_preemption_irq` traces
> > added in this series can be used to observe preemption's behavior as
> > well as measuring preemption latency.
> >
> > Some commits from this series are based on a previous series to enable
> > preemption on A6XX targets:
> >
> > https://lkml.kernel.org/1520489185-21828-1-git-send-email-smasetty@code=
aurora.org
> >
> > Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > ---
> > Changes in v4:
> > - Added missing register in pwrup list
> > - Removed and rearrange barriers
> > - Renamed `skip_inline_wptr` to `restore_wptr`
> > - Track ctx seqno per ring
> > - Removed secure preempt context
> > - NOP out postamble to disable it instantly
> > - Only emit pwrup reglist once
> > - Document bv_rptr_addr
> > - Removed unused A6XX_PREEMPT_USER_RECORD_SIZE
> > - Set name on preempt record buffer
> > - Link to v3: https://lore.kernel.org/r/20240905-preemption-a750-t-v3-0=
-fd947699f7bc@gmail.com
> >
> > Changes in v3:
> > - Added documentation about preemption
> > - Use quirks to determine which target supports preemption
> > - Add a module parameter to force disabling or enabling preemption
> > - Clear postamble when profiling
> > - Define A6XX_CP_CONTEXT_SWITCH_CNTL_LEVEL fields in a6xx.xml
> > - Make preemption records MAP_PRIV
> > - Removed user ctx record (NON_PRIV) and patch 2/9 as it's not needed
> >    anymore
> > - Link to v2: https://lore.kernel.org/r/20240830-preemption-a750-t-v2-0=
-86aeead2cd80@gmail.com
> >
> > Changes in v2:
> > - Added preept_record_size for X185 in PATCH 3/7
> > - Added patches to reset perf counters
> > - Dropped unused defines
> > - Dropped unused variable (fixes warning)
> > - Only enable preemption on a750
> > - Reject MSM_SUBMITQUEUE_ALLOW_PREEMPT for unsupported targets
> > - Added Akhil's Reviewed-By tags to patches 1/9,2/9,3/9
> > - Added Neil's Tested-By tags
> > - Added explanation for UAPI changes in commit message
> > - Link to v1: https://lore.kernel.org/r/20240815-preemption-a750-t-v1-0=
-7bda26c34037@gmail.com
> >
> > ---
> > Antonino Maniscalco (11):
> >        drm/msm: Fix bv_fence being used as bv_rptr
> >        drm/msm/A6XX: Track current_ctx_seqno per ring
> >        drm/msm: Add a `preempt_record_size` field
> >        drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
> >        drm/msm/A6xx: Implement preemption for A7XX targets
> >        drm/msm/A6xx: Sync relevant adreno_pm4.xml changes
> >        drm/msm/A6xx: Use posamble to reset counters on preemption
> >        drm/msm/A6xx: Add traces for preemption
> >        drm/msm/A6XX: Add a flag to allow preemption to submitqueue_crea=
te
> >        drm/msm/A6xx: Enable preemption for A750
> >        Documentation: document adreno preemption
> >
> >   Documentation/gpu/msm-preemption.rst               |  98 +++++
> >   drivers/gpu/drm/msm/Makefile                       |   1 +
> >   drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   2 +-
> >   drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   2 +-
> >   drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   2 +-
> >   drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   6 +-
> >   drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   7 +-
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 325 ++++++++++++=
++-
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu.h              | 174 ++++++++
> >   drivers/gpu/drm/msm/adreno/a6xx_preempt.c          | 440 ++++++++++++=
+++++++++
> >   drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   9 +-
> >   drivers/gpu/drm/msm/msm_drv.c                      |   4 +
> >   drivers/gpu/drm/msm/msm_gpu.c                      |   2 +-
> >   drivers/gpu/drm/msm/msm_gpu.h                      |  11 -
> >   drivers/gpu/drm/msm/msm_gpu_trace.h                |  28 ++
> >   drivers/gpu/drm/msm/msm_ringbuffer.h               |  18 +
> >   drivers/gpu/drm/msm/msm_submitqueue.c              |   3 +
> >   drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   7 +-
> >   .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  39 +-
> >   include/uapi/drm/msm_drm.h                         |   5 +-
> >   20 files changed, 1117 insertions(+), 66 deletions(-)
> > ---
> > base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> > change-id: 20240815-preemption-a750-t-fcee9a844b39
> >
> > Best regards,
>
> I've been running vulkan-cts (1.3.7.3-0-gd71a36db16d98313c431829432a136db=
da692a08 from Yocto)
> on SM8650-QRD, SM8550-QRD & SM8450-HDK boards with enable_preemption in d=
efault value
> and forced to 1, and I've seen no regression so far
>
> On SM8550, I've seen a few:
> platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg.constprop.0 [msm]] *ERROR* M=
essage HFI_H2F_MSG_GX_BW_PERF_VOTE id 2743 timed out waiting for response
> platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg.constprop.0 [msm]] *ERROR* U=
nexpected message id 2743 on the response queue
> but it's unrelated to preempt
>
> and on SM8450:
> platform 3d6a000.gmu: [drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout waitin=
g for GMU OOB set GPU_SET: 0x0
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR*=
 7.3.0.1: hangcheck detected gpu lockup rb 0!
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR*=
 7.3.0.1:     completed fence: 331235
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR*=
 7.3.0.1:     submitted fence: 331236
> adreno 3d00000.gpu: [drm:a6xx_irq [msm]] *ERROR* gpu fault ring 0 fence 5=
0de4 status 00800005 rb 0000/0699 ib1 0000000000000000/0000 ib2 00000000000=
00000/0000
> msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR* 7.=
3.0.1: hangcheck recover!
> msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR* 7.=
3.0.1: offending task: deqp-vk (/usr/lib/vulkan-cts/deqp-vk)
> msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR* 7.=
3.0.1: hangcheck recover!
> leading to a VK_ERROR_DEVICE_LOST, but again unrelated to preempt support=
.

I suspect on newer devices we have trouble resetting the GMU, leading
to (what I assume is happening here) the CPU thinking the GMU is in a
different state than it is.

Which has led to some stability issues on a660 in mesa CI, if anything
crashes the gpu in the CI run it tends to kill the rest of the run
until the board is power cycled.

https://gitlab.freedesktop.org/drm/msm/-/issues/37

I think we have some work to do on making recovery more robust on
things newer than early a6xx things.

BR,
-R

> So you can also add:
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
>
> Thanks,
> Neil

