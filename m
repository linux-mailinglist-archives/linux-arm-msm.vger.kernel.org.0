Return-Path: <linux-arm-msm+bounces-51198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98960A5E53F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 21:21:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6746E189C4EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 20:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C28A1EB1AF;
	Wed, 12 Mar 2025 20:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ew2Zfx2A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338471EB5E1
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 20:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741810860; cv=none; b=lmfvaK7wwvur73khNWw25YgxAlQpAIhsBnSFia9ubRLkBhsA4h+OzNTssir/BusTkhLYY1ZBSIp7NQTY3n77ieVy9wdnXzTHlnVsvf6FC/8W6bC97zJj3d+EcmrYIr9yU3vcmk4pPbcUULLoknSrqrqvU/M4/LZPxYF/kg5ftnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741810860; c=relaxed/simple;
	bh=5y+PS9g0veYlrmU3sAeXgsPE1r2J3D9roA4qZSKQFZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q2OkC7+khCZmKRvaF78Qv64URt5AoVqzYl1ZY7/8LolwHLuYrRsZy/YPldMJL3/ii0PnME2f9IrNExO+xCes60vK+aabwfJFGX4C6bPC7paYY7FGF1RZ/EMDB3FWrp67agjjY5jsRwPbY5WlxjBnXHq/ddoVQst3aNm7TAxNDzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ew2Zfx2A; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3ce886a2d5bso1924625ab.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 13:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741810858; x=1742415658; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=leDzS7eIFvtHXIQQ9eglVb87YCz9EMBQq+7ox6gc9Qk=;
        b=ew2Zfx2A9+yasSBU6EGNdo/HKOEnsT9z4up5g1PjGzLXzaEzY8ufhDHcPGwHnbCYGM
         7M/epQOdpgQS66yaJPmmzPSAtDezFMLHOBbg7d/3YxDnOKrlLpMmmny+9sDHDkr0YXGU
         vm4f7u/WI/c22L5GrW46bJ6bV+uVK9RGbW5estFa7UUbcPBL7GcdXWIZcO1fjGQJMpGl
         7Eoeo3X6B8GDfbhkFd7F6HfJ2ruwNxFz745OAvqOnnnnNOVxjOi3ToI7MYfKCUD9XOJf
         e0CEYo+U4MGSRDgPsMeGJl9aIQJnzQN0rWkPRLmmEZAE46am+usdQKonhsvqurIGVnm4
         qhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741810858; x=1742415658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=leDzS7eIFvtHXIQQ9eglVb87YCz9EMBQq+7ox6gc9Qk=;
        b=WtenVWfwKfMpy3wy4/HgoZwD6Nlowz+VMfk+9Dw4+E/gtskNg8usVcsNLZVWwvLwLX
         t/UzyiaHRO7n8f/ZXbnlFkaBl+sdu1rhOUcdLbhQwhTnEz/HEiBZkyqZt4uiSxnXMG/o
         M2HtW4U9jRdOaArwfVE5USlyZ2ObMbXqTIql2FGrvL3IvuuYc9NPq6xVTAZuhjBWzmAl
         OQcw2jFxi6vQDVn2Z8g+GO/sQa82e+xLiIwlHfzpkR+FYTb8+heCjs/HpS3WpeHlFvRi
         smQgy4r2yaw0SK/GhxX7oOrx9yB9usYDrwPnqYyJHPg9kiO/VfxhQMmpwzF6rwAT7b1S
         203A==
X-Forwarded-Encrypted: i=1; AJvYcCVjwRnDB3vMv6MgaqUuDCO3iNsa0mOVK9QVvwMu3yy03VjbobaRvDRTxK7RyW9tay4GPNSIE8XFzL2Pm+6Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yz90ty5npzpeuwk7jcWzq2THAEtyKExTggOeACanUu6+3l3kkZp
	Tc/FWZ7kOfuiBAOL8E0YcJ9Q1E+tSX8CMpBSSBCekoU1q35+pzFshkWEF957Wbar/heYYLsPXuG
	dq/tlvD/TeeGooLPUb9fZfPLklGA=
X-Gm-Gg: ASbGncu6OX7OsCkVlYXcEONichKVKulnuG8kjDsYY56ulB4m7ChGagY3UzmrGIHmCXt
	dy2gBgvm1DWoN71ki7ar8+HwY0va7tTbdh2JGX/4g3OleTwSOTaDG8ArywkNhZyI/jlevrqviPr
	+n0k9T0zzzh3uvPOmJHdGN1Agr38BQN3B/ddv3gLruB/BlGuIvjZpomuI=
X-Google-Smtp-Source: AGHT+IED4T6DLDIo3SmEhvYjhrVEJRweu80/CkvzBfXjIoBQfKIpAoBxfGcLmBmU9mYcxJ7671LtEDQ7s45JySuNKLY=
X-Received: by 2002:a05:6e02:5a1:b0:3d4:700f:67e7 with SMTP id
 e9e14a558f8ab-3d4700f6b02mr43315405ab.17.1741810857983; Wed, 12 Mar 2025
 13:20:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
 <20250311180553.GB5216@willie-the-truck> <CACu1E7GzCiO2b7AFJSDC+pN2VD9VaD2aYz_GGymM3-xAUqd__A@mail.gmail.com>
 <20250312130525.GC6181@willie-the-truck> <CAF6AEGvqYithLFAKpfdkw35DEsUZ8rBt25-oWz3r=kaLt+RbQw@mail.gmail.com>
 <20250312164735.GA6561@willie-the-truck> <CAF6AEGskyoemQDrTXh=ewf61e-hVzWMjmqe=nX2J-65W5-M6Zw@mail.gmail.com>
 <2d47815d-6bee-4d1f-8b60-854763794bf6@arm.com>
