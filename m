Return-Path: <linux-arm-msm+bounces-25869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EE492D701
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 19:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2BF61C20A41
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 17:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D157C19345B;
	Wed, 10 Jul 2024 17:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfBR5HHc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86AE1FA5;
	Wed, 10 Jul 2024 17:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720630924; cv=none; b=Ifheu/8nzW5883yt4ceJZUuxmcES1IOnMBkm+0+Hucado3CwfvonS+uY/t5nFoHT91U7Lyy15oPBu8TXzcHZT7C2nVbcExx6P0T8FA+xK5CYajnaWmMvmkZcbLp2TTsOSGLGaJyOsiNBGn8Zs5kIEG0yovcq878u/jiW/G4kiQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720630924; c=relaxed/simple;
	bh=XDf8T7tHVGX/6Obokb8t6erXQew85OJgKpZAYEd3FTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nRw0IjY4vHdszhKIpR3WoVd8AWhvoNUikkSXpydRrRsXsIW5KoFAFZduP/B0veF5gjopjC/bHvOsHJLPBTU+K8QS9qwOXLcXcQ4UXr4DNUK63dt6TIXxO/uUWemCHtDs64ITf1OIQrJ1ciCm2+94/KqwISSh6vZIJIQNFEGDUMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfBR5HHc; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-58b966b41fbso8449472a12.1;
        Wed, 10 Jul 2024 10:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720630921; x=1721235721; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyrCTE4zQDmUcT1RGchb60vzE51Dwc7Fv+z7Cbw0d6o=;
        b=RfBR5HHcsHENgrDd49txrnCg3qAasT2woJhpsemwrlvoIf8FnWLq7gMcGtFMtR83Dy
         eO4sltPCIDwHnNQfKOPRAqr7RVn4285jcPnDaldzCb5BQP39Fotkox4AotUS4UrpZYiX
         pFZOn6zBpceGQk3pruchOk2kVqguqsgb/dmkMGVzSoU2vp6kY78AiGaziM6rsd6mSVrJ
         0pngHjSiNNUQhrY1oxniN8dMqvS8WlP7dZ71GZqdODjL3dGdv9QeC4ns9hIWWXpM8Ang
         HTkBMyr9fXSlYExMLRzXPf+9XSADx21UTS79GpGWkUxWt/EWc1Ig7sfQaCUUiJp1YXoJ
         0fvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720630921; x=1721235721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyrCTE4zQDmUcT1RGchb60vzE51Dwc7Fv+z7Cbw0d6o=;
        b=QjJCv+KKDeUBoXwLjTfs5BCauxMMdf1Bud7yg/DfS9udPf5xsGkwGEsmr0Sol7uK9S
         sgmT6oMUsL1Gt9kP+tMz+q9/NYPvFmOuZmo5c77ILTDdEobH22XHZ7u3dWJ1zdA7DRD8
         PTxEgZl3lWTImUgHzq7WIEVLbbUzoJk6S3dazDxJjEiKipnGBlBSkpzE7GqgyeeZQnen
         MxNTqDggnNMgNbZu0frRy85WIP3JpkFsZyngXV1nV1GPntyTlA8Zs0BphV2bHcKuwYAr
         +lnFE3e9ZilzRfxvTB5r1P13vqrxv27b8FK+Z5/oDfDbnUQ7/t10IFEkmYiTPj52iaws
         5gcA==
X-Forwarded-Encrypted: i=1; AJvYcCWrbCiX4DDQXgIbdRKGJIQOGDw1cTxA0mwOxr/hhZZQBj83nl2aJKDEC8xok+7h/Y/1bOXPAnbm4Fub+eqnyffH29HA8KEV+KkLQBI0nfS5FXKoZRmq26x6eguLRZFYV3FvPiohiBceGP9c/w==
X-Gm-Message-State: AOJu0YxWrjhgPypcQHXL+XyLz3KPw1+2+YVrvG9unIKmcySvCFxqIOAL
	QBeN8Ky/d+qhXX4V56jAlb1DqPRClpvZEtsUNVKZJQjaRFz+aVneFYuNDkyZTZXkfY/DSzpSEnE
	o3D3bgy/2DCLp5eSUbFQueQl4KNM=
