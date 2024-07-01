Return-Path: <linux-arm-msm+bounces-24841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4B491E99B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 22:31:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0294F282BE4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 20:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A76C516F0FE;
	Mon,  1 Jul 2024 20:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Am3IDviD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAB316F0E4;
	Mon,  1 Jul 2024 20:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719865903; cv=none; b=YiLN3qKTjKhFPqaOhXI8TotwdZqNSoEtctJCN9tpZisbXX9gtsbvDAS7Ux4a0x5DjUcHQLL/ju5rNo16eboUyBQJR4vLe6QCVJXlrvtq4T6pycLFnCvz31xupINdD6NJLzUGL6Qyd1b5Jc/YCYrUef6O/dHYsGRu+hTxFaM/jqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719865903; c=relaxed/simple;
	bh=Xoug+Pf2H5s/IkOhc+YsXZkhlN6gdo4kVZVVtz2oYuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sxf8jO+ZZBaLq73x2J26lgL08LVM/THyDf2qHnRG2T5YWBgJnjrbwvvDHMsxGi1QF6rbehGT3EPt4Lw0WtF/LrhQi4CxiYupMiabo1FJ+c9rdeJPDKqxBGx4fhaeX4cNRU6Yo9WAvX3swVLWYVn6lYllcxKB1GDUg47lLFf04w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Am3IDviD; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e72224c395so38546401fa.3;
        Mon, 01 Jul 2024 13:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719865900; x=1720470700; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Igo6mRmi4Wb8qhjbnltnAiTul1wcsE29u8pkuVZmfuw=;
        b=Am3IDviDQfxF9WipTCrlovnGnaeEhjvUcOnFcTL7aamPt0Zv1ZMGCjINe4Niyh653W
         govtQZJ1tHVcidMDq9MIbCkeOeVasjlq/nfia0ecc8p2pQlryywV6JcjzW3vsWG3rJtT
         lyS6IhNySBmi43v7G4tnFuHZwuzR+rZ520v7lzkqKZfu8mvQPJZbRoGfo2ocfXZZ3BsI
         oewWEZLmmpDTX5OwJizXd59is4MMJXugiA9B6bArQ2NHxeurMiiZpttypMb1RpS+Y3oN
         s9kwPfKi8kGnpcVNHjAw5KpC7sJRob607lfFy14GpwnYgCoZQvWj/bD09J7iqQKXv1t6
         a2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719865900; x=1720470700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Igo6mRmi4Wb8qhjbnltnAiTul1wcsE29u8pkuVZmfuw=;
        b=q1dYrs5/JHRmk9DXjMUUEW0jy98a2uAogOO4DpHuBEZ9Z2jkDGa7jh71voZB2r2Llf
         o/ZZwTzxp0XvXUM9qnNvQaVFoghibFCTLS8Tb777uHvA9BQN6+ndBLbc/bW+aWebXweb
         kW2smzUrO7ghlKp5lRZTCtK7+ZOHYwguCBEJQakW/uyX2ruRbneo+kf9jzDzz11UYCJE
         /VCq2NbBL5JTJjyJsDV2XSaLhyXtJMTzBuSsRfqZuMFlfBoP+XMhb1HWLORs6sDSidPy
         cZDTlR/tXvBTtNmbq00z7EAUxvIaePxxqKSqITIM24XpmF2TxDXP2AnoyB0XC+iggiWG
         oBeA==
X-Forwarded-Encrypted: i=1; AJvYcCV92BMPkxy4H/9mLAm0WFIIDaWaxhOHBg0crkx75kVw/tJQ4HvhVe0tlP/jq4lrSS8O0UjO+uhXVygX3TqWw8yrlK+33XoTGE4a3+lGAbZY8xtLSOqTZ1Pjy73gDNCmWxX33DLzeXjrCNc5tA==
X-Gm-Message-State: AOJu0YyRf1TN7oOIX0UtPKqiRiJa45p9q/c0pQbc381JyLdBM+bTTpwF
	nYUAUok0i+r2f+OSxB2eqsDRC/8hMMZVT5qqMRYA4OUtESkJXfZedNwtz2qOQ5QUzOVTsJ2sfoK
	ShBA1SdFc2SjJkkz6jo1kns7F/bI=
X-Google-Smtp-Source: AGHT+IFOIrXPT4bf9oS/jD9RNxfQRx/jOKo5gIFwN3zbBp2BUCaCY4nY72iPAZpqtW7pbCW/3tcVNRjGyb52d14AWDU=
X-Received: by 2002:a2e:7004:0:b0:2ec:556f:3474 with SMTP id
 38308e7fff4ca-2ee5e6d76e9mr38826921fa.52.1719865899468; Mon, 01 Jul 2024
 13:31:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628140435.1652374-1-quic_bibekkum@quicinc.com>
 <20240628140435.1652374-7-quic_bibekkum@quicinc.com> <CAF6AEGvroi8rJimFv95tkWmRFa5_aTpBJ7GFcRAuZpLGdSyEYQ@mail.gmail.com>
 <0650ba0a-4453-4e2d-8a76-0f396ac1999c@quicinc.com> <CAF6AEGv_9e-TDW1r0N4-db6pY_aV_EZFqrpNbATVS5Vy6+fs1g@mail.gmail.com>
 <4a5f54c7-120e-427d-8a0a-9fb83e13a72e@quicinc.com>
