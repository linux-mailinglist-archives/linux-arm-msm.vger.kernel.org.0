Return-Path: <linux-arm-msm+bounces-40293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1899E3E31
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 16:25:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AFD81661EC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 15:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B2E20B7E4;
	Wed,  4 Dec 2024 15:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gISvT48b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1701199EA8;
	Wed,  4 Dec 2024 15:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733325907; cv=none; b=U20p6Mf51M9+ANHNsH6i/u62S669zNvEoZq8obj6VQZx0K1fjML8JnERiBJjaeYXHRWRF/3Rp+JbONTa28mcA+gZOub01N4JhhxqB1phpBUwkjPKuOW46Xg1FuAil6SkGCeUjkTxct2hRcoaLoRg08CXZH4Ewj1ZG/0g4hpC6tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733325907; c=relaxed/simple;
	bh=O5WJjOBByakdcI4s0VguzvXD2HwQImr70uF4lIfEQNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IY1UrBvIzlanlKYOL3jFztGCxUb1dO3oVJencEBnM0EpxlCjNPqjyLOfndHw9dmK2qWTOVwmGnWzQ5leqFNoKvfcAslH3jDsFMeHaEYXqiQHYjVseZdE3kcqxp5HqAmPtCDKbOzoWLaVGWaLW1O9uTqbvfH0oS0NQzwx8xM09rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gISvT48b; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-841acc8151aso245162939f.1;
        Wed, 04 Dec 2024 07:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733325905; x=1733930705; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cj4ujPAaeCyeAbZ9pqBEXTCkhOV+aItvVddY7czsTYg=;
        b=gISvT48bwNacrsV4Zp9eqowREpHTuLhVEr+jWgkV9WgFXu5ZIKE9XoUyUM1ITVgn+I
         LEoTdjeTVoloxnpOAsaCuzCTH635iZlMHJgwq9DrY2PcvgeAdks/YapAkM7CY1bwsSm7
         3vFxDj6+mro5PWlXRwXLg/O5nsoDgK/WRuup5ymGGSs4B0cLMyLh+yaEd9NBVeMZ53oD
         8PePWQrRwgz/qEspHMKr8QbcapI0DWWerhKANrAxpNUBhPPnt74d2KnYg0faLgtOaazd
         disdvq+a3VU/X3FfARzskOt0tiZpy+QbTwvYNBVpPIIm3LhK7zzbC6FgkdofecMF47gG
         fVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733325905; x=1733930705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cj4ujPAaeCyeAbZ9pqBEXTCkhOV+aItvVddY7czsTYg=;
        b=MI6SbYVxxr4hFasgfLYNkiFal6r5uIM/7jujJzV6mYvmOoVRXjpNTKSbzLuRXmc20Z
         lMjniR2q7zNer5G8ZXAVeABmWfpB5o8FHhzGzqGQcan0FiYisg/8xhY9/Nq6UTdjksjs
         6yGq5NIZVsEHAUj4HUBUTEJcH3qp7dQHp68/ML/Ud7VjXKB/XgiF3khjcfCWQFg3WEjt
         GE94Qkgf3PKxw0uf3JRptbizhntodyIhyDSwKK09YHv1HTifltgQmjXg4zJLIX/9Gr+s
         +pbbedP0x11NWZgZ8xdqbqYmZ2cuRRckzqeGTB2VjC5+BvuZuDZZgUf9Fc8IwJgr3YPf
         zyIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBK0OO09GWjOIIsPIZkeoyPopGO4hPuRqp1F+3KV48ubQyOohGdSOoesUsA9LRMKYR0r7oN1MpIcJ/lIWO@vger.kernel.org, AJvYcCVSpbP3nvUzO1DmuzVYnesfg6UTIF+Ea8DfQWkHWBB9dChOmZ5ysFwYU/jvQs64Wnjqv27y4zoVSaWYn2fy@vger.kernel.org
X-Gm-Message-State: AOJu0YyzgC3qeg6c0HMj95Ot72wwsQTKx0jaOf3uaTbPpQEKGtoDQ/pt
	bDn6sK3ALGPRvXADdYchXYFxY4nBbgXVYzvcABY0Tv3H8RLx9c1KPzZRGGTdb8v89q/F/kXefF9
	oYsY+rIjBIUgkwQMQLOTyvRcLQi+D9A==
