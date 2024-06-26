Return-Path: <linux-arm-msm+bounces-24356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C332919859
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 21:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF75D281CEB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 19:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB0F1922DB;
	Wed, 26 Jun 2024 19:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQXMItrB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17A0157A5B;
	Wed, 26 Jun 2024 19:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719430970; cv=none; b=ambmbzkv3ii1ZQU8t2zbhlhEMIEiyyiaJuLXOEknCOtrQJ5vuae9PARDusi0OBB0s5keoWoiMdhj+qfju0ccHGWddx8uksQdOp7APRqjCsgYqwUsZS1qBqXgDX5eqiU3QW+JmBtUK6KcpofGq+EIfImBcYqIjG893icWXfKGS/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719430970; c=relaxed/simple;
	bh=KnycliXpjTywgUB93eWlGGJIIzjJFqb1Qo/gsxBibeU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YeZJIlK6/ljmIc59THhn2ftOOCVQJhAJn7853NK1AaNtOrs3f4ck2uOLVrFnB9zEspsMy9tdgalKGMPf28qncqFz+QvAgLLqdMxLzQ3f5ICd1CcaQPQ7NEVsBGMCQROCjM9Clhw2hOxIIQGh4WgZyR1WzjryTh3Ct4Merl4Ess0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQXMItrB; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-57d0699fd02so391296a12.0;
        Wed, 26 Jun 2024 12:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719430965; x=1720035765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2XVjiSCKp6ff4yqYS16EKaOsJZe+5cWeRbw3meRHAO0=;
        b=OQXMItrBDgM0XwOHwyQXZPzypGUIxa7M1VgcEyT6Dz1+a+oPSPW9dNQ4I4+ZYwvNCq
         xdK6ECEEWYJvsN2qfLvyiXl+KvOofNQHOMtY1Fce69LvpWvhzTpcGFsfvuVYBqJoRp2J
         QgsW7ykeHHGbwN/07zxPQhnDfCI4PAWhw09d62ZZRDa97H6zcF0e6CRKWb2U239T6G7n
         pJ94+xuZbq991HGtu25eU9SC2jbv7SNvAe2SaoSgY8VZbn5/XIUPTKq8sicuq/jkJeuR
         7e3lgUyAtqPA14Ep664IzYxPVETH25ELNWhP7/GRelS/hG6ooaJcsuOvvTrCskLJc/MI
         J1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719430965; x=1720035765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2XVjiSCKp6ff4yqYS16EKaOsJZe+5cWeRbw3meRHAO0=;
        b=TZatfGTe2q2nGuKGPWtsqsKTCBTvs/O59+7aHtNwTKqmhYUFyn4QN1GPmQ9PsAurJK
         6MNuDfCXE01up0gtmZWXWwBFJ/OHEbn6TewblXCp9xmscnEKaEkDxDmhx5I8A5GstT+B
         ZF+2GOvW7/Qb3PhH4fZwzjLKTew+LOp3Uo3CCClbi80PgL1xitCZTTNX+ViT1NXWM2GK
         Ev0kbVaFxyVfTX9pQIW2gu7AbknVNA5fzBSM3XAeI8aXZEdFa1Dp+Hr4BqQYjJ519hnZ
         Oje+GW1kEE5Szpa+05Ho4KPYiY/CZHP20vF6NodVmRD1DUE4kE3/S4c5X3lW8xlL9pDF
         ZKQw==
X-Forwarded-Encrypted: i=1; AJvYcCXUdEBR/oyB3cx2bdUuCdZ4n/OFfmcyJrNfLHwNue+romlUN5ewR/2Q0lnQD/QRHGFGciZ6T+gC5CFWsIyhDNbC/E7A9RRXQZCISZsjR1YbSJqqmodSak3P6B81k8Oe7EQo7ddKozjxDUrg7A==
X-Gm-Message-State: AOJu0YzgJtx4ZwQdVg7+QdCjiN0AhOVqotg+Oe2poy3F8B2zfbnM1t13
	dIwmpzX2qCAyIlNIP6SW5550PITSC46HxbYZEv8hOmKKI/JM4lcpekd2QlYRtf6Ypf/JdN3kjzQ
	WZsNiKrFjIftJwDXWzSNXeyWwf8s=