In-Reply-To: <4a5f54c7-120e-427d-8a0a-9fb83e13a72e@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 1 Jul 2024 13:31:27 -0700
Message-ID: <CAF6AEGtrtFNxDWtuADA4oOHhZJ=dJZcGaJ1XLFJt4fe4Xp=pTA@mail.gmail.com>
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

On Mon, Jul 1, 2024 at 4:01=E2=80=AFAM Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
>
>
> On 6/28/2024 9:14 PM, Rob Clark wrote:
> > On Fri, Jun 28, 2024 at 8:10=E2=80=AFAM Bibek Kumar Patro
> > <quic_bibekkum@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 6/28/2024 7:47 PM, Rob Clark wrote:
> >>> On Fri, Jun 28, 2024 at 7:05=E2=80=AFAM Bibek Kumar Patro
> >>> <quic_bibekkum@quicinc.com> wrote:
> >>>>
> >>>> Add an adreno-smmu-priv interface for drm/msm to call
> >>>> into arm-smmu-qcom and initiate the PRR bit setup or reset
> >>>> sequence as per request.
> >>>>
> >>>> This will be used by GPU to setup the PRR bit and related
> >>>> configuration registers through adreno-smmu private
> >>>> interface instead of directly poking the smmu hardware.
> >>>>
> >>>> Suggested-by: Rob Clark <robdclark@gmail.com>
> >>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> >>>> ---
> >>>>    drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 23 +++++++++++++++++=
+++++
> >>>>    drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
> >>>>    include/linux/adreno-smmu-priv.h           |  6 +++++-
> >>>>    3 files changed, 30 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/io=
mmu/arm/arm-smmu/arm-smmu-qcom.c
> >>>> index bd101a161d04..64571a1c47b8 100644
> >>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>> @@ -28,6 +28,7 @@
> >>>>    #define PREFETCH_SHALLOW       (1 << PREFETCH_SHIFT)
> >>>>    #define PREFETCH_MODERATE      (2 << PREFETCH_SHIFT)
> >>>>    #define PREFETCH_DEEP          (3 << PREFETCH_SHIFT)
> >>>> +#define GFX_ACTLR_PRR          (1 << 5)
> >>>>
> >>>>    static const struct actlr_config sc7280_apps_actlr_cfg[] =3D {
> >>>>           { 0x0800, 0x04e0, PREFETCH_DEFAULT | CMTLB },
> >>>> @@ -235,6 +236,27 @@ static void qcom_adreno_smmu_resume_translation=
(const void *cookie, bool termina
> >>>>           arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, re=
g);
> >>>>    }
> >>>>
> >>>> +static void qcom_adreno_smmu_set_prr(const void *cookie, phys_addr_=
t page_addr, bool set)
> >>>> +{
> >>>> +       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> >>>> +       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> >>>> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> >>>> +       u32 reg =3D 0;
> >>>> +
> >>>> +       writel_relaxed(lower_32_bits(page_addr),
> >>>> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_LA=
DDR);
> >>>> +
> >>>> +       writel_relaxed(upper_32_bits(page_addr),
> >>>> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_UA=
DDR);
> >>>> +
> >>>> +       reg =3D  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTL=
R);
> >>>> +       reg &=3D ~GFX_ACTLR_PRR;
> >>>> +       if (set)
> >>>> +               reg |=3D FIELD_PREP(GFX_ACTLR_PRR, 1);
> >>>> +       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
> >>>> +
> >>>
> >>> nit, extra line
> >>>
> >>
> >> Ack, will remove this. Thanks for pointing out.
> >>
> >>> Also, if you passed a `struct page *` instead, then you could drop th=
e
> >>> bool param, ie. passing NULL for the page would disable PRR.  But I
> >>> can go either way if others have a strong preference for phys_addr_t.
> >>>
> >>
> >> Oh okay, this looks simple to reset the prr bit.
> >> But since this page is allocated and is used inside gfx driver
> >> before being utilized for prr bit operation, would it be safe for
> >> drm/gfx driver to keep a reference to this page in smmu driver?
> >>
> >> Since we only need the page address for configuring the
> >> CFG_UADDR/CFG_LADDR registers so passed the phys_addr_t.
> >
> > I don't think the smmu driver needs to keep a reference to the page..
> > we can just say it is the responsibility of the drm driver to call
> > set_prr(NULL) before freeing the page
> >
>
> That makes sense. If we go by this NULL page method to disable the PRR,
> we would have to set the address registers to reset value as well.
>
> The sequence would be like the following as per my understaning:
> - Check if it's NULL page
> - Set the PRR_CFG_UADDR/PRR_CFG_LADDR to reset values i.e - 0x0 for
>    these registers
> - Reset the PRR bit in actlr register
>
> Similar to this snippet:
>
> #PRR_RESET_ADDR 0x0
>
> --------------
> reg =3D  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR);
> reg &=3D ~GFX_ACTLR_PRR;
> arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
>
> if (!prr_page) {
>         writel_relaxed(PRR_RESET_ADDR,
>                         smmu->base + ARM_SMMU_GFX_PRR_CFG_LADDR);
>         writel_relaxed(PRR_RESET_ADDR),
>                          smmu->base + ARM_SMMU_GFX_PRR_CFG_UADDR);
>         return;
> }
>
>
> writel_relaxed(lower_32_bits(page_to_phys(prr_page)),
>                 smmu->base + ARM_SMMU_GFX_PRR_CFG_LADDR);
>
> writel_relaxed(upper_32_bits(page_to_phys(prr_page)),
>                 smmu->base + ARM_SMMU_GFX_PRR_CFG_UADDR);
>
> reg |=3D FIELD_PREP(GFX_ACTLR_PRR, 1);
> arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
> -----------------
>
> If looks good, will implement the same in next version.

