Return-Path: <linux-arm-msm+bounces-38869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE189D6259
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 17:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F772281D00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 16:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5875F83CD3;
	Fri, 22 Nov 2024 16:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHmygZF8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B2013C80C;
	Fri, 22 Nov 2024 16:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732293304; cv=none; b=HbNbJQ6oyo3JS5a2uRIWq4OVLeFxJZwXTfkXQPjUiRGziDHoC6VLtpnCXlfJVK9EBoHMVzPLJt1wF/GdDd0PYNURt3bkriFtg/3IIMNE1Ay6UJa5NCs90q0BrQKxH5UbdjyIlPYh3b64MvvJegeJCQWU657ZUt585x8rOiSNHiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732293304; c=relaxed/simple;
	bh=QmYCrbrZ0QjT4nfwEGLidKiS2Xq+j8XtbaNx/WThNd4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mikdsj14/WDHhsz2GV1VAqkfvcUXlKfSbqgJBtT0ND2+exJ4fIsQX5g1YEJmk/rAobQcJDrdt8x+J6eA5nd3nTnRARTJf5bIHd2IFwIMTS9pJcr433joG+nWBJA9A6VJ7f1kZ1Z9BGx+v4kKY0bvYbrQBr6w/vq2/fjZsNLJ89M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHmygZF8; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-83abc039b25so80350739f.0;
        Fri, 22 Nov 2024 08:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732293301; x=1732898101; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GReVTWBGYFw/FTP8yPSarz5HbeY1G9Mo/s/2dusNN00=;
        b=kHmygZF83lUg6MxCWp2cdL+h5FMk9+/mBIgt+nkibD08g559paNPhGqMDGavaOsEet
         99/Zr6eZ74ZsX2hlKMK5sqQdcTDTOHcCl3YuUVXWb8i0A09uFjyQWNU6HMYQ77k+xzAH
         VfeCZUDPanDFCwZRUAKo7b7+zXV2oBEY5K1MBsSOmZYl8m74oTzrUKgApRdNn+WzR49o
         HhqABLZJ8Z/FY9tQPUEhE4LdEJ27N6zNvksquRs8On5TSbA5kgFIxFlHUSjducatXlTP
         X5E1OQTCuOBZkEXaOtCEZQbeQS+bryxwYLZ2CpMrWjZeJTG1HDhru8TsA2acFZN5UmpF
         79zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732293301; x=1732898101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GReVTWBGYFw/FTP8yPSarz5HbeY1G9Mo/s/2dusNN00=;
        b=fdowpMNHopgjL9a+2qXwQTCN+C2QwLjQUwkFk/Gxer1YfdXpBesAaQvhmq4U/5uZy1
         aJuvLVvIqzYl2ibR2YDnncXDTUYYqkCI/Cjf28hCUawQ4gb3bPhWJ+kVQSrg+6U/Fyfo
         6pmdzouyfn2h0hxngsNTUTei2bmXTZJ5IYmwnkJaT/bK9QFsQEubZGrqxoMEfzWv6Sac
         eFbU/0FZoM5/6wjWu52TTIU6HBOZ21MGz52BeIa7Mzjh+3EY7l3Mhzs0Tz8fAZbpzjMu
         nnSZ4ysmkIUbqjIngvo7vQV6YV1KwYHHgOqsKbcddKU9OM7ljXkS1EgZ+TNyGrk1LYFa
         Ouaw==
X-Forwarded-Encrypted: i=1; AJvYcCU0/BLL8iaNifa22q4V/Sb5jnTzNCdz6ULrS69Bz3Rh+4cFJkw6V/PgopkZpQH+xwHUMg+PLDAn/WOXnxoH@vger.kernel.org, AJvYcCVnXJEpHwYfB4EuSe7KonVxuwgpZ290rjBAkwfvsz5xQeSE7nJ/bBYLUUpj5JcxhavvB0BiU94iZH+xcaVM@vger.kernel.org
X-Gm-Message-State: AOJu0YwAU/fIM5Y9u/VsC3nMMKAR5+pi5u+t5M9VqQZ1vpIRui5btx5C
	BiZ80djU0vVR6UBagWHtNyIi9VPsFInvfaiWV0mMIVROf/PfGwJ4gRcIX47XPw/tCMaRduRygWb
	5s7G4/gRQPOfJEK+8wjsmiYSuexE=
X-Gm-Gg: ASbGncsAmtyHPXSn/Roz8XK06fA8n1ven7AvvSNcQPoMHtxHLpltMA94/1ygbYkfL8K
	NNvd4/PTPCu1T9L+dP6+idXoxHy2zk8aBKGE4dUAvfDAKRKw/K8fBMGU1uovXqQ==
