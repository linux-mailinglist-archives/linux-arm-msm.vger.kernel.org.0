Return-Path: <linux-arm-msm+bounces-31353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDF4971E26
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 17:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A127D286BFF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 15:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35D438FAD;
	Mon,  9 Sep 2024 15:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RpTLOcrT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18235249E5;
	Mon,  9 Sep 2024 15:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725896211; cv=none; b=NnSRAEezKYh3A4cdjmayikBco5w+GOOOSCie/LRbIH+D+Add1HZVr8rsDyjQKeaERh1Xzr7h7gNNvTKUQ2M28VqJcV/D/F6mOml5S+qW69TRD5qbXdFOzIQJmef/HAltDmE92AlJcbIlKIbjzreDoNTD/oWaa04hqQLhnpL3vhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725896211; c=relaxed/simple;
	bh=zJxRvUxecQPy11oI8H7DmjBMBApto6xd2KSXem8HyC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UKc22eABC6jmNp3vgAXueoRZYrqIlEXDfdlIPlfWKB3pbXqDZVgwGL1jSSO6rit/u+/BS3JYswrED+weO7q0c2RL9H9pW8f7h0wKTSikR07YsT9g2jzkqXVj79KG34D2URZhJ+X9HRW3DGO6Au2f0s9FLAoDyI1zEKoRxqat6oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RpTLOcrT; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-82cf3286261so26153639f.0;
        Mon, 09 Sep 2024 08:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725896209; x=1726501009; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o555don3oiC4LbhNZvudRjyy7/nYs5wSbIdE6tIRHn4=;
        b=RpTLOcrTiEswaibn1/rqh2jqndPN8hwZ6fyaiHUKo4Db++OBLZ90aEdZgabLFe+st/
         sNl9bQ9yqa6RTuPu6RMhYJA/rfq5O1GTuontaibOqTxPwQg5/wl5g3BlmMucdQ7dXWEN
         Pem11JpzJEkyu39gfSiTyjT5vfG4UP6BwcYX3z+rsYsQUO2admjW7JNIl/2U5keDshAY
         pdMJY12mUhVom0A/zrvPFVt4OoO1L4ZXlLjy2bNWXWlbEy6gdJ2hocmP7dNzI+JyuK1Y
         +ad8tPsjtoe6TMa0yAhppNjDDuAs+Lrm4KF/0uI7eGdFmCz1zbay8TGHsYYGq58dF2G4
         QYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725896209; x=1726501009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o555don3oiC4LbhNZvudRjyy7/nYs5wSbIdE6tIRHn4=;
        b=CpeSFbmy5L+0KFEd8ez1GZqKit0y0kvODZq2u77+4TEvqIAAQfXyRDzClcJdD5c1Se
         X4KGPGmtDM/ejDpWgb5j5NHCyAwS0bdw1NsRyPfTz86djSgDbhw7kItaFZags92a0Q8r
         2YgkCt7RC7BrcOYxHj/NyppdjRHR9mbDL8xERvOoX5WF62F0v1WCFF7UB1sw6lbHIvSM
         /fj5mmnmi1dLQ8WDyCGupqpwet4cepu5dOeVFosPb0ec1jnei43oxd0k1wfzbdwFj624
         QYpupcUUJFZw0TkZFPt/Dxypp3fVvD8Lp4RSprUIvX/Q2y2UATT/C+behynT3VW9bSRB
         kcrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU+PCiCVWWdProPx7WIhLtctVLzflvGLui6bJn/u92Sw3j97HrgE1pfnkTHtzaijEvnunAUA3AtxF2YIxe@vger.kernel.org, AJvYcCWuSQ6W6px4RYbHU0iVVAcOgvUS3NvQAKfh0dg8dfaQuR1pV9HiRoenvQIWsRmb4J+Td8rsHYlxHALV@vger.kernel.org, AJvYcCXuRbR9s1gE0P24x7OhYU/wU9oRB+5BKu8xnjFwFrOp8shU6gFY1569SZXJgqy3S8WFmReeEUc5OhhsLhYb@vger.kernel.org
