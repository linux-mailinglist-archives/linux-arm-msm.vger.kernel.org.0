Return-Path: <linux-arm-msm+bounces-29342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B045695C921
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 11:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D6CA282F3E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 09:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E686E13D2A4;
	Fri, 23 Aug 2024 09:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T03J0/dw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5AB13C918;
	Fri, 23 Aug 2024 09:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724404909; cv=none; b=J6ztVYjF/WhfoX6YNzWR9KuJKHbUB+73KQ5jgBP4wWfg0WP6fk9gO87/Z+saLhHoOBu4psk4LlluOENgJ3+NHEMYmF5DQhyi72NKvq4Nm8MDuqMyvDoGkNz4KUrfnrgaMisCcnREaRgay3SAhHUrUsvpc9m5KZuO00UetafQYGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724404909; c=relaxed/simple;
	bh=iVVP/m6buExCBA7PlPl4dkuuptCTCKiQn6i8BjD7/Sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d58HbE9WioOp9O3EPdEt/Yocg9j9u+0my6Z3JWkaJsiwr3mGZnGzJ8xZceKR6Qa6BjhFMvWwdFDU0dTBeh2aAMyJj/Vw6zEr1fVWBa9vGB8c/Z6v5diP1uQj+V2o46cYilzSqjG3pAW9a8mQU7XXplKF3/6X+ldB7qfRm3Cx2Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T03J0/dw; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7c3d415f85eso196493a12.0;
        Fri, 23 Aug 2024 02:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724404906; x=1725009706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlM6w/AS28akRubS6eaM5rdDgAcDB+CXULJBTeWSly0=;
        b=T03J0/dw+oosVtrUMGbPeXzv9g7PmhmaxQ5q9R3ZwVYouaUvw45YRDJgkAyMXcrfvF
         FcTVZnZtnwUw4IFcD8DS3u1ax0c/GUKIIlnT8a5C8Z9vVgcTAhsIPZes90MadGzHTOYm
         8JUNfuLwLYxUHiSsl7fX7eklELUg5CzHnvSgfjCpmsUDIO7p9avWzJRcG4jAxsRoIjTx
         BwGngokVXJbkLuoVl+fWCS2YCA8s0RSc1YmNqZskMuAnIWPZ4TMVap1srCvgorm9tVwG
         QmpKEGUsxZjvnjHE8JpGT9MBsozhPuuQ6o0OWnzYTY3joKjtsMV+jm+4hgOy5MFlVrfa
         7O6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724404906; x=1725009706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SlM6w/AS28akRubS6eaM5rdDgAcDB+CXULJBTeWSly0=;
        b=cr4jPXcmlaYg3A+ubjfFu+7TzEXvbqaDXRKwoGWLJBbL8+TzVea54xEDbClA1NtS9X
         ob7twhm6g8Y82lleSwtwNVKhyuHcyF6f6S7k3gFCL08uS/SE8dAfOeQKGGzXqH/nT1N8
         LL1Hgc1y0r52EqetK5C+59Vc4Dumt4cBg3Mfqubjp8KZua8o2hXTmpTbe6nL/20QmzPB
         S1oI3KADAMkO7aWoYpEJ+avMbX31lUYHhgCG2bkfrmX/Ly137IKtGxxYkyKRGRx1Ff8y
         tAdYX4Q2VCAPhM8cLP7FWTbfx1WggvViNn4grm5y0MDQZK7YiHpuucxozyt8fDVSpeRq
         qJpw==
X-Forwarded-Encrypted: i=1; AJvYcCUsenzNZnBcAIm8SnYrCveVoF9V3u4ojtiTwaRhwwsCZMiOs1WiASl7Z0NgcElCW8jBCge512ZtokfKmFR0@vger.kernel.org, AJvYcCWNXwLffaUwNbHJiamz44A09kxuMP6IhYCFOLUS6yFYgak5bsdMxNTRhqVVIe7K9ZoYN2bJC23C+Ez3BqBT@vger.kernel.org
X-Gm-Message-State: AOJu0YzmZoU6KF/U87qwSYf8liJ8776idHt+ASary9/Fu1ow3bxvZn8l
	JguwqOE3ACK4UqnMm33QLi7nikyxehw31IIpQHak/H0gnkcr8AysE099/+uRCIkVBDemiCvyzMj
	f8IRPNNC+bf1SXNtKfYFKrHVmswc=
X-Google-Smtp-Source: AGHT+IFlu4SXPYdGJKSvBE+OzvD1SfbktAjdHnLskEKJofZjcKXaOiU/n1Ig7837WOy6T11amt83/HcbddnzY83Kq5Y=
X-Received: by 2002:a05:6a20:7f9f:b0:1c4:af14:d9a4 with SMTP id
 adf61e73a8af0-1cc89d6248amr1161408637.3.1724404905553; Fri, 23 Aug 2024
 02:21:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-4-7bda26c34037@gmail.com> <20240819200837.etzn7oaoamnceigr@hu-akhilpo-hyd.qualcomm.com>
 <CACu1E7E7FPJP-Ry64m257A7WrL3Q9jy8xMS9XpSBRNimBWzYUQ@mail.gmail.com> <20240822200534.fgugb3zmcp7hjyck@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240822200534.fgugb3zmcp7hjyck@hu-akhilpo-hyd.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 23 Aug 2024 10:21:33 +0100
Message-ID: <CACu1E7F068sAMFgn=D7qBGM81qvYP4iW1+hXpfXVKtQGWeyTKQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] drm/msm/A6xx: Implement preemption for A7XX targets
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Antonino Maniscalco <antomani103@gmail.com>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 9:06=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On Wed, Aug 21, 2024 at 05:02:56PM +0100, Connor Abbott wrote:
> > On Mon, Aug 19, 2024 at 9:09=E2=80=AFPM Akhil P Oommen <quic_akhilpo@qu=
icinc.com> wrote:
> > >
> > > On Thu, Aug 15, 2024 at 08:26:14PM +0200, Antonino Maniscalco wrote:
> > > > This patch implements preemption feature for A6xx targets, this all=
ows
> > > > the GPU to switch to a higher priority ringbuffer if one is ready. =
A6XX
> > > > hardware as such supports multiple levels of preemption granulariti=
es,
> > > > ranging from coarse grained(ringbuffer level) to a more fine graine=
d
> > > > such as draw-call level or a bin boundary level preemption. This pa=
tch
> > > > enables the basic preemption level, with more fine grained preempti=
on
> > > > support to follow.
> > > >
> > > > Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > > > Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > > > ---
> > >
> > > No postamble packets which resets perfcounters? It is necessary. Also=
, I
> > > think we should disable preemption during profiling like we disable s=
lumber.
> > >
> > > -Akhil.
> >
> > I don't see anything in kgsl which disables preemption during
> > profiling. It disables resetting perfcounters when doing system-wide
> > profiling, like freedreno, and in that case I assume preempting is
> > fine because the system profiler has a complete view of everything and
> > should "see" preemptions through the traces. For something like
> > VK_KHR_performance_query I suppose we'd want to disable preemption
> > because we disable saving/restoring perf counters, but that has to
> > happen in userspace because the kernel doesn't know what userspace
> > does.
> >
>
> KGSL does some sort of arbitration of perfcounter configurations and
> adds the select/enablement reg configuration as part of dynamic
> power up register list which we are not doing here. Is this something
> you are taking care of from userspace via preamble?
>
> -Akhil

I don't think we have to take care of that in userspace, because Mesa
will always configure the counter registers before reading them in the
same submission, and if it gets preempted in the meantime then we're
toast anyways (due to not saving/restoring perf counters). kgsl sets
them from userspace, which is why it has to do something to set them
after IFPC slumber or a context switch when the HW state is gone.
Also, because the upstream approach doesn't play nicely with system
profilers like perfetto, VK_KHR_performance_query is hidden by default
behind a debug flag in turnip. So there's already an element of "this
is unsupported, you have to know what you're doing to use it."

Connor