X-Google-Smtp-Source: AGHT+IHZ7+M0//vnr/yEEMWB1PM0XC1LdxSQZA17e33ejob9RSQ/62tBAze3GUi9mthGDUhd28M/H3hKfJbxg5iTTNo=
X-Received: by 2002:a50:d653:0:b0:57d:3b8:85e6 with SMTP id
 4fb4d7f45d1cf-57d4bddfba2mr9714346a12.39.1719430964871; Wed, 26 Jun 2024
 12:42:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240626163842.205631-1-robdclark@gmail.com> <CAN6iL-T8Bt1Gz+YrqTvMzBs=AYN4x67TQW4OqnU-nYSOcj2Sdw@mail.gmail.com>
In-Reply-To: <CAN6iL-T8Bt1Gz+YrqTvMzBs=AYN4x67TQW4OqnU-nYSOcj2Sdw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 26 Jun 2024 12:42:31 -0700
Message-ID: <CAF6AEGv1Ufa4XjEsM4s=ZxoYdq+ijszk2woLu8oYLBLYkmE2KQ@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu: Pretty-print context fault related regs
To: Pranjal Shrivastava <praan@google.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	Stephen Boyd <swboyd@chromium.org>, Robin Murphy <robin.murphy@arm.com>, 
	Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jerry Snitselaar <jsnitsel@redhat.com>, Rob Herring <robh@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Georgi Djakov <quic_c_gdjako@quicinc.com>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 12:08=E2=80=AFPM Pranjal Shrivastava <praan@google.=
com> wrote:
>
> Hi Rob,
>
>
> On Wed, Jun 26, 2024 at 10:08=E2=80=AFPM Rob Clark <robdclark@gmail.com> =
wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Parse out the bitfields for easier-to-read fault messages.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> > I kept with the dev_err, which matches qcom_smmu_context_fault.  It is
> > only adding two extra lines, and it is ratelimited.
> >
> > I also converted qcom_smmu_context_fault() to use the helpers to do the
> > parsing, rather than more or less duplicating.
> >
> >  .../iommu/arm/arm-smmu/arm-smmu-qcom-debug.c  | 21 +++---
> >  drivers/iommu/arm/arm-smmu/arm-smmu.c         | 70 ++++++++++++++++++-
> >  drivers/iommu/arm/arm-smmu/arm-smmu.h         | 58 +++++++++------
> >  3 files changed, 110 insertions(+), 39 deletions(-)
> >
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers=
/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > index 552199cbd9e2..ee7eab273e1a 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > @@ -429,22 +429,17 @@ irqreturn_t qcom_smmu_context_fault(int irq, void=
 *dev)
