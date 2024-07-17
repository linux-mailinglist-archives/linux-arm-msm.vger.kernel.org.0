Return-Path: <linux-arm-msm+bounces-26476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CFB933EE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 17:00:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BB2D284618
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 15:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20145181315;
	Wed, 17 Jul 2024 15:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QVmBFgQN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188383A27B;
	Wed, 17 Jul 2024 15:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721228421; cv=none; b=jDhVedT0KNS1/2TRXgn0OAcYT3jhVYwm6ZtT9b8x/duhek78bcfvPe6b065h0QKMiuRF5OwYdc+6ozrr7t4iRAiiQSVzDGgYPDJozj9d0RsW2SZ9oRe0A39oSLeQ4af3UP1PO16mYvjndHTWX2LuQxyxRjrnm2fZMIva5BPG35E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721228421; c=relaxed/simple;
	bh=lqIyfqw4xBO5VIyduTwMAy/4VgEvhIsyknlVkTWk+RY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LAIr9hTf1V2NjlY776JCBQiEZ40jj2FW+SZyISYQ6rLWdzK0W5vJeNQlSCaxzyoCRK7UPxsoH1TCNuBV/GJ5g7yjhCBnxe32LMxni/IJInVbZ+7RyHb7AQXFcYWhYsJKMpowWjDnCbWtxIrLFRDTIcd5igcyfSiFRfkn5HUn0zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QVmBFgQN; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-59589a9be92so9270580a12.2;
        Wed, 17 Jul 2024 08:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721228417; x=1721833217; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mss+nVxYgx1jSStoI9Hi/dvlLPYI5euXEU3xjwvzr1U=;
        b=QVmBFgQN+CAdJFoRtdk2zUwhm26p6Wv4uZeA5HYKh/T+iD45hVQ4pnZAXpi3k+srf1
         zeU+a/4ty4VXFzh9r8gLxHpOm9GcErQ601e0UTb2xlmxXBh3LrgKxyYC168ZjMeLmWXu
         d9LdFTHLQfmw3aZtbXBzax+g1omNTWT6hgrK2tWhgHglLKehb0NLaWIBBu8sqqHb3WEL
         Dp/eWppiVqj/sK7PjLP8eezSbZRwW8xyrfpwSPZc+3KBj4MAww4JqcTJ/n0Yy4+WSCEw
         q1NO39Bz/i5IkCEvhnykLIee/b82lbo/FMglcX5dwMQhEi2JE+ekN+8MCJe7Z3434Bki
         kRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721228417; x=1721833217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mss+nVxYgx1jSStoI9Hi/dvlLPYI5euXEU3xjwvzr1U=;
        b=gjJ9WlvfxttcklgPbH5GVXad3s4gabxKLxw7329NHTXLQy3j2ot2EwGgiYlzjDF3Um
         7X2xo7blrzr2ik/SSP1Luez1HPXZ250A03YOk2UXZU3nRrNXaSSdg/T0W3ygq0zhY3Ov
         dmm64iz1lv2rj2nhZ7FxQyYqbU/tWOd9CHnLA4j0yTEuQSMiqEGvg114eHjvGCDOfnou
         /vp0dv9WcA3dtaZmVHm4dSxIy1um0hBSceW7BCvTW/v0xAck2gfZGFr6GiEeLK/a7nzc
         5aLmL6l6xhbwjq2G2p24iGs7fCh7/xvpeeVCG5OnLWunhP68WFo3mORS8iBSpu2rQcQi
         ml/A==
X-Forwarded-Encrypted: i=1; AJvYcCW7fmsMcT0IV3sua6Cx5x5zFiq/IetT/aDhTqUeDc4fGsZcHgGCvVYVLpn0SClp5wx8LuwNsXbujvs997Z8alO9j78KAo6ceYXC8Uy57i+C8MapnBX8+xWoR7Pcnb+xbseGMoiVoztY4AkOUw==
X-Gm-Message-State: AOJu0YyiGuSFD5sl2MnCt55KTpjr5T5R+jUOsTUxfn0iJqJhdZ+bHkEV
	IV8HIXs/TDdE0u1ZjvDz/mfxJZaTyIUTjgGb4paXX1jIhhZyYkPPAsDmWHSCWT4qS+qhNT6LXSg
	24ZwdKVaPbcQwnsuuOaRwTt5UjOk=
