Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5F613E8290
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 20:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232665AbhHJSKp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 14:10:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:35564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236330AbhHJSI4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 14:08:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CBEB660527;
        Tue, 10 Aug 2021 18:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628618913;
        bh=ZLjQ+E7kEbaxwXSfj/EjKh4hS0Qf8184pyly8Dfhtm4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oHScJLoUWHHobKc83Z0tPXc2r9y0CA/eD2Uok4ZlwwgIe4/UN910YCRxqB6nB0jm9
         URDOjjPcubG2CCDl7foJTCOW1DTzpI1JVLpBiJ62tnRez4aNcMtQovsfsLdlhnSv++
         rv3rqtoByIcxveM+llHj4M5U/Am5K4WjICeUGecvRJjpgoQH6zn/X92o2lfnM67dvc
         MA1oHcn4IUgwXs23F+cF1PlSNWsZYWXgQZuoYSx8GhscV70l+ngNABd44RskpFnKYX
         8Ock0OweYWvcDISqZzYBz9m2ZcCCBTXerF4YzRzGaMk8u2HXkhoCz4VlTwWHY2smk4
         n/ZBHX9SV9UWA==
Date:   Tue, 10 Aug 2021 19:08:28 +0100
From:   Will Deacon <will@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCHv3] iommu/arm-smmu: Optimize ->tlb_flush_walk() for qcom
 implementation
Message-ID: <20210810180827.GA3296@willie-the-truck>
References: <20210623134201.16140-1-saiprakash.ranjan@codeaurora.org>
 <20210802154308.GG28735@willie-the-truck>
 <584e31653ee0e01d249e414dbbc816ea@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <584e31653ee0e01d249e414dbbc816ea@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 03, 2021 at 11:09:17AM +0530, Sai Prakash Ranjan wrote:
> On 2021-08-02 21:13, Will Deacon wrote:
> > On Wed, Jun 23, 2021 at 07:12:01PM +0530, Sai Prakash Ranjan wrote:
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > index d3c6f54110a5..f3845e822565 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > @@ -341,6 +341,12 @@ static void arm_smmu_tlb_add_page_s1(struct
> > > iommu_iotlb_gather *gather,
> > >  				  ARM_SMMU_CB_S1_TLBIVAL);
> > >  }
> > > 
> > > +static void arm_smmu_tlb_inv_walk_impl_s1(unsigned long iova,
> > > size_t size,
> > > +				     size_t granule, void *cookie)
> > > +{
> > > +	arm_smmu_tlb_inv_context_s1(cookie);
> > > +}
> > > +
> > >  static void arm_smmu_tlb_inv_walk_s2(unsigned long iova, size_t size,
> > >  				     size_t granule, void *cookie)
> > >  {
> > > @@ -388,6 +394,12 @@ static const struct iommu_flush_ops
> > > arm_smmu_s1_tlb_ops = {
> > >  	.tlb_add_page	= arm_smmu_tlb_add_page_s1,
> > >  };
> > > 
> > > +const struct iommu_flush_ops arm_smmu_s1_tlb_impl_ops = {
> > > +	.tlb_flush_all	= arm_smmu_tlb_inv_context_s1,
> > > +	.tlb_flush_walk	= arm_smmu_tlb_inv_walk_impl_s1,
> > > +	.tlb_add_page	= arm_smmu_tlb_add_page_s1,
> > > +};
> > 
> > Hmm, dunno about this. Wouldn't it be a lot cleaner if the
> > tlb_flush_walk
> > callbacks just did the right thing based on the smmu_domain (maybe in
> > the
> > arm_smmu_cfg?) rather than having an entirely new set of ops just
> > because
> > they're const and you can't overide the bit you want?
> > 
> > I don't think there's really an awful lot qcom-specific about the
> > principle
> > here -- there's a trade-off between over-invalidation and invalidation
> > latency. That happens on the CPU as well.
> > 
> 
> Sorry didn't understand, based on smmu_domain what? How do we make
> this implementation specific? Do you mean something like a quirk?
> The reason we didn't make this common was because nvidia folks weren't
> so happy with that, you can find the discussion in this thread [1].
> 
> [1] https://lore.kernel.org/lkml/20210609145315.25750-1-saiprakash.ranjan@codeaurora.org/

The ->tlb_flush_walk() callbacks take a 'void *cookie' which, for this
driver, is a 'struct arm_smmu_domain *'. From that, you can get to the
'struct arm_smmu_cfg' which could have something as coarse as:

	bool	flush_walk_prefer_tlbiasid;

which you can set when you initialise the domain (maybe in the
->init_context callback?). It shouldn't affect anybody else.

Will
