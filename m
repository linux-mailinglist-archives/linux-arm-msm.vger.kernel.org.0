Return-Path: <linux-arm-msm+bounces-31969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B52B97BF4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 18:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31F8E2825E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 16:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702F51C1736;
	Wed, 18 Sep 2024 16:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fL+DaNfq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30891C984E;
	Wed, 18 Sep 2024 16:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726678277; cv=none; b=hZD0YwKDf3YyiMjFTxydkZgZDxbWC1FGSldkqmLynucvxhcweR1MLCfq5EE2W2kVoxXv/UWrTzojvSOsw1so4hJzq2mEgFOwsjUbPQPfVHrIl8djiBw9qG490t4Y3Cl/UazKSrjykSxPTfeINmB+clxcftML0UcnQanYMx8oSUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726678277; c=relaxed/simple;
	bh=Mg8h+rZy43/prN8/ECbzPvtnuPOXK+tXpDSXSZGlPsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KnxtEOOqs9PPJzIEt1oQ8pBr2eJfX67nC8ERNsPvnv4EQGn4JUUuwMWpWrnftZQL6wcI1XEiZotTpHO/t6Dq3PfJ6N/votrw3mEtGaOCjYXibuPYyTUToey0bM7gLm87UObfuG04s/xnTmESROOylRO1qhoa3CbHAjl5DIiU12c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fL+DaNfq; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2053f72319fso4610915ad.2;
        Wed, 18 Sep 2024 09:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726678275; x=1727283075; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U++sEYJHjnPIVmGmCRlgjOlOobYwKPADlHrAK0bE/t4=;
        b=fL+DaNfqhS4ZA61CTYK1zwYhIV3YZuqg1Bzf+S7P5qPaDViKNL/sVK3+kGBbwXSBV7
         iImce4ZKG3nNV7dwFTWkxAFZ3mLEIYCy9qmrGBzNBmr9MQf28r49xO9hKevoTnzC63cg
         4xVQFNTm96OMJRkXYqWECa3gJGM7LgVauqicGopeGSWbW4WDorSMmdgit7OjyDmDenJ+
         hyqZzFDmpUcwotXGoK+3oi4cEwUGRthwQgaAY0lN++HE5r38yPAh2Ceb9Et8OQzYwzQU
         OtID4/EpdHaUwQblF5G8o0xEhxaFzhtLs8ygMkQ9UiNRQB+whhvA/0+aJP8AmH1pBoNd
         krBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726678275; x=1727283075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U++sEYJHjnPIVmGmCRlgjOlOobYwKPADlHrAK0bE/t4=;
        b=VVVfKfDMv0jN5xoZFXuLsbBEJYYXjV9xaDd2EAqhAxF3bkTPU3jT7IIcx+gYAam1MT
         j4AieQohkVefF33ZZRzOmaSu3z2kJgaVX++yHlxKikdDx9pag2mQq4VsMSMoLDh47r4k
         /q5Z3AhgMQegSjGZieRpF+e4KFzXVuKr9o1I8H7XpijbydXK3PVx09DTxAZ2NKaU2Mby
         g3DlYwBbrWZ1ejo1kj8Lag0VRLQolUhWVlx8jHnnDiztooRg2JdFZaG0KSsNC4qGJa7V
         hEfEUpu4pfy4GfJ4WzRgvgRe5+91niWjmK/CxOvP5N25RZtZcyfwVO+ju1KpbJCZHkoE
         2aaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlsL3YuJ1JP5qXizh/5rGWWEcnaTFmt5+gGX+kqoN3s4uzTP5DCt5+1jpv2kt8iFBvlOEW69N7+Xn472Gj@vger.kernel.org, AJvYcCXxgEy+pjsWTGzjX0/9lWXDk4pdJmqsEVfJGxaQU0ip+hxEYV9vtIIqdDMumSl3EfCef6E2pvgO6uQbTNP7@vger.kernel.org
X-Gm-Message-State: AOJu0YwiK0VIfZD8OCbEKcrseuOLkglr3Rh2HV1ZPey+c/kjRF5in77c
	ET7NKLwRzBTY76NAsIsePKehfBPnO1iYAbNRm9TpH8VfR/hLfeTswXSab6ttUSHvzeFXmMvPG0P
	GJZOlV4QBTfY8ChKciiVmS1IRhuU=