X-Google-Smtp-Source: AGHT+IELsdNMmUuDCOy+jytecmM8zAka2gXkqGC+KbItP3hCFmMGv+m1ZdDxiEnxqQN31iPIOHb1dUc/WLm1aLRQgis=
X-Received: by 2002:a50:a693:0:b0:5a1:c43:82ca with SMTP id
 4fb4d7f45d1cf-5a10c4386fcmr552349a12.26.1721228417074; Wed, 17 Jul 2024
 08:00:17 -0700 (PDT)
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
 <CAF6AEGtbw06-gOSvX9gAbi=SA801gmD3_8c5xkOU-G9g2qKptQ@mail.gmail.com>
 <9509f256-04a4-4907-98fc-148c5087d74d@quicinc.com> <CAF6AEGuLwZ0yFGWMKX-O1VjQB2M57K+CsyJ=7PCKXE=b=VsSNg@mail.gmail.com>
 <3382aaca-4ca1-46e5-a445-dcb115ff206f@quicinc.com> <CAF6AEGu0uH7GuNb3SJVk0cPDUwkYZ6NTG1ze+wmc1OjsaownwA@mail.gmail.com>
 <3c3456bc-0f79-4a17-9614-f3b32b6ed30a@quicinc.com>
In-Reply-To: <3c3456bc-0f79-4a17-9614-f3b32b6ed30a@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 17 Jul 2024 08:00:04 -0700
Message-ID: <CAF6AEGvZWdN+CC9O3tq7kjYPq424U6__KgAnFNCV0bCqE8wPuQ@mail.gmail.com>
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

