Return-Path: <linux-arm-msm+bounces-51164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ED0A5DE00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 14:30:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D48DA7A7C20
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 13:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2BD5474C;
	Wed, 12 Mar 2025 13:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAeYI/Dw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF221F03C1
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 13:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741786221; cv=none; b=YALwe+ESausJzzM9xGC3iHEEafb4iu/QULPiAD1hsgeWqKPmydz49dXd66qzbQeoGo9fofZR8gLLkoKtzoRPIBjJpvv0wjMNRh9BrY6O3ffFiZQoUQ/crmR0Yzl4rmK4IfW1ElIbE/JmjEvO91YTlj6JCFhlTCVBICJlrO0iI9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741786221; c=relaxed/simple;
	bh=dUkhfbQ1pEJvrtOfEPaUFyyEtMdnqKdonMPgNHzBEJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ctY2khW45iGxZYcrp37XYDeQVH2bNIxIOMriV6q59wfotB2kQvrEleLz4kYB4TSsxYWdERegZPI1sjZxxtaWpxMwyODEoCRi8zv6Bh50Af005bRiQpMtwoVgFz8r5iqFV2ROk3xBLUOoteRYrzkaKoOimer1AAiimT4Wmblbpio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SAeYI/Dw; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22403c99457so13778145ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 06:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741786219; x=1742391019; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBctFsjmeN6VVslMSX3ZvqdK0/Rk8ae8uumPF0NJ1/s=;
        b=SAeYI/DwW+vsdyFSHi4qm+kRI6yJZcBg5OjNishNvwdemUVrIysYbPjAm+M4mU7Vuv
         dVXMHq0LhsQCb1VmTd/A7RKNFMUwOjpCGBj2ww7EMyWuM+CunPNnWj2f5I0fQ3WUInLA
         P9nDLDRIkVItC7vxq3Y7rKFuGFAuvjnXVGjG3zKsjUDEsmTYr6vNz0fdoi8bqqak8hvG
         0MjX/8LOsaqgSqr5glLoRBA1u+oDUZZLdgGKeWbUGSPun1QUCTYFFRzwetrSonlAcXdm
         smpQQ7sLCPA47kVX3hLKrPIkwEn7kLPQ6V0MWzDkIJpxyEjAh/6IGHChAscEb9cIvVXQ
         XJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741786219; x=1742391019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBctFsjmeN6VVslMSX3ZvqdK0/Rk8ae8uumPF0NJ1/s=;
        b=cvC1q8LLWHKc2jFHiVPFSgJVXmrFtl3zL5VYTsTEPM56S/Mn5yLlVL9F9lI+wlGitP
         4Ppm1ifobwrzJDsEO47iDwhcBKrChFfFwqeOU680YzfSDEgzr9qlFVelstNIZWHP/Qo9
         tgNhxuAunpw8G4mgBlU2ATMEr011FvS605f8rZ33QmO0D4BYtcKD+a+HZVz4gHcmu38A
         hHPXxEnJ146kio5vmVoLGddYXQnNz/MoWgeaPaRK03GZvZNnaYtzrIx7mmLdXWVuC8rz
         Oaffd97LSlZfw4Qr+u1mGn23OD/VDt0nmgDmIGeNX8pgCpDB7erCMpPpFoXkkwvBV5So
         /SdA==
X-Forwarded-Encrypted: i=1; AJvYcCUXV/s8RzLDfUisRzpaB+akLszDp76SvsZ1coGXybNZUBW0mla+Yul7ZBLgyBYJZtMlEzc2Q8chB0XCtJcd@vger.kernel.org
X-Gm-Message-State: AOJu0YzAFYFKL+352Sj0ICoIXcdtU6CZtJmTczyPcYIWfQKLJ1Yu9OBh
	qSAc42awWifb2aYm+EPQE6GAQSG3zqx7ls2DlJLjmCoWSBlCwZYDWwY1jUaoE3dgr8+I9QYpxyE
	6CoePwWybNLP+A9vp65ONqBt0lQ0=
X-Gm-Gg: ASbGncuAXNn7LE+Kjbq6Z9e9mdr+vUwCDMVMdzbi53RvDUBLSzvdgNTXxNBpEhqmr04
	aGg4Vm/9z4vDDWKiuSsoJyMstYDyWlGYbCboKpDYk5b+22++fPHPBF3CmFhJipAuDF5CRd+JEPf
	FiP12C3vMi2f+zMUOQucp3qE0/Mg==
