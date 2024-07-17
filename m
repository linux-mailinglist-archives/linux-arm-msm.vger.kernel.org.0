Return-Path: <linux-arm-msm+bounces-26501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0881D9341B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 19:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E763B217B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 17:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD56181D07;
	Wed, 17 Jul 2024 17:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xm953eiS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03640184F;
	Wed, 17 Jul 2024 17:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721238775; cv=none; b=rbQ5exIIY9H7UidOZsU+foqBn7pjZr+Ivk/+l2cJd5tF+15C3/LSPWdlJtxxU/6Wknw1ormTmTypeeV9z0VKjYQEgYrbAaHyNcxt6nbHHdTcpwgBHUQNDUIjZIbVvwGcGtSpZ2qU8cUTcyeoG70TzyZt3u4aISG2EHK3+/c2hBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721238775; c=relaxed/simple;
	bh=CayRGi98j8/HJ1YInm5wHwDRqWWZwKfZCegvXkW3Dg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DOHG2m20zFBhDDTuQeRgzR+CvcGGBr+nmOL25mZqGGLdxXbVHEY2fJJF2bvrbSUcle04KRtmlVkdPwx6muiurUq+WAGqDdpK1U+ln4q1ciHk1cZgA83GgbZAtJOuS6M7tfiiul/kKNVPEienVJ95XaqhHvMx9bIAeC5yQTT+m04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xm953eiS; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70b0d0fefe3so4706231b3a.2;
        Wed, 17 Jul 2024 10:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721238773; x=1721843573; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rna1ycVmGq1fLlGbs8yKWKJ2/BIlmM0qUkUIHG8aceI=;
        b=Xm953eiSSRAct4IfSQSYLAD/78NWEJ/PzNTkfcnPC1WwEYOJqfJZwTJtv+y+kMkO3H
         v5Unw5Z/lj6B4BbTTBSnbvbxniTDvrkYU0jhlLh9T7HQj54EdbSF/r1yA5G+lyRNzwT1
         /j2BUxwUd32lrO6+fAYhQEISKNFiayqgDDvXBoMven946nM5V9ib46DoMc7apoTGW/2M
         h5SjzN6ml+bNqlQVGTOL/JTZuSeQJGxIxYy+Hl3WxeA2R/rZJJGUe5TQs2c9eNqGc3iC
         XdbQjCWBHpH1xmRYjbJgPelZxNiqr8pt4F/mO6f5TceGWoiMcSyT8nTUu1wM63xlv0uj
         hSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721238773; x=1721843573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rna1ycVmGq1fLlGbs8yKWKJ2/BIlmM0qUkUIHG8aceI=;
        b=OX7c4uv0iQksX/FXJ73x7YRkylKUb/oGRtt9xvbo0UwHOvLjkuEsXLQqIB0jHhxnQ3
         lpdrQE5QwZQ9riZjz+BHCQnTcTsnLt5lEDj5OnR5tPx/rJIpGLp57bDOfYFCGAIyLjlG
         jSld9bQaOjxhcG6xjVcz6HY9NOmfjDkNUV38gPUY6vmQLhNKDGf9rJvtlE3kiyXB9JTb
         meMIMAl1WmYeFJO77PaDMj8V+6aBpkjp8ImzKNoHtM0gOhd8thEDjeu6hfpi826RblKX
         uoekpOaB+FM/DbWn5g9kf1evmp17v6u8ViBpDB887Ldf5DYAQ3mlHxsaygrEZ1Uk8SZo
         qbXg==
X-Forwarded-Encrypted: i=1; AJvYcCVue8DonhfM79E6ZHN1P8+wEL2UOo1pzdQwnqgXBhYPNqu8nTahgRbE/oOuXNcEMaMt2GT1Rt4fBJS3FIDFHioQjDhw7zU2Mp67EvKvZKqLVrQRKjtJ05ddjbFU3jRKSpe3Fwq/4g/I9yHPpA==
X-Gm-Message-State: AOJu0Yx2JVbloQGGSpFUR22f3C3hpMyCzA1YgRpVSSp8MM72IcPEjMF3
	F+z+Xwvn4l04Qss1CyZCGjhvx8FOPOsSJNyz+Yh8ditGsRhA2hK1IfT/OqomxUkk5e7mIeoa2cK
	SCfuF1tQTbfOypPgskS8btMi60Cw=
X-Google-Smtp-Source: AGHT+IGf2woxKzbXZ1jb3lLtB+1KozyeXPrGVuFDolnHnJC8V1hfI9Od69EnykI1/InG8n6/gtTJXrmZR7c6vNRvqsk=
X-Received: by 2002:a05:6a20:729a:b0:1c2:8cf4:766c with SMTP id
 adf61e73a8af0-1c3fdcafebcmr3235744637.33.1721238773094; Wed, 17 Jul 2024
 10:52:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240711100038.268803-1-vladimir.lypak@gmail.com>
 <CACu1E7HROtx1Zgyy0EJuHj_HWE8Nd6OtFnxTcrDrHP+2HA5o6A@mail.gmail.com> <Zpfx_xnRmwoMkSFw@trashcan>