X-Google-Smtp-Source: AGHT+IF8vPqBaKN9Y6UVuGZrPIuYnA9NmKXaDxOwLanVUwszBNsrzWwmWEHDZ1rud17Z1g+5zdNjXhrZxe7I8d1mFcw=
X-Received: by 2002:a05:6402:520c:b0:57d:57c:ce99 with SMTP id
 4fb4d7f45d1cf-594ba997567mr4738656a12.2.1720630920627; Wed, 10 Jul 2024
 10:02:00 -0700 (PDT)
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
 <3b7c05b1-8f36-4c81-a55c-dbb467314099@quicinc.com> <CAF6AEGuRKU+DkL0-b3xdR1R45_MiiKQYRRXEXYz-xohu8rUaEQ@mail.gmail.com>
 <CAF6AEGtbw06-gOSvX9gAbi=SA801gmD3_8c5xkOU-G9g2qKptQ@mail.gmail.com> <9509f256-04a4-4907-98fc-148c5087d74d@quicinc.com>
In-Reply-To: <9509f256-04a4-4907-98fc-148c5087d74d@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 10 Jul 2024 10:01:48 -0700
Message-ID: <CAF6AEGuLwZ0yFGWMKX-O1VjQB2M57K+CsyJ=7PCKXE=b=VsSNg@mail.gmail.com>
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

