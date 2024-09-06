Return-Path: <linux-arm-msm+bounces-31093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0D396F201
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 12:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A82001C23EF4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 10:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F17D1CA6AF;
	Fri,  6 Sep 2024 10:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jWtY/qrc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3907158866;
	Fri,  6 Sep 2024 10:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725620222; cv=none; b=EjK+MhYvC2wgcVJgJDeuzavJX59dyVIHaLJ4AqeM6oBebLPOSz4XEob9nxvETojUEfR30+eQ3t0fpr38aWVDFnJAxcOPPFHYttOYEvp60JGNINN3BkPhCnaweE2GL+XMrvPzgmReEm5Jwpp5RMNDtQ9XbPP5GZiuo11pr3Rdbr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725620222; c=relaxed/simple;
	bh=Y1Xu/m4qEradqB0WQJLayaC6i5KppBg/Aq1cg8q0uks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YS2VsFZFDNa1FZrbmSl5e+DGeegBbjvnH6LqsLL5QXGD3LNT4nSA70NL3jgCy4FmGH4vVsO2H01+9PLCSx7EjnbnNBN7/NFUc9C/9X8Ij1m73HVJaSoamqqoGhILEDBUb1CiGrQEuzof7eIqsfhG53POajfPRiuPHnFOOce7Zn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jWtY/qrc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E3C6C4CEC4;
	Fri,  6 Sep 2024 10:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725620221;
	bh=Y1Xu/m4qEradqB0WQJLayaC6i5KppBg/Aq1cg8q0uks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jWtY/qrch76CwBkJQSxyyCYzfJfg/Dp/dtzl6Vk4UMJGfJwQQNbuRQBJowgjqRMq2
	 lYC6Q6V1dwGdbAnw90ZBGuBCjJVUtF8mqpB62kgQzfopU1hYTJ3BNCm9I1CKgDaG+G
	 MvU9FTQaPwdyiGYFFKTT9nXTWmb1jflToY7+kFZo4oCEbNQ4pUHoXq5dEp+ztjSQI4
	 QCmZ0JE5Ix2Yl1OmtK2mGcNhqu4OMWNlOCTHC+ldeHoEqjBF9Q84jMNipfJccPHEJI
	 pRNeFJk98EcALV/DM4cLL6hsX1mHwxD8W08K0wuGX3KdVOh4Qpu223CLTTB2RRP3d+
	 E08jvNH8noIOw==
Date: Fri, 6 Sep 2024 11:56:56 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Rob Clark <robdclark@gmail.com>, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	Ashish Mhetre <amhetre@nvidia.com>,
	Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Revert "iommu/io-pgtable-arm: Optimise non-coherent
 unmap"
Message-ID: <20240906105656.GA16124@willie-the-truck>
References: <20240905124956.84932-1-robdclark@gmail.com>
 <20240905155330.GA15246@willie-the-truck>
 <53f13813-a515-475a-836d-0b6017a117eb@arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53f13813-a515-475a-836d-0b6017a117eb@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Sep 05, 2024 at 05:27:28PM +0100, Robin Murphy wrote:
> On 05/09/2024 4:53 pm, Will Deacon wrote:
> > On Thu, Sep 05, 2024 at 05:49:56AM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > > 
> > > This reverts commit 85b715a334583488ad7fbd3001fe6fd617b7d4c0.
> > > 
> > > It was causing gpu smmu faults on x1e80100.
> > > 
> > > I _think_ what is causing this is the change in ordering of
> > > __arm_lpae_clear_pte() (dma_sync_single_for_device() on the pgtable
> > > memory) and io_pgtable_tlb_flush_walk().  I'm not entirely sure how
> > > this patch is supposed to work correctly in the face of other
> > > concurrent translations (to buffers unrelated to the one being
> > > unmapped(), because after the io_pgtable_tlb_flush_walk() we can have
> > > stale data read back into the tlb.
> > > 
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >   drivers/iommu/io-pgtable-arm.c | 31 ++++++++++++++-----------------
> > >   1 file changed, 14 insertions(+), 17 deletions(-)
> > 
> > Please can you try the diff below, instead?
> 
> Given that the GPU driver's .tlb_add_page is a no-op, I can't see this
> making a difference. In fact, given that msm_iommu_pagetable_unmap() still
> does a brute-force iommu_flush_iotlb_all() after io-pgtable returns, and in
> fact only recently made .tlb_flush_walk start doing anything either for the
> sake of the map path, I'm now really wondering how this patch has had any
> effect at all... :/

Hmm, yup. Looks like Rob has come back to say the problem lies elsewhere
anyway.

One thing below though...

> > 
> > Will
> > 
> > --->8
> > 
> > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> > index 0e67f1721a3d..0a32e9499e2c 100644
> > --- a/drivers/iommu/io-pgtable-arm.c
> > +++ b/drivers/iommu/io-pgtable-arm.c
> > @@ -672,7 +672,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
> >                  /* Clear the remaining entries */
> >                  __arm_lpae_clear_pte(ptep, &iop->cfg, i);
> > -               if (gather && !iommu_iotlb_gather_queued(gather))
> > +               if (!iommu_iotlb_gather_queued(gather))
> 
> Note that this would reintroduce the latent issue which was present
> originally, wherein iommu_iotlb_gather_queued(NULL) is false, but if we
> actually allow a NULL gather to be passed to io_pgtable_tlb_add_page() it
> may end up being dereferenced (e.g. in arm-smmu-v3).

I think there is still something to fix here. arm_lpae_init_pte() can
pass a NULL gather to __arm_lpae_unmap() and I don't think skipping the
invalidation is correct in that case. Either the drivers need to handle
that or we shouldn't be passing NULL.

What do you think?

Will