> >                 phys_addr_t phys_atos =3D qcom_smmu_verify_fault(smmu_d=
omain, iova, fsr);
> >
> >                 if (__ratelimit(&_rs)) {
> > +                       char buf[80];
>
> Super Nit: I'm not a fan of hardcoding the buffer size but I'm also not s=
ure
> if this makes a strong enough case for a macro definition. Any thoughts, =
anyone?
>
> > +
> >                         dev_err(smmu->dev,
> >                                 "Unhandled context fault: fsr=3D0x%x, i=
ova=3D0x%08lx, fsynr=3D0x%x, cbfrsynra=3D0x%x, cb=3D%d\n",
> >                                 fsr, iova, fsynr, cbfrsynra, idx);
> > -                       dev_err(smmu->dev,
> > -                               "FSR    =3D %08x [%s%s%s%s%s%s%s%s%s], =
SID=3D0x%x\n",
> > -                               fsr,
> > -                               (fsr & 0x02) ? "TF " : "",
> > -                               (fsr & 0x04) ? "AFF " : "",
> > -                               (fsr & 0x08) ? "PF " : "",
> > -                               (fsr & 0x10) ? "EF " : "",
> > -                               (fsr & 0x20) ? "TLBMCF " : "",
> > -                               (fsr & 0x40) ? "TLBLKF " : "",
> > -                               (fsr & 0x80) ? "MHF " : "",
> > -                               (fsr & 0x40000000) ? "SS " : "",
> > -                               (fsr & 0x80000000) ? "MULTI " : "",
> > -                               cbfrsynra);
> > +
> > +                       arm_smmu_parse_fsr(buf, fsr);
> > +                       dev_err(smmu->dev, "FSR: %s\n", buf);
> > +
> > +                       arm_smmu_parse_fsynr0(buf, fsynr);
> > +                       dev_err(smmu->dev, "FSYNR0: %s\n", buf);
> >
> >                         dev_err(smmu->dev,
> >                                 "soft iova-to-phys=3D%pa\n", &phys_soft=
);
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/=
arm-smmu/arm-smmu.c
> > index 87c81f75cf84..7f5ca75d5ebe 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > @@ -405,12 +405,67 @@ static const struct iommu_flush_ops arm_smmu_s2_t=
lb_ops_v1 =3D {
> >         .tlb_add_page   =3D arm_smmu_tlb_add_page_s2_v1,
> >  };
> >
> > +void arm_smmu_parse_fsr(char buf[80], u32 fsr)
> > +{
> > +       static const struct {
> > +               u32 mask;
> > +               const char *name;
> > +       } fsr_bits[] =3D {
> > +               { ARM_SMMU_CB_FSR_MULTI,  "MULTI"  },
> > +               { ARM_SMMU_CB_FSR_SS,     "SS"     },
> > +               { ARM_SMMU_CB_FSR_UUT,    "UUT"    },
> > +               { ARM_SMMU_CB_FSR_ASF,    "ASF"    },
> > +               { ARM_SMMU_CB_FSR_TLBLKF, "TLBLKF" },
> > +               { ARM_SMMU_CB_FSR_TLBMCF, "TLBMCF" },
> > +               { ARM_SMMU_CB_FSR_EF,     "EF"     },
> > +               { ARM_SMMU_CB_FSR_PF,     "PF"     },
> > +               { ARM_SMMU_CB_FSR_AFF,    "AFF"    },
> > +               { ARM_SMMU_CB_FSR_TF,     "TF"     },
> > +       };
> > +       char *p =3D buf;
> > +
> > +       p +=3D sprintf(p, "FORMAT=3D%u",
> > +                    (u32)FIELD_GET(ARM_SMMU_CB_FSR_FORMAT, fsr));
> > +
> > +       for (int i =3D 0; i < ARRAY_SIZE(fsr_bits); i++)
> > +               if (fsr & fsr_bits[i].mask)
> > +                       p +=3D sprintf(p, "|%s", fsr_bits[i].name);
> > +}
>
> Buffer overflow alert: I suggest passing the buffer size as an
> additional "size" parameter to the function.
> Based on that size parameter, we must ensure that `p` doesn't reach
> out of bounds.
> Maybe using snprintf() to limit the num of characters to the "size"
> parameter would make more sense.

I thought about this, but decided that, since nothing about the string
length is attacker controlled, and there were really only two users,
the simpler "just make the buffer big enough" approach would be fine.
It isn't like there will be a whole bunch more bitfields added.

Perhaps I should just add a #define for buf length, and a WARN_ON() if
that is exceeded.  That plus a selftest which calls both the fxns with
register value of ~0 should be enough to prevent any future change
from introducing an overflow.

BR,
-R

> > +
> > +void arm_smmu_parse_fsynr0(char buf[80], u32 fsynr)
>
> Ditto, for this function and also for the signatures in the .h file.
>
>
> > +{
> > +       static const struct {
> > +               u32 mask;
> > +               const char *name;
> > +       } fsynr0_bits[] =3D {
> > +               { ARM_SMMU_CB_FSYNR0_WNR,    "WNR"    },
> > +               { ARM_SMMU_CB_FSYNR0_PNU,    "PNU"    },
> > +               { ARM_SMMU_CB_FSYNR0_IND,    "IND"    },
> > +               { ARM_SMMU_CB_FSYNR0_NSATTR, "NSATTR" },
> > +               { ARM_SMMU_CB_FSYNR0_PTWF,   "PTWF"   },
> > +               { ARM_SMMU_CB_FSYNR0_AFR,    "AFR"    },
> > +       };
> > +       char *p =3D buf;
> > +
> > +       p +=3D sprintf(p, "S1CBNDX=3D%u",
> > +                    (u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_S1CBNDX, fsynr))=
;
> > +
> > +       for (int i =3D 0; i < ARRAY_SIZE(fsynr0_bits); i++)
> > +               if (fsynr & fsynr0_bits[i].mask)
> > +                       p +=3D sprintf(p, "|%s", fsynr0_bits[i].name);
> > +
> > +       p +=3D sprintf(p, "|PLVL=3D%u",
> > +                    (u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_PLVL, fsynr));
> > +}
> > +
> >  static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
> >  {
> >         u32 fsr, fsynr, cbfrsynra;
> >         unsigned long iova;
> >         struct arm_smmu_domain *smmu_domain =3D dev;
> >         struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> > +       static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
> > +                                     DEFAULT_RATELIMIT_BURST);
> >         int idx =3D smmu_domain->cfg.cbndx;
> >         int ret;
> >
> > @@ -423,13 +478,22 @@ static irqreturn_t arm_smmu_context_fault(int irq=
, void *dev)
> >         cbfrsynra =3D arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(id=
x));
> >
> >         ret =3D report_iommu_fault(&smmu_domain->domain, NULL, iova,
> > -               fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU=
_FAULT_READ);
> > +               fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IO=
MMU_FAULT_READ);
> > +
> > +       if (ret =3D=3D -ENOSYS && __ratelimit(&rs)) {
> > +               char buf[80];
> >
> > -       if (ret =3D=3D -ENOSYS)
> > -               dev_err_ratelimited(smmu->dev,
> > +               dev_err(smmu->dev,
> >                 "Unhandled context fault: fsr=3D0x%x, iova=3D0x%08lx, f=
synr=3D0x%x, cbfrsynra=3D0x%x, cb=3D%d\n",
> >                             fsr, iova, fsynr, cbfrsynra, idx);
> >
> > +               arm_smmu_parse_fsr(buf, fsr);
> > +               dev_err(smmu->dev, "FSR: %s\n", buf);
> > +
> > +               arm_smmu_parse_fsynr0(buf, fsynr);
> > +               dev_err(smmu->dev, "FSYNR0: %s\n", buf);
> > +       }
> > +
> >         arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
> >         return IRQ_HANDLED;
> >  }
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/=
arm-smmu/arm-smmu.h
> > index 4765c6945c34..763ea52fca64 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > @@ -196,34 +196,46 @@ enum arm_smmu_cbar_type {
> >  #define ARM_SMMU_CB_PAR_F              BIT(0)
> >
> >  #define ARM_SMMU_CB_FSR                        0x58
> > -#define ARM_SMMU_FSR_MULTI             BIT(31)
> > -#define ARM_SMMU_FSR_SS                        BIT(30)
> > -#define ARM_SMMU_FSR_UUT               BIT(8)
> > -#define ARM_SMMU_FSR_ASF               BIT(7)
> > -#define ARM_SMMU_FSR_TLBLKF            BIT(6)
> > -#define ARM_SMMU_FSR_TLBMCF            BIT(5)
> > -#define ARM_SMMU_FSR_EF                        BIT(4)
> > -#define ARM_SMMU_FSR_PF                        BIT(3)
> > -#define ARM_SMMU_FSR_AFF               BIT(2)
> > -#define ARM_SMMU_FSR_TF                        BIT(1)
> > -
> > -#define ARM_SMMU_FSR_IGN               (ARM_SMMU_FSR_AFF |            =
 \
> > -                                        ARM_SMMU_FSR_ASF |            =
 \
> > -                                        ARM_SMMU_FSR_TLBMCF |         =
 \
> > -                                        ARM_SMMU_FSR_TLBLKF)
> > -
> > -#define ARM_SMMU_FSR_FAULT             (ARM_SMMU_FSR_MULTI |          =
 \