In-Reply-To: <2d47815d-6bee-4d1f-8b60-854763794bf6@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 12 Mar 2025 13:20:45 -0700
X-Gm-Features: AQ5f1Jr0TpL3RJwurfnQxJV3DndqXaN2cYc9nQyOJQLHZCc7asLNsX0jHJOoZ20
Message-ID: <CAF6AEGvhixYvXghvD+itnSDjr7bO4i3Ls0Y-kXC-ohFN=CS0PQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] iommu/arm-smmu: Save additional information on
 context fault
To: Robin Murphy <robin.murphy@arm.com>
Cc: Will Deacon <will@kernel.org>, Connor Abbott <cwabbott0@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 11:01=E2=80=AFAM Robin Murphy <robin.murphy@arm.com=
> wrote:
>
> On 12/03/2025 5:23 pm, Rob Clark wrote:
> > On Wed, Mar 12, 2025 at 9:47=E2=80=AFAM Will Deacon <will@kernel.org> w=
rote:
> >>
> >> On Wed, Mar 12, 2025 at 07:59:52AM -0700, Rob Clark wrote:
> >>> On Wed, Mar 12, 2025 at 6:05=E2=80=AFAM Will Deacon <will@kernel.org>=
 wrote:
> >>>> On Tue, Mar 11, 2025 at 06:36:38PM -0400, Connor Abbott wrote:
> >>>>> On Tue, Mar 11, 2025 at 2:06=E2=80=AFPM Will Deacon <will@kernel.or=
g> wrote:
> >>>>>> On Tue, Mar 04, 2025 at 11:56:47AM -0500, Connor Abbott wrote:
> >>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iomm=
u/arm/arm-smmu/arm-smmu.c
> >>>>>>> index ade4684c14c9b2724a71e2457288dbfaf7562c83..a9213e0f1579d1e3b=
e0bfba75eea1d5de23117de 100644
> >>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> >>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> >>>>>>> @@ -409,9 +409,12 @@ void arm_smmu_read_context_fault_info(struct=
 arm_smmu_device *smmu, int idx,
> >>>>>>>                                      struct arm_smmu_context_faul=
t_info *cfi)
> >>>>>>>   {
> >>>>>>>        cfi->iova =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR=
);
> >>>>>>> +     cfi->ttbr0 =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTB=
R0);
> >>>>>>>        cfi->fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> >>>>>>> -     cfi->fsynr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYN=
R0);
> >>>>>>> +     cfi->fsynr0 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSY=
NR0);
> >>>>>>> +     cfi->fsynr1 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSY=
NR1);
> >>>>>>
> >>>>>> We already have an implementation hook (->get_fault_info()) which =
the
> >>>>>> qcom SMMU driver can override with qcom_adreno_smmu_get_fault_info=
().
> >>>>>> That thing dumps these registers already so if we're moving that i=
nto
> >>>>>> the core SMMU driver, let's get rid of the hook and move everybody=
 over
> >>>>>> rather than having it done in both places.
> >>>>>
> >>>>> As you probably saw, the next commit moves over
> >>>>> qcom_adreno_smmu_get_fault_info() to use this. The current back doo=
r
> >>>>> used by drm/msm to access these functions is specific to adreno_smm=
u
> >>>>> and there isn't an equivalent interface to allow it to call a gener=
ic
> >>>>> SMMU function so it isn't possible to move it entirely to the core.=
 At
> >>>>> least not without a bigger refactoring that isn't justified for thi=
s
> >>>>> series that is just trying to fix things.
> >>>>
> >>>> Ok :(
> >>>>
> >>>>>>>        cfi->cbfrsynra =3D arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CB=
FRSYNRA(idx));
> >>>>>>> +     cfi->contextidr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB=
_CONTEXTIDR);
> >>>>>>
> >>>>>> I think the CONTEXTIDR register is stage-1 only, so we shouldn't d=
ump
> >>>>>> it for stage-2 domains.
> >>>>>>
> >>>>> Does it matter if we read the register though, as long as users are
> >>>>> aware of this and don't use its value for anything?
> >>>>
> >>>> I think the contents are "UNKNOWN", so it could be hugely confusing =
even
> >>>> if they just got logged someplace. Why is it difficult to avoid touc=
hing
> >>>> it for stage-2?
> >>>>
> >>> Fwiw, we are only ever using stage-1
> >>
> >> Sure, but this is in arm-smmu.c which is used by other people and supp=
orts
> >> both stages.
> >
> > Sure, but no one else is using this field in the fault-info.  So maybe
> > the addition of a comment in the struct would be enough if it isn't
> > going to cause an SError/etc to read it for S2 cb?
>
> Any worthwhile comment isn't going to be significantly shorter or
> clearer than 1 extra line of "if (smmu_domain->stage =3D=3D
> ARM_SMMU_DOMAIN_S1)"...

Just that smmu_domain isn't passed to
arm_smmu_read_context_fault_info(), so it would add some extra churn
on top of that one extra line

> TBH it's the Qualcomm register-middle-man firmware I'd be more worried
> about than real hardware, given how touchy it can be even with register
> accesses which *should* be well defined. But then I guess it also has
> the habit of killing the system if anything other than the GPU dares
> cause a fault in the first place, so maybe it OK?

If we have qc hyp, then we don't get S2 in the first place ;-)

BR,
-R

> If anyone still uses Arm Fast Models SMMUv1/2 components it'll probably
> squawk an annoying warning there too - ISTR I had at least one patch
> motivated by that in the past.
>
> Thanks,
> Robin.

