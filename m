Return-Path: <linux-arm-msm+bounces-24655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 560D691C2D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 17:44:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D3D428180D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 15:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC571C688B;
	Fri, 28 Jun 2024 15:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qr0HVKD2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1E91C232A;
	Fri, 28 Jun 2024 15:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719589464; cv=none; b=cZWaWIjAoB3R+mB6/y1CFbmoTJk38CD9ZcXzVl8gwDVEJdEtK3g/OotOSp2b9S5RNX6b+CEkqV2KpQzHIY4JsvBXXVE/3F35YOT8+4Wsr1RNyg2xOjJ6s+L98//KGNRzAUrt7AS+BAb8EbES4FqIVZMXTzMmsXVYqfMDS9ts7wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719589464; c=relaxed/simple;
	bh=6baYHAndBaXBKtbguN4+Q1PPL5X8wWGWVfBYKK443KA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XyLVMERzZZQDQJRtFDWKgqy+1YgFvhrZ4CJ5rX80g1n6YUYYajEPdnFnszgCjP99YZvgQRT1CLpLWglIc5TcfQ/zPBYi9DiaVxf8wlH+/VaIr064vI9ROxHkDbvX5GEgjTQ1nc7A3H2/fmjfrA7+UQxu2CfUvTM1Xvz++Oq3Tqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qr0HVKD2; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57cbc66a0a6so114790a12.1;
        Fri, 28 Jun 2024 08:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719589460; x=1720194260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HC6tl9tCbssmE3/Q/6kzuGmrgE8lN7GRWhwmyhOUQU=;
        b=Qr0HVKD24m13jjacNaQ2NfWuvryB7hE3WaFePF06ky2zGQtPP0RYmzjF9XUN7ffxZN
         1SfIk4UwpV7z8SaLIOrRMiKHIXWpceA8drvKui9QyXNc94ppKT7MtqKp7i0V9zNrS9fI
         B1wTg7yjSqonSCUP3RWH9rdm4cR5F7ZLHsehjFNZHAyfs+scQLiklqd4FuhCde6lc+jr
         ULq51FQcd0JsIO48sP7CGIhxxZS5cQR6j3xm9tKL6TNQVXWrJ+FSiQgOSQU7hjNQbCrG
         iYvDIuT12RcAhSvyF1Tc8MaEi2F3DsqPQPvpejOHrchd+VtXuPyYm2nBGQxRK4d70Od0
         r8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719589460; x=1720194260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HC6tl9tCbssmE3/Q/6kzuGmrgE8lN7GRWhwmyhOUQU=;
        b=xG98CvgjT0arBgUHSBCrZQikmgSuYNBu+ecza5GQU0XWoCURh3EgiRs1k91stRMuDL
         vOyqANcQAuTJkOP8iWnAWjQ1Il5/Di6aihJ86gVFfYJ9UdSYCAVrXSP5UkNznNa2maKm
         FUsYTlmU+dVNqXnjm5yQhUZQ8UBGGvw3vbAdvM46LI65zA1H8istPRj9DQgYH4erOHQQ
         M5y0iW83fklmZk082D1QB39XqceAKbYkwA//eZZUuHD7GhU4Z7DnrOgBVRXE7/oWJBQ+
         wgxGDZelLepuKylqL2zfFlPoHXlPB1o6FAJoHJNLbjDx4CwOLoS1YQIZZZs+67BpoaPx
         kQcw==
X-Forwarded-Encrypted: i=1; AJvYcCXiqspnErfbmVrDHYI6+VnMNd9fDiUUfZ78bD48k0ukdNO1MuJLtyC1TYF+LhlIwjpZjuLkdE9pELR5BiB1H8mXYctkj7uRvyQyCnlNiwibWIn4Dv8cDbtvwVCRWQJpQIw5on7N9c3Qy34Ndw==
X-Gm-Message-State: AOJu0YyldebkqwHZqo2c+dmjD8dRB8lPl5o1dcqUzbv20/TFTyMQK1Zi
	j+geReY5dU53FhnLewfP43pdiwuTYYYqkIFssNoOqh5vCl0ExpkuCC7dBra6En1qy7cY/DV/cNW
	mOYqBlS5GpQa33KQHv6mce5p8qVM=
