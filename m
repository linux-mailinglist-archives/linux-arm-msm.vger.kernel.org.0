Return-Path: <linux-arm-msm+bounces-27289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9272C93FC6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 19:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05683B203B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 17:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBEF148304;
	Mon, 29 Jul 2024 17:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bywx2ui1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF537E58D;
	Mon, 29 Jul 2024 17:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722274019; cv=none; b=ERuFyF5GM8e2MoLVJkkc7vh0HG6ToaO/cGchnj4T5Vp1Mae34PhNSPyft1gvA1+YxJjhz7X9j+P1LWNjLbIS3JBUZweBHMo3E3K3/TxFOsRwCv0V6kkNCLBaTxI35L1myh1QmfK8I26qtfYn1Lqc/GoccWhszakShVhf+i7sj84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722274019; c=relaxed/simple;
	bh=HldEWcI2ogojh9h+MUJsOKUdpNIk7Aa342bQANYPFDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MG3BkW7Raodp8TnVuRiOTLHCS7o8rxUcRKXCz4rlrOhmj05E5XQhG+t0a5A8v355hV1p0tQ1R6T17N+kazhfN/Xv6FcL2Tr4mCCMNV65zpIcoaOzV5susWfmKa77RVJ2jn5zUC0ieG/sx9bqLyr6dzryRr+7H/mCzmF2Ouj82E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bywx2ui1; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2cb5787b4a5so2127569a91.2;
        Mon, 29 Jul 2024 10:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722274017; x=1722878817; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AR5yeX17UGq4U9wLE9WErCeh9H/LofY6XOuRJLfNZ/A=;
        b=bywx2ui1QTEomvMG7s6ENMoIMX6T1asrvxmy9Qn/BUdjhB7IArutwxFRGmLmHhOJJr
         VNG8x4+aLpJpaTZDxtSj8KAt+pS1Ez0NHIVhNt8c2Sdl1pFVAUst/JBKFdVFifzzMIb6
         JSwrfB911kLEseXCf8E9eSx87fnTBtj+2Ko/LcQuDEJN/r23ZhsWkYobOe8tFxdAqbYB
         HitUqBkUyB4awY649cxTZPkfnx7GlhG5zMgKhVOfpFbqrYeXF07FE0WRy1ZSb49TicUc
         CzsUQOMbccjAPQdhwDnbQFzGwOxHz2mS0N0gIN6t/Lyj6ywBsePfBj9DSRE1MwJ1BQPp
         YVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722274017; x=1722878817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AR5yeX17UGq4U9wLE9WErCeh9H/LofY6XOuRJLfNZ/A=;
        b=kCDGQkoJZqBWLnTeScrzvyJtzw3i75kYRXEz9jlSxBmFw9iGXDX6OwU4J70drA8Lr1
         EQGXrdQsZiW/pnRhSddWftjiloyb/hDohqmlX/jAQHX/63L9OXp6qCUSEN4TJWeszHc6
         QKNnrUaFIEw33itCtwNHqUnVQj6VOtjU5l9wOvMfjFjTvSztTxx+4b04i54g1g3gj4el
         f4t0SIhuLOLD81n+Gccx+p+mpZIeeIXYmP19s6dbL3psZvitjfA0rGK/spyMhM87ip6f
         0A+o8GuTMxFvUQPE4l8J2I79a+zZhmu4OY8mCmnjIvddnYwM47YENjNmxSqUcnKaRBkH
         JGEg==
X-Forwarded-Encrypted: i=1; AJvYcCVX6aiYDeZzXU07Ki8nNPkWP/Fwf2ZMdUPHTvPorlgDJb+yookxRcdxZEPrmpkhN4cNViOjUJFc6SKJk8x2gj2SioWORdlae+DaK6/gIj3gExIKdztOhNf7+dTUR2KXIPkDv6/v7WwF6uOY0g==
X-Gm-Message-State: AOJu0YyKMeT/LVu5THdZhrXmUC9RJuOVKRPvIUv6y6Taa9BGfetHoNT0
	cTH5eLPwIZXpqSgLntlvb11Wj0/m3j6Z+tgTRkaedQzqkAtszLwSRtejpUijOQospBbftNITLdG
	3Mao02jmADlEgbvfrGeguLKj/3M0=
