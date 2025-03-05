Return-Path: <linux-arm-msm+bounces-50405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6443EA50B37
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 20:13:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 871891684E7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 19:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B23A1DD9AC;
	Wed,  5 Mar 2025 19:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DoT/BP59"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCF01624F1
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Mar 2025 19:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741201970; cv=none; b=KkuMs2MOFefuHgtuIprfrMKbkcryK+swObhyVxhBYWooIqlGEu/VAgUfsVbZSxy5nLVs47SdOEbESRtAxglJaWaypiemUSNOYO30gXDioLc8w4/ioxwX/YPrsg7IunIRuaY9xqAWhAF85XBa3FopAxpz0Emawew3VAebDN6A0WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741201970; c=relaxed/simple;
	bh=Sw7zDQqY7XcW7TRpT+SkhezUcUYg9LXVgTIXqgsDgdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KhPfgDO4uc1rwab/rMg1CAUYbvwcKHgzyN4UtILfrzB4k5HuYtdvZVdd7+HNNntRCFZV4xV3DKDPe83nSnYk1IvLc2DP7LuOVYqynAlPguRxtan/hGmlYOfu/eAPqmKo7s/nT66zJg4/yjAQSWS+iY9ZaG7xS7nnfDcyVZklGac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DoT/BP59; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3d0465a8d34so62979655ab.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Mar 2025 11:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741201968; x=1741806768; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZzymmmsUuwspRI0dSqBHFmnHJEtQiDmh4Y19RgEygc=;
        b=DoT/BP59NV2aKjoiAJwUgJFCh64fsFmTSE/FlFg/CerhRU+JYJoMcXBiDUNnbxtPN0
         6PgarTIxl37gAmVbtNuurixbkunfWgSSVN1FyEHUyCOya3WirP1E76mN9T5ZEzaIEzvJ
         /VnQ7hsqJdV/sM0s04A7uz20muOEnoaDxly93BwJQuJWzsY2zyLEc8VVv12qWR6swzL7
         rS2zLhZgeddYS8zXBNhgBp/hWKhlDrqlAuvZ+OfamuIYoUnbR3p21hTK4ao4eZfZh9oH
         kBIdWYsL2w3DibwlCr+dK/ZJ/D0QoZcZsXecqRLNp1RqftPiWDZ9gjRZkZf+z9BmzL14
         M2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741201968; x=1741806768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SZzymmmsUuwspRI0dSqBHFmnHJEtQiDmh4Y19RgEygc=;
        b=bTsfsrB/lVS5mvEodQ0fVNdf1XpaoJoFr/y6iUO7MzycljMTdYk9tFp9bLC7u/b6j9
         GwLYjbK5RxM8zxFDH1HiChfQD5dIY5D2t3sqX/8+u+eBzX4fYci2NljTUm5QXa0EfcXt
         GjXDJUSX0o81hmFPBYxfqSvWH2poc9r7d/QOnpTdALEcfB8bygCCIVIZKp43oZX7C0TL
         ldUZorcjjDEYJuyM4LsDp/ie6gzXraZe6A4bSrZAewwMuV76tBbnZ6sBdU3TPi7kc3yj
         vTBvMkVVoJ2jWtdeEPT0YogLjBTdfDGzLiUBXiRrADIB74UXZwrc5euSydlKyO2HGrMI
         pu9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKMert8+8k3Bk4Ib6iFBXHZ4X2uyWD+4jasL7AqoSTnm7HXkjuPWbTkoVAbe4s6M0cUKJRLc8E9hbizTop@vger.kernel.org
X-Gm-Message-State: AOJu0YzEinGj6Z1XzNie1vfCac6O8ryJ4F+tfO1idI3BaHWozPracPcO
	vo64pwZyA0bvfh6ihUJUYckI5X6p9PEJn5SNgc7zbHGBQmyPm54D1m/dG0CfIrS7QedT2l7mBZG
	MfLpE89HNzAvFAsJHk9sW0Srb6fY=
X-Gm-Gg: ASbGncv28varPEKJAwtnnNRIUDYbexwAzu+MOBSIbz6x77qJK6pQLdCgrqCT9v3Xovi
	7YnXo6FQ6DRuGBkfVybALNsLEQ6+rQUcMpcwb1acLwQQUup9jlCIa27rH+MqIoroUwc74TtS/Pq
	rNveYZO0aD1coVy7wHxoJU/pfVeg==
X-Google-Smtp-Source: AGHT+IHlEINA/jfl2bBPP1ul53oTsOP5ym9Trq3jpGpB8Vm7TzTmI2nqJcEmRK+XL9G3vhk3sJwn4J0bQLvJBmoMCFg=
X-Received: by 2002:a05:6e02:188c:b0:3d3:d28e:eae9 with SMTP id
 e9e14a558f8ab-3d42b890630mr57345765ab.7.1741201968293; Wed, 05 Mar 2025
 11:12:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com> <20250304-msm-gpu-fault-fixes-next-v4-3-be14be37f4c3@gmail.com>