> > -                                        ARM_SMMU_FSR_SS |             =
 \
> > -                                        ARM_SMMU_FSR_UUT |            =
 \
> > -                                        ARM_SMMU_FSR_EF |             =
 \
> > -                                        ARM_SMMU_FSR_PF |             =
 \
> > -                                        ARM_SMMU_FSR_TF |             =
 \
> > +#define ARM_SMMU_CB_FSR_MULTI          BIT(31)
> > +#define ARM_SMMU_CB_FSR_SS             BIT(30)
> > +#define ARM_SMMU_CB_FSR_FORMAT         GENMASK(10, 9)
> > +#define ARM_SMMU_CB_FSR_UUT            BIT(8)
> > +#define ARM_SMMU_CB_FSR_ASF            BIT(7)
> > +#define ARM_SMMU_CB_FSR_TLBLKF         BIT(6)
> > +#define ARM_SMMU_CB_FSR_TLBMCF         BIT(5)
> > +#define ARM_SMMU_CB_FSR_EF             BIT(4)
> > +#define ARM_SMMU_CB_FSR_PF             BIT(3)
> > +#define ARM_SMMU_CB_FSR_AFF            BIT(2)
> > +#define ARM_SMMU_CB_FSR_TF             BIT(1)
> > +
> > +void arm_smmu_parse_fsr(char buf[80], u32 fsr);
> > +
> > +#define ARM_SMMU_FSR_IGN               (ARM_SMMU_CB_FSR_AFF |         =
 \
