Return-Path: <linux-arm-msm+bounces-24320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E959185CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 17:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE45D284880
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 15:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 093BA18A94B;
	Wed, 26 Jun 2024 15:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mLKc3Zq/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3C5185083
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 15:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719415738; cv=none; b=mAY5WhuzFBDLhLq+uPNKaSwZMFE9mOzXFXfiOWEtGxLPHTnrYIzHsREYdYStkT7RicpRaWy4YUsXPeKl3r75H1rLaUuHgtewD5ql/HgFPGyp9oO/pka1rDln2zBUrUtqgnPZQf1i58cENIDS3mDGSlylBEb8XQI+k9vgslCPpus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719415738; c=relaxed/simple;
	bh=d7V8ajOax19ShggO5Yvq8TxL5V+kA7fuldVhWtQSP74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RUtaNj02w1gcD41gcoQ6HzfFA5o6P7wwBwEF7ZJkfyhC25QPOIUzVN00eEqF32/KsCBeg2sNEAqSJonCHExhoSW5UiF8NCz18fKGZzf0xdKDPFRCpjRzHwtqqH1ctuhU4XvKT2vRHkw1i8tWxQy/zSxMGo3D5cuUHq7N9NDbGu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mLKc3Zq/; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-445022f78e1so330541cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 08:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719415736; x=1720020536; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRftefyPE2FEEdS2U+dSaJ3G8zAa0YhXRtFQvPo8d8w=;
        b=mLKc3Zq/nAAXdBtiuE8RRU0QwluIml9HSNSQeZXLxdqX+FTDertGKS0xnBJS2JiIzw
         CF2OhZzoULru92aBqXiXhNT2A2tiuTdii4+LJXRzaA0UBYJX/vQBcavmTPMYFIdcryyl
         EWVLKAbyoKRSF2xp0bZFlwLa3GTD2Ael60EZOnTK9g1QT32QwdZzoUDTJTnWIGZi08Z2
         eHOAEKONy2LZOqfrpBviqe7fZVoelpAAXScbPW1QBpze3ZkqSV+QtFOA34i9s+/5MBTp
         /RxhTjq8S57/gjen5TBayMXxwQ2pV4hJz/KyOFxh/Pv5+tTLNMhM4D7gd4An29aAy1NW
         hnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719415736; x=1720020536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SRftefyPE2FEEdS2U+dSaJ3G8zAa0YhXRtFQvPo8d8w=;
        b=oJ4FtPTr3aFu3uNfs8+eVOXieJp2l5No7Xa23zKgJ7jgVM1fcCTmVulQZUe/xHdXpQ
         7aq4UnQhzHDF2s+DrKmp9f0auf0+B0YzQUoXjm5V46LPnTNPfAoeHU29u0N5K39RriYJ
         V5kqO228z+rJsr4gVmBa9KFfM2wsHR46qCdsDsl8fLvImWFo7+IklpDwwB3XUqGFJAwu
         biLxvUennYIFLLBDaNevPTf92krdKkNlAdpEVvU/JuZScV9XVl5lMxcd2d/GHthHtgsI
         tGaF737810JBo/g1E9XLOPl5qO0xtEh9b6XUuXbxVvw9ov5ONdXyAXdhfyc12rhTnOWW
         66DQ==
X-Forwarded-Encrypted: i=1; AJvYcCUysTGIR/U+rWdmQTxzEqc9gLvslXI+ONoi7rgHNghYtI4sR2SCdWJQeL4GsLI0b83YLX43adTjVVcEzzbCtbq7gWKcDr9G0KfChxbFjg==
X-Gm-Message-State: AOJu0YzRca6KWO7jLPlNvDGy4e4YoByiX3kUrG0/WrEkPrstgRcuClXJ
	oxt2eUwtOBv0t9bwzWB7+kw+U5uEPiznYp+hw54vo8Ld83RmRNfRjztJ1hWt3zrAm3AYy3ouI6k
	oZrYvirU2kxjebXE2KJvJNx0qdeNdNgV2w3QI
X-Google-Smtp-Source: AGHT+IGNXlIJojnCw3vP27EMr0tfl20kzfFFYUIBHLc4Zavk6yO+41tlFJ2lmTUbSQXjT/wcoCSIXEpidD6XDv7DyBo=
X-Received: by 2002:a05:622a:1481:b0:441:4920:1fc4 with SMTP id
 d75a77b69052e-44504c290demr3687761cf.28.1719415735897; Wed, 26 Jun 2024
 08:28:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240604150136.493962-1-robdclark@gmail.com> <6f97a4b4-cdbe-466c-80d4-adc8da305f75@arm.com>
 <CAF6AEGv+Ge2SD4=j1QhXfG+KkOzvFM+LieCqKuM20YL8gp5PRQ@mail.gmail.com>
 <80fc63e5-0e79-47b3-91ae-90d7c7bc3f66@arm.com> <CAF6AEGuDq=YcyKuTfr1xZtff+VGyeeVWe40E4KEy--umwepcEQ@mail.gmail.com>
 <CAN6iL-QqZXsFDB=3yCfqQeF0H5QaS_Trm62FxvDF-+qPoQ-VNA@mail.gmail.com> <CAF6AEGv8LgAA91C+SkmDZ2besZyA8iCpgn6BStBJ7htZ21T9dg@mail.gmail.com>