yeah, that looks like it could work..

you probably don't need to zero out the PRR_CFG_*ADDR when disabling,
and probably could avoid double writing ACTLR, but that is getting
into bikeshedding

BR,
-R

>
> Thanks & regards,
> Bibek
>
> > BR,
> > -R
> >
> >>> Otherwise, lgtm
> >>>
> >>> BR,
> >>> -R
> >>>
> >>
> >> Thanks & regards,
> >> Bibek
> >>
> >>>> +}
> >>>> +
> >>>>    #define QCOM_ADRENO_SMMU_GPU_SID 0
> >>>>
> >>>>    static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
> >>>> @@ -407,6 +429,7 @@ static int qcom_adreno_smmu_init_context(struct =
arm_smmu_domain *smmu_domain,
> >>>>           priv->get_fault_info =3D qcom_adreno_smmu_get_fault_info;
> >>>>           priv->set_stall =3D qcom_adreno_smmu_set_stall;
> >>>>           priv->resume_translation =3D qcom_adreno_smmu_resume_trans=
lation;
> >>>> +       priv->set_prr =3D qcom_adreno_smmu_set_prr;
> >>>>
> >>>>           actlrvar =3D qsmmu->data->actlrvar;
> >>>>           if (!actlrvar)
> >>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/a=
rm/arm-smmu/arm-smmu.h
> >>>> index d9c2ef8c1653..3076bef49e20 100644
> >>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> >>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> >>>> @@ -154,6 +154,8 @@ enum arm_smmu_cbar_type {
> >>>>    #define ARM_SMMU_SCTLR_M               BIT(0)
> >>>>
> >>>>    #define ARM_SMMU_CB_ACTLR              0x4
> >>>> +#define ARM_SMMU_GFX_PRR_CFG_LADDR     0x6008
> >>>> +#define ARM_SMMU_GFX_PRR_CFG_UADDR     0x600C
> >>>>
> >>>>    #define ARM_SMMU_CB_RESUME             0x8
> >>>>    #define ARM_SMMU_RESUME_TERMINATE      BIT(0)
> >>>> diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno=
-smmu-priv.h
> >>>> index c637e0997f6d..d6e2ca9f8d8c 100644
> >>>> --- a/include/linux/adreno-smmu-priv.h
> >>>> +++ b/include/linux/adreno-smmu-priv.h
> >>>> @@ -49,7 +49,10 @@ struct adreno_smmu_fault_info {
> >>>>     *                 before set_ttbr0_cfg().  If stalling on fault =
is enabled,
> >>>>     *                 the GPU driver must call resume_translation()
> >>>>     * @resume_translation: Resume translation after a fault
> >>>> - *
> >>>> + * @set_prr:      Extendible interface to be used by GPU to modify =
the
> >>>> + *                 ACTLR register bits, currently used to configure
> >>>> + *                 Partially-Resident-Region (PRR) feature's
> >>>> + *                 setup and reset sequence as requested.
> >>>>     *
> >>>>     * The GPU driver (drm/msm) and adreno-smmu work together for con=
trolling
> >>>>     * the GPU's SMMU instance.  This is by necessity, as the GPU is =
directly
> >>>> @@ -67,6 +70,7 @@ struct adreno_smmu_priv {
> >>>>        void (*get_fault_info)(const void *cookie, struct adreno_smmu=
_fault_info *info);
> >>>>        void (*set_stall)(const void *cookie, bool enabled);
> >>>>        void (*resume_translation)(const void *cookie, bool terminate=
);
> >>>> +    void (*set_prr)(const void *cookie, phys_addr_t page_addr, bool=
 set);
> >>>>    };
> >>>>
> >>>>    #endif /* __ADRENO_SMMU_PRIV_H */
> >>>> --
> >>>> 2.34.1
> >>>>

