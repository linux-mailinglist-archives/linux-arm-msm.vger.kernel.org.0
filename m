Return-Path: <linux-arm-msm+bounces-27727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC2B944B34
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 14:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7113285857
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 12:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8C618950D;
	Thu,  1 Aug 2024 12:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VufHuDqH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16671CA81;
	Thu,  1 Aug 2024 12:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722515121; cv=none; b=G/Jmp5ZFOiv+eP5QbS6FReleg3/n3SqIOKEgqpBwtKAwdD1zUauLyDH5sWTXw1gvK+LHyEs3MRyxmaZ9i6paj1R7mlDB7m2hWA3uWo0ZAHCIeWUckzqZJ0igXkLmcra3r47eezvxWp11EG54tgEsVVfrlrHe1UH8Yeo1OMh+aRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722515121; c=relaxed/simple;
	bh=phqoO4fF9e5NG9XuFEWKyVq5ybJWJZ11PHdBImjcays=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k26PHJLpiuyRYOLCqZLaWhm59kxFddc2iM377rLtafm0cbSD7m77J9Qf3ARS9FmlqwV/WmF0/Fj1tvFACVKuaC/6XfB6mVHdsV5vqdmkVU8GyzC5Qiyhof4CGH9zbbhDZyBc7z/qhwfrSKu9FTLjAZWa0rrwC/vQ84416JHQ8dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VufHuDqH; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2eeb1ba040aso111659051fa.1;
        Thu, 01 Aug 2024 05:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722515118; x=1723119918; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IE6qgZ4rcTyQeTCYx/z4n2FJeaYWlB8FUWK+7JYDiws=;
        b=VufHuDqHiAvyaaCP03r1Fzb1/x9zf3FJjPVGFF5urrBOA4Oa9x5VayEZluxib+LWC1
         1hdmdbm1hSFanQQOgmJUOpczQ9nhnYBKFmwJYXGEAz5g+0Ucidw37aM//f//rETfFDyA
         XORY+5lU0mWB/c6Nc/7PlksSnSaHlFsPNRluFsl6RbuVisFBPjnHvoGIxyiUOysbKnU+
         3e4oO1uGUI1KpXyUQ3XkzQ5rf4ZqF3wwUrerchJC/5XoblyrOiMJXIPSgBOxC4ONEMit
         JfbX879a6kcPaXXJglDweTI8kIaCLKw1FyfIJokH1Gwd3vFNdr1D4yox2TQIKJ+RbjPj
         +uKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722515118; x=1723119918;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IE6qgZ4rcTyQeTCYx/z4n2FJeaYWlB8FUWK+7JYDiws=;
        b=YAJ576cbt+UXCh+RdFxfVHPVlZ6bTbrmc17DGQPFqe4mxuZoE+X2X57jT3t05pnrIV
         9Xs6df5+y0WUtsJ0NpeA9VV8m5fo0ToAy4Q2rHKYyZ1urwE1oUzWA1+NX3qk49aWYGkS
         cSYDSU8Fvi2UIUgsKJjuPhyPzooA/ueRIVeJ2SFHD5cJT0X6Gorps2+Z6QFna9nsGed2
         Vd/jURhoI5ywvxAUpQe+KOoVOx4iYhrWJe/TUbzsTkNq408CNA05I9R3662tp58sj8QF
         Zz/oXGfbDbdri82KdDm1MPccu4bswnlD+R2yjwPwUGfZDvjY11q/IoN7fXkA2P01HzJ/
         msmg==
X-Forwarded-Encrypted: i=1; AJvYcCWkMHRAnCtqQNLOrJS7m+nO7OiFWiIb9FZJaK+XRbivbnUF0waZoHitMFcdHbv/Bg1bKIHHzowNFYHr7UaIvRSvR3NzyaUbuxll7NkkC9KiX4b934ERHQ0O5YoyfH6CPUZZutAsswk05uzG3g==
X-Gm-Message-State: AOJu0YyZpjJ2FfzppudUq3kIoM19T9F+qd3RJ77yby62Zs8TMVazLHXO
	6jOdSlLrVbOvN7onW+3HTCvyLjsWaiCOqNyCat8wXoDUUHz/87/SbsShmdDy
X-Google-Smtp-Source: AGHT+IG943eA0ry+JhccUVZUIMThycHbSJevQ0g1kmn0332vlbW23arsJG6hBeaAFPOswQpq+lnHZg==
X-Received: by 2002:a2e:9cc9:0:b0:2ef:259f:a569 with SMTP id 38308e7fff4ca-2f15aa872a4mr655561fa.15.1722515117536;
        Thu, 01 Aug 2024 05:25:17 -0700 (PDT)
