Return-Path: <linux-arm-msm+bounces-27737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A37BE944FBC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 17:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D3101F2530B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 15:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D221B142A;
	Thu,  1 Aug 2024 15:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a1XCUvm6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFDA1B3733;
	Thu,  1 Aug 2024 15:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722527856; cv=none; b=MsFO7ud3LxLJ5TUD0r6i2sgEkmU5m9s/cgVAapTdgoV5cEBHIvMzbdR/IFWuSgH/7OvevxkS/0YjaTFs5kBtfNA8nuCgq1GKGTEapQoVATfegW59aui2CEKnZnZVOBfYDXeP35BLzl7M+kbST2nTo2HmD+nBheKZAYLaZ1FQ9g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722527856; c=relaxed/simple;
	bh=ES3OuqTIvxphKQSEoXjaScX2/ShgKgenzMVD8KxsDvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fGkT40+MyDTvkF7bDFTB0eiCJpt0vTRpNPnb/3wDWIkcUELnKrwwGvRaD4F8S69sliJfIdXpyYzn4GqQh6MFSTtXXU63V9OivldoWllJZngJoGe8uOpXoikBo4WEwzv1Z9/s5aqOT86a4DyfT8uL4UQlq4Ww5KSE5Bzd7HVY/3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a1XCUvm6; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7163489149eso5053554a12.1;
        Thu, 01 Aug 2024 08:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722527854; x=1723132654; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2B7tON8arfSykpERlZXom9AgtP+Guw0ctcqeBOdhY8=;
        b=a1XCUvm6xZT+A5jjxE0P9EIScsMVVvlrDOekFGifI3Ienz8Owmeg4w7A1JjeTCzAY6
         N9E25xFNNkYsuUMTq4YwK9U01A8o7Yo3pHXBDSJy8Eko2mFCOL8sACuIjAgwA00bSYPS
         PMfBP6/XVWRvJRS1Y5Nd2GXhQIhv7z1WTRdJlt5zHYzoMmR4NBR+FRtaAWR4ixha7V21
         YXwufyo43diP6/b0xHamb6Hj2DRgDpLEBzXvSoUHq9n1MLb1SawV09BfLyQALAq6elil
         DrWQdJLWnHkzIk1cNUDrCkEoOjvpWI+pmDec994u6opp+KepLw0w7jGgADvp7jQvQpwE
         r2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722527854; x=1723132654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2B7tON8arfSykpERlZXom9AgtP+Guw0ctcqeBOdhY8=;
        b=eaAg3xmaybQF9GtpbVuXKSipWZ2qO9UBykfbQSKKNUA98vqs6pJID+3hNlLzCYx+oq
         BGVI1GEzSGUyizC1pm+bOpRLkhURo/VVdgJy8pP5K2G4vbEttxyqu4mOI2ytJopUoaNt
         8sTV3X2WaTlIvCuv2JQewz2mbLHEB4BrYKolN6qnpdMwjbh2n1EKrNgLVQSxqxAFXyNo
         XOZkwjXN9ZY2DP+zUTTaredI2kCoG/SrVMt3pHLMYlZtVZw3IXAJHoIgawMsWrVCIJbr
         NBv7/CxKvrNIWFr0pgLbJY0Tfo2a+Ddb1dzF9ytUwZR4XTxwbMR3Ol1nzzbbatEc0d4b
         6Fmg==
X-Forwarded-Encrypted: i=1; AJvYcCUueU6XNeM+CKoEnIbxcwSxiF2vZgGMQZg4CFAeK6jG4Akj/5BwFtRjQa7ZLbeqPGjm+66xOnwDDXx4kj2XJM0ncbPWudSBUjxn32bWpCQ4DoZNDW6hGDRultLTyxtabPDrOQTcakjhB+j8VQ==
X-Gm-Message-State: AOJu0YwXc2g1tIppH/oQOIrUudV3IwEpy4GLGTqj/pM5MBpCztkv+qUq
	mJgM0fNt0J8Pibml5EM7EdaDvshfQ8819EPHopxIgFuMcENCQm25mWhAAxTYv37vCh1xeLx4cdu
	y0r22ZhDxbUxulbPxg1jUsbGNmgQ=
