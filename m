Return-Path: <linux-arm-msm+bounces-51173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFDFA5E2D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 18:31:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DDB63BC8C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 17:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12C4B1BD01F;
	Wed, 12 Mar 2025 17:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJJCK4Lv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6081719CC20
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 17:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741800234; cv=none; b=qLUURGRzUyH3ILIFccR5lZpz/TnpLNY7aeKhIIasMebop2of8ZwpHYbQM+L3YOOx4mpxpqlIzt3SJsKF0Bv5uAk0/RdCGkZ6c8qJsO46CFbgOAeHIThM1c2TWn61AkEcxgo7RzC0rNHb7s9jCGi21m5fv7fzoUFZ3zTK72Fi/70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741800234; c=relaxed/simple;
	bh=NMt8Wtz/HNA8fdw1jMZJDg9OqGd6mKMbCmM27mIFUc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bx9/Slf2w6XoT3oQhS7GH+kwBO2NKShVfXgOxmPKXgh21aW+jenPFZSlgIoMSRK5qFBf45HYzPJLlBtLmHqORB0aSrhF6ri5FgYCHPJY+8IYSoPUlpRmBXgi9CyoOJ9nThrwGR/FqoJr9cPsWECQm4WNu+7bnjzin/I4HUtkjtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJJCK4Lv; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3d2a869d016so155825ab.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 10:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741800231; x=1742405031; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGBwm8qMS+2GJaCafUPU+5noYTI4wXrs3yJkKVtCLXM=;
        b=mJJCK4LvjeRnjyOB114enOKobHzSfoerIP7c9KZZQ7PSISTUHJcsYVV0lU4zyYlRn0
         p9797dYgUcEQ1yMl4BDEl2vDjYfpo0kv5HPGreC9BHTJEZTuhcblgYdQibWRbvm6GgJw
         9sst+ff9e5oBWS0pAU5y+dStcDxHNuxfcAXUbyyyRIHDMGhlOWoAJo20yYWhxuyNJaTV
         mz5n/2YyoFbtaldddlBUfrLMd2fTZ/agerwWkm4rj6y4JVjemUqdOa/1EtrBWl8qc2Us
         za3SNY0pjGAvgFHIREQLu9NiL0n3kSShy7a3+Tdgl0h7u/gTp51tfy8/HovSlarSAgNv
         QzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741800231; x=1742405031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dGBwm8qMS+2GJaCafUPU+5noYTI4wXrs3yJkKVtCLXM=;
        b=tqw10rekAktU5Y4ErtCJWDF5D7CFTjP+VMnzKKUOj9pXbbBkJD5tBHRR0Brgl9nY0i
         OXscH2zCOCBSGLaXDF139V4oMqUMXd37WbV1Vbg9ppyX2FnDH4IZULi5uJibssonkJjw
         wl+P4WaFpUNGRGtlq9rksQjM9ZMKH+STosbX0uCTI9LNChb+ZUOhSiiEDuopVTCdPHO/
         MymOVSGiXdiE+gDi+8kA38oBubmdAFL5MthzmQfySTywhYzLLU1tP7JUp8gV6NE0JmUl
         NSFhhmIgQQmukUyR9GR4VckF0ikW3lp3nNnrOq7rbZgv96JFJz3yOZ7K6/Z70rQBK5DU
         SIbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsuAdh2RhCYWf1RCnC3nKJyUqh6WPLyWaUb6wI6rSYjgcSTPVzdxu/bHZxpV+AzIxyGpbCAVKRVfqmHsuj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4rNdfPh+GAGT13l57Cwpn0g2/Df3a6Hrhwnz9shqYp6mx5R0x
	qiuJUDac9/oGLv2foZ6h1qsYlU56K2Y52FQmd+fX45FNjo7C8fiMbSpda+YacZrSBMT1l8yRWBo
	CaRhtOhnNRyopVQDDJowQLgTuCMY=
X-Gm-Gg: ASbGncsd1XOJLK40/dJgbIoibgl/KoNUi513MJc52yB9vBzVx2XwVHt9eRpXaBvRIOR
	UwsWFNnM7b6/Wc7HDayT51pwaLWUvJ4om/zxX+3CtxMYqJLN7mMn8C+KitgHF/h2kb2RJnfDSu4
	AqxWIWhdt4J71LcRCKFK1/scFgX272UWjZdLI6nvHo5MSMuMCD4rCortiko7kdb2siFXQ=
