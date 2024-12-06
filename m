Return-Path: <linux-arm-msm+bounces-40791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 187E49E7353
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 16:19:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7D9628AAC8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 15:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AAA8153BE8;
	Fri,  6 Dec 2024 15:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4mMQfVm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F415145A05;
	Fri,  6 Dec 2024 15:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733498350; cv=none; b=DuCprdRqUXxVDzbLqIf9hmnZJ9fjmXoucGY/IzzKwdpZdX2yciIp8T30MHdKc4lzRGA/tYTcCOiVU+DtVWomFXX3z1V9Vvk/ArGfETM7Cp3jgEf4qWxMIgOkUZNWsEDozlGtBb/f8EmE6mpeXDKuxtuaddkbueFSFrN3SKoSlec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733498350; c=relaxed/simple;
	bh=iNq+jv5jBtKbndIi5q7TmW7aPg2Ei2t2YqIIatcB2f8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AfiJxc19r+yER61VyRDAYKaMvafghMvtlTd1Xz3qwEmY6mh/qfgfFv2oryAvwf+zteXYkfqA6bliDvyhka4kGZ3gZvndztjc8/DdORKA6JQx6QWpk8APY3DH2tHhyVFXvu1nXsvRzG8n55A6C8S4V0vU98qPe/8sOW389b9+jlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q4mMQfVm; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-841a9366b08so63227539f.1;
        Fri, 06 Dec 2024 07:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733498348; x=1734103148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtkfBG555A8avR1tfdNJHmNz49+zpVcRzzVowDg50dQ=;
        b=Q4mMQfVmVUjxcCGTvVdTJO4/LhTaOgqiI1HS70MXT0f/tDnJoM6FCXuK3qdf0XuTtx
         T9DMGmTMElVAQF5acqFP4FURyrJYQECMePAV6T6Uz/hEKrm4fvsao4V2+NHKivyIBX4x
         2lE0AZwLcOgYMcYuWlOXQqwr5fatHVZK3Lplf3UBtDa9mKLG4mbTbz775U/U8aytEgiI
         cYwf7hnjyoG8dVLre86df2KwfflOayDcCAjoVCNow8VX5qDVsppCE2DgkK9L8wHlb/HF
         dxB1Z25rAEwUzindJ1blTMq/0DN0mLWE/sT/N0y5AHXIyPLHBoUw59kB8HCAy/zAC7Ni
         U4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733498348; x=1734103148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WtkfBG555A8avR1tfdNJHmNz49+zpVcRzzVowDg50dQ=;
        b=sJEk3BjhsEiwGYU3T2Iw0oGwN4H0vgnkGIiM0Curw8I4DVtzDjsRTpvqFvsIRWOo3Q
         NZizO2R9iySHy/Zaeqn0CBKiHcb10/0WR+lX5aiJghU1LdVao+L08w6zh+wvcppvEXZo
         s9s1tI1kbQgb5hPS7HyyOZu+d4jyQ4RP5Dqnw6CecuOKmQ6EjgeV8VpnU7qRMaJWLDuQ
         hCBmdIjfs1soWvOYyvVxw9s/6XJRt57tAsz/WPVlwH9+zlLLBi5Uf2glV5PEWikiZ2vv
         T+gm1Zak/oDFnfxtLLU0Wkqqrp2VCdgH7UU6sZtsU0EVHBuwqa3XWXgr8hbxdc0rUNkp
         fbZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPZfv4Yhf3nASdiJsZnKoSyjDfLrWvj9SqHzA7vsz7vwkwbrxrH2tKieqXkbmU+k1u6GTZdgHS0nxW8kdS@vger.kernel.org, AJvYcCXdiT6aYHcUk9c2QdfeY/0iHBNYgpR9VAOpgmVOzw5CushHksS4N5JEFAHovS5XhZHr7WVOyOb75BY+NxrJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxoEjD+I0LHd3LoDy6ygtiU920ptZ6nQXIaK4GhzYUR8XKu2PxK
	+eCahT3UNasQJxfZfMIlhYWuGmebGIaHR/mVW1KdPRPZFt4ilw1Y5gOT5/aB/YSHvZb9JELuDY8
	jkhKFEoRE8s4Cc6DLEtAZ6SZFYQ8=
