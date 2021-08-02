Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAF183DDCA0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Aug 2021 17:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234741AbhHBPnZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 11:43:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:49464 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235032AbhHBPnX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 11:43:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C4B9610FB;
        Mon,  2 Aug 2021 15:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627918994;
        bh=6cailuMkhyBB9d0ZTXadcfD6Sa05EeQ6lw5qH7dMuws=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pf9qXWt9jzUmsOIxUZMGoBwmfg6lOCMSQDgbmWNLeol5ZxayXozJxGJTpFnYXOqSc
         9ERJiHSI9np8gNmQycu5nNPm6sBuGnpN2us3cH+y12VkfaJNP1mZT4GtmejgvcdToO
         iT34gdRyg78rKk2bp0mR9fdfTqGH1cypfI72Eg8cZHESTI5Jn7h4oubLmijjA8ZHa5
         XDBs7Si3CwX8mkLzErFNYIzwvOz2AinoGl8HA5FTpcRQEAQabndmk3Z+0WIOGHSpGz
         dBwdxdlXuutyyKBnwESJv+14VPz2DFMki2hr5UwsEtK7uM+IMA6xJlrLhjuu4/+19z
         OteQNoqO7koyA==
Date:   Mon, 2 Aug 2021 16:43:08 +0100
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
Message-ID: <20210802154308.GG28735@willie-the-truck>
References: <20210623134201.16140-1-saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210623134201.16140-1-saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 23, 2021 at 07:12:01PM +0530, Sai Prakash Ranjan wrote:
> Currently for iommu_unmap() of large scatter-gather list with page size
> elements, the majority of time is spent in flushing of partial walks in
> __arm_lpae_unmap() which is a VA based TLB invalidation invalidating
> page-by-page on iommus like arm-smmu-v2 (TLBIVA).
> 
> For example: to unmap a 32MB scatter-gather list with page size elements
> (8192 entries), there are 16->2MB buffer unmaps based on the pgsize (2MB
> for 4K granule) and each of 2MB will further result in 512 TLBIVAs (2MB/4K)
> resulting in a total of 8192 TLBIVAs (512*16) for 16->2MB causing a huge
> overhead.
> 
> On qcom implementation, there are several performance improvements for
> TLB cache invalidations in HW like wait-for-safe (for realtime clients
> such as camera and display) and few others to allow for cache
> lookups/updates when TLBI is in progress for the same context bank.
> So the cost of over-invalidation is less compared to the unmap latency
> on several usecases like camera which deals with large buffers. So,
> ASID based TLB invalidations (TLBIASID) can be used to invalidate the
> entire context for partial walk flush thereby improving the unmap
> latency.
> 
> Non-strict mode can use this by default for all platforms given its
> all about over-invalidation saving time on individual unmaps and
> non-deterministic generally.
> 
> For this example of 32MB scatter-gather list unmap, this change results
> in just 16 ASID based TLB invalidations (TLBIASIDs) as opposed to 8192
> TLBIVAs thereby increasing the performance of unmaps drastically.
> 
> Test on QTI SM8150 SoC for 10 iterations of iommu_{map_sg}/unmap:
> (average over 10 iterations)
> 
> Before this optimization:
> 
>     size        iommu_map_sg      iommu_unmap
>       4K            2.067 us         1.854 us
>      64K            9.598 us         8.802 us
>       1M          148.890 us       130.718 us
>       2M          305.864 us        67.291 us
>      12M         1793.604 us       390.838 us
>      16M         2386.848 us       518.187 us
>      24M         3563.296 us       775.989 us
>      32M         4747.171 us      1033.364 us
> 
> After this optimization:
> 
>     size        iommu_map_sg      iommu_unmap
>       4K            1.723 us         1.765 us
>      64K            9.880 us         8.869 us
>       1M          155.364 us       135.223 us
>       2M          303.906 us         5.385 us
>      12M         1786.557 us        21.250 us
>      16M         2391.890 us        27.437 us
>      24M         3570.895 us        39.937 us
>      32M         4755.234 us        51.797 us
> 
> This is further reduced once the map/unmap_pages() support gets in which
> will result in just 1 TLBIASID as compared to 16 TLBIASIDs.
> 
> Real world data also shows big difference in unmap performance as below:
> 
> There were reports of camera frame drops because of high overhead in
> iommu unmap without this optimization because of frequent unmaps issued
> by camera of about 100MB/s taking more than 100ms thereby causing frame
> drops.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
> 
> Changes in v3:
>  * Move the logic to arm-smmu driver from io-pgtable (Robin)
>  * Use a new set of iommu_flush_ops->arm_smmu_s1_tlb_impl_ops and use it for qcom impl
> 
> Changes in v2:
>  * Add a quirk to choose tlb_flush_all in partial walk flush
>  * Set the quirk for QTI SoC implementation
> 
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 13 +++++++++++++
>  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 17 ++++++++++++++++-
>  2 files changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 7771d40176de..218c71465819 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -10,6 +10,8 @@
>  
>  #include "arm-smmu.h"
>  
> +extern const struct iommu_flush_ops arm_smmu_s1_tlb_impl_ops;
> +
>  struct qcom_smmu {
>  	struct arm_smmu_device smmu;
>  	bool bypass_quirk;
> @@ -146,6 +148,8 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>  {
>  	struct adreno_smmu_priv *priv;
>  
> +	pgtbl_cfg->tlb = &arm_smmu_s1_tlb_impl_ops;
> +
>  	/* Only enable split pagetables for the GPU device (SID 0) */
>  	if (!qcom_adreno_smmu_is_gpu_device(dev))
>  		return 0;
> @@ -185,6 +189,14 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
>  	{ }
>  };
>  
> +static int qcom_smmu_init_context(struct arm_smmu_domain *smmu_domain,
> +		struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
> +{
> +	pgtbl_cfg->tlb = &arm_smmu_s1_tlb_impl_ops;
> +
> +	return 0;
> +}
> +
>  static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
>  {
>  	unsigned int last_s2cr = ARM_SMMU_GR0_S2CR(smmu->num_mapping_groups - 1);
> @@ -308,6 +320,7 @@ static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
>  }
>  
>  static const struct arm_smmu_impl qcom_smmu_impl = {
> +	.init_context = qcom_smmu_init_context,
>  	.cfg_probe = qcom_smmu_cfg_probe,
>  	.def_domain_type = qcom_smmu_def_domain_type,
>  	.reset = qcom_smmu500_reset,
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index d3c6f54110a5..f3845e822565 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -341,6 +341,12 @@ static void arm_smmu_tlb_add_page_s1(struct iommu_iotlb_gather *gather,
>  				  ARM_SMMU_CB_S1_TLBIVAL);
>  }
>  
> +static void arm_smmu_tlb_inv_walk_impl_s1(unsigned long iova, size_t size,
> +				     size_t granule, void *cookie)
> +{
> +	arm_smmu_tlb_inv_context_s1(cookie);
> +}
> +
>  static void arm_smmu_tlb_inv_walk_s2(unsigned long iova, size_t size,
>  				     size_t granule, void *cookie)
>  {
> @@ -388,6 +394,12 @@ static const struct iommu_flush_ops arm_smmu_s1_tlb_ops = {
>  	.tlb_add_page	= arm_smmu_tlb_add_page_s1,
>  };
>  
> +const struct iommu_flush_ops arm_smmu_s1_tlb_impl_ops = {
> +	.tlb_flush_all	= arm_smmu_tlb_inv_context_s1,
> +	.tlb_flush_walk	= arm_smmu_tlb_inv_walk_impl_s1,
> +	.tlb_add_page	= arm_smmu_tlb_add_page_s1,
> +};

Hmm, dunno about this. Wouldn't it be a lot cleaner if the tlb_flush_walk
callbacks just did the right thing based on the smmu_domain (maybe in the
arm_smmu_cfg?) rather than having an entirely new set of ops just because
they're const and you can't overide the bit you want?

I don't think there's really an awful lot qcom-specific about the principle
here -- there's a trade-off between over-invalidation and invalidation
latency. That happens on the CPU as well.

Will
