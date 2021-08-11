Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BACA23E8E99
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 12:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232644AbhHKKal (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 06:30:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:59166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231752AbhHKKal (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 06:30:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C4DF600CD;
        Wed, 11 Aug 2021 10:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628677817;
        bh=DPispVJ9qoY1JKmxxQTpbPzkjmY6Ar4brMVi71xV4kY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f7I+tsCrb+71iG4L1M4bsFpPhDi0JuwrDajcHTyjqLk2LZEgPP2nXxPO7kVfIkbEP
         CsOdpXD74WoEgNYxbP/PW8HVl8GaV02dp+s7QjYJvy/oxV5/DqcqOIcagtKEeSD6gc
         Nu2tBnQXPNllAyOqBVMD8Ahi8PMEV8tBPS0m328acGXkuyLNF2XVkvEC63uOgp/r3F
         XI65fhpXCbQfW3bZQqon2OHYM/jX4e7lJLn4vezDY1QN72wqvK0lINdIXs071X0Iel
         lu7F/K1rsFAufE75dur2KWq8GURapU+O1Bvpe3OnQmxkCdPGGuybzMn/+0qWpsUGRA
         1p2axqEU2pscA==
Date:   Wed, 11 Aug 2021 11:30:12 +0100
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
Subject: Re: [PATCHv4] iommu/arm-smmu: Optimize ->tlb_flush_walk() for qcom
 implementation
Message-ID: <20210811103011.GD4426@willie-the-truck>
References: <20210811060725.25221-1-saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210811060725.25221-1-saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 11, 2021 at 11:37:25AM +0530, Sai Prakash Ranjan wrote:
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index f7da8953afbe..3904b598e0f9 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -327,9 +327,16 @@ static void arm_smmu_tlb_inv_range_s2(unsigned long iova, size_t size,
>  static void arm_smmu_tlb_inv_walk_s1(unsigned long iova, size_t size,
>  				     size_t granule, void *cookie)
>  {
> -	arm_smmu_tlb_inv_range_s1(iova, size, granule, cookie,
> -				  ARM_SMMU_CB_S1_TLBIVA);
> -	arm_smmu_tlb_sync_context(cookie);
> +	struct arm_smmu_domain *smmu_domain = cookie;
> +	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> +
> +	if (cfg->flush_walk_prefer_tlbiasid) {
> +		arm_smmu_tlb_inv_context_s1(cookie);

Hmm, this introduces an unconditional wmb() if tlbiasid is preferred. I
think that should be predicated on ARM_SMMU_FEAT_COHERENT_WALK like it is
for the by-VA ops. Worth doing as a separate patch.

> +	} else {
> +		arm_smmu_tlb_inv_range_s1(iova, size, granule, cookie,
> +					  ARM_SMMU_CB_S1_TLBIVA);
> +		arm_smmu_tlb_sync_context(cookie);
> +	}
>  }
>  
>  static void arm_smmu_tlb_add_page_s1(struct iommu_iotlb_gather *gather,
> @@ -765,8 +772,10 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>  		.iommu_dev	= smmu->dev,
>  	};
>  
> -	if (!iommu_get_dma_strict(domain))
> +	if (!iommu_get_dma_strict(domain)) {
>  		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
> +		cfg->flush_walk_prefer_tlbiasid = true;

This is going to interact badly with Robin's series to allow dynamic
transition to non-strict mode, as we don't have a mechanism to switch
over to the by-ASID behaviour. Yes, it should _work_, but it's ugly having
different TLBI behaviour just because of the how the domain became
non-strict.

Robin -- I think this originated from your idea at [1]. Any idea how to make
it work with your other series, or shall we drop this part for now and leave
the TLB invalidation behaviour the same for now?

Will

[1] https://lore.kernel.org/r/da62ff1c-9b49-34d3-69a1-1a674e4a30f7@arm.com