X-Gm-Gg: ASbGncsOFrctzsfAKwbR8ye10sBiz1IF26AGtcULQG0Yln+YNvkL/rLPK1B/jMqm9fA
	FNkHqMxsudpwiY5302+G4lJAjku7hVdU4ByMl3LjA7qhQ1f4vx1F03WPlYzFAAg==
X-Google-Smtp-Source: AGHT+IE6wDTpl4P3rhaUL73igzu8F5reTb8UP7PyzKCfU47jXhpJZ3hUhL5iPh8mtwewugxaFzRiTkQiyUpsK9pZ+OA=
X-Received: by 2002:a05:6602:6b8c:b0:835:4931:b110 with SMTP id
 ca18e2360f4ac-8447e21faa8mr518775739f.5.1733498347943; Fri, 06 Dec 2024
 07:19:07 -0800 (PST)
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
 <808e1041-0d61-4ee8-9778-0f9b7d0fb719@quicinc.com>
In-Reply-To: <808e1041-0d61-4ee8-9778-0f9b7d0fb719@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 6 Dec 2024 07:18:56 -0800
Message-ID: <CAF6AEGtyc+_2V6qoZCwvRQ_QcC+uCXFXcWRpsQemEfd+rC6R+A@mail.gmail.com>
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

On Fri, Dec 6, 2024 at 4:36=E2=80=AFAM Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
>
>
> On 12/4/2024 8:54 PM, Rob Clark wrote:
> > On Wed, Dec 4, 2024 at 3:28=E2=80=AFAM Bibek Kumar Patro
> > <quic_bibekkum@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 11/22/2024 10:04 PM, Rob Clark wrote:
> >>> On Fri, Nov 22, 2024 at 8:20=E2=80=AFAM Bibek Kumar Patro
> >>> <quic_bibekkum@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 11/21/2024 3:40 AM, Rob Clark wrote:
> >>>>> On Wed, Nov 20, 2024 at 9:17=E2=80=AFAM Rob Clark <robdclark@gmail.=
com> wrote:
> >>>>>>
> >>>>>> On Thu, Nov 14, 2024 at 8:10=E2=80=AFAM Bibek Kumar Patro
> >>>>>> <quic_bibekkum@quicinc.com> wrote:
> >>>>>>>
> >>>>>>> Add an adreno-smmu-priv interface for drm/msm to call
> >>>>>>> into arm-smmu-qcom and initiate the PRR bit setup or reset
> >>>>>>> sequence as per request.
> >>>>>>>
> >>>>>>> This will be used by GPU to setup the PRR bit and related
> >>>>>>> configuration registers through adreno-smmu private
> >>>>>>> interface instead of directly poking the smmu hardware.
> >>>>>>>
> >>>>>>> Suggested-by: Rob Clark <robdclark@gmail.com>
> >>>>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> >>>>>>> ---
> >>>>>>>     drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 37 +++++++++++++=
+++++++++
> >>>>>>>     drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
> >>>>>>>     include/linux/adreno-smmu-priv.h           | 14 ++++++++
> >>>>>>>     3 files changed, 53 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers=
/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>>>> index d26f5aea248e..0e4f3fbda961 100644
> >>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>>>> @@ -16,6 +16,8 @@
> >>>>>>>
> >>>>>>>     #define QCOM_DUMMY_VAL -1
> >>>>>>>
> >>>>>>> +#define GFX_ACTLR_PRR          (1 << 5)
> >>>>>>> +
> >>>>>>>     static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device =
*smmu)
> >>>>>>>     {
> >>>>>>>            return container_of(smmu, struct qcom_smmu, smmu);
> >>>>>>> @@ -99,6 +101,32 @@ static void qcom_adreno_smmu_resume_translati=
on(const void *cookie, bool termina
> >>>>>>>            arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME=
, reg);
> >>>>>>>     }
> >>>>>>>
> >>>>>>> +static void qcom_adreno_smmu_set_prr_bit(const void *cookie, boo=
l set)
> >>>>>>> +{
> >>>>>>> +       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> >>>>>>> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> >>>>>>> +       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> >>>>>>> +       u32 reg =3D 0;
> >>>>>>> +
> >>>>>>> +       reg =3D  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_A=
CTLR);
> >>>>>>> +       reg &=3D ~GFX_ACTLR_PRR;
> >>>>>>> +       if (set)
> >>>>>>> +               reg |=3D FIELD_PREP(GFX_ACTLR_PRR, 1);
> >>>>>>> +       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, re=
g);
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +static void qcom_adreno_smmu_set_prr_addr(const void *cookie, ph=
ys_addr_t page_addr)
> >>>>>>> +{
> >>>>>>> +       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> >>>>>>> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> >>>>>>> +
> >>>>>>> +       writel_relaxed(lower_32_bits(page_addr),
> >>>>>>> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG=
_LADDR);
> >>>>>>> +
> >>>>>>> +       writel_relaxed(upper_32_bits(page_addr),
> >>>>>>> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG=
_UADDR);
> >>>>>>> +}
> >>>>>>> +
> >>>>>>>     #define QCOM_ADRENO_SMMU_GPU_SID 0
> >>>>>>>
> >>>>>>>     static bool qcom_adreno_smmu_is_gpu_device(struct device *dev=
)
> >>>>>>> @@ -210,6 +238,7 @@ static bool qcom_adreno_can_do_ttbr1(struct a=
rm_smmu_device *smmu)
> >>>>>>>     static int qcom_adreno_smmu_init_context(struct arm_smmu_doma=
in *smmu_domain,
> >>>>>>>                    struct io_pgtable_cfg *pgtbl_cfg, struct devic=
e *dev)
> >>>>>>>     {
> >>>>>>> +       const struct device_node *np =3D smmu_domain->smmu->dev->=
of_node;
> >>>>>>>            struct adreno_smmu_priv *priv;
> >>>>>>>
> >>>>>>>            smmu_domain->cfg.flush_walk_prefer_tlbiasid =3D true;
> >>>>>>> @@ -239,6 +268,14 @@ static int qcom_adreno_smmu_init_context(str=
uct arm_smmu_domain *smmu_domain,
> >>>>>>>            priv->get_fault_info =3D qcom_adreno_smmu_get_fault_in=
fo;
> >>>>>>>            priv->set_stall =3D qcom_adreno_smmu_set_stall;
> >>>>>>>            priv->resume_translation =3D qcom_adreno_smmu_resume_t=
ranslation;
> >>>>>>> +       priv->set_prr_bit =3D NULL;
> >>>>>>> +       priv->set_prr_addr =3D NULL;
> >>>>>>> +
> >>>>>>> +       if (of_device_is_compatible(np, "qcom,smmu-500") &&
> >>>>>>> +                       of_device_is_compatible(np, "qcom,adreno-=
smmu")) {
> >>>>>>
> >>>>>> fwiw, it seems like PRR actually works on sc7180, which is _not_
> >>>>>> mmu-500, so I guess the support actually goes back further.
> >>>>>>
> >>>>>> I'm curious if we can just rely on this being supported by any hw =
that
> >>>>>> has a6xx or newer?
> >>>>>
> >>>>>
> >>>>> Also, unrelated, but we can't assume the smmu is powered when drm
> >>>>> driver calls set_prr_bit/addr, could you add in runpm get/put aroun=
d
> >>>>> the register access?
> >>>>>
> >>>>
> >>>> I see, thanks for this observation.
> >>>> It's surely a possible case, when they access these registers
> >>>> SMMU state is off.
> >>>> I will add the suggested runpm ops around the register access.
> >>>>
> >>>>> Otherwise Conner and I have vk sparse residency working now
> >>>>>
> >>>>
> >>>> Sorry, could not get this. Did you mean that vk sparse residency
> >>>> is working now using this patch?
> >>>
> >>> Yes, vk sparse residency is working with this patch (plus addition of
> >>> runpm get/put, plus drm/msm patches plus turnip patches) ;-)
> >>>
> >>
> >> Thanks for testing the sparse residency feature with our patch Rob,
> >> I have an additional query regarding the adreno private interfaces.
> >> Specifically, I was referring to other interfaces such as
> >> qcom_adreno_smmu_get_fault_info [1]. It appears that we do not have a
> >> runpm get/put around the register access in this context.
> >
> > get_fault_info() is called from the iommu fault handler callback, so
> > from the fault irq handler, which is why it didn't need the runpm
> > get/put.  Maybe it is bad to make this assumption about usage, but
> > then again adreno_smmu_priv isn't really a general purpose interface.
> >
>
> Ah okay, got it.
> I was just going through all the adreno_smmmu_priv interfaces just
> to get a better understanding of it's interaction with smmu and it seems
> like apart from PRR and get_fault_info(), set_ttbr0_cfg(),
> resume_translation() is also having reg access but not voting.
> Should we put runpm_put/get here as well or these can be excluded.
> <Just curious about the thought process behind this, is it because of
> some sequence when to put a vote, like reg access in middle of smmu
> power cycle and not in beginning or end.>

I think we just haven't needed it, or noticed that we needed it,
outside of setting up prr.

As I mentioned, get_fault_info() is called from the fault irq, so we
know the smmu is already powered.

As far as set_ttbr0_cfg(), it probably works just because
arm_smmu_write_context_bank() ends up getting called again in the
resume path, so if the smmu is suspended when set_ttbr0_cfg() is
called, the writes just get ignored.  But the updated cfg is
re-applied to the hw when it is resumed.  Probably the same situation
with resume_translation().. ie. if the smmu is suspended there are no
translations to resume.

Maybe it would be more correct in set_ttbr0_cfg() and
resume_translation() to do a pm_runtime_get_if_in_use() and skip the
hw writes if the smmu is suspended.

>
> >> Could you please clarify whether we need an SMMU vote around register
> >> access in the case of PRR? IMO, should the users of this callback ensu=
re
> >> they put a vote before accessing the cb?
> >
> > How can drm vote for the smmu device?  I guess it could power up
> > itself and rely on device-link.. but that is pretty overkill to power
> > up the entire gpu in this case.  I think it is best for the vote to
> > happen in the PRR callbacks.
> >
>
> Okay I see, GPU can only power itself up through <gpu_state_get I
> assume> but won't have exclusive access to power on the smmu only.
>
> Incase we go forward to put vote in PRR callback for SMMU, I was
> planning that we can refactor existing arm_smmu_rpm_put/get() from
> arm_smmu.c to it's header file so that the same can be used in
> arm_smmu_qcom.c ? What's your thoughts on this?

I had briefly thought of doing the same.  But the main reason for
those helpers is common arm-smmu code that is used on non-qcom
platforms where runpm is not enabled.  In arm-smmu-qcom.c, we know
that runpm is enabled, so we could just use  return
pm_runtime_resume_and_get()/pm_runtime_put_autosuspend() directly.

BR,
-R

> Thanks & regards,
> Bibek
>
> > BR,
> > -R
> >
> >> [1]:
> >> https://lore.kernel.org/all/20210610214431.539029-1-robdclark@gmail.co=
m/
> >>
> >> Thanks & regards,
> >> Bibek
> >>
> >>> BR,
> >>> -R
> >>>
> >>>> Thanks & regards,
> >>>> Bibek
> >>>>
> >>>>> BR,
> >>>>> -R
> >>>>>
> >>>>>>
> >>>>>>> +               priv->set_prr_bit =3D qcom_adreno_smmu_set_prr_bi=
t;
> >>>>>>> +               priv->set_prr_addr =3D qcom_adreno_smmu_set_prr_a=
ddr;
> >>>>>>> +       }
> >>>>>>>
> >>>>>>>            return 0;
> >>>>>>>     }
> >>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iomm=
u/arm/arm-smmu/arm-smmu.h
> >>>>>>> index e2aeb511ae90..2dbf3243b5ad 100644
> >>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> >>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> >>>>>>> @@ -154,6 +154,8 @@ enum arm_smmu_cbar_type {
> >>>>>>>     #define ARM_SMMU_SCTLR_M               BIT(0)
> >>>>>>>
> >>>>>>>     #define ARM_SMMU_CB_ACTLR              0x4
> >>>>>>> +#define ARM_SMMU_GFX_PRR_CFG_LADDR     0x6008
> >>>>>>> +#define ARM_SMMU_GFX_PRR_CFG_UADDR     0x600C
> >>>>>>>
> >>>>>>>     #define ARM_SMMU_CB_RESUME             0x8
> >>>>>>>     #define ARM_SMMU_RESUME_TERMINATE      BIT(0)
> >>>>>>> diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adr=
eno-smmu-priv.h
> >>>>>>> index c637e0997f6d..614665153b3e 100644
> >>>>>>> --- a/include/linux/adreno-smmu-priv.h
> >>>>>>> +++ b/include/linux/adreno-smmu-priv.h
> >>>>>>> @@ -50,6 +50,18 @@ struct adreno_smmu_fault_info {
> >>>>>>>      *                 the GPU driver must call resume_translatio=
n()
> >>>>>>>      * @resume_translation: Resume translation after a fault
> >>>>>>>      *
> >>>>>>> + * *CAUTION* : PRR callbacks (set_prr_bit/set_prr_addr) are NULL=
 terminated for
> >>>>>>> + *             targets without PRR support. Exercise caution and=
 verify target
> >>>>>>> + *             capabilities before invoking these callbacks to p=
revent potential
> >>>>>>> + *             runtime errors or unexpected behavior.
> >>>>>>> + *
> >>>>>>> + * @set_prr_bit:   Extendible interface to be used by GPU to mod=
ify the
> >>>>>>> + *                ACTLR register bits, currently used to configu=
re
> >>>>>>> + *                Partially-Resident-Region (PRR) bit for featur=
e's
> >>>>>>> + *                setup and reset sequence as requested.
> >>>>>>> + * @set_prr_addr:  Configure the PRR_CFG_*ADDR register with the
> >>>>>>> + *                physical address of PRR page passed from
> >>>>>>> + *                GPU driver.
> >>>>>>>      *
> >>>>>>>      * The GPU driver (drm/msm) and adreno-smmu work together for=
 controlling
> >>>>>>>      * the GPU's SMMU instance.  This is by necessity, as the GPU=
 is directly
> >>>>>>> @@ -67,6 +79,8 @@ struct adreno_smmu_priv {
> >>>>>>>         void (*get_fault_info)(const void *cookie, struct adreno_=
smmu_fault_info *info);
> >>>>>>>         void (*set_stall)(const void *cookie, bool enabled);
> >>>>>>>         void (*resume_translation)(const void *cookie, bool termi=
nate);
> >>>>>>> +    void (*set_prr_bit)(const void *cookie, bool set);
> >>>>>>> +    void (*set_prr_addr)(const void *cookie, phys_addr_t page_ad=
dr);
> >>>>>>>     };
> >>>>>>>
> >>>>>>>     #endif /* __ADRENO_SMMU_PRIV_H */
> >>>>>>> --
> >>>>>>> 2.34.1
> >>>>>>>
> >>>>
> >>
>

