Return-Path: <linux-arm-msm+bounces-27729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA41944BB5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 14:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D7AF1F21107
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 12:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9D918A6B0;
	Thu,  1 Aug 2024 12:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDJZtdEU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7790A158A2C;
	Thu,  1 Aug 2024 12:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722516767; cv=none; b=m/WkZMiECkGM732YXXkGtjk3oxV6ZgaLx5QelCPvKUe7iYuELfnpEPm+dlwHKKbIPFPYVgbCrsooTISCoUEBYYWcxLa/cgmY17YCI+JwQEUDmPsavFQSxaA5WDzyXaZ/WryRnfwijYWAhUldHEW1fRdDmlWj8LO5VOnFzA40rSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722516767; c=relaxed/simple;
	bh=XWlKdGwgG9myFnh6VbNuelxcGc5vxwWp3GNT7j0VwPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jdheAHz5QVnR3auTFIWif+C7MNgFmBWZRZ7NYqquQze7ZuMWiKfP/pbbRNgz+7qv1tOMggE6bJiU4d0WS0rQJhWujkYEQjXeKx7UD0lYDuKPHYWjtOP7jyD8LjPZwcc/ytBPTLQAAXzxEtmMbP4If3Un19e7fHEqn+tqA0EsGA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDJZtdEU; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1fd6ed7688cso56338035ad.3;
        Thu, 01 Aug 2024 05:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722516765; x=1723121565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KV2wXKLNoGNDzhpt//XTFc3UJCna8kjA4fgU7QLFZfA=;
        b=SDJZtdEU4plNAapWlOAxnP2GsS2OKsItz7JNcYPKbW+ckaJ1oQsYzz980PEd8XJ21a
         cxB/PQKv6POr5ug7w3622nWGnjrEVBiMIIoJ8N75hzwIOG8q3fPZVijMnXVrapIzeMfO
         5MLTSXy9twcF7vZAhs5vxma76v7WBNAp4z+od2oQMHwAyJtqXj2OHqOv1OhrxotpZ2dc
         Wj1Hiw3vL7ckIj/JbM0DEhmQNoydcI3jll7M+yc0KufBSC83qtHv9zm+cqIbWtL2FMVK
         +uICt0ArJQahgYt94e+DtfoJ+AflN4rWd23evpocQ3vHO/C0h+MnWpy2jAEiSO8VuAiK
         PuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722516765; x=1723121565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KV2wXKLNoGNDzhpt//XTFc3UJCna8kjA4fgU7QLFZfA=;
        b=mbAKiN9ROgoJNEGSlqnM6qmOm9Z4zrsCJd05lEGBOMTISjUBHuzUbtlj8wol7czDAq
         P9O2SCtIG6vtpQHv1FVrZu+A8oJqC8JhL8UoilY39Yr6tRSIPAsbv5CkGW8WOcaG/eeP
         fwWTd0ztkxfs9gWPOl/EbJZpvT7rUYkTN0WEr2TuEGFwqyaDbiXG5L0zkdJbJ2xDg4AX
         QpP1pzpyH22bJqbmCwj02gY2Hik16km1jAZO7Dy0MtCH9YCr1CwHdyfZs6e5M1CeGMdn
         4zoxyxPcX8vYT3yJMdgaoVAGJVaCzjzMk16/l4VqkMz4qsWYSLjZTL6IRsFL6TEp8wxI
         azPA==
X-Forwarded-Encrypted: i=1; AJvYcCXnUyFMvTYmwl218Y1kd6Mhz/r1laBOXMGiNfqSZE2vCN+6qadD9Fz9Kx3PTkdHy3IP3QvxfLQo1dfsl6gATfGHicedQZl/Lx+Bs6SgAH+i9HsQIeF4qMTJVmu9SP2QHfDEUASdcNId7e9Esw==
X-Gm-Message-State: AOJu0YybSyU0dZLPjFXSHfBzR80z/4yKwqNLcecrwm94kjlXr7OGKNY9
	ZT6bQ5Ysr5dkB1M5EK8RgTtumxsORISfvK06jGeWxrGV8CagXff5G6St0eEnzGw5VK+7O6KDEXj
	zOnE2w1ojEXEbT1afsXApo7sLqzE=
