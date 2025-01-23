Return-Path: <linux-arm-msm+bounces-46011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAB2A1AB79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 21:35:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E37283AEE3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 20:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD5481D88A6;
	Thu, 23 Jan 2025 20:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xq3iN89f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5571DA0EB
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 20:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737664192; cv=none; b=nBdY/rl1Z9aNcJW5F5U/6KcWzoZg4LPgNU1cKg6DYXS4X/Zwr9A6SqxucHFn8FMpmc0Zjl0cuEIcPDir0Vwc2cJ9YWqOVRNZUKYczDPKHbdvSMWeSS0pyra6TiKAufo4YGAFWevrmEhxM7Jhqf2dCxhS07FzUXe7rS0wSGx3b10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737664192; c=relaxed/simple;
	bh=WEUi/YG2MoWUOF6uCxNlvX3lwljvYvy8G2P6b5wr7cE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YVsSFxt7NcL+DV5lMSwbQsrRlRWVhmP6XoFcrQ+w1dEtsjWEPosu1uadjRHWQrlEM4foMJZ/+wx3dQfT75jA8p2wOeAIHtbmGZeR9nf3TDClmu8nTDRrhn90+kJXJuiXetXSa37enL7Izl8sRZ0z2ZtwdrIdwPDrugcAZNaVuuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xq3iN89f; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f2f5e91393so313639a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 12:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737664190; x=1738268990; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhXUcAh2hlUnon67PlT/agcOsGJGx82H3mKA5T5zmFk=;
        b=Xq3iN89f3WiToaWvvgwaAeQKCK2aNAEvnsRH5FgfJgNSC3hH5JmFnJGWJtuTNLEFeO
         tViyALTFItmj7Jm9g1i4eP9MvJBnaMMsEUYMOOmRsSIlWeiBPVYJp57NKlOYmYg4BwL3
         H1RC1YgbboV3AZMpTRTeNEMCm9gLW979mpPxyUy/qaUNwaBuTBz62nTOkKYbfqfBydkr
         IEr/McmN+O8y8ypO+COcO81zpvgjygJvh4gnGYcd6IKWMypCfVoKamGXK1R+LixSfrDP
         GXCHAjxHaEuYFBzDcWVyt9l2x6bgQxblgfdcOfajnkXRf/gu3Ho9HDyI4qTsZZP0O1Gu
         ocfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737664190; x=1738268990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhXUcAh2hlUnon67PlT/agcOsGJGx82H3mKA5T5zmFk=;
        b=vJD2ngtoFxKY6N9W/l+N98xHpC8jr2Pz3Ykaz8TYCyl1T22Go3X3Q8eBmv7JP/CgIf
         HTqfc+dlQU+PQHNKpDWtQAycgl0fHCGH8ocM7MxFkkbc27trVp1lCnjCZh1t2WIOSTBs
         36jdVEedVVvEaLxEl7wj3PJTBrwuO1D/ohCUyT3iueikG97Jd4dPb9nzMcVdJhdo0AMS
         wGDAsyuSqj49ts317qqhorkE/i4vR0+G9jE4qyCWXJZ638I8HVFYFiYMtCBuGyEkez4A
         Os8G9rvJDWNHuqmsoWyUVU2bhfEV9ae9rDAx5LYhvKLHoV/y1KZ8Y9Hm6FXZwAy9214I
         iw3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkpztIpHdnGgcGsNA7RxeJ9CUfdCi5880fTJt0Euj1S7+HTJj01pZxKSgzpD1hsI+0U6L+GPseLjnnCV4G@vger.kernel.org
X-Gm-Message-State: AOJu0YyVP6ABKpzF+xy7OC09CPs1f/ubX1HzBBfPjEkz4en+HVhIBi+k
	tFUssdhAcfDOexpfRceairIwuSkoqb42baeW+aab2IaFodTV2Sz3oPqvj/R1D1XKDdF34WwN6R6
	/mIeTWS1k9kaXCH5+AIgoc5OxUQ8=
X-Gm-Gg: ASbGncukdP94yjvuJZj5k0uLALyxN4yV0CIA3c4/PxaIlS4mUlfyT64CcGfxBX6YzG0
	GyJinnnU2yThVD6Nhe84Y5WGe9A0IINlhrfHQE7ECKYlEOcUUikodhSUEU5RsOw==
X-Google-Smtp-Source: AGHT+IEl/Vyc8QmUbX/0GWfiscTSIPf6SvYZLBKkQKTl7lLUFAx/A3wbK7xRIXAG5nlkFHCAISdwVSqrdyt6dZww7dM=
X-Received: by 2002:a05:6a00:3a1d:b0:72d:8a01:bb6c with SMTP id
 d2e1a72fcca58-72daf7a1db7mr13737192b3a.0.1737664189916; Thu, 23 Jan 2025
 12:29:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
 <20250122-msm-gpu-fault-fixes-next-v3-1-0afa00158521@gmail.com>
 <Z5IjsqQ6vTdUXiGt@hu-guptap-hyd.qualcomm.com> <CACu1E7H5X2EfY9AG=xceaoZJkbumwnrsU4QvNbxd_A2wgVVOaQ@mail.gmail.com>
 <Z5KXwNPrdirVUn8Z@hu-guptap-hyd.qualcomm.com>