In-Reply-To: <CAF6AEGv8LgAA91C+SkmDZ2besZyA8iCpgn6BStBJ7htZ21T9dg@mail.gmail.com>
From: Pranjal Shrivastava <praan@google.com>
Date: Wed, 26 Jun 2024 20:58:42 +0530
Message-ID: <CAN6iL-S+khdPZMB46dgwPucMnx=-pFiV_rGzM7rpAM2CM4_dhA@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu: Pretty-print context fault related regs
To: Rob Clark <robdclark@gmail.com>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>, 
	Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jerry Snitselaar <jsnitsel@redhat.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 9:37=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Tue, Jun 18, 2024 at 8:47=E2=80=AFAM Pranjal Shrivastava <praan@google=
.com> wrote:
> >
> > On Tue, Jun 18, 2024 at 8:28=E2=80=AFPM Rob Clark <robdclark@gmail.com>=
 wrote:
> > >
> > > On Mon, Jun 17, 2024 at 10:33=E2=80=AFAM Robin Murphy <robin.murphy@a=
rm.com> wrote:
> > > >
> > > > On 2024-06-17 5:18 pm, Rob Clark wrote:
> > > > > On Mon, Jun 17, 2024 at 6:07=E2=80=AFAM Robin Murphy <robin.murph=
y@arm.com> wrote:
> > > > >>
> > > > >> On 04/06/2024 4:01 pm, Rob Clark wrote:
> > > > >>> From: Rob Clark <robdclark@chromium.org>
> > > > >>>
> > > > >>> Parse out the bitfields for easier-to-read fault messages.
> > > > >>>
> > > > >>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > >>> ---
> > > > >>> Stephen was wanting easier to read fault messages.. so I typed =
this up.
> > > > >>>
> > > > >>> Resend with the new iommu list address
> > > > >>>
> > > > >>>    drivers/iommu/arm/arm-smmu/arm-smmu.c | 53 +++++++++++++++++=
++++++++--
> > > > >>>    drivers/iommu/arm/arm-smmu/arm-smmu.h |  5 +++
> > > > >>>    2 files changed, 54 insertions(+), 4 deletions(-)
> > > > >>>
> > > > >>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/io=
mmu/arm/arm-smmu/arm-smmu.c
> > > > >>> index c572d877b0e1..06712d73519c 100644
> > > > >>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > >>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > >>> @@ -411,6 +411,8 @@ static irqreturn_t arm_smmu_context_fault(i=
nt irq, void *dev)
> > > > >>>        unsigned long iova;
> > > > >>>        struct arm_smmu_domain *smmu_domain =3D dev;
> > > > >>>        struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> > > > >>> +     static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTER=
VAL,
> > > > >>> +                                   DEFAULT_RATELIMIT_BURST);
> > > > >>>        int idx =3D smmu_domain->cfg.cbndx;
> > > > >>>        int ret;
> > > > >>>
> > > > >>> @@ -425,10 +427,53 @@ static irqreturn_t arm_smmu_context_fault=
(int irq, void *dev)
> > > > >>>        ret =3D report_iommu_fault(&smmu_domain->domain, NULL, i=
ova,
> > > > >>>                fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE =
: IOMMU_FAULT_READ);
> > > > >>>
> > > > >>> -     if (ret =3D=3D -ENOSYS)
> > > > >>> -             dev_err_ratelimited(smmu->dev,
> > > > >>> -             "Unhandled context fault: fsr=3D0x%x, iova=3D0x%0=
8lx, fsynr=3D0x%x, cbfrsynra=3D0x%x, cb=3D%d\n",
> > > > >>> -                         fsr, iova, fsynr, cbfrsynra, idx);
> > > > >>> +     if (ret =3D=3D -ENOSYS && __ratelimit(&rs)) {
> > > > >>> +             static const struct {
> > > > >>> +                     u32 mask; const char *name;
> > > > >>> +             } fsr_bits[] =3D {
> > > > >>> +                     { ARM_SMMU_FSR_MULTI,  "MULTI" },
> > > > >>> +                     { ARM_SMMU_FSR_SS,     "SS"    },
> > > > >>> +                     { ARM_SMMU_FSR_UUT,    "UUT"   },
> > > > >>> +                     { ARM_SMMU_FSR_ASF,    "ASF"   },
> > > > >>> +                     { ARM_SMMU_FSR_TLBLKF, "TLBLKF" },
> > > > >>> +                     { ARM_SMMU_FSR_TLBMCF, "TLBMCF" },
> > > > >>> +                     { ARM_SMMU_FSR_EF,     "EF"     },
> > > > >>> +                     { ARM_SMMU_FSR_PF,     "PF"     },
> > > > >>> +                     { ARM_SMMU_FSR_AFF,    "AFF"    },
> > > > >>> +                     { ARM_SMMU_FSR_TF,     "TF"     },
> > > > >>> +             }, fsynr0_bits[] =3D {
> > > > >>> +                     { ARM_SMMU_FSYNR0_WNR,    "WNR"    },
> > > > >>> +                     { ARM_SMMU_FSYNR0_PNU,    "PNU"    },
> > > > >>> +                     { ARM_SMMU_FSYNR0_IND,    "IND"    },
> > > > >>> +                     { ARM_SMMU_FSYNR0_NSATTR, "NSATTR" },
> > > > >>> +                     { ARM_SMMU_FSYNR0_PTWF,   "PTWF"   },
> > > > >>> +                     { ARM_SMMU_FSYNR0_AFR,    "AFR"    },
> > > > >>> +             };
> > > > >>> +
> > > > >>> +             pr_err("%s %s: Unhandled context fault: fsr=3D0x%=
x (",
> > > > >>> +                    dev_driver_string(smmu->dev), dev_name(smm=
u->dev), fsr);
> > > > >>> +
> > > > >>> +             for (int i =3D 0, n =3D 0; i < ARRAY_SIZE(fsr_bit=
s); i++) {
> > > > >>> +                     if (fsr & fsr_bits[i].mask) {
> > > > >>> +                             pr_cont("%s%s", (n > 0) ? "|" : "=
", fsr_bits[i].name);
> > > > >>
> > > > >> Given that SMMU faults have a high likelihood of correlating wit=
h other
> > > > >> errors, e.g. the initiating device also reporting that it got an=
 abort
> > > > >> back, this much pr_cont is a recipe for an unreadable mess. Furt=
hermore,
> > > > >> just imagine how "helpful" this would be when faults in two cont=
exts are
> > > > >> reported by two different CPUs at the same time ;)
> > > > >
> > > > > It looks like arm_smmu_context_fault() is only used with non-thre=
aded
> > > > > irq's.  And this fallback is only used if driver doesn't register=
 it's
> > > > > own fault handler.  So I don't think this will be a problem.
> > > >
> > > > You don't think two different IRQs can fire on two different CPUs a=
t the
> > > > same time (or close to)? It's already bad enough when multiple CPUs
> > > > panic and one has to pick apart line-by-line interleaving of the
> > > > registers/stacktraces - imagine how much more utterly unusable that
> > > > would be with bits of different dumps randomly pr_cont'ed together =
onto
> > > > the same line(s)...
> > >
> > > _different_ irq's, yes
> > >
> > > Anyways, the reason for pr_cont() was that there wasn't another
> > > reasonable way to decide where separator chars were needed with a
> > > single pr_err().  I could instead construct a string on stack and
> > > print that in a single call, but pr_cont() seemed like the more
> > > reasonable alternative.
> > >
> > > BR,
> > > -R
> >
> > The string approach sounds good to me, if possible, let's break this
> > out into a helper function, something like `arm_smmu_log_ctx_fault`
> > and put it under a module parameter, I guess? Not sure if this
> > requires a new Kconfig option, would like Robin's opinion on this.
>
> I did notice that qcom_smmu_context_fault() appeared recently, also
> adding similar pretty-print.. but only for things with a tbu driver
> (and a bit more open coded).  So a helper would probably make sense.
>
> Less sure about mod param or Kconfig, but I tend to be of the opinion
> that the kernel already has too much configurability.. others may have
> a different view.
>
> BR,
> -R

Ping. Bringing this up again.
I think having something like a dev_dbg would work too.
Any thoughts? I'm okay with Rob's suggestion TBH.

Thanks,
Pranjal

>
> > Thanks,
> > Pranjal
> >
> > >
> > > > Even when unrelated stuff gets interleaved because other CPUs just
> > > > happen to be calling printk() at the same time for unrelated reason=
s
> > > > it's still annoying, and pr_cont makes a bigger mess than not.
> > > > >> I'd prefer to retain the original message as-is, so there is at =
least
> > > > >> still an unambiguous "atomic" view of a fault's entire state, th=
en
> > > > >> follow it with a decode more in the style of arm64's ESR logging=
. TBH I
> > > > >> also wouldn't disapprove of hiding the additional decode behind =
a
> > > > >> command-line/runtime parameter, since a fault storm can cripple =
a system
> > > > >> enough as it is, without making the interrupt handler spend even=
 longer
> > > > >> printing to a potentially slow console.
> > > > >
> > > > > It _is_ ratelimited.  But we could perhaps use a higher loglevel =
(pr_debug?)
> > > >
> > > > Yeah, I'd have no complaint with pr_debug/dev_dbg either, if that s=
uits
> > > > your use case. True that the ratelimit may typically mitigate the
> > > > overall impact, but still in the worst case with a sufficiently slo=
w
> > > > console and/or a sufficiently large amount to print per __ratelimit=
()
> > > > call, it can end up being slow enough to stay below the threshold. =
Don't
> > > > ask me how I know that :)
> > > >
> > > > Thanks,
> > > > Robin.

