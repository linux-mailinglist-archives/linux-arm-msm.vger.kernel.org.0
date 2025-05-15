Return-Path: <linux-arm-msm+bounces-58068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB2DAB89C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 16:47:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0769616919C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 14:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D04318BC3B;
	Thu, 15 May 2025 14:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYpYyWdw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B023D69;
	Thu, 15 May 2025 14:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747320422; cv=none; b=qzEOybkxOKi4p6PZ5r35n6netXc5nBJGsKbX4gBIt8RwrsVHkzqYNPiymgdsP2ZyilAH1BwDiXZc+hrqLPUxrvuXno5M02xjMSplbV3gmk+mX31rFSm6Cgr+fHFDAJhho0U5uNU2jpMnsNa3+eliWX0iLxj1L0VKutF2y0J+D+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747320422; c=relaxed/simple;
	bh=iF+js4BBt+dLaStQ/POI5wyD5ubyMTtYNLC8o9vroH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ljad96OTclp5IPdt2QmKvwlSHUoPgdUtGTP8p6WFxDbO6HkSjoRrDWqdAALsbvm/LunWLNhH2DHXXQbfAnZZnzMxnzRVaFdWoZXjDTGHT4Pbs2HXZw6RiseaeIahPXgfOuEA99YJkGnrCLKUTullTweAA6/w60ilqX/bflmr8IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYpYyWdw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26FC8C4CEE7;
	Thu, 15 May 2025 14:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747320421;
	bh=iF+js4BBt+dLaStQ/POI5wyD5ubyMTtYNLC8o9vroH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YYpYyWdwrt+f9YnMLuNgTFAl3ivW6cEUiWNHBS/7LDc/3eBf1Uptx2po9ABYU9/Rj
	 fScf8zR93phvR+Qpxf4iOGOF3g4f2QBA++Tbz7O4c7Uv077ekrYxJcj0nAUkn1vAY1
	 K4Qj87AbwzMuiekhWRcSuIF76y9KtH8HXu3ftZv78K6zNSHbrxK4Qp3Wo4reTcYtLs
	 wFhTKb6r8PoXDzMlpYSgRGYB2PkPbdj4mr8IsDbOi6y8Heu6hBeegqDZqDL2MeN4Su
	 JpFM5zeyNKhLE6ofif2/AbqmyQeeFN6Jun31OlxsbSxf74PF95nj9c1ar/wOYVtQQi
	 Zo9w2FUQ0XVQg==
Date: Thu, 15 May 2025 15:46:56 +0100
From: Will Deacon <will@kernel.org>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org, quic_c_gdjako@quicinc.com
Subject: Re: [PATCH v5 3/5] iommu/arm-smmu: Fix spurious interrupts with
 stall-on-fault
Message-ID: <20250515144653.GC12165@willie-the-truck>
References: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
 <20250319-msm-gpu-fault-fixes-next-v5-3-97561209dd8c@gmail.com>
 <20250506122449.GB723@willie-the-truck>
 <CACu1E7FA0M_0Un3qPRNtqy4R_NbaMks6FSkpQZBuyqJpuT-p7w@mail.gmail.com>
 <20250506145324.GA1246@willie-the-truck>
 <CACu1E7FcQU3NXro8uYxzEJ1pvfYG5WLvY8BscbF9Sj+P3Wh_2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACu1E7FcQU3NXro8uYxzEJ1pvfYG5WLvY8BscbF9Sj+P3Wh_2A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, May 06, 2025 at 11:18:44AM -0400, Connor Abbott wrote:
> On Tue, May 6, 2025 at 10:53 AM Will Deacon <will@kernel.org> wrote:
> >
> > On Tue, May 06, 2025 at 10:08:05AM -0400, Connor Abbott wrote:
> > > On Tue, May 6, 2025 at 8:24 AM Will Deacon <will@kernel.org> wrote:
> > > > On Wed, Mar 19, 2025 at 10:44:02AM -0400, Connor Abbott wrote:
> > > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > index c7b5d7c093e71050d29a834c8d33125e96b04d81..9927f3431a2eab913750e6079edc6393d1938c98 100644
> > > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > > > @@ -470,13 +470,52 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
> > > > >       if (!(cfi->fsr & ARM_SMMU_CB_FSR_FAULT))
> > > > >               return IRQ_NONE;
> > > > >
> > > > > +     /*
> > > > > +      * On some implementations FSR.SS asserts a context fault
> > > > > +      * interrupt. We do not want this behavior, because resolving the
> > > > > +      * original context fault typically requires operations that cannot be
> > > > > +      * performed in IRQ context but leaving the stall unacknowledged will
> > > > > +      * immediately lead to another spurious interrupt as FSR.SS is still
> > > > > +      * set. Work around this by disabling interrupts for this context bank.
> > > > > +      * It's expected that interrupts are re-enabled after resuming the
> > > > > +      * translation.
> > > >
> > > > s/translation/transaction/
> > > >
> > > > > +      *
> > > > > +      * We have to do this before report_iommu_fault() so that we don't
> > > > > +      * leave interrupts disabled in case the downstream user decides the
> > > > > +      * fault can be resolved inside its fault handler.
> > > > > +      *
> > > > > +      * There is a possible race if there are multiple context banks sharing
> > > > > +      * the same interrupt and both signal an interrupt in between writing
> > > > > +      * RESUME and SCTLR. We could disable interrupts here before we
> > > > > +      * re-enable them in the resume handler, leaving interrupts enabled.
> > > > > +      * Lock the write to serialize it with the resume handler.
> > > > > +      */
> > > >
> > > > I'm struggling to understand this last part. If the resume handler runs
> > > > synchronously from report_iommu_fault(), then there's no need for
> > > > locking because we're in interrupt context. If the resume handler can
> > > > run asynchronously from report_iommu_fault(), then the locking doesn't
> > > > help because the code below could clear CFIE right after the resume
> > > > handler has set it.
> > >
> > > The problem is indeed when the resume handler runs asynchronously.
> > > Clearing CFIE right after the resume handler has set it is normal and
> > > expected. The issue is the opposite, i.e. something like:
> > >
> > > - Resume handler writes RESUME and stalls for some reason
> > > - The interrupt handler runs through and clears CFIE while it's already cleared
> > > - Resume handler sets CFIE, assuming that the handler hasn't run yet
> > > but it actually has
> > >
> > > This wouldn't happen with only one context bank, because we wouldn't
> > > get an interrupt until the resume handler sets CFIE, but with multiple
> > > context banks and a shared interrupt line we could get a "spurious"
> > > interrupt due to a fault in an earlier context bank that becomes not
> > > spurious if the resume handler writes RESUME before the context fault
> > > handler for this bank reads FSR above.
> >
> > Ah, gotcha. Thanks for the explanation.
> >
> > If we moved the RESUME+CFIE into the interrupt handler after the call
> > to report_iommu_fault(), would it be possible to run the handler as a
> > threaded irq (see 'context_fault_needs_threaded_irq') and handle the
> > callback synchronously? In that case, I think we could avoid taking the
> > lock if we wrote CFIE _before_ RESUME.
> >
> 
> We need the lock anyway due to the parallel manipulation of CFCFG in
> the same register introduced in the next patch. Expanding it to also
> cover the write to RESUME is not a huge deal. Also, doing it
> synchronously would require rewriting the fault handling in drm/msm
> and again I'm trying to fix this serious stability problem now as soon
> as possible without getting dragged into rewriting the whole thing.

This has never worked though, right? In which case, we should fix it
properly rather than papering over the mess.

Georgi (CC'd) added support for threaded interrupts specifically to
permit sleeping operations in the fault handler. You should be able to
use that and I don't understand why that would require "rewriting the
whole thing". You can kick the async work and then wait for it to
complete, no?

That would then open the door to handling the RESUME in the core driver
in future based on the return value from report_iommu_fault().

You also need to fix qcom_tbu_halt() as I mentioned before.

Will

