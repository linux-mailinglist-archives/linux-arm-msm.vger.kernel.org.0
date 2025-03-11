Return-Path: <linux-arm-msm+bounces-51073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A94FDA5D29F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 23:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 068FE189E150
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 22:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A614264A70;
	Tue, 11 Mar 2025 22:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OaWFK52a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F0E265CA6
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 22:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741732612; cv=none; b=Gvrx0Uz+YQ6+maoj6HEb+GVa4Zn4aACwpxkpzPwpdxh0JNFUYTaU5M1X+sTRIOMLUTeDt3Gsjz1YpinMYhlxsR0NLPjdKeye1X56b6PD7KzhUValEM3KhzDYndPNMIoY1y+uZhyuNBCnStWqXpmQkPtiTdaBv9whEjTtEK2RJAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741732612; c=relaxed/simple;
	bh=stGKqEUr4q8JKAOwejt7cWzSSykKFgW9stzYakf8cZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QeOcmURZaTpylJqTRqeP48qpo8rrVOfN7r3NVkA7buqF2ux4xzF482wD0iPyRrrUxCj48tdowDwXOcwmYYfQZGGHzB/5+y1gTyPGQ2ujmyuocHhEneGcNqAFrx4rD9kEiAaCaBrZRGqS0Sp01w6f3gzMEwy36TM9xz2lBv2do2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OaWFK52a; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff6ce72844so1507240a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 15:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741732610; x=1742337410; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75JlrEnI8tdqw5rkhyab++osfwTd4EpAvf26QJsRa+Q=;
        b=OaWFK52a4drryiqTURgONdVihfcM5BDFSkdSYoEa8gpdLol/VCBtucat3mvk53w1HT
         YJxNfzN3+3K4BGEcVY/iK8/gXOOcOUPfAROVL2+1e1+eybdqd5M3jxeboroDYWQcMrLh
         alDLCzFZ1XHYLJSlXh2T5vCG9kvDYaPWs04Z3nGAmVF4exr+9iUiTEp9IhPP9qs4elyn
         rWpwVHEtZdXh6vHI0PKYdDFQVHXzf2UYSeh65GsV8lwsIPdf4ZmmHa9hI0b9zOeIcg34
         Kvyxi5FRiQ8dmv5MEv4BEUCVdP3MkuNfKI6Qe3wt/8MpoERvxUI9fzdkhdHAmGbH3H08
         6T/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741732610; x=1742337410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=75JlrEnI8tdqw5rkhyab++osfwTd4EpAvf26QJsRa+Q=;
        b=HOQVPhtiKwaSPdowavQq7ajAgwzoUyEImAbjlsNLn3gDQSFgKrJVBQ6VQsZEIym8Fx
         bvQLyyDiLn4FppTcMOTubkSBYOGj2F84xL6beb2TFhKAHPcU/JFtK2AVMc6U+t9g2YKd
         L2lUsZRxInISahFvqO9JDSktZbd5+GaG6L9BD844UCgTGW0GFFyql4R7jrR5xuYRAaF4
         rgAM9th/goyS8FDkDnq3n1BcLLczBkzSfl+Gtoc1BJR0Ky09kx4ycipE0rqpN1HCSe8P
         5D/eNJjn65HwUN9iuaaCy9P3VIAPo+7MC/PcEZQ4tD45Z1EMCmfvPacrqRa0kujSBxwi
         Fqkg==
X-Forwarded-Encrypted: i=1; AJvYcCWAwar107+JviVzCGUUTNDXIjZLpydtd+OOV6pnxoWniPXWzV/jOxk/CJNAUJBbsfx1KRuATuw79DdNEXLq@vger.kernel.org
X-Gm-Message-State: AOJu0YxcMotByYkPixIVR0+cpmibVlkjB4BGFTM07VS+zVc73xHEGQF5
	e2e7y4twTamoaPhp8E/0TZpSxJ+tpmbrQaDr73rfVEDnH9iKQe5NvmZSL/wtwzTsP8icvGq6MLw
	uvyvSCLzcKD62Sp9XZhhyJaZNzTI=
X-Gm-Gg: ASbGncuESvnhLvX7XQDSSb5nab5/OOL5SCvoiWLVkEm7CsKzk0g7mlgsTVTJZJI7JwZ
	HT/eJwfg+8tYCM6Jhzp96hCRBgNPYaJcnnUeQY37ZH6flC6BPKQsqMk/HCRnnrrGnqqT0fOvx3J
	tIws1WG3W9JIUqRki4sVDUTOZPZQ==
