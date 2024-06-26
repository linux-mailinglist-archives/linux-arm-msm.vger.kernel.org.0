Return-Path: <linux-arm-msm+bounces-24346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDA8918EC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 20:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6901DB216AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 18:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C3418F2D5;
	Wed, 26 Jun 2024 18:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4rZ7ro4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F7D14EC59;
	Wed, 26 Jun 2024 18:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719427614; cv=none; b=VygMDxQKm8S8aDFvPNvUkVn/k745S51cpunI3kz7T06qUQjjBgfTrJ+2dLW67sGzC+p90HK2XHRzvkG6pXnXc6bIt/r/9ULTucFWFJpZzXvWhm4RkZ3dwKKgTq9hC8TJ2smYCUK0J12b2JHbqY7OVkNDW1XugBIMTEURdlAafOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719427614; c=relaxed/simple;
	bh=hCP2/cOIMfXKaR4773l0cPM0s+a5YSCE6aMXJzq+FCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3jR/IG/UKz5Vg8753teC251chgNncBzVteryKYZRfiXfdy3O11cIjv7WG2YNlIJQmiqBhJfG2NzgTFvcRX+tBX9cpxP+r4FpJGqPMZKb5RZA8Hdhpj9VPEV32Vyg8FiX+0+ydy9Zm4UK15T6qq+wVc1BKm0jhSYqFPOlTtoUEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4rZ7ro4; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57cbc66a0a6so990248a12.1;
        Wed, 26 Jun 2024 11:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719427611; x=1720032411; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05xs0UPmY5E+F63kUKej/aI4513YNXTW11SYkWXrW+o=;
        b=E4rZ7ro4K4ns7P/uQ0HVw1Vr5n3yxqjeCkJ61zjkma9XVyzzXLviN8Uow20fhDQKny
         VwaMGdbT6uB1fJysa/Sp3kUCbN/aOiyUxnU9GWzFA4diV0/BNGJWIyFcwESAvi1zIslJ
         sfOHpuc0G5Fcu2hUE0gk7oshEyG1Dt4TyNjTWOpZifXnOrVMt5PaR4Xbp+ftbXuo0MRs
         Nyg85aUkAshaV8lRBcZbyV45LvU4RzXBDBZxtnhEFO6KhpZqten/Vhq2+bWoAr0NglaT
         7IW8TyF0+i3YrdU5Dv8/lY/urptQgL/2Ti7ni3uR3H71sBOkBiXds4i2Fy48NhRAQyAV
         Ylyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719427611; x=1720032411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=05xs0UPmY5E+F63kUKej/aI4513YNXTW11SYkWXrW+o=;
        b=eO0dOoKrwYMNr5V8QjvbG77hRd47dFLFfP6tOIUSzESxaKa+PSYGL4u7j8hu6bfXsv
         YpOf6pkrKn8p/hZKMV9/Z1XngkjXpaIrlVNSJXT0wT16NDZjChzHnMC57ls21rJ9z7Sm
         /p6dlcGtA4rq/ELcj1slmyqVOoTXCgv9yr6+89Iq1lR9DJUX6L7pREDd8psO/QftbY4O
         WuXwR5pdjLU3dBjDaN7SoYqxmT7NoPqh91FvKuZEWxs2MutZH81Clq0GqH1kS1xVMJD3
         PtJeGfn7EkuSzmMYQbCy049zVZ+p6QRgpegMe+yhlXr/gfL8BIrPrfGfLsMq8l1H3k69
         26cA==
X-Forwarded-Encrypted: i=1; AJvYcCWHlZFhS3uiifkeiqyGs0V/7IHKzO8KLJHC1QVlgs2CRYfFOBbS/q1ZjTyw0BtN4lB0rS0Ml3YbQ+/htV8l0VhtZDXRjpqo4/pQIUq0rUBLe48Fjnikf/dZ7cLbD3pTsZc5aDhW/kqITDc3Gg==
X-Gm-Message-State: AOJu0YxKIBoXG+viTPtrXoBkEOEjXc8lxIK9gC+0dzhJVF/mLnDv+3c2
	6xtmht3gW/nMpgupR3QOrqDWMNRAsJwMR2VKuf2bus7s54nNfTRLrIa/UMhmtnQqoAPMJUJZHfb
	ypz7d/NLwcmNb/HqfNGzSOhb73fgNBg==