> > +                                        ARM_SMMU_CB_FSR_ASF |         =
 \
> > +                                        ARM_SMMU_CB_FSR_TLBMCF |      =
 \
> > +                                        ARM_SMMU_CB_FSR_TLBLKF)
> > +
> > +#define ARM_SMMU_FSR_FAULT             (ARM_SMMU_CB_FSR_MULTI |       =
 \
> > +                                        ARM_SMMU_CB_FSR_SS |          =
 \
> > +                                        ARM_SMMU_CB_FSR_UUT |         =
 \
> > +                                        ARM_SMMU_CB_FSR_EF |          =
 \
> > +                                        ARM_SMMU_CB_FSR_PF |          =
 \
> > +                                        ARM_SMMU_CB_FSR_TF |          =
 \
> >                                          ARM_SMMU_FSR_IGN)
> >
> >  #define ARM_SMMU_CB_FAR                        0x60
> >
> >  #define ARM_SMMU_CB_FSYNR0             0x68
> > -#define ARM_SMMU_FSYNR0_WNR            BIT(4)
> > +#define ARM_SMMU_CB_FSYNR0_PLVL                GENMASK(1, 0)
> > +#define ARM_SMMU_CB_FSYNR0_WNR         BIT(4)
> > +#define ARM_SMMU_CB_FSYNR0_PNU         BIT(5)
> > +#define ARM_SMMU_CB_FSYNR0_IND         BIT(6)
> > +#define ARM_SMMU_CB_FSYNR0_NSATTR      BIT(8)
> > +#define ARM_SMMU_CB_FSYNR0_PTWF                BIT(10)
> > +#define ARM_SMMU_CB_FSYNR0_AFR         BIT(11)
> > +#define ARM_SMMU_CB_FSYNR0_S1CBNDX     GENMASK(23, 16)
> > +
> > +void arm_smmu_parse_fsynr0(char buf[80], u32 fsynr);
>
> Apart from the buffer overflow, everything else looks fine to me.
>
> >
> >  #define ARM_SMMU_CB_FSYNR1             0x6c
> >
> > --
> > 2.45.2
> >