X-Google-Smtp-Source: AGHT+IE2yP0Oqp5icApOYEeT5S9ryMzCphdSruIQb+pyZ1tL48mZ6lOK0AKajCd16hcESy+fMFtcVCe/Z6YypMdt4rI=
X-Received: by 2002:a17:90b:4a81:b0:2ee:f59a:94d3 with SMTP id
 98e67ed59e1d1-300a2891c23mr8155406a91.0.1741732609220; Tue, 11 Mar 2025
 15:36:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com> <20250311180553.GB5216@willie-the-truck>
In-Reply-To: <20250311180553.GB5216@willie-the-truck>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 11 Mar 2025 18:36:38 -0400
X-Gm-Features: AQ5f1Jpps08fowB20qui8teO0kCK3_0sMgX__rQse3av3tUA4enIqUvNjCSXypk
Message-ID: <CACu1E7GzCiO2b7AFJSDC+pN2VD9VaD2aYz_GGymM3-xAUqd__A@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] iommu/arm-smmu: Save additional information on
 context fault
To: Will Deacon <will@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 2:06=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Mar 04, 2025 at 11:56:47AM -0500, Connor Abbott wrote:
> > This will be used by drm/msm for GPU page faults, replacing the manual
> > register reading it does.
> >
> > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  4 ++--
> >  drivers/iommu/arm/arm-smmu/arm-smmu.c            | 27 +++++++++++++---=
--------
> >  drivers/iommu/arm/arm-smmu/arm-smmu.h            |  5 ++++-
> >  3 files changed, 21 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers=
/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > index 548783f3f8e89fd978367afa65c473002f66e2e7..ae4fdbbce6ba80440f53955=
7a39866a932360d4e 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
> > @@ -400,7 +400,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *=
dev)
> >
> >       if (list_empty(&tbu_list)) {
> >               ret =3D report_iommu_fault(&smmu_domain->domain, NULL, cf=
i.iova,
> > -                                      cfi.fsynr & ARM_SMMU_CB_FSYNR0_W=
NR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > +                                      cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_=
WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> >
> >               if (ret =3D=3D -ENOSYS)
> >                       arm_smmu_print_context_fault_info(smmu, idx, &cfi=
);
> > @@ -412,7 +412,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *=
dev)
> >       phys_soft =3D ops->iova_to_phys(ops, cfi.iova);
> >
> >       tmp =3D report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> > -                              cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOM=
MU_FAULT_WRITE : IOMMU_FAULT_READ);
> > +                              cfi.fsynr0 & ARM_SMMU_CB_FSYNR0_WNR ? IO=
MMU_FAULT_WRITE : IOMMU_FAULT_READ);
> >       if (!tmp || tmp =3D=3D -EBUSY) {
> >               ret =3D IRQ_HANDLED;
> >               resume =3D ARM_SMMU_RESUME_TERMINATE;
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/=
arm-smmu/arm-smmu.c
> > index ade4684c14c9b2724a71e2457288dbfaf7562c83..a9213e0f1579d1e3be0bfba=
75eea1d5de23117de 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > @@ -409,9 +409,12 @@ void arm_smmu_read_context_fault_info(struct arm_s=
mmu_device *smmu, int idx,
> >                                     struct arm_smmu_context_fault_info =
*cfi)
> >  {
> >       cfi->iova =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> > +     cfi->ttbr0 =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTBR0);
> >       cfi->fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> > -     cfi->fsynr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> > +     cfi->fsynr0 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> > +     cfi->fsynr1 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR1);
>
> We already have an implementation hook (->get_fault_info()) which the
> qcom SMMU driver can override with qcom_adreno_smmu_get_fault_info().
> That thing dumps these registers already so if we're moving that into
> the core SMMU driver, let's get rid of the hook and move everybody over
> rather than having it done in both places.

As you probably saw, the next commit moves over
qcom_adreno_smmu_get_fault_info() to use this. The current back door
used by drm/msm to access these functions is specific to adreno_smmu
and there isn't an equivalent interface to allow it to call a generic
SMMU function so it isn't possible to move it entirely to the core. At
least not without a bigger refactoring that isn't justified for this
series that is just trying to fix things.

>
> >       cfi->cbfrsynra =3D arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA=
(idx));
> > +     cfi->contextidr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_CONTE=
XTIDR);
>
> I think the CONTEXTIDR register is stage-1 only, so we shouldn't dump
> it for stage-2 domains.
>
> Will

Does it matter if we read the register though, as long as users are
aware of this and don't use its value for anything?

Connor

