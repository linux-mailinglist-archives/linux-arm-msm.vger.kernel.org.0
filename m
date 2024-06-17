Return-Path: <linux-arm-msm+bounces-22842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B73B90AAFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 12:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DF8B1F2196E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 10:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1FA31940B2;
	Mon, 17 Jun 2024 10:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tFOyCp1M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D832554918
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 10:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718620039; cv=none; b=o7zAsre0a/p1zf3idGXoa4rkJ1zycgLievTz6HFrhCDRkE4W7pGz2tmlUUzDETcfa7bXtAdr39a9+NbvwM9x0yL1oWl76wWPmQFpfoL74JEyCZ5sUCVIlRb3xxa3H5adFLX6jt6E+uMHt2W50cDebAumCX9J9cV6EsIkVaE9Bn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718620039; c=relaxed/simple;
	bh=SvwAskc/fCFbqGp3xdpej0VX4LFAyKSwyjET0MIsa04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ig+egyZD3aBE8pb6KthOD1FLs65dP35e1UddhXVFMlsiHJZ3ECb5eETUCGeYlDYKIY3m/I5evto6/mz2jfKCcP09U9aOolsEvdCUEBh0vSoqzmjyWxjMDsXm7J0Hkx4fzoqHE25vE+6uXeu5ACyh9h76l/atpK6YWcMqTLqm6XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tFOyCp1M; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57c8bd6b655so15465a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 03:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718620036; x=1719224836; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97HNlrom0vmgCUPq2mVyJqaT77fVYxrQT7MRjlCumz4=;
        b=tFOyCp1MF1mZKDW/Xpt0FJIA6NXvnHjmsD8sXAnX+7YVF047NY4UzNRoOAtweCOsrX
         zEwBEaVf5CVBAIQed7b7HX4bsDrbFrj3WYQIARvQl/lFF/R0YkDykUb5hS/H+mf5pHPe
         8Xc8ktJkH2ZodXE9yH3OmF35hKRJ/PnfWAC1cU9l4gutAgYSGLnkX9GNK0v0bV/T1LMD
         ZrC87vwLN9ukkRZo9eDXOmPry1sQqQzKTKTA3hqZefgy2EqPrA9r71YwHer7/6We8efU
         3P7hs5FModnQhRAn1VWxFwFvp9UoGe9DGxYNzE/e/pY/jhB+mr14h1pG1YkVgM2vzJG2
         RtDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718620036; x=1719224836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97HNlrom0vmgCUPq2mVyJqaT77fVYxrQT7MRjlCumz4=;
        b=e/Xnupp0kwQ2Kd0faegiOCbK3IuxtbXLdI6slyr+0ahf1/HAuoVwqH+ST5QcJevOz6
         qPKtuCxoBJ2CK3xqEUsZV4bASjIn1sRwphGkvhDVh0IcZ7xxZzR0lSQp5P3K3uEsA+//
         UYaCR0wyU6wFn8xeMC1RArzfB9reeVIZ5ouH6JgVfNdqERgnGi+stWE/CZ7uc2Zn+H8j
         zKFjdFq7aGaFasmW9YuenBXHyrP7gqo3TFNYiloAbXMNZvt5/P6teoz/S2VqXIQ5754r
         i5PVGkxm1lITx1H6vvfz97fFCt5s3UMnEMGgoZ0x10g8XgLa/hpbirQr3KEJZFbcwOKB
         QbMw==
X-Forwarded-Encrypted: i=1; AJvYcCVPg59LkozkfEDHw/wJ3f0U8sRnZSP2YMQvLRLogtyhFhqOhZ83y2yXm3GO5DFalaFTmS4m/dMEhlIKHOtqxDAmMMVf0P4WsnOUTqs+Zg==
X-Gm-Message-State: AOJu0Yx0JWL2kkB782FZXSocny/CP+zmONKtAIQQajH42PS7FhWlIFS3
	/pnzIkF05A++qEvxt1e+StJGfvAdD+14MvgFp0fc+aue6WbzpqT9p4H4c6Bc7TlfHXngJx7wQqk
	jRMobRwH4qKAOK7K9U/t8+uuRBazuosqj1tgh
X-Google-Smtp-Source: AGHT+IE6YBCU6PK9TX7WgOKq154u5fmiFEOZ+kbbMuOv/cOg6c5dK4O+QtvjUVBauAMglII7sNP483BUPy+TaGxyVb8=
X-Received: by 2002:a05:6402:50d2:b0:57c:cfa9:837b with SMTP id
 4fb4d7f45d1cf-57ccfa98704mr158097a12.0.1718620035876; Mon, 17 Jun 2024
 03:27:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240604150136.493962-1-robdclark@gmail.com>