X-Google-Smtp-Source: AGHT+IFMOFfvcHxm8ZPKILxS27rcCm6QAstBImzELxxoc8hw0RZl9FJfxgCmoLdAvRasWzjIn9Etkup0MPREc3wSB20=
X-Received: by 2002:a17:902:c406:b0:207:457f:b8f6 with SMTP id
 d9443c01a7336-2076e318bf1mr145492845ad.2.1726678274938; Wed, 18 Sep 2024
 09:51:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913195132.8282-1-robdclark@gmail.com>
In-Reply-To: <20240913195132.8282-1-robdclark@gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 18 Sep 2024 17:51:03 +0100
Message-ID: <CACu1E7ECxJLH8+GqUuWH=+oM=N=fgkpBBqJ8ShrSwbdZmw+nZQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx+: Insert a fence wait before SMMU table update
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>, 
	Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 8:51=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> From: Rob Clark <robdclark@chromium.org>
>
> The CP_SMMU_TABLE_UPDATE _should_ be waiting for idle, but on some
> devices (x1-85, possibly others), it seems to pass that barrier while
> there are still things in the event completion FIFO waiting to be
> written back to memory.
>
> Work around that by adding a fence wait before context switch.  The
> CP_EVENT_WRITE that writes the fence is the last write from a submit,
> so seeing this value hit memory is a reliable indication that it is
> safe to proceed with the context switch.
>
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/63
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index bcaec86ac67a..ba5b35502e6d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -101,9 +101,10 @@ static void get_stats_counter(struct msm_ringbuffer =
*ring, u32 counter,
>  }
>
>  static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
> -               struct msm_ringbuffer *ring, struct msm_file_private *ctx=
)
> +               struct msm_ringbuffer *ring, struct msm_gem_submit *submi=
t)
>  {
>         bool sysprof =3D refcount_read(&a6xx_gpu->base.base.sysprof_activ=
e) > 1;
> +       struct msm_file_private *ctx =3D submit->queue->ctx;
>         struct adreno_gpu *adreno_gpu =3D &a6xx_gpu->base;
>         phys_addr_t ttbr;
>         u32 asid;
> @@ -115,6 +116,13 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx=
_gpu,
>         if (msm_iommu_pagetable_params(ctx->aspace->mmu, &ttbr, &asid))
>                 return;
>
> +       /* Wait for previous submit to complete before continuing: */
> +       OUT_PKT7(ring, CP_WAIT_TIMESTAMP, 4);

CP_WAIT_TIMESTAMP doesn't exist on a6xx, so this won't work there. I
don't know if the bug exists on a6xx, but I'd be inclined to say it
has always existed and we just never hit it because it requires some
very specific timing conditions. We can make it work on a6xx by using
CP_WAIT_REG_MEM and waiting for it to equal the exact value.

Connor

> +       OUT_RING(ring, 0);
> +       OUT_RING(ring, lower_32_bits(rbmemptr(ring, fence)));
> +       OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
> +       OUT_RING(ring, submit->seqno - 1);
> +
>         if (!sysprof) {
>                 if (!adreno_is_a7xx(adreno_gpu)) {
>                         /* Turn off protected mode to write to special re=
gisters */
> @@ -193,7 +201,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct m=
sm_gem_submit *submit)
>         struct msm_ringbuffer *ring =3D submit->ring;
>         unsigned int i, ibs =3D 0;
>
> -       a6xx_set_pagetable(a6xx_gpu, ring, submit->queue->ctx);
> +       a6xx_set_pagetable(a6xx_gpu, ring, submit);
>
>         get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP(0),
>                 rbmemptr_stats(ring, index, cpcycles_start));
> @@ -283,7 +291,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct m=
sm_gem_submit *submit)
>         OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
>         OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_B=
R);
>
> -       a6xx_set_pagetable(a6xx_gpu, ring, submit->queue->ctx);
> +       a6xx_set_pagetable(a6xx_gpu, ring, submit);
>
>         get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
>                 rbmemptr_stats(ring, index, cpcycles_start));
> --
> 2.46.0
>

