Return-Path: <linux-arm-msm+bounces-40291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3714B9E3E12
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 16:21:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E289C280EB7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 15:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657561F7079;
	Wed,  4 Dec 2024 15:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X5WfSJBY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F16220ADC6;
	Wed,  4 Dec 2024 15:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733325685; cv=none; b=DJ1TAa1znM6pr4R3M74/ZjHkvhaRYhXByfn/Bk/WHJSZc33zT9Cf0modvqh1tj92fgzgGBfsDAGRA+yHB7DGaAEM0K+RsQ+VtbxTIl7F8i3cfe6wRwuAvMnBTZ4gl/sRRSkKDV6rxT/vhdiBpgZa0BoDgzCiYGvIEmq+KqQGBdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733325685; c=relaxed/simple;
	bh=rse/mHEaQ4pwvIL0MDej0dzbGWoZ2J37FA4ePeik7QU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VCw5kBl4GYCQ0UIn9eizInuY8m2I8QYgL3xFGWmlp0ckLTRNNV8B/WVoMGaAUDeNUiOtASx5umpaYk8WXri+yjbwLYprLsJWO/RagrL5t/NScFnzm6uBskwVIdMAC9HTozQyRdVDqU+0lEakt+Q8EUL3QBbvTPjpplN5ao86h6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X5WfSJBY; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-84183532291so302888739f.2;
        Wed, 04 Dec 2024 07:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733325682; x=1733930482; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mWIbiNnKNYcwhrgwtmIyW8/OFwoBBcUW/PJNh6ViAc=;
        b=X5WfSJBYyS/k0aun0fYvpEA6KKhbKeXUPtd2Bx4utP0U2AlnigEbLG2O/Fu8rILDis
         f5eYYzbAqmFH3F5lKfcK110QkL0+dfHtd6V7A/vK67MPyNSqf74CCTYGolv7yWp+V+hR
         rAv+3PP6yDzasNlYtrYwfCYIuLgjWc0Kc5g9Vefk5ZrRcqEgCBHW9uvmw5rI3tNyC/8K
         HMjbG+KvxRIau4OG9WKsRNp6Hdn89mJ0kfdeYiec18g21bLhh9Dsqlepqj/HC0NqSZxc
         zh1hWbJtUtrcxwpJyj/jcjkBHNKqCukHS7ggipntbTKRJDyivJrTR1TgsGpnfOieeqdF
         gqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733325682; x=1733930482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mWIbiNnKNYcwhrgwtmIyW8/OFwoBBcUW/PJNh6ViAc=;
        b=Hu81D4GXkF/JxbYj0+iIsFH3x3dLzoOmzuIHci4kwKxww+kINwByACAVUZFoaOtazw
         jHdNt77WIznaWlzOkSUPIcM1G9S0jaJ525zREA3Njax8WAwKcQepUSamLHGPc7KhrMCM
         tzyPsPEi/ZmF7kwzO+FKo3v7Qr0PjAEvnL+qaCiytPrrqcHPB10Alukt448ARd3h3vYB
         ov6IyKK75dFTqFXy/owWU6SubzhFq+Z+wNRGe0PaPip4PcUq2PDTLF3L/j0gNB4+ehEh
         2BY/vGMoa9L1sLlv44pjJ2rCJGZA5DtY47pSKVDy5I/ebHqxLZfoxWPdb7dVV6vaFriB
         tXPA==
X-Forwarded-Encrypted: i=1; AJvYcCWCckWAZcW5fm06t/8JdhRYhh8p63xKWTMSmv1sNfpc4NQOIh4jVufLy7XOfbx6oDH/KMq6aXfsNUXKzfMz@vger.kernel.org, AJvYcCWmS1Lv5sHvGOj3XWeF5aC5+eo5T3JikXkaIFKG73B9HhlhRpsGcxkpp1Tx7nTVmoGVV0o9Vi1Ij58SfCV3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7urDbW0mjB/dCbk/0EKZuPOyBmkGposk0ckmWyP38VbsIvutr
	9/0WKLQaXi6gbi0sleLVmJ4dGNopoufmR4BjdUd7PZqXajs4kn3P4hrlyyUbwVCZbJQ8IJp9JDK
	Y/YWTZ0YNQn0QXIlnRb8vxtQnT7Q=