X-Google-Smtp-Source: AGHT+IEFHIgZALYvf1AZp3C5etY6j9w34vDz7OKb2duLwIw2Re4C18oa1CUxQqvHgV4P2MSLaZPShByYs9GFbqIlbio=
X-Received: by 2002:a17:90a:4b81:b0:2c8:a8f:c97 with SMTP id
 98e67ed59e1d1-2cf7e71b723mr5975518a91.37.1722274017294; Mon, 29 Jul 2024
 10:26:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240711100038.268803-1-vladimir.lypak@gmail.com> <20240711100038.268803-4-vladimir.lypak@gmail.com>
In-Reply-To: <20240711100038.268803-4-vladimir.lypak@gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Mon, 29 Jul 2024 18:26:45 +0100
Message-ID: <CACu1E7HkRN7pkBOUeC3G59K5rbsMRj81HvfAocpHuG6XuNbCyQ@mail.gmail.com>
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

On Thu, Jul 11, 2024 at 11:10=E2=80=AFAM Vladimir Lypak
<vladimir.lypak@gmail.com> wrote:
>
> On A5XX GPUs when preemption is used it's invietable to enter a soft
> lock-up state in which GPU is stuck at empty ring-buffer doing nothing.
> This appears as full UI lockup and not detected as GPU hang (because
> it's not). This happens due to not triggering preemption when it was
> needed. Sometimes this state can be recovered by some new submit but
> generally it won't happen because applications are waiting for old
> submits to retire.
>
> One of the reasons why this happens is a race between a5xx_submit and
> a5xx_preempt_trigger called from IRQ during submit retire. Former thread
> updates ring->cur of previously empty and not current ring right after
> latter checks it for emptiness. Then both threads can just exit because
> for first one preempt_state wasn't NONE yet and for second one all rings
> appeared to be empty.
>
> To prevent such situations from happening we need to establish guarantee
> for preempt_trigger to be called after each submit. To implement it this
> patch adds trigger call at the end of a5xx_preempt_irq to re-check if we
> should switch to non-empty or higher priority ring. Also we find next
> ring in new preemption state "EVALUATE". If the thread that updated some
> ring with new submit sees this state it should wait until it passes.
>
> Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets")
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  6 +++---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.h     | 11 +++++++----
>  drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 24 +++++++++++++++++++----
>  3 files changed, 30 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a5xx_gpu.c
> index 6c80d3003966..266744ee1d5f 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -110,7 +110,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, st=
ruct msm_gem_submit *submit
>         }
>
>         a5xx_flush(gpu, ring, true);
> -       a5xx_preempt_trigger(gpu);
> +       a5xx_preempt_trigger(gpu, true);
>
>         /* we might not necessarily have a cmd from userspace to
>          * trigger an event to know that submit has completed, so
> @@ -240,7 +240,7 @@ static void a5xx_submit(struct msm_gpu *gpu, struct m=
sm_gem_submit *submit)
>         a5xx_flush(gpu, ring, false);
>
>         /* Check to see if we need to start preemption */
> -       a5xx_preempt_trigger(gpu);
> +       a5xx_preempt_trigger(gpu, true);
>  }
>
>  static const struct adreno_five_hwcg_regs {
> @@ -1296,7 +1296,7 @@ static irqreturn_t a5xx_irq(struct msm_gpu *gpu)
>                 a5xx_gpmu_err_irq(gpu);
>
>         if (status & A5XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS) {
> -               a5xx_preempt_trigger(gpu);
> +               a5xx_preempt_trigger(gpu, false);
>                 msm_gpu_retire(gpu);
>         }
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h b/drivers/gpu/drm/msm/=
adreno/a5xx_gpu.h
> index c7187bcc5e90..1120824853d4 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
> @@ -57,10 +57,12 @@ void a5xx_debugfs_init(struct msm_gpu *gpu, struct dr=
m_minor *minor);
>   * through the process.
>   *
>   * PREEMPT_NONE - no preemption in progress.  Next state START.
> - * PREEMPT_START - The trigger is evaulating if preemption is possible. =
Next
> - * states: TRIGGERED, NONE
> + * PREEMPT_EVALUATE - The trigger is evaulating if preemption is possibl=
e. Next
> + * states: START, ABORT
>   * PREEMPT_ABORT - An intermediate state before moving back to NONE. Nex=
t
>   * state: NONE.
> + * PREEMPT_START - The trigger is preparing for preemption. Next state:
> + * TRIGGERED
>   * PREEMPT_TRIGGERED: A preemption has been executed on the hardware. Ne=
xt
>   * states: FAULTED, PENDING
>   * PREEMPT_FAULTED: A preemption timed out (never completed). This will =
trigger
> @@ -71,8 +73,9 @@ void a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_=
minor *minor);
>
>  enum preempt_state {
>         PREEMPT_NONE =3D 0,
> -       PREEMPT_START,
> +       PREEMPT_EVALUATE,
>         PREEMPT_ABORT,
> +       PREEMPT_START,
>         PREEMPT_TRIGGERED,
>         PREEMPT_FAULTED,
>         PREEMPT_PENDING,
> @@ -156,7 +159,7 @@ void a5xx_set_hwcg(struct msm_gpu *gpu, bool state);
>
>  void a5xx_preempt_init(struct msm_gpu *gpu);
>  void a5xx_preempt_hw_init(struct msm_gpu *gpu);
> -void a5xx_preempt_trigger(struct msm_gpu *gpu);
> +void a5xx_preempt_trigger(struct msm_gpu *gpu, bool new_submit);
>  void a5xx_preempt_irq(struct msm_gpu *gpu);
>  void a5xx_preempt_fini(struct msm_gpu *gpu);
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/=
msm/adreno/a5xx_preempt.c
> index 67a8ef4adf6b..f8d09a83c5ae 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> @@ -87,21 +87,33 @@ static void a5xx_preempt_timer(struct timer_list *t)
>  }
>
>  /* Try to trigger a preemption switch */
> -void a5xx_preempt_trigger(struct msm_gpu *gpu)
> +void a5xx_preempt_trigger(struct msm_gpu *gpu, bool new_submit)
>  {
>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
>         struct a5xx_gpu *a5xx_gpu =3D to_a5xx_gpu(adreno_gpu);
>         unsigned long flags;
>         struct msm_ringbuffer *ring;
> +       enum preempt_state state;
>
>         if (gpu->nr_rings =3D=3D 1)
>                 return;
>
>         /*
> -        * Try to start preemption by moving from NONE to START. If
> -        * unsuccessful, a preemption is already in flight
> +        * Try to start preemption by moving from NONE to EVALUATE. If cu=
rrent
> +        * state is EVALUATE/ABORT we can't just quit because then we can=
't
> +        * guarantee that preempt_trigger will be called after ring is up=
dated
> +        * by new submit.
>          */
> -       if (!try_preempt_state(a5xx_gpu, PREEMPT_NONE, PREEMPT_START))
> +       state =3D atomic_cmpxchg(&a5xx_gpu->preempt_state, PREEMPT_NONE,
> +                              PREEMPT_EVALUATE);
> +       while (new_submit && (state =3D=3D PREEMPT_EVALUATE ||
> +                             state =3D=3D PREEMPT_ABORT)) {

This isn't enough because even if new_submit is false then we may
still need to guarantee that evaluation happens. We've seen a hang in
a scenario like:

1. A job is submitted and executed on ring 0.
2. A job is submitted on ring 2 while ring 0 is still active but
almost finished.
3. The submission thread starts evaluating and sees that ring 0 is still bu=
sy.
4. The job on ring 0 finishes and a CACHE_FLUSH IRQ is raised.
5. The IRQ tries to trigger a preemption but the state is still
PREEMPT_EVALUATE or PREEMPT_ABORT and exits.
6. The submission thread finishes update_wptr() and finally sets the
state to PREEMPT_NONE too late.

Then we never preempt to ring 2 and there's a soft lockup.

Connor

> +               cpu_relax();
> +               state =3D atomic_cmpxchg(&a5xx_gpu->preempt_state, PREEMP=
T_NONE,
> +                                      PREEMPT_EVALUATE);
> +       }
> +
> +       if (state !=3D PREEMPT_NONE)
>                 return;
>
>         /* Get the next ring to preempt to */
> @@ -130,6 +142,8 @@ void a5xx_preempt_trigger(struct msm_gpu *gpu)
>                 return;
>         }
>
> +       set_preempt_state(a5xx_gpu, PREEMPT_START);
> +
>         /* Make sure the wptr doesn't update while we're in motion */
>         spin_lock_irqsave(&ring->preempt_lock, flags);
>         a5xx_gpu->preempt[ring->id]->wptr =3D get_wptr(ring);
> @@ -188,6 +202,8 @@ void a5xx_preempt_irq(struct msm_gpu *gpu)
>         update_wptr(gpu, a5xx_gpu->cur_ring);
>
>         set_preempt_state(a5xx_gpu, PREEMPT_NONE);
> +
> +       a5xx_preempt_trigger(gpu, false);
>  }
>
>  void a5xx_preempt_hw_init(struct msm_gpu *gpu)
> --
> 2.45.2
>