>
> > Connor
> >
> > >
> > > >  drivers/gpu/drm/msm/Makefile              |   1 +
> > > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 323 ++++++++++++++++++=
+++-
> > > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 ++++++++++++
> > > >  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 434 ++++++++++++++++++=
++++++++++++
> > > >  drivers/gpu/drm/msm/msm_ringbuffer.h      |   7 +
> > > >  5 files changed, 924 insertions(+), 9 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Mak=
efile
> > > > index f5e2838c6a76..32e915109a59 100644
> > > > --- a/drivers/gpu/drm/msm/Makefile
> > > > +++ b/drivers/gpu/drm/msm/Makefile
> > > > @@ -23,6 +23,7 @@ adreno-y :=3D \
> > > >       adreno/a6xx_gpu.o \
> > > >       adreno/a6xx_gmu.o \
> > > >       adreno/a6xx_hfi.o \
> > > > +     adreno/a6xx_preempt.o \
> > > >
> > > >  adreno-$(CONFIG_DEBUG_FS) +=3D adreno/a5xx_debugfs.o \
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/dr=
m/msm/adreno/a6xx_gpu.c
> > > > index 32a4faa93d7f..1a90db5759b8 100644
> > > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > @@ -16,6 +16,83 @@
> > > >
> > > >  #define GPU_PAS_ID 13
> > > >
> > > > +/* IFPC & Preemption static powerup restore list */
> > > > +static const uint32_t a7xx_pwrup_reglist[] =3D {
> > > > +     REG_A6XX_UCHE_TRAP_BASE,
> > > > +     REG_A6XX_UCHE_TRAP_BASE + 1,
> > > > +     REG_A6XX_UCHE_WRITE_THRU_BASE,
> > > > +     REG_A6XX_UCHE_WRITE_THRU_BASE + 1,
> > > > +     REG_A6XX_UCHE_GMEM_RANGE_MIN,
> > > > +     REG_A6XX_UCHE_GMEM_RANGE_MIN + 1,
> > > > +     REG_A6XX_UCHE_GMEM_RANGE_MAX,
> > > > +     REG_A6XX_UCHE_GMEM_RANGE_MAX + 1,
> > > > +     REG_A6XX_UCHE_CACHE_WAYS,
> > > > +     REG_A6XX_UCHE_MODE_CNTL,
> > > > +     REG_A6XX_RB_NC_MODE_CNTL,
> > > > +     REG_A6XX_RB_CMP_DBG_ECO_CNTL,
> > > > +     REG_A7XX_GRAS_NC_MODE_CNTL,
> > > > +     REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE,
> > > > +     REG_A6XX_UCHE_GBIF_GX_CONFIG,
> > > > +     REG_A6XX_UCHE_CLIENT_PF,
> > > > +};
> > > > +
> > > > +static const uint32_t a7xx_ifpc_pwrup_reglist[] =3D {
> > > > +     REG_A6XX_TPL1_NC_MODE_CNTL,
> > > > +     REG_A6XX_SP_NC_MODE_CNTL,
> > > > +     REG_A6XX_CP_DBG_ECO_CNTL,
> > > > +     REG_A6XX_CP_PROTECT_CNTL,
> > > > +     REG_A6XX_CP_PROTECT(0),
> > > > +     REG_A6XX_CP_PROTECT(1),
> > > > +     REG_A6XX_CP_PROTECT(2),
> > > > +     REG_A6XX_CP_PROTECT(3),
> > > > +     REG_A6XX_CP_PROTECT(4),
> > > > +     REG_A6XX_CP_PROTECT(5),
> > > > +     REG_A6XX_CP_PROTECT(6),
> > > > +     REG_A6XX_CP_PROTECT(7),
> > > > +     REG_A6XX_CP_PROTECT(8),
> > > > +     REG_A6XX_CP_PROTECT(9),
> > > > +     REG_A6XX_CP_PROTECT(10),
> > > > +     REG_A6XX_CP_PROTECT(11),
> > > > +     REG_A6XX_CP_PROTECT(12),
> > > > +     REG_A6XX_CP_PROTECT(13),
> > > > +     REG_A6XX_CP_PROTECT(14),
> > > > +     REG_A6XX_CP_PROTECT(15),
> > > > +     REG_A6XX_CP_PROTECT(16),
> > > > +     REG_A6XX_CP_PROTECT(17),
> > > > +     REG_A6XX_CP_PROTECT(18),
> > > > +     REG_A6XX_CP_PROTECT(19),
> > > > +     REG_A6XX_CP_PROTECT(20),
> > > > +     REG_A6XX_CP_PROTECT(21),
> > > > +     REG_A6XX_CP_PROTECT(22),
> > > > +     REG_A6XX_CP_PROTECT(23),
> > > > +     REG_A6XX_CP_PROTECT(24),
> > > > +     REG_A6XX_CP_PROTECT(25),
> > > > +     REG_A6XX_CP_PROTECT(26),
> > > > +     REG_A6XX_CP_PROTECT(27),
> > > > +     REG_A6XX_CP_PROTECT(28),
> > > > +     REG_A6XX_CP_PROTECT(29),
> > > > +     REG_A6XX_CP_PROTECT(30),
> > > > +     REG_A6XX_CP_PROTECT(31),
> > > > +     REG_A6XX_CP_PROTECT(32),
> > > > +     REG_A6XX_CP_PROTECT(33),
> > > > +     REG_A6XX_CP_PROTECT(34),
> > > > +     REG_A6XX_CP_PROTECT(35),
> > > > +     REG_A6XX_CP_PROTECT(36),
> > > > +     REG_A6XX_CP_PROTECT(37),
> > > > +     REG_A6XX_CP_PROTECT(38),
> > > > +     REG_A6XX_CP_PROTECT(39),
> > > > +     REG_A6XX_CP_PROTECT(40),
> > > > +     REG_A6XX_CP_PROTECT(41),
> > > > +     REG_A6XX_CP_PROTECT(42),
> > > > +     REG_A6XX_CP_PROTECT(43),
> > > > +     REG_A6XX_CP_PROTECT(44),
> > > > +     REG_A6XX_CP_PROTECT(45),
> > > > +     REG_A6XX_CP_PROTECT(46),
> > > > +     REG_A6XX_CP_PROTECT(47),
> > > > +     REG_A6XX_CP_AHB_CNTL,
> > > > +};
> > > > +
> > > > +
> > > >  static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
> > > >  {
> > > >       struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > > > @@ -68,6 +145,8 @@ static void update_shadow_rptr(struct msm_gpu *g=
pu, struct msm_ringbuffer *ring)
> > > >
> > > >  static void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer =
*ring)
> > > >  {
> > > > +     struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > > > +     struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> > > >       uint32_t wptr;
> > > >       unsigned long flags;
> > > >
> > > > @@ -81,12 +160,26 @@ static void a6xx_flush(struct msm_gpu *gpu, st=
ruct msm_ringbuffer *ring)
> > > >       /* Make sure to wrap wptr if we need to */
> > > >       wptr =3D get_wptr(ring);
> > > >
> > > > -     spin_unlock_irqrestore(&ring->preempt_lock, flags);
> > > > -
> > > >       /* Make sure everything is posted before making a decision */
> > > >       mb();
> > > >
> > > > -     gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
> > > > +     /* Update HW if this is the current ring and we are not in pr=
eempt*/
> > > > +     if (!a6xx_in_preempt(a6xx_gpu)) {
> > > > +             /*
> > > > +              * Order the reads of the preempt state and cur_ring.=
 This
> > > > +              * matches the barrier after writing cur_ring.
> > > > +              */
> > > > +             rmb();
> > > > +
> > > > +             if (a6xx_gpu->cur_ring =3D=3D ring)
> > > > +                     gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
> > > > +             else
> > > > +                     ring->skip_inline_wptr =3D true;
> > > > +     } else {
> > > > +             ring->skip_inline_wptr =3D true;
> > > > +     }
> > > > +
> > > > +     spin_unlock_irqrestore(&ring->preempt_lock, flags);
> > > >  }
> > > >
> > > >  static void get_stats_counter(struct msm_ringbuffer *ring, u32 cou=
nter,
> > > > @@ -138,12 +231,14 @@ static void a6xx_set_pagetable(struct a6xx_gp=
u *a6xx_gpu,
> > > >
> > > >       /*
> > > >        * Write the new TTBR0 to the memstore. This is good for debu=
gging.
> > > > +      * Needed for preemption
> > > >        */
> > > > -     OUT_PKT7(ring, CP_MEM_WRITE, 4);
> > > > +     OUT_PKT7(ring, CP_MEM_WRITE, 5);
> > > >       OUT_RING(ring, CP_MEM_WRITE_0_ADDR_LO(lower_32_bits(memptr)))=
;
> > > >       OUT_RING(ring, CP_MEM_WRITE_1_ADDR_HI(upper_32_bits(memptr)))=
;
> > > >       OUT_RING(ring, lower_32_bits(ttbr));
> > > > -     OUT_RING(ring, (asid << 16) | upper_32_bits(ttbr));
> > > > +     OUT_RING(ring, upper_32_bits(ttbr));
> > > > +     OUT_RING(ring, ctx->seqno);
> > > >
> > > >       /*
> > > >        * Sync both threads after switching pagetables and enable BR=
 only
> > > > @@ -268,12 +363,55 @@ static void a6xx_submit(struct msm_gpu *gpu, =
struct msm_gem_submit *submit)
> > > >       a6xx_flush(gpu, ring);
> > > >  }
> > > >
> > > > +static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
> > > > +             struct a6xx_gpu *a6xx_gpu, struct msm_gpu_submitqueue=
 *queue)
> > > > +{
> > > > +     u64 preempt_offset_priv_secure;
> > > > +
> > > > +     OUT_PKT7(ring, CP_SET_PSEUDO_REG, 15);
> > > > +
> > > > +     OUT_RING(ring, SMMU_INFO);
> > > > +     /* don't save SMMU, we write the record from the kernel inste=
ad */
> > > > +     OUT_RING(ring, 0);
> > > > +     OUT_RING(ring, 0);
> > > > +
> > > > +     /* privileged and non secure buffer save */
> > > > +     OUT_RING(ring, NON_SECURE_SAVE_ADDR);
> > > > +     OUT_RING(ring, lower_32_bits(
> > > > +             a6xx_gpu->preempt_iova[ring->id] + PREEMPT_OFFSET_PRI=
V_NON_SECURE));
> > > > +     OUT_RING(ring, upper_32_bits(
> > > > +             a6xx_gpu->preempt_iova[ring->id] + PREEMPT_OFFSET_PRI=
V_NON_SECURE));
> > > > +     OUT_RING(ring, SECURE_SAVE_ADDR);
> > > > +     preempt_offset_priv_secure =3D
> > > > +             PREEMPT_OFFSET_PRIV_SECURE(a6xx_gpu->base.info->preem=
pt_record_size);
> > > > +     OUT_RING(ring, lower_32_bits(
> > > > +             a6xx_gpu->preempt_iova[ring->id] + preempt_offset_pri=
v_secure));
> > > > +     OUT_RING(ring, upper_32_bits(
> > > > +             a6xx_gpu->preempt_iova[ring->id] + preempt_offset_pri=
v_secure));
> > > > +
> > > > +     /* user context buffer save */
> > > > +     OUT_RING(ring, NON_PRIV_SAVE_ADDR);
> > > > +     if (queue) {
> > > > +             OUT_RING(ring, lower_32_bits(queue->bo_iova));
> > > > +             OUT_RING(ring, upper_32_bits(queue->bo_iova));
> > > > +     } else {
> > > > +             OUT_RING(ring, 0);
> > > > +             OUT_RING(ring, 0);
> > > > +     }
> > > > +
> > > > +     OUT_RING(ring, COUNTER);
> > > > +     /* seems OK to set to 0 to disable it */
> > > > +     OUT_RING(ring, 0);
> > > > +     OUT_RING(ring, 0);
> > > > +}
> > > > +
> > > >  static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit=
 *submit)
