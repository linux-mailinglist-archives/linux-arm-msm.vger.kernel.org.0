Return-Path: <linux-arm-msm+bounces-24348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A479891973C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 21:09:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 295F31F225E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 19:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54709191495;
	Wed, 26 Jun 2024 19:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D0gCaKzS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6542E191487
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 19:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719428939; cv=none; b=eLSnC7tFolMi3Auwh6ToHwbUkwnrgcQ3Ia3Z6bWr9fTskCDOjhN9FgqndlESz7V5hv4H2YQfYtb7/9BEIElw91nqu8rr+ysVaGmAf5fUGcH1AH/QH9qSAhP3RbPCLn3nYo8kpbxdaOwJexpdxyvIg2ksEalGLRzbaPvxg+9VsWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719428939; c=relaxed/simple;
	bh=rDyNB82zUhqByZGBgTFC2E1oO6WgjS1mWPWyoGTJn0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vcz+/OYeuPeQBJJx8w61roNs/McmM6BlkU0ljEh/cRrxZZ+KdsSgAb4EihH4ACbCEkmS+7qltD0HPdnTB/SznWGKq1N9U3lXkubeGKnu5DlWBsUpgN0x5YJb0/rsXvqqe+vih1ry2e+Axe+4zgp9umyQ9kLkW3Be5+Q0wJH2n3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D0gCaKzS; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57d00a51b71so2866a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 12:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719428936; x=1720033736; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdQRU3fYI3uV2STEAZYI1dILyJlU4oI2+8UM93+W5Ew=;
        b=D0gCaKzSrFwYLLOc+mofyX8PKZeGhXikSBCiTzLDzKpl/dP4ifUfoIuaTP7eX7rEym
         N8Y2u/a7+JcAtrpBiWtmSGKSpVCLvg7Dn6iKDo0p/eYJn3sEADVWRtdBrtVcLvCHHDI3
         EuW/8Si4tA0sXH4oCkt+WtsXG+NVAMGU20R6XE6YtqnHReAOdrr6vBet+MtIDi8ZxM28
         3sByod5LDP7mYGf+91txGL/GGH8YI4+3vR9sh/vYhJH3NYeE8o+zvtw6tfj2WndaVzEh
         UZ3XJ9sDgxCeREEdw3bhA8ZayqZ1GPXCoBdrNAGn7Hp4aqktKyTb65CAGM31xV0lOaqt
         LCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719428936; x=1720033736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CdQRU3fYI3uV2STEAZYI1dILyJlU4oI2+8UM93+W5Ew=;
        b=MITnmKA7p+FhB8d+1OAr8HSYw0zJ2GpYgTaHXOZmyXTw/NGcLj/R4MK+f7qy6DyBCG
         xIlfjMb4jqItEvj+f3c4S2W2t7WWZD0wX/SftJ1JfUiEnEoHGPbKqboQDrn9EzJp8WlG
         HZuXwCeOPR5vkyWiWRWWOvbj9EcbN/5FYzG512LYRi76rBP/fu1cOdkpJCk3OTMsCEux
         uHOi00xZf6UMQU1hsYNP24MZFAI8aToXAzazs1jdhjhahkFATncQpfyR0pYZM8W+l3FZ
         GjiEkaGpo4ruaPdSp/CnNYA4XTEbyPWf5HXIK4VO0dA+eG5Z4dVIuwmS6p+DdRYqgxsY
         w34w==
X-Forwarded-Encrypted: i=1; AJvYcCWgkcgbiVL4SDiPBiFQtYaPZIXlM0QGMtemOyWlyXM7F2PGGj+7wzEGVYYXmmOsv4pq9AzELEPVs4Z5UPp+qvO0bJmvu2GK1uJAziG+wA==
X-Gm-Message-State: AOJu0Yy+GJySM9RBve8mvzWeGUhhEjTZQJy7/znuG1nLg+YjiluCQwao
	k/e1mXyVrqvHlb/vvSQHkgF1O0tiWXsWRGYQT8O8QFFDYxzlYmCwoc/lS9WZaKyeaHfgvNXL72H
	oahoBoeYY6A38xybn1RLFuXC/yteeZLTja65Q
X-Google-Smtp-Source: AGHT+IGudqx0DNraxKEtX3evZLWYfpur1Gpkd7qwLcFHHXuJUusvtGf4dOAPYeMWZ3BiOvgI1I9YtpyGEEqc0167F2Q=
X-Received: by 2002:a50:9f03:0:b0:57d:436b:68d6 with SMTP id
 4fb4d7f45d1cf-584901a64a3mr25384a12.7.1719428935425; Wed, 26 Jun 2024
 12:08:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240626163842.205631-1-robdclark@gmail.com>