X-Google-Smtp-Source: AGHT+IEage29NdSXqvdACNgm4MEoYcHlZ/Kmc6Dcz8VCYvHNGZ0kgMyfqB5MA0odYqhcBx1HpvIgMAGBW3xPbx2snB4=
X-Received: by 2002:a50:a452:0:b0:57c:a4a3:f1fe with SMTP id
 4fb4d7f45d1cf-5847c0a639cmr336979a12.17.1719427611109; Wed, 26 Jun 2024
 11:46:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605121713.3596499-1-quic_bibekkum@quicinc.com>
 <20240605121713.3596499-7-quic_bibekkum@quicinc.com> <CAF6AEGtSCfQVtNTmwB4Jkec5rDmZsr59z2717H76kwWu0wovsw@mail.gmail.com>
 <ae35bf9b-4401-4a99-abd7-c0d9d399a46b@quicinc.com>
In-Reply-To: <ae35bf9b-4401-4a99-abd7-c0d9d399a46b@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 26 Jun 2024 11:46:39 -0700
Message-ID: <CAF6AEGtDvMR3LNwfMOBa9rNzS4gH0Lb_+AgFJrkALPB2GPh+4Q@mail.gmail.com>
Subject: Re: [PATCH v11 6/6] iommu/arm-smmu: add support for PRR bit setup
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	jsnitsel@redhat.com, robh@kernel.org, krzysztof.kozlowski@linaro.org, 
	quic_c_gdjako@quicinc.com, dmitry.baryshkov@linaro.org, 
	konrad.dybcio@linaro.org, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 1:11=E2=80=AFAM Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