Received: from trashcan ([222.118.21.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367fce64sm19345452f8f.61.2024.08.01.05.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 05:25:16 -0700 (PDT)
Date: Thu, 1 Aug 2024 12:22:29 +0000
From: Vladimir Lypak <vladimir.lypak@gmail.com>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] drm/msm/a5xx: fix races in preemption evaluation
 stage
Message-ID: <Zqt9Cxu7FsSALi4y@trashcan>
References: <20240711100038.268803-1-vladimir.lypak@gmail.com>
 <20240711100038.268803-4-vladimir.lypak@gmail.com>
 <CACu1E7HkRN7pkBOUeC3G59K5rbsMRj81HvfAocpHuG6XuNbCyQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACu1E7HkRN7pkBOUeC3G59K5rbsMRj81HvfAocpHuG6XuNbCyQ@mail.gmail.com>

On Mon, Jul 29, 2024 at 06:26:45PM +0100, Connor Abbott wrote:
> On Thu, Jul 11, 2024 at 11:10 AM Vladimir Lypak
> <vladimir.lypak@gmail.com> wrote:
> >
> > On A5XX GPUs when preemption is used it's invietable to enter a soft
> > lock-up state in which GPU is stuck at empty ring-buffer doing nothing.
> > This appears as full UI lockup and not detected as GPU hang (because
> > it's not). This happens due to not triggering preemption when it was
> > needed. Sometimes this state can be recovered by some new submit but
> > generally it won't happen because applications are waiting for old
> > submits to retire.
> >
> > One of the reasons why this happens is a race between a5xx_submit and
> > a5xx_preempt_trigger called from IRQ during submit retire. Former thread
> > updates ring->cur of previously empty and not current ring right after
> > latter checks it for emptiness. Then both threads can just exit because
> > for first one preempt_state wasn't NONE yet and for second one all rings
> > appeared to be empty.
> >
> > To prevent such situations from happening we need to establish guarantee
> > for preempt_trigger to be called after each submit. To implement it this
> > patch adds trigger call at the end of a5xx_preempt_irq to re-check if we
> > should switch to non-empty or higher priority ring. Also we find next
> > ring in new preemption state "EVALUATE". If the thread that updated some
> > ring with new submit sees this state it should wait until it passes.
> >
> > Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets")
> > Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  6 +++---
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.h     | 11 +++++++----
> >  drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 24 +++++++++++++++++++----
> >  3 files changed, 30 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > index 6c80d3003966..266744ee1d5f 100644
> > --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > @@ -110,7 +110,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
> >         }
> >
> >         a5xx_flush(gpu, ring, true);
> > -       a5xx_preempt_trigger(gpu);
> > +       a5xx_preempt_trigger(gpu, true);
> >
> >         /* we might not necessarily have a cmd from userspace to
> >          * trigger an event to know that submit has completed, so
> > @@ -240,7 +240,7 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
> >         a5xx_flush(gpu, ring, false);
> >
> >         /* Check to see if we need to start preemption */
> > -       a5xx_preempt_trigger(gpu);
> > +       a5xx_preempt_trigger(gpu, true);
> >  }
> >
> >  static const struct adreno_five_hwcg_regs {
> > @@ -1296,7 +1296,7 @@ static irqreturn_t a5xx_irq(struct msm_gpu *gpu)
> >                 a5xx_gpmu_err_irq(gpu);
> >
> >         if (status & A5XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS) {
> > -               a5xx_preempt_trigger(gpu);
> > +               a5xx_preempt_trigger(gpu, false);
> >                 msm_gpu_retire(gpu);
> >         }
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
> > index c7187bcc5e90..1120824853d4 100644
> > --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
> > @@ -57,10 +57,12 @@ void a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor);
> >   * through the process.
> >   *
> >   * PREEMPT_NONE - no preemption in progress.  Next state START.
> > - * PREEMPT_START - The trigger is evaulating if preemption is possible. Next
> > - * states: TRIGGERED, NONE
> > + * PREEMPT_EVALUATE - The trigger is evaulating if preemption is possible. Next
> > + * states: START, ABORT
> >   * PREEMPT_ABORT - An intermediate state before moving back to NONE. Next
> >   * state: NONE.
> > + * PREEMPT_START - The trigger is preparing for preemption. Next state:
> > + * TRIGGERED
> >   * PREEMPT_TRIGGERED: A preemption has been executed on the hardware. Next
> >   * states: FAULTED, PENDING
> >   * PREEMPT_FAULTED: A preemption timed out (never completed). This will trigger
> > @@ -71,8 +73,9 @@ void a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor);
> >
> >  enum preempt_state {
> >         PREEMPT_NONE = 0,
> > -       PREEMPT_START,
> > +       PREEMPT_EVALUATE,
> >         PREEMPT_ABORT,
> > +       PREEMPT_START,
> >         PREEMPT_TRIGGERED,
> >         PREEMPT_FAULTED,
> >         PREEMPT_PENDING,
> > @@ -156,7 +159,7 @@ void a5xx_set_hwcg(struct msm_gpu *gpu, bool state);
> >
> >  void a5xx_preempt_init(struct msm_gpu *gpu);
> >  void a5xx_preempt_hw_init(struct msm_gpu *gpu);
> > -void a5xx_preempt_trigger(struct msm_gpu *gpu);
> > +void a5xx_preempt_trigger(struct msm_gpu *gpu, bool new_submit);
> >  void a5xx_preempt_irq(struct msm_gpu *gpu);
> >  void a5xx_preempt_fini(struct msm_gpu *gpu);
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> > index 67a8ef4adf6b..f8d09a83c5ae 100644
> > --- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> > +++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> > @@ -87,21 +87,33 @@ static void a5xx_preempt_timer(struct timer_list *t)
> >  }
> >
> >  /* Try to trigger a preemption switch */
> > -void a5xx_preempt_trigger(struct msm_gpu *gpu)
> > +void a5xx_preempt_trigger(struct msm_gpu *gpu, bool new_submit)
> >  {
> >         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> >         struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
> >         unsigned long flags;
> >         struct msm_ringbuffer *ring;
> > +       enum preempt_state state;
> >
> >         if (gpu->nr_rings == 1)
> >                 return;
> >
> >         /*
> > -        * Try to start preemption by moving from NONE to START. If
> > -        * unsuccessful, a preemption is already in flight
> > +        * Try to start preemption by moving from NONE to EVALUATE. If current
> > +        * state is EVALUATE/ABORT we can't just quit because then we can't
> > +        * guarantee that preempt_trigger will be called after ring is updated
> > +        * by new submit.
> >          */
> > -       if (!try_preempt_state(a5xx_gpu, PREEMPT_NONE, PREEMPT_START))
> > +       state = atomic_cmpxchg(&a5xx_gpu->preempt_state, PREEMPT_NONE,
> > +                              PREEMPT_EVALUATE);
> > +       while (new_submit && (state == PREEMPT_EVALUATE ||
> > +                             state == PREEMPT_ABORT)) {
> 
> This isn't enough because even if new_submit is false then we may
> still need to guarantee that evaluation happens. We've seen a hang in
> a scenario like:
> 
> 1. A job is submitted and executed on ring 0.
> 2. A job is submitted on ring 2 while ring 0 is still active but
> almost finished.
> 3. The submission thread starts evaluating and sees that ring 0 is still busy.
> 4. The job on ring 0 finishes and a CACHE_FLUSH IRQ is raised.
> 5. The IRQ tries to trigger a preemption but the state is still
> PREEMPT_EVALUATE or PREEMPT_ABORT and exits.
> 6. The submission thread finishes update_wptr() and finally sets the
> state to PREEMPT_NONE too late.
> 
> Then we never preempt to ring 2 and there's a soft lockup.

Thanks, i've missed that. It would need to always wait to prevent such
scenario. The next patch prevented this from happening for me so i have
overlooked it.

Alternatively there is another approach which should perform better: to
let evaluation stage run in parallel.

Also i've tried serializing preemption handling on ordered workqueue and
GPU kthread worker. It's a lot simpler but latency from IRQ doesn't look
good:

           flush-trigger    SW_IRQ-pending   flush_IRQ-trigger
    uSecs    1    2    3       1    2    3       1    2    3
     0-10 1515   43   65    4423   39   24     647    0    2
    10-20 1484  453  103     446  414  309     399    1    1
    20-40  827 1802  358      19  819  587       2   21    6
    40-60    7 1264  397       1  368  329       0   30   14
    60-80    4  311  115       0  181  178       0   24   12
   80-120    2   36  251       0  250  188       0    9   13
  120-160    0    4  244       0  176  248       0  226  150
  160-200    0    1  278       0  221  235       0   86   78
  200-400    0    2 1266       0 1318 1186       0  476  688
  400-700    0    0  553       0  745 1028       0  150  106
 700-1000    0    0  121       0  264  366       0   65   28
1000-1500    0    0   61       0  160  205       0   21    8
    >2000    0    0   12       0   71   48       0    0    0

1 - current implementation but with evaluation in parallel.
2 - serialized on ordered workqueue.
3 - serialized on GPU kthread_worker.

Vladimir

> 
> Connor
> 
> > +               cpu_relax();
> > +               state = atomic_cmpxchg(&a5xx_gpu->preempt_state, PREEMPT_NONE,
> > +                                      PREEMPT_EVALUATE);
> > +       }
> > +
> > +       if (state != PREEMPT_NONE)
> >                 return;
> >
> >         /* Get the next ring to preempt to */
> > @@ -130,6 +142,8 @@ void a5xx_preempt_trigger(struct msm_gpu *gpu)
> >                 return;
> >         }
> >
> > +       set_preempt_state(a5xx_gpu, PREEMPT_START);
> > +
> >         /* Make sure the wptr doesn't update while we're in motion */
> >         spin_lock_irqsave(&ring->preempt_lock, flags);
> >         a5xx_gpu->preempt[ring->id]->wptr = get_wptr(ring);
> > @@ -188,6 +202,8 @@ void a5xx_preempt_irq(struct msm_gpu *gpu)
> >         update_wptr(gpu, a5xx_gpu->cur_ring);
> >
> >         set_preempt_state(a5xx_gpu, PREEMPT_NONE);
> > +
> > +       a5xx_preempt_trigger(gpu, false);
> >  }
> >
> >  void a5xx_preempt_hw_init(struct msm_gpu *gpu)
> > --
> > 2.45.2
> >

