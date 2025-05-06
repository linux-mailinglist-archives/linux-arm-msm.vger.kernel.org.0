Return-Path: <linux-arm-msm+bounces-56966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B01FAAC943
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 17:19:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D686174CE5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 15:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D22A283695;
	Tue,  6 May 2025 15:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3V1tqm8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895DF28312F
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 15:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746544738; cv=none; b=YNgBBzB+7T3Pbbq8Uy4g8K3eTgO1hZG/moMsMntqaY9AvGwUCYEaYdLutO/9Ioc/iAhgCLTBSao9dT5nQeAJN63ivtO4qGHiT2pVqfnw2wQQEXd4Wo290GINvwXaw/zulv0QutqNb8hMDVB/x0VUl5BRppw3PY0hBoY6cX/+MJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746544738; c=relaxed/simple;
	bh=R1Q3OWE4myjnVUhk05+YlDKzcHK1o9/m6Uueuc2uXOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aAMDctvLCB3zBNFQGUyAdTAK10wwjNtIRyHudhkcaIWnfhoogZIkDKxe07SFOrbcBfQA2WvFOpY5v8ZG5Tjl14gTK15CLlrxQrPWqLmNpAVE3tfCTr5XmquL10A4vMVy/Nl8afQL0Ro6om0lFMVheTMNlnxJ7Cc5H7bqN0Iuvlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3V1tqm8; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-736abdac347so717966b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 08:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746544736; x=1747149536; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihwIKJtv6TLBR/OI0Dx++tOWSWHwkJU0gov7VsGhIAg=;
        b=G3V1tqm83Z4qd0SWoxn0aSeYC2Yof8rYpe1sHwNCnqEI4fgDu2qsBuVLvpJ55DkZAB
         aC801LKarrY955DT11rqA7aBQP/PiZFvHOG1q7w7QfZ1ITikgcSLuArofakSqbDlPq89
         d9CqDXS+tA1w2SeJqEn33GPjlFl7jfHZDsIn6ftsLmT2C+w3UhX35giYBsF8CJTf/ecg
         YZnL3BpH3K9oJFzTwQl/fpki+tw9vUhKZIuQ8HV22KbTaGYE3NaVmtWJ62/8sVt4mIc2
         Mon4yRBst5PRM9zN02ySn/k3xhYNc+LxPCHo/HM12YnQZcVXvGQNLbNB0cA929Bgzu3m
         fbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746544736; x=1747149536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihwIKJtv6TLBR/OI0Dx++tOWSWHwkJU0gov7VsGhIAg=;
        b=C3zC6J3IFIj/+ypIWmf13JEO9CdEKGJpui++SYQBq7XNxwDLzuWu2mJHcKsllboUVD
         aFzwPgJnIENMQE84kgEijhM/DlGPuaKIRVRMUJMv7H9bl4x3CvLNkGT1crDzDrTTblth
         c2q9YBHJ8p2Of7FOq5S/XZuLRSE9S1ByR2PXi21MqhDj7g9aBWigoz7qGOHTU4bWTbD6
         gZUMgFxbwQh8AdLSG+EGl6vESxlfQDI7jMGgXc9cw/F7YE2d9dYoc3JQehB/+XTfQFDe
         j8oSz1Z3A/yzl8fzjywf5Yw4mq6AJDE8eAYDv0PwfCNPgaik8+kOP5amv6OHXvRrxqXn
         OMqw==
X-Forwarded-Encrypted: i=1; AJvYcCU/auRkqhrANxnOBMSTknDKnLkNbrB6wWdBRzD+FL6hi86yVZYdnCf2wFkqp/UHi5GJAMgh13h5wWUYhPam@vger.kernel.org
X-Gm-Message-State: AOJu0YwXdvFlcknL10nWTOciwJCdMhpsYVL62p2E6OkKYq+EEImvUFki
	6evZu0/CUtq9TKo2dKhkYpqCR6DFl7agqWAHPegVr51L4+Adk9Gi+xn4Kqm4qKktbFyBFFozine
	IwKxZzW8Jd77SStr13Q8n2e8KhhI=
X-Gm-Gg: ASbGnculQq0QOAGxovmDVAnv2c8GI8cG/ZZ0Wd14wMghk5n6TT9SUX92+fTson6fVf+
	SdlicWQsbkoEihtPfSGtsq3DnCsO9AN76iKqH95OpkLl9k8BSHlBTd3RBsyblonrqaiXej5AQtg
	hFPq7WfjHO+mfW3M/gbK7ewA==
