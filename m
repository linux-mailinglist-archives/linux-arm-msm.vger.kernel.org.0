Return-Path: <linux-arm-msm+bounces-23104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A3D90D65A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 16:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE6B01C24FA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 14:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64A413BC35;
	Tue, 18 Jun 2024 14:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0RHtHQJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C084D27446;
	Tue, 18 Jun 2024 14:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718722687; cv=none; b=gfHikZ+xHMYQp+BYOBKTStbU69aO8iXqXJQkK4IEieNaiw1JuvxyQ8iTR3JysCIyVexU3Vc+YAMxYSKOrHcklmIa+FLNl3EZRbbkt8O0hjNJelJJnbcFg1w4Ft+frwxSR1skIdoM1Bn+PmRT9frMYS3C51q9UeEkI0hg45E1Oh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718722687; c=relaxed/simple;
	bh=1ptZqLkMTfxupAwOh4dgqcAstmXsiW9awtMj8r7pD+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BxFADOWEDS05ch2eIqxhR+w9yuvFomEuBfd9kq/4cA1kdOE5Fcw8Zpatk0iHznRGhciHultuznBLUjcAUlwCRbUegbtzTeZ5zorsT3mwvchHpMx4sHA5AbGnxMlMqkiKxyGnWm5gSjBKkKj+XuSB08NeMIpAK2xvoQqEWSYIn80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W0RHtHQJ; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57ccd1111aeso3572328a12.0;
        Tue, 18 Jun 2024 07:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718722684; x=1719327484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euIaBgMQ5XrC0hxAR5VdiXGMFM0BZnCPBqtUn7+yuiQ=;
        b=W0RHtHQJFnRZ3DEShLmDtYI4UAxbyF8colMXwYh/6XfYjAmmNv6JUtFw4vftJO54H2
         d3GlesoDZUwnIbeok51BM76kb1c9wD7irPk+hE+NBGJhXrduXQ3VorRSzTUM7XOjmIG8
         CfLWumOe/jKy8ENW6vmWECtgM0KFd2nc5SPKu9oz7yeiZ3gwT8081fRD+r4ksK4y33c+
         AY35IwbrrcV31+DP54dCqaHRwcDV6Ehzn7IpYVTgj21MsJeIhRJp5F++nHW6EaSSQCOa
         n76gZyR2oQKn6QmPXARVzIYCLgYEL1A2y48Y6dj/hZZ/cPWNJCd7Vj0FhChJQQEpIg8L
         Db9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718722684; x=1719327484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=euIaBgMQ5XrC0hxAR5VdiXGMFM0BZnCPBqtUn7+yuiQ=;
        b=RaupXlxBMejDPxCS6PaG04s9pCblXjZm7DG7S7qeyeDv67BcgoGTJ60wqF/g1PYpTX
         Y+lLbqjW/G+U1N952hLcuul0M3csid6xZxT1tSzG0mDlgtgkZZ1wvJThmLoA53AYGA0l
         vXjyJw8cWJfU9z24URlOYVctl/ToXER3A14wLZdyQYgHuvPtEUFk7nekKEpNKgOnxUik
         Dyw1PM8CUvLdDqBQ0/RObEGfWAqz5bYroREesZwhPWNyGTeZbbp9i4CegttldAfJwUmZ
         sX9Os8aK02JyrUBZtyZkIY44HAfLNCqhLUODIWV2+Mt7S5j4dQVC2ntCSGAcuTVGT+YS
         CX9A==
X-Forwarded-Encrypted: i=1; AJvYcCWusJlVTutiRD/WFmgt5VN/lTt1V/BcqV/vv91BZ7DKQfo3L5Vu+Uxa+snvx8bxVUAyh043gH3iiRnF0iBrY5i79c6I91zCDzx/akRXA1ERUC8ApOyQsyj8bM9frZHxnjKYxUWchXfbfeFmug==
X-Gm-Message-State: AOJu0YzsBoA1yh2x6kS8j2xx0P10qp0e1maRorTA86+a4RcNyTY8YSPV
	jBcrWcwxzW0+MCQ6BVZ10H2lNvrjgV41mzE5+eARwlWpWUZCWvY1b3ZF6xebqS8EG7jDxyp7Csn
	xHjG9PIpIkyh2seumXeKUR0yAOfM=