> > > >  {
> > > >       unsigned int index =3D submit->seqno % MSM_GPU_SUBMIT_STATS_C=
OUNT;
> > > >       struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > > >       struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> > > >       struct msm_ringbuffer *ring =3D submit->ring;
> > > > +     uint64_t scratch_dest =3D SCRATCH_USER_CTX_IOVA(ring->id, a6x=
x_gpu);
> > > >       unsigned int i, ibs =3D 0;
> > > >
> > > >       /*
> > > > @@ -283,6 +421,25 @@ static void a7xx_submit(struct msm_gpu *gpu, s=
truct msm_gem_submit *submit)
> > > >       OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
> > > >       OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THRE=
AD_BR);
> > > >
> > > > +     /*
> > > > +      * If preemption is enabled, then set the pseudo register for=
 the save
> > > > +      * sequence
> > > > +      */
> > > > +     if (gpu->nr_rings > 1) {
> > > > +             a6xx_emit_set_pseudo_reg(ring, a6xx_gpu, submit->queu=
e);
> > > > +
> > > > +             /*
> > > > +              * Ask CP to save the user context buffer's iova addr=
ess to a
> > > > +              * scratch memory region, this is needed if the CP pr=
eempts
> > > > +              * this ring in between this submit's IB list.
> > > > +              */
> > > > +             OUT_PKT7(ring, CP_MEM_WRITE, 4);
> > > > +             OUT_RING(ring, lower_32_bits(scratch_dest));
> > > > +             OUT_RING(ring, upper_32_bits(scratch_dest));
> > > > +             OUT_RING(ring, lower_32_bits(submit->queue->bo_iova))=
;
> > > > +             OUT_RING(ring, upper_32_bits(submit->queue->bo_iova))=
;
> > > > +     }
> > > > +
> > > >       a6xx_set_pagetable(a6xx_gpu, ring, submit->queue->ctx);
> > > >
> > > >       get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
> > > > @@ -376,6 +533,8 @@ static void a7xx_submit(struct msm_gpu *gpu, st=
ruct msm_gem_submit *submit)
> > > >       OUT_RING(ring, upper_32_bits(rbmemptr(ring, bv_fence)));
> > > >       OUT_RING(ring, submit->seqno);
> > > >
> > > > +     a6xx_gpu->last_seqno[ring->id] =3D submit->seqno;
> > > > +
> > > >       /* write the ringbuffer timestamp */
> > > >       OUT_PKT7(ring, CP_EVENT_WRITE, 4);
> > > >       OUT_RING(ring, CACHE_CLEAN | CP_EVENT_WRITE_0_IRQ | BIT(27));
> > > > @@ -389,10 +548,42 @@ static void a7xx_submit(struct msm_gpu *gpu, =
struct msm_gem_submit *submit)
> > > >       OUT_PKT7(ring, CP_SET_MARKER, 1);
> > > >       OUT_RING(ring, 0x100); /* IFPC enable */
> > > >
> > > > +     /* If preemption is enabled */
> > > > +     if (gpu->nr_rings > 1) {
> > > > +             /*
> > > > +              * Reset the scratch region as we are done with the
> > > > +              * IB list of this submission
> > > > +              */
> > > > +             OUT_PKT7(ring, CP_MEM_WRITE, 4);
> > > > +             OUT_RING(ring, lower_32_bits(scratch_dest));
> > > > +             OUT_RING(ring, upper_32_bits(scratch_dest));
> > > > +             OUT_RING(ring, 0x00);
> > > > +             OUT_RING(ring, 0x00);
> > > > +
> > > > +             /* Yield the floor on command completion */
> > > > +             OUT_PKT7(ring, CP_CONTEXT_SWITCH_YIELD, 4);
> > > > +
> > > > +             /*
> > > > +              * If dword[2:1] are non zero, they specify an addres=
s for
> > > > +              * the CP to write the value of dword[3] to on preemp=
tion
> > > > +              * complete. Write 0 to skip the write
> > > > +              */
> > > > +             OUT_RING(ring, 0x00);
> > > > +             OUT_RING(ring, 0x00);
> > > > +             /* Data value - not used if the address above is 0 */
> > > > +             OUT_RING(ring, 0x01);
> > > > +             /* generate interrupt on preemption completion */
> > > > +             OUT_RING(ring, 0x00);
> > > > +     }
> > > > +
> > > > +
> > > >       trace_msm_gpu_submit_flush(submit,
> > > >               gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER));
> > > >
> > > >       a6xx_flush(gpu, ring);
> > > > +
> > > > +     /* Check to see if we need to start preemption */
> > > > +     a6xx_preempt_trigger(gpu);
> > > >  }
> > > >
> > > >  static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
> > > > @@ -588,6 +779,89 @@ static void a6xx_set_ubwc_config(struct msm_gp=
u *gpu)
> > > >                 adreno_gpu->ubwc_config.min_acc_len << 23 | hbb_lo =
<< 21);
> > > >  }
> > > >
> > > > +static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
> > > > +{
> > > > +     struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > > > +     struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> > > > +     struct adreno_reglist_list reglist[2];
> > > > +     void *ptr =3D a6xx_gpu->pwrup_reglist_ptr;
> > > > +     struct cpu_gpu_lock *lock =3D ptr;
> > > > +     u32 *dest =3D (u32 *)&lock->regs[0];
> > > > +     int i, j;
> > > > +
> > > > +     lock->gpu_req =3D lock->cpu_req =3D lock->turn =3D 0;
> > > > +     lock->ifpc_list_len =3D ARRAY_SIZE(a7xx_ifpc_pwrup_reglist);
> > > > +     lock->preemption_list_len =3D ARRAY_SIZE(a7xx_pwrup_reglist);
> > > > +
> > > > +     /* Static IFPC-only registers */
> > > > +     reglist[0].regs =3D a7xx_ifpc_pwrup_reglist;
> > > > +     reglist[0].count =3D ARRAY_SIZE(a7xx_ifpc_pwrup_reglist);
> > > > +     lock->ifpc_list_len =3D reglist[0].count;
> > > > +
> > > > +     /* Static IFPC + preemption registers */
> > > > +     reglist[1].regs =3D a7xx_pwrup_reglist;
> > > > +     reglist[1].count =3D ARRAY_SIZE(a7xx_pwrup_reglist);
> > > > +     lock->preemption_list_len =3D reglist[1].count;
> > > > +
> > > > +     /*
> > > > +      * For each entry in each of the lists, write the offset and =
the current
> > > > +      * register value into the GPU buffer
> > > > +      */
> > > > +     for (i =3D 0; i < 2; i++) {
> > > > +             const u32 *r =3D reglist[i].regs;
> > > > +
> > > > +             for (j =3D 0; j < reglist[i].count; j++) {
> > > > +                     *dest++ =3D r[j];
> > > > +                     *dest++ =3D gpu_read(gpu, r[j]);
> > > > +             }
> > > > +     }
> > > > +
> > > > +     /*
> > > > +      * The overall register list is composed of
> > > > +      * 1. Static IFPC-only registers
> > > > +      * 2. Static IFPC + preemption registers
> > > > +      * 3. Dynamic IFPC + preemption registers (ex: perfcounter se=
lects)
> > > > +      *
> > > > +      * The first two lists are static. Size of these lists are st=
ored as
> > > > +      * number of pairs in ifpc_list_len and preemption_list_len
> > > > +      * respectively. With concurrent binning, Some of the perfcou=
nter
> > > > +      * registers being virtualized, CP needs to know the pipe id =
to program
> > > > +      * the aperture inorder to restore the same. Thus, third list=
 is a
> > > > +      * dynamic list with triplets as
> > > > +      * (<aperture, shifted 12 bits> <address> <data>), and the le=
ngth is
> > > > +      * stored as number for triplets in dynamic_list_len.
> > > > +      */
> > > > +     lock->dynamic_list_len =3D 0;
> > > > +}
> > > > +
> > > > +static int a7xx_preempt_start(struct msm_gpu *gpu)
> > > > +{
> > > > +     struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > > > +     struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> > > > +     struct msm_ringbuffer *ring =3D gpu->rb[0];
> > > > +
> > > > +     if (gpu->nr_rings <=3D 1)
> > > > +             return 0;
> > > > +
> > > > +     /* Turn CP protection off */
> > > > +     OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
> > > > +     OUT_RING(ring, 0);
> > > > +
> > > > +     a6xx_emit_set_pseudo_reg(ring, a6xx_gpu, NULL);
> > > > +
> > > > +     /* Yield the floor on command completion */
> > > > +     OUT_PKT7(ring, CP_CONTEXT_SWITCH_YIELD, 4);
> > > > +     OUT_RING(ring, 0x00);
> > > > +     OUT_RING(ring, 0x00);
> > > > +     OUT_RING(ring, 0x01);
> > > > +     /* Generate interrupt on preemption completion */
> > > > +     OUT_RING(ring, 0x00);
> > > > +
> > > > +     a6xx_flush(gpu, ring);
> > > > +
> > > > +     return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
> > > > +}
> > > > +
> > > >  static int a6xx_cp_init(struct msm_gpu *gpu)
> > > >  {
> > > >       struct msm_ringbuffer *ring =3D gpu->rb[0];
> > > > @@ -619,6 +893,8 @@ static int a6xx_cp_init(struct msm_gpu *gpu)
> > > >
> > > >  static int a7xx_cp_init(struct msm_gpu *gpu)
> > > >  {
> > > > +     struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > > > +     struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> > > >       struct msm_ringbuffer *ring =3D gpu->rb[0];
> > > >       u32 mask;
> > > >
> > > > @@ -626,6 +902,8 @@ static int a7xx_cp_init(struct msm_gpu *gpu)
> > > >       OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
> > > >       OUT_RING(ring, BIT(27));
> > > >
> > > > +     a7xx_patch_pwrup_reglist(gpu);
> > > > +
> > > >       OUT_PKT7(ring, CP_ME_INIT, 7);
> > > >
> > > >       /* Use multiple HW contexts */
> > > > @@ -656,11 +934,11 @@ static int a7xx_cp_init(struct msm_gpu *gpu)
> > > >
> > > >       /* *Don't* send a power up reg list for concurrent binning (T=
ODO) */
> > > >       /* Lo address */
> > > > -     OUT_RING(ring, 0x00000000);
> > > > +     OUT_RING(ring, lower_32_bits(a6xx_gpu->pwrup_reglist_iova));
> > > >       /* Hi address */
> > > > -     OUT_RING(ring, 0x00000000);
> > > > +     OUT_RING(ring, upper_32_bits(a6xx_gpu->pwrup_reglist_iova));
> > > >       /* BIT(31) set =3D> read the regs from the list */
> > > > -     OUT_RING(ring, 0x00000000);
> > > > +     OUT_RING(ring, BIT(31));
> > > >
> > > >       a6xx_flush(gpu, ring);
> > > >       return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
> > > > @@ -784,6 +1062,16 @@ static int a6xx_ucode_load(struct msm_gpu *gp=
u)
> > > >               msm_gem_object_set_name(a6xx_gpu->shadow_bo, "shadow"=
);
> > > >       }
> > > >
> > > > +     a6xx_gpu->pwrup_reglist_ptr =3D msm_gem_kernel_new(gpu->dev, =
PAGE_SIZE,
> > > > +                                                      MSM_BO_WC  |=
 MSM_BO_MAP_PRIV,
> > > > +                                                      gpu->aspace,=
 &a6xx_gpu->pwrup_reglist_bo,
> > > > +                                                      &a6xx_gpu->p=
wrup_reglist_iova);
> > > > +
> > > > +     if (IS_ERR(a6xx_gpu->pwrup_reglist_ptr))
> > > > +             return PTR_ERR(a6xx_gpu->pwrup_reglist_ptr);
> > > > +
> > > > +     msm_gem_object_set_name(a6xx_gpu->pwrup_reglist_bo, "pwrup_re=
glist");
> > > > +
> > > >       return 0;
> > > >  }
> > > >
> > > > @@ -1127,6 +1415,8 @@ static int hw_init(struct msm_gpu *gpu)
> > > >       if (a6xx_gpu->shadow_bo) {
> > > >               gpu_write64(gpu, REG_A6XX_CP_RB_RPTR_ADDR,
> > > >                       shadowptr(a6xx_gpu, gpu->rb[0]));
> > > > +             for (unsigned int i =3D 0; i < gpu->nr_rings; i++)
> > > > +                     a6xx_gpu->shadow[i] =3D 0;
> > > >       }
> > > >
> > > >       /* ..which means "always" on A7xx, also for BV shadow */
> > > > @@ -1135,6 +1425,8 @@ static int hw_init(struct msm_gpu *gpu)
> > > >                           rbmemptr(gpu->rb[0], bv_rptr));
> > > >       }
> > > >
> > > > +     a6xx_preempt_hw_init(gpu);
> > > > +
> > > >       /* Always come up on rb 0 */
> > > >       a6xx_gpu->cur_ring =3D gpu->rb[0];
> > > >
> > > > @@ -1180,6 +1472,10 @@ static int hw_init(struct msm_gpu *gpu)
> > > >  out:
> > > >       if (adreno_has_gmu_wrapper(adreno_gpu))
> > > >               return ret;
> > > > +
> > > > +     /* Last step - yield the ringbuffer */
> > > > +     a7xx_preempt_start(gpu);
> > > > +
> > > >       /*
> > > >        * Tell the GMU that we are done touching the GPU and it can =
start power
> > > >        * management
> > > > @@ -1557,8 +1853,13 @@ static irqreturn_t a6xx_irq(struct msm_gpu *=
gpu)
> > > >       if (status & A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
> > > >               a7xx_sw_fuse_violation_irq(gpu);
> > > >
> > > > -     if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS)
> > > > +     if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS) {
> > > >               msm_gpu_retire(gpu);
> > > > +             a6xx_preempt_trigger(gpu);
> > > > +     }
> > > > +
> > > > +     if (status & A6XX_RBBM_INT_0_MASK_CP_SW)
> > > > +             a6xx_preempt_irq(gpu);
> > > >
> > > >       return IRQ_HANDLED;
> > > >  }
> > > > @@ -2165,6 +2466,8 @@ static const struct adreno_gpu_funcs funcs =
=3D {
> > > >               .active_ring =3D a6xx_active_ring,
> > > >               .irq =3D a6xx_irq,
> > > >               .destroy =3D a6xx_destroy,
> > > > +             .submitqueue_setup =3D a6xx_preempt_submitqueue_setup=
,
> > > > +             .submitqueue_close =3D a6xx_preempt_submitqueue_close=
,
> > > >  #if defined(CONFIG_DRM_MSM_GPU_STATE)
> > > >               .show =3D a6xx_show,
> > > >  #endif
> > > > @@ -2331,6 +2634,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_devi=
ce *dev)
> > > >                               a6xx_fault_handler);
> > > >
> > > >       a6xx_calc_ubwc_config(adreno_gpu);
> > > > +     /* Set up the preemption specific bits and pieces for each ri=
ngbuffer */
> > > > +     a6xx_preempt_init(gpu);
> > > >
> > > >       return gpu;
> > > >  }
> > > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/dr=
m/msm/adreno/a6xx_gpu.h
> > > > index e3e5c53ae8af..652e49f01428 100644
> > > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > > > @@ -12,6 +12,31 @@
> > > >
> > > >  extern bool hang_debug;
> > > >
> > > > +struct cpu_gpu_lock {
> > > > +     uint32_t gpu_req;
> > > > +     uint32_t cpu_req;
> > > > +     uint32_t turn;
> > > > +     union {
> > > > +             struct {
> > > > +                     uint16_t list_length;
> > > > +                     uint16_t list_offset;
> > > > +             };
> > > > +             struct {
> > > > +                     uint8_t ifpc_list_len;
> > > > +                     uint8_t preemption_list_len;
> > > > +                     uint16_t dynamic_list_len;
> > > > +             };
> > > > +     };
> > > > +     uint64_t regs[62];
> > > > +};
> > > > +
> > > > +struct adreno_reglist_list {
> > > > +     /** @reg: List of register **/
> > > > +     const u32 *regs;
> > > > +     /** @count: Number of registers in the list **/
> > > > +     u32 count;
> > > > +};
> > > > +
> > > >  /**
> > > >   * struct a6xx_info - a6xx specific information from device table
> > > >   *
> > > > @@ -31,6 +56,24 @@ struct a6xx_gpu {
> > > >       uint64_t sqe_iova;
> > > >
> > > >       struct msm_ringbuffer *cur_ring;
> > > > +     struct msm_ringbuffer *next_ring;
> > > > +
> > > > +     struct drm_gem_object *preempt_bo[MSM_GPU_MAX_RINGS];
> > > > +     void *preempt[MSM_GPU_MAX_RINGS];
> > > > +     uint64_t preempt_iova[MSM_GPU_MAX_RINGS];
> > > > +     uint32_t last_seqno[MSM_GPU_MAX_RINGS];
> > > > +
> > > > +     atomic_t preempt_state;
> > > > +     spinlock_t eval_lock;
> > > > +     struct timer_list preempt_timer;
> > > > +
> > > > +     unsigned int preempt_level;
> > > > +     bool uses_gmem;
> > > > +     bool skip_save_restore;
> > > > +
> > > > +     struct drm_gem_object *scratch_bo;
> > > > +     void *scratch_ptr;
> > > > +     uint64_t scratch_iova;
> > > >
> > > >       struct a6xx_gmu gmu;
> > > >
> > > > @@ -38,6 +81,10 @@ struct a6xx_gpu {
> > > >       uint64_t shadow_iova;
> > > >       uint32_t *shadow;
> > > >
> > > > +     struct drm_gem_object *pwrup_reglist_bo;
> > > > +     void *pwrup_reglist_ptr;
> > > > +     uint64_t pwrup_reglist_iova;
> > > > +
> > > >       bool has_whereami;
> > > >
> > > >       void __iomem *llc_mmio;
> > > > @@ -49,6 +96,108 @@ struct a6xx_gpu {
> > > >
> > > >  #define to_a6xx_gpu(x) container_of(x, struct a6xx_gpu, base)
> > > >
> > > > +#define SCRATCH_USER_CTX_IOVA(ring_id, a6xx_gpu) \
> > > > +     (a6xx_gpu->scratch_iova + (ring_id * sizeof(uint64_t)))
> > > > +
> > > > +/*
> > > > + * In order to do lockless preemption we use a simple state machin=
e to progress
> > > > + * through the process.
> > > > + *
> > > > + * PREEMPT_NONE - no preemption in progress.  Next state START.
> > > > + * PREEMPT_START - The trigger is evaluating if preemption is poss=
ible. Next
> > > > + * states: TRIGGERED, NONE
> > > > + * PREEMPT_FINISH - An intermediate state before moving back to NO=
NE. Next
> > > > + * state: NONE.
> > > > + * PREEMPT_TRIGGERED: A preemption has been executed on the hardwa=
re. Next
> > > > + * states: FAULTED, PENDING
> > > > + * PREEMPT_FAULTED: A preemption timed out (never completed). This=
 will trigger
> > > > + * recovery.  Next state: N/A
> > > > + * PREEMPT_PENDING: Preemption complete interrupt fired - the call=
back is
> > > > + * checking the success of the operation. Next state: FAULTED, NON=
E.
> > > > + */
> > > > +
> > > > +enum a6xx_preempt_state {
> > > > +     PREEMPT_NONE =3D 0,
> > > > +     PREEMPT_START,
> > > > +     PREEMPT_FINISH,
> > > > +     PREEMPT_TRIGGERED,
> > > > +     PREEMPT_FAULTED,
> > > > +     PREEMPT_PENDING,
> > > > +};
> > > > +
> > > > +/*
> > > > + * struct a6xx_preempt_record is a shared buffer between the micro=
code and the
> > > > + * CPU to store the state for preemption. The record itself is muc=
h larger
> > > > + * (2112k) but most of that is used by the CP for storage.
> > > > + *
> > > > + * There is a preemption record assigned per ringbuffer. When the =
CPU triggers a
> > > > + * preemption, it fills out the record with the useful information=
 (wptr, ring
> > > > + * base, etc) and the microcode uses that information to set up th=
e CP following
> > > > + * the preemption.  When a ring is switched out, the CP will save =
the ringbuffer
> > > > + * state back to the record. In this way, once the records are pro=
perly set up
> > > > + * the CPU can quickly switch back and forth between ringbuffers b=
y only
> > > > + * updating a few registers (often only the wptr).
> > > > + *
> > > > + * These are the CPU aware registers in the record:
> > > > + * @magic: Must always be 0xAE399D6EUL
> > > > + * @info: Type of the record - written 0 by the CPU, updated by th=
e CP
> > > > + * @errno: preemption error record
> > > > + * @data: Data field in YIELD and SET_MARKER packets, Written and =
used by CP
> > > > + * @cntl: Value of RB_CNTL written by CPU, save/restored by CP
> > > > + * @rptr: Value of RB_RPTR written by CPU, save/restored by CP
> > > > + * @wptr: Value of RB_WPTR written by CPU, save/restored by CP
> > > > + * @_pad: Reserved/padding
> > > > + * @rptr_addr: Value of RB_RPTR_ADDR_LO|HI written by CPU, save/re=
stored by CP
> > > > + * @rbase: Value of RB_BASE written by CPU, save/restored by CP
> > > > + * @counter: GPU address of the storage area for the preemption co=
unters
> > > > + */
> > > > +struct a6xx_preempt_record {
> > > > +     u32 magic;
> > > > +     u32 info;
> > > > +     u32 errno;
> > > > +     u32 data;
> > > > +     u32 cntl;
> > > > +     u32 rptr;
> > > > +     u32 wptr;
> > > > +     u32 _pad;
> > > > +     u64 rptr_addr;
> > > > +     u64 rbase;
> > > > +     u64 counter;
> > > > +     u64 bv_rptr_addr;
> > > > +};
> > > > +
> > > > +#define A6XX_PREEMPT_RECORD_MAGIC 0xAE399D6EUL
> > > > +
> > > > +#define PREEMPT_RECORD_SIZE_FALLBACK(size) \
> > > > +     ((size) =3D=3D 0 ? 4192 * SZ_1K : (size))
> > > > +
> > > > +#define PREEMPT_OFFSET_SMMU_INFO 0
> > > > +#define PREEMPT_OFFSET_PRIV_NON_SECURE (PREEMPT_OFFSET_SMMU_INFO +=
 4096)