On Wed, Jul 17, 2024 at 3:27=E2=80=AFAM Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
>
>
> On 7/16/2024 1:37 AM, Rob Clark wrote:
> > On Mon, Jul 15, 2024 at 4:00=E2=80=AFAM Bibek Kumar Patro
> > <quic_bibekkum@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 7/10/2024 10:31 PM, Rob Clark wrote:
> >>> On Tue, Jul 9, 2024 at 12:43=E2=80=AFPM Bibek Kumar Patro
> >>> <quic_bibekkum@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 7/4/2024 9:28 PM, Rob Clark wrote:
> >>>>> On Thu, Jul 4, 2024 at 7:46=E2=80=AFAM Rob Clark <robdclark@gmail.c=
om> wrote:
> >>>>>>
> >>>>>> On Wed, Jul 3, 2024 at 4:38=E2=80=AFAM Bibek Kumar Patro
> >>>>>> <quic_bibekkum@quicinc.com> wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>> On 7/2/2024 2:01 AM, Rob Clark wrote:
> >>>>>>>> On Mon, Jul 1, 2024 at 4:01=E2=80=AFAM Bibek Kumar Patro
> >>>>>>>> <quic_bibekkum@quicinc.com> wrote:
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> On 6/28/2024 9:14 PM, Rob Clark wrote:
> >>>>>>>>>> On Fri, Jun 28, 2024 at 8:10=E2=80=AFAM Bibek Kumar Patro
> >>>>>>>>>> <quic_bibekkum@quicinc.com> wrote:
> >>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> On 6/28/2024 7:47 PM, Rob Clark wrote:
> >>>>>>>>>>>> On Fri, Jun 28, 2024 at 7:05=E2=80=AFAM Bibek Kumar Patro
> >>>>>>>>>>>> <quic_bibekkum@quicinc.com> wrote:
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Add an adreno-smmu-priv interface for drm/msm to call
> >>>>>>>>>>>>> into arm-smmu-qcom and initiate the PRR bit setup or reset
> >>>>>>>>>>>>> sequence as per request.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> This will be used by GPU to setup the PRR bit and related
> >>>>>>>>>>>>> configuration registers through adreno-smmu private
> >>>>>>>>>>>>> interface instead of directly poking the smmu hardware.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Suggested-by: Rob Clark <robdclark@gmail.com>
> >>>>>>>>>>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com=
>
> >>>>>>>>>>>>> ---
> >>>>>>>>>>>>>        drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 23 ++++=
++++++++++++++++++
> >>>>>>>>>>>>>        drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
> >>>>>>>>>>>>>        include/linux/adreno-smmu-priv.h           |  6 ++++=
+-
> >>>>>>>>>>>>>        3 files changed, 30 insertions(+), 1 deletion(-)
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/d=
rivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>>>>>>>>>> index bd101a161d04..64571a1c47b8 100644
> >>>>>>>>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>>>>>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>>>>>>>>>> @@ -28,6 +28,7 @@
> >>>>>>>>>>>>>        #define PREFETCH_SHALLOW       (1 << PREFETCH_SHIFT)
> >>>>>>>>>>>>>        #define PREFETCH_MODERATE      (2 << PREFETCH_SHIFT)
> >>>>>>>>>>>>>        #define PREFETCH_DEEP          (3 << PREFETCH_SHIFT)
> >>>>>>>>>>>>> +#define GFX_ACTLR_PRR          (1 << 5)
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>        static const struct actlr_config sc7280_apps_actlr_c=
fg[] =3D {
> >>>>>>>>>>>>>               { 0x0800, 0x04e0, PREFETCH_DEFAULT | CMTLB },
> >>>>>>>>>>>>> @@ -235,6 +236,27 @@ static void qcom_adreno_smmu_resume_tr=
anslation(const void *cookie, bool termina
> >>>>>>>>>>>>>               arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_=
CB_RESUME, reg);
> >>>>>>>>>>>>>        }
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> +static void qcom_adreno_smmu_set_prr(const void *cookie, p=
hys_addr_t page_addr, bool set)
> >>>>>>>>>>>>> +{
> >>>>>>>>>>>>> +       struct arm_smmu_domain *smmu_domain =3D (void *)coo=
kie;
> >>>>>>>>>>>>> +       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> >>>>>>>>>>>>> +       struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> >>>>>>>>>>>>> +       u32 reg =3D 0;
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>> +       writel_relaxed(lower_32_bits(page_addr),
> >>>>>>>>>>>>> +                               smmu->base + ARM_SMMU_GFX_P=
RR_CFG_LADDR);
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>> +       writel_relaxed(upper_32_bits(page_addr),
> >>>>>>>>>>>>> +                               smmu->base + ARM_SMMU_GFX_P=
RR_CFG_UADDR);
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>> +       reg =3D  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMM=
U_CB_ACTLR);
> >>>>>>>>>>>>> +       reg &=3D ~GFX_ACTLR_PRR;
> >>>>>>>>>>>>> +       if (set)
> >>>>>>>>>>>>> +               reg |=3D FIELD_PREP(GFX_ACTLR_PRR, 1);
> >>>>>>>>>>>>> +       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACT=
LR, reg);
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>
> >>>>>>>>>>>> nit, extra line
> >>>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> Ack, will remove this. Thanks for pointing out.
> >>>>>>>>>>>
> >>>>>>>>>>>> Also, if you passed a `struct page *` instead, then you coul=
d drop the
> >>>>>>>>>>>> bool param, ie. passing NULL for the page would disable PRR.=
  But I
> >>>>>>>>>>>> can go either way if others have a strong preference for phy=
s_addr_t.
> >>>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> Oh okay, this looks simple to reset the prr bit.
> >>>>>>>>>>> But since this page is allocated and is used inside gfx drive=
r
> >>>>>>>>>>> before being utilized for prr bit operation, would it be safe=
 for
