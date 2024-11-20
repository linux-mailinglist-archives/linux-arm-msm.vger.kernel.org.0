Return-Path: <linux-arm-msm+bounces-38571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BB39D43C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 23:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76BB2B222E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 22:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7DD16F8E9;
	Wed, 20 Nov 2024 22:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AsKi1b7t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED1833998;
	Wed, 20 Nov 2024 22:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732140626; cv=none; b=TnSN1WK7yiOaWFswz9oOHckpze7WwpJ/2fmZ2Ee77c128PACd4LckbAFBBYJ16O2PxaB+nWRJcYyPT6FWKm9fFr59CyIJBzlSH70hPM7tUxB5cRGoAgbAUZ/h8G/lKgZePz2HAQM/PzNyvQC0Qvy2AzQaON4YddFXl9rcS2reoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732140626; c=relaxed/simple;
	bh=Mz14NUJOSZJbxVLtjTSUcPLLwKJdb+uTKcAsDBltWbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ju3duskzxQRM5exRVIyFDtuKwVA9MfWOp1DnD5Zm+nR74fh6b26jABgWM47QV6rWhifkv9OCxyxKBO0dbmmcGSIT6Dr6n1aDJ9GuUDECx5uGLtnrMKdKh3pQskzwGXz+OmyYCCUyFtJFnnAHfdnwbAeYJLoZTPWfRgdSjc683So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AsKi1b7t; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-83abcfb9f39so6986139f.1;
        Wed, 20 Nov 2024 14:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732140624; x=1732745424; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oj68rROPCBfhOofMzF+vgqIX+eOFOYFLFVPliPTOCjc=;
        b=AsKi1b7t0Yg91N8NjAVM5ZY1REPlMHfpJ4srzCNRuoNz9RY6ogoaxDsPvfwb7PPYFD
         vlqLL3v/LUShyuqH4vdc82k1BEFL05tvAki8hNVmFS99WUv3MH5Amdsav8655VpM8mj0
         eWTlh4xi4uAp/dymo4DRyEahOAs+TKUGOGzyecMsyE75BYrR6EURBkkhj18Av5Zl4oLe
         6HTJrJHW1Jg9Lyaf2uFg1Q94duPzoF3gXkTbbPQxt4gAlBJPnPoojhFAUt0RIERgCftT
         iUquMd9LEzkidXoNjXUP0nMUo5Q9mkrsI4vupnRi5QFGoFfcv5KAYBGiOAhnpjtROd2p
         YvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732140624; x=1732745424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oj68rROPCBfhOofMzF+vgqIX+eOFOYFLFVPliPTOCjc=;
        b=k6cPHul9i5nmGYWC7nqZz2tk9FT+yocSsdpOZIsgbYqs5yKaZJ0PZkRM+IQcR12PIs
         x16EaLbLq0dyvYhn7S55R2T8HNjePrB+rQuw3AfoHmlQM3uGjwAlu5r7n17gpVKZJJ8g
         NefrRwN7Z3sFTp58wX4MuqXj3K962TJ/iJTeFvX5whhQULXb0Hf6SjlNtaXeoFPxrg6a
         kyojGBfnmStt1rDjYJE5dePR6LI9LltjXqcenZN8jgJrQXnBZO/0KA/VJZzhEI2gWAtw
         A+mKUXt5XE0Z5sPA3FFOTqL8DAPVjMwM1ROcVW7vUT38WA0Z1Ze06mC6BvPqcJeE9pQv
         SjHQ==
X-Forwarded-Encrypted: i=1; AJvYcCURIdiUGg1kRdSwKcOMybtUcrDvhrbttf9K81rZ77PX1enRzGZeYRaXxgGHZgGBcDd9L9vEOrGOA+EvRuho@vger.kernel.org, AJvYcCUyJpssFYZmzeAiZMEmD3b6Xl+CX9Vqebf4KXTAnZjg+MUBJOT7WNtEGaHYXC/o9iVgc6NEKN54XFxASJyK@vger.kernel.org
X-Gm-Message-State: AOJu0YyqPbGcCe8ZWeC5f3Smnbu9440xNZJIlMpJe1s8ncGOjyduX/nU
	We5boJEWH3a0Kf7pV1WVX7VIRdEGPy2TTmHBW0yfsP9+ThNuC5UCpZ+XitPUrKW2S9a9FrAwMr7
	jlswtOzTswGLe5llMzOKqPPa34ZsVcA==
