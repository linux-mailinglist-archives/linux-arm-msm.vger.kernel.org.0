Return-Path: <linux-arm-msm+bounces-25282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8205E927929
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 16:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38B7C289C08
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 14:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F1D1B0100;
	Thu,  4 Jul 2024 14:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5uf+CIk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DA41B0119;
	Thu,  4 Jul 2024 14:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720104429; cv=none; b=QksujHwcXAaybCKU77L/GnmkV9XYE9vF/L4Cn0vyzALXE6NTIVg2e7+1PdhzGYRcQ+Uukgy8T1GUjeiaHqVwBSscbHBNI6F555uAyeknhFeD4KQn0qNkrzJkBlWnAl9beH1Z5wK51tSiGDZbY8GjPYA5NkUGGaa4197WsTrKe6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720104429; c=relaxed/simple;
	bh=IDCeiu5mEawM+br2ekExwxrGFPHyU/H1yI19GY34aAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jVWcKvhFEiZLuRzrO0SZhMXzkkhkZDDeERDe0J5X04gMfbylZnL/qF28Y1sLV7J7hJCKeeWoCRrHRIxzR7nNQo7xnKTFPFcxwdLFeOQw50W+W+WY3FyKoXPmFo9cezJti7MMkDSsTZaV3fPPMO7w7cOLZ7tDv4GEIGzLBfoM9Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5uf+CIk; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52caebc6137so675505e87.0;
        Thu, 04 Jul 2024 07:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720104426; x=1720709226; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUvph06JSFrE905v1rTCX4Mxj2mGQYTfL/RGtqhSfkY=;
        b=S5uf+CIkmN2fqdXtc6G14d3dqKdrIaLg4kiFNbmCJVMeAvxoJm32ISyZUyKlBy9X70
         uCEcszrwErUG6Iz/+kHWzih8Q2VULSSRUZEih5uS9keHMIdAcVjXCkGrCOQtBbiUKMJ/
         iC9pPstPPninC4ZghPD7EUEL1eHc+o/IyP5bk0f8hjVGKP5JUatcGkgCpdJUZoWDKa14
         P6f8sb3DUGx7gahQthk1qgNN0kMF2OsaOENh5Ir/86aBpDmSNFnBABPTAUW0SrAeQmxW
         x1LfVTRZWzNfwGsq1w3/1DNWG3rhgXRYdidLtKVf39oAmw8SrRVdumpVwNrpHw4gLZsE
         Utnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720104426; x=1720709226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DUvph06JSFrE905v1rTCX4Mxj2mGQYTfL/RGtqhSfkY=;
        b=xG5U/DSbnInn6YSVeHecY2ZeCBuVaLJWWzgNwaRNxzvkyJmNO4Ep6DId7Cc6MFcjqC
         zrgQd2KFZoyQdFZRgFPEdAlQqCnum6baxbqxyjc/S4JKv2KPWd+j9TZkUDO9fPeyOfyR
         PJ3131i0k8L8UHyqkewpp1yw0KEggNs5zY2zFdHSvD2VbYc4kbRnZWTax7edat1+cINU
         D/2QgRlqopab6SF+mu7G5ocGFyItA3nim8DVLka3UGGvU8gaUDDkJcezreu2rKGbf41l
         4fV0YlROuZKQGSOuOzk22PgXO8cf8nGYAuqqvj4O6u8sja3n9LQnGT9BMEu97DMOlCyV
         8c5w==
X-Forwarded-Encrypted: i=1; AJvYcCUR+RR5P9iGsxJYT4uER3NAKA42l6k14Q4i95isRjOZDsQI2S562BNswB5A4tjItT6D57YnDpgS5o9inSTYKuJ5ivLc9X9z5P+da7Rd5+R/HRBPodfC+pwxJj2NrbY4jh6KSQMZRv64gyt9OA==
X-Gm-Message-State: AOJu0YwbNiAnb7Wieq/7P/5loAy6l02kM+7F/rNqEeHZ38K9484ZNJ1q
	qS2qBdc524S/rzMH5b1zYWynb5g7Jcoy8yMZUrO6JewPVAEF04cOf1Ddb7GZ/IeonKtIKEhC4qM
	h8xOnRac6w6jAPqudxSG8l/8fGKI=