In-Reply-To: <Zpfx_xnRmwoMkSFw@trashcan>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 17 Jul 2024 18:52:41 +0100
Message-ID: <CACu1E7GiEDF_uspowmAQKNiBqLX4RZjP6obL2YLOFA9-ctroRQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] fixes for Adreno A5Xx preemption
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jordan Crouse <jordan@cosmicpenguin.net>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 5:33=E2=80=AFPM Vladimir Lypak <vladimir.lypak@gmai=
l.com> wrote:
>
> On Wed, Jul 17, 2024 at 10:40:26AM +0100, Connor Abbott wrote:
> > On Thu, Jul 11, 2024 at 11:10=E2=80=AFAM Vladimir Lypak
> > <vladimir.lypak@gmail.com> wrote:
> > >
> > > There are several issues with preemption on Adreno A5XX GPUs which
> > > render system unusable if more than one priority level is used. Those
> > > issues include persistent GPU faults and hangs, full UI lockups with
> > > idling GPU.
> > >
> > > ---
> > > Vladimir Lypak (4):
> > >   drm/msm/a5xx: disable preemption in submits by default
> > >   drm/msm/a5xx: properly clear preemption records on resume
> > >   drm/msm/a5xx: fix races in preemption evaluation stage
> > >   drm/msm/a5xx: workaround early ring-buffer emptiness check
> > >
> > >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c     | 18 ++++++++++----
> > >  drivers/gpu/drm/msm/adreno/a5xx_gpu.h     | 12 ++++++---
> > >  drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 30 ++++++++++++++++++++-=
--
> > >  3 files changed, 47 insertions(+), 13 deletions(-)
> > > ---
> > > base-commit: 523b23f0bee3014a7a752c9bb9f5c54f0eddae88
> > > --
> > > 2.45.2
> > >
> >
> > Hi Vladimir,
>
> Hi Connor!
>
> >
> > While looking at preemption on a7xx, where the overall logic is pretty
> > much the same, and I've been seeing the same "soft lockups". However
> > even after porting patch 3, it turns out that's not enough because
> > there's a different race. The sequence of events is something like
> > this:
> >
> > 1. Medium-prio app A submits to ring 2.
> > 2. Ring 0 retires its last job and we start a preemption to ring 2.
> > 3. High-prio app B submits to ring 0. It sees the preemption from step
> > 2 ongoing and doesn't write the WTPR register or try to preempt.
> > 4. The preemption finishes and we update WPTR.
> At this point with patch 3 applied it should switch to ring 0 right away
> because of trigger call in the end of a5xx_preempt_irq. Didn't you
> forget it? Downstream has such call too. Even though it makes preemption
> a little more aggressive it doesn't work without it.

Yes, I didn't apply that bit because it didn't seem necessary to fix
the original issue you described and it seemed like just an
optimization to make preemption more aggressive, however it does seem
to fix the issue. I can't verify that the issue you describe (the
retire IRQ arriving before preemption IRQ) is what's actually
happening because adding a tracepoint on retire seems to change the
timing enough so that the lockup doesn't happen, though. So I guess
I'll just have to assume that's what it was.

Given how subtle this is, enough that I missed it, maybe it's worth a
comment and an extra commit.

Also, I forgot to mention that while I was reading this over I found
another (theoretical) race - we could flush a submit in between
calling update_wptr() and set_preempt_state(PREEMPT_NONE) in
a5xx_preempt_irq() and never update wptr. I would fix it by renaming
PREEMPT_ABORT to PREEMPT_FINISH and pulling out the ABORT ->
update_wptr() -> NONE sequence in a5xx_preempt_trigger() into a
separate function that also gets called in a5xx_preempt_irq().

Connor

>
> > 5. App A's submit retires. We try to preempt, but the submit and
> > ring->cur write from step 3 happened on a different CPU and the write
> > hasn't landed yet so we skip it.
>
> I don't think this is possible on modern CPUs. Could it be that retire
> IRQ appeared earlier (while it was switching from 0 to 2) and you are
> looking at msm_gpu_submit_retired trace event which is called from
> retire work later.
>
> >
> > It's a bit tricky because write reordering is involved, but this seems
> > to be what's happening - everything except my speculation about the
> > delayed write to ring->cur being the problem comes straight from a
> > trace of this happening.
> >
> > Rob suggested on IRC that we make retire handling happen on the same
> > workqueue as submissions, so that preempt_trigger is always
> > serialized, which IIUC would also make patch 3 unnecessary. What do
> > you think?
>
> In this patch series i have tried to do least amount of changes so it
> could be easily back-ported. It isn't pretty but it works reliably for
> me. Otherwise it would be fine to just disable preemption like it's done
> on LTS before 5.4 and rework preemption in new kernel releases.
>
> Kind regards,
>
> Vladimir
>
> >
> > Best regards,
> >
> > Connor