X-Google-Smtp-Source: AGHT+IGuVZ1dJ1gwWHwE+ibNXQ30tV5NkQ0D32i+bC6B7TXkVCP4oPgAhzkfkKLWoBFXcoeascjrA0ngfjkjC79FGkE=
X-Received: by 2002:a05:6602:1692:b0:83a:a7ec:cc0e with SMTP id
 ca18e2360f4ac-83ec195213cmr100399539f.0.1732140624359; Wed, 20 Nov 2024
 14:10:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114160721.1527934-1-quic_bibekkum@quicinc.com>
 <20241114160721.1527934-4-quic_bibekkum@quicinc.com> <CAF6AEGuwWsAkRyF-h5Aj3KzM7iksb12HsfJ5Ks+-P8hv60MWFg@mail.gmail.com>
In-Reply-To: <CAF6AEGuwWsAkRyF-h5Aj3KzM7iksb12HsfJ5Ks+-P8hv60MWFg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 20 Nov 2024 14:10:12 -0800
Message-ID: <CAF6AEGvVteuOOMod6yw9_6eOn2PxAx+BR8sVOHAHp7Ts8XigBw@mail.gmail.com>
Subject: Re: [PATCH RESEND v17 3/5] iommu/arm-smmu: add support for PRR bit setup
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	jsnitsel@redhat.com, robh@kernel.org, krzysztof.kozlowski@linaro.org, 
	quic_c_gdjako@quicinc.com, dmitry.baryshkov@linaro.org, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
	Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 9:17=E2=80=AFAM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Thu, Nov 14, 2024 at 8:10=E2=80=AFAM Bibek Kumar Patro