On Tue, Jul 9, 2024 at 12:43=E2=80=AFPM Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
>
>
> On 7/4/2024 9:28 PM, Rob Clark wrote:
> > On Thu, Jul 4, 2024 at 7:46=E2=80=AFAM Rob Clark <robdclark@gmail.com> =
wrote:
> >>
> >> On Wed, Jul 3, 2024 at 4:38=E2=80=AFAM Bibek Kumar Patro
> >> <quic_bibekkum@quicinc.com> wrote:
> >>>
> >>>
> >>>
> >>> On 7/2/2024 2:01 AM, Rob Clark wrote:
> >>>> On Mon, Jul 1, 2024 at 4:01=E2=80=AFAM Bibek Kumar Patro
> >>>> <quic_bibekkum@quicinc.com> wrote:
> >>>>>
> >>>>>
> >>>>>
> >>>>> On 6/28/2024 9:14 PM, Rob Clark wrote:
> >>>>>> On Fri, Jun 28, 2024 at 8:10=E2=80=AFAM Bibek Kumar Patro
> >>>>>> <quic_bibekkum@quicinc.com> wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>> On 6/28/2024 7:47 PM, Rob Clark wrote:
> >>>>>>>> On Fri, Jun 28, 2024 at 7:05=E2=80=AFAM Bibek Kumar Patro
> >>>>>>>> <quic_bibekkum@quicinc.com> wrote:
> >>>>>>>>>
> >>>>>>>>> Add an adreno-smmu-priv interface for drm/msm to call
> >>>>>>>>> into arm-smmu-qcom and initiate the PRR bit setup or reset
> >>>>>>>>> sequence as per request.
> >>>>>>>>>
> >>>>>>>>> This will be used by GPU to setup the PRR bit and related
> >>>>>>>>> configuration registers through adreno-smmu private
> >>>>>>>>> interface instead of directly poking the smmu hardware.
> >>>>>>>>>
> >>>>>>>>> Suggested-by: Rob Clark <robdclark@gmail.com>
> >>>>>>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> >>>>>>>>> ---
> >>>>>>>>>      drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 23 ++++++++++=
++++++++++++
> >>>>>>>>>      drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
> >>>>>>>>>      include/linux/adreno-smmu-priv.h           |  6 +++++-
> >>>>>>>>>      3 files changed, 30 insertions(+), 1 deletion(-)
> >>>>>>>>>
> >>>>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drive=
rs/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>>>>>> index bd101a161d04..64571a1c47b8 100644
> >>>>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>>>>>> @@ -28,6 +28,7 @@
> >>>>>>>>>      #define PREFETCH_SHALLOW       (1 << PREFETCH_SHIFT)
> >>>>>>>>>      #define PREFETCH_MODERATE      (2 << PREFETCH_SHIFT)
> >>>>>>>>>      #define PREFETCH_DEEP          (3 << PREFETCH_SHIFT)
> >>>>>>>>> +#define GFX_ACTLR_PRR          (1 << 5)
> >>>>>>>>>
> >>>>>>>>>      static const struct actlr_config sc7280_apps_actlr_cfg[] =
=3D {
> >>>>>>>>>             { 0x0800, 0x04e0, PREFETCH_DEFAULT | CMTLB },
> >>>>>>>>> @@ -235,6 +236,27 @@ static void qcom_adreno_smmu_resume_transl=
ation(const void *cookie, bool termina
> >>>>>>>>>             arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RES=
UME, reg);
> >>>>>>>>>      }
> >>>>>>>>>
> >>>>>>>>> +static void qcom_adreno_smmu_set_prr(const void *cookie, phys_=
addr_t page_addr, bool set)
> >>>>>>>>> +{
> >>>>>>>>> +       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> >>>>>>>>> +       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> >>>>>>>>> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> >>>>>>>>> +       u32 reg =3D 0;
> >>>>>>>>> +
> >>>>>>>>> +       writel_relaxed(lower_32_bits(page_addr),
> >>>>>>>>> +                               smmu->base + ARM_SMMU_GFX_PRR_C=
FG_LADDR);
> >>>>>>>>> +
> >>>>>>>>> +       writel_relaxed(upper_32_bits(page_addr),
> >>>>>>>>> +                               smmu->base + ARM_SMMU_GFX_PRR_C=
FG_UADDR);
> >>>>>>>>> +
> >>>>>>>>> +       reg =3D  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB=
_ACTLR);
> >>>>>>>>> +       reg &=3D ~GFX_ACTLR_PRR;
> >>>>>>>>> +       if (set)
> >>>>>>>>> +               reg |=3D FIELD_PREP(GFX_ACTLR_PRR, 1);
> >>>>>>>>> +       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, =
reg);
> >>>>>>>>> +
> >>>>>>>>
> >>>>>>>> nit, extra line
> >>>>>>>>
> >>>>>>>
> >>>>>>> Ack, will remove this. Thanks for pointing out.
> >>>>>>>
> >>>>>>>> Also, if you passed a `struct page *` instead, then you could dr=
op the
> >>>>>>>> bool param, ie. passing NULL for the page would disable PRR.  Bu=
t I
> >>>>>>>> can go either way if others have a strong preference for phys_ad=
dr_t.
> >>>>>>>>
> >>>>>>>
> >>>>>>> Oh okay, this looks simple to reset the prr bit.
> >>>>>>> But since this page is allocated and is used inside gfx driver
> >>>>>>> before being utilized for prr bit operation, would it be safe for
> >>>>>>> drm/gfx driver to keep a reference to this page in smmu driver?
> >>>>>>>
> >>>>>>> Since we only need the page address for configuring the
> >>>>>>> CFG_UADDR/CFG_LADDR registers so passed the phys_addr_t.
> >>>>>>
> >>>>>> I don't think the smmu driver needs to keep a reference to the pag=
e..
> >>>>>> we can just say it is the responsibility of the drm driver to call
> >>>>>> set_prr(NULL) before freeing the page
> >>>>>>
> >>>>>
> >>>>> That makes sense. If we go by this NULL page method to disable the =
PRR,
> >>>>> we would have to set the address registers to reset value as well.
> >>>>>
> >>>>> The sequence would be like the following as per my understaning:
> >>>>> - Check if it's NULL page
> >>>>> - Set the PRR_CFG_UADDR/PRR_CFG_LADDR to reset values i.e - 0x0 for
> >>>>>      these registers
> >>>>> - Reset the PRR bit in actlr register
> >>>>>
> >>>>> Similar to this snippet:
> >>>>>
> >>>>> #PRR_RESET_ADDR 0x0
> >>>>>
> >>>>> --------------
> >>>>> reg =3D  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR);
> >>>>> reg &=3D ~GFX_ACTLR_PRR;
> >>>>> arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
> >>>>>
> >>>>> if (!prr_page) {
> >>>>>           writel_relaxed(PRR_RESET_ADDR,
> >>>>>                           smmu->base + ARM_SMMU_GFX_PRR_CFG_LADDR);
> >>>>>           writel_relaxed(PRR_RESET_ADDR),
> >>>>>                            smmu->base + ARM_SMMU_GFX_PRR_CFG_UADDR)=
;
> >>>>>           return;
> >>>>> }
> >>>>>
> >>>>>
> >>>>> writel_relaxed(lower_32_bits(page_to_phys(prr_page)),
> >>>>>                   smmu->base + ARM_SMMU_GFX_PRR_CFG_LADDR);
> >>>>>
> >>>>> writel_relaxed(upper_32_bits(page_to_phys(prr_page)),
> >>>>>                   smmu->base + ARM_SMMU_GFX_PRR_CFG_UADDR);
> >>>>>
> >>>>> reg |=3D FIELD_PREP(GFX_ACTLR_PRR, 1);
> >>>>> arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
> >>>>> -----------------
> >>>>>
> >>>>> If looks good, will implement the same in next version.
> >>>>
> >>>> yeah, that looks like it could work..
> >>>>
> >>>> you probably don't need to zero out the PRR_CFG_*ADDR when disabling=
,
> >>>> and probably could avoid double writing ACTLR, but that is getting
> >>>> into bikeshedding
> >>>>
> >>>
> >>> Actually Rob, since you rightly pointed this out.
> >>> I crosschecked again on these registers.
> >>> PRR_CFG_*ADDR is a global register in SMMU space but
> >>> ACTLR register including PRR bit is a per-domain register.
> >>> There might also be a situation where PRR feature need to be
> >>> disabled or enabled separately for each domain.
> >>> So I think it would be cleaner to have two apis, set_prr_addr(),
> >>> set_prr_bit().
> >>> set_prr_addr() will be used only to set this PRR_CFG_*ADDR
> >>> register by passing a 'struct page *'
> >>> set_prr_bit() will be used as a switch for PRR feature,
> >>> where required smmu_domain will be passed along with
> >>> the bool value to set/reset the PRR bit depending on which this
> >>> feature will be enabled/disabled for the selected domain.
> >>
> >> on a related note, adreno has been using arm-smmu for a number of
> >> generations, I guess not all support PRR?  The drm driver will need to
> >> know whether PRR is supported (and expose that to userspace to let the
> >> UMD know whether to expose certain extensions).  How should this work?
> >
> > So, I noticed in the x1e80100.dtsi that there is a gpu_prr_mem
> > reserved section..  maybe we should be connecting this to the smmu
> > driver in dt, and using that to detect presence of PRR?  Ie. the smmu
> > driver would configure PRR_CFG_*ADDR based on the reserved mem, and
> > the interface to drm would just be to enable/disable PRR, returning an
> > error code if the reserved mem section isn't there.
> >
> > This simplifies the interface, and handles the question of how to
> > detect if PRR is supported.
> >
> > BR,
> > -R
> >
>
> As I checked gpu_prr_mem reserved mem section is not used for mobile
> targets hence not present for other DT only compute targets like
> x1e80100.dtsi has the same. PRR looks to be smmu version specific
> property.