In-Reply-To: <Z5KXwNPrdirVUn8Z@hu-guptap-hyd.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 23 Jan 2025 15:29:38 -0500
X-Gm-Features: AWEUYZlzwCzK_Ns_Li_73IXsL90hsOwVuugbU7LWSAnvDp0ILCSA2EsoYowsZGM
Message-ID: <CACu1E7Hw3WxNzwdA2A8hG2yWNVMLy=r=68_X0C3tkVttgRzXVQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
To: Prakash Gupta <quic_guptap@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 2:26=E2=80=AFPM Prakash Gupta <quic_guptap@quicinc.=
com> wrote:
>
> On Thu, Jan 23, 2025 at 09:00:17AM -0500, Connor Abbott wrote:
> > On Thu, Jan 23, 2025 at 6:10=E2=80=AFAM Prakash Gupta <quic_guptap@quic=
inc.com> wrote:
> > >
> > > On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbott wrote:
> > >
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
> Not sure if multiple context bank with shared interrupt supported for
> arm-smmu driver, but even if does than context fault handler they would
> operate on their respective context register space, so I don't see the ra=
ce
> at context register update.
>
> > > > +      * re-enable them in the resume handler, leaving interrupts e=
nabled.
> > > > +      * Lock the write to serialize it with the resume handler.
> > > > +      */
> > > > +     if (cfi.fsr & ARM_SMMU_CB_FSR_SS) {
> > > > +             u32 val;
> > > > +
> > > > +             spin_lock(&smmu_domain->cb_lock);
> > > > +             val =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_SCTLR=
);
> > > > +             val &=3D ~ARM_SMMU_SCTLR_CFIE;
> > > > +             arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, val);
> > > > +             spin_unlock(&smmu_domain->cb_lock);
> > > > +     }
> > > > +
> > > > +     /*
> > > > +      * The SMMUv2 architecture specification says that if stall-o=
n-fault is
> > > > +      * enabled the correct sequence is to write to SMMU_CBn_FSR t=
o clear
> > > > +      * the fault and then write to SMMU_CBn_RESUME. Clear the int=
errupt
> > > > +      * first before running the user's fault handler to make sure=
 we follow
> > > > +      * this sequence. It should be ok if there is another fault i=
n the
> > > > +      * meantime because we have already read the fault info.
> > > > +      */
> qcom_adreno_smmu_get_fault_info() reads the fault info as part of client
> fault hanlder. So it would not be ok to clear FSR before reporting the
> fault to client.

That's a good point, but as long as stall-on-fault is enabled it
doesn't matter because subsequent transactions that fault will be
stalled. Patch 3 of this series disables stall-on-fault after the
first fault in drm/msm, but we don't care as much about the accuracy
of those subsequent faults.

>
> > > The context would remain stalled till we write to CBn_RESUME. Which i=
s done
> > > in qcom_adreno_smmu_resume_translation(). For a stalled context furth=
er
> > > transactions are not processed and we shouldn't see further faults an=
d
> > > or fault inerrupts. Do you observe faults with stalled context?
> >
> > Yes. I've observed that on MMU-500 writing RESUME before the interrupt
> > has been cleared doesn't clear SS. This happened with v2 in the case
> > where there was already a devcoredump and drm/msm called
> > qcom_adreno_smmu_resume_translation() immediately from its fault
> > handler, and we'd get a storm of unhandled interrupts until it was
> > disabled. Given that the architecture spec says we're supposed to
> > clear the interrupt first this may have been an attempt to "help"
> > developers.
> >
>
> Just to clarify, present sequence is:
> 1. context fault with stall enable. FSR.SS set.
> 2. Report fault to client
> 3. resume/terminate stalled transaction
> 4. clear FSR
>
> At what point when you try #2->#3->#4 or #4->#2->#3 sequence, is FSR.SS
> cleared and interrupt storm is observed.  The way CFIE disable is helping
> with current patch indicates write FSR is unstalling context and subseque=
nt
> transactions are faulted.  Do you stop getting interrupt storm after writ=
e
> RESUME. If you can mention your SCTLR configuration and FSR state in test
> sequence, it would be clearer.
>
> An aside, If reducing delay between FSR and RESUME write helps then both
> can be done as part of qcom_adreno_smmu_resume_translation(). This will
> follow spec recommendation and also make sure fault registers are not
> cleared before reporting fault to client.
>
> Thanks,
> Prakash