X-Google-Smtp-Source: AGHT+IEfZD6Ihy/J78XyZLj/wVmuCQt+Q6BnVqfYhEtYPzID7/UU8l6cq5g1eypWCSfdUYpzYhfqkIuU1aebrpRVKGA=
X-Received: by 2002:a17:90a:c004:b0:2c9:75c6:32dc with SMTP id
 98e67ed59e1d1-2cff93c8c7cmr72119a91.1.1722516764451; Thu, 01 Aug 2024
 05:52:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240711100038.268803-1-vladimir.lypak@gmail.com>
 <20240711100038.268803-4-vladimir.lypak@gmail.com> <CACu1E7HkRN7pkBOUeC3G59K5rbsMRj81HvfAocpHuG6XuNbCyQ@mail.gmail.com>
 <Zqt9Cxu7FsSALi4y@trashcan>
In-Reply-To: <Zqt9Cxu7FsSALi4y@trashcan>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 1 Aug 2024 13:52:32 +0100
Message-ID: <CACu1E7GrWj1EiTgov6f_nUkUR3WPWD6zs4H7OPL7Maw3i2-WQg@mail.gmail.com>
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

On Thu, Aug 1, 2024 at 1:25=E2=80=AFPM Vladimir Lypak <vladimir.lypak@gmail=
.com> wrote:
>
> On Mon, Jul 29, 2024 at 06:26:45PM +0100, Connor Abbott wrote:
> > On Thu, Jul 11, 2024 at 11:10=E2=80=AFAM Vladimir Lypak
> > <vladimir.lypak@gmail.com> wrote:
> > >
> > > On A5XX GPUs when preemption is used it's invietable to enter a soft
> > > lock-up state in which GPU is stuck at empty ring-buffer doing nothin=
g.
> > > This appears as full UI lockup and not detected as GPU hang (because
> > > it's not). This happens due to not triggering preemption when it was
> > > needed. Sometimes this state can be recovered by some new submit but
> > > generally it won't happen because applications are waiting for old
> > > submits to retire.
> > >
> > > One of the reasons why this happens is a race between a5xx_submit and
> > > a5xx_preempt_trigger called from IRQ during submit retire. Former thr=
ead
> > > updates ring->cur of previously empty and not current ring right afte=
r
> > > latter checks it for emptiness. Then both threads can just exit becau=
se
> > > for first one preempt_state wasn't NONE yet and for second one all ri=
ngs
> > > appeared to be empty.
> > >
> > > To prevent such situations from happening we need to establish guaran=
tee
> > > for preempt_trigger to be called after each submit. To implement it t=
his
> > > patch adds trigger call at the end of a5xx_preempt_irq to re-check if=
 we
> > > should switch to non-empty or higher priority ring. Also we find next
> > > ring in new preemption state "EVALUATE". If the thread that updated s=
ome
> > > ring with new submit sees this state it should wait until it passes.
> > >
> > > Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets"=
)
> > > Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  6 +++---
> > >  drivers/gpu/drm/msm/adreno/a5xx_gpu.h     | 11 +++++++----
> > >  drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 24 +++++++++++++++++++--=
--
> > >  3 files changed, 30 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/=
msm/adreno/a5xx_gpu.c
> > > index 6c80d3003966..266744ee1d5f 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > > @@ -110,7 +110,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu=
, struct msm_gem_submit *submit
> > >         }
> > >
> > >         a5xx_flush(gpu, ring, true);
> > > -       a5xx_preempt_trigger(gpu);
> > > +       a5xx_preempt_trigger(gpu, true);
> > >
> > >         /* we might not necessarily have a cmd from userspace to
> > >          * trigger an event to know that submit has completed, so
> > > @@ -240,7 +240,7 @@ static void a5xx_submit(struct msm_gpu *gpu, stru=
ct msm_gem_submit *submit)
> > >         a5xx_flush(gpu, ring, false);
> > >
> > >         /* Check to see if we need to start preemption */
> > > -       a5xx_preempt_trigger(gpu);
> > > +       a5xx_preempt_trigger(gpu, true);
> > >  }
> > >
> > >  static const struct adreno_five_hwcg_regs {
> > > @@ -1296,7 +1296,7 @@ static irqreturn_t a5xx_irq(struct msm_gpu *gpu=
)
> > >                 a5xx_gpmu_err_irq(gpu);
> > >
> > >         if (status & A5XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS) {
> > > -               a5xx_preempt_trigger(gpu);
> > > +               a5xx_preempt_trigger(gpu, false);
> > >                 msm_gpu_retire(gpu);
> > >         }
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h b/drivers/gpu/drm/=
msm/adreno/a5xx_gpu.h
> > > index c7187bcc5e90..1120824853d4 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
> > > +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
> > > @@ -57,10 +57,12 @@ void a5xx_debugfs_init(struct msm_gpu *gpu, struc=
t drm_minor *minor);
> > >   * through the process.
> > >   *
> > >   * PREEMPT_NONE - no preemption in progress.  Next state START.
> > > - * PREEMPT_START - The trigger is evaulating if preemption is possib=
le. Next
> > > - * states: TRIGGERED, NONE
> > > + * PREEMPT_EVALUATE - The trigger is evaulating if preemption is pos=
sible. Next
> > > + * states: START, ABORT
> > >   * PREEMPT_ABORT - An intermediate state before moving back to NONE.=
 Next
> > >   * state: NONE.
> > > + * PREEMPT_START - The trigger is preparing for preemption. Next sta=
te:
> > > + * TRIGGERED
> > >   * PREEMPT_TRIGGERED: A preemption has been executed on the hardware=
. Next
> > >   * states: FAULTED, PENDING
> > >   * PREEMPT_FAULTED: A preemption timed out (never completed). This w=
ill trigger
> > > @@ -71,8 +73,9 @@ void a5xx_debugfs_init(struct msm_gpu *gpu, struct =
drm_minor *minor);
> > >
> > >  enum preempt_state {
> > >         PREEMPT_NONE =3D 0,
> > > -       PREEMPT_START,
> > > +       PREEMPT_EVALUATE,
> > >         PREEMPT_ABORT,
> > > +       PREEMPT_START,
> > >         PREEMPT_TRIGGERED,
> > >         PREEMPT_FAULTED,
> > >         PREEMPT_PENDING,
> > > @@ -156,7 +159,7 @@ void a5xx_set_hwcg(struct msm_gpu *gpu, bool stat=
e);
> > >
> > >  void a5xx_preempt_init(struct msm_gpu *gpu);
> > >  void a5xx_preempt_hw_init(struct msm_gpu *gpu);
> > > -void a5xx_preempt_trigger(struct msm_gpu *gpu);
> > > +void a5xx_preempt_trigger(struct msm_gpu *gpu, bool new_submit);
> > >  void a5xx_preempt_irq(struct msm_gpu *gpu);
> > >  void a5xx_preempt_fini(struct msm_gpu *gpu);
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/=
drm/msm/adreno/a5xx_preempt.c
> > > index 67a8ef4adf6b..f8d09a83c5ae 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> > > @@ -87,21 +87,33 @@ static void a5xx_preempt_timer(struct timer_list =
*t)
> > >  }
> > >
> > >  /* Try to trigger a preemption switch */
> > > -void a5xx_preempt_trigger(struct msm_gpu *gpu)
> > > +void a5xx_preempt_trigger(struct msm_gpu *gpu, bool new_submit)
> > >  {
> > >         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > >         struct a5xx_gpu *a5xx_gpu =3D to_a5xx_gpu(adreno_gpu);
> > >         unsigned long flags;
> > >         struct msm_ringbuffer *ring;
> > > +       enum preempt_state state;
> > >
> > >         if (gpu->nr_rings =3D=3D 1)
> > >                 return;
> > >
> > >         /*
> > > -        * Try to start preemption by moving from NONE to START. If
> > > -        * unsuccessful, a preemption is already in flight
> > > +        * Try to start preemption by moving from NONE to EVALUATE. I=
f current
> > > +        * state is EVALUATE/ABORT we can't just quit because then we=
 can't
> > > +        * guarantee that preempt_trigger will be called after ring i=
s updated
> > > +        * by new submit.
> > >          */
> > > -       if (!try_preempt_state(a5xx_gpu, PREEMPT_NONE, PREEMPT_START)=
)
> > > +       state =3D atomic_cmpxchg(&a5xx_gpu->preempt_state, PREEMPT_NO=
NE,
> > > +                              PREEMPT_EVALUATE);
> > > +       while (new_submit && (state =3D=3D PREEMPT_EVALUATE ||
> > > +                             state =3D=3D PREEMPT_ABORT)) {
> >
> > This isn't enough because even if new_submit is false then we may
> > still need to guarantee that evaluation happens. We've seen a hang in
> > a scenario like:
> >
> > 1. A job is submitted and executed on ring 0.
> > 2. A job is submitted on ring 2 while ring 0 is still active but
> > almost finished.
> > 3. The submission thread starts evaluating and sees that ring 0 is stil=
l busy.
> > 4. The job on ring 0 finishes and a CACHE_FLUSH IRQ is raised.
> > 5. The IRQ tries to trigger a preemption but the state is still
> > PREEMPT_EVALUATE or PREEMPT_ABORT and exits.
> > 6. The submission thread finishes update_wptr() and finally sets the
> > state to PREEMPT_NONE too late.
> >
> > Then we never preempt to ring 2 and there's a soft lockup.
>
> Thanks, i've missed that. It would need to always wait to prevent such
> scenario. The next patch prevented this from happening for me so i have
> overlooked it.
>
> Alternatively there is another approach which should perform better: to
> let evaluation stage run in parallel.
>
> Also i've tried serializing preemption handling on ordered workqueue and
> GPU kthread worker. It's a lot simpler but latency from IRQ doesn't look
> good:
>
>            flush-trigger    SW_IRQ-pending   flush_IRQ-trigger
>     uSecs    1    2    3       1    2    3       1    2    3
>      0-10 1515   43   65    4423   39   24     647    0    2
>     10-20 1484  453  103     446  414  309     399    1    1
>     20-40  827 1802  358      19  819  587       2   21    6
>     40-60    7 1264  397       1  368  329       0   30   14
>     60-80    4  311  115       0  181  178       0   24   12
>    80-120    2   36  251       0  250  188       0    9   13
>   120-160    0    4  244       0  176  248       0  226  150
>   160-200    0    1  278       0  221  235       0   86   78
>   200-400    0    2 1266       0 1318 1186       0  476  688
>   400-700    0    0  553       0  745 1028       0  150  106
>  700-1000    0    0  121       0  264  366       0   65   28
> 1000-1500    0    0   61       0  160  205       0   21    8
>     >2000    0    0   12       0   71   48       0    0    0
>
> 1 - current implementation but with evaluation in parallel.
> 2 - serialized on ordered workqueue.
> 3 - serialized on GPU kthread_worker.

The problem with evaluating in parallel is that evaluating can race
with the rest of the process - it's possible for the thread evaluating
to go to be interrupted just before moving the state to PREEMPT_START
and in the meantime an entire preemption has happened and it's out of
date.

What we did was to put a spinlock around the entire evaluation stage,
effectively replacing the busy loop and the EVALUATE stage. It unlocks
only after moving the state to NONE or knowing for certain that we're
starting a preemption. That should be lower latency than a workqueue
while the critical section shouldn't be that large (it's one atomic
operation and checking each ring), and in any case that's what the
spinning loop was doing anyway.

Connor

>
> Vladimir
>
> >
> > Connor
> >
> > > +               cpu_relax();
> > > +               state =3D atomic_cmpxchg(&a5xx_gpu->preempt_state, PR=
EEMPT_NONE,
> > > +                                      PREEMPT_EVALUATE);
> > > +       }
> > > +
> > > +       if (state !=3D PREEMPT_NONE)
> > >                 return;
> > >
> > >         /* Get the next ring to preempt to */
> > > @@ -130,6 +142,8 @@ void a5xx_preempt_trigger(struct msm_gpu *gpu)
> > >                 return;
> > >         }
> > >
> > > +       set_preempt_state(a5xx_gpu, PREEMPT_START);
> > > +
> > >         /* Make sure the wptr doesn't update while we're in motion */
> > >         spin_lock_irqsave(&ring->preempt_lock, flags);
> > >         a5xx_gpu->preempt[ring->id]->wptr =3D get_wptr(ring);
> > > @@ -188,6 +202,8 @@ void a5xx_preempt_irq(struct msm_gpu *gpu)
> > >         update_wptr(gpu, a5xx_gpu->cur_ring);
> > >
> > >         set_preempt_state(a5xx_gpu, PREEMPT_NONE);
> > > +
> > > +       a5xx_preempt_trigger(gpu, false);
> > >  }
> > >
> > >  void a5xx_preempt_hw_init(struct msm_gpu *gpu)
> > > --
> > > 2.45.2
> > >

