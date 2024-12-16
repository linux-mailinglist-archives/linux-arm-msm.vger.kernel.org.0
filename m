Return-Path: <linux-arm-msm+bounces-42393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E27279F3C31
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 22:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A300F167444
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 21:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE501D8E12;
	Mon, 16 Dec 2024 20:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cT2xG2cM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF2A1D5165;
	Mon, 16 Dec 2024 20:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734382498; cv=none; b=noQsqA7ZwfWy8fEZl/ZygRYar58nTOB6wZIjqLtZzrLwcqu3mEi6At8MGw4OoK4hwkSRGDzOpSuCNzQHts0h9c9W9k7dQuuoMIuXDJwFNsaJv5EcMm1XPUDY4KED7ZKJJWxBvfG1q/+gRy83lF72X94Um2u58p0gN1I8F84QyUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734382498; c=relaxed/simple;
	bh=geG/YKx27V/zlwg0MEi0DPulSqUKvqAC78Zqn7duPTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YrI7XrFBPtYQnDORpxpvcEUtJTjmjFiIIbUFS8BY3AlPgOy6gNGE9FFWkwZh+2ZdEw+Bjje9EmdtLb6xubPphEY9AqI2C83Se91rXzOZJLTchdho/oEH+DzRLt61lj+2xAPFouWv2jNDf33iQEihxfDAWoujzmEVq6d82ohRtoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cT2xG2cM; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-844e39439abso115703039f.1;
        Mon, 16 Dec 2024 12:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734382496; x=1734987296; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGu56YKO1XlSS7wwJkm05qsGyYVWIdWmEMISHyf2DmA=;
        b=cT2xG2cMY7DVo+jtWcwjK+FsO6SB6xoolBOa/k33QmYvCAk07DOZzHLauNmyEO1XA5
         03Fr95tpAXMB2EmxgeLSGTlZP2KECbVIQ/ThKXoJm6b+q473EhWSPAts/7gigNAkd8cC
         lPcSe6M0euqfJ5Pj2L5gk0ENfkG60kp1WnHLNg4LtYO7PjmZcXC2j10UTpp8RLLlw/00
         WmLOAUfHS3KA1lNECPfhdbslmuQ+H269PprwwSxVnsekjTk+pN7I4BECQFDi45O6tB6r
         PFwNU6I5I1MIcFUpR0VuSCE2axalfATWNimnFLVOszcdQtOzXgeq7SX9qw4E9PWE5qgA
         AaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734382496; x=1734987296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGu56YKO1XlSS7wwJkm05qsGyYVWIdWmEMISHyf2DmA=;
        b=Nv2NekdpkganyIOJ/LSiB/DtCUl3PaOVFzhlqTAGkt3tVW64+gBXC9wVPouYdklC3h
         O6P+NZ13vFW9LixiSOiNuRhAVaw26pV/BNL+xGDwFr4IdmMvCdUdZJ914A0lwj4AYifu
         LgbaO9YGpGAulTTTC84mHw77Se+7HEAE2qAiTk8i42OGnEbOvu/DkQlNF7+rGk6kZsj6
         I83Jem1sS/d9LyXpKtaVk/Fuc6s7H0z3LlNu81ut6Ffg0NDiydsuUC1EL7azmv060nS9
         NoOomdhZPX/FTuOZEVcrrgBrCYuN1QWjdeEaYeAs/w58CjQFSOotidKgDrdqj6/p6jAM
         +nCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2Ga6hil3ebkrz1RsdCrb4Dkax6gS1kwclba09aZCZEBZzWch0PV+Uk+1SMll6xqrS7wez10bDpxFSptPT@vger.kernel.org, AJvYcCXij+URv/6CAvVyDoqpArFLbn6Gn2Ggy7B8U6XQLwB58HjU39GQCtmvz+ga+rrm8G6PvnIDgWAGwECdUt7e@vger.kernel.org
X-Gm-Message-State: AOJu0YxCwK+tBesApzhUyRMpipPgSgugwk0i1j54NhLRHtFlFk8lSpCf
	7eYkhLBfyM89U31ALIW+BO8ezL2gFJv1/CsAI8fzUKt8fzgbbavoFvepCyXtCqKjsGYFHbe4Xyc
	lY9DTCWvma3xMjjtbt8X8LiLvQos=
X-Gm-Gg: ASbGnctl+fhw78DKsQxNxZv1NR2BRaOsQ1ivLQtMWmOoSv6zETn/ATMUT1VBQauit+z
	d1PeorWzOPojnOhhdA09uSDoW3SyzSfDscYwRZ+0BfgLpcKU3D+4QaLl7Y5u1TR81fsQ1
X-Google-Smtp-Source: AGHT+IE6NSDPDfv/Nr17YFiwuwQ8NV0QFzK1yfUD5+dRWkpGvLeKWKyM4SsI5zKJl53NjUsanNs56HL6Xdim8pgvJWw=
X-Received: by 2002:a05:6e02:1a07:b0:3ab:4bea:df97 with SMTP id
 e9e14a558f8ab-3affbbb656fmr160374485ab.23.1734382495871; Mon, 16 Dec 2024
 12:54:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216171017.4881-1-robdclark@gmail.com> <a15a7594-8793-478b-a86e-81a06812e4ff@quicinc.com>
In-Reply-To: <a15a7594-8793-478b-a86e-81a06812e4ff@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 16 Dec 2024 12:54:43 -0800
Message-ID: <CAF6AEGsFeibyH5_a7m=9PMKReD4Xb+c=dEGsbCN0_UHiJK1vbA@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 12:28=E2=80=AFPM Akhil P Oommen
<quic_akhilpo@quicinc.com> wrote:
>
> On 12/16/2024 10:40 PM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > On mmu-500, stall-on-fault seems to stall all context banks, causing th=
e
> > GMU to misbehave.  So limit this feature to smmu-v2 for now.
> >
> > This fixes an issue with an older mesa bug taking outo the system
> > because of GMU going off into the year.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu=
/arm/arm-smmu/arm-smmu-qcom.c
> > index c4c52f7bd09a..1c881e88fc4d 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > @@ -331,8 +331,10 @@ static int qcom_adreno_smmu_init_context(struct ar=
m_smmu_domain *smmu_domain,
> >       priv->get_ttbr1_cfg =3D qcom_adreno_smmu_get_ttbr1_cfg;
> >       priv->set_ttbr0_cfg =3D qcom_adreno_smmu_set_ttbr0_cfg;
> >       priv->get_fault_info =3D qcom_adreno_smmu_get_fault_info;
> > -     priv->set_stall =3D qcom_adreno_smmu_set_stall;
> > -     priv->resume_translation =3D qcom_adreno_smmu_resume_translation;
> > +     if (of_device_is_compatible(np, "qcom,smmu-v2")) {
> > +             priv->set_stall =3D qcom_adreno_smmu_set_stall;
> > +             priv->resume_translation =3D qcom_adreno_smmu_resume_tran=
slation;
> > +     }
>
> Shall we disable this from the driver instead? A debugfs knob to trigger
> coredump after a pagefault is very convenient.

It would require the driver to find the compatible for the smmu, so it
could differentiate btwn smmu-v2 and mmu-500, which seemed like it
might be a bit uglier.

Ideally/hopefully we could figure out how to make GMU a bit more
resilient in the face of stalled translations, because it is useful to
get accurate devcore dumps on smmu faults.  At that point we could
revert this change.

BR,
-R

>
> -Akhil
>
> >       priv->set_prr_bit =3D NULL;
> >       priv->set_prr_addr =3D NULL;
> >
>