X-Google-Smtp-Source: AGHT+IFS8L0lEo0LTZn+3suL/QglBnkiGXHjt4ybdEgng+l+WUpdECW2Qgxqu7MAYlETSoaKQ3NURgS/Z+uytydyG40=
X-Received: by 2002:a17:90b:4a52:b0:2c9:7f3d:6aea with SMTP id
 98e67ed59e1d1-2cff9559addmr727438a91.32.1722527853952; Thu, 01 Aug 2024
 08:57:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240711100038.268803-1-vladimir.lypak@gmail.com>
 <20240711100038.268803-4-vladimir.lypak@gmail.com> <CACu1E7HkRN7pkBOUeC3G59K5rbsMRj81HvfAocpHuG6XuNbCyQ@mail.gmail.com>
 <Zqt9Cxu7FsSALi4y@trashcan> <CACu1E7GrWj1EiTgov6f_nUkUR3WPWD6zs4H7OPL7Maw3i2-WQg@mail.gmail.com>
 <ZquafkbK67ecsp99@trashcan>
In-Reply-To: <ZquafkbK67ecsp99@trashcan>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 1 Aug 2024 16:57:22 +0100
Message-ID: <CACu1E7G_zS8UY9unKKNVu-1jL+Dy6NsCUG5sg1EzrZw1fhdM6A@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/msm/a5xx: fix races in preemption evaluation stage
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

