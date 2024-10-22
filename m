Return-Path: <linux-arm-msm+bounces-35433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9369AB1A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 17:05:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FE3A1F239B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 15:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9BA1A0BD7;
	Tue, 22 Oct 2024 15:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6sQDUuU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B335193409;
	Tue, 22 Oct 2024 15:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729609523; cv=none; b=PWj5Xcpu1cFjGG86jo5kBGcxQ08U1IM4O/vuZfZeOH2Hp0ItKF8hGsGPuI8NwqDCsv409hnedjaAvJQVn4NdO24jVb7lz8SgnwVjGYyAkN2AbXG7m8eKMJmhNuyY9e6j3Rhp8kQVqD3bXb+F3E6RDAhxQVabhwAyLTlrGD3oWuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729609523; c=relaxed/simple;
	bh=wOTE3urdVxTnZWocPLmVxLdQC7deXNGghsbV7zLNqB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EiykysIeqEq/QCoKEk3p8DOx/YHVGYM5iI5XBw+CWjpeQDE5ByH6l28LTVyRrrb5C0Y+rvBI6jxHHS4JW9YC3XRao+kFeNSUbt8JqzWJ/sPW2lAt0attABpHwChW9G7RiZ5kGTiPrkcoM35919zJSREx7zuxqVY8m/Jay89+YJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M6sQDUuU; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-83abdaf8a26so158239739f.1;
        Tue, 22 Oct 2024 08:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729609521; x=1730214321; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9erIofbQNgNITuTZkFVr7yuKagNQmdA7Ka/iRqM44Jo=;
        b=M6sQDUuUn69i/b5+jtjfoto09W6h+oCg1gvxfV12o+Io0Cvy5yBn27PjCr9Krt7SS9
         bsgIEOkKXRS9ggnKw+MiBCNcv0YsJ7BIUoBOwDaYTl7vybGl5Pvutg2U8nBIGK0neBvs
         OZqnsIRx8hjFVHOxcubfGr8dpDsiSm09QM6NNZ6HoSprQc8GtWa4IESCwnw+zix8Au+f
         wjhCCLbZc8dS43GEsHx0fLw0krOjXMglNrrfu+2W4Il+KrBKE6+YV+iCv2GMtbHiP1D8
         k2RAnoiMGm3aANfhDbEA96rgkKIA8Obk7GmeJxEFU4uNaZjrmHn1vDmpN+ZuoBzOg7CX
         eBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729609521; x=1730214321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9erIofbQNgNITuTZkFVr7yuKagNQmdA7Ka/iRqM44Jo=;
        b=POHf7cbW7MBxVaQTpyIs9mzQ9ozC2Xg549XFKecm6+HdDpRsqj/Jz2gT20DIQAfse3
         mXukWc/QEsRZ4eFsa2vtlYto/xIW3tEpmo3Y1lBDyVQasjNr8vMwD2/58hp5i4mvmjna
         M+xkSzM/QSdTfV5f4WT4feSc2DrKREAgkpooH33ypb2/FIOs9QU7PT0A09OqVg7K/izG
         RW13w97cXQ0lK2gk7uYXwFnVHasnY8E6ZMI5exd5zbpt/t5EMq5ajK6373Vd+zL4u75E
         ICyX8lEncRwcXPKDNWXEGl/RnSuWWoQtVwNYMkjzobtOjIZAVb//MwogCUyMWrwEN5tB
         w3pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeg7BamhutMSL1k+m1XMhLamU+I+oSZWOKFN32KVL4QfYKCCHczQDoaEAZr+NpMQEqKmYt+6Uhz6WHY+lz@vger.kernel.org, AJvYcCUiWzRq7SZ8EG+enskkIFXwUfQr9OnFJBpWDEsSx6mdg+sKRxWz5clXOCBWCkSgtO+jvKdS1gX2XEH+@vger.kernel.org, AJvYcCWq2eGlSBBp2Wubc+4ZFwmRy+EKbi8FupmokB769ZmuphmVQ83XSvYj4s8DmzI76J4C36JfHEsIdYdYI9jW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3FKjrc2AASeUd/CZZeEUhVvPTW57akMP5S5tJfP2sie7Myc23
	zOelLJy/FfnSiU8faD2kaCr6dMq4q7jiuuD2a/NXdyYsUk0RFIOhc2AmI6UyEDwjalNYFFYVlk/
	MSEVpGcl2zD9PmA8Y9r/l+7WzvjQ=