X-Google-Smtp-Source: AGHT+IHNI8mdn86Q0gIcolu7qp1NQiSCr9Mpiw/QLXiMzo4X0s/wK63ODT6l7NpH3nsyJT/iynSTv/X8C6Q/+ji18QU=
X-Received: by 2002:a05:6a00:2d9f:b0:730:9467:b4b8 with SMTP id
 d2e1a72fcca58-736eba6ca4cmr3642332b3a.4.1741786218878; Wed, 12 Mar 2025
 06:30:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-4-be14be37f4c3@gmail.com>
 <20250311181151.GD5216@willie-the-truck> <CACu1E7Gg3WpQASADAdediRzFz2wEXAnfD7tg05XkiXZQp=X8fQ@mail.gmail.com>
 <20250312124907.GB6181@willie-the-truck>
In-Reply-To: <20250312124907.GB6181@willie-the-truck>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 12 Mar 2025 09:30:07 -0400
X-Gm-Features: AQ5f1JqWM8ID_E8sPNheprXCY9CSTKUwdJFoTdyL5levhUnxGmDxSGFVnmiAz6I
Message-ID: <CACu1E7Hm=DWDC2aFdBRkT8f=8gKXJPpif_uEOA9iFZcyT-uCfQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
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

On Wed, Mar 12, 2025 at 8:49=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Mar 11, 2025 at 04:01:00PM -0400, Connor Abbott wrote:
> > On Tue, Mar 11, 2025 at 2:11=E2=80=AFPM Will Deacon <will@kernel.org> w=
rote:
> > >
> > > On Tue, Mar 04, 2025 at 11:56:50AM -0500, Connor Abbott wrote:
> > > > Up until now we have only called the set_stall callback during
> > > > initialization when the device is off. But we will soon start calli=
ng it
> > > > to temporarily disable stall-on-fault when the device is on, so han=
dle
> > > > that by checking if the device is on and writing SCTLR.
> > > >
> > > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > > ---
> > > >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 30 ++++++++++++++++++=
+++++++++---
> > > >  1 file changed, 27 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/i=
ommu/arm/arm-smmu/arm-smmu-qcom.c
> > > > index a428e53add08d451fb2152e3ab80e0fba936e214..d34a0d917013bb3d5a2=
4b3ce72f48e3b38474da2 100644
> > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > > @@ -77,12 +77,36 @@ static void qcom_adreno_smmu_set_stall(const vo=
id *cookie, bool enabled)
> > > >  {
> > > >       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> > > >       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> > > > -     struct qcom_smmu *qsmmu =3D to_qcom_smmu(smmu_domain->smmu);
> > > > +     struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> > > > +     struct qcom_smmu *qsmmu =3D to_qcom_smmu(smmu);
> > > > +     u32 mask =3D BIT(cfg->cbndx);
> > > > +     bool stall_changed =3D !!(qsmmu->stall_enabled & mask) !=3D e=
nabled;
> > > > +     unsigned long flags;
> > > >
> > > >       if (enabled)
> > > > -             qsmmu->stall_enabled |=3D BIT(cfg->cbndx);
> > > > +             qsmmu->stall_enabled |=3D mask;
> > > >       else
> > > > -             qsmmu->stall_enabled &=3D ~BIT(cfg->cbndx);
> > > > +             qsmmu->stall_enabled &=3D ~mask;
> > > > +
> > > > +     /*
> > > > +      * If the device is on and we changed the setting, update the=
 register.
> > > > +      */
> > > > +     if (stall_changed && pm_runtime_get_if_active(smmu->dev) > 0)=
 {
> > > > +             spin_lock_irqsave(&smmu_domain->cb_lock, flags);
> > > > +
> > > > +             u32 reg =3D arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SM=
MU_CB_SCTLR);
> > > > +
> > > > +             if (enabled)
> > > > +                     reg |=3D ARM_SMMU_SCTLR_CFCFG;
> > > > +             else
> > > > +                     reg &=3D ~ARM_SMMU_SCTLR_CFCFG;
> > > > +
> > > > +             arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR=
, reg);
> > >
> > > Are you sure you don't need TLB invalidation for this to take effect?=
 I
> > > think some fields in the SCTLR can be cached in the TLB but you'll ne=
ed
> > > to check whether or not that applies to CFCFG.
> > >
> >
> > I think it should be fine because CFCFG only controls behavior when
> > there's a context fault and there can't be TLB entries for entries
> > that cause a context fault: "The architecture permits the caching of
> > any translation table entry that has been returned from memory without
> > a fault and that does not, as a result of that entry, cause a
> > Translation Fault or an Access Flag fault."
>
> Ok, but what about other types of fault? For example, a permission fault
> or an address size fault?
>
> Will

I'm not sure, but the pseudocode for context faults mentions
resampling CFCFG after a fault happens ("We have a fault and must
resample FSR, CFCFG and HUPCF") so I don't think it would be legal to
cache it. Also in practice this does seem to work. Does that answer
it?

Connor

