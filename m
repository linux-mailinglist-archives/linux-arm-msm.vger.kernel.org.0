Return-Path: <linux-arm-msm+bounces-56965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E587EAAC8C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 16:54:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1711A3B19CD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 14:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7CC283154;
	Tue,  6 May 2025 14:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fG3F/80P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A7028151F;
	Tue,  6 May 2025 14:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746543211; cv=none; b=D9mIF4pEMflb+8NxL9BghHx9rhF1wVpstYBKCbjCWPpUi++G92zc+NjM/N29NpOCctpMb4dROvd+l+hUWuBLYf51HRBdm7+2ItdNg5Ge/ecANVtQ7DPU5WnzSqWM3pc4fX+vlXfuE43XmLbRXUkJiBRDPrTkzbuf8N8gz0WlZ5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746543211; c=relaxed/simple;
	bh=mlHA7oTENsJhkBEE9KRVlu9szOgOr4t+vxxALv3XDvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p+lmpCsEyd85EwJ20MjHp1UR1teLFDVp7bBH8nfJe/RQ5nZ4VuMnO0krsHcpzFFy8yqQms9LOqVk+A72+imAs3eWK58JhLr5caZmJRwDt1BuL0B1kr52XO+O0dtB2lR/L/9IzOzBqncEsztQx9YEPOyWmgMr5/KQO+nreaKBK0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fG3F/80P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D1AC4CEE4;
	Tue,  6 May 2025 14:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746543210;
	bh=mlHA7oTENsJhkBEE9KRVlu9szOgOr4t+vxxALv3XDvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fG3F/80PyNXqPQAIHuUmfOxwo+KV7sFiP01r2zWkIdAfSWR9DxkeJEJmrTQHZDJpV
	 8+kz8AF/iMG1dCY6nio+8ziCbFpytdvNiSrbgeGez7+1KiCOW0fs6uSkMUxzpsFfBS
	 gqR6FiUsaFOgZaWx+l4Drydtcm+TkwghRjcXhciegpLrcrF11m3Y3AGn0s5LA06YV0
	 XCeNvl1DQQD9V/oWCsK8GigyGdtLyN5avNJs92JfQuhZUWossF8cQMA6Yfkh43Opim
	 R3sSmM2Vz4buzMxmeVeQGlYcc+Nxx3i+iXkpTsG+radUofEaj8YTyf5G6W5oqyFJ8I
	 4ExAyIfVeY3Gg==
Date: Tue, 6 May 2025 15:53:25 +0100
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
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v5 3/5] iommu/arm-smmu: Fix spurious interrupts with
 stall-on-fault
Message-ID: <20250506145324.GA1246@willie-the-truck>
References: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
 <20250319-msm-gpu-fault-fixes-next-v5-3-97561209dd8c@gmail.com>
 <20250506122449.GB723@willie-the-truck>
 <CACu1E7FA0M_0Un3qPRNtqy4R_NbaMks6FSkpQZBuyqJpuT-p7w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACu1E7FA0M_0Un3qPRNtqy4R_NbaMks6FSkpQZBuyqJpuT-p7w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, May 06, 2025 at 10:08:05AM -0400, Connor Abbott wrote:
> On Tue, May 6, 2025 at 8:24 AM Will Deacon <will@kernel.org> wrote:
> > On Wed, Mar 19, 2025 at 10:44:02AM -0400, Connor Abbott wrote:
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > index c7b5d7c093e71050d29a834c8d33125e96b04d81..9927f3431a2eab913750e6079edc6393d1938c98 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > @@ -470,13 +470,52 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
> > >       if (!(cfi->fsr & ARM_SMMU_CB_FSR_FAULT))
> > >               return IRQ_NONE;
> > >
> > > +     /*
> > > +      * On some implementations FSR.SS asserts a context fault
> > > +      * interrupt. We do not want this behavior, because resolving the
> > > +      * original context fault typically requires operations that cannot be
> > > +      * performed in IRQ context but leaving the stall unacknowledged will
> > > +      * immediately lead to another spurious interrupt as FSR.SS is still
> > > +      * set. Work around this by disabling interrupts for this context bank.
> > > +      * It's expected that interrupts are re-enabled after resuming the
> > > +      * translation.
> >
> > s/translation/transaction/
> >
> > > +      *
> > > +      * We have to do this before report_iommu_fault() so that we don't
> > > +      * leave interrupts disabled in case the downstream user decides the
> > > +      * fault can be resolved inside its fault handler.
> > > +      *
> > > +      * There is a possible race if there are multiple context banks sharing
> > > +      * the same interrupt and both signal an interrupt in between writing
> > > +      * RESUME and SCTLR. We could disable interrupts here before we
> > > +      * re-enable them in the resume handler, leaving interrupts enabled.
> > > +      * Lock the write to serialize it with the resume handler.
> > > +      */
> >
> > I'm struggling to understand this last part. If the resume handler runs
> > synchronously from report_iommu_fault(), then there's no need for
> > locking because we're in interrupt context. If the resume handler can
> > run asynchronously from report_iommu_fault(), then the locking doesn't
> > help because the code below could clear CFIE right after the resume
> > handler has set it.
> 
> The problem is indeed when the resume handler runs asynchronously.
> Clearing CFIE right after the resume handler has set it is normal and
> expected. The issue is the opposite, i.e. something like:
> 
> - Resume handler writes RESUME and stalls for some reason
> - The interrupt handler runs through and clears CFIE while it's already cleared
> - Resume handler sets CFIE, assuming that the handler hasn't run yet
> but it actually has
> 
> This wouldn't happen with only one context bank, because we wouldn't
> get an interrupt until the resume handler sets CFIE, but with multiple
> context banks and a shared interrupt line we could get a "spurious"
> interrupt due to a fault in an earlier context bank that becomes not
> spurious if the resume handler writes RESUME before the context fault
> handler for this bank reads FSR above.

Ah, gotcha. Thanks for the explanation.

If we moved the RESUME+CFIE into the interrupt handler after the call
to report_iommu_fault(), would it be possible to run the handler as a
threaded irq (see 'context_fault_needs_threaded_irq') and handle the
callback synchronously? In that case, I think we could avoid taking the
lock if we wrote CFIE _before_ RESUME.

Will