X-Gm-Message-State: AOJu0YyloFLvwUk4RHLh8hX+u1sm4SlLIq7JZEuDWzQ+fOXws44Mi3DJ
	R6O6FhNZG7T01nYvE3p8gcUhDxVXaQ+3nwXYu6AOn2uUyWe0SS7lgUDKlOrBuHl2MG8nS/ThjsJ
	gg5IdgCz9msDNBFZAzrKtXpk5lhM=
X-Google-Smtp-Source: AGHT+IEQ7PpjhL1AvLnf149fn9AnLp54fSBeFsxA3zefzb71fMszaXFL5LDtBaaEqhzCMaDdFSi4xioCPJlDBQzjTA0=
X-Received: by 2002:a05:6e02:17cd:b0:38b:48c9:55d5 with SMTP id
 e9e14a558f8ab-3a04f07e78bmr122325995ab.13.1725896208956; Mon, 09 Sep 2024
 08:36:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com> <20240906195827.at7tgesx55xt6k5o@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240906195827.at7tgesx55xt6k5o@hu-akhilpo-hyd.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 9 Sep 2024 08:36:37 -0700
Message-ID: <CAF6AEGu==X-=HvXfoQycRFtameg8C=u3e+4bUFmnn4s1wJgwVw@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] Preemption support for A7XX
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Antonino Maniscalco <antomani103@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Sharat Masetty <smasetty@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 12:59=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On Thu, Sep 05, 2024 at 04:51:18PM +0200, Antonino Maniscalco wrote:
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
>
> Antonino, can you please test this once with per-process pt disabled to
> ensure that is not broken? It is handy sometimes while debugging.
> We just need to remove "adreno-smmu" compatible string from gpu smmu
> node in DT.

fwiw, I'd be ok supporting preemption on devices that have per-process
pgtables.  (And maybe we should be tainting the kernel if per-process
pgtables are disabled on a6xx+)

BR,
-R

> -Akhil.
>
> > ---
> > Changes in v3:
> > - Added documentation about preemption
> > - Use quirks to determine which target supports preemption
> > - Add a module parameter to force disabling or enabling preemption
> > - Clear postamble when profiling
> > - Define A6XX_CP_CONTEXT_SWITCH_CNTL_LEVEL fields in a6xx.xml
> > - Make preemption records MAP_PRIV
> > - Removed user ctx record (NON_PRIV) and patch 2/9 as it's not needed
> >   anymore
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
> > Antonino Maniscalco (10):
> >       drm/msm: Fix bv_fence being used as bv_rptr
> >       drm/msm: Add a `preempt_record_size` field
> >       drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
> >       drm/msm/A6xx: Implement preemption for A7XX targets
> >       drm/msm/A6xx: Sync relevant adreno_pm4.xml changes
> >       drm/msm/A6xx: Use posamble to reset counters on preemption
> >       drm/msm/A6xx: Add traces for preemption
> >       drm/msm/A6XX: Add a flag to allow preemption to submitqueue_creat=
e
> >       drm/msm/A6xx: Enable preemption for A750
> >       Documentation: document adreno preemption
> >
> >  Documentation/gpu/msm-preemption.rst               |  98 +++++
> >  drivers/gpu/drm/msm/Makefile                       |   1 +
> >  drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   7 +-
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 331 +++++++++++++=
++-
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.h              | 166 ++++++++
> >  drivers/gpu/drm/msm/adreno/a6xx_preempt.c          | 430 +++++++++++++=
++++++++
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   9 +-
> >  drivers/gpu/drm/msm/msm_drv.c                      |   4 +
> >  drivers/gpu/drm/msm/msm_gpu_trace.h                |  28 ++
> >  drivers/gpu/drm/msm/msm_ringbuffer.h               |   8 +
> >  drivers/gpu/drm/msm/msm_submitqueue.c              |   3 +
> >  drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   7 +-
> >  .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  39 +-
> >  include/uapi/drm/msm_drm.h                         |   5 +-
> >  14 files changed, 1094 insertions(+), 42 deletions(-)
> > ---
> > base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> > change-id: 20240815-preemption-a750-t-fcee9a844b39
> >
> > Best regards,
> > --
> > Antonino Maniscalco <antomani103@gmail.com>
> >