> > > > +#define PREEMPT_OFFSET_PRIV_SECURE(size) \
> > > > +     (PREEMPT_OFFSET_PRIV_NON_SECURE + PREEMPT_RECORD_SIZE_FALLBAC=
K(size))
> > > > +#define PREEMPT_SIZE(size) \
> > > > +     (PREEMPT_OFFSET_PRIV_SECURE(size) + PREEMPT_RECORD_SIZE_FALLB=
ACK(size))
> > > > +
> > > > +/*
> > > > + * The preemption counter block is a storage area for the value of=
 the
> > > > + * preemption counters that are saved immediately before context s=
witch. We
> > > > + * append it on to the end of the allocation for the preemption re=
cord.
> > > > + */
> > > > +#define A6XX_PREEMPT_COUNTER_SIZE (16 * 4)
> > > > +
> > > > +#define A6XX_PREEMPT_USER_RECORD_SIZE (192 * 1024)
> > > > +
> > > > +struct a7xx_cp_smmu_info {
> > > > +     u32 magic;
> > > > +     u32 _pad4;
> > > > +     u64 ttbr0;
> > > > +     u32 asid;
> > > > +     u32 context_idr;
> > > > +     u32 context_bank;
> > > > +};
> > > > +
> > > > +#define GEN7_CP_SMMU_INFO_MAGIC 0x241350d5UL
> > > > +
> > > >  /*
> > > >   * Given a register and a count, return a value to program into
> > > >   * REG_CP_PROTECT_REG(n) - this will block both reads and writes f=
or
> > > > @@ -106,6 +255,25 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, s=
truct device_node *node);
> > > >  int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device=
_node *node);
> > > >  void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
> > > >
> > > > +void a6xx_preempt_init(struct msm_gpu *gpu);
> > > > +void a6xx_preempt_hw_init(struct msm_gpu *gpu);
> > > > +void a6xx_preempt_trigger(struct msm_gpu *gpu);
> > > > +void a6xx_preempt_irq(struct msm_gpu *gpu);
> > > > +void a6xx_preempt_fini(struct msm_gpu *gpu);
> > > > +int a6xx_preempt_submitqueue_setup(struct msm_gpu *gpu,
> > > > +             struct msm_gpu_submitqueue *queue);
> > > > +void a6xx_preempt_submitqueue_close(struct msm_gpu *gpu,
> > > > +             struct msm_gpu_submitqueue *queue);
> > > > +
> > > > +/* Return true if we are in a preempt state */
> > > > +static inline bool a6xx_in_preempt(struct a6xx_gpu *a6xx_gpu)
> > > > +{
> > > > +     int preempt_state =3D atomic_read(&a6xx_gpu->preempt_state);
> > > > +
> > > > +     return !(preempt_state =3D=3D PREEMPT_NONE ||
> > > > +                     preempt_state =3D=3D PREEMPT_FINISH);
> > > > +}
> > > > +
> > > >  void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp=
,
> > > >                      bool suspended);
> > > >  unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu);
> > > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gp=
u/drm/msm/adreno/a6xx_preempt.c
> > > > new file mode 100644
> > > > index 000000000000..0d402a3bcf5a
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> > > > @@ -0,0 +1,434 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/* Copyright (c) 2018, The Linux Foundation. All rights reserved. =
*/
> > > > +/* Copyright (c) 2023 Collabora, Ltd. */
> > > > +/* Copyright (c) 2024 Valve Corporation */
> > > > +
> > > > +#include "msm_gem.h"
> > > > +#include "a6xx_gpu.h"
> > > > +#include "a6xx_gmu.xml.h"
> > > > +#include "msm_mmu.h"
> > > > +
> > > > +#define FENCE_STATUS_WRITEDROPPED0_MASK 0x1
> > > > +#define FENCE_STATUS_WRITEDROPPED1_MASK 0x2
> > > > +
> > > > +/*
> > > > + * Try to transition the preemption state from old to new. Return
> > > > + * true on success or false if the original state wasn't 'old'
> > > > + */
> > > > +static inline bool try_preempt_state(struct a6xx_gpu *a6xx_gpu,
> > > > +             enum a6xx_preempt_state old, enum a6xx_preempt_state =
new)
> > > > +{
> > > > +     enum a6xx_preempt_state cur =3D atomic_cmpxchg(&a6xx_gpu->pre=
empt_state,
> > > > +             old, new);
> > > > +
> > > > +     return (cur =3D=3D old);
> > > > +}
> > > > +
> > > > +/*
> > > > + * Force the preemption state to the specified state.  This is use=
d in cases
> > > > + * where the current state is known and won't change
> > > > + */
> > > > +static inline void set_preempt_state(struct a6xx_gpu *gpu,
> > > > +             enum a6xx_preempt_state new)
> > > > +{
> > > > +     /*
> > > > +      * preempt_state may be read by other cores trying to trigger=
 a
> > > > +      * preemption or in the interrupt handler so barriers are nee=
ded
> > > > +      * before...
> > > > +      */
> > > > +     smp_mb__before_atomic();
> > > > +     atomic_set(&gpu->preempt_state, new);
> > > > +     /* ... and after*/
> > > > +     smp_mb__after_atomic();
> > > > +}
> > > > +
> > > > +/* Write the most recent wptr for the given ring into the hardware=
 */
