Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 503E33C42AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jul 2021 06:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbhGLEMr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jul 2021 00:12:47 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:64272 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229465AbhGLEMr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jul 2021 00:12:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626062999; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=HPk2fk17LJV6t8Nptb5i9ROY3EZisk/sI3PRE0KGEbM=;
 b=dSsoZ11kUKYdn03T/KxubkzmnZv1pTY9ZBlhpURKIWa3cgnPtafM2yro/Bztjn5v9SRcOUzx
 OSOWtW0d+AkQvJet5Nab0WDyiMXvl9ENmxXpVgHBLa5M1PaFFvJAkN36a4A4rr4nr8gYfNy5
 6MGRaWN5XA744ttEO+m8Iz35MZg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60ebc07f3a8b6d0a458126c6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 12 Jul 2021 04:09:35
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0DE9AC43143; Mon, 12 Jul 2021 04:09:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6904CC433D3;
        Mon, 12 Jul 2021 04:09:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 12 Jul 2021 09:39:33 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCHv3] iommu/arm-smmu: Optimize ->tlb_flush_walk() for qcom
 implementation
In-Reply-To: <20210623134201.16140-1-saiprakash.ranjan@codeaurora.org>
References: <20210623134201.16140-1-saiprakash.ranjan@codeaurora.org>
Message-ID: <ee8314e4752aa777131dda22c6f4e9ef@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Robin,

On 2021-06-23 19:12, Sai Prakash Ranjan wrote:
> Currently for iommu_unmap() of large scatter-gather list with page size
> elements, the majority of time is spent in flushing of partial walks in
> __arm_lpae_unmap() which is a VA based TLB invalidation invalidating
> page-by-page on iommus like arm-smmu-v2 (TLBIVA).
> 
> For example: to unmap a 32MB scatter-gather list with page size 
> elements
> (8192 entries), there are 16->2MB buffer unmaps based on the pgsize 
> (2MB
> for 4K granule) and each of 2MB will further result in 512 TLBIVAs 
> (2MB/4K)
> resulting in a total of 8192 TLBIVAs (512*16) for 16->2MB causing a 
> huge
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
> This is further reduced once the map/unmap_pages() support gets in 
> which
> will result in just 1 TLBIASID as compared to 16 TLBIASIDs.
> 
> Real world data also shows big difference in unmap performance as 
> below:
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
>  * Use a new set of iommu_flush_ops->arm_smmu_s1_tlb_impl_ops and use
> it for qcom impl
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
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
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
> @@ -146,6 +148,8 @@ static int qcom_adreno_smmu_init_context(struct
> arm_smmu_domain *smmu_domain,
>  {
>  	struct adreno_smmu_priv *priv;
> 
> +	pgtbl_cfg->tlb = &arm_smmu_s1_tlb_impl_ops;
> +
>  	/* Only enable split pagetables for the GPU device (SID 0) */
>  	if (!qcom_adreno_smmu_is_gpu_device(dev))
>  		return 0;
> @@ -185,6 +189,14 @@ static const struct of_device_id
> qcom_smmu_client_of_match[] __maybe_unused = {
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
>  	unsigned int last_s2cr = ARM_SMMU_GR0_S2CR(smmu->num_mapping_groups - 
> 1);
> @@ -308,6 +320,7 @@ static int qcom_smmu500_reset(struct 
> arm_smmu_device *smmu)
>  }
> 
>  static const struct arm_smmu_impl qcom_smmu_impl = {
> +	.init_context = qcom_smmu_init_context,
>  	.cfg_probe = qcom_smmu_cfg_probe,
>  	.def_domain_type = qcom_smmu_def_domain_type,
>  	.reset = qcom_smmu500_reset,
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index d3c6f54110a5..f3845e822565 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -341,6 +341,12 @@ static void arm_smmu_tlb_add_page_s1(struct
> iommu_iotlb_gather *gather,
>  				  ARM_SMMU_CB_S1_TLBIVAL);
>  }
> 
> +static void arm_smmu_tlb_inv_walk_impl_s1(unsigned long iova, size_t 
> size,
> +				     size_t granule, void *cookie)
> +{
> +	arm_smmu_tlb_inv_context_s1(cookie);
> +}
> +
>  static void arm_smmu_tlb_inv_walk_s2(unsigned long iova, size_t size,
>  				     size_t granule, void *cookie)
>  {
> @@ -388,6 +394,12 @@ static const struct iommu_flush_ops 
> arm_smmu_s1_tlb_ops = {
>  	.tlb_add_page	= arm_smmu_tlb_add_page_s1,
>  };
> 
> +const struct iommu_flush_ops arm_smmu_s1_tlb_impl_ops = {
> +	.tlb_flush_all	= arm_smmu_tlb_inv_context_s1,
> +	.tlb_flush_walk	= arm_smmu_tlb_inv_walk_impl_s1,
> +	.tlb_add_page	= arm_smmu_tlb_add_page_s1,
> +};
> +
>  static const struct iommu_flush_ops arm_smmu_s2_tlb_ops_v2 = {
>  	.tlb_flush_all	= arm_smmu_tlb_inv_context_s2,
>  	.tlb_flush_walk	= arm_smmu_tlb_inv_walk_s2,
> @@ -703,7 +715,10 @@ static int arm_smmu_init_domain_context(struct
> iommu_domain *domain,
>  			ias = min(ias, 32UL);
>  			oas = min(oas, 32UL);
>  		}
> -		smmu_domain->flush_ops = &arm_smmu_s1_tlb_ops;
> +		if (!iommu_get_dma_strict(domain))
> +			smmu_domain->flush_ops = &arm_smmu_s1_tlb_impl_ops;
> +		else
> +			smmu_domain->flush_ops = &arm_smmu_s1_tlb_ops;
>  		break;
>  	case ARM_SMMU_DOMAIN_NESTED:
>  		/*

Any review comments on this version?

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