>
>
> On 6/12/2024 12:32 AM, Rob Clark wrote:
> > On Wed, Jun 5, 2024 at 5:18=E2=80=AFAM Bibek Kumar Patro
> > <quic_bibekkum@quicinc.com> wrote:
> >>
> >> Add an adreno-smmu-priv interface for drm/msm to call
> >> into arm-smmu-qcom and initiate the PRR bit setup or reset
> >> sequence as per request.
> >>
> >> This will be used by GPU side to setup the PRR bit and
> >> related configuration registers through adreno-smmu private
> >> interface instead of directly poking the smmu hardware.
> >>
> >> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> >> ---
> >>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 21 ++++++++++++++++++++=
+
> >>   drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
> >>   include/linux/adreno-smmu-priv.h           |  5 ++++-
> >>   3 files changed, 27 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iomm=
u/arm/arm-smmu/arm-smmu-qcom.c
> >> index 8dabc26fa10e..2f4ee22f740a 100644
> >> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >> @@ -28,6 +28,7 @@
> >>   #define PREFETCH_SHALLOW       (1 << PREFETCH_SHIFT)
> >>   #define PREFETCH_MODERATE      (2 << PREFETCH_SHIFT)
> >>   #define PREFETCH_DEEP          (3 << PREFETCH_SHIFT)
> >> +#define GFX_ACTLR_PRR          (1 << 5)
> >>
> >>   static const struct actlr_config sc7280_apps_actlr_cfg[] =3D {
> >>          { 0x0800, 0x24e1, PREFETCH_DEFAULT | CMTLB },
> >> @@ -212,6 +213,25 @@ static void qcom_adreno_smmu_resume_translation(c=
onst void *cookie, bool termina
> >>          arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
> >>   }
> >>
> >> +static void qcom_adreno_smmu_set_actlr_bit(const void *cookie, phys_a=
ddr_t page_addr, bool set)
> >> +{
> >
> > _set_actlr_bit() is a bit more of an implementation detail.  Maybe
> > _set_prr() would be a better name?
> >
>
> Yes set_prr sounds more explanatory. Infact Initially planned to name it
> as set_actlr_prr() but later changed it to set_actlr_bit() so to keep
> this interface extendible.
> Incase if gfx driver in future wants to control some other ACTLR bit as
> well along with PRR bit, then we can extend this same interface to
> handle other bits.
> So any additional adreno-smmu-priv interface would note be needed, and
> set_actlr_bit can itself be used for gfx handling of all required ACTLR
> bits.
> I think we can name it set_actlr_prr() for now, and later can change the
> name incase we extend it. What's your thought on this?

I think set_prr() or set_acltr_prr() is fine.. we can worry about
making it more generic if and when there are other ACLTR bits the gpu
wants to control

> > Also, the version of this patch that I typed up (but haven't sent to
> > list yet) took a `struct page *` instead of a phys_addr_t.. passing
> > NULL would disable PRR, so I didn't need the third arg
> >
> >> +       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> >> +       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> >> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> >> +       u32 reg =3D 0;
> >> +
> >> +       writel_relaxed(lower_32_bits(page_addr),
> >> +                               (void *)smmu->ioaddr + ARM_SMMU_GFX_PR=
R_CFG_LADDR);
> >> +
> >> +       writel_relaxed(upper_32_bits(page_addr),
> >> +                               (void *)smmu->ioaddr + ARM_SMMU_GFX_PR=
R_CFG_UADDR);
> >
> > I know downstream writes it as upper+lower, but I'd guess we could
> > just writeq, couldn't we?
> >
>
> Actually ARM_SMMU_GFX_PRR_CFG_LADDR, ARM_SMMU_GFX_PRR_CFG_UADDR both are
> separate 32 bit registers. So I think writeq for 64bit write might not
> work, as these are not 64 bit registers nor these two are separated by
> 64 aligned address.

ahh, ok

> >> +
> >> +       reg =3D  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR)=
;
> >> +       reg |=3D FIELD_PREP(GFX_ACTLR_PRR, set ? 1 : 0);
> >
> > this won't clear the ENABLE_PRR bit if we try to disable it after
> > enabling (unless this bit is read-as-zero
> >
>
> Ah okay right, got it. Thanks for pointing this out.
> Will take care of this in next version.
> will use set/reset in side if() instead with different
> bitwise ops for set and reset.
>
>
> > Also, can we give a name to PRR?  I'm guessing it is something like
> > physical-range-remap?
>
> Yes sure. I checked on this, PRR here actually stands for
> partially-resident-region.

ahh, ok, that makes sense

> So would be better If we add expansion for PRR in a comment ?
> Because if we expand PRR in variables/defines then wouldn't
> the names become too long?

Yeah, I was just thinking to mention it in the comment for set_prr()

BR,
-R

>
> Thanks & regards,
> Bibek
>
> >
> > BR,
> > -R
> >
> >> +       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
> >> +
> >> +}
> >> +
> >>   #define QCOM_ADRENO_SMMU_GPU_SID 0
> >>
> >>   static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
> >> @@ -384,6 +404,7 @@ static int qcom_adreno_smmu_init_context(struct ar=
m_smmu_domain *smmu_domain,
> >>          priv->get_fault_info =3D qcom_adreno_smmu_get_fault_info;
> >>          priv->set_stall =3D qcom_adreno_smmu_set_stall;
> >>          priv->resume_translation =3D qcom_adreno_smmu_resume_translat=
ion;
> >> +       priv->set_actlr_bit =3D qcom_adreno_smmu_set_actlr_bit;
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
> >> index c637e0997f6d..448e191eeb52 100644
> >> --- a/include/linux/adreno-smmu-priv.h
> >> +++ b/include/linux/adreno-smmu-priv.h
> >> @@ -49,7 +49,9 @@ struct adreno_smmu_fault_info {
> >>    *                 before set_ttbr0_cfg().  If stalling on fault is =
enabled,
> >>    *                 the GPU driver must call resume_translation()
> >>    * @resume_translation: Resume translation after a fault
> >> - *
> >> + * @set_actlr_bits: Extendible interface to be used  by GPU to modify=
 the
> >> + *                 ACTLR bits, currently used to intitate PRR bit set=
up or
> >> + *                 reset sequence for ACTLR registers as requested.
> >>    *
> >>    * The GPU driver (drm/msm) and adreno-smmu work together for contro=
lling
> >>    * the GPU's SMMU instance.  This is by necessity, as the GPU is dir=
ectly
> >> @@ -67,6 +69,7 @@ struct adreno_smmu_priv {
> >>       void (*get_fault_info)(const void *cookie, struct adreno_smmu_fa=
ult_info *info);
> >>       void (*set_stall)(const void *cookie, bool enabled);
> >>       void (*resume_translation)(const void *cookie, bool terminate);
> >> +    void (*set_actlr_bit)(const void *cookie, phys_addr_t page_addr, =
bool set);
> >>   };
> >>
> >>   #endif /* __ADRENO_SMMU_PRIV_H */
> >> --
> >> 2.34.1
> >>