On Thu, Aug 1, 2024 at 3:26=E2=80=AFPM Vladimir Lypak <vladimir.lypak@gmail=
.com> wrote:
>
> On Thu, Aug 01, 2024 at 01:52:32PM +0100, Connor Abbott wrote:
> > On Thu, Aug 1, 2024 at 1:25=E2=80=AFPM Vladimir Lypak <vladimir.lypak@g=
mail.com> wrote:
> > >
> > > On Mon, Jul 29, 2024 at 06:26:45PM +0100, Connor Abbott wrote:
> > > > On Thu, Jul 11, 2024 at 11:10=E2=80=AFAM Vladimir Lypak
> > > > <vladimir.lypak@gmail.com> wrote:
> > > > >
> > > > > On A5XX GPUs when preemption is used it's invietable to enter a s=
oft
> > > > > lock-up state in which GPU is stuck at empty ring-buffer doing no=
thing.
> > > > > This appears as full UI lockup and not detected as GPU hang (beca=
use
> > > > > it's not). This happens due to not triggering preemption when it =
was
> > > > > needed. Sometimes this state can be recovered by some new submit =
but
> > > > > generally it won't happen because applications are waiting for ol=
d
> > > > > submits to retire.
> > > > >
> > > > > One of the reasons why this happens is a race between a5xx_submit=
 and
> > > > > a5xx_preempt_trigger called from IRQ during submit retire. Former=
 thread
> > > > > updates ring->cur of previously empty and not current ring right =
after
> > > > > latter checks it for emptiness. Then both threads can just exit b=
ecause
> > > > > for first one preempt_state wasn't NONE yet and for second one al=
l rings
> > > > > appeared to be empty.
> > > > >
> > > > > To prevent such situations from happening we need to establish gu=
arantee
> > > > > for preempt_trigger to be called after each submit. To implement =
it this
> > > > > patch adds trigger call at the end of a5xx_preempt_irq to re-chec=
k if we
> > > > > should switch to non-empty or higher priority ring. Also we find =
next
> > > > > ring in new preemption state "EVALUATE". If the thread that updat=
ed some
> > > > > ring with new submit sees this state it should wait until it pass=
es.
> > > > >
> > > > > Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targ=
ets")
> > > > > Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> > > > > ---
> > > > >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  6 +++---
> > > > >  drivers/gpu/drm/msm/adreno/a5xx_gpu.h     | 11 +++++++----
> > > > >  drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 24 +++++++++++++++++=
++----
> > > > >  3 files changed, 30 insertions(+), 11 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/=
drm/msm/adreno/a5xx_gpu.c
> > > > > index 6c80d3003966..266744ee1d5f 100644
> > > > > --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > > > > +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > > > > @@ -110,7 +110,7 @@ static void a5xx_submit_in_rb(struct msm_gpu =
*gpu, struct msm_gem_submit *submit
> > > > >         }
> > > > >
> > > > >         a5xx_flush(gpu, ring, true);
> > > > > -       a5xx_preempt_trigger(gpu);
> > > > > +       a5xx_preempt_trigger(gpu, true);
> > > > >
> > > > >         /* we might not necessarily have a cmd from userspace to
> > > > >          * trigger an event to know that submit has completed, so
> > > > > @@ -240,7 +240,7 @@ static void a5xx_submit(struct msm_gpu *gpu, =
struct msm_gem_submit *submit)
> > > > >         a5xx_flush(gpu, ring, false);
> > > > >
> > > > >         /* Check to see if we need to start preemption */
> > > > > -       a5xx_preempt_trigger(gpu);
> > > > > +       a5xx_preempt_trigger(gpu, true);
> > > > >  }
> > > > >
> > > > >  static const struct adreno_five_hwcg_regs {
> > > > > @@ -1296,7 +1296,7 @@ static irqreturn_t a5xx_irq(struct msm_gpu =
*gpu)
> > > > >                 a5xx_gpmu_err_irq(gpu);
> > > > >
> > > > >         if (status & A5XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS) {
> > > > > -               a5xx_preempt_trigger(gpu);
> > > > > +               a5xx_preempt_trigger(gpu, false);
> > > > >                 msm_gpu_retire(gpu);
> > > > >         }
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h b/drivers/gpu/=
drm/msm/adreno/a5xx_gpu.h
> > > > > index c7187bcc5e90..1120824853d4 100644
> > > > > --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
> > > > > +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
> > > > > @@ -57,10 +57,12 @@ void a5xx_debugfs_init(struct msm_gpu *gpu, s=
truct drm_minor *minor);
> > > > >   * through the process.
> > > > >   *
> > > > >   * PREEMPT_NONE - no preemption in progress.  Next state START.
> > > > > - * PREEMPT_START - The trigger is evaulating if preemption is po=
ssible. Next
> > > > > - * states: TRIGGERED, NONE
> > > > > + * PREEMPT_EVALUATE - The trigger is evaulating if preemption is=
 possible. Next
> > > > > + * states: START, ABORT
> > > > >   * PREEMPT_ABORT - An intermediate state before moving back to N=
ONE. Next
> > > > >   * state: NONE.
> > > > > + * PREEMPT_START - The trigger is preparing for preemption. Next=
 state:
> > > > > + * TRIGGERED
> > > > >   * PREEMPT_TRIGGERED: A preemption has been executed on the hard=
ware. Next
> > > > >   * states: FAULTED, PENDING
> > > > >   * PREEMPT_FAULTED: A preemption timed out (never completed). Th=
is will trigger
> > > > > @@ -71,8 +73,9 @@ void a5xx_debugfs_init(struct msm_gpu *gpu, str=
uct drm_minor *minor);
> > > > >
> > > > >  enum preempt_state {
> > > > >         PREEMPT_NONE =3D 0,
> > > > > -       PREEMPT_START,
> > > > > +       PREEMPT_EVALUATE,
> > > > >         PREEMPT_ABORT,
> > > > > +       PREEMPT_START,
> > > > >         PREEMPT_TRIGGERED,
> > > > >         PREEMPT_FAULTED,
> > > > >         PREEMPT_PENDING,
> > > > > @@ -156,7 +159,7 @@ void a5xx_set_hwcg(struct msm_gpu *gpu, bool =
state);
> > > > >
> > > > >  void a5xx_preempt_init(struct msm_gpu *gpu);
> > > > >  void a5xx_preempt_hw_init(struct msm_gpu *gpu);
> > > > > -void a5xx_preempt_trigger(struct msm_gpu *gpu);
> > > > > +void a5xx_preempt_trigger(struct msm_gpu *gpu, bool new_submit);
> > > > >  void a5xx_preempt_irq(struct msm_gpu *gpu);
> > > > >  void a5xx_preempt_fini(struct msm_gpu *gpu);
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/=
gpu/drm/msm/adreno/a5xx_preempt.c
> > > > > index 67a8ef4adf6b..f8d09a83c5ae 100644
> > > > > --- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> > > > > +++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> > > > > @@ -87,21 +87,33 @@ static void a5xx_preempt_timer(struct timer_l=
ist *t)
> > > > >  }
> > > > >
> > > > >  /* Try to trigger a preemption switch */
> > > > > -void a5xx_preempt_trigger(struct msm_gpu *gpu)
> > > > > +void a5xx_preempt_trigger(struct msm_gpu *gpu, bool new_submit)
> > > > >  {
> > > > >         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > > > >         struct a5xx_gpu *a5xx_gpu =3D to_a5xx_gpu(adreno_gpu);
> > > > >         unsigned long flags;
> > > > >         struct msm_ringbuffer *ring;
> > > > > +       enum preempt_state state;
> > > > >
> > > > >         if (gpu->nr_rings =3D=3D 1)
> > > > >                 return;
> > > > >
> > > > >         /*
> > > > > -        * Try to start preemption by moving from NONE to START. =
If
> > > > > -        * unsuccessful, a preemption is already in flight
> > > > > +        * Try to start preemption by moving from NONE to EVALUAT=
E. If current
> > > > > +        * state is EVALUATE/ABORT we can't just quit because the=
n we can't
> > > > > +        * guarantee that preempt_trigger will be called after ri=
ng is updated
> > > > > +        * by new submit.
> > > > >          */
> > > > > -       if (!try_preempt_state(a5xx_gpu, PREEMPT_NONE, PREEMPT_ST=
ART))
> > > > > +       state =3D atomic_cmpxchg(&a5xx_gpu->preempt_state, PREEMP=
T_NONE,
> > > > > +                              PREEMPT_EVALUATE);
> > > > > +       while (new_submit && (state =3D=3D PREEMPT_EVALUATE ||
> > > > > +                             state =3D=3D PREEMPT_ABORT)) {
> > > >
> > > > This isn't enough because even if new_submit is false then we may
> > > > still need to guarantee that evaluation happens. We've seen a hang =
in
> > > > a scenario like:
> > > >
> > > > 1. A job is submitted and executed on ring 0.
> > > > 2. A job is submitted on ring 2 while ring 0 is still active but
> > > > almost finished.
> > > > 3. The submission thread starts evaluating and sees that ring 0 is =
still busy.
> > > > 4. The job on ring 0 finishes and a CACHE_FLUSH IRQ is raised.
> > > > 5. The IRQ tries to trigger a preemption but the state is still
> > > > PREEMPT_EVALUATE or PREEMPT_ABORT and exits.
> > > > 6. The submission thread finishes update_wptr() and finally sets th=
e
> > > > state to PREEMPT_NONE too late.
> > > >
> > > > Then we never preempt to ring 2 and there's a soft lockup.
> > >
> > > Thanks, i've missed that. It would need to always wait to prevent suc=
h
> > > scenario. The next patch prevented this from happening for me so i ha=
ve
> > > overlooked it.
> > >
> > > Alternatively there is another approach which should perform better: =
to
> > > let evaluation stage run in parallel.
> > >
> > > Also i've tried serializing preemption handling on ordered workqueue =
and
> > > GPU kthread worker. It's a lot simpler but latency from IRQ doesn't l=
ook
> > > good:
> > >
> > >            flush-trigger    SW_IRQ-pending   flush_IRQ-trigger
> > >     uSecs    1    2    3       1    2    3       1    2    3
> > >      0-10 1515   43   65    4423   39   24     647    0    2
> > >     10-20 1484  453  103     446  414  309     399    1    1
> > >     20-40  827 1802  358      19  819  587       2   21    6
> > >     40-60    7 1264  397       1  368  329       0   30   14
> > >     60-80    4  311  115       0  181  178       0   24   12
> > >    80-120    2   36  251       0  250  188       0    9   13
> > >   120-160    0    4  244       0  176  248       0  226  150
> > >   160-200    0    1  278       0  221  235       0   86   78
> > >   200-400    0    2 1266       0 1318 1186       0  476  688
> > >   400-700    0    0  553       0  745 1028       0  150  106
> > >  700-1000    0    0  121       0  264  366       0   65   28
> > > 1000-1500    0    0   61       0  160  205       0   21    8
> > >     >2000    0    0   12       0   71   48       0    0    0
> > >
> > > 1 - current implementation but with evaluation in parallel.
> > > 2 - serialized on ordered workqueue.
> > > 3 - serialized on GPU kthread_worker.
> >
> > The problem with evaluating in parallel is that evaluating can race
> > with the rest of the process - it's possible for the thread evaluating
> > to go to be interrupted just before moving the state to PREEMPT_START
> > and in the meantime an entire preemption has happened and it's out of
> > date.
>
> Right. This gets complicated to fix for sure.
>
> >
> > What we did was to put a spinlock around the entire evaluation stage,
> > effectively replacing the busy loop and the EVALUATE stage. It unlocks
> > only after moving the state to NONE or knowing for certain that we're
> > starting a preemption. That should be lower latency than a workqueue
> > while the critical section shouldn't be that large (it's one atomic
> > operation and checking each ring), and in any case that's what the
> > spinning loop was doing anyway.
>
> Actually this is what i've done initially but i didn't want to introduce
> another spinlock.
>
> Another thing to consider is: to disable IRQs for entire trigger routine
> and use regular spin_lock instead so once it's decided to do a switch
> it won't get interrupted (when called from submit).

Isn't disabling IRQs and a regular spinlock the same as
spin_lock_irqsave()? We just used the latter, and it seems to work.
The pseudocode is something like:

spin_lock_irqsave();
if (!try_preempt_state(NONE, START)) { unlock(); return; }
if (!evaluate()) {
    set_preempt_state(ABORT);
    update_wptr();
    set_preempt_state(NONE);
    unlock();
    return;
}
unlock();
... // trigger the preemption

If the point is to have interrupts disabled for the entire time,
that's not necessary - once you unlock the state will be START and any
IRQ calling preempt_trigger() will immediately exit.

As for introducing another spinlock, this is no different than what
you're doing already with the spin loop. It's already basically a
(simple) spinlock. We're just replacing this with a real spinlock
that's simpler to reason about. However, if the spinlock is somehow
measurably slower than manually spinning, you can always keep it how
it is now with the EVALUATE state and manually add the irq
save/restore to make it safe to spin in the submit thread.

Connor

>
> Vladimir
>
> >
> > Connor
> >
> > >
> > > Vladimir
> > >
> > > >
> > > > Connor
> > > >
> > > > > +               cpu_relax();
> > > > > +               state =3D atomic_cmpxchg(&a5xx_gpu->preempt_state=
, PREEMPT_NONE,
> > > > > +                                      PREEMPT_EVALUATE);
> > > > > +       }
> > > > > +
> > > > > +       if (state !=3D PREEMPT_NONE)
> > > > >                 return;
> > > > >
> > > > >         /* Get the next ring to preempt to */
> > > > > @@ -130,6 +142,8 @@ void a5xx_preempt_trigger(struct msm_gpu *gpu=
)
> > > > >                 return;
> > > > >         }
> > > > >
> > > > > +       set_preempt_state(a5xx_gpu, PREEMPT_START);
> > > > > +
> > > > >         /* Make sure the wptr doesn't update while we're in motio=
n */
> > > > >         spin_lock_irqsave(&ring->preempt_lock, flags);
> > > > >         a5xx_gpu->preempt[ring->id]->wptr =3D get_wptr(ring);
> > > > > @@ -188,6 +202,8 @@ void a5xx_preempt_irq(struct msm_gpu *gpu)
> > > > >         update_wptr(gpu, a5xx_gpu->cur_ring);
> > > > >
> > > > >         set_preempt_state(a5xx_gpu, PREEMPT_NONE);
> > > > > +
> > > > > +       a5xx_preempt_trigger(gpu, false);
> > > > >  }
> > > > >
> > > > >  void a5xx_preempt_hw_init(struct msm_gpu *gpu)
> > > > > --
> > > > > 2.45.2
> > > > >

