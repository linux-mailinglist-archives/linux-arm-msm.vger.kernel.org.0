Return-Path: <linux-arm-msm+bounces-10886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF8585311C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 14:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8FA01F226CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 13:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2E84D121;
	Tue, 13 Feb 2024 12:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oZbd5vvd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734F34C606;
	Tue, 13 Feb 2024 12:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707829197; cv=none; b=qA1mXkj1gpLiBx7gPcRRPBpLpm0DaEVkTC+FpWvS00nskWy2pgxDOk9VlkA7hldmadu3RMu2UvydmdQhwTCAbUM5SHAc+oVtZe7RoRFebBfmqMwjOod6LLVSnKSxhGz7GYLz1dck6nKS/vYOGyHgTrF76/E9rTPc2vTr+futLSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707829197; c=relaxed/simple;
	bh=C92yFZmAGpKulwoiy2FHqjnX4LOoik2WObIxu/w/yJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p1/9ySfR8j4neUgCF3ifLcPIESpoGsAOkHx98OCryQsloTkjoRkEBIFKqeyHtHUgUHkQuR+U1dT4PySM5zjbFgQ/dYiEPArNDpCDO2taCppIPSexRhEPL1hloRlQsI53JjRBXsHdsxpyYujOMvMFq5nVGdXmuJ0vNHr38QOScck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oZbd5vvd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6510FC433C7;
	Tue, 13 Feb 2024 12:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707829197;
	bh=C92yFZmAGpKulwoiy2FHqjnX4LOoik2WObIxu/w/yJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oZbd5vvdJZ+DAzSmeYJxgJFq8LBw1gf4bBowsyD+fKSdOx/QaOFJgCR34k/hjcroG
	 0iFxoYjkcw9BRO28RUwEhFbKDjKGp1Ml7xbtBs5gdyenwSmD7fA/+ni7FLGmTYiJKY
	 b3RrrDyewCtSYK0sf+3AF13b+Z4KLT9VIFLGJ1qNb12OKJcM69s+8r4AQp5brxvqH8
	 NdnYCR38rS1FVXwVljCeFnQcfPRA9y0BNe9u5zf42esBpo5+kxzl8lt+k7Af6tWYoR
	 iSrNDQcW6IK3vBNFRwFZwtei/03O9D0yeGVcKzofWvpSo5B0AodpH/5++yKMzyByMQ
	 PokE4qHEw8uuQ==
Date: Tue, 13 Feb 2024 12:59:52 +0000
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robdclark@gmail.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] Revert "iommu/arm-smmu: Convert to domain_alloc_paging()"
Message-ID: <20240213125951.GB28844@willie-the-truck>
References: <20240213-iommu-revert-domain-alloc-v1-1-325ff55dece4@linaro.org>
 <20240213121257.GI765010@ziepe.ca>
 <20240213121934.GA28726@willie-the-truck>
 <20240213125303.GJ765010@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213125303.GJ765010@ziepe.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Feb 13, 2024 at 08:53:03AM -0400, Jason Gunthorpe wrote:
> On Tue, Feb 13, 2024 at 12:19:34PM +0000, Will Deacon wrote:
> > > > @@ -875,15 +879,6 @@ static struct iommu_domain *arm_smmu_domain_alloc_paging(struct device *dev)
> > > >  	mutex_init(&smmu_domain->init_mutex);
> > > >  	spin_lock_init(&smmu_domain->cb_lock);
> > > >  
> > > > -	if (dev) {
> > > > -		struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
> > > > -
> > > > -		if (arm_smmu_init_domain_context(smmu_domain, cfg->smmu, dev)) {
> > > > -			kfree(smmu_domain);
> > > > -			return NULL;
> > > > -		}
> > > > -	}
> > > > -
> > > >  	return &smmu_domain->domain;
> > > >  }
> > > 
> > > Everything else is fine, you already tested with that arrangement.
> > 
> > Partial reverts are a recipe for confusion, so I'll take this and if you'd
> > like to bring back some of the hunks, please can you send a patch on top
> > that does that?
> 
> The typical kernel standard is to fix bugs in patches and only reach
> for a wholesale revert if the community is struggling with bug
> fixing. Dmitry already tested removing that hunk, Robin explained the
> issue, we understand the bug fix is to remove the
> arm_smmu_init_domain_context() call. Nothing justifies a full scale
> revert.

I can't say I'm aware of any consensus for how to handle this, to be
completely honest with you. I just personally see a lot of benefit in
reverting to a known-good state, especially when the revert has been
posted by the bug reporter. Then we can add stuff on top of that known
good state without having to worry about any other problems that we're
yet to uncover. Doesn't really sound controversial...

> I'll send another patch if you want, but it seems like a waste of all
> our time.

It's a bug fix, of course it's a waste of time! We're talking minutes
though, right?

Will