X-Google-Smtp-Source: AGHT+IGKSB7rVfZSFbJ3dDLdHLcYQrsyPVJsR5Bhyctlccvw8j8JrxhJQLaYz/vyUN2No/QB9QwmgQO6QQ7kT0wrc7E=
X-Received: by 2002:a05:6e02:1a2a:b0:3a3:b1c4:8198 with SMTP id
 e9e14a558f8ab-3a3f40ab520mr145431315ab.20.1729609520506; Tue, 22 Oct 2024
 08:05:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
 <c70392bb-bda1-48c7-824e-23d6f92f54ef@linaro.org> <CAF6AEGso-AZhmOb+V_bc6w5Bw4Yz1fhoPOXbC0uoLXQ7QGnLqQ@mail.gmail.com>
 <20240920161425.y5ae2y4h64tsfjjx@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240920161425.y5ae2y4h64tsfjjx@hu-akhilpo-hyd.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 22 Oct 2024 08:05:07 -0700
Message-ID: <CAF6AEGvmfKu2cD5r27KL6KRh8E9PJ1AprR4J8OrrSX+-W0OxNQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] Preemption support for A7XX
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: g@hu-akhilpo-hyd.qualcomm.com, neil.armstrong@linaro.org, 
	Antonino Maniscalco <antomani103@gmail.com>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Sharat Masetty <smasetty@codeaurora.org>, Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2024 at 9:15=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On Wed, Sep 18, 2024 at 08:39:30AM -0700, Rob Clark wrote:
