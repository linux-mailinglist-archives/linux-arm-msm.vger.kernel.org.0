Return-Path: <linux-arm-msm+bounces-56959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E0EAAC777
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 16:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 535AC3A55C1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 14:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD5227B501;
	Tue,  6 May 2025 14:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UCo+Yj/X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED7B280306
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 14:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746540499; cv=none; b=fN9FESULy++DbbkiuqebhBciY1hE4zJGx1IXaZH6gVsS7NFDQ+9puAs/Wg9tLMLyvBovVF/WACbVnHQQLTtxWlWs45CXZsjhxwT7sLXVW3EmwlP9sOZKLC9B9aP+w6YEsDbxTHwdGIOLHAP28toI6kcr3oYC8EhOln3HCIcomQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746540499; c=relaxed/simple;
	bh=yJcWm3LDiTa5MEQ82in3Wq+Kjhnzjcsib1HDSIdGxrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IRBo/74leZ6gVNMvRIiFeO0zBKJliB4P40YQ6mrJvWNBWgZNcGIE3ifLuinE75TRNTrpUHLn+LiLcIXT48uXLiMbRKvfHZ2QaT/3JlJ8fAH4NnCicYDpEKwgdIR8hb6FHuIWSGGsdRUyKX1Ohw1NX2QLOjy3rUgLdAI3/VdH0uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCo+Yj/X; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b1f2a3bf3c8so812639a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 07:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746540497; x=1747145297; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMambQHHu9+TC3RPEGjqmbblfLTvr1IrSGG4pLfvj0w=;
        b=UCo+Yj/Xq9B/9PKN86trEJyL0zJKLGA9+XcgkHjgbmpsdRU1ZQjvPW85Uimq/CGpOM
         yjh63y7MIvHCma8HutgUQceml97JA11JggiaJEYoiztbnw6t81PCGtu8M1nH6/m/nnO1
         Tv+j5n19Nveh828umuNx9zliUe9w2PehZzQVgb4wVj9JtAWrUBZVwDl6gGEVTsbVWoKM
         3yyOALHefCx32F4kvBIl6boZSqO1rCr3azSAq75JDuTHMO0RdYGK2yZ78wfHZGNy6k1m
         SuyF7tK8ltftLizkrfi+xpl+5c5y107LMdo5tNfAu2b1q8h64v/8Mkdhsc0Ew8lFcEib
         rFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746540497; x=1747145297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMambQHHu9+TC3RPEGjqmbblfLTvr1IrSGG4pLfvj0w=;
        b=FCxYyaesqoLFUr33GnnRa6KSSiTmP/NcQip2PpRE9Ci725a6HuGUWKlw8pSwSMFIfa
         jOkevBG7z6qXg7gtwFMs4EH3hY97oHkT/iBtagoEyjLmeTUO4krIu1M4LN/UFhYY3lRD
         1ezDS1Yvr9cN7yk1l4BchutuQt/HFpHt137AMw9f5MooBgoPeanUtbLGFDYWcjrq0BiB
         SV4n3Sx37mVA0cuqEDsotFlLRVyW3ELcnGKq3AafXOIHwWwoUgIc1jEMhJnWUXid4q77
         ZGeyuxrVT4FCFDZUSnv27ViszZXuO1kUT8VQAqo4HzrzHgXGSmg6qNDyt1oFaTPmosGf
         WFdQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2TfW580bsVPSDn2f7IrSbTmFZ87JzIGqWA2g2XzcBLFg4EhLsW34lZqZf5S5WJ21vvLYxZfLIaEZN1Mkt@vger.kernel.org
X-Gm-Message-State: AOJu0YwJHFRKNYnNop0OYUsNYqEQMqPESN04CC911t6AZe9BfPPzROhP
	mY3n5+vUuerIMzytd1JJ7jzb0Q4hyecxAA1ZQJGQhD6UjrACmYTm30EZFOMQYhNtplpT0Isz32q
	7w8PnDgQbUFuO3JtNEQrJ/SEyFMM=