X-Google-Smtp-Source: AGHT+IGItWItOlNrtDqTAzzndsotYDbe2xVnarK09JySPML+dYHRvTB1nBEPxTE6oniunHMczL8ARP6qrdKU2eX5xec=
X-Received: by 2002:a05:6402:5246:b0:57d:4a0d:d597 with SMTP id
 4fb4d7f45d1cf-5865c3f7b12mr1836505a12.12.1719589460233; Fri, 28 Jun 2024
 08:44:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628140435.1652374-1-quic_bibekkum@quicinc.com>
 <20240628140435.1652374-7-quic_bibekkum@quicinc.com> <CAF6AEGvroi8rJimFv95tkWmRFa5_aTpBJ7GFcRAuZpLGdSyEYQ@mail.gmail.com>
 <0650ba0a-4453-4e2d-8a76-0f396ac1999c@quicinc.com>
In-Reply-To: <0650ba0a-4453-4e2d-8a76-0f396ac1999c@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 28 Jun 2024 08:44:08 -0700
Message-ID: <CAF6AEGv_9e-TDW1r0N4-db6pY_aV_EZFqrpNbATVS5Vy6+fs1g@mail.gmail.com>
Subject: Re: [PATCH v13 6/6] iommu/arm-smmu: add support for PRR bit setup
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	jsnitsel@redhat.com, robh@kernel.org, krzysztof.kozlowski@linaro.org, 
	quic_c_gdjako@quicinc.com, dmitry.baryshkov@linaro.org, 
	konrad.dybcio@linaro.org, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 8:10=E2=80=AFAM Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