X-Google-Smtp-Source: AGHT+IFSMB2hLvdXIpk7WdV3emzczgQAeYoRzOjZFLycZVjysO+DsBXLASIoHowJh0V9QyCWLB/vIGYqxvk5qrbfmlQ=
X-Received: by 2002:a19:911d:0:b0:52c:dc0b:42cf with SMTP id
 2adb3069b0e04-52ea061f607mr1239471e87.9.1720104425794; Thu, 04 Jul 2024
 07:47:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628140435.1652374-1-quic_bibekkum@quicinc.com>
 <20240628140435.1652374-7-quic_bibekkum@quicinc.com> <CAF6AEGvroi8rJimFv95tkWmRFa5_aTpBJ7GFcRAuZpLGdSyEYQ@mail.gmail.com>
 <0650ba0a-4453-4e2d-8a76-0f396ac1999c@quicinc.com> <CAF6AEGv_9e-TDW1r0N4-db6pY_aV_EZFqrpNbATVS5Vy6+fs1g@mail.gmail.com>
 <4a5f54c7-120e-427d-8a0a-9fb83e13a72e@quicinc.com> <CAF6AEGtrtFNxDWtuADA4oOHhZJ=dJZcGaJ1XLFJt4fe4Xp=pTA@mail.gmail.com>
 <3b7c05b1-8f36-4c81-a55c-dbb467314099@quicinc.com>
In-Reply-To: <3b7c05b1-8f36-4c81-a55c-dbb467314099@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 4 Jul 2024 07:46:53 -0700
Message-ID: <CAF6AEGuRKU+DkL0-b3xdR1R45_MiiKQYRRXEXYz-xohu8rUaEQ@mail.gmail.com>
Subject: Re: [PATCH v13 6/6] iommu/arm-smmu: add support for PRR bit setup
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	jsnitsel@redhat.com, robh@kernel.org, krzysztof.kozlowski@linaro.org, 
	quic_c_gdjako@quicinc.com, dmitry.baryshkov@linaro.org, 
	konrad.dybcio@linaro.org, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 4:38=E2=80=AFAM Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