X-Gm-Gg: ASbGncsQln+2Mg/haky8/jSa+xZtVVsyXbnvsqEmf+M6LvtoXTEGZR4DcpxsIcvLjta
	9PWhnXjq4HAPBJx11lBRrNYie1zdLd+m6MWYWwr0YlMjFCiyJRt18h+T9e329vxILuFCbB3inCX
	0BMczWuuDit8vDBOidEVtv6w==
X-Google-Smtp-Source: AGHT+IF23nCrJaH3Mng+oDEHNLDP6N6PfnCkKREry5Wzy8HtvIefEq1olFphNquoaJEf3Hy0gX7xlzc7Wvr6z2YpGbI=
X-Received: by 2002:a17:903:41c2:b0:224:88c:9253 with SMTP id
 d9443c01a7336-22e102f3293mr93572875ad.6.1746540496500; Tue, 06 May 2025
 07:08:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
 <20250319-msm-gpu-fault-fixes-next-v5-3-97561209dd8c@gmail.com> <20250506122449.GB723@willie-the-truck>
In-Reply-To: <20250506122449.GB723@willie-the-truck>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 6 May 2025 10:08:05 -0400
X-Gm-Features: ATxdqUGXywpmRh-T8ACY0CkrWhxLattxcHrjANwJCwaesOG_LtpOol-JucgftpU
Message-ID: <CACu1E7FA0M_0Un3qPRNtqy4R_NbaMks6FSkpQZBuyqJpuT-p7w@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
To: Will Deacon <will@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 8:24=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> On Wed, Mar 19, 2025 at 10:44:02AM -0400, Connor Abbott wrote:
> > On some SMMUv2 implementations, including MMU-500, SMMU_CBn_FSR.SS
> > asserts an interrupt. The only way to clear that bit is to resume the
> > transaction by writing SMMU_CBn_RESUME, but typically resuming the
> > transaction requires complex operations (copying in pages, etc.) that
> > can't be done in IRQ context. drm/msm already has a problem, because
> > its fault handler sometimes schedules a job to dump the GPU state and
> > doesn't resume translation until this is complete.
> >
> > Work around this by disabling context fault interrupts until after the
> > transaction is resumed. Because other context banks can share an IRQ
> > line, we may still get an interrupt intended for another context bank,
> > but in this case only SMMU_CBn_FSR.SS will be asserted and we can skip
> > it assuming that interrupts are disabled which is accomplished by
> > removing the bit from ARM_SMMU_CB_FSR_FAULT. SMMU_CBn_FSR.SS won't be
> > asserted unless an external user enabled stall-on-fault, and they are
> > expected to resume the translation and re-enable interrupts.
> >
> > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > Reviewed-by Robin Murphy <robin.murphy@arm.com>
> > Reviewed-by: Rob Clark <robdclark@gmail.com>
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 15 ++++++++++-
> >  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 41 ++++++++++++++++++++++=
+++++++-
> >  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  1 -
> >  3 files changed, 54 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu=
/arm/arm-smmu/arm-smmu-qcom.c
> > index 186d6ad4fd1c990398df4dec53f4d58ada9e658c..a428e53add08d451fb2152e=
3ab80e0fba936e214 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > @@ -90,12 +90,25 @@ static void qcom_adreno_smmu_resume_translation(con=
st void *cookie, bool termina
> >       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> >       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> >       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> > -     u32 reg =3D 0;
> > +     u32 reg =3D 0, sctlr;
> > +     unsigned long flags;
> >
> >       if (terminate)
> >               reg |=3D ARM_SMMU_RESUME_TERMINATE;
> >
> > +     spin_lock_irqsave(&smmu_domain->cb_lock, flags);
> > +
> >       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
> > +
> > +     /*
> > +      * Re-enable interrupts after they were disabled by
> > +      * arm_smmu_context_fault().
> > +      */
> > +     sctlr =3D arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR);
> > +     sctlr |=3D ARM_SMMU_SCTLR_CFIE;
> > +     arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, sctlr);
> > +
> > +     spin_unlock_irqrestore(&smmu_domain->cb_lock, flags);
> >  }
> >
> >  #define QCOM_ADRENO_SMMU_GPU_SID 0
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/=
arm-smmu/arm-smmu.c
> > index c7b5d7c093e71050d29a834c8d33125e96b04d81..9927f3431a2eab913750e60=
79edc6393d1938c98 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > @@ -470,13 +470,52 @@ static irqreturn_t arm_smmu_context_fault(int irq=
, void *dev)
> >       if (!(cfi->fsr & ARM_SMMU_CB_FSR_FAULT))
> >               return IRQ_NONE;
> >
> > +     /*
> > +      * On some implementations FSR.SS asserts a context fault
> > +      * interrupt. We do not want this behavior, because resolving the
> > +      * original context fault typically requires operations that cann=
ot be
> > +      * performed in IRQ context but leaving the stall unacknowledged =
will
> > +      * immediately lead to another spurious interrupt as FSR.SS is st=
ill
> > +      * set. Work around this by disabling interrupts for this context=
 bank.
> > +      * It's expected that interrupts are re-enabled after resuming th=
e
> > +      * translation.
>
> s/translation/transaction/
>
> > +      *
> > +      * We have to do this before report_iommu_fault() so that we don'=
t
> > +      * leave interrupts disabled in case the downstream user decides =
the
> > +      * fault can be resolved inside its fault handler.
> > +      *
> > +      * There is a possible race if there are multiple context banks s=
haring
> > +      * the same interrupt and both signal an interrupt in between wri=
ting
> > +      * RESUME and SCTLR. We could disable interrupts here before we
> > +      * re-enable them in the resume handler, leaving interrupts enabl=
ed.
> > +      * Lock the write to serialize it with the resume handler.
> > +      */
>
> I'm struggling to understand this last part. If the resume handler runs
> synchronously from report_iommu_fault(), then there's no need for
> locking because we're in interrupt context. If the resume handler can
> run asynchronously from report_iommu_fault(), then the locking doesn't
> help because the code below could clear CFIE right after the resume
> handler has set it.