> <quic_bibekkum@quicinc.com> wrote:
> >
> > Add an adreno-smmu-priv interface for drm/msm to call
> > into arm-smmu-qcom and initiate the PRR bit setup or reset
> > sequence as per request.
> >
> > This will be used by GPU to setup the PRR bit and related
> > configuration registers through adreno-smmu private
> > interface instead of directly poking the smmu hardware.
> >
> > Suggested-by: Rob Clark <robdclark@gmail.com>
> > Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 37 ++++++++++++++++++++++
> >  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
> >  include/linux/adreno-smmu-priv.h           | 14 ++++++++
> >  3 files changed, 53 insertions(+)
> >
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu=
/arm/arm-smmu/arm-smmu-qcom.c
> > index d26f5aea248e..0e4f3fbda961 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > @@ -16,6 +16,8 @@
> >
> >  #define QCOM_DUMMY_VAL -1
> >
> > +#define GFX_ACTLR_PRR          (1 << 5)
> > +
> >  static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
> >  {
> >         return container_of(smmu, struct qcom_smmu, smmu);
> > @@ -99,6 +101,32 @@ static void qcom_adreno_smmu_resume_translation(con=
st void *cookie, bool termina
> >         arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
> >  }
> >
> > +static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
> > +{
> > +       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> > +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> > +       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> > +       u32 reg =3D 0;
> > +
> > +       reg =3D  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR);
> > +       reg &=3D ~GFX_ACTLR_PRR;
> > +       if (set)
> > +               reg |=3D FIELD_PREP(GFX_ACTLR_PRR, 1);
> > +       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
> > +}
> > +
> > +static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys_add=
r_t page_addr)
> > +{
> > +       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> > +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> > +
> > +       writel_relaxed(lower_32_bits(page_addr),
> > +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_LADDR=
);
> > +
> > +       writel_relaxed(upper_32_bits(page_addr),
> > +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_UADDR=
);
> > +}
> > +
> >  #define QCOM_ADRENO_SMMU_GPU_SID 0
> >
> >  static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
> > @@ -210,6 +238,7 @@ static bool qcom_adreno_can_do_ttbr1(struct arm_smm=
u_device *smmu)
> >  static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_=
domain,
> >                 struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
> >  {
> > +       const struct device_node *np =3D smmu_domain->smmu->dev->of_nod=
e;
> >         struct adreno_smmu_priv *priv;
> >
> >         smmu_domain->cfg.flush_walk_prefer_tlbiasid =3D true;
> > @@ -239,6 +268,14 @@ static int qcom_adreno_smmu_init_context(struct ar=
m_smmu_domain *smmu_domain,
> >         priv->get_fault_info =3D qcom_adreno_smmu_get_fault_info;
> >         priv->set_stall =3D qcom_adreno_smmu_set_stall;
> >         priv->resume_translation =3D qcom_adreno_smmu_resume_translatio=
n;
> > +       priv->set_prr_bit =3D NULL;
> > +       priv->set_prr_addr =3D NULL;
> > +
> > +       if (of_device_is_compatible(np, "qcom,smmu-500") &&
> > +                       of_device_is_compatible(np, "qcom,adreno-smmu")=
) {
>
> fwiw, it seems like PRR actually works on sc7180, which is _not_
> mmu-500, so I guess the support actually goes back further.
>
> I'm curious if we can just rely on this being supported by any hw that
> has a6xx or newer?


Also, unrelated, but we can't assume the smmu is powered when drm
driver calls set_prr_bit/addr, could you add in runpm get/put around
the register access?

Otherwise Conner and I have vk sparse residency working now

BR,
-R

>
> > +               priv->set_prr_bit =3D qcom_adreno_smmu_set_prr_bit;
> > +               priv->set_prr_addr =3D qcom_adreno_smmu_set_prr_addr;
> > +       }
> >
> >         return 0;
> >  }
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/=
arm-smmu/arm-smmu.h
> > index e2aeb511ae90..2dbf3243b5ad 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > @@ -154,6 +154,8 @@ enum arm_smmu_cbar_type {
> >  #define ARM_SMMU_SCTLR_M               BIT(0)
> >
> >  #define ARM_SMMU_CB_ACTLR              0x4
> > +#define ARM_SMMU_GFX_PRR_CFG_LADDR     0x6008
> > +#define ARM_SMMU_GFX_PRR_CFG_UADDR     0x600C
> >
> >  #define ARM_SMMU_CB_RESUME             0x8
> >  #define ARM_SMMU_RESUME_TERMINATE      BIT(0)
> > diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-sm=
mu-priv.h
> > index c637e0997f6d..614665153b3e 100644
> > --- a/include/linux/adreno-smmu-priv.h
> > +++ b/include/linux/adreno-smmu-priv.h
> > @@ -50,6 +50,18 @@ struct adreno_smmu_fault_info {
> >   *                 the GPU driver must call resume_translation()
> >   * @resume_translation: Resume translation after a fault
> >   *
> > + * *CAUTION* : PRR callbacks (set_prr_bit/set_prr_addr) are NULL termi=
nated for
> > + *             targets without PRR support. Exercise caution and verif=
y target
> > + *             capabilities before invoking these callbacks to prevent=
 potential
> > + *             runtime errors or unexpected behavior.
> > + *
> > + * @set_prr_bit:   Extendible interface to be used by GPU to modify th=
e
> > + *                ACTLR register bits, currently used to configure
> > + *                Partially-Resident-Region (PRR) bit for feature's
> > + *                setup and reset sequence as requested.
> > + * @set_prr_addr:  Configure the PRR_CFG_*ADDR register with the
> > + *                physical address of PRR page passed from
> > + *                GPU driver.
> >   *
> >   * The GPU driver (drm/msm) and adreno-smmu work together for controll=
ing
> >   * the GPU's SMMU instance.  This is by necessity, as the GPU is direc=
tly
> > @@ -67,6 +79,8 @@ struct adreno_smmu_priv {
> >      void (*get_fault_info)(const void *cookie, struct adreno_smmu_faul=
t_info *info);
> >      void (*set_stall)(const void *cookie, bool enabled);
> >      void (*resume_translation)(const void *cookie, bool terminate);
> > +    void (*set_prr_bit)(const void *cookie, bool set);
> > +    void (*set_prr_addr)(const void *cookie, phys_addr_t page_addr);
> >  };
> >
> >  #endif /* __ADRENO_SMMU_PRIV_H */
> > --
> > 2.34.1
> >

