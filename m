Return-Path: <linux-arm-msm+bounces-41519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1D79ECF8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 16:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D41C716994D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 15:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9477219CC1C;
	Wed, 11 Dec 2024 15:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZVxwZX0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ED2246356;
	Wed, 11 Dec 2024 15:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733930537; cv=none; b=MNoGBVq2AkkQjP3MQ4P/Dg5mbYhsYs6HBNoIKwGdjJR1qn2i4q3PQ57Fc0rU9nQaOFnPhPjm4FHnOxoMlCdulqmMQdJZz50/nrbgQh5+ju6Vix7C/bSVfUbElR02uIaTSoj3HsbjZsU20GT+QeY7GtX8dUpLvyG/KH/vCGwJlrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733930537; c=relaxed/simple;
	bh=Y1/JGqN2CQyjiY+pyPPcTJdPjG3uQzfPbe4b9qlmpUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DqFMaPQizSFq2FGo72yES1sa+wvuEJt3EH5DD08/obr1LUPtIGutJafE5jM5JnSfkNT8eGVK8xgDZ0k6uutqG+7gXjyesJSZOtM7grtt5jsI+1egRzGSCr0o3VXFt/5pCpgtjN37XZEqrXYEIrc2o2qJ+Ee/uK6FRq2DKmaLTLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZVxwZX0; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3a7deec316aso23999125ab.1;
        Wed, 11 Dec 2024 07:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733930535; x=1734535335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZe/+d3bS5gAmGuRvmadmgGnD2hb02s2arMKWmCzLGw=;
        b=jZVxwZX0SHiZULo7xsfedkHt86SgVEOj5OKyhAXW1FZEn4mtAExiv7iQnsRiq6kbHr
         9eIkca4fteBmWmVXOmnllRR+V1HSZ8eSaVYIh/PGYUw7LzBCoU8H2kuPCpU4r9VW+q8N
         /TtqA9dxKW/jJMUXd2Zv25C5B1QVjklpL764c7czM3wQpvrSBhB56xZOR6s9nV9jltEd
         auT1DNDngqi/AFem+O5lKuobXWczFzhAHpNpevfhAGssd+ZAFLNU5S6/xLiZ5psHyO0T
         9MT1HnTSkyn2JantHYMIiO4xbZg1WaZhNY8G1C4Phb47Il0OGdwwIJdg4QOwOMpPLaiy
         rc/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733930535; x=1734535335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZe/+d3bS5gAmGuRvmadmgGnD2hb02s2arMKWmCzLGw=;
        b=MbbherilkSWuQ1kVwh3QyJ414HCi/0ygTp1E/rHmS0Ex2lzdpZMh7wJNBVc1b7f+WM
         YGNn4VuwqQIbxWrTkbvpEj44GcmFdhyocEVYJiR8JdlTFVti+9nMvx8MHmB+eHKM4imI
         Ub8QZr6Bb7t8N3y+e4NjUl/tQN2I4hKlKJdI995LDzpkCYtBZkqCypImlNQd/kdPAFNq
         i6oFM6f5Afx7QFoCJuUmvsSVV8MtkkOQ0kv3khtIsP9K9Zh9wJAdUjYXrQDKIypvSeN/
         ZI2p+bBMvWMuUVfx6qcv3Iq1v0G7mdPyvQNWD9nuRHULmJy2J4ekIYgd7eQBZN1740A9
         rP5g==
X-Forwarded-Encrypted: i=1; AJvYcCU6xLF+A/FfCl7E7DgRdXBAdjd38zIiWYKijpPsQLPMTEDto0b4K1RhQAA/6iRxVzosrbz9wIiriavjUMTm@vger.kernel.org, AJvYcCUrxIKioavR/z1HVz34pDnVgkDz7baN9h4IKXOyWHJfqwHt/9F3Kh0Rx3g8Dvmj348DRfPC+vP2awTNf6ae@vger.kernel.org
X-Gm-Message-State: AOJu0YxiW0KYctFTXVZ4BCC7oe3FX0yJj0xSB/eleiwKQXo85tet1ap0
	TwXOjhIrJJRQmNv0pnUVH7RX3YGwb+PibHYVHiktCS/X+XizuSk/nrvb2B5Ja8x7wkZM8kIKYcA
	XmnISYccLKsn5PjfGnG8CZcCKJLc=