> >>>>>>>>>>> drm/gfx driver to keep a reference to this page in smmu drive=
r?
> >>>>>>>>>>>
> >>>>>>>>>>> Since we only need the page address for configuring the
> >>>>>>>>>>> CFG_UADDR/CFG_LADDR registers so passed the phys_addr_t.
> >>>>>>>>>>
> >>>>>>>>>> I don't think the smmu driver needs to keep a reference to the=
 page..
> >>>>>>>>>> we can just say it is the responsibility of the drm driver to =
call
> >>>>>>>>>> set_prr(NULL) before freeing the page
> >>>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> That makes sense. If we go by this NULL page method to disable =
the PRR,
> >>>>>>>>> we would have to set the address registers to reset value as we=
ll.
> >>>>>>>>>
> >>>>>>>>> The sequence would be like the following as per my understaning=
:
> >>>>>>>>> - Check if it's NULL page
> >>>>>>>>> - Set the PRR_CFG_UADDR/PRR_CFG_LADDR to reset values i.e - 0x0=
 for
> >>>>>>>>>        these registers
> >>>>>>>>> - Reset the PRR bit in actlr register
> >>>>>>>>>
> >>>>>>>>> Similar to this snippet:
> >>>>>>>>>
> >>>>>>>>> #PRR_RESET_ADDR 0x0
> >>>>>>>>>
> >>>>>>>>> --------------
> >>>>>>>>> reg =3D  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR);
> >>>>>>>>> reg &=3D ~GFX_ACTLR_PRR;
> >>>>>>>>> arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
> >>>>>>>>>
> >>>>>>>>> if (!prr_page) {
> >>>>>>>>>             writel_relaxed(PRR_RESET_ADDR,
> >>>>>>>>>                             smmu->base + ARM_SMMU_GFX_PRR_CFG_L=
ADDR);
> >>>>>>>>>             writel_relaxed(PRR_RESET_ADDR),
> >>>>>>>>>                              smmu->base + ARM_SMMU_GFX_PRR_CFG_=
UADDR);
> >>>>>>>>>             return;
> >>>>>>>>> }
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> writel_relaxed(lower_32_bits(page_to_phys(prr_page)),
> >>>>>>>>>                     smmu->base + ARM_SMMU_GFX_PRR_CFG_LADDR);
> >>>>>>>>>
> >>>>>>>>> writel_relaxed(upper_32_bits(page_to_phys(prr_page)),
> >>>>>>>>>                     smmu->base + ARM_SMMU_GFX_PRR_CFG_UADDR);
> >>>>>>>>>
> >>>>>>>>> reg |=3D FIELD_PREP(GFX_ACTLR_PRR, 1);
> >>>>>>>>> arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
> >>>>>>>>> -----------------
> >>>>>>>>>
> >>>>>>>>> If looks good, will implement the same in next version.
> >>>>>>>>
> >>>>>>>> yeah, that looks like it could work..
> >>>>>>>>
> >>>>>>>> you probably don't need to zero out the PRR_CFG_*ADDR when disab=
ling,
> >>>>>>>> and probably could avoid double writing ACTLR, but that is getti=
ng
> >>>>>>>> into bikeshedding
> >>>>>>>>
> >>>>>>>
> >>>>>>> Actually Rob, since you rightly pointed this out.
> >>>>>>> I crosschecked again on these registers.
> >>>>>>> PRR_CFG_*ADDR is a global register in SMMU space but
> >>>>>>> ACTLR register including PRR bit is a per-domain register.
> >>>>>>> There might also be a situation where PRR feature need to be
> >>>>>>> disabled or enabled separately for each domain.
> >>>>>>> So I think it would be cleaner to have two apis, set_prr_addr(),
> >>>>>>> set_prr_bit().
> >>>>>>> set_prr_addr() will be used only to set this PRR_CFG_*ADDR
> >>>>>>> register by passing a 'struct page *'
> >>>>>>> set_prr_bit() will be used as a switch for PRR feature,
> >>>>>>> where required smmu_domain will be passed along with
> >>>>>>> the bool value to set/reset the PRR bit depending on which this
> >>>>>>> feature will be enabled/disabled for the selected domain.
> >>>>>>
> >>>>>> on a related note, adreno has been using arm-smmu for a number of
> >>>>>> generations, I guess not all support PRR?  The drm driver will nee=
d to
> >>>>>> know whether PRR is supported (and expose that to userspace to let=
 the
> >>>>>> UMD know whether to expose certain extensions).  How should this w=
ork?
> >>>>>
> >>>>> So, I noticed in the x1e80100.dtsi that there is a gpu_prr_mem
> >>>>> reserved section..  maybe we should be connecting this to the smmu
> >>>>> driver in dt, and using that to detect presence of PRR?  Ie. the sm=
mu
> >>>>> driver would configure PRR_CFG_*ADDR based on the reserved mem, and
> >>>>> the interface to drm would just be to enable/disable PRR, returning=
 an