>
>
> On 7/2/2024 2:01 AM, Rob Clark wrote:
> > On Mon, Jul 1, 2024 at 4:01=E2=80=AFAM Bibek Kumar Patro
> > <quic_bibekkum@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 6/28/2024 9:14 PM, Rob Clark wrote:
> >>> On Fri, Jun 28, 2024 at 8:10=E2=80=AFAM Bibek Kumar Patro
> >>> <quic_bibekkum@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 6/28/2024 7:47 PM, Rob Clark wrote:
> >>>>> On Fri, Jun 28, 2024 at 7:05=E2=80=AFAM Bibek Kumar Patro
> >>>>> <quic_bibekkum@quicinc.com> wrote:
> >>>>>>
> >>>>>> Add an adreno-smmu-priv interface for drm/msm to call
> >>>>>> into arm-smmu-qcom and initiate the PRR bit setup or reset
> >>>>>> sequence as per request.
> >>>>>>
> >>>>>> This will be used by GPU to setup the PRR bit and related
> >>>>>> configuration registers through adreno-smmu private
> >>>>>> interface instead of directly poking the smmu hardware.
> >>>>>>
> >>>>>> Suggested-by: Rob Clark <robdclark@gmail.com>
> >>>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> >>>>>> ---
> >>>>>>     drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 23 ++++++++++++++=
++++++++
> >>>>>>     drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
> >>>>>>     include/linux/adreno-smmu-priv.h           |  6 +++++-
> >>>>>>     3 files changed, 30 insertions(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/=
iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>>> index bd101a161d04..64571a1c47b8 100644
> >>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>>> @@ -28,6 +28,7 @@
> >>>>>>     #define PREFETCH_SHALLOW       (1 << PREFETCH_SHIFT)
> >>>>>>     #define PREFETCH_MODERATE      (2 << PREFETCH_SHIFT)
> >>>>>>     #define PREFETCH_DEEP          (3 << PREFETCH_SHIFT)
> >>>>>> +#define GFX_ACTLR_PRR          (1 << 5)
> >>>>>>
> >>>>>>     static const struct actlr_config sc7280_apps_actlr_cfg[] =3D {
> >>>>>>            { 0x0800, 0x04e0, PREFETCH_DEFAULT | CMTLB },
> >>>>>> @@ -235,6 +236,27 @@ static void qcom_adreno_smmu_resume_translati=
on(const void *cookie, bool termina
> >>>>>>            arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME,=
 reg);
> >>>>>>     }
> >>>>>>
> >>>>>> +static void qcom_adreno_smmu_set_prr(const void *cookie, phys_add=
r_t page_addr, bool set)
> >>>>>> +{
> >>>>>> +       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> >>>>>> +       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> >>>>>> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> >>>>>> +       u32 reg =3D 0;
> >>>>>> +
> >>>>>> +       writel_relaxed(lower_32_bits(page_addr),
> >>>>>> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_=
LADDR);
> >>>>>> +
> >>>>>> +       writel_relaxed(upper_32_bits(page_addr),
> >>>>>> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_=
UADDR);
> >>>>>> +
> >>>>>> +       reg =3D  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_AC=
TLR);
> >>>>>> +       reg &=3D ~GFX_ACTLR_PRR;
> >>>>>> +       if (set)
> >>>>>> +               reg |=3D FIELD_PREP(GFX_ACTLR_PRR, 1);
> >>>>>> +       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg=
);
> >>>>>> +
> >>>>>
> >>>>> nit, extra line
> >>>>>
> >>>>
> >>>> Ack, will remove this. Thanks for pointing out.
> >>>>
> >>>>> Also, if you passed a `struct page *` instead, then you could drop =
the
> >>>>> bool param, ie. passing NULL for the page would disable PRR.  But I
> >>>>> can go either way if others have a strong preference for phys_addr_=
t.
> >>>>>
> >>>>
> >>>> Oh okay, this looks simple to reset the prr bit.
> >>>> But since this page is allocated and is used inside gfx driver
> >>>> before being utilized for prr bit operation, would it be safe for
> >>>> drm/gfx driver to keep a reference to this page in smmu driver?
> >>>>
> >>>> Since we only need the page address for configuring the
> >>>> CFG_UADDR/CFG_LADDR registers so passed the phys_addr_t.
> >>>
> >>> I don't think the smmu driver needs to keep a reference to the page..
> >>> we can just say it is the responsibility of the drm driver to call
> >>> set_prr(NULL) before freeing the page
> >>>
> >>
> >> That makes sense. If we go by this NULL page method to disable the PRR=
,
> >> we would have to set the address registers to reset value as well.
> >>
> >> The sequence would be like the following as per my understaning:
> >> - Check if it's NULL page
> >> - Set the PRR_CFG_UADDR/PRR_CFG_LADDR to reset values i.e - 0x0 for
> >>     these registers
> >> - Reset the PRR bit in actlr register
> >>
> >> Similar to this snippet:
> >>
> >> #PRR_RESET_ADDR 0x0
> >>
> >> --------------
> >> reg =3D  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR);
> >> reg &=3D ~GFX_ACTLR_PRR;
> >> arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
> >>
> >> if (!prr_page) {
> >>          writel_relaxed(PRR_RESET_ADDR,
> >>                          smmu->base + ARM_SMMU_GFX_PRR_CFG_LADDR);
> >>          writel_relaxed(PRR_RESET_ADDR),
> >>                           smmu->base + ARM_SMMU_GFX_PRR_CFG_UADDR);
> >>          return;
> >> }
> >>
> >>
> >> writel_relaxed(lower_32_bits(page_to_phys(prr_page)),
> >>                  smmu->base + ARM_SMMU_GFX_PRR_CFG_LADDR);
> >>
> >> writel_relaxed(upper_32_bits(page_to_phys(prr_page)),
> >>                  smmu->base + ARM_SMMU_GFX_PRR_CFG_UADDR);
> >>
> >> reg |=3D FIELD_PREP(GFX_ACTLR_PRR, 1);
> >> arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
> >> -----------------
> >>
> >> If looks good, will implement the same in next version.
> >
> > yeah, that looks like it could work..
> >
> > you probably don't need to zero out the PRR_CFG_*ADDR when disabling,
> > and probably could avoid double writing ACTLR, but that is getting
> > into bikeshedding
> >
>
> Actually Rob, since you rightly pointed this out.
> I crosschecked again on these registers.
> PRR_CFG_*ADDR is a global register in SMMU space but
> ACTLR register including PRR bit is a per-domain register.
> There might also be a situation where PRR feature need to be
> disabled or enabled separately for each domain.
> So I think it would be cleaner to have two apis, set_prr_addr(),
> set_prr_bit().
> set_prr_addr() will be used only to set this PRR_CFG_*ADDR
> register by passing a 'struct page *'
> set_prr_bit() will be used as a switch for PRR feature,
> where required smmu_domain will be passed along with
> the bool value to set/reset the PRR bit depending on which this
> feature will be enabled/disabled for the selected domain.