X-Gm-Gg: ASbGnctNX2JvB5+UGMGwODifPMUs0wYSrwZB21tRZi/A4P4gKOU1h6Aj/cZmMdE5GYU
	G+VqKyF4E04GcD9AS5g1Nw+vHu/ggpb+4A4Hnwn6RypcqkLSAmnpwa4CibSXhen2xSg==
X-Google-Smtp-Source: AGHT+IGHvph+6L1KB6rclZis4UipAbVnkXkF2IOEiawL7WJt4H4WHawvZ+TyyTv5vVJ1jBePBxduEFq9sq9zPGjhVYw=
X-Received: by 2002:a05:6e02:13a4:b0:3a7:99a5:a207 with SMTP id
 e9e14a558f8ab-3aa056cb760mr34306585ab.5.1733930534792; Wed, 11 Dec 2024
 07:22:14 -0800 (PST)
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
 <04da6036-56c4-4b8c-b75b-b5e96a089efc@quicinc.com> <CAF6AEGt-e_4kGyfiO=_oCLX8E3z76zeZ2MbRe1GicZj4hTEu+g@mail.gmail.com>
 <808e1041-0d61-4ee8-9778-0f9b7d0fb719@quicinc.com> <CAF6AEGtyc+_2V6qoZCwvRQ_QcC+uCXFXcWRpsQemEfd+rC6R+A@mail.gmail.com>
 <738f9dc8-0fe4-47e9-b3ff-f19f2f5badb8@quicinc.com>
In-Reply-To: <738f9dc8-0fe4-47e9-b3ff-f19f2f5badb8@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 11 Dec 2024 07:22:02 -0800
Message-ID: <CAF6AEGtNg5WuWUK74ChHNHHntOFeWNdDMTLUq+4N3T6xAe3m1Q@mail.gmail.com>
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

On Wed, Dec 11, 2024 at 5:30=E2=80=AFAM Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
>
>
> On 12/6/2024 8:48 PM, Rob Clark wrote:
> > On Fri, Dec 6, 2024 at 4:36=E2=80=AFAM Bibek Kumar Patro
> > <quic_bibekkum@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 12/4/2024 8:54 PM, Rob Clark wrote:
> >>> On Wed, Dec 4, 2024 at 3:28=E2=80=AFAM Bibek Kumar Patro
> >>> <quic_bibekkum@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 11/22/2024 10:04 PM, Rob Clark wrote:
> >>>>> On Fri, Nov 22, 2024 at 8:20=E2=80=AFAM Bibek Kumar Patro
> >>>>> <quic_bibekkum@quicinc.com> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> On 11/21/2024 3:40 AM, Rob Clark wrote:
> >>>>>>> On Wed, Nov 20, 2024 at 9:17=E2=80=AFAM Rob Clark <robdclark@gmai=
l.com> wrote:
> >>>>>>>>
> >>>>>>>> On Thu, Nov 14, 2024 at 8:10=E2=80=AFAM Bibek Kumar Patro
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
> >>>>>>>>>      drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 37 ++++++++++=
++++++++++++
> >>>>>>>>>      drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
> >>>>>>>>>      include/linux/adreno-smmu-priv.h           | 14 ++++++++
> >>>>>>>>>      3 files changed, 53 insertions(+)
> >>>>>>>>>
> >>>>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drive=
rs/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>>>>>> index d26f5aea248e..0e4f3fbda961 100644
> >>>>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>>>>>> @@ -16,6 +16,8 @@
> >>>>>>>>>
> >>>>>>>>>      #define QCOM_DUMMY_VAL -1
> >>>>>>>>>
> >>>>>>>>> +#define GFX_ACTLR_PRR          (1 << 5)
> >>>>>>>>> +
> >>>>>>>>>      static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_devi=
ce *smmu)
> >>>>>>>>>      {
> >>>>>>>>>             return container_of(smmu, struct qcom_smmu, smmu);
> >>>>>>>>> @@ -99,6 +101,32 @@ static void qcom_adreno_smmu_resume_transla=
tion(const void *cookie, bool termina
> >>>>>>>>>             arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RES=
UME, reg);
> >>>>>>>>>      }
> >>>>>>>>>
> >>>>>>>>> +static void qcom_adreno_smmu_set_prr_bit(const void *cookie, b=
ool set)
> >>>>>>>>> +{
> >>>>>>>>> +       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> >>>>>>>>> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> >>>>>>>>> +       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> >>>>>>>>> +       u32 reg =3D 0;
> >>>>>>>>> +
> >>>>>>>>> +       reg =3D  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB=
_ACTLR);
> >>>>>>>>> +       reg &=3D ~GFX_ACTLR_PRR;
> >>>>>>>>> +       if (set)
> >>>>>>>>> +               reg |=3D FIELD_PREP(GFX_ACTLR_PRR, 1);
> >>>>>>>>> +       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, =
reg);
> >>>>>>>>> +}
> >>>>>>>>> +
> >>>>>>>>> +static void qcom_adreno_smmu_set_prr_addr(const void *cookie, =
phys_addr_t page_addr)
> >>>>>>>>> +{
> >>>>>>>>> +       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> >>>>>>>>> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> >>>>>>>>> +
> >>>>>>>>> +       writel_relaxed(lower_32_bits(page_addr),
> >>>>>>>>> +                               smmu->base + ARM_SMMU_GFX_PRR_C=
FG_LADDR);
> >>>>>>>>> +
> >>>>>>>>> +       writel_relaxed(upper_32_bits(page_addr),
> >>>>>>>>> +                               smmu->base + ARM_SMMU_GFX_PRR_C=
FG_UADDR);
> >>>>>>>>> +}
> >>>>>>>>> +
> >>>>>>>>>      #define QCOM_ADRENO_SMMU_GPU_SID 0
> >>>>>>>>>
> >>>>>>>>>      static bool qcom_adreno_smmu_is_gpu_device(struct device *=
dev)
> >>>>>>>>> @@ -210,6 +238,7 @@ static bool qcom_adreno_can_do_ttbr1(struct=
 arm_smmu_device *smmu)