> >>>>> error code if the reserved mem section isn't there.
> >>>>>
> >>>>> This simplifies the interface, and handles the question of how to
> >>>>> detect if PRR is supported.
> >>>>>
> >>>>> BR,
> >>>>> -R
> >>>>>
> >>>>
> >>>> As I checked gpu_prr_mem reserved mem section is not used for mobile
> >>>> targets hence not present for other DT only compute targets like
> >>>> x1e80100.dtsi has the same. PRR looks to be smmu version specific
> >>>> property.
> >>>
> >>> I only see it in gpu_prr_mem in x1e80100.dtsi, but not documented
> >>> anywhere.  I'm only assuming based on the name that it is intended to
> >>> be for PRR (but not sure why it is larger than 0x1000).  Are the
> >>> PRR_CFG_*ADDR regs programmed by the fw (and access blocked in EL1) o=
n
> >>> this device?
> >>>
> >>
> >> As I checked, if the drm/gfx driver allocates the page for drm, then
> >> this reserved-memory region is not required.
> >>
> >> PRR_CFG_*ADDR regs have read and write access in EL1 only for this
> >> device, behavior is same as other devices as well. These are not
> >> programmed by fw.
> >
> > If there is any device which _doesn't_ have EL1 access to these regs,
> > I think going the reserved memory route seems more future proof > Other=
wise we later on have to deal with two different ways to do
> > things.  But I'm not sure if there is any such device or risk.
> >
>
> PRR is a bit in ACTLR register which is in SMMU space,
> so is the PRR_CFG_*ADDR registers - with EL1 having access
> to both the registers in all targets released till now with MMU-500.
> It's unlikely that this design would change in future
> for MMU-500 based targets, so I feel this risk is somewhat negligible.

I wasn't worried about the ACTLR register, but the PRR_CFG_*ADDR regs ;-)

IIRC those were in the SMMU global space, why hyp tends to like to own.

> Also would the reserved memory route look a bit hackish?
> Because, since this reserved-memory node is not used when page is
> allocated through drm - so it might turn out to be redundant.
> If we are aiming for a device-tree handle/node for reference then I
> think a better way would be to create a bool parameter inside smmu-node
> indicating presence of PRR ?

tbh, I don't think there is anything better or worse about having the
reserved-memory node vs dynamically allocating it.  (If we dynamically
allocate, we should remove the reserved memory node from
x1e80100.dtsi)

The thing I was more concerned about was whether there was any chance
that some existing or future SoC+fw combo _relied_ on a reserved
memory node and the fw programming PRR_CFG_*ADDR.  If there was any
chance of that, and we went the dynamic allocation route, then we'd
have some devices with a reserved memory node, and some without.  That
seems a bit ugly to me.

If there is no chance of this, then we can go either route.

> Personally,I feel since the PRR enablement mechanism is same for all
> MMU-500 targets - compat string would be a robust approach.

I guess if it is all mmu-500, then we can just pick based on compat
string.  If it turns out some subset of smmu-v2 have PRR, we can just
have a list of compat strings in arm-smmu-qcom.c.. there would only be
a finite # of them ;-)

BR,
-R