X-Google-Smtp-Source: AGHT+IGL6zvGfKRHCeOyJw86qk5Rtichxh0QI1NF1NjzDjI2bE5Xp0U89TjTculYg2ARVj82+Jn/HSEeNbzQmRWcjwY=
X-Received: by 2002:a05:6a00:3394:b0:736:89bd:ffb9 with SMTP id
 d2e1a72fcca58-7409b78f76bmr67926b3a.0.1746544735683; Tue, 06 May 2025
 08:18:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
 <20250319-msm-gpu-fault-fixes-next-v5-3-97561209dd8c@gmail.com>
 <20250506122449.GB723@willie-the-truck> <CACu1E7FA0M_0Un3qPRNtqy4R_NbaMks6FSkpQZBuyqJpuT-p7w@mail.gmail.com>
 <20250506145324.GA1246@willie-the-truck>
In-Reply-To: <20250506145324.GA1246@willie-the-truck>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 6 May 2025 11:18:44 -0400
X-Gm-Features: ATxdqUHApCvIBLWVxzAKGWehj2Jn9c8bDSVhoYqNoYQYukt99xBU21U5GE3iI-8
Message-ID: <CACu1E7FcQU3NXro8uYxzEJ1pvfYG5WLvY8BscbF9Sj+P3Wh_2A@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
To: Will Deacon <will@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 10:53=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, May 06, 2025 at 10:08:05AM -0400, Connor Abbott wrote:
> > On Tue, May 6, 2025 at 8:24=E2=80=AFAM Will Deacon <will@kernel.org> wr=
ote:
> > > On Wed, Mar 19, 2025 at 10:44:02AM -0400, Connor Abbott wrote:
> > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/=
arm/arm-smmu/arm-smmu.c
> > > > index c7b5d7c093e71050d29a834c8d33125e96b04d81..9927f3431a2eab91375=
0e6079edc6393d1938c98 100644
> > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > @@ -470,13 +470,52 @@ static irqreturn_t arm_smmu_context_fault(int=
 irq, void *dev)
> > > >       if (!(cfi->fsr & ARM_SMMU_CB_FSR_FAULT))
> > > >               return IRQ_NONE;
> > > >
> > > > +     /*
> > > > +      * On some implementations FSR.SS asserts a context fault
> > > > +      * interrupt. We do not want this behavior, because resolving=
 the
> > > > +      * original context fault typically requires operations that =
cannot be
> > > > +      * performed in IRQ context but leaving the stall unacknowled=
ged will
> > > > +      * immediately lead to another spurious interrupt as FSR.SS i=
s still
> > > > +      * set. Work around this by disabling interrupts for this con=
text bank.
> > > > +      * It's expected that interrupts are re-enabled after resumin=
g the
> > > > +      * translation.
> > >
> > > s/translation/transaction/
> > >
> > > > +      *
> > > > +      * We have to do this before report_iommu_fault() so that we =
don't
> > > > +      * leave interrupts disabled in case the downstream user deci=
des the
> > > > +      * fault can be resolved inside its fault handler.
> > > > +      *
> > > > +      * There is a possible race if there are multiple context ban=
ks sharing
> > > > +      * the same interrupt and both signal an interrupt in between=
 writing
> > > > +      * RESUME and SCTLR. We could disable interrupts here before =
we
> > > > +      * re-enable them in the resume handler, leaving interrupts e=
nabled.
> > > > +      * Lock the write to serialize it with the resume handler.
> > > > +      */
> > >
> > > I'm struggling to understand this last part. If the resume handler ru=
ns
> > > synchronously from report_iommu_fault(), then there's no need for
> > > locking because we're in interrupt context. If the resume handler can
> > > run asynchronously from report_iommu_fault(), then the locking doesn'=
t
> > > help because the code below could clear CFIE right after the resume
> > > handler has set it.
> >
> > The problem is indeed when the resume handler runs asynchronously.
> > Clearing CFIE right after the resume handler has set it is normal and
> > expected. The issue is the opposite, i.e. something like:
> >
> > - Resume handler writes RESUME and stalls for some reason
> > - The interrupt handler runs through and clears CFIE while it's already=
 cleared
> > - Resume handler sets CFIE, assuming that the handler hasn't run yet
> > but it actually has
> >
> > This wouldn't happen with only one context bank, because we wouldn't
> > get an interrupt until the resume handler sets CFIE, but with multiple
> > context banks and a shared interrupt line we could get a "spurious"
> > interrupt due to a fault in an earlier context bank that becomes not
> > spurious if the resume handler writes RESUME before the context fault
> > handler for this bank reads FSR above.
>
> Ah, gotcha. Thanks for the explanation.
>
> If we moved the RESUME+CFIE into the interrupt handler after the call
> to report_iommu_fault(), would it be possible to run the handler as a
> threaded irq (see 'context_fault_needs_threaded_irq') and handle the
> callback synchronously? In that case, I think we could avoid taking the
> lock if we wrote CFIE _before_ RESUME.
>
> Will

We need the lock anyway due to the parallel manipulation of CFCFG in
the same register introduced in the next patch. Expanding it to also
cover the write to RESUME is not a huge deal. Also, doing it
synchronously would require rewriting the fault handling in drm/msm
and again I'm trying to fix this serious stability problem now as soon
as possible without getting dragged into rewriting the whole thing.

Connor