X-Gm-Gg: ASbGnctYsqCLQXiUmVSXMUcoQT5c6CrU2ZfcUrCVO2KxPBrwd9ni62g7DjLRFxE5z8s
	H3vSMwmb9CdWQBzVfzXHLZYSA6OP1JGTpU3isHVyEGHTON6t4qlb8XgF06rlsnA==
X-Google-Smtp-Source: AGHT+IGXz8ZEpavY/mki3CXE11rwwvgkmZyz0s+4JXHvmWaIgqfTb2XlYZfmbElP0xroAhcJz3jrYOihYr9XvFoXrYI=
X-Received: by 2002:a05:6602:1546:b0:83a:a82b:f856 with SMTP id
 ca18e2360f4ac-8445b53bc6bmr982151039f.3.1733325904978; Wed, 04 Dec 2024
 07:25:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114160721.1527934-1-quic_bibekkum@quicinc.com>
 <20241114160721.1527934-4-quic_bibekkum@quicinc.com> <CAF6AEGuwWsAkRyF-h5Aj3KzM7iksb12HsfJ5Ks+-P8hv60MWFg@mail.gmail.com>
 <CAF6AEGvVteuOOMod6yw9_6eOn2PxAx+BR8sVOHAHp7Ts8XigBw@mail.gmail.com>
 <5696afa2-c4ab-42fe-b29a-6ecee622fbb4@quicinc.com> <CAF6AEGuMmdnOmATMy8f+YgGxfrYb5mkG_qgy870wZPebKaZjVQ@mail.gmail.com>
 <04da6036-56c4-4b8c-b75b-b5e96a089efc@quicinc.com>
In-Reply-To: <04da6036-56c4-4b8c-b75b-b5e96a089efc@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 4 Dec 2024 07:24:52 -0800
Message-ID: <CAF6AEGt-e_4kGyfiO=_oCLX8E3z76zeZ2MbRe1GicZj4hTEu+g@mail.gmail.com>
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