In-Reply-To: <20240626163842.205631-1-robdclark@gmail.com>
From: Pranjal Shrivastava <praan@google.com>
Date: Thu, 27 Jun 2024 00:38:43 +0530
Message-ID: <CAN6iL-T8Bt1Gz+YrqTvMzBs=AYN4x67TQW4OqnU-nYSOcj2Sdw@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu: Pretty-print context fault related regs
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	Stephen Boyd <swboyd@chromium.org>, Robin Murphy <robin.murphy@arm.com>, 
	Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jerry Snitselaar <jsnitsel@redhat.com>, Rob Herring <robh@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Georgi Djakov <quic_c_gdjako@quicinc.com>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,


On Wed, Jun 26, 2024 at 10:08=E2=80=AFPM Rob Clark <robdclark@gmail.com> wr=
ote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Parse out the bitfields for easier-to-read fault messages.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> I kept with the dev_err, which matches qcom_smmu_context_fault.  It is
> only adding two extra lines, and it is ratelimited.
>
> I also converted qcom_smmu_context_fault() to use the helpers to do the
> parsing, rather than more or less duplicating.
>
>  .../iommu/arm/arm-smmu/arm-smmu-qcom-debug.c  | 21 +++---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c         | 70 ++++++++++++++++++-
>  drivers/iommu/arm/arm-smmu/arm-smmu.h         | 58 +++++++++------
>  3 files changed, 110 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/i=
ommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> index 552199cbd9e2..ee7eab273e1a 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> @@ -429,22 +429,17 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *=
dev)
>                 phys_addr_t phys_atos =3D qcom_smmu_verify_fault(smmu_dom=
ain, iova, fsr);
>
>                 if (__ratelimit(&_rs)) {
> +                       char buf[80];

Super Nit: I'm not a fan of hardcoding the buffer size but I'm also not sur=
e
if this makes a strong enough case for a macro definition. Any thoughts, an=
yone?

> +
>                         dev_err(smmu->dev,
>                                 "Unhandled context fault: fsr=3D0x%x, iov=
a=3D0x%08lx, fsynr=3D0x%x, cbfrsynra=3D0x%x, cb=3D%d\n",
>                                 fsr, iova, fsynr, cbfrsynra, idx);
> -                       dev_err(smmu->dev,
> -                               "FSR    =3D %08x [%s%s%s%s%s%s%s%s%s], SI=
D=3D0x%x\n",
> -                               fsr,
> -                               (fsr & 0x02) ? "TF " : "",
> -                               (fsr & 0x04) ? "AFF " : "",
> -                               (fsr & 0x08) ? "PF " : "",
> -                               (fsr & 0x10) ? "EF " : "",
> -                               (fsr & 0x20) ? "TLBMCF " : "",
> -                               (fsr & 0x40) ? "TLBLKF " : "",
> -                               (fsr & 0x80) ? "MHF " : "",
> -                               (fsr & 0x40000000) ? "SS " : "",
> -                               (fsr & 0x80000000) ? "MULTI " : "",
> -                               cbfrsynra);
> +
> +                       arm_smmu_parse_fsr(buf, fsr);
> +                       dev_err(smmu->dev, "FSR: %s\n", buf);
> +
> +                       arm_smmu_parse_fsynr0(buf, fsynr);
> +                       dev_err(smmu->dev, "FSYNR0: %s\n", buf);
>
>                         dev_err(smmu->dev,
>                                 "soft iova-to-phys=3D%pa\n", &phys_soft);
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.c
> index 87c81f75cf84..7f5ca75d5ebe 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -405,12 +405,67 @@ static const struct iommu_flush_ops arm_smmu_s2_tlb=
_ops_v1 =3D {
>         .tlb_add_page   =3D arm_smmu_tlb_add_page_s2_v1,
>  };
>
> +void arm_smmu_parse_fsr(char buf[80], u32 fsr)
> +{
> +       static const struct {
> +               u32 mask;
> +               const char *name;
> +       } fsr_bits[] =3D {
> +               { ARM_SMMU_CB_FSR_MULTI,  "MULTI"  },
> +               { ARM_SMMU_CB_FSR_SS,     "SS"     },
> +               { ARM_SMMU_CB_FSR_UUT,    "UUT"    },
> +               { ARM_SMMU_CB_FSR_ASF,    "ASF"    },
> +               { ARM_SMMU_CB_FSR_TLBLKF, "TLBLKF" },
> +               { ARM_SMMU_CB_FSR_TLBMCF, "TLBMCF" },
> +               { ARM_SMMU_CB_FSR_EF,     "EF"     },
> +               { ARM_SMMU_CB_FSR_PF,     "PF"     },
> +               { ARM_SMMU_CB_FSR_AFF,    "AFF"    },
> +               { ARM_SMMU_CB_FSR_TF,     "TF"     },
> +       };
> +       char *p =3D buf;
> +
> +       p +=3D sprintf(p, "FORMAT=3D%u",
> +                    (u32)FIELD_GET(ARM_SMMU_CB_FSR_FORMAT, fsr));
> +
> +       for (int i =3D 0; i < ARRAY_SIZE(fsr_bits); i++)
> +               if (fsr & fsr_bits[i].mask)
> +                       p +=3D sprintf(p, "|%s", fsr_bits[i].name);
> +}

Buffer overflow alert: I suggest passing the buffer size as an
additional "size" parameter to the function.
Based on that size parameter, we must ensure that `p` doesn't reach
out of bounds.
Maybe using snprintf() to limit the num of characters to the "size"
parameter would make more sense.

> +
> +void arm_smmu_parse_fsynr0(char buf[80], u32 fsynr)

Ditto, for this function and also for the signatures in the .h file.


> +{
> +       static const struct {
> +               u32 mask;
> +               const char *name;
> +       } fsynr0_bits[] =3D {
> +               { ARM_SMMU_CB_FSYNR0_WNR,    "WNR"    },
> +               { ARM_SMMU_CB_FSYNR0_PNU,    "PNU"    },
> +               { ARM_SMMU_CB_FSYNR0_IND,    "IND"    },
> +               { ARM_SMMU_CB_FSYNR0_NSATTR, "NSATTR" },
> +               { ARM_SMMU_CB_FSYNR0_PTWF,   "PTWF"   },
> +               { ARM_SMMU_CB_FSYNR0_AFR,    "AFR"    },
> +       };
> +       char *p =3D buf;
> +
> +       p +=3D sprintf(p, "S1CBNDX=3D%u",
> +                    (u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_S1CBNDX, fsynr));
> +
> +       for (int i =3D 0; i < ARRAY_SIZE(fsynr0_bits); i++)
> +               if (fsynr & fsynr0_bits[i].mask)
> +                       p +=3D sprintf(p, "|%s", fsynr0_bits[i].name);
> +
> +       p +=3D sprintf(p, "|PLVL=3D%u",
> +                    (u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_PLVL, fsynr));
> +}
> +
>  static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>  {
>         u32 fsr, fsynr, cbfrsynra;
>         unsigned long iova;
>         struct arm_smmu_domain *smmu_domain =3D dev;
>         struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> +       static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
> +                                     DEFAULT_RATELIMIT_BURST);
>         int idx =3D smmu_domain->cfg.cbndx;
>         int ret;
>
> @@ -423,13 +478,22 @@ static irqreturn_t arm_smmu_context_fault(int irq, =
void *dev)
>         cbfrsynra =3D arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx)=
);
>
>         ret =3D report_iommu_fault(&smmu_domain->domain, NULL, iova,
> -               fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_F=
AULT_READ);
> +               fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMM=
U_FAULT_READ);
> +
> +       if (ret =3D=3D -ENOSYS && __ratelimit(&rs)) {
> +               char buf[80];
>
> -       if (ret =3D=3D -ENOSYS)
> -               dev_err_ratelimited(smmu->dev,
> +               dev_err(smmu->dev,
>                 "Unhandled context fault: fsr=3D0x%x, iova=3D0x%08lx, fsy=
nr=3D0x%x, cbfrsynra=3D0x%x, cb=3D%d\n",
>                             fsr, iova, fsynr, cbfrsynra, idx);
>
> +               arm_smmu_parse_fsr(buf, fsr);
> +               dev_err(smmu->dev, "FSR: %s\n", buf);
> +
> +               arm_smmu_parse_fsynr0(buf, fsynr);
> +               dev_err(smmu->dev, "FSYNR0: %s\n", buf);
> +       }
> +
>         arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
>         return IRQ_HANDLED;
>  }
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/ar=
m-smmu/arm-smmu.h
> index 4765c6945c34..763ea52fca64 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -196,34 +196,46 @@ enum arm_smmu_cbar_type {
>  #define ARM_SMMU_CB_PAR_F              BIT(0)
>
>  #define ARM_SMMU_CB_FSR                        0x58
> -#define ARM_SMMU_FSR_MULTI             BIT(31)
> -#define ARM_SMMU_FSR_SS                        BIT(30)
> -#define ARM_SMMU_FSR_UUT               BIT(8)
> -#define ARM_SMMU_FSR_ASF               BIT(7)
> -#define ARM_SMMU_FSR_TLBLKF            BIT(6)
> -#define ARM_SMMU_FSR_TLBMCF            BIT(5)
> -#define ARM_SMMU_FSR_EF                        BIT(4)
> -#define ARM_SMMU_FSR_PF                        BIT(3)
> -#define ARM_SMMU_FSR_AFF               BIT(2)
> -#define ARM_SMMU_FSR_TF                        BIT(1)
> -
> -#define ARM_SMMU_FSR_IGN               (ARM_SMMU_FSR_AFF |             \
> -                                        ARM_SMMU_FSR_ASF |             \
> -                                        ARM_SMMU_FSR_TLBMCF |          \
> -                                        ARM_SMMU_FSR_TLBLKF)
> -
> -#define ARM_SMMU_FSR_FAULT             (ARM_SMMU_FSR_MULTI |           \
> -                                        ARM_SMMU_FSR_SS |              \
> -                                        ARM_SMMU_FSR_UUT |             \
> -                                        ARM_SMMU_FSR_EF |              \
> -                                        ARM_SMMU_FSR_PF |              \
> -                                        ARM_SMMU_FSR_TF |              \
> +#define ARM_SMMU_CB_FSR_MULTI          BIT(31)
> +#define ARM_SMMU_CB_FSR_SS             BIT(30)
> +#define ARM_SMMU_CB_FSR_FORMAT         GENMASK(10, 9)
> +#define ARM_SMMU_CB_FSR_UUT            BIT(8)
> +#define ARM_SMMU_CB_FSR_ASF            BIT(7)
> +#define ARM_SMMU_CB_FSR_TLBLKF         BIT(6)
> +#define ARM_SMMU_CB_FSR_TLBMCF         BIT(5)
> +#define ARM_SMMU_CB_FSR_EF             BIT(4)
> +#define ARM_SMMU_CB_FSR_PF             BIT(3)
> +#define ARM_SMMU_CB_FSR_AFF            BIT(2)
> +#define ARM_SMMU_CB_FSR_TF             BIT(1)
> +
> +void arm_smmu_parse_fsr(char buf[80], u32 fsr);
> +
> +#define ARM_SMMU_FSR_IGN               (ARM_SMMU_CB_FSR_AFF |          \
> +                                        ARM_SMMU_CB_FSR_ASF |          \
> +                                        ARM_SMMU_CB_FSR_TLBMCF |       \
> +                                        ARM_SMMU_CB_FSR_TLBLKF)
> +
> +#define ARM_SMMU_FSR_FAULT             (ARM_SMMU_CB_FSR_MULTI |        \
> +                                        ARM_SMMU_CB_FSR_SS |           \
> +                                        ARM_SMMU_CB_FSR_UUT |          \
> +                                        ARM_SMMU_CB_FSR_EF |           \
> +                                        ARM_SMMU_CB_FSR_PF |           \
> +                                        ARM_SMMU_CB_FSR_TF |           \
>                                          ARM_SMMU_FSR_IGN)
>
>  #define ARM_SMMU_CB_FAR                        0x60
>
>  #define ARM_SMMU_CB_FSYNR0             0x68
> -#define ARM_SMMU_FSYNR0_WNR            BIT(4)
> +#define ARM_SMMU_CB_FSYNR0_PLVL                GENMASK(1, 0)
> +#define ARM_SMMU_CB_FSYNR0_WNR         BIT(4)
> +#define ARM_SMMU_CB_FSYNR0_PNU         BIT(5)
> +#define ARM_SMMU_CB_FSYNR0_IND         BIT(6)
> +#define ARM_SMMU_CB_FSYNR0_NSATTR      BIT(8)
> +#define ARM_SMMU_CB_FSYNR0_PTWF                BIT(10)
> +#define ARM_SMMU_CB_FSYNR0_AFR         BIT(11)
> +#define ARM_SMMU_CB_FSYNR0_S1CBNDX     GENMASK(23, 16)
> +
> +void arm_smmu_parse_fsynr0(char buf[80], u32 fsynr);

Apart from the buffer overflow, everything else looks fine to me.

>
>  #define ARM_SMMU_CB_FSYNR1             0x6c
>
> --
> 2.45.2
>