> > On Wed, Sep 18, 2024 at 12:46=E2=80=AFAM Neil Armstrong
> > <neil.armstrong@linaro.org> wrote:
> > >
> > > Hi,
> > >
> > > On 17/09/2024 13:14, Antonino Maniscalco wrote:
> > > > This series implements preemption for A7XX targets, which allows th=
e GPU to
> > > > switch to an higher priority ring when work is pushed to it, reduci=
ng latency
> > > > for high priority submissions.
> > > >
> > > > This series enables L1 preemption with skip_save_restore which requ=
ires
> > > > the following userspace patches to function:
> > > >
> > > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30544
> > > >
> > > > A flag is added to `msm_submitqueue_create` to only allow submissio=
ns
> > > > from compatible userspace to be preempted, therefore maintaining
> > > > compatibility.
> > > >
> > > > Preemption is currently only enabled by default on A750, it can be
> > > > enabled on other targets through the `enable_preemption` module
> > > > parameter. This is because more testing is required on other target=
s.
> > > >
> > > > For testing on other HW it is sufficient to set that parameter to a
> > > > value of 1, then using the branch of mesa linked above, `TU_DEBUG=
=3Dhiprio`
> > > > allows to run any application as high priority therefore preempting
> > > > submissions from other applications.
> > > >
> > > > The `msm_gpu_preemption_trigger` and `msm_gpu_preemption_irq` trace=
s
> > > > added in this series can be used to observe preemption's behavior a=
s
> > > > well as measuring preemption latency.
> > > >
> > > > Some commits from this series are based on a previous series to ena=
ble
> > > > preemption on A6XX targets:
> > > >
> > > > https://lkml.kernel.org/1520489185-21828-1-git-send-email-smasetty@=
codeaurora.org
> > > >
> > > > Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > > > ---
> > > > Changes in v4:
> > > > - Added missing register in pwrup list
> > > > - Removed and rearrange barriers
> > > > - Renamed `skip_inline_wptr` to `restore_wptr`
> > > > - Track ctx seqno per ring
> > > > - Removed secure preempt context
> > > > - NOP out postamble to disable it instantly
> > > > - Only emit pwrup reglist once
> > > > - Document bv_rptr_addr
> > > > - Removed unused A6XX_PREEMPT_USER_RECORD_SIZE
> > > > - Set name on preempt record buffer
> > > > - Link to v3: https://lore.kernel.org/r/20240905-preemption-a750-t-=
v3-0-fd947699f7bc@gmail.com
> > > >
> > > > Changes in v3:
> > > > - Added documentation about preemption
> > > > - Use quirks to determine which target supports preemption
> > > > - Add a module parameter to force disabling or enabling preemption
> > > > - Clear postamble when profiling
> > > > - Define A6XX_CP_CONTEXT_SWITCH_CNTL_LEVEL fields in a6xx.xml
> > > > - Make preemption records MAP_PRIV
> > > > - Removed user ctx record (NON_PRIV) and patch 2/9 as it's not need=
ed
> > > >    anymore
> > > > - Link to v2: https://lore.kernel.org/r/20240830-preemption-a750-t-=
v2-0-86aeead2cd80@gmail.com
> > > >
> > > > Changes in v2:
> > > > - Added preept_record_size for X185 in PATCH 3/7
> > > > - Added patches to reset perf counters
> > > > - Dropped unused defines
> > > > - Dropped unused variable (fixes warning)
> > > > - Only enable preemption on a750
> > > > - Reject MSM_SUBMITQUEUE_ALLOW_PREEMPT for unsupported targets
> > > > - Added Akhil's Reviewed-By tags to patches 1/9,2/9,3/9
> > > > - Added Neil's Tested-By tags
> > > > - Added explanation for UAPI changes in commit message
> > > > - Link to v1: https://lore.kernel.org/r/20240815-preemption-a750-t-=
v1-0-7bda26c34037@gmail.com
> > > >
> > > > ---
> > > > Antonino Maniscalco (11):
> > > >        drm/msm: Fix bv_fence being used as bv_rptr
> > > >        drm/msm/A6XX: Track current_ctx_seqno per ring
> > > >        drm/msm: Add a `preempt_record_size` field
> > > >        drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
> > > >        drm/msm/A6xx: Implement preemption for A7XX targets
> > > >        drm/msm/A6xx: Sync relevant adreno_pm4.xml changes
> > > >        drm/msm/A6xx: Use posamble to reset counters on preemption
> > > >        drm/msm/A6xx: Add traces for preemption
> > > >        drm/msm/A6XX: Add a flag to allow preemption to submitqueue_=
create
> > > >        drm/msm/A6xx: Enable preemption for A750
> > > >        Documentation: document adreno preemption
> > > >
> > > >   Documentation/gpu/msm-preemption.rst               |  98 +++++
> > > >   drivers/gpu/drm/msm/Makefile                       |   1 +
> > > >   drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   2 +-
> > > >   drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   2 +-
> > > >   drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   2 +-
> > > >   drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   6 +-
> > > >   drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   7 +-
> > > >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 325 ++++++++=
++++++-
> > > >   drivers/gpu/drm/msm/adreno/a6xx_gpu.h              | 174 ++++++++
> > > >   drivers/gpu/drm/msm/adreno/a6xx_preempt.c          | 440 ++++++++=
+++++++++++++
> > > >   drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   9 +-
> > > >   drivers/gpu/drm/msm/msm_drv.c                      |   4 +
> > > >   drivers/gpu/drm/msm/msm_gpu.c                      |   2 +-
> > > >   drivers/gpu/drm/msm/msm_gpu.h                      |  11 -
> > > >   drivers/gpu/drm/msm/msm_gpu_trace.h                |  28 ++
> > > >   drivers/gpu/drm/msm/msm_ringbuffer.h               |  18 +
> > > >   drivers/gpu/drm/msm/msm_submitqueue.c              |   3 +
> > > >   drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   7 +-
> > > >   .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  39 +-
> > > >   include/uapi/drm/msm_drm.h                         |   5 +-
> > > >   20 files changed, 1117 insertions(+), 66 deletions(-)
> > > > ---
> > > > base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> > > > change-id: 20240815-preemption-a750-t-fcee9a844b39
> > > >
> > > > Best regards,
> > >
> > > I've been running vulkan-cts (1.3.7.3-0-gd71a36db16d98313c431829432a1=
36dbda692a08 from Yocto)
> > > on SM8650-QRD, SM8550-QRD & SM8450-HDK boards with enable_preemption =
in default value
> > > and forced to 1, and I've seen no regression so far
> > >
> > > On SM8550, I've seen a few:
> > > platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg.constprop.0 [msm]] *ERRO=
R* Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 2743 timed out waiting for respon=
se
> > > platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg.constprop.0 [msm]] *ERRO=
R* Unexpected message id 2743 on the response queue
> > > but it's unrelated to preempt
> > >
> > > and on SM8450:
> > > platform 3d6a000.gmu: [drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout wa=
iting for GMU OOB set GPU_SET: 0x0
> > > msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ER=
ROR* 7.3.0.1: hangcheck detected gpu lockup rb 0!
> > > msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ER=
ROR* 7.3.0.1:     completed fence: 331235
> > > msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ER=
ROR* 7.3.0.1:     submitted fence: 331236
> > > adreno 3d00000.gpu: [drm:a6xx_irq [msm]] *ERROR* gpu fault ring 0 fen=
ce 50de4 status 00800005 rb 0000/0699 ib1 0000000000000000/0000 ib2 0000000=
000000000/0000
> > > msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR=
* 7.3.0.1: hangcheck recover!
> > > msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR=
* 7.3.0.1: offending task: deqp-vk (/usr/lib/vulkan-cts/deqp-vk)
> > > msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR=
* 7.3.0.1: hangcheck recover!
> > > leading to a VK_ERROR_DEVICE_LOST, but again unrelated to preempt sup=
port.
> >
> > I suspect on newer devices we have trouble resetting the GMU, leading
> > to (what I assume is happening here) the CPU thinking the GMU is in a
> > different state than it is.
> >
> > Which has led to some stability issues on a660 in mesa CI, if anything
> > crashes the gpu in the CI run it tends to kill the rest of the run
> > until the board is power cycled.
> >
> > https://gitlab.freedesktop.org/drm/msm/-/issues/37
> >
> > I think we have some work to do on making recovery more robust on
> > things newer than early a6xx things.
>
> Is this seen only with a particular scenario or is recovery always
> broken? I fixed recovery on 7c3 (a660 based) a couple of year ago,
> not sure what exactly regressed. At least I didn't see any issue on
> x185.

More recently my x1e (x1-85) and sc8280xp (a690) have been pretty
reliable about recovery.  And mesa CI seems to have gotten more
reliable at recovery when they uprev'd from v6.6x to v6.11.x, so I
guess something in that range improved things?  But maybe not 100%,
kernel-ci (msm/msm_recovery@gpu-fault) can sometimes reproduce this,
apparently:

https://gitlab.freedesktop.org/drm/msm/-/issues/65

This test does 16 submits, with the 10th one having an invalid opc,
and then checks that all the ones before and after successfully
execute a CP_MEM_WRITE:

https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/msm/ms=
m_recovery.c?ref_type=3Dheads#L145

BR,
-R

> -Akhil.
>
> >
> > BR,
> > -R
> >
> > > So you can also add:
> > > Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> > > Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
> > >
> > > Thanks,
> > > Neil

