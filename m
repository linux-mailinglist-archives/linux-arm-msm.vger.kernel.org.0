Return-Path: <linux-arm-msm+bounces-32320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21089984948
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 18:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D577428133D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 16:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E7B31AB6F3;
	Tue, 24 Sep 2024 16:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2F3XWeM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26F51AB534;
	Tue, 24 Sep 2024 16:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727194319; cv=none; b=ErIBnbUqrNcOrXLCbeLlNpyZMh58Wx0EnLvpL5GFLObr70kjqe4WloF/Q3TF+3UKaBQomm/RYo/KGmNk8TZa5yz1uc6DIUhKoM77qa2O5tOyT3qGvDo1sXcNgG4xq8K2VIzbH701bHosQtmC5sENPEMhA6266HkpnQ+ZGc9v5s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727194319; c=relaxed/simple;
	bh=JjRZzm00PbFmFmIh22FAdPYC7BclagHwlRtb53nlnes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kBumdSyHp9q/9lEwHFjFlghme6fRmHzymNB0pSIdi6us/+WoG5quRTXYLdRfaQsKGqAIrZHBHb3R5MnjMORfpCsqNNavh9nufTNgtJ02D2MUZIDdCUrV/hZXQnGQiZxx8ZlzjukJ3gBMX46/TKbmwtvHt1TsDicU97rE/cvk6EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2F3XWeM; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-82cf3286261so212839939f.0;
        Tue, 24 Sep 2024 09:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727194317; x=1727799117; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sWeglnw6BZKB/VuyrSzHmYia1dbxFZbiLz4gI3HzQMY=;
        b=J2F3XWeMQ45FjedoaJ18E5GcvQ/CI32D58W9wrCiuzLw+v1ha98YH7qu2N/7rvsXt5
         YHsAmkE7M6VfiI13dAbG8zmIcfn6EE+Ky1vT981qmcQ/AE0/Uhc8Usrhs/QLeh1Vr3nD
         bZJPBAIpcPiWMy6PEP67Y4/JsM64DrHNJuFu/xz0KQce9GnV9JZMMaEthkm5Ze5b9P0D
         36WPZRjQmBr1IsO7UmYYgiD9SmsDblGvqb/GCTAOeYOhdz4ypdcSx5pWEviNn1lOLMT/
         m/JN4EEkx93qJn0hINXklJ5vmV1Skfe6guqnPOx0cnSODeEdMIhS9ZepXLTXBIW7wd+5
         zT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727194317; x=1727799117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWeglnw6BZKB/VuyrSzHmYia1dbxFZbiLz4gI3HzQMY=;
        b=Pw3PlW0oRdEE+rhZIQJ778xYmvSIk1CCqXKu4aapH6HUF528le7lUZbGUykQZ5bHw3
         OMh7douBltL1GGGhMBOStX2FeT0z3LFv/jwRFdeQgw+CMzQrBaps5vt45gDEEUH1A4CL
         eoZuk1QnnuMA2+ObiSAOjhz3176DI61CjFHmUBYQO/c/ZPZ7Bp6EVX6JGzaGM3PUmprU
         c1dXMIqVQEbEWrSr2qo6CcRCJn5nSd8rG/R9wn3d59e/ziZi26NweJHPVNQiD71T3i+d
         pSRju/50s96v14WRorXp15Pehz5yv3TMcv4Gr1cRzGMegoopn1+/XtkBHzaZCxeRb1Fu
         oG3g==
X-Forwarded-Encrypted: i=1; AJvYcCWT4/pK2ZiKuibcCkM8Wp+cXNDttPpfxVY5DpHvHMNY6XfrRM6dEiGkkvoCHbJOJxy4mztl7hCa+G8fvGlg@vger.kernel.org, AJvYcCXrrFfrJfZyibRg0tB6Sxo5gZhN3iiKmCcdarlpGpUiMUs0p9//u9EZ3lg3idebla4SiscKwtsp7u+QFS3G@vger.kernel.org
X-Gm-Message-State: AOJu0YyEQbOkeNzlFpwgFIilfqnxqhRTd62A0hS7U00f197vAsL56nFZ
	tomM9etcjO1zPZ37RKp4sHiGL19atVmMlKBYkvS2ZW6PGwWPEMza8YuzyZRnATn+X090jDnXRjx
	Eh/5pjtuzlPqgaGphAXe5dOKxZCU=
X-Google-Smtp-Source: AGHT+IG4Ne74kYPMdaaO0rPyy8apUK0dOKNk+6D4i79VukxVDUPWLBfaAP9Hxec3LUQE3xdsiYRvJgLiIFoB95h3b34=
X-Received: by 2002:a05:6e02:2162:b0:3a0:a0bd:f92b with SMTP id
 e9e14a558f8ab-3a26d785d84mr81805ab.10.1727194316674; Tue, 24 Sep 2024
 09:11:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913195132.8282-1-robdclark@gmail.com> <CACu1E7ECxJLH8+GqUuWH=+oM=N=fgkpBBqJ8ShrSwbdZmw+nZQ@mail.gmail.com>