The problem is indeed when the resume handler runs asynchronously.
Clearing CFIE right after the resume handler has set it is normal and
expected. The issue is the opposite, i.e. something like:

- Resume handler writes RESUME and stalls for some reason
- The interrupt handler runs through and clears CFIE while it's already cle=
ared
- Resume handler sets CFIE, assuming that the handler hasn't run yet
but it actually has

This wouldn't happen with only one context bank, because we wouldn't
get an interrupt until the resume handler sets CFIE, but with multiple
context banks and a shared interrupt line we could get a "spurious"
interrupt due to a fault in an earlier context bank that becomes not
spurious if the resume handler writes RESUME before the context fault
handler for this bank reads FSR above.

Connor

>
> I think the broader problem is that we can end up reporting a spurious
> fault when the irq is shared between context banks. However, your change
> to ARM_SMMU_CB_FSR_FAULT fixes that afaict:
>
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/=
arm-smmu/arm-smmu.h
> > index ff84ce3b8d8567d3402e945e8277ca2a87df9a4e..5fe8e482457f905529a08ae=
a14ea5656d3e31328 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > @@ -214,7 +214,6 @@ enum arm_smmu_cbar_type {
> >                                        ARM_SMMU_CB_FSR_TLBLKF)
> >
> >  #define ARM_SMMU_CB_FSR_FAULT                (ARM_SMMU_CB_FSR_MULTI | =
       \
> > -                                      ARM_SMMU_CB_FSR_SS |           \
> >                                        ARM_SMMU_CB_FSR_UUT |          \
> >                                        ARM_SMMU_CB_FSR_EF |           \
> >                                        ARM_SMMU_CB_FSR_PF |           \
>
> because now any subsequent spurious IRQs will return IRQ_NONE. So I
> don't see why we need the locking at all. What am I missing?
>
> Also, I think your change probably exposes a benign bug in the qcom
> debug code as qcom_tbu_halt() has the following:
>
> if ((fsr & ARM_SMMU_CB_FSR_FAULT) && (fsr & ARM_SMMU_CB_FSR_SS))
>         ...
>
> Will