>
>
> On 6/28/2024 7:47 PM, Rob Clark wrote:
> > On Fri, Jun 28, 2024 at 7:05=E2=80=AFAM Bibek Kumar Patro
> > <quic_bibekkum@quicinc.com> wrote:
> >>
> >> Add an adreno-smmu-priv interface for drm/msm to call
> >> into arm-smmu-qcom and initiate the PRR bit setup or reset
> >> sequence as per request.
> >>
> >> This will be used by GPU to setup the PRR bit and related
> >> configuration registers through adreno-smmu private
> >> interface instead of directly poking the smmu hardware.
> >>
> >> Suggested-by: Rob Clark <robdclark@gmail.com>
> >> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> >> ---
> >>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 23 ++++++++++++++++++++=
++
> >>   drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
> >>   include/linux/adreno-smmu-priv.h           |  6 +++++-
> >>   3 files changed, 30 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iomm=
u/arm/arm-smmu/arm-smmu-qcom.c
> >> index bd101a161d04..64571a1c47b8 100644
> >> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >> @@ -28,6 +28,7 @@
> >>   #define PREFETCH_SHALLOW       (1 << PREFETCH_SHIFT)
> >>   #define PREFETCH_MODERATE      (2 << PREFETCH_SHIFT)
> >>   #define PREFETCH_DEEP          (3 << PREFETCH_SHIFT)
> >> +#define GFX_ACTLR_PRR          (1 << 5)
> >>
> >>   static const struct actlr_config sc7280_apps_actlr_cfg[] =3D {
> >>          { 0x0800, 0x04e0, PREFETCH_DEFAULT | CMTLB },
> >> @@ -235,6 +236,27 @@ static void qcom_adreno_smmu_resume_translation(c=
onst void *cookie, bool termina
> >>          arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
> >>   }
> >>
> >> +static void qcom_adreno_smmu_set_prr(const void *cookie, phys_addr_t =
page_addr, bool set)
> >> +{
> >> +       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> >> +       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> >> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> >> +       u32 reg =3D 0;
> >> +
> >> +       writel_relaxed(lower_32_bits(page_addr),
> >> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_LADD=
R);
> >> +
> >> +       writel_relaxed(upper_32_bits(page_addr),
> >> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_UADD=
R);
> >> +
> >> +       reg =3D  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR)=
;
> >> +       reg &=3D ~GFX_ACTLR_PRR;
> >> +       if (set)
> >> +               reg |=3D FIELD_PREP(GFX_ACTLR_PRR, 1);
> >> +       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
> >> +
> >
> > nit, extra line
> >
>
> Ack, will remove this. Thanks for pointing out.
>
> > Also, if you passed a `struct page *` instead, then you could drop the
> > bool param, ie. passing NULL for the page would disable PRR.  But I
> > can go either way if others have a strong preference for phys_addr_t.
> >
>
> Oh okay, this looks simple to reset the prr bit.
> But since this page is allocated and is used inside gfx driver
> before being utilized for prr bit operation, would it be safe for
> drm/gfx driver to keep a reference to this page in smmu driver?
>
> Since we only need the page address for configuring the
> CFG_UADDR/CFG_LADDR registers so passed the phys_addr_t.

I don't think the smmu driver needs to keep a reference to the page..
we can just say it is the responsibility of the drm driver to call
set_prr(NULL) before freeing the page

BR,
-R

> > Otherwise, lgtm
> >
> > BR,
> > -R
> >
>
> Thanks & regards,
> Bibek
>
> >> +}
> >> +
> >>   #define QCOM_ADRENO_SMMU_GPU_SID 0
> >>
> >>   static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
> >> @@ -407,6 +429,7 @@ static int qcom_adreno_smmu_init_context(struct ar=
m_smmu_domain *smmu_domain,
> >>          priv->get_fault_info =3D qcom_adreno_smmu_get_fault_info;
> >>          priv->set_stall =3D qcom_adreno_smmu_set_stall;
> >>          priv->resume_translation =3D qcom_adreno_smmu_resume_translat=
ion;
> >> +       priv->set_prr =3D qcom_adreno_smmu_set_prr;
> >>
> >>          actlrvar =3D qsmmu->data->actlrvar;
> >>          if (!actlrvar)
> >> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm=
/arm-smmu/arm-smmu.h
> >> index d9c2ef8c1653..3076bef49e20 100644
> >> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> >> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> >> @@ -154,6 +154,8 @@ enum arm_smmu_cbar_type {
> >>   #define ARM_SMMU_SCTLR_M               BIT(0)
> >>
> >>   #define ARM_SMMU_CB_ACTLR              0x4
> >> +#define ARM_SMMU_GFX_PRR_CFG_LADDR     0x6008
> >> +#define ARM_SMMU_GFX_PRR_CFG_UADDR     0x600C
> >>
> >>   #define ARM_SMMU_CB_RESUME             0x8
> >>   #define ARM_SMMU_RESUME_TERMINATE      BIT(0)
> >> diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-s=
mmu-priv.h
> >> index c637e0997f6d..d6e2ca9f8d8c 100644
> >> --- a/include/linux/adreno-smmu-priv.h
> >> +++ b/include/linux/adreno-smmu-priv.h
> >> @@ -49,7 +49,10 @@ struct adreno_smmu_fault_info {
> >>    *                 before set_ttbr0_cfg().  If stalling on fault is =
enabled,
> >>    *                 the GPU driver must call resume_translation()
> >>    * @resume_translation: Resume translation after a fault
> >> - *
> >> + * @set_prr:      Extendible interface to be used by GPU to modify th=
e
> >> + *                 ACTLR register bits, currently used to configure
> >> + *                 Partially-Resident-Region (PRR) feature's
> >> + *                 setup and reset sequence as requested.
> >>    *
> >>    * The GPU driver (drm/msm) and adreno-smmu work together for contro=
lling
> >>    * the GPU's SMMU instance.  This is by necessity, as the GPU is dir=
ectly
> >> @@ -67,6 +70,7 @@ struct adreno_smmu_priv {
> >>       void (*get_fault_info)(const void *cookie, struct adreno_smmu_fa=
ult_info *info);
> >>       void (*set_stall)(const void *cookie, bool enabled);
> >>       void (*resume_translation)(const void *cookie, bool terminate);
> >> +    void (*set_prr)(const void *cookie, phys_addr_t page_addr, bool s=
et);
> >>   };
> >>
> >>   #endif /* __ADRENO_SMMU_PRIV_H */
> >> --
> >> 2.34.1
> >>