> > > > +static inline void update_wptr(struct msm_gpu *gpu, struct msm_rin=
gbuffer *ring)
> > > > +{
> > > > +     unsigned long flags;
> > > > +     uint32_t wptr, cur_wptr;
> > > > +
> > > > +     if (!ring)
> > > > +             return;
> > > > +
> > > > +     spin_lock_irqsave(&ring->preempt_lock, flags);
> > > > +
> > > > +     if (ring->skip_inline_wptr) {
> > > > +             wptr =3D get_wptr(ring);
> > > > +
> > > > +             gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
> > > > +
> > > > +             ring->skip_inline_wptr =3D false;
> > > > +     }
> > > > +
> > > > +     spin_unlock_irqrestore(&ring->preempt_lock, flags);
> > > > +}
> > > > +
> > > > +/* Return the highest priority ringbuffer with something in it */
> > > > +static struct msm_ringbuffer *get_next_ring(struct msm_gpu *gpu)
> > > > +{
> > > > +     struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > > > +     struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> > > > +
> > > > +     unsigned long flags;
> > > > +     int i;
> > > > +
> > > > +     for (i =3D 0; i < gpu->nr_rings; i++) {
> > > > +             bool empty;
> > > > +             struct msm_ringbuffer *ring =3D gpu->rb[i];
> > > > +
> > > > +             spin_lock_irqsave(&ring->preempt_lock, flags);
> > > > +             empty =3D (get_wptr(ring) =3D=3D gpu->funcs->get_rptr=
(gpu, ring));
> > > > +             if (!empty && ring =3D=3D a6xx_gpu->cur_ring)
> > > > +                     empty =3D ring->memptrs->fence =3D=3D a6xx_gp=
u->last_seqno[i];
> > > > +             spin_unlock_irqrestore(&ring->preempt_lock, flags);
> > > > +
> > > > +             if (!empty)
> > > > +                     return ring;
> > > > +     }
> > > > +
> > > > +     return NULL;
> > > > +}
> > > > +
> > > > +static void a6xx_preempt_timer(struct timer_list *t)
> > > > +{
> > > > +     struct a6xx_gpu *a6xx_gpu =3D from_timer(a6xx_gpu, t, preempt=
_timer);
> > > > +     struct msm_gpu *gpu =3D &a6xx_gpu->base.base;
> > > > +     struct drm_device *dev =3D gpu->dev;
> > > > +
> > > > +     if (!try_preempt_state(a6xx_gpu, PREEMPT_TRIGGERED, PREEMPT_F=
AULTED))
> > > > +             return;
> > > > +
> > > > +     dev_err(dev->dev, "%s: preemption timed out\n", gpu->name);
> > > > +     kthread_queue_work(gpu->worker, &gpu->recover_work);
> > > > +}
> > > > +
> > > > +void a6xx_preempt_irq(struct msm_gpu *gpu)
> > > > +{
> > > > +     uint32_t status;
> > > > +     struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > > > +     struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> > > > +     struct drm_device *dev =3D gpu->dev;
> > > > +
> > > > +     if (!try_preempt_state(a6xx_gpu, PREEMPT_TRIGGERED, PREEMPT_P=
ENDING))
> > > > +             return;
> > > > +
> > > > +     /* Delete the preemption watchdog timer */
> > > > +     del_timer(&a6xx_gpu->preempt_timer);
> > > > +
> > > > +     /*
> > > > +      * The hardware should be setting the stop bit of CP_CONTEXT_=
SWITCH_CNTL
> > > > +      * to zero before firing the interrupt, but there is a non ze=
ro chance
> > > > +      * of a hardware condition or a software race that could set =
it again
> > > > +      * before we have a chance to finish. If that happens, log an=
d go for
> > > > +      * recovery
> > > > +      */
> > > > +     status =3D gpu_read(gpu, REG_A6XX_CP_CONTEXT_SWITCH_CNTL);
> > > > +     if (unlikely(status & 0x1)) {
> > > > +             DRM_DEV_ERROR(&gpu->pdev->dev,
> > > > +                                       "!!!!!!!!!!!!!!!! preemptio=
n faulted !!!!!!!!!!!!!! irq\n");
> > > > +             set_preempt_state(a6xx_gpu, PREEMPT_FAULTED);
> > > > +             dev_err(dev->dev, "%s: Preemption failed to complete\=
n",
> > > > +                     gpu->name);
> > > > +             kthread_queue_work(gpu->worker, &gpu->recover_work);
> > > > +             return;
> > > > +     }
> > > > +
> > > > +     a6xx_gpu->cur_ring =3D a6xx_gpu->next_ring;
> > > > +     a6xx_gpu->next_ring =3D NULL;
> > > > +
> > > > +     /* Make sure the write to cur_ring is posted before the chang=
e in state */
> > > > +     wmb();
> > > > +
> > > > +     set_preempt_state(a6xx_gpu, PREEMPT_FINISH);
> > > > +
> > > > +     update_wptr(gpu, a6xx_gpu->cur_ring);
> > > > +
> > > > +     set_preempt_state(a6xx_gpu, PREEMPT_NONE);
> > > > +
> > > > +     /*
> > > > +      * Retrigger preemption to avoid a deadlock that might occur =
when preemption
> > > > +      * is skipped due to it being already in flight when requeste=
d.
> > > > +      */
> > > > +     a6xx_preempt_trigger(gpu);
> > > > +}
> > > > +
> > > > +void a6xx_preempt_hw_init(struct msm_gpu *gpu)
> > > > +{
> > > > +     struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > > > +     struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> > > > +     int i;
> > > > +
> > > > +     /* No preemption if we only have one ring */
> > > > +     if (gpu->nr_rings =3D=3D 1)
> > > > +             return;
> > > > +
> > > > +     for (i =3D 0; i < gpu->nr_rings; i++) {
> > > > +             struct a6xx_preempt_record *record_ptr =3D
> > > > +                     a6xx_gpu->preempt[i] + PREEMPT_OFFSET_PRIV_NO=
N_SECURE;
> > > > +             record_ptr->wptr =3D 0;
> > > > +             record_ptr->rptr =3D 0;
> > > > +             record_ptr->rptr_addr =3D shadowptr(a6xx_gpu, gpu->rb=
[i]);
> > > > +             record_ptr->info =3D 0;
> > > > +             record_ptr->data =3D 0;
> > > > +             record_ptr->rbase =3D gpu->rb[i]->iova;
> > > > +     }
> > > > +
> > > > +     /* Write a 0 to signal that we aren't switching pagetables */
> > > > +     gpu_write64(gpu, REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO, 0);
> > > > +
> > > > +     /* Enable the GMEM save/restore feature for preemption */
> > > > +     gpu_write(gpu, REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE, =
0x1);
> > > > +
> > > > +     /* Reset the preemption state */
> > > > +     set_preempt_state(a6xx_gpu, PREEMPT_NONE);
> > > > +
> > > > +     spin_lock_init(&a6xx_gpu->eval_lock);
> > > > +
> > > > +     /* Always come up on rb 0 */
> > > > +     a6xx_gpu->cur_ring =3D gpu->rb[0];
> > > > +}
> > > > +
> > > > +void a6xx_preempt_trigger(struct msm_gpu *gpu)
> > > > +{
> > > > +     struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > > > +     struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> > > > +     u64 preempt_offset_priv_secure;
> > > > +     unsigned long flags;
> > > > +     struct msm_ringbuffer *ring;
> > > > +     uint64_t user_ctx_iova;
> > > > +     unsigned int cntl;
> > > > +
> > > > +     if (gpu->nr_rings =3D=3D 1)
> > > > +             return;
> > > > +
> > > > +     /*
> > > > +      * Lock to make sure another thread attempting preemption doe=
sn't skip it
> > > > +      * while we are still evaluating the next ring. This makes su=
re the other
> > > > +      * thread does start preemption if we abort it and avoids a s=
oft lock.
> > > > +      */
> > > > +     spin_lock_irqsave(&a6xx_gpu->eval_lock, flags);
> > > > +
> > > > +     /*
> > > > +      * Try to start preemption by moving from NONE to START. If
> > > > +      * unsuccessful, a preemption is already in flight
> > > > +      */
> > > > +     if (!try_preempt_state(a6xx_gpu, PREEMPT_NONE, PREEMPT_START)=
) {
> > > > +             spin_unlock_irqrestore(&a6xx_gpu->eval_lock, flags);
> > > > +             return;
> > > > +     }
> > > > +
> > > > +     cntl =3D (((a6xx_gpu->preempt_level << 6) & 0xC0) |
> > > > +             ((a6xx_gpu->skip_save_restore << 9) & 0x200) |
> > > > +             ((a6xx_gpu->uses_gmem << 8) & 0x100) | 0x1);
> > > > +
> > > > +     /* Get the next ring to preempt to */
> > > > +     ring =3D get_next_ring(gpu);
> > > > +
> > > > +     /*
> > > > +      * If no ring is populated or the highest priority ring is th=
e current
> > > > +      * one do nothing except to update the wptr to the latest and=
 greatest
> > > > +      */
> > > > +     if (!ring || (a6xx_gpu->cur_ring =3D=3D ring)) {
> > > > +             set_preempt_state(a6xx_gpu, PREEMPT_FINISH);
> > > > +             update_wptr(gpu, a6xx_gpu->cur_ring);
> > > > +             set_preempt_state(a6xx_gpu, PREEMPT_NONE);
> > > > +             spin_unlock_irqrestore(&a6xx_gpu->eval_lock, flags);
> > > > +             return;
> > > > +     }
> > > > +
> > > > +     spin_unlock_irqrestore(&a6xx_gpu->eval_lock, flags);
> > > > +
> > > > +     spin_lock_irqsave(&ring->preempt_lock, flags);
> > > > +
> > > > +     struct a7xx_cp_smmu_info *smmu_info_ptr =3D
> > > > +             a6xx_gpu->preempt[ring->id] + PREEMPT_OFFSET_SMMU_INF=
O;
> > > > +     struct a6xx_preempt_record *record_ptr =3D
> > > > +             a6xx_gpu->preempt[ring->id] + PREEMPT_OFFSET_PRIV_NON=
_SECURE;
> > > > +     u64 ttbr0 =3D ring->memptrs->ttbr0;
> > > > +     u32 context_idr =3D ring->memptrs->context_idr;
> > > > +
> > > > +     smmu_info_ptr->ttbr0 =3D ttbr0;
> > > > +     smmu_info_ptr->context_idr =3D context_idr;
> > > > +     record_ptr->wptr =3D get_wptr(ring);
> > > > +
> > > > +     /*
> > > > +      * The GPU will write the wptr we set above when we preempt. =
Reset
> > > > +      * skip_inline_wptr to make sure that we don't write WPTR to =
the same
> > > > +      * thing twice. It's still possible subsequent submissions wi=
ll update
> > > > +      * wptr again, in which case they will set the flag to true. =
This has
> > > > +      * to be protected by the lock for setting the flag and updat=
ing wptr
> > > > +      * to be atomic.
> > > > +      */
> > > > +     ring->skip_inline_wptr =3D false;
> > > > +
> > > > +     spin_unlock_irqrestore(&ring->preempt_lock, flags);
> > > > +
> > > > +     gpu_write64(gpu,
> > > > +             REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO,
> > > > +             a6xx_gpu->preempt_iova[ring->id] + PREEMPT_OFFSET_SMM=
U_INFO);
> > > > +
> > > > +     gpu_write64(gpu,
> > > > +             REG_A6XX_CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_AD=
DR,
> > > > +             a6xx_gpu->preempt_iova[ring->id] + PREEMPT_OFFSET_PRI=
V_NON_SECURE);
> > > > +
> > > > +     preempt_offset_priv_secure =3D
> > > > +             PREEMPT_OFFSET_PRIV_SECURE(adreno_gpu->info->preempt_=
record_size);
> > > > +     gpu_write64(gpu,
> > > > +             REG_A6XX_CP_CONTEXT_SWITCH_PRIV_SECURE_RESTORE_ADDR,
> > > > +             a6xx_gpu->preempt_iova[ring->id] + preempt_offset_pri=
v_secure);
> > > > +
> > > > +     /*
> > > > +      * Use the user context iova from the scratch memory that the=
 CP may
> > > > +      * have written as part of the ring switch out.
> > > > +      */
> > > > +     user_ctx_iova =3D *((uint64_t *)a6xx_gpu->scratch_ptr + ring-=
>id);
> > > > +
> > > > +     gpu_write64(gpu,
> > > > +             REG_A6XX_CP_CONTEXT_SWITCH_NON_PRIV_RESTORE_ADDR,
> > > > +             user_ctx_iova);
> > > > +
> > > > +     a6xx_gpu->next_ring =3D ring;
> > > > +
> > > > +     /* Start a timer to catch a stuck preemption */
> > > > +     mod_timer(&a6xx_gpu->preempt_timer, jiffies + msecs_to_jiffie=
s(10000));
> > > > +
> > > > +     /* Set the preemption state to triggered */
> > > > +     set_preempt_state(a6xx_gpu, PREEMPT_TRIGGERED);
> > > > +
> > > > +     /* Make sure any previous writes to WPTR are posted */
> > > > +     gpu_read(gpu, REG_A6XX_CP_RB_WPTR);
> > > > +
> > > > +     /* Make sure everything is written before hitting the button =
*/
> > > > +     wmb();
> > > > +
> > > > +     /* Trigger the preemption */
> > > > +     gpu_write(gpu, REG_A6XX_CP_CONTEXT_SWITCH_CNTL, cntl);
> > > > +}
> > > > +
> > > > +static int preempt_init_ring(struct a6xx_gpu *a6xx_gpu,
> > > > +             struct msm_ringbuffer *ring)
> > > > +{
> > > > +     struct adreno_gpu *adreno_gpu =3D &a6xx_gpu->base;
> > > > +     struct msm_gpu *gpu =3D &adreno_gpu->base;
> > > > +     struct drm_gem_object *bo =3D NULL;
> > > > +     phys_addr_t ttbr;
> > > > +     u64 iova =3D 0;
> > > > +     void *ptr;
> > > > +     int asid;
> > > > +
> > > > +     ptr =3D msm_gem_kernel_new(gpu->dev,
> > > > +             PREEMPT_SIZE(adreno_gpu->info->preempt_record_size),
> > > > +             MSM_BO_WC | MSM_BO_MAP_PRIV, gpu->aspace, &bo, &iova)=
;
> > > > +
> > > > +     memset(ptr, 0, PREEMPT_SIZE(adreno_gpu->info->preempt_record_=
size));
> > > > +
> > > > +     if (IS_ERR(ptr))
> > > > +             return PTR_ERR(ptr);
> > > > +
> > > > +     a6xx_gpu->preempt_bo[ring->id] =3D bo;
> > > > +     a6xx_gpu->preempt_iova[ring->id] =3D iova;
> > > > +     a6xx_gpu->preempt[ring->id] =3D ptr;
> > > > +
> > > > +     struct a7xx_cp_smmu_info *smmu_info_ptr =3D ptr + PREEMPT_OFF=
SET_SMMU_INFO;
> > > > +     struct a6xx_preempt_record *record_ptr =3D ptr + PREEMPT_OFFS=
ET_PRIV_NON_SECURE;
> > > > +
> > > > +     msm_iommu_pagetable_params(gpu->aspace->mmu, &ttbr, &asid);
> > > > +
> > > > +     smmu_info_ptr->magic =3D GEN7_CP_SMMU_INFO_MAGIC;
> > > > +     smmu_info_ptr->ttbr0 =3D ttbr;
> > > > +     smmu_info_ptr->asid =3D 0xdecafbad;
> > > > +     smmu_info_ptr->context_idr =3D 0;
> > > > +
> > > > +     /* Set up the defaults on the preemption record */
> > > > +     record_ptr->magic =3D A6XX_PREEMPT_RECORD_MAGIC;
> > > > +     record_ptr->info =3D 0;
> > > > +     record_ptr->data =3D 0;
> > > > +     record_ptr->rptr =3D 0;
> > > > +     record_ptr->wptr =3D 0;
> > > > +     record_ptr->cntl =3D MSM_GPU_RB_CNTL_DEFAULT;
> > > > +     record_ptr->rbase =3D ring->iova;
> > > > +     record_ptr->counter =3D 0;
> > > > +     record_ptr->bv_rptr_addr =3D rbmemptr(ring, bv_rptr);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +void a6xx_preempt_fini(struct msm_gpu *gpu)
> > > > +{
> > > > +     struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > > > +     struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> > > > +     int i;
> > > > +
> > > > +     for (i =3D 0; i < gpu->nr_rings; i++)
> > > > +             msm_gem_kernel_put(a6xx_gpu->preempt_bo[i], gpu->aspa=
ce);
> > > > +}
> > > > +
> > > > +void a6xx_preempt_init(struct msm_gpu *gpu)
> > > > +{
> > > > +     struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > > > +     struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> > > > +     int i;
> > > > +
> > > > +     /* No preemption if we only have one ring */
> > > > +     if (gpu->nr_rings <=3D 1)
> > > > +             return;
> > > > +
> > > > +     for (i =3D 0; i < gpu->nr_rings; i++) {
> > > > +             if (preempt_init_ring(a6xx_gpu, gpu->rb[i]))
> > > > +                     goto fail;
> > > > +     }
> > > > +
> > > > +     /* TODO: make this configurable? */
> > > > +     a6xx_gpu->preempt_level =3D 1;
> > > > +     a6xx_gpu->uses_gmem =3D 1;
> > > > +     a6xx_gpu->skip_save_restore =3D 1;
> > > > +
> > > > +     a6xx_gpu->scratch_ptr  =3D msm_gem_kernel_new(gpu->dev,
> > > > +                     gpu->nr_rings * sizeof(uint64_t), MSM_BO_WC,
> > > > +                     gpu->aspace, &a6xx_gpu->scratch_bo,
> > > > +                     &a6xx_gpu->scratch_iova);
> > > > +
> > > > +     if (IS_ERR(a6xx_gpu->scratch_ptr))
> > > > +             goto fail;
> > > > +
> > > > +     timer_setup(&a6xx_gpu->preempt_timer, a6xx_preempt_timer, 0);
> > > > +
> > > > +     return;
> > > > +fail:
> > > > +     /*
> > > > +      * On any failure our adventure is over. Clean up and
> > > > +      * set nr_rings to 1 to force preemption off
> > > > +      */
> > > > +     a6xx_preempt_fini(gpu);
> > > > +     gpu->nr_rings =3D 1;
> > > > +
> > > > +     return;
> > > > +}
> > > > +
> > > > +void a6xx_preempt_submitqueue_close(struct msm_gpu *gpu,
> > > > +             struct msm_gpu_submitqueue *queue)
> > > > +{
> > > > +     if (!queue->bo)
> > > > +             return;
> > > > +
> > > > +     msm_gem_kernel_put(queue->bo, gpu->aspace);
> > > > +}
> > > > +
> > > > +int a6xx_preempt_submitqueue_setup(struct msm_gpu *gpu,
> > > > +             struct msm_gpu_submitqueue *queue)
> > > > +{
> > > > +     void *ptr;
> > > > +
> > > > +     /*
> > > > +      * Create a per submitqueue buffer for the CP to save and res=
tore user
> > > > +      * specific information such as the VPC streamout data.
> > > > +      */
> > > > +     ptr =3D msm_gem_kernel_new(gpu->dev, A6XX_PREEMPT_USER_RECORD=
_SIZE,
> > > > +                     MSM_BO_WC, gpu->aspace, &queue->bo, &queue->b=
o_iova);
> > > > +
> > > > +     if (IS_ERR(ptr))
> > > > +             return PTR_ERR(ptr);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm=
/msm/msm_ringbuffer.h
> > > > index 40791b2ade46..7dde6a312511 100644
> > > > --- a/drivers/gpu/drm/msm/msm_ringbuffer.h
> > > > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
> > > > @@ -36,6 +36,7 @@ struct msm_rbmemptrs {
> > > >
> > > >       volatile struct msm_gpu_submit_stats stats[MSM_GPU_SUBMIT_STA=
TS_COUNT];
> > > >       volatile u64 ttbr0;
> > > > +     volatile u32 context_idr;
> > > >  };
> > > >
> > > >  struct msm_cp_state {
> > > > @@ -100,6 +101,12 @@ struct msm_ringbuffer {
> > > >        * preemption.  Can be aquired from irq context.
> > > >        */
> > > >       spinlock_t preempt_lock;
> > > > +
> > > > +     /*
> > > > +      * Whether we skipped writing wptr and it needs to be updated=
 in the
> > > > +      * future when the ring becomes current.
> > > > +      */
> > > > +     bool skip_inline_wptr;
> > > >  };
> > > >
> > > >  struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int=
 id,
> > > >
> > > > --
> > > > 2.46.0
> > > >
> > > >