on a related note, adreno has been using arm-smmu for a number of
generations, I guess not all support PRR?  The drm driver will need to
know whether PRR is supported (and expose that to userspace to let the
UMD know whether to expose certain extensions).  How should this work?

BR,
-R

> Thanks & regards,
> Bibek
>
> > BR,
> > -R
> >
> >>
> >> Thanks & regards,
> >> Bibek
> >>
> >>> BR,
> >>> -R
> >>>
> >>>>> Otherwise, lgtm
> >>>>>
> >>>>> BR,
> >>>>> -R
> >>>>>
> >>>>
> >>>> Thanks & regards,
> >>>> Bibek
> >>>>
> >>>>>> +}
> >>>>>> +
> >>>>>>     #define QCOM_ADRENO_SMMU_GPU_SID 0
> >>>>>>
> >>>>>>     static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
> >>>>>> @@ -407,6 +429,7 @@ static int qcom_adreno_smmu_init_context(struc=
t arm_smmu_domain *smmu_domain,
> >>>>>>            priv->get_fault_info =3D qcom_adreno_smmu_get_fault_inf=
o;
> >>>>>>            priv->set_stall =3D qcom_adreno_smmu_set_stall;
> >>>>>>            priv->resume_translation =3D qcom_adreno_smmu_resume_tr=
anslation;
> >>>>>> +       priv->set_prr =3D qcom_adreno_smmu_set_prr;
> >>>>>>
> >>>>>>            actlrvar =3D qsmmu->data->actlrvar;
> >>>>>>            if (!actlrvar)
> >>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu=
/arm/arm-smmu/arm-smmu.h
> >>>>>> index d9c2ef8c1653..3076bef49e20 100644
> >>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> >>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> >>>>>> @@ -154,6 +154,8 @@ enum arm_smmu_cbar_type {
> >>>>>>     #define ARM_SMMU_SCTLR_M               BIT(0)
> >>>>>>
> >>>>>>     #define ARM_SMMU_CB_ACTLR              0x4
> >>>>>> +#define ARM_SMMU_GFX_PRR_CFG_LADDR     0x6008
> >>>>>> +#define ARM_SMMU_GFX_PRR_CFG_UADDR     0x600C
> >>>>>>
> >>>>>>     #define ARM_SMMU_CB_RESUME             0x8
> >>>>>>     #define ARM_SMMU_RESUME_TERMINATE      BIT(0)
> >>>>>> diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adre=
no-smmu-priv.h
> >>>>>> index c637e0997f6d..d6e2ca9f8d8c 100644
> >>>>>> --- a/include/linux/adreno-smmu-priv.h
> >>>>>> +++ b/include/linux/adreno-smmu-priv.h
> >>>>>> @@ -49,7 +49,10 @@ struct adreno_smmu_fault_info {
> >>>>>>      *                 before set_ttbr0_cfg().  If stalling on fau=
lt is enabled,
> >>>>>>      *                 the GPU driver must call resume_translation=
()
> >>>>>>      * @resume_translation: Resume translation after a fault
> >>>>>> - *
> >>>>>> + * @set_prr:      Extendible interface to be used by GPU to modif=
y the
> >>>>>> + *                 ACTLR register bits, currently used to configu=
re
> >>>>>> + *                 Partially-Resident-Region (PRR) feature's
> >>>>>> + *                 setup and reset sequence as requested.
> >>>>>>      *
> >>>>>>      * The GPU driver (drm/msm) and adreno-smmu work together for =
controlling
> >>>>>>      * the GPU's SMMU instance.  This is by necessity, as the GPU =
is directly
> >>>>>> @@ -67,6 +70,7 @@ struct adreno_smmu_priv {
> >>>>>>         void (*get_fault_info)(const void *cookie, struct adreno_s=
mmu_fault_info *info);
> >>>>>>         void (*set_stall)(const void *cookie, bool enabled);
> >>>>>>         void (*resume_translation)(const void *cookie, bool termin=
ate);
> >>>>>> +    void (*set_prr)(const void *cookie, phys_addr_t page_addr, bo=
ol set);
> >>>>>>     };
> >>>>>>
> >>>>>>     #endif /* __ADRENO_SMMU_PRIV_H */
> >>>>>> --
> >>>>>> 2.34.1
> >>>>>>