I only see it in gpu_prr_mem in x1e80100.dtsi, but not documented
anywhere.  I'm only assuming based on the name that it is intended to
be for PRR (but not sure why it is larger than 0x1000).  Are the
PRR_CFG_*ADDR regs programmed by the fw (and access blocked in EL1) on
this device?

As far as other DT, we haven't enabled PRR anywhere yet.  I think it
would be perfectly valid to require a new reserved-memory node to
enable PRR.

> This feature is present in all the targets using SMMU-500,
> I am still checking for targets using versions prior to smmu-500.
> Then maybe we can use the smmu compatible string itself (e.g.
> qcom,smmu-500 && qcom,adreno-smmu) to connect to smmu driver for
> checking the presence of PRR ?

If there is a clean break, such as all smmu-500 have PRR and all
smmu-v2 do not, then it would be reasonable to use the compat strings.
If not, I think we need a different way.

BR,
-R

> And if the compatible string is different then we can return the
> error code signifying PRR feature is not supported on the particular
> smmu version.
>
> Thanks & regards,
> Bibek
>
> >> BR,
> >> -R
> >>
> >>> Thanks & regards,
> >>> Bibek
> >>>
> >>>> BR,
> >>>> -R
> >>>>
> >>>>>
> >>>>> Thanks & regards,
> >>>>> Bibek
> >>>>>
> >>>>>> BR,
> >>>>>> -R
> >>>>>>
> >>>>>>>> Otherwise, lgtm
> >>>>>>>>
> >>>>>>>> BR,
> >>>>>>>> -R
> >>>>>>>>
> >>>>>>>
> >>>>>>> Thanks & regards,
> >>>>>>> Bibek
> >>>>>>>
> >>>>>>>>> +}
> >>>>>>>>> +
> >>>>>>>>>      #define QCOM_ADRENO_SMMU_GPU_SID 0
> >>>>>>>>>
> >>>>>>>>>      static bool qcom_adreno_smmu_is_gpu_device(struct device *=
dev)
> >>>>>>>>> @@ -407,6 +429,7 @@ static int qcom_adreno_smmu_init_context(st=
ruct arm_smmu_domain *smmu_domain,
> >>>>>>>>>             priv->get_fault_info =3D qcom_adreno_smmu_get_fault=
_info;
> >>>>>>>>>             priv->set_stall =3D qcom_adreno_smmu_set_stall;
> >>>>>>>>>             priv->resume_translation =3D qcom_adreno_smmu_resum=
e_translation;
> >>>>>>>>> +       priv->set_prr =3D qcom_adreno_smmu_set_prr;
> >>>>>>>>>
> >>>>>>>>>             actlrvar =3D qsmmu->data->actlrvar;
> >>>>>>>>>             if (!actlrvar)
> >>>>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/io=
mmu/arm/arm-smmu/arm-smmu.h
> >>>>>>>>> index d9c2ef8c1653..3076bef49e20 100644
> >>>>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> >>>>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> >>>>>>>>> @@ -154,6 +154,8 @@ enum arm_smmu_cbar_type {
> >>>>>>>>>      #define ARM_SMMU_SCTLR_M               BIT(0)
> >>>>>>>>>
> >>>>>>>>>      #define ARM_SMMU_CB_ACTLR              0x4
> >>>>>>>>> +#define ARM_SMMU_GFX_PRR_CFG_LADDR     0x6008
> >>>>>>>>> +#define ARM_SMMU_GFX_PRR_CFG_UADDR     0x600C
> >>>>>>>>>
> >>>>>>>>>      #define ARM_SMMU_CB_RESUME             0x8
> >>>>>>>>>      #define ARM_SMMU_RESUME_TERMINATE      BIT(0)
> >>>>>>>>> diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/a=
dreno-smmu-priv.h
> >>>>>>>>> index c637e0997f6d..d6e2ca9f8d8c 100644
> >>>>>>>>> --- a/include/linux/adreno-smmu-priv.h
> >>>>>>>>> +++ b/include/linux/adreno-smmu-priv.h
> >>>>>>>>> @@ -49,7 +49,10 @@ struct adreno_smmu_fault_info {
> >>>>>>>>>       *                 before set_ttbr0_cfg().  If stalling on=
 fault is enabled,
> >>>>>>>>>       *                 the GPU driver must call resume_transla=
tion()
> >>>>>>>>>       * @resume_translation: Resume translation after a fault
> >>>>>>>>> - *
> >>>>>>>>> + * @set_prr:      Extendible interface to be used by GPU to mo=
dify the
> >>>>>>>>> + *                 ACTLR register bits, currently used to conf=
igure
> >>>>>>>>> + *                 Partially-Resident-Region (PRR) feature's
> >>>>>>>>> + *                 setup and reset sequence as requested.
> >>>>>>>>>       *
> >>>>>>>>>       * The GPU driver (drm/msm) and adreno-smmu work together =
for controlling
> >>>>>>>>>       * the GPU's SMMU instance.  This is by necessity, as the =
GPU is directly
> >>>>>>>>> @@ -67,6 +70,7 @@ struct adreno_smmu_priv {
> >>>>>>>>>          void (*get_fault_info)(const void *cookie, struct adre=
no_smmu_fault_info *info);
> >>>>>>>>>          void (*set_stall)(const void *cookie, bool enabled);
> >>>>>>>>>          void (*resume_translation)(const void *cookie, bool te=
rminate);
> >>>>>>>>> +    void (*set_prr)(const void *cookie, phys_addr_t page_addr,=
 bool set);
> >>>>>>>>>      };
> >>>>>>>>>
> >>>>>>>>>      #endif /* __ADRENO_SMMU_PRIV_H */
> >>>>>>>>> --
> >>>>>>>>> 2.34.1
> >>>>>>>>>

