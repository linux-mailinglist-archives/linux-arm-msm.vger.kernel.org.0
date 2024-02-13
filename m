Return-Path: <linux-arm-msm+bounces-10882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4D3853063
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 13:19:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90D1B1C223AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 12:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47FD52BB0A;
	Tue, 13 Feb 2024 12:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SPgyDukr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216C8482C5;
	Tue, 13 Feb 2024 12:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707826780; cv=none; b=dLhzPXdlIsvaW14c+72N00va6iKzvP/5pTGtkqH58b1pNxu/9FyT+O4HIF826NeABII7L/NeYQ1IR9ScpJ9lSbYNF5ENOZ66QQd1Me81KlFcu/NbQ5s+RMfRYHvlCgc5ncuFJemlWGzgDQZXoEL4Qa4+HKUO5Cshr0lbbgt/3Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707826780; c=relaxed/simple;
	bh=v5AyhBHiPceSmCW8rRAmmmf/JyydM9xR7xdvhgLspEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLPJGXdc7CcAXrvlKfsyf/uTDcSLsKtyTg5tcnNwBx1HvsJ40Q1wYrhJGgr9osOjj4poKy4edQTYOThMOYx5azhL3vyPqVRvN7FYACvzA9FnZUWNcvLNPCTbgAxahACigHXsxxw6i/akwX8cJGznO1ltco3RBE17Z8ysPJKdtog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SPgyDukr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A29C433F1;
	Tue, 13 Feb 2024 12:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707826779;
	bh=v5AyhBHiPceSmCW8rRAmmmf/JyydM9xR7xdvhgLspEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SPgyDukrRgBR67Qehh9MEuOh3j2u+r6Is90V7S2dUGhg6le3gVL7Y3rYg+hold838
	 XPbW4/eg+hgSUtZm4YFQrBk1L4JunvuY7hjQN2Qx+GAXLMAfDizQ4AyM/BNNzxUv+5
	 Y0dLRjkZBwwteX6wABlKR9MiujJ0NR8++aFK6PsKxV2fBJeZCIyV2Kzjorh+g0z69d
	 iZSC7MMoWG3ZwiTMlhYeiSXpgrhvkppei/g65SK81b98KU/bImeEBYJneFi+iylFbc
	 TLII3pE4E37iwSIyC32wkvIZQCXSj9C82TJ/N7b2JdhZj1QeBml9rF5G2pjJTgBGCA
	 a7ZcOVJXKvtDA==
Date: Tue, 13 Feb 2024 12:19:34 +0000
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robdclark@gmail.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] Revert "iommu/arm-smmu: Convert to domain_alloc_paging()"
Message-ID: <20240213121934.GA28726@willie-the-truck>
References: <20240213-iommu-revert-domain-alloc-v1-1-325ff55dece4@linaro.org>
 <20240213121257.GI765010@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213121257.GI765010@ziepe.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Feb 13, 2024 at 08:12:57AM -0400, Jason Gunthorpe wrote:
> On Tue, Feb 13, 2024 at 01:31:56PM +0200, Dmitry Baryshkov wrote:
> > This reverts commit 9b3febc3a3da ("iommu/arm-smmu: Convert to
> > domain_alloc_paging()"). It breaks Qualcomm MSM8996 platform. Calling
> > arm_smmu_write_context_bank() from new codepath results in the platform
> > being reset because of the unclocked hardware access.
> > 
> > Fixes: 9b3febc3a3da ("iommu/arm-smmu: Convert to domain_alloc_paging()")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu.c | 17 ++++++-----------
> >  1 file changed, 6 insertions(+), 11 deletions(-)
> 
> Please no, as I said in the other email the only thing that should be
> reverted is this:
> 
> > @@ -875,15 +879,6 @@ static struct iommu_domain *arm_smmu_domain_alloc_paging(struct device *dev)
> >  	mutex_init(&smmu_domain->init_mutex);
> >  	spin_lock_init(&smmu_domain->cb_lock);
> >  
> > -	if (dev) {
> > -		struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
> > -
> > -		if (arm_smmu_init_domain_context(smmu_domain, cfg->smmu, dev)) {
> > -			kfree(smmu_domain);
> > -			return NULL;
> > -		}
> > -	}
> > -
> >  	return &smmu_domain->domain;
> >  }
> 
> Everything else is fine, you already tested with that arrangement.

Partial reverts are a recipe for confusion, so I'll take this and if you'd
like to bring back some of the hunks, please can you send a patch on top
that does that?

Cheers,

Will