In-Reply-To: <20250304-msm-gpu-fault-fixes-next-v4-3-be14be37f4c3@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 5 Mar 2025 11:12:36 -0800
X-Gm-Features: AQ5f1Jo4BXeEdaC2izHqFmQ2gL7iBiicL-43RgNDhM5BByTDG8vBtJ6rU6EziYc
Message-ID: <CAF6AEGsi1s4rO0_HSy44ikFGXNJAkBxfBMucRyGA+xokzOsP_A@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 8:57=E2=80=AFAM Connor Abbott <cwabbott0@gmail.com> =
wrote:
>
> On some SMMUv2 implementations, including MMU-500, SMMU_CBn_FSR.SS
> asserts an interrupt. The only way to clear that bit is to resume the
> transaction by writing SMMU_CBn_RESUME, but typically resuming the
> transaction requires complex operations (copying in pages, etc.) that
> can't be done in IRQ context. drm/msm already has a problem, because
> its fault handler sometimes schedules a job to dump the GPU state and
> doesn't resume translation until this is complete.
>
> Work around this by disabling context fault interrupts until after the
> transaction is resumed. Because other context banks can share an IRQ
> line, we may still get an interrupt intended for another context bank,
> but in this case only SMMU_CBn_FSR.SS will be asserted and we can skip
> it assuming that interrupts are disabled which is accomplished by
> removing the bit from ARM_SMMU_CB_FSR_FAULT. SMMU_CBn_FSR.SS won't be
> asserted unless an external user enabled stall-on-fault, and they are
> expected to resume the translation and re-enable interrupts.
>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> Reviewed-by Robin Murphy <robin.murphy@arm.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 15 ++++++++++-
>  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 41 ++++++++++++++++++++++++=
+++++-
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  1 -
>  3 files changed, 54 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index 186d6ad4fd1c990398df4dec53f4d58ada9e658c..a428e53add08d451fb2152e3a=
b80e0fba936e214 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -90,12 +90,25 @@ static void qcom_adreno_smmu_resume_translation(const=
 void *cookie, bool termina
>         struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
>         struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
>         struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> -       u32 reg =3D 0;
> +       u32 reg =3D 0, sctlr;
> +       unsigned long flags;
>
>         if (terminate)
>                 reg |=3D ARM_SMMU_RESUME_TERMINATE;
>
> +       spin_lock_irqsave(&smmu_domain->cb_lock, flags);
> +
>         arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
> +
> +       /*
> +        * Re-enable interrupts after they were disabled by
> +        * arm_smmu_context_fault().
> +        */
> +       sctlr =3D arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR);
> +       sctlr |=3D ARM_SMMU_SCTLR_CFIE;
> +       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, sctlr);
> +
> +       spin_unlock_irqrestore(&smmu_domain->cb_lock, flags);
>  }
>
>  #define QCOM_ADRENO_SMMU_GPU_SID 0
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.c
> index 498b96e95cb4fdb67c246ef13de1eb8f40d68f7d..284079ef95cd2deeb71816a28=
4850523897badd8 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -466,13 +466,52 @@ static irqreturn_t arm_smmu_context_fault(int irq, =
void *dev)
>         if (!(cfi->fsr & ARM_SMMU_CB_FSR_FAULT))
>                 return IRQ_NONE;
>
> +       /*
> +        * On some implementations FSR.SS asserts a context fault
> +        * interrupt. We do not want this behavior, because resolving the
> +        * original context fault typically requires operations that cann=
ot be
> +        * performed in IRQ context but leaving the stall unacknowledged =
will
> +        * immediately lead to another spurious interrupt as FSR.SS is st=
ill
> +        * set. Work around this by disabling interrupts for this context=
 bank.
> +        * It's expected that interrupts are re-enabled after resuming th=
e
> +        * translation.
> +        *
> +        * We have to do this before report_iommu_fault() so that we don'=
t
> +        * leave interrupts disabled in case the downstream user decides =
the
> +        * fault can be resolved inside its fault handler.
> +        *
> +        * There is a possible race if there are multiple context banks s=
haring
> +        * the same interrupt and both signal an interrupt in between wri=
ting
> +        * RESUME and SCTLR. We could disable interrupts here before we
> +        * re-enable them in the resume handler, leaving interrupts enabl=
ed.
> +        * Lock the write to serialize it with the resume handler.
> +        */
> +       if (cfi->fsr & ARM_SMMU_CB_FSR_SS) {
> +               u32 val;
> +
> +               spin_lock(&smmu_domain->cb_lock);
> +               val =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_SCTLR);
> +               val &=3D ~ARM_SMMU_SCTLR_CFIE;
> +               arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, val);
> +               spin_unlock(&smmu_domain->cb_lock);
> +       }
> +
> +       /*
> +        * The SMMUv2 architecture specification says that if stall-on-fa=
ult is
> +        * enabled the correct sequence is to write to SMMU_CBn_FSR to cl=
ear
> +        * the fault and then write to SMMU_CBn_RESUME. Clear the interru=
pt
> +        * first before running the user's fault handler to make sure we =
follow
> +        * this sequence. It should be ok if there is another fault in th=
e
> +        * meantime because we have already read the fault info.
> +        */
> +       arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi->fsr);
> +
>         ret =3D report_iommu_fault(&smmu_domain->domain, NULL, cfi->iova,
>                 cfi->fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE =
: IOMMU_FAULT_READ);
>
>         if (ret =3D=3D -ENOSYS && __ratelimit(&rs))
>                 arm_smmu_print_context_fault_info(smmu, idx, cfi);
>
> -       arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi->fsr);
>         return IRQ_HANDLED;
>  }
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.h
> index 411d807e0a7033833716635efb3968a0bd3ff237..4235b772c2cb032778816578c=
9e6644512543a5e 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -214,7 +214,6 @@ enum arm_smmu_cbar_type {
>                                          ARM_SMMU_CB_FSR_TLBLKF)
>
>  #define ARM_SMMU_CB_FSR_FAULT          (ARM_SMMU_CB_FSR_MULTI |        \
> -                                        ARM_SMMU_CB_FSR_SS |           \
>                                          ARM_SMMU_CB_FSR_UUT |          \
>                                          ARM_SMMU_CB_FSR_EF |           \
>                                          ARM_SMMU_CB_FSR_PF |           \
>
> --
> 2.47.1
>