X-Google-Smtp-Source: AGHT+IEmhog+BWG7FrA97+gLmqkal9WiXByxlXYPuq9mme4/HE5ej0G88ynXv1Nz4ZHJ7s60RtJgodzGJ2R5h2Na1Ac=
X-Received: by 2002:a50:c05b:0:b0:57c:6b68:3bb1 with SMTP id
 4fb4d7f45d1cf-57cbd6a5a83mr7242466a12.42.1718722683856; Tue, 18 Jun 2024
 07:58:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240604150136.493962-1-robdclark@gmail.com> <6f97a4b4-cdbe-466c-80d4-adc8da305f75@arm.com>
 <CAF6AEGv+Ge2SD4=j1QhXfG+KkOzvFM+LieCqKuM20YL8gp5PRQ@mail.gmail.com> <80fc63e5-0e79-47b3-91ae-90d7c7bc3f66@arm.com>
In-Reply-To: <80fc63e5-0e79-47b3-91ae-90d7c7bc3f66@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 18 Jun 2024 07:57:51 -0700
Message-ID: <CAF6AEGuDq=YcyKuTfr1xZtff+VGyeeVWe40E4KEy--umwepcEQ@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu: Pretty-print context fault related regs
To: Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@chromium.org>, 
	Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Jerry Snitselaar <jsnitsel@redhat.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 10:33=E2=80=AFAM Robin Murphy <robin.murphy@arm.com=
