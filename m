Return-Path: <linux-arm-msm+bounces-51067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C77A5D04A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 21:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68D75168078
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 20:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC0B2222DE;
	Tue, 11 Mar 2025 20:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7iN3F9F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D161EDA20
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 20:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741723273; cv=none; b=EmlwUUek9GGzZdVC0quUhSCpd1KqDTxk3EPtjabDORVE80sGU3C4HRarPtIiPqkmGyAyO4P1Ekeo1s+DMlvLXHaGlnohVsozRQ2vfT/+rrLU2oI9FDNyXDvxSVmfjBFQr55rssfLE5KosQvHxIZKmmA4cCvsH/9jvPNKHHvBNL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741723273; c=relaxed/simple;
	bh=xrKFuJ0SOVfh3Sa0BTqqoPTKaQUC9fHEUGC2Dq15QUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f4j9ux6MfTOfTnaNV3oijjkAhSJfpp+kkcFnp+RWLffMpdZWTeeMlQU3EO6TNZfvGkP0H0kgjjAMBhrd6tjc4s3UgYsYhNmabJCf2kTEK0wmHsTz2IQAzWex1NVyQX2aG9lg4ojISBny0RXeVkZzXrdEyM4+x/z6i5nHfzGDkVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7iN3F9F; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ff5544af03so1611572a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 13:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741723271; x=1742328071; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52OV000Ss02HywoZBmMaH6saPDX3ZD7R+9jkTkZmirw=;
        b=f7iN3F9FXZdc/2xgxdLvLUXKlEuJkkZgtXdS4IcKqNV5qKJZc8ZuHsMTH9evEwiMOT
         7gUYGvIX7JtkJqehIx/qQBGLQKDZRpqd6aFo587jfIuepH03d85kHUwKfg/k3A2tiiXc
         ux7wfk/+53CExatbUa1F0XImQhhsTaKAJimfFCx/qkkwLUfFVBysx3iSyFaupVdSeBhD
         EI8VSg9eL7cj9HzoRlL4kxAi40WT8FpZXpqXklSJxuz9n2BJF74iZyckJWVFDD+NoRmW
         1XbCTbrwd2TyLj02BxLck1MG9S6tpme42VYouPTnvIRHpcHYfP4m/iB+qh0yjBOmEKoD
         46JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741723271; x=1742328071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=52OV000Ss02HywoZBmMaH6saPDX3ZD7R+9jkTkZmirw=;
        b=r8HjIQnZJBoa8ElBTFme5c0AQId6vTmYcfurXJVoP3gmcTDA81w7ffOAbH7EJEhsy4
         IgEeCaBavsmkRdP+CqMHaS/zWh1ZzEvvARhEvkcCg1Bz+mIMOHMxmgIHZKpUgiAe5uAU
         I+g2exzGD/8nGbpH4dJELtBpXglZhDEQhECyeAGk5tKCxXmwseTWBmH1UiZZuCgEIX0T
         RfsRYfb4B+8D8JnuWxcnnYmjszVXQjpizNQl4P20/AMtH0i8HyAHZez4Zrdel/n4u2yF
         qYenZR0h8IopistxKj0LOcqlxJQvO7wUlEZF4nPzwMjkaqwRH33nxhKWecPzsAPm1PnK
         WJ0A==
X-Forwarded-Encrypted: i=1; AJvYcCW0S3mZ9w6pqbcKBVNpyyqFo59ahkLaXRT4fAvz0PwFYv1U+HQtxx+gnihu4AI33pNf38Jyu0xs789r9xkM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2CkuloX3wxSPdFvWslXiaf3ABrvdkYhqLrDNqbBQPp3nqtqec
	0yqQQcjALBm17NC+6B7/rzb+PuhjLJ4OTcROmp/NctSdSM7MyPCogw/NwpRGd6S77irU9Lea6o7
	S2uU5JWwXF2tGrptSvi4SEWLQ4W4UhNVE
