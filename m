Return-Path: <linux-arm-msm+bounces-51165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D647A5DF9D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 16:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6638F3B8644
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 14:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C63324EA87;
	Wed, 12 Mar 2025 15:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/Cia9rU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAE515624B
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 15:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741791608; cv=none; b=mjJRtbtp31ZHQrfSRH7dUBA6mFN70nF0dKmNc6YocI1+VENv+sB1XzBIga8u+7R0BBh/yX1pDDn9cIKUfVo0yG0j8UHG7lYBuNEpvkgrq01XHsLmi+NTlsBpKF3KzobbWc31BUKOEfWOoD0ziSN2kpyZussNZGdpF1ZfPG4VSf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741791608; c=relaxed/simple;
	bh=kpAI7xHfS5VExw9f/Ooed+bliDjOOzgFxngI5428md0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qiesl9gc2tJVSz2kth1r1YiEP7gwT4inU5yomNUW2penXyNb9ZJpP1EOkAWT9hQNoQM0STc9aVAi1RbOW4p2Hk3WJu7tSiMBE58q1WIKj3Yd32LCbbW/MlABg/WzEum9wbhXFYpKU3kBLt9AycnPCcx8QWDimZA1iNb4RU4HBxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/Cia9rU; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d4502ca096so9272285ab.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 08:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741791605; x=1742396405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6gQ0iOf/v4AHfEFcB/wPe/V8o5CcEN4WSOGct8jdq8=;
        b=b/Cia9rU3roqucPZd8IH+n8z5REHdGjFyVJxDP7Yp56FKHhwvv5YDC/+vk4+x1ZRjf
         1ulqAgjN2Nay3pIem6oQCMEKaBVq8EspW4GI6SFzqlZdHokBVST2OKr26sRODXo5pHbk
         +PQSbZ4FboQf4eDD/oZP+wMa0L/NFqIe6qNSSKjjOkswz1KVt+8HPUNOvN6GF/37UDP4
         bF09WqYW2q99kqzCCBfWNNWy0Y7crTdAVVdd/lCKDwDHWKkxr19C/osw2Q5oo27fl7Jx
         WqKpIHl+GZb0yAoUyXq3gWeLmoB+sA/lSVUeZWU6RkUOKzeDe5d0nUruihcMJcNIwcaE
         hXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741791605; x=1742396405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6gQ0iOf/v4AHfEFcB/wPe/V8o5CcEN4WSOGct8jdq8=;
        b=ogGTEL1JUGoZBiqKe1OK63vnXRsvS436WL0ySlHCyP9OhBNgrs494nH1VEteH3doZZ
         dJbe5WB7vHFl1qVOIrDGjcOoiw3vioIIOPUAriITCA2QMdQ1dv0Vfc0+p5Z4rl6f8aD4
         d8KzdrjAxVr+/U47kXk/Tbm/KKTHv7fCx0r64GWSizI6xtvYyrf7GRd7sElLQgadzqKK
         KS7QDcCYNa773oJAJ4Y4qes60MnsjrPub9M8jaKvqw3GIk0U0+Mcd69S+Q50dY9x1gO/
         0M10ZAuSzfNNhTsR1F4g30hBk1PkchR3rG8Omaa1ORwR6DvXQOCPWGZMI+V5GiREV93m
         lm3A==
X-Forwarded-Encrypted: i=1; AJvYcCUIcUSxFv3N9KQmii4qYk8Z0WbnEq18oTREN0DIV7nRbiGqGpbXamZwOyfB3mfvVSkvDzLeXCxGuSGJGcva@vger.kernel.org
X-Gm-Message-State: AOJu0YwoFBckyRd6f8cDGVze31ANnfjlq0Y6QwuBV4sbyfVyJMhdipOA
	9/nXbMzqxVsmQ8sPLnhdLGO9pTfDLwpIR01duhjzgucdqIs2pegDXjEqPXTmaJuOj5mcM+2kgTE
	xuSKf5cbEuK+dWwgp1DIeAp9JAB8=
X-Gm-Gg: ASbGnct5n54RkhJZCyruedRkPUzGAOmF4plsQHEcbjrHg7R9n/8pqP9DtAEfE7RiCvl
	XzRK0kcG+rOanr2goaERswaOi+B3iicqiHsO9hVNlr297phFf2WsuqcoUY7VTMKxVxWQdwVYXWM
	yS9WMzoM44Fs4snoMbDPnbkii62Zqs39GAeLXC6VGGhxyS/9J4EhFP2Qpt
X-Google-Smtp-Source: AGHT+IG89CocD4yRKYNpZ9RLEOYRBeA78CpihMbt2tnLubfpVvKNjOKB0QgfM5gz+kA7p7liUlyqeFuRDen+lF6vWSw=
X-Received: by 2002:a05:6e02:3f89:b0:3d4:337f:121c with SMTP id
 e9e14a558f8ab-3d4419902e4mr241203255ab.10.1741791605230; Wed, 12 Mar 2025
 08:00:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
 <20250311180553.GB5216@willie-the-truck> <CACu1E7GzCiO2b7AFJSDC+pN2VD9VaD2aYz_GGymM3-xAUqd__A@mail.gmail.com>
 <20250312130525.GC6181@willie-the-truck>