> >>>>>>>>>      static int qcom_adreno_smmu_init_context(struct arm_smmu_d=
omain *smmu_domain,
> >>>>>>>>>                     struct io_pgtable_cfg *pgtbl_cfg, struct de=
vice *dev)
> >>>>>>>>>      {
> >>>>>>>>> +       const struct device_node *np =3D smmu_domain->smmu->dev=
->of_node;
> >>>>>>>>>             struct adreno_smmu_priv *priv;
> >>>>>>>>>
> >>>>>>>>>             smmu_domain->cfg.flush_walk_prefer_tlbiasid =3D tru=
e;
> >>>>>>>>> @@ -239,6 +268,14 @@ static int qcom_adreno_smmu_init_context(s=
truct arm_smmu_domain *smmu_domain,
> >>>>>>>>>             priv->get_fault_info =3D qcom_adreno_smmu_get_fault=
_info;
> >>>>>>>>>             priv->set_stall =3D qcom_adreno_smmu_set_stall;
> >>>>>>>>>             priv->resume_translation =3D qcom_adreno_smmu_resum=
e_translation;
> >>>>>>>>> +       priv->set_prr_bit =3D NULL;
> >>>>>>>>> +       priv->set_prr_addr =3D NULL;
> >>>>>>>>> +
> >>>>>>>>> +       if (of_device_is_compatible(np, "qcom,smmu-500") &&
> >>>>>>>>> +                       of_device_is_compatible(np, "qcom,adren=
o-smmu")) {
> >>>>>>>>
> >>>>>>>> fwiw, it seems like PRR actually works on sc7180, which is _not_
> >>>>>>>> mmu-500, so I guess the support actually goes back further.
> >>>>>>>>
> >>>>>>>> I'm curious if we can just rely on this being supported by any h=
w that
> >>>>>>>> has a6xx or newer?
> >>>>>>>
> >>>>>>>
> >>>>>>> Also, unrelated, but we can't assume the smmu is powered when drm
> >>>>>>> driver calls set_prr_bit/addr, could you add in runpm get/put aro=
und
> >>>>>>> the register access?
> >>>>>>>
> >>>>>>
> >>>>>> I see, thanks for this observation.
> >>>>>> It's surely a possible case, when they access these registers
> >>>>>> SMMU state is off.
> >>>>>> I will add the suggested runpm ops around the register access.
> >>>>>>
> >>>>>>> Otherwise Conner and I have vk sparse residency working now
> >>>>>>>
> >>>>>>
> >>>>>> Sorry, could not get this. Did you mean that vk sparse residency
> >>>>>> is working now using this patch?
> >>>>>
> >>>>> Yes, vk sparse residency is working with this patch (plus addition =
of
> >>>>> runpm get/put, plus drm/msm patches plus turnip patches) ;-)
> >>>>>
> >>>>
> >>>> Thanks for testing the sparse residency feature with our patch Rob,
> >>>> I have an additional query regarding the adreno private interfaces.
> >>>> Specifically, I was referring to other interfaces such as
> >>>> qcom_adreno_smmu_get_fault_info [1]. It appears that we do not have =
a
> >>>> runpm get/put around the register access in this context.
> >>>
> >>> get_fault_info() is called from the iommu fault handler callback, so
> >>> from the fault irq handler, which is why it didn't need the runpm
> >>> get/put.  Maybe it is bad to make this assumption about usage, but
> >>> then again adreno_smmu_priv isn't really a general purpose interface.
> >>>
> >>
> >> Ah okay, got it.
> >> I was just going through all the adreno_smmmu_priv interfaces just
> >> to get a better understanding of it's interaction with smmu and it see=
ms
> >> like apart from PRR and get_fault_info(), set_ttbr0_cfg(),
> >> resume_translation() is also having reg access but not voting.
> >> Should we put runpm_put/get here as well or these can be excluded.
> >> <Just curious about the thought process behind this, is it because of
> >> some sequence when to put a vote, like reg access in middle of smmu
> >> power cycle and not in beginning or end.>
> >
> > I think we just haven't needed it, or noticed that we needed it,
> > outside of setting up prr.
> >
> > As I mentioned, get_fault_info() is called from the fault irq, so we
> > know the smmu is already powered.
> >
>
> okay got it, that makes sense.
>
> > As far as set_ttbr0_cfg(), it probably works just because
> > arm_smmu_write_context_bank() ends up getting called again in the
> > resume path, so if the smmu is suspended when set_ttbr0_cfg() is
> > called, the writes just get ignored.  But the updated cfg is
> > re-applied to the hw when it is resumed.  Probably the same situation
> > with resume_translation().. ie. if the smmu is suspended there are no
> > translations to resume.
> >
> > Maybe it would be more correct in set_ttbr0_cfg() and
> > resume_translation() to do a pm_runtime_get_if_in_use() and skip the
> > hw writes if the smmu is suspended.
> >
> >>
> >>>> Could you please clarify whether we need an SMMU vote around registe=
r
> >>>> access in the case of PRR? IMO, should the users of this callback en=
sure
> >>>> they put a vote before accessing the cb?
> >>>
> >>> How can drm vote for the smmu device?  I guess it could power up
> >>> itself and rely on device-link.. but that is pretty overkill to power
> >>> up the entire gpu in this case.  I think it is best for the vote to
> >>> happen in the PRR callbacks.
> >>>
> >>
> >> Okay I see, GPU can only power itself up through <gpu_state_get I
> >> assume> but won't have exclusive access to power on the smmu only.
> >>
> >> Incase we go forward to put vote in PRR callback for SMMU, I was
> >> planning that we can refactor existing arm_smmu_rpm_put/get() from
> >> arm_smmu.c to it's header file so that the same can be used in
> >> arm_smmu_qcom.c ? What's your thoughts on this?
> >
> > I had briefly thought of doing the same.  But the main reason for
> > those helpers is common arm-smmu code that is used on non-qcom
> > platforms where runpm is not enabled.  In arm-smmu-qcom.c, we know
> > that runpm is enabled, so we could just use  return
> > pm_runtime_resume_and_get()/pm_runtime_put_autosuspend() directly.
> >
>
> Ohkay I see, we then do not need pm_runtime_enabled() check for qcom
> platforms before putting the vote.
> I am currently modifying this patch only to directly add
> pm_runtime_resume_and_get()/pm_runtime_put_autosuspend()
> around the register access of PRR related adreno private interfaces.
> I will send this updated patch as part of v18 shortly.
>
> Additionally, we can evaluate the use of pm_runtime operations for
> set_ttbr0_cfg() and resume_translation() in a separate series ?

Yup, sounds good

BR,
-R