X-Gm-Gg: ASbGncu7KKd7zsQafNzRMDNqJB2NBZqd4hEt0bcrYazPiFZcCLchi1oQBisInOy6pkV
	rmY63x9pmwe7F7GVwLdNTCTEFsdflHgvQZ1YpS1qZl88io+4xNP/080ZmNEFlfw==
X-Google-Smtp-Source: AGHT+IHDPo/m1Tgonui7uUaMfEFTF1kB0w/zjAZ5wQ/m2NZv6qbrVx899uJo0oDWh0QmO8HzCYsC+VfkeFHabmPKV1c=
X-Received: by 2002:a05:6602:6b19:b0:843:e9c0:8290 with SMTP id
 ca18e2360f4ac-8445b5585a1mr786739639f.6.1733325682440; Wed, 04 Dec 2024
 07:21:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114160721.1527934-1-quic_bibekkum@quicinc.com>
 <20241114160721.1527934-4-quic_bibekkum@quicinc.com> <CAF6AEGuwWsAkRyF-h5Aj3KzM7iksb12HsfJ5Ks+-P8hv60MWFg@mail.gmail.com>
 <9beca099-5cf3-42b5-b1f9-fb1551219b18@quicinc.com> <CAF6AEGvAOswFTpS5PHrgCsG_2-QN_Bi4YjZbPpV+r3x=9D2aUQ@mail.gmail.com>
 <d2d8d9e9-74b1-4b05-84a2-dcfa204e6e00@quicinc.com>
In-Reply-To: <d2d8d9e9-74b1-4b05-84a2-dcfa204e6e00@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 4 Dec 2024 07:21:10 -0800
Message-ID: <CAF6AEGtBva41Fz0tS4gRwK21ZqzDH5yGrWLY6TMeS6u7OFfS0Q@mail.gmail.com>
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