In-Reply-To: <20250312130525.GC6181@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 12 Mar 2025 07:59:52 -0700
X-Gm-Features: AQ5f1JorVIrx8dg8nV8siCMmQzu9hAMvxaP2jgGpa2BA4UCWgNEK-jMOL9dUEzA
Message-ID: <CAF6AEGvqYithLFAKpfdkw35DEsUZ8rBt25-oWz3r=kaLt+RbQw@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] iommu/arm-smmu: Save additional information on
 context fault
To: Will Deacon <will@kernel.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 6:05=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Mar 11, 2025 at 06:36:38PM -0400, Connor Abbott wrote:
> > On Tue, Mar 11, 2025 at 2:06=E2=80=AFPM Will Deacon <will@kernel.org> w=
rote:
> > >
> > > On Tue, Mar 04, 2025 at 11:56:47AM -0500, Connor Abbott wrote:
> > > > This will be used by drm/msm for GPU page faults, replacing the man=
ual
> > > > register reading it does.
> > > >
> > > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > > ---
> > > >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  4 ++--
> > > >  drivers/iommu/arm/arm-smmu/arm-smmu.c            | 27 ++++++++++++=
+-----------
> > > >  drivers/iommu/arm/arm-smmu/arm-smmu.h            |  5 ++++-
> > > >  3 files changed, 21 insertions(+), 15 deletions(-)
> > > >
> > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/dri=
vers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > > > index 548783f3f8e89fd978367afa65c473002f66e2e7..ae4fdbbce6ba80440f5=
39557a39866a932360d4e 100644
> > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > > > @@ -400,7 +400,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, vo=
id *dev)
> > > >
> > > >       if (list_empty(&tbu_list)) {
> > > >               ret =3D report_iommu_fault(&smmu_domain->domain, NULL=
, cfi.iova,
> > > > -                                      cfi.fsynr & ARM_SMMU_CB_FSYN=
R0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > > > +                                      cfi.fsynr0 & ARM_SMMU_CB_FSY=
NR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > > >
> > > >               if (ret =3D=3D -ENOSYS)
> > > >                       arm_smmu_print_context_fault_info(smmu, idx, =
&cfi);
> > > > @@ -412,7 +412,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, vo=
id *dev)
> > > >       phys_soft =3D ops->iova_to_phys(ops, cfi.iova);
> > > >
> > > >       tmp =3D report_iommu_fault(&smmu_domain->domain, NULL, cfi.io=
va,
> > > > -                              cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ?=
 IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > > > +                              cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR =
? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > > >       if (!tmp || tmp =3D=3D -EBUSY) {
> > > >               ret =3D IRQ_HANDLED;
> > > >               resume =3D ARM_SMMU_RESUME_TERMINATE;
> > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/=
arm/arm-smmu/arm-smmu.c
> > > > index ade4684c14c9b2724a71e2457288dbfaf7562c83..a9213e0f1579d1e3be0=
bfba75eea1d5de23117de 100644
> > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > @@ -409,9 +409,12 @@ void arm_smmu_read_context_fault_info(struct a=
rm_smmu_device *smmu, int idx,
> > > >                                     struct arm_smmu_context_fault_i=
nfo *cfi)
> > > >  {
> > > >       cfi->iova =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> > > > +     cfi->ttbr0 =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTBR0=
);
> > > >       cfi->fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> > > > -     cfi->fsynr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0=
);
> > > > +     cfi->fsynr0 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR=
0);
> > > > +     cfi->fsynr1 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR=
1);
> > >
> > > We already have an implementation hook (->get_fault_info()) which the
> > > qcom SMMU driver can override with qcom_adreno_smmu_get_fault_info().
> > > That thing dumps these registers already so if we're moving that into
> > > the core SMMU driver, let's get rid of the hook and move everybody ov=
er
> > > rather than having it done in both places.
> >
> > As you probably saw, the next commit moves over
> > qcom_adreno_smmu_get_fault_info() to use this. The current back door
> > used by drm/msm to access these functions is specific to adreno_smmu
> > and there isn't an equivalent interface to allow it to call a generic
> > SMMU function so it isn't possible to move it entirely to the core. At
> > least not without a bigger refactoring that isn't justified for this
> > series that is just trying to fix things.
>
> Ok :(
>
> > > >       cfi->cbfrsynra =3D arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRS=
YNRA(idx));
> > > > +     cfi->contextidr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_C=
ONTEXTIDR);
> > >
> > > I think the CONTEXTIDR register is stage-1 only, so we shouldn't dump
> > > it for stage-2 domains.
> > >
> > Does it matter if we read the register though, as long as users are
> > aware of this and don't use its value for anything?
>
> I think the contents are "UNKNOWN", so it could be hugely confusing even
> if they just got logged someplace. Why is it difficult to avoid touching
> it for stage-2?
>
> Will

Fwiw, we are only ever using stage-1

BR,
-R