> wrote:
>
> On 2024-06-17 5:18 pm, Rob Clark wrote:
> > On Mon, Jun 17, 2024 at 6:07=E2=80=AFAM Robin Murphy <robin.murphy@arm.=
com> wrote:
> >>
> >> On 04/06/2024 4:01 pm, Rob Clark wrote:
> >>> From: Rob Clark <robdclark@chromium.org>
> >>>
> >>> Parse out the bitfields for easier-to-read fault messages.
> >>>
> >>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>> ---
> >>> Stephen was wanting easier to read fault messages.. so I typed this u=
p.
> >>>
> >>> Resend with the new iommu list address
> >>>
> >>>    drivers/iommu/arm/arm-smmu/arm-smmu.c | 53 +++++++++++++++++++++++=
++--
> >>>    drivers/iommu/arm/arm-smmu/arm-smmu.h |  5 +++
> >>>    2 files changed, 54 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/ar=
m/arm-smmu/arm-smmu.c
> >>> index c572d877b0e1..06712d73519c 100644
> >>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> >>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> >>> @@ -411,6 +411,8 @@ static irqreturn_t arm_smmu_context_fault(int irq=
, void *dev)
> >>>        unsigned long iova;
> >>>        struct arm_smmu_domain *smmu_domain =3D dev;
> >>>        struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> >>> +     static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
> >>> +                                   DEFAULT_RATELIMIT_BURST);
> >>>        int idx =3D smmu_domain->cfg.cbndx;
> >>>        int ret;
> >>>
> >>> @@ -425,10 +427,53 @@ static irqreturn_t arm_smmu_context_fault(int i=
rq, void *dev)
> >>>        ret =3D report_iommu_fault(&smmu_domain->domain, NULL, iova,
> >>>                fsynr & ARM_SMMU_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMM=
U_FAULT_READ);
> >>>
> >>> -     if (ret =3D=3D -ENOSYS)
> >>> -             dev_err_ratelimited(smmu->dev,
> >>> -             "Unhandled context fault: fsr=3D0x%x, iova=3D0x%08lx, f=
synr=3D0x%x, cbfrsynra=3D0x%x, cb=3D%d\n",
> >>> -                         fsr, iova, fsynr, cbfrsynra, idx);
> >>> +     if (ret =3D=3D -ENOSYS && __ratelimit(&rs)) {
> >>> +             static const struct {
> >>> +                     u32 mask; const char *name;
> >>> +             } fsr_bits[] =3D {
> >>> +                     { ARM_SMMU_FSR_MULTI,  "MULTI" },
> >>> +                     { ARM_SMMU_FSR_SS,     "SS"    },
> >>> +                     { ARM_SMMU_FSR_UUT,    "UUT"   },
> >>> +                     { ARM_SMMU_FSR_ASF,    "ASF"   },
> >>> +                     { ARM_SMMU_FSR_TLBLKF, "TLBLKF" },
> >>> +                     { ARM_SMMU_FSR_TLBMCF, "TLBMCF" },
> >>> +                     { ARM_SMMU_FSR_EF,     "EF"     },
> >>> +                     { ARM_SMMU_FSR_PF,     "PF"     },
> >>> +                     { ARM_SMMU_FSR_AFF,    "AFF"    },
> >>> +                     { ARM_SMMU_FSR_TF,     "TF"     },
> >>> +             }, fsynr0_bits[] =3D {
> >>> +                     { ARM_SMMU_FSYNR0_WNR,    "WNR"    },
> >>> +                     { ARM_SMMU_FSYNR0_PNU,    "PNU"    },
> >>> +                     { ARM_SMMU_FSYNR0_IND,    "IND"    },
> >>> +                     { ARM_SMMU_FSYNR0_NSATTR, "NSATTR" },
> >>> +                     { ARM_SMMU_FSYNR0_PTWF,   "PTWF"   },
> >>> +                     { ARM_SMMU_FSYNR0_AFR,    "AFR"    },
> >>> +             };
> >>> +
> >>> +             pr_err("%s %s: Unhandled context fault: fsr=3D0x%x (",
> >>> +                    dev_driver_string(smmu->dev), dev_name(smmu->dev=
), fsr);
> >>> +
> >>> +             for (int i =3D 0, n =3D 0; i < ARRAY_SIZE(fsr_bits); i+=
+) {
> >>> +                     if (fsr & fsr_bits[i].mask) {
> >>> +                             pr_cont("%s%s", (n > 0) ? "|" : "", fsr=
_bits[i].name);
> >>
> >> Given that SMMU faults have a high likelihood of correlating with othe=
r
> >> errors, e.g. the initiating device also reporting that it got an abort
> >> back, this much pr_cont is a recipe for an unreadable mess. Furthermor=
e,
> >> just imagine how "helpful" this would be when faults in two contexts a=
re
> >> reported by two different CPUs at the same time ;)
> >
> > It looks like arm_smmu_context_fault() is only used with non-threaded
> > irq's.  And this fallback is only used if driver doesn't register it's
> > own fault handler.  So I don't think this will be a problem.
>
> You don't think two different IRQs can fire on two different CPUs at the
> same time (or close to)? It's already bad enough when multiple CPUs
> panic and one has to pick apart line-by-line interleaving of the
> registers/stacktraces - imagine how much more utterly unusable that
> would be with bits of different dumps randomly pr_cont'ed together onto
> the same line(s)...

_different_ irq's, yes

Anyways, the reason for pr_cont() was that there wasn't another
reasonable way to decide where separator chars were needed with a
single pr_err().  I could instead construct a string on stack and
print that in a single call, but pr_cont() seemed like the more
reasonable alternative.

BR,
-R

> Even when unrelated stuff gets interleaved because other CPUs just
> happen to be calling printk() at the same time for unrelated reasons
> it's still annoying, and pr_cont makes a bigger mess than not.
> >> I'd prefer to retain the original message as-is, so there is at least
> >> still an unambiguous "atomic" view of a fault's entire state, then
> >> follow it with a decode more in the style of arm64's ESR logging. TBH =
I
> >> also wouldn't disapprove of hiding the additional decode behind a
> >> command-line/runtime parameter, since a fault storm can cripple a syst=
em
> >> enough as it is, without making the interrupt handler spend even longe=
r
> >> printing to a potentially slow console.
> >
> > It _is_ ratelimited.  But we could perhaps use a higher loglevel (pr_de=
bug?)
>
> Yeah, I'd have no complaint with pr_debug/dev_dbg either, if that suits
> your use case. True that the ratelimit may typically mitigate the
> overall impact, but still in the worst case with a sufficiently slow
> console and/or a sufficiently large amount to print per __ratelimit()
> call, it can end up being slow enough to stay below the threshold. Don't
> ask me how I know that :)
>
> Thanks,
> Robin.