X-Google-Smtp-Source: AGHT+IGcOjBT5pnQnFzsB43flH0b/lHGboYrzDRZ8j3X26uAhwiB1vx8sBVrCRaRim73zA8BO7Uy4425SARrON6xCxo=
X-Received: by 2002:a05:6e02:1a84:b0:3d4:2362:98d8 with SMTP id
 e9e14a558f8ab-3d4419576dbmr239903965ab.2.1741800231340; Wed, 12 Mar 2025
 10:23:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
 <20250311180553.GB5216@willie-the-truck> <CACu1E7GzCiO2b7AFJSDC+pN2VD9VaD2aYz_GGymM3-xAUqd__A@mail.gmail.com>
 <20250312130525.GC6181@willie-the-truck> <CAF6AEGvqYithLFAKpfdkw35DEsUZ8rBt25-oWz3r=kaLt+RbQw@mail.gmail.com>
 <20250312164735.GA6561@willie-the-truck>
In-Reply-To: <20250312164735.GA6561@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 12 Mar 2025 10:23:36 -0700
X-Gm-Features: AQ5f1JpoGELyygSS0E-6GUOCTc5ufPPqVKk2sRxHePqLfAbRabP5NvXjW3XjOTE
Message-ID: <CAF6AEGskyoemQDrTXh=ewf61e-hVzWMjmqe=nX2J-65W5-M6Zw@mail.gmail.com>
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

On Wed, Mar 12, 2025 at 9:47=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Wed, Mar 12, 2025 at 07:59:52AM -0700, Rob Clark wrote:
> > On Wed, Mar 12, 2025 at 6:05=E2=80=AFAM Will Deacon <will@kernel.org> w=
rote:
> > > On Tue, Mar 11, 2025 at 06:36:38PM -0400, Connor Abbott wrote:
> > > > On Tue, Mar 11, 2025 at 2:06=E2=80=AFPM Will Deacon <will@kernel.or=
g> wrote:
> > > > > On Tue, Mar 04, 2025 at 11:56:47AM -0500, Connor Abbott wrote:
> > > > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/io=
mmu/arm/arm-smmu/arm-smmu.c
> > > > > > index ade4684c14c9b2724a71e2457288dbfaf7562c83..a9213e0f1579d1e=
3be0bfba75eea1d5de23117de 100644
> > > > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > > @@ -409,9 +409,12 @@ void arm_smmu_read_context_fault_info(stru=
ct arm_smmu_device *smmu, int idx,
> > > > > >                                     struct arm_smmu_context_fau=
lt_info *cfi)
> > > > > >  {
> > > > > >       cfi->iova =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FA=
R);
> > > > > > +     cfi->ttbr0 =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_T=
TBR0);
> > > > > >       cfi->fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR)=
;
> > > > > > -     cfi->fsynr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FS=
YNR0);
> > > > > > +     cfi->fsynr0 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_F=
SYNR0);
> > > > > > +     cfi->fsynr1 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_F=
SYNR1);
> > > > >
> > > > > We already have an implementation hook (->get_fault_info()) which=
 the
> > > > > qcom SMMU driver can override with qcom_adreno_smmu_get_fault_inf=
o().
> > > > > That thing dumps these registers already so if we're moving that =
into
> > > > > the core SMMU driver, let's get rid of the hook and move everybod=
y over
> > > > > rather than having it done in both places.
> > > >
> > > > As you probably saw, the next commit moves over
> > > > qcom_adreno_smmu_get_fault_info() to use this. The current back doo=
r
> > > > used by drm/msm to access these functions is specific to adreno_smm=
u
> > > > and there isn't an equivalent interface to allow it to call a gener=
ic
> > > > SMMU function so it isn't possible to move it entirely to the core.=
 At
> > > > least not without a bigger refactoring that isn't justified for thi=
s
> > > > series that is just trying to fix things.
> > >
> > > Ok :(
> > >
> > > > > >       cfi->cbfrsynra =3D arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_C=
BFRSYNRA(idx));
> > > > > > +     cfi->contextidr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_=
CB_CONTEXTIDR);
> > > > >
> > > > > I think the CONTEXTIDR register is stage-1 only, so we shouldn't =
dump
> > > > > it for stage-2 domains.
> > > > >
> > > > Does it matter if we read the register though, as long as users are
> > > > aware of this and don't use its value for anything?
> > >
> > > I think the contents are "UNKNOWN", so it could be hugely confusing e=
ven
> > > if they just got logged someplace. Why is it difficult to avoid touch=
ing
> > > it for stage-2?
> > >
> > Fwiw, we are only ever using stage-1
>
> Sure, but this is in arm-smmu.c which is used by other people and support=
s
> both stages.

Sure, but no one else is using this field in the fault-info.  So maybe
the addition of a comment in the struct would be enough if it isn't
going to cause an SError/etc to read it for S2 cb?

BR,
-R

