Return-Path: <linux-arm-msm+bounces-56983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CED0AACAE3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 18:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7F8D16C9DA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 16:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 685844B1E6E;
	Tue,  6 May 2025 16:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTPWBY31"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D824F252282
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 16:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746548799; cv=none; b=rTjvbglMRZazdohs+5KffFYAub+8IQ73iXPCqtSUTpyPe+kX7VfD9jfEZZsSwRN8yWj6TbASBf9gl+alePti3WymapUFjCeJf027HToUZjSvwnezqcTh4wfn3FKLKln5CE/Atn+aqHHq0pyBWQaVN6KnMuV/MLxL/pCNlD7hs68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746548799; c=relaxed/simple;
	bh=OUAw5A6DAgqvZt7MHmztMx8kURQYzD8rXFUwAwEBkuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=db5Ssxpj2CveuZS/78grrL6TuyUVZGZzYDpPtQL8pB+ShYN1m151t4ttAUDnrrSjlcC2G5SKbRtD0XqPm8bbyJcc+3LW0I06LqnZtmEMfP7X1Is56bVkNN23pw/nYsaesToRQkWWWBJqzejuxRD1yw1oIDxHt8DUX3GJk5Wiy48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTPWBY31; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-739ab4447c7so511993b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 09:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746548797; x=1747153597; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2iEPT31lWJmfZ711HkWVQ8QdQyTw1Ihj+viAfDs+a4=;
        b=kTPWBY31P7zNIHCc5TdDjiPmycm8d7UrJQO7zGYQqBG2ZO4AtXG3C4tExgmarirfMT
         /RBDaBIxHngqPVeP2kLtlkEqa61+RXGyHOfgSXc92kGWmNcf4AYyDAj5GZoljyRISZsm
         h/qlXaJoi/X0+HWx5bCp8sOI6QyTG4ZOk6GyHPPVsZw3dwmO9IE1x9IeexwBp+37Y6Rm
         /V6yuvgPBsKlZE+bcluo2K0vsfkKhrc+B9F28cNrVhv+nvT5oAceAsPdDbF5kikoYya8
         phaqDxrC3I2OM5kSiebMGbZCLAm10Ah6B69RO1kkuTyG9NRs+dRid+OH0fPUcAk2k5eO
         XR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746548797; x=1747153597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N2iEPT31lWJmfZ711HkWVQ8QdQyTw1Ihj+viAfDs+a4=;
        b=EudrIfxkR1H5uyj3aQM+vdwKukjcDGg6nJNL+emn+wT69WLu81ZLHWp4fLYNOTgTqv
         l6T8XtntiExi7sQXA3RqgYWv2T+wp+u3i1QgpjcSbSnW/hpF4WVnvVXn/jXqFDymVXMo
         X+AWFJtDUbkqnYJcResVINau5Vu6appi3PAHrcV0MMRPbVG8B2TZKKsW8bfhSE6LhrUF
         p2glw97oIYXt+NPqafl/elzip9UMMCIar9+MfiGBuvaUoEvB7QIHT8JozY1Oh+8T0Ve+
         FaZHe68OlZVttEmBwtWSK1w2sHb9OZsQIXTYx0oOL5ISVjwQ3BTPAv0PkTRViVPO+7D9
         ZYdg==
X-Forwarded-Encrypted: i=1; AJvYcCUR4A1jiibvrPQmqQsyHCgbJ5avxoyKy/lWVzwqcj1okrjQJQEszAyDkvRQaBRZrlsFFJyMgP2nV8xMj+jo@vger.kernel.org
X-Gm-Message-State: AOJu0YyvG+Kzdw8Xvh3Vcq5zCOFp+gDjQeNuQsfD37QSWzwM2ezrSekI
	p0K/ZKIcqGIxNBDIxXvEJaATRSaqGjST9AXJ+VEihxA5A1mVcZGhzLg2+9wp5nGLuBmPU88rPmT
	v4YKY+Iu02e5Ys3r5Al98FhN98fk=