X-Gm-Gg: ASbGnct31pIT8AM2Ba2E607NzHSXp9fEAMl6bzeWJlBn6DZ5ztrJlt5TH8nGADf5d/C
	6UERvxUR8DKOIHUMPNfpSKa1uD7p2JyvRbkPJCNSeGPBVHjEZox7P7P4StqU+vVmYFj4jsQlVRj
	2qUcwfFQODZTbmnblMM4EdhOU6Zg==
X-Google-Smtp-Source: AGHT+IEZes+rPRA7sKIj+77k/pMBCMpcY3PJgbIkDYPW+Vp6cHzjHEMWL9jx7sEj0huuFiLemUSLs1dnWAE9qx1ILMs=
X-Received: by 2002:a05:6a00:3d01:b0:730:915c:b70 with SMTP id
 d2e1a72fcca58-736eb884cd6mr2575318b3a.0.1741723270852; Tue, 11 Mar 2025
 13:01:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-4-be14be37f4c3@gmail.com> <20250311181151.GD5216@willie-the-truck>
In-Reply-To: <20250311181151.GD5216@willie-the-truck>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 11 Mar 2025 16:01:00 -0400
X-Gm-Features: AQ5f1JoexqrwePJhk6DD8zjGJRAEALzPtqaGXwA5Wf6vdtHsWziKMQ-PaQeJdxI
Message-ID: <CACu1E7Gg3WpQASADAdediRzFz2wEXAnfD7tg05XkiXZQp=X8fQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
To: Will Deacon <will@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 2:11=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Mar 04, 2025 at 11:56:50AM -0500, Connor Abbott wrote:
> > Up until now we have only called the set_stall callback during
> > initialization when the device is off. But we will soon start calling i=
t
> > to temporarily disable stall-on-fault when the device is on, so handle
> > that by checking if the device is on and writing SCTLR.
> >
> > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 30 ++++++++++++++++++++++=
+++++---
> >  1 file changed, 27 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu=
/arm/arm-smmu/arm-smmu-qcom.c
> > index a428e53add08d451fb2152e3ab80e0fba936e214..d34a0d917013bb3d5a24b3c=
e72f48e3b38474da2 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > @@ -77,12 +77,36 @@ static void qcom_adreno_smmu_set_stall(const void *=
cookie, bool enabled)
> >  {
> >       struct arm_smmu_domain *smmu_domain =3D (void *)cookie;
> >       struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> > -     struct qcom_smmu *qsmmu =3D to_qcom_smmu(smmu_domain->smmu);
> > +     struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> > +     struct qcom_smmu *qsmmu =3D to_qcom_smmu(smmu);
> > +     u32 mask =3D BIT(cfg->cbndx);
> > +     bool stall_changed =3D !!(qsmmu->stall_enabled & mask) !=3D enabl=
ed;
> > +     unsigned long flags;
> >
> >       if (enabled)
> > -             qsmmu->stall_enabled |=3D BIT(cfg->cbndx);
> > +             qsmmu->stall_enabled |=3D mask;
> >       else
> > -             qsmmu->stall_enabled &=3D ~BIT(cfg->cbndx);
> > +             qsmmu->stall_enabled &=3D ~mask;
> > +
> > +     /*
> > +      * If the device is on and we changed the setting, update the reg=
ister.
> > +      */
> > +     if (stall_changed && pm_runtime_get_if_active(smmu->dev) > 0) {
> > +             spin_lock_irqsave(&smmu_domain->cb_lock, flags);
> > +
> > +             u32 reg =3D arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_C=
B_SCTLR);
> > +
> > +             if (enabled)
> > +                     reg |=3D ARM_SMMU_SCTLR_CFCFG;
> > +             else
> > +                     reg &=3D ~ARM_SMMU_SCTLR_CFCFG;
> > +
> > +             arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, re=
g);
>
> Are you sure you don't need TLB invalidation for this to take effect? I
> think some fields in the SCTLR can be cached in the TLB but you'll need
> to check whether or not that applies to CFCFG.
>
> Will

I think it should be fine because CFCFG only controls behavior when
there's a context fault and there can't be TLB entries for entries
that cause a context fault: "The architecture permits the caching of
any translation table entry that has been returned from memory without
a fault and that does not, as a result of that entry, cause a
Translation Fault or an Access Flag fault."

Connor