On Wed, Dec 4, 2024 at 3:28=E2=80=AFAM Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
>
>
> On 11/22/2024 10:04 PM, Rob Clark wrote:
> > On Fri, Nov 22, 2024 at 8:20=E2=80=AFAM Bibek Kumar Patro
> > <quic_bibekkum@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 11/21/2024 3:40 AM, Rob Clark wrote:
> >>> On Wed, Nov 20, 2024 at 9:17=E2=80=AFAM Rob Clark <robdclark@gmail.co=
m> wrote:
> >>>>
> >>>> On Thu, Nov 14, 2024 at 8:10=E2=80=AFAM Bibek Kumar Patro
> >>>> <quic_bibekkum@quicinc.com> wrote:
> >>>>>
> >>>>> Add an adreno-smmu-priv interface for drm/msm to call
> >>>>> into arm-smmu-qcom and initiate the PRR bit setup or reset
> >>>>> sequence as per request.
> >>>>>
> >>>>> This will be used by GPU to setup the PRR bit and related
> >>>>> configuration registers through adreno-smmu private
> >>>>> interface instead of directly poking the smmu hardware.
> >>>>>
> >>>>> Suggested-by: Rob Clark <robdclark@gmail.com>
> >>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> >>>>> ---
> >>>>>    drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 37 ++++++++++++++++=
++++++
> >>>>>    drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
> >>>>>    include/linux/adreno-smmu-priv.h           | 14 ++++++++
> >>>>>    3 files changed, 53 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/i=
ommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>> index d26f5aea248e..0e4f3fbda961 100644
> >>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>> @@ -16,6 +16,8 @@
> >>>>>
> >>>>>    #define QCOM_DUMMY_VAL -1
> >>>>>
> >>>>> +#define GFX_ACTLR_PRR          (1 << 5)
> >>>>> +
> >>>>>    static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *sm=
mu)
> >>>>>    {
> >>>>>           return container_of(smmu, struct qcom_smmu, smmu);
> >>>>> @@ -99,6 +101,32 @@ static void qcom_adreno_smmu_resume_translation=
(const void *cookie, bool termina
> >>>>>           arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, r=
eg);
> >>>>>    }
> >>>>>
> >>>>> +static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool =
set)
> >>>>> +{
> >>>>> +       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> >>>>> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> >>>>> +       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> >>>>> +       u32 reg =3D 0;
> >>>>> +
> >>>>> +       reg =3D  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACT=
LR);
> >>>>> +       reg &=3D ~GFX_ACTLR_PRR;
> >>>>> +       if (set)
> >>>>> +               reg |=3D FIELD_PREP(GFX_ACTLR_PRR, 1);
> >>>>> +       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg)=
;
> >>>>> +}
> >>>>> +
> >>>>> +static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys=
_addr_t page_addr)
> >>>>> +{
> >>>>> +       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> >>>>> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> >>>>> +
> >>>>> +       writel_relaxed(lower_32_bits(page_addr),
> >>>>> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_L=
ADDR);
> >>>>> +
> >>>>> +       writel_relaxed(upper_32_bits(page_addr),
> >>>>> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_U=
ADDR);
> >>>>> +}
> >>>>> +
> >>>>>    #define QCOM_ADRENO_SMMU_GPU_SID 0
> >>>>>
> >>>>>    static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
> >>>>> @@ -210,6 +238,7 @@ static bool qcom_adreno_can_do_ttbr1(struct arm=
_smmu_device *smmu)
> >>>>>    static int qcom_adreno_smmu_init_context(struct arm_smmu_domain =
*smmu_domain,
> >>>>>                   struct io_pgtable_cfg *pgtbl_cfg, struct device *=
dev)
> >>>>>    {
> >>>>> +       const struct device_node *np =3D smmu_domain->smmu->dev->of=
_node;
> >>>>>           struct adreno_smmu_priv *priv;
> >>>>>
> >>>>>           smmu_domain->cfg.flush_walk_prefer_tlbiasid =3D true;
> >>>>> @@ -239,6 +268,14 @@ static int qcom_adreno_smmu_init_context(struc=
t arm_smmu_domain *smmu_domain,
> >>>>>           priv->get_fault_info =3D qcom_adreno_smmu_get_fault_info;
> >>>>>           priv->set_stall =3D qcom_adreno_smmu_set_stall;
> >>>>>           priv->resume_translation =3D qcom_adreno_smmu_resume_tran=
slation;
> >>>>> +       priv->set_prr_bit =3D NULL;
> >>>>> +       priv->set_prr_addr =3D NULL;
> >>>>> +
> >>>>> +       if (of_device_is_compatible(np, "qcom,smmu-500") &&
> >>>>> +                       of_device_is_compatible(np, "qcom,adreno-sm=
mu")) {
> >>>>
> >>>> fwiw, it seems like PRR actually works on sc7180, which is _not_
> >>>> mmu-500, so I guess the support actually goes back further.
> >>>>
> >>>> I'm curious if we can just rely on this being supported by any hw th=
at
> >>>> has a6xx or newer?
> >>>
> >>>
> >>> Also, unrelated, but we can't assume the smmu is powered when drm
> >>> driver calls set_prr_bit/addr, could you add in runpm get/put around
> >>> the register access?
> >>>
> >>
> >> I see, thanks for this observation.
> >> It's surely a possible case, when they access these registers
> >> SMMU state is off.
> >> I will add the suggested runpm ops around the register access.
> >>
> >>> Otherwise Conner and I have vk sparse residency working now
> >>>
> >>
> >> Sorry, could not get this. Did you mean that vk sparse residency
> >> is working now using this patch?
> >
> > Yes, vk sparse residency is working with this patch (plus addition of
> > runpm get/put, plus drm/msm patches plus turnip patches) ;-)
> >
>
> Thanks for testing the sparse residency feature with our patch Rob,
> I have an additional query regarding the adreno private interfaces.
> Specifically, I was referring to other interfaces such as
> qcom_adreno_smmu_get_fault_info [1]. It appears that we do not have a
> runpm get/put around the register access in this context.

get_fault_info() is called from the iommu fault handler callback, so
from the fault irq handler, which is why it didn't need the runpm
get/put.  Maybe it is bad to make this assumption about usage, but
then again adreno_smmu_priv isn't really a general purpose interface.

> Could you please clarify whether we need an SMMU vote around register
> access in the case of PRR? IMO, should the users of this callback ensure
> they put a vote before accessing the cb?

How can drm vote for the smmu device?  I guess it could power up
itself and rely on device-link.. but that is pretty overkill to power
up the entire gpu in this case.  I think it is best for the vote to
happen in the PRR callbacks.

BR,
-R

> [1]:
> https://lore.kernel.org/all/20210610214431.539029-1-robdclark@gmail.com/
>
> Thanks & regards,
> Bibek
>
> > BR,
> > -R
> >
> >> Thanks & regards,
> >> Bibek
> >>
> >>> BR,
> >>> -R
> >>>
> >>>>
> >>>>> +               priv->set_prr_bit =3D qcom_adreno_smmu_set_prr_bit;
> >>>>> +               priv->set_prr_addr =3D qcom_adreno_smmu_set_prr_add=
r;
> >>>>> +       }
> >>>>>
> >>>>>           return 0;
> >>>>>    }
> >>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/=
arm/arm-smmu/arm-smmu.h
> >>>>> index e2aeb511ae90..2dbf3243b5ad 100644
> >>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> >>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> >>>>> @@ -154,6 +154,8 @@ enum arm_smmu_cbar_type {
> >>>>>    #define ARM_SMMU_SCTLR_M               BIT(0)
> >>>>>
> >>>>>    #define ARM_SMMU_CB_ACTLR              0x4
> >>>>> +#define ARM_SMMU_GFX_PRR_CFG_LADDR     0x6008
> >>>>> +#define ARM_SMMU_GFX_PRR_CFG_UADDR     0x600C
> >>>>>
> >>>>>    #define ARM_SMMU_CB_RESUME             0x8
> >>>>>    #define ARM_SMMU_RESUME_TERMINATE      BIT(0)
> >>>>> diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adren=
o-smmu-priv.h
> >>>>> index c637e0997f6d..614665153b3e 100644
> >>>>> --- a/include/linux/adreno-smmu-priv.h
> >>>>> +++ b/include/linux/adreno-smmu-priv.h
> >>>>> @@ -50,6 +50,18 @@ struct adreno_smmu_fault_info {
> >>>>>     *                 the GPU driver must call resume_translation()
> >>>>>     * @resume_translation: Resume translation after a fault
> >>>>>     *
> >>>>> + * *CAUTION* : PRR callbacks (set_prr_bit/set_prr_addr) are NULL t=
erminated for
> >>>>> + *             targets without PRR support. Exercise caution and v=
erify target
> >>>>> + *             capabilities before invoking these callbacks to pre=
vent potential
> >>>>> + *             runtime errors or unexpected behavior.
> >>>>> + *
> >>>>> + * @set_prr_bit:   Extendible interface to be used by GPU to modif=
y the
> >>>>> + *                ACTLR register bits, currently used to configure
> >>>>> + *                Partially-Resident-Region (PRR) bit for feature'=
s
> >>>>> + *                setup and reset sequence as requested.
> >>>>> + * @set_prr_addr:  Configure the PRR_CFG_*ADDR register with the
> >>>>> + *                physical address of PRR page passed from
> >>>>> + *                GPU driver.
> >>>>>     *
> >>>>>     * The GPU driver (drm/msm) and adreno-smmu work together for co=
ntrolling
> >>>>>     * the GPU's SMMU instance.  This is by necessity, as the GPU is=
 directly
> >>>>> @@ -67,6 +79,8 @@ struct adreno_smmu_priv {
> >>>>>        void (*get_fault_info)(const void *cookie, struct adreno_smm=
u_fault_info *info);
> >>>>>        void (*set_stall)(const void *cookie, bool enabled);
> >>>>>        void (*resume_translation)(const void *cookie, bool terminat=
e);
> >>>>> +    void (*set_prr_bit)(const void *cookie, bool set);
> >>>>> +    void (*set_prr_addr)(const void *cookie, phys_addr_t page_addr=
);
> >>>>>    };
> >>>>>
> >>>>>    #endif /* __ADRENO_SMMU_PRIV_H */
> >>>>> --
> >>>>> 2.34.1
> >>>>>
> >>
>