X-Gm-Gg: ASbGncvaitwxEw2Jp5C8Sl4qo/xJPFt3yU7DmlKhD6L0d2HTABjD+W/LU4WGF4mV/UG
	b1Z1gVjSzfhBfaYabnGsKzBBOXgNCZWbZ8h9TP9JCbrfnvqy8IW9+sVcnxouiKLFZe0gMFx2rxi
	4FNonVlUhfKyUCj1KcwsFvbA==
X-Google-Smtp-Source: AGHT+IFevbIXo6chZ46DVNlJBWVZ9S7rGrPtFFMLAbHqHbciNEKnYEm+KoSXMjS7AzymQV/ccrlzB9i7DV6tVCsE5Kc=
X-Received: by 2002:a05:6a00:4296:b0:730:87b2:e848 with SMTP id
 d2e1a72fcca58-7409ba60c50mr111599b3a.5.1746548797029; Tue, 06 May 2025
 09:26:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
 <20250319-msm-gpu-fault-fixes-next-v5-1-97561209dd8c@gmail.com> <20250506113246.GA723@willie-the-truck>
In-Reply-To: <20250506113246.GA723@willie-the-truck>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 6 May 2025 12:26:25 -0400
X-Gm-Features: ATxdqUGyVeePAC0AKGU6Pbw5gC5TE6nCefsVqalCzAGzu-h58HCMKVxLU73Zb-o
Message-ID: <CACu1E7HXd9bUWwPCa_XxkQYRwCg6aobr8snFzArE=D99Z+iRJQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] iommu/arm-smmu: Save additional information on
 context fault
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

On Tue, May 6, 2025 at 7:32=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> On Wed, Mar 19, 2025 at 10:44:00AM -0400, Connor Abbott wrote:
> > This will be used by drm/msm for GPU page faults, replacing the manual
> > register reading it does.
> >
> > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > Reviewed-by: Rob Clark <robdclark@gmail.com>
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  6 ++--
> >  drivers/iommu/arm/arm-smmu/arm-smmu.c            | 35 ++++++++++++++--=
--------
> >  drivers/iommu/arm/arm-smmu/arm-smmu.h            |  7 +++--
> >  3 files changed, 29 insertions(+), 19 deletions(-)
>
> [...]
>
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/=
arm-smmu/arm-smmu.c
> > index ade4684c14c9b2724a71e2457288dbfaf7562c83..a02078eb968b81a35c1c086=
ed7007ea2a453ef94 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > @@ -405,13 +405,20 @@ static const struct iommu_flush_ops arm_smmu_s2_t=
lb_ops_v1 =3D {
> >  };
> >
> >
> > -void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, in=
t idx,
> > +void arm_smmu_read_context_fault_info(struct arm_smmu_domain *smmu_dom=
ain,
> >                                     struct arm_smmu_context_fault_info =
*cfi)
> >  {
> > +     struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> > +     int idx =3D smmu_domain->cfg.cbndx;
> > +
> >       cfi->iova =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> > +     cfi->ttbr0 =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTBR0);
> >       cfi->fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> > -     cfi->fsynr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> > +     cfi->fsynr0 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> > +     cfi->fsynr1 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR1);
> >       cfi->cbfrsynra =3D arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA=
(idx));
> > +     if (smmu_domain->stage =3D=3D ARM_SMMU_DOMAIN_S1)
> > +             cfi->contextidr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_=
CB_CONTEXTIDR);
>
> I think this leaves 'cfi->contextidr' uninitialised for stage-2 domains.
> We should probably either zero it here or just zero-initialise the whole
> 'cfi' struct in arm_smmu_context_fault() with a:
>
>         struct arm_smmu_context_fault_info cfi =3D {};
>
> line.
>
> Will

The next patch moves the context fault info into arm_smmu_domain which
is already zero-initialized.

Connor

