Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2F02EF739
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 19:20:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728521AbhAHSTR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 13:19:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:57800 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728405AbhAHSTQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 13:19:16 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1BB9723A7A;
        Fri,  8 Jan 2021 18:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610129916;
        bh=1EJDjUMPNL/dY0XEEkmAoh+OfzkB5yqH0QpcKX27KdQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gOAaZKMBGevPezWNeCeeRPpwnW3ki8JMZ3ojjuJnY5SMO0nydVHO/xXY0yA6k6eMc
         ruSWe9plVJ0Zo3oSx5nQvnje1e0kI3FdZX3Q/dEf1lExhqP7XIq74eEnikkOOKavco
         duc/mpql1uOwc/kZucSz5iG+biQbSXdzPhSuI/k5ZNagSsk8YmI7PObnEnJpakgRje
         Aw/uLHiRUU0A3VHsVUPnqKqPOC0plw2zNgYfVDEr1sriYbuyMku128jorI5DcaHf7j
         /9Cnj8jfwv+6xqPDZBioVAfeT4kfCrcS66RFA22SqEGYaJSdqC+E0nWaV8k3bnE6Hx
         4LHFeRNRBeeFQ==
Date:   Fri, 8 Jan 2021 18:18:30 +0000
From:   Will Deacon <will@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     isaacm@codeaurora.org, Rob Clark <robdclark@gmail.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        iommu@lists.linux-foundation.org,
        Robin Murphy <robin.murphy@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] iommu/io-pgtable-arm: Allow non-coherent masters to use
 system cache
Message-ID: <20210108181830.GA5457@willie-the-truck>
References: <20201224064007.2339-1-saiprakash.ranjan@codeaurora.org>
 <20210106115615.GA1763@willie-the-truck>
 <cfced52002337025088a64aa159760b2@codeaurora.org>
 <8cfefbff135a5287d177b6ab2ccc3304@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cfefbff135a5287d177b6ab2ccc3304@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 08, 2021 at 11:17:25AM +0530, Sai Prakash Ranjan wrote:
> On 2021-01-07 22:27, isaacm@codeaurora.org wrote:
> > On 2021-01-06 03:56, Will Deacon wrote:
> > > On Thu, Dec 24, 2020 at 12:10:07PM +0530, Sai Prakash Ranjan wrote:
> > > > commit ecd7274fb4cd ("iommu: Remove unused IOMMU_SYS_CACHE_ONLY
> > > > flag")
> > > > removed unused IOMMU_SYS_CACHE_ONLY prot flag and along with it went
> > > > the memory type setting required for the non-coherent masters to use
> > > > system cache. Now that system cache support for GPU is added, we will
> > > > need to mark the memory as normal sys-cached for GPU to use
> > > > system cache.
> > > > Without this, the system cache lines are not allocated for GPU.
> > > > We use
> > > > the IO_PGTABLE_QUIRK_ARM_OUTER_WBWA quirk instead of a page
> > > > protection
> > > > flag as the flag cannot be exposed via DMA api because of no in-tree
> > > > users.
> > > > 
> > > > Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> > > > ---
> > > >  drivers/iommu/io-pgtable-arm.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > > 
> > > > diff --git a/drivers/iommu/io-pgtable-arm.c
> > > > b/drivers/iommu/io-pgtable-arm.c
> > > > index 7c9ea9d7874a..3fb7de8304a2 100644
> > > > --- a/drivers/iommu/io-pgtable-arm.c
> > > > +++ b/drivers/iommu/io-pgtable-arm.c
> > > > @@ -415,6 +415,9 @@ static arm_lpae_iopte
> > > > arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
> > > >  		else if (prot & IOMMU_CACHE)
> > > >  			pte |= (ARM_LPAE_MAIR_ATTR_IDX_CACHE
> > > >  				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
> > > > +		else if (data->iop.cfg.quirks & IO_PGTABLE_QUIRK_ARM_OUTER_WBWA)
> > > > +			pte |= (ARM_LPAE_MAIR_ATTR_IDX_INC_OCACHE
> > > > +				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
> > > >  	}
> > > 
> > While this approach of enabling system cache globally for both page
> > tables and other buffers
> > works for the GPU usecase, this isn't ideal for other clients that use
> > system cache. For example,
> > video clients only want to cache a subset of their buffers in the
> > system cache, due to the sizing constraint
> > imposed by how much of the system cache they can use. So, it would be
> > ideal to have
> > a way of expressing the desire to use the system cache on a per-buffer
> > basis. Additionally,
> > our video clients use the DMA layer, and since the requirement is for
> > caching in the system cache
> > to be a per buffer attribute, it seems like we would have to have a
> > DMA attribute to express
> > this on a per-buffer basis.
> > 
> 
> I did bring this up initially [1], also where is this video client
> in upstream? AFAIK, only system cache user in upstream is GPU.
> We cannot add any DMA attribute unless there is any user upstream
> as per [2], so when the support for such a client is added, wouldn't
> ((data->iop.cfg.quirks & IO_PGTABLE_QUIRK_ARM_OUTER_WBWA) || PROT_FLAG)
> work?

Hmm, I think this is another case where we need to separate out the
page-table walker attributes from the access attributes. Currently,
IO_PGTABLE_QUIRK_ARM_OUTER_WBWA applies _only_ to the page-table walker
and I don't think it makes any sense for that to be per-buffer (how would
you even manage that?). However, if we want to extend this to data accesses
and we know that there are valid use-cases where this should be per-buffer,
then shoe-horning it in with the walker quirk does not feel like the best
thing to do.

As a starting point, we could:

  1. Rename IO_PGTABLE_QUIRK_ARM_OUTER_WBWA to IO_PGTABLE_QUIRK_PTW_LLC
  2. Add a new prot flag IOMMU_LLC
  3. Have the GPU pass the new prot for its buffer mappings

Does that work? One thing I'm not sure about is whether IOMMU_CACHE should
imply IOMMU_LLC, or whether there is a use-case for inner-cacheable, outer
non-cacheable mappings for a coherent device. Have you ever seen that sort
of thing before?

Will