In-Reply-To: <CACu1E7ECxJLH8+GqUuWH=+oM=N=fgkpBBqJ8ShrSwbdZmw+nZQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 24 Sep 2024 09:11:44 -0700
Message-ID: <CAF6AEGsJpLwyXK7_TH0jZx64A1rOX9F23dL5TZUJUBV=tsKLCA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx+: Insert a fence wait before SMMU table update
To: Connor Abbott <cwabbott0@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>, 
	Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2024 at 9:51=E2=80=AFAM Connor Abbott <cwabbott0@gmail.com>=
 wrote:
>
> On Fri, Sep 13, 2024 at 8:51=E2=80=AFPM Rob Clark <robdclark@gmail.com> w=
rote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The CP_SMMU_TABLE_UPDATE _should_ be waiting for idle, but on some
> > devices (x1-85, possibly others), it seems to pass that barrier while
> > there are still things in the event completion FIFO waiting to be
> > written back to memory.
> >
> > Work around that by adding a fence wait before context switch.  The
> > CP_EVENT_WRITE that writes the fence is the last write from a submit,
> > so seeing this value hit memory is a reliable indication that it is
> > safe to proceed with the context switch.
> >
> > Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/63
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index bcaec86ac67a..ba5b35502e6d 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -101,9 +101,10 @@ static void get_stats_counter(struct msm_ringbuffe=
r *ring, u32 counter,
> >  }
> >
> >  static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
> > -               struct msm_ringbuffer *ring, struct msm_file_private *c=
tx)
> > +               struct msm_ringbuffer *ring, struct msm_gem_submit *sub=
mit)
> >  {
> >         bool sysprof =3D refcount_read(&a6xx_gpu->base.base.sysprof_act=
ive) > 1;
> > +       struct msm_file_private *ctx =3D submit->queue->ctx;
> >         struct adreno_gpu *adreno_gpu =3D &a6xx_gpu->base;
> >         phys_addr_t ttbr;
> >         u32 asid;
> > @@ -115,6 +116,13 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6=
xx_gpu,
> >         if (msm_iommu_pagetable_params(ctx->aspace->mmu, &ttbr, &asid))
> >                 return;
> >
> > +       /* Wait for previous submit to complete before continuing: */
> > +       OUT_PKT7(ring, CP_WAIT_TIMESTAMP, 4);
>
> CP_WAIT_TIMESTAMP doesn't exist on a6xx, so this won't work there. I
> don't know if the bug exists on a6xx, but I'd be inclined to say it
> has always existed and we just never hit it because it requires some
> very specific timing conditions. We can make it work on a6xx by using
> CP_WAIT_REG_MEM and waiting for it to equal the exact value.

I've been unable to reproduce this on a690, despite running at a
similar fps (so similar rate of CP_SMMU_TABLE_UPDATEs).  I guess I
can't rule out that this is just _harder_ to hit on a6xx due to the
shallower pipeline.  It would be nice to get some data points on other
a7xx, but I only have the one.

I did attempt to come up with an igt stand-alone reproducer by just
ping-ponging between contexts (with fences to force context switches)
with 1000's of CP_EVENT_WRITE's, to no avail.  I guess I'd need to
actually setup a blit or draw to make the event-write asynchronous,
but that would be a lot harder to do in igt.

I guess for now I'll re-work this patch to only do the workaround on
a7xx.  And wire up the gallium preemption support so we can confirm
whether this is also an issue for preemption.

BR,
-R

> Connor
>
> > +       OUT_RING(ring, 0);
> > +       OUT_RING(ring, lower_32_bits(rbmemptr(ring, fence)));
> > +       OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
> > +       OUT_RING(ring, submit->seqno - 1);
> > +
> >         if (!sysprof) {
> >                 if (!adreno_is_a7xx(adreno_gpu)) {
> >                         /* Turn off protected mode to write to special =
registers */
> > @@ -193,7 +201,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct=
 msm_gem_submit *submit)
> >         struct msm_ringbuffer *ring =3D submit->ring;
> >         unsigned int i, ibs =3D 0;
> >
> > -       a6xx_set_pagetable(a6xx_gpu, ring, submit->queue->ctx);
> > +       a6xx_set_pagetable(a6xx_gpu, ring, submit);
> >
> >         get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP(0),
> >                 rbmemptr_stats(ring, index, cpcycles_start));
> > @@ -283,7 +291,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct=
 msm_gem_submit *submit)
> >         OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
> >         OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD=
_BR);
> >
> > -       a6xx_set_pagetable(a6xx_gpu, ring, submit->queue->ctx);
> > +       a6xx_set_pagetable(a6xx_gpu, ring, submit);
> >
> >         get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
> >                 rbmemptr_stats(ring, index, cpcycles_start));
> > --
> > 2.46.0
> >