X-Google-Smtp-Source: AGHT+IHCczpv5MTe10j+ysaRXaFSBOv7fYB9EL4QC/DbZ6+Wyvs0DC3CMZrZNaNLbRff8uCbLJwlKESwT+n24Kb5K0A=
X-Received: by 2002:a05:6602:3c8:b0:83d:e526:fde7 with SMTP id
 ca18e2360f4ac-83ecdca5850mr480494439f.6.1732293300996; Fri, 22 Nov 2024
 08:35:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114160721.1527934-1-quic_bibekkum@quicinc.com>
 <20241114160721.1527934-4-quic_bibekkum@quicinc.com> <CAF6AEGuwWsAkRyF-h5Aj3KzM7iksb12HsfJ5Ks+-P8hv60MWFg@mail.gmail.com>
 <CAF6AEGvVteuOOMod6yw9_6eOn2PxAx+BR8sVOHAHp7Ts8XigBw@mail.gmail.com> <5696afa2-c4ab-42fe-b29a-6ecee622fbb4@quicinc.com>
In-Reply-To: <5696afa2-c4ab-42fe-b29a-6ecee622fbb4@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 22 Nov 2024 08:34:49 -0800
Message-ID: <CAF6AEGuMmdnOmATMy8f+YgGxfrYb5mkG_qgy870wZPebKaZjVQ@mail.gmail.com>
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

On Fri, Nov 22, 2024 at 8:20=E2=80=AFAM Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
>
>
> On 11/21/2024 3:40 AM, Rob Clark wrote:
> > On Wed, Nov 20, 2024 at 9:17=E2=80=AFAM Rob Clark <robdclark@gmail.com>=
 wrote:
> >>
> >> On Thu, Nov 14, 2024 at 8:10=E2=80=AFAM Bibek Kumar Patro
> >> <quic_bibekkum@quicinc.com> wrote:
> >>>
> >>> Add an adreno-smmu-priv interface for drm/msm to call
> >>> into arm-smmu-qcom and initiate the PRR bit setup or reset
> >>> sequence as per request.
> >>>
> >>> This will be used by GPU to setup the PRR bit and related
> >>> configuration registers through adreno-smmu private
> >>> interface instead of directly poking the smmu hardware.
> >>>
> >>> Suggested-by: Rob Clark <robdclark@gmail.com>
> >>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> >>> ---
> >>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 37 +++++++++++++++++++=
+++
> >>>   drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
> >>>   include/linux/adreno-smmu-priv.h           | 14 ++++++++
> >>>   3 files changed, 53 insertions(+)
> >>>
> >>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iom=
mu/arm/arm-smmu/arm-smmu-qcom.c
> >>> index d26f5aea248e..0e4f3fbda961 100644
> >>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>> @@ -16,6 +16,8 @@
> >>>
> >>>   #define QCOM_DUMMY_VAL -1
> >>>
> >>> +#define GFX_ACTLR_PRR          (1 << 5)
> >>> +
> >>>   static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
> >>>   {
> >>>          return container_of(smmu, struct qcom_smmu, smmu);
> >>> @@ -99,6 +101,32 @@ static void qcom_adreno_smmu_resume_translation(c=
onst void *cookie, bool termina
> >>>          arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg)=
;
> >>>   }
> >>>
> >>> +static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool se=
t)
> >>> +{
> >>> +       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> >>> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> >>> +       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> >>> +       u32 reg =3D 0;
> >>> +
> >>> +       reg =3D  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR=
);
> >>> +       reg &=3D ~GFX_ACTLR_PRR;
> >>> +       if (set)
> >>> +               reg |=3D FIELD_PREP(GFX_ACTLR_PRR, 1);
> >>> +       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
> >>> +}
> >>> +
> >>> +static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys_a=
ddr_t page_addr)
> >>> +{
> >>> +       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> >>> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> >>> +
> >>> +       writel_relaxed(lower_32_bits(page_addr),
> >>> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_LAD=
DR);
> >>> +
> >>> +       writel_relaxed(upper_32_bits(page_addr),
> >>> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_UAD=
DR);
> >>> +}
> >>> +
> >>>   #define QCOM_ADRENO_SMMU_GPU_SID 0
> >>>
> >>>   static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
> >>> @@ -210,6 +238,7 @@ static bool qcom_adreno_can_do_ttbr1(struct arm_s=
mmu_device *smmu)
> >>>   static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *sm=
mu_domain,
> >>>                  struct io_pgtable_cfg *pgtbl_cfg, struct device *dev=
)
> >>>   {
> >>> +       const struct device_node *np =3D smmu_domain->smmu->dev->of_n=
ode;
> >>>          struct adreno_smmu_priv *priv;
> >>>
> >>>          smmu_domain->cfg.flush_walk_prefer_tlbiasid =3D true;
> >>> @@ -239,6 +268,14 @@ static int qcom_adreno_smmu_init_context(struct =
arm_smmu_domain *smmu_domain,
> >>>          priv->get_fault_info =3D qcom_adreno_smmu_get_fault_info;
> >>>          priv->set_stall =3D qcom_adreno_smmu_set_stall;
> >>>          priv->resume_translation =3D qcom_adreno_smmu_resume_transla=
tion;
> >>> +       priv->set_prr_bit =3D NULL;
> >>> +       priv->set_prr_addr =3D NULL;
> >>> +
> >>> +       if (of_device_is_compatible(np, "qcom,smmu-500") &&
> >>> +                       of_device_is_compatible(np, "qcom,adreno-smmu=
")) {
> >>
> >> fwiw, it seems like PRR actually works on sc7180, which is _not_
> >> mmu-500, so I guess the support actually goes back further.
> >>
> >> I'm curious if we can just rely on this being supported by any hw that
> >> has a6xx or newer?
> >
> >
> > Also, unrelated, but we can't assume the smmu is powered when drm
> > driver calls set_prr_bit/addr, could you add in runpm get/put around
> > the register access?
> >
>
> I see, thanks for this observation.
> It's surely a possible case, when they access these registers
> SMMU state is off.
> I will add the suggested runpm ops around the register access.
>
> > Otherwise Conner and I have vk sparse residency working now
> >
>
> Sorry, could not get this. Did you mean that vk sparse residency
> is working now using this patch?

Yes, vk sparse residency is working with this patch (plus addition of
runpm get/put, plus drm/msm patches plus turnip patches) ;-)

BR,
-R

> Thanks & regards,
> Bibek
>
> > BR,
> > -R
> >
> >>
> >>> +               priv->set_prr_bit =3D qcom_adreno_smmu_set_prr_bit;
> >>> +               priv->set_prr_addr =3D qcom_adreno_smmu_set_prr_addr;
> >>> +       }
> >>>
> >>>          return 0;
> >>>   }
> >>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/ar=
m/arm-smmu/arm-smmu.h
> >>> index e2aeb511ae90..2dbf3243b5ad 100644
> >>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> >>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> >>> @@ -154,6 +154,8 @@ enum arm_smmu_cbar_type {
> >>>   #define ARM_SMMU_SCTLR_M               BIT(0)
> >>>
> >>>   #define ARM_SMMU_CB_ACTLR              0x4
> >>> +#define ARM_SMMU_GFX_PRR_CFG_LADDR     0x6008
> >>> +#define ARM_SMMU_GFX_PRR_CFG_UADDR     0x600C
> >>>
> >>>   #define ARM_SMMU_CB_RESUME             0x8
> >>>   #define ARM_SMMU_RESUME_TERMINATE      BIT(0)
> >>> diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-=
smmu-priv.h
> >>> index c637e0997f6d..614665153b3e 100644
> >>> --- a/include/linux/adreno-smmu-priv.h
> >>> +++ b/include/linux/adreno-smmu-priv.h
> >>> @@ -50,6 +50,18 @@ struct adreno_smmu_fault_info {
> >>>    *                 the GPU driver must call resume_translation()
> >>>    * @resume_translation: Resume translation after a fault
> >>>    *
> >>> + * *CAUTION* : PRR callbacks (set_prr_bit/set_prr_addr) are NULL ter=
minated for
> >>> + *             targets without PRR support. Exercise caution and ver=
ify target
> >>> + *             capabilities before invoking these callbacks to preve=
nt potential
> >>> + *             runtime errors or unexpected behavior.
> >>> + *
> >>> + * @set_prr_bit:   Extendible interface to be used by GPU to modify =
the
> >>> + *                ACTLR register bits, currently used to configure
> >>> + *                Partially-Resident-Region (PRR) bit for feature's
> >>> + *                setup and reset sequence as requested.
> >>> + * @set_prr_addr:  Configure the PRR_CFG_*ADDR register with the
> >>> + *                physical address of PRR page passed from
> >>> + *                GPU driver.
> >>>    *
> >>>    * The GPU driver (drm/msm) and adreno-smmu work together for contr=
olling
> >>>    * the GPU's SMMU instance.  This is by necessity, as the GPU is di=
rectly
> >>> @@ -67,6 +79,8 @@ struct adreno_smmu_priv {
> >>>       void (*get_fault_info)(const void *cookie, struct adreno_smmu_f=
ault_info *info);
> >>>       void (*set_stall)(const void *cookie, bool enabled);
> >>>       void (*resume_translation)(const void *cookie, bool terminate);
> >>> +    void (*set_prr_bit)(const void *cookie, bool set);
> >>> +    void (*set_prr_addr)(const void *cookie, phys_addr_t page_addr);
> >>>   };
> >>>
> >>>   #endif /* __ADRENO_SMMU_PRIV_H */
> >>> --
> >>> 2.34.1
> >>>
>