On Wed, Dec 4, 2024 at 3:27=E2=80=AFAM Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
>
>
> On 11/22/2024 10:33 PM, Rob Clark wrote:
> > On Fri, Nov 22, 2024 at 8:19=E2=80=AFAM Bibek Kumar Patro
> > <quic_bibekkum@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 11/20/2024 10:47 PM, Rob Clark wrote:
> >>> On Thu, Nov 14, 2024 at 8:10=E2=80=AFAM Bibek Kumar Patro
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
> >>>>    drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 37 +++++++++++++++++=
+++++
> >>>>    drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
> >>>>    include/linux/adreno-smmu-priv.h           | 14 ++++++++
> >>>>    3 files changed, 53 insertions(+)
> >>>>
> >>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/io=
mmu/arm/arm-smmu/arm-smmu-qcom.c
> >>>> index d26f5aea248e..0e4f3fbda961 100644
> >>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>> @@ -16,6 +16,8 @@
> >>>>
> >>>>    #define QCOM_DUMMY_VAL -1
> >>>>
> >>>> +#define GFX_ACTLR_PRR          (1 << 5)
> >>>> +
> >>>>    static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smm=
u)
> >>>>    {
> >>>>           return container_of(smmu, struct qcom_smmu, smmu);
> >>>> @@ -99,6 +101,32 @@ static void qcom_adreno_smmu_resume_translation(=
const void *cookie, bool termina
> >>>>           arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, re=
g);
> >>>>    }
> >>>>
> >>>> +static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool s=
et)
> >>>> +{
> >>>> +       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> >>>> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> >>>> +       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> >>>> +       u32 reg =3D 0;
> >>>> +
> >>>> +       reg =3D  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTL=
R);
> >>>> +       reg &=3D ~GFX_ACTLR_PRR;
> >>>> +       if (set)
> >>>> +               reg |=3D FIELD_PREP(GFX_ACTLR_PRR, 1);
> >>>> +       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
> >>>> +}
> >>>> +
> >>>> +static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys_=
addr_t page_addr)
> >>>> +{
> >>>> +       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> >>>> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> >>>> +
> >>>> +       writel_relaxed(lower_32_bits(page_addr),
> >>>> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_LA=
DDR);
> >>>> +
> >>>> +       writel_relaxed(upper_32_bits(page_addr),
> >>>> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_UA=
DDR);
> >>>> +}
> >>>> +
> >>>>    #define QCOM_ADRENO_SMMU_GPU_SID 0
> >>>>
> >>>>    static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
> >>>> @@ -210,6 +238,7 @@ static bool qcom_adreno_can_do_ttbr1(struct arm_=
smmu_device *smmu)
> >>>>    static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *=
smmu_domain,
> >>>>                   struct io_pgtable_cfg *pgtbl_cfg, struct device *d=
ev)
> >>>>    {
> >>>> +       const struct device_node *np =3D smmu_domain->smmu->dev->of_=
node;
> >>>>           struct adreno_smmu_priv *priv;
> >>>>
> >>>>           smmu_domain->cfg.flush_walk_prefer_tlbiasid =3D true;
> >>>> @@ -239,6 +268,14 @@ static int qcom_adreno_smmu_init_context(struct=
 arm_smmu_domain *smmu_domain,
> >>>>           priv->get_fault_info =3D qcom_adreno_smmu_get_fault_info;
> >>>>           priv->set_stall =3D qcom_adreno_smmu_set_stall;
> >>>>           priv->resume_translation =3D qcom_adreno_smmu_resume_trans=
lation;
> >>>> +       priv->set_prr_bit =3D NULL;
> >>>> +       priv->set_prr_addr =3D NULL;
> >>>> +
> >>>> +       if (of_device_is_compatible(np, "qcom,smmu-500") &&
> >>>> +                       of_device_is_compatible(np, "qcom,adreno-smm=
u")) {
> >>>
> >>> fwiw, it seems like PRR actually works on sc7180, which is _not_
> >>> mmu-500, so I guess the support actually goes back further.
> >>>
> >>
> >> As I checked sc7180 was on previous variant of SMMU,
> >> so targets on this variant have different steps to set PRR bit.
> >> <Do not have both prr bit and PRR page registers>.
> >
> > Experimentally, I have to set both the PRR LADDR/UADDR regs and
> > ACTLR.PRR bit on sc7180 to get the sparse-residency tests passing.  So
> > the underlying hw seems to work in the same way as mmu-500.  _But_
> > this is on a sc7180 chromebook, the situation might be different
> > depending on fw on things that have QC hyp.
> >
>
> I checked on sc7180 chipset which is based on the smmu-v2,
> this time by looking for these offsets specifically. I can see the
> nomenclature of the PRR related registers are a bit different
> compared to MMU-500 variant.
> Also the implementation register is 64 bit instead of
> dual 32 bit as in case of MMU-500. and PRR bit is not marked in
> ACTLR register offset.

Interesting.. in my experiments it needed both the ACTLR.PRR bit set
and the LADDR/UADDR.  Maybe it was just happy coincidence that two 32b
writes worked?

> So turns out PRR is supported but with some modification and
> can be carried out with same compatible based approach only - as per
> my understanding.
>
> In current patch plan was to provide support for MMU-500 based targets
> and won't break any legacy targets, so we can take the PRR support
> for legacy targets in different series once our evaluation is done on
> smmu-v2 ?

I guess it wouldn't be the end of the world, but it would mean that
drm would need to expose PRR support to userspace separately from
sparse binding support.  Maybe we need to do that anyways.  (I'm not
really sure how many different a6xx+smmu-v2 devices are out there, but
I guess they are all based on the same generation of snapdragon?)

BR,
-R

> We would explore more on this PRR feature for smmu-v2 based targets,
> before supporting it.
>
> Thanks & regards,
> Bibek
>
> >> It's MMU-500 targets only where PRR support is with both PRR bit
> >> and PRR page addr registers. As I was re-visiting our discussions on v=
13
> >> regarding this - I remember that's why we started using the SMMU-
> >> compatible string based PRR procedure selection instead of the reserve=
d-
> >> memory node. [1] i.e Based on SMMU variant (as selected by compatible
> >> string), specific sequence will be selected.
> >>
> >> So for now only MMU-500 based selection has been supported as part of
> >> this series and will add subsequent support for other SMMU-variants
> >> thereafter.
> >>
> >>> I'm curious if we can just rely on this being supported by any hw tha=
t
> >>> has a6xx or newer?
> >>>
> >>
> >> I'd need to check on targets which will be based on a6xx onwards, on
> >> what will be the procedure planned to support PRR feature. I'll update
> >> the information over this space.
> >
> > One of the open questions about the drm/msm sparse-memory patchset is
> > whether we need to expose to userspace whether PRR is supported, or if
> > we can just rely on sparse-binding support implying sparse residency
> > (ie, PRR) support. All a6xx devices support per-process pgtables,
> > which is the only requirement for basic sparseBinding support.  But
> > PRR is required to additionally expose
> > sparseResidencyBuffer/sparseResidencyImage2D.
> >
> > I think, long term, turnip probably will want to drop support for
> > older kernels and remove support for legacy buffer mapping.  But if we
> > have some a6xx devices without PRR, then to do that we'd need to
> > decouple sparse binding and sparse residency.  (Vulkan allows a driver
> > to expose the former without the latter.)
> >
> > BR,
> > -R
> >
> >> [1]:
> >> https://lore.kernel.org/all/5790afa3-f9c0-4720-9804-8a7ff3d91854@quici=
nc.com/#:~:text=3D%3E%20I%20guess%20if,part%20as%20well.
> >>
> >> Thanks & regards,
> >> Bibek
> >>
> >>> BR,
> >>> -R
> >>>
> >>>> +               priv->set_prr_bit =3D qcom_adreno_smmu_set_prr_bit;
> >>>> +               priv->set_prr_addr =3D qcom_adreno_smmu_set_prr_addr=
;
> >>>> +       }
> >>>>
> >>>>           return 0;
> >>>>    }
> >>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/a=
rm/arm-smmu/arm-smmu.h
> >>>> index e2aeb511ae90..2dbf3243b5ad 100644
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
> >>>> index c637e0997f6d..614665153b3e 100644
> >>>> --- a/include/linux/adreno-smmu-priv.h
> >>>> +++ b/include/linux/adreno-smmu-priv.h
> >>>> @@ -50,6 +50,18 @@ struct adreno_smmu_fault_info {
> >>>>     *                 the GPU driver must call resume_translation()
> >>>>     * @resume_translation: Resume translation after a fault
> >>>>     *
> >>>> + * *CAUTION* : PRR callbacks (set_prr_bit/set_prr_addr) are NULL te=
rminated for
> >>>> + *             targets without PRR support. Exercise caution and ve=
rify target
> >>>> + *             capabilities before invoking these callbacks to prev=
ent potential
> >>>> + *             runtime errors or unexpected behavior.
> >>>> + *
> >>>> + * @set_prr_bit:   Extendible interface to be used by GPU to modify=
 the
> >>>> + *                ACTLR register bits, currently used to configure
> >>>> + *                Partially-Resident-Region (PRR) bit for feature's
> >>>> + *                setup and reset sequence as requested.
> >>>> + * @set_prr_addr:  Configure the PRR_CFG_*ADDR register with the
> >>>> + *                physical address of PRR page passed from
> >>>> + *                GPU driver.
> >>>>     *
> >>>>     * The GPU driver (drm/msm) and adreno-smmu work together for con=
trolling
> >>>>     * the GPU's SMMU instance.  This is by necessity, as the GPU is =
directly
> >>>> @@ -67,6 +79,8 @@ struct adreno_smmu_priv {
> >>>>        void (*get_fault_info)(const void *cookie, struct adreno_smmu=
_fault_info *info);
> >>>>        void (*set_stall)(const void *cookie, bool enabled);
> >>>>        void (*resume_translation)(const void *cookie, bool terminate=
);
> >>>> +    void (*set_prr_bit)(const void *cookie, bool set);
> >>>> +    void (*set_prr_addr)(const void *cookie, phys_addr_t page_addr)=
;
> >>>>    };
> >>>>
> >>>>    #endif /* __ADRENO_SMMU_PRIV_H */
> >>>> --
> >>>> 2.34.1
> >>>>
> >>
>