In-Reply-To: <20240604150136.493962-1-robdclark@gmail.com>
From: Pranjal Shrivastava <praan@google.com>
Date: Mon, 17 Jun 2024 15:57:04 +0530
Message-ID: <CAN6iL-Qz5--_bE=s8DKMtZFLJuNZca13ageGn48n4W7EKLUEUg@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu: Pretty-print context fault related regs
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@chromium.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jerry Snitselaar <jsnitsel@redhat.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,
On Tue, Jun 4, 2024 at 8:32=E2=80=AFPM Rob Clark <robdclark@gmail.com> wrot=
e:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Parse out the bitfields for easier-to-read fault messages.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> Stephen was wanting easier to read fault messages.. so I typed this up.
>
> Resend with the new iommu list address
>
>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 53 +++++++++++++++++++++++++--
>  drivers/iommu/arm/arm-smmu/arm-smmu.h |  5 +++
>  2 files changed, 54 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.c
> index c572d877b0e1..06712d73519c 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -411,6 +411,8 @@ static irqreturn_t arm_smmu_context_fault(int irq, vo=
id *dev)
>         unsigned long iova;
>         struct arm_smmu_domain *smmu_domain =3D dev;
>         struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> +       static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
> +                                     DEFAULT_RATELIMIT_BURST);
>         int idx =3D smmu_domain->cfg.cbndx;
>         int ret;
>
> @@ -425,10 +427,53 @@ static irqreturn_t arm_smmu_context_fault(int irq, =
void *dev)
>         ret =3D report_iommu_fault(&smmu_domain->domain, NULL, iova,
>                 fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_F=
AULT_READ);
>
> -       if (ret =3D=3D -ENOSYS)
> -               dev_err_ratelimited(smmu->dev,
> -               "Unhandled context fault: fsr=3D0x%x, iova=3D0x%08lx, fsy=
nr=3D0x%x, cbfrsynra=3D0x%x, cb=3D%d\n",
> -                           fsr, iova, fsynr, cbfrsynra, idx);
> +       if (ret =3D=3D -ENOSYS && __ratelimit(&rs)) {
> +               static const struct {
> +                       u32 mask; const char *name;
> +               } fsr_bits[] =3D {
> +                       { ARM_SMMU_FSR_MULTI,  "MULTI" },
> +                       { ARM_SMMU_FSR_SS,     "SS"    },
> +                       { ARM_SMMU_FSR_UUT,    "UUT"   },
> +                       { ARM_SMMU_FSR_ASF,    "ASF"   },
> +                       { ARM_SMMU_FSR_TLBLKF, "TLBLKF" },
> +                       { ARM_SMMU_FSR_TLBMCF, "TLBMCF" },
> +                       { ARM_SMMU_FSR_EF,     "EF"     },
> +                       { ARM_SMMU_FSR_PF,     "PF"     },
> +                       { ARM_SMMU_FSR_AFF,    "AFF"    },
> +                       { ARM_SMMU_FSR_TF,     "TF"     },

I think we are missing to log the translation scheme i.e. `Format
bits[10:9]` field of this register as per the SMMUv2 spec. Maybe add
that too?

> +               }, fsynr0_bits[] =3D {
> +                       { ARM_SMMU_FSYNR0_WNR,    "WNR"    },
> +                       { ARM_SMMU_FSYNR0_PNU,    "PNU"    },
> +                       { ARM_SMMU_FSYNR0_IND,    "IND"    },
> +                       { ARM_SMMU_FSYNR0_NSATTR, "NSATTR" },
> +                       { ARM_SMMU_FSYNR0_PTWF,   "PTWF"   },
> +                       { ARM_SMMU_FSYNR0_AFR,    "AFR"    },
> +               };
> +
> +               pr_err("%s %s: Unhandled context fault: fsr=3D0x%x (",
> +                      dev_driver_string(smmu->dev), dev_name(smmu->dev),=
 fsr);
> +
> +               for (int i =3D 0, n =3D 0; i < ARRAY_SIZE(fsr_bits); i++)=
 {
> +                       if (fsr & fsr_bits[i].mask) {
> +                               pr_cont("%s%s", (n > 0) ? "|" : "", fsr_b=
its[i].name);
> +                               n++;
> +                       }
> +               }

Nit: Maybe add a line-wrap here after logging the iova?
Not trying to sound like a terminal geek, but a full log with pr_cont
could get very long (> 80 characters).
So, let's log fsr & iova in one line, fsynr and others in the next.

> +
> +               pr_cont("), iova=3D0x%08lx, fsynr=3D0x%x (S1CBNDX=3D%u", =
iova, fsynr,
> +                       (fsynr >> 16) & 0xff);
> +
> +               for (int i =3D 0; i < ARRAY_SIZE(fsynr0_bits); i++) {
> +                       if (fsynr & fsynr0_bits[i].mask) {
> +                               pr_cont("|%s", fsynr0_bits[i].name);
> +                       }
> +               }
> +
> +               pr_cont("|PLVL=3D%u), cbfrsynra=3D0x%x, cb=3D%d\n",
> +                       fsynr & 0x3,   /* FSYNR0.PLV */
> +                       cbfrsynra, idx);
> +
> +       }
>
>         arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
>         return IRQ_HANDLED;
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.h
> index 836ed6799a80..3b051273718b 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -223,6 +223,11 @@ enum arm_smmu_cbar_type {
>
>  #define ARM_SMMU_CB_FSYNR0             0x68
>  #define ARM_SMMU_FSYNR0_WNR            BIT(4)
> +#define ARM_SMMU_FSYNR0_PNU            BIT(5)
> +#define ARM_SMMU_FSYNR0_IND            BIT(6)
> +#define ARM_SMMU_FSYNR0_NSATTR         BIT(8)
> +#define ARM_SMMU_FSYNR0_PTWF           BIT(10)
> +#define ARM_SMMU_FSYNR0_AFR            BIT(11)
>

Nit: Worth prefixing these with "CB_" i.e. "ARM_SMMU_CB_FSYNR0_* " to
avoid confusion with "GFSYNR0".

>  #define ARM_SMMU_CB_FSYNR1             0x6c
>
> --
> 2.45.1
>
>
Thanks,
Pranjal

