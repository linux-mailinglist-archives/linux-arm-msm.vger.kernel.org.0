Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0E334F9F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2019 20:11:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbfFDSLR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jun 2019 14:11:17 -0400
Received: from foss.arm.com ([217.140.101.70]:49124 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725933AbfFDSLR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jun 2019 14:11:17 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA77D80D;
        Tue,  4 Jun 2019 11:11:15 -0700 (PDT)
Received: from [10.1.196.75] (e110467-lin.cambridge.arm.com [10.1.196.75])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB4B13F690;
        Tue,  4 Jun 2019 11:11:10 -0700 (PDT)
Subject: Re: [PATCH v3 1/4] iommu: Add gfp parameter to iommu_ops::map
To:     Tom Murphy <tmurphy@arista.com>, iommu@lists.linux-foundation.org
Cc:     murphyt7@tcd.ie, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will.deacon@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20190506185207.31069-1-tmurphy@arista.com>
 <20190506185207.31069-2-tmurphy@arista.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <33a1e3c1-1906-9e45-d060-e7998424973b@arm.com>
Date:   Tue, 4 Jun 2019 19:11:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190506185207.31069-2-tmurphy@arista.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/05/2019 19:52, Tom Murphy wrote:
> Add a gfp_t parameter to the iommu_ops::map function.
> Remove the needless locking in the AMD iommu driver.
> 
> The iommu_ops::map function (or the iommu_map function which calls it)
> was always supposed to be sleepable (according to Joerg's comment in
> this thread: https://lore.kernel.org/patchwork/patch/977520/ ) and so
> should probably have had a "might_sleep()" since it was written. However
> currently the dma-iommu api can call iommu_map in an atomic context,
> which it shouldn't do. This doesn't cause any problems because any iommu
> driver which uses the dma-iommu api uses gfp_atomic in it's
> iommu_ops::map function. But doing this wastes the memory allocators
> atomic pools.

Hmm, in some cases iommu_ops::unmap may need to allocate as well, 
primarily if it needs to split a hugepage mapping. Should we pass flags 
through there as well, or are we prepared to assume that that case will 
happen rarely enough that it's fair to just assume GFP_ATOMIC? It won't 
happen for DMA ops, but it's conceivable that other users such as GPU 
drivers might make partial unmaps, and I doubt we could totally rule out 
the wackiest ones doing so from non-sleeping contexts.

Robin.

> We can remove the mutex lock from amd_iommu_map and amd_iommu_unmap.
> iommu_map doesn’t lock while mapping and so no two calls should touch
> the same iova range. The AMD driver already handles the page table page
> allocations without locks so we can safely remove the locks.
> 
> Signed-off-by: Tom Murphy <tmurphy@arista.com>
> ---
>   drivers/iommu/amd_iommu.c      | 14 ++++-------
>   drivers/iommu/arm-smmu-v3.c    |  2 +-
>   drivers/iommu/arm-smmu.c       |  2 +-
>   drivers/iommu/dma-iommu.c      |  6 ++---
>   drivers/iommu/exynos-iommu.c   |  2 +-
>   drivers/iommu/intel-iommu.c    |  2 +-
>   drivers/iommu/iommu.c          | 43 +++++++++++++++++++++++++++++-----
>   drivers/iommu/ipmmu-vmsa.c     |  2 +-
>   drivers/iommu/msm_iommu.c      |  2 +-
>   drivers/iommu/mtk_iommu.c      |  2 +-
>   drivers/iommu/mtk_iommu_v1.c   |  2 +-
>   drivers/iommu/omap-iommu.c     |  2 +-
>   drivers/iommu/qcom_iommu.c     |  2 +-
>   drivers/iommu/rockchip-iommu.c |  2 +-
>   drivers/iommu/s390-iommu.c     |  2 +-
>   drivers/iommu/tegra-gart.c     |  2 +-
>   drivers/iommu/tegra-smmu.c     |  2 +-
>   include/linux/iommu.h          | 21 ++++++++++++++++-
>   18 files changed, 78 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
> index ebd062522cf5..ea3a5dc61bb0 100644
> --- a/drivers/iommu/amd_iommu.c
> +++ b/drivers/iommu/amd_iommu.c
> @@ -3092,7 +3092,8 @@ static int amd_iommu_attach_device(struct iommu_domain *dom,
>   }
>   
>   static int amd_iommu_map(struct iommu_domain *dom, unsigned long iova,
> -			 phys_addr_t paddr, size_t page_size, int iommu_prot)
> +			 phys_addr_t paddr, size_t page_size, int iommu_prot,
> +			 gfp_t gfp)
>   {
>   	struct protection_domain *domain = to_pdomain(dom);
>   	int prot = 0;
> @@ -3106,9 +3107,7 @@ static int amd_iommu_map(struct iommu_domain *dom, unsigned long iova,
>   	if (iommu_prot & IOMMU_WRITE)
>   		prot |= IOMMU_PROT_IW;
>   
> -	mutex_lock(&domain->api_lock);
> -	ret = iommu_map_page(domain, iova, paddr, page_size, prot, GFP_KERNEL);
> -	mutex_unlock(&domain->api_lock);
> +	ret = iommu_map_page(domain, iova, paddr, page_size, prot, gfp);
>   
>   	domain_flush_np_cache(domain, iova, page_size);
>   
> @@ -3119,16 +3118,11 @@ static size_t amd_iommu_unmap(struct iommu_domain *dom, unsigned long iova,
>   			   size_t page_size)
>   {
>   	struct protection_domain *domain = to_pdomain(dom);
> -	size_t unmap_size;
>   
>   	if (domain->mode == PAGE_MODE_NONE)
>   		return 0;
>   
> -	mutex_lock(&domain->api_lock);
> -	unmap_size = iommu_unmap_page(domain, iova, page_size);
> -	mutex_unlock(&domain->api_lock);
> -
> -	return unmap_size;
> +	return iommu_unmap_page(domain, iova, page_size);
>   }
>   
>   static phys_addr_t amd_iommu_iova_to_phys(struct iommu_domain *dom,
> diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
> index d3880010c6cf..e5c48089b49f 100644
> --- a/drivers/iommu/arm-smmu-v3.c
> +++ b/drivers/iommu/arm-smmu-v3.c
> @@ -1777,7 +1777,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>   }
>   
>   static int arm_smmu_map(struct iommu_domain *domain, unsigned long iova,
> -			phys_addr_t paddr, size_t size, int prot)
> +			phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
>   {
>   	struct io_pgtable_ops *ops = to_smmu_domain(domain)->pgtbl_ops;
>   
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 045d93884164..2d50db55b788 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -1286,7 +1286,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>   }
>   
>   static int arm_smmu_map(struct iommu_domain *domain, unsigned long iova,
> -			phys_addr_t paddr, size_t size, int prot)
> +			phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
>   {
>   	struct io_pgtable_ops *ops = to_smmu_domain(domain)->pgtbl_ops;
>   	struct arm_smmu_device *smmu = to_smmu_domain(domain)->smmu;
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index fa5713a4f6f8..7a96c2c8f56b 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -440,7 +440,7 @@ static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
>   	if (!iova)
>   		return DMA_MAPPING_ERROR;
>   
> -	if (iommu_map(domain, iova, phys - iova_off, size, prot)) {
> +	if (iommu_map_atomic(domain, iova, phys - iova_off, size, prot)) {
>   		iommu_dma_free_iova(cookie, iova, size);
>   		return DMA_MAPPING_ERROR;
>   	}
> @@ -641,7 +641,7 @@ static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
>   			arch_dma_prep_coherent(sg_page(sg), sg->length);
>   	}
>   
> -	if (iommu_map_sg(domain, iova, sgt.sgl, sgt.orig_nents, ioprot)
> +	if (iommu_map_sg_atomic(domain, iova, sgt.sgl, sgt.orig_nents, ioprot)
>   			< size)
>   		goto out_free_sg;
>   
> @@ -1003,7 +1003,7 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
>   	 * We'll leave any physical concatenation to the IOMMU driver's
>   	 * implementation - it knows better than we do.
>   	 */
> -	if (iommu_map_sg(domain, iova, sg, nents, prot) < iova_len)
> +	if (iommu_map_sg_atomic(domain, iova, sg, nents, prot) < iova_len)
>   		goto out_free_iova;
>   
>   	return __finalise_sg(dev, sg, nents, iova);
> diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> index 05c6bc099d62..46414234c179 100644
> --- a/drivers/iommu/exynos-iommu.c
> +++ b/drivers/iommu/exynos-iommu.c
> @@ -1078,7 +1078,7 @@ static int lv2set_page(sysmmu_pte_t *pent, phys_addr_t paddr, size_t size,
>    */
>   static int exynos_iommu_map(struct iommu_domain *iommu_domain,
>   			    unsigned long l_iova, phys_addr_t paddr, size_t size,
> -			    int prot)
> +			    int prot, gfp_t gfp)
>   {
>   	struct exynos_iommu_domain *domain = to_exynos_domain(iommu_domain);
>   	sysmmu_pte_t *entry;
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index 28cb713d728c..4f0ff28f7cb9 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -5137,7 +5137,7 @@ static void intel_iommu_detach_device(struct iommu_domain *domain,
>   
>   static int intel_iommu_map(struct iommu_domain *domain,
>   			   unsigned long iova, phys_addr_t hpa,
> -			   size_t size, int iommu_prot)
> +			   size_t size, int iommu_prot, gfp_t gfp)
>   {
>   	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
>   	u64 max_addr;
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 109de67d5d72..1b49841c177e 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1584,8 +1584,8 @@ static size_t iommu_pgsize(struct iommu_domain *domain,
>   	return pgsize;
>   }
>   
> -int iommu_map(struct iommu_domain *domain, unsigned long iova,
> -	      phys_addr_t paddr, size_t size, int prot)
> +int __iommu_map(struct iommu_domain *domain, unsigned long iova,
> +	      phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
>   {
>   	const struct iommu_ops *ops = domain->ops;
>   	unsigned long orig_iova = iova;
> @@ -1622,8 +1622,8 @@ int iommu_map(struct iommu_domain *domain, unsigned long iova,
>   
>   		pr_debug("mapping: iova 0x%lx pa %pa pgsize 0x%zx\n",
>   			 iova, &paddr, pgsize);
> +		ret = ops->map(domain, iova, paddr, pgsize, prot, gfp);
>   
> -		ret = ops->map(domain, iova, paddr, pgsize, prot);
>   		if (ret)
>   			break;
>   
> @@ -1643,8 +1643,22 @@ int iommu_map(struct iommu_domain *domain, unsigned long iova,
>   
>   	return ret;
>   }
> +
> +int iommu_map(struct iommu_domain *domain, unsigned long iova,
> +	      phys_addr_t paddr, size_t size, int prot)
> +{
> +	might_sleep();
> +	return __iommu_map(domain, iova, paddr, size, prot, GFP_KERNEL);
> +}
>   EXPORT_SYMBOL_GPL(iommu_map);
>   
> +int iommu_map_atomic(struct iommu_domain *domain, unsigned long iova,
> +	      phys_addr_t paddr, size_t size, int prot)
> +{
> +	return __iommu_map(domain, iova, paddr, size, prot, GFP_ATOMIC);
> +}
> +EXPORT_SYMBOL_GPL(iommu_map_atomic);
> +
>   static size_t __iommu_unmap(struct iommu_domain *domain,
>   			    unsigned long iova, size_t size,
>   			    bool sync)
> @@ -1719,8 +1733,9 @@ size_t iommu_unmap_fast(struct iommu_domain *domain,
>   }
>   EXPORT_SYMBOL_GPL(iommu_unmap_fast);
>   
> -size_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
> -		    struct scatterlist *sg, unsigned int nents, int prot)
> +size_t __iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
> +		    struct scatterlist *sg, unsigned int nents, int prot,
> +		    gfp_t gfp)
>   {
>   	size_t len = 0, mapped = 0;
>   	phys_addr_t start;
> @@ -1731,7 +1746,9 @@ size_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
>   		phys_addr_t s_phys = sg_phys(sg);
>   
>   		if (len && s_phys != start + len) {
> -			ret = iommu_map(domain, iova + mapped, start, len, prot);
> +			ret = __iommu_map(domain, iova + mapped, start,
> +					len, prot, gfp);
> +
>   			if (ret)
>   				goto out_err;
>   
> @@ -1759,8 +1776,22 @@ size_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
>   	return 0;
>   
>   }
> +
> +size_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
> +		    struct scatterlist *sg, unsigned int nents, int prot)
> +{
> +	might_sleep();
> +	return __iommu_map_sg(domain, iova, sg, nents, prot, GFP_KERNEL);
> +}
>   EXPORT_SYMBOL_GPL(iommu_map_sg);
>   
> +size_t iommu_map_sg_atomic(struct iommu_domain *domain, unsigned long iova,
> +		    struct scatterlist *sg, unsigned int nents, int prot)
> +{
> +	return __iommu_map_sg(domain, iova, sg, nents, prot, GFP_ATOMIC);
> +}
> +EXPORT_SYMBOL_GPL(iommu_map_sg_atomic);
> +
>   int iommu_domain_window_enable(struct iommu_domain *domain, u32 wnd_nr,
>   			       phys_addr_t paddr, u64 size, int prot)
>   {
> diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> index 9a380c10655e..e005c83d49d8 100644
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -707,7 +707,7 @@ static void ipmmu_detach_device(struct iommu_domain *io_domain,
>   }
>   
>   static int ipmmu_map(struct iommu_domain *io_domain, unsigned long iova,
> -		     phys_addr_t paddr, size_t size, int prot)
> +		     phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
>   {
>   	struct ipmmu_vmsa_domain *domain = to_vmsa_domain(io_domain);
>   
> diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
> index 9fb0eb7a4d02..3f6bf3653aa2 100644
> --- a/drivers/iommu/msm_iommu.c
> +++ b/drivers/iommu/msm_iommu.c
> @@ -508,7 +508,7 @@ static void msm_iommu_detach_dev(struct iommu_domain *domain,
>   }
>   
>   static int msm_iommu_map(struct iommu_domain *domain, unsigned long iova,
> -			 phys_addr_t pa, size_t len, int prot)
> +			 phys_addr_t pa, size_t len, int prot, gfp_t gfp)
>   {
>   	struct msm_priv *priv = to_msm_priv(domain);
>   	unsigned long flags;
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index de3e02277b70..3176b9b54d4d 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -364,7 +364,7 @@ static void mtk_iommu_detach_device(struct iommu_domain *domain,
>   }
>   
>   static int mtk_iommu_map(struct iommu_domain *domain, unsigned long iova,
> -			 phys_addr_t paddr, size_t size, int prot)
> +			 phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
>   {
>   	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
>   	unsigned long flags;
> diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
> index 52b01e3a49df..e7b1907faec1 100644
> --- a/drivers/iommu/mtk_iommu_v1.c
> +++ b/drivers/iommu/mtk_iommu_v1.c
> @@ -303,7 +303,7 @@ static void mtk_iommu_detach_device(struct iommu_domain *domain,
>   }
>   
>   static int mtk_iommu_map(struct iommu_domain *domain, unsigned long iova,
> -			 phys_addr_t paddr, size_t size, int prot)
> +			 phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
>   {
>   	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
>   	unsigned int page_num = size >> MT2701_IOMMU_PAGE_SHIFT;
> diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
> index d2fb347aa4ff..c1d5a71285dc 100644
> --- a/drivers/iommu/omap-iommu.c
> +++ b/drivers/iommu/omap-iommu.c
> @@ -1109,7 +1109,7 @@ static u32 iotlb_init_entry(struct iotlb_entry *e, u32 da, u32 pa, int pgsz)
>   }
>   
>   static int omap_iommu_map(struct iommu_domain *domain, unsigned long da,
> -			  phys_addr_t pa, size_t bytes, int prot)
> +			  phys_addr_t pa, size_t bytes, int prot, gfp_t gfp)
>   {
>   	struct omap_iommu_domain *omap_domain = to_omap_domain(domain);
>   	struct device *dev = omap_domain->dev;
> diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
> index 8cdd3f059513..a01e07a4e76f 100644
> --- a/drivers/iommu/qcom_iommu.c
> +++ b/drivers/iommu/qcom_iommu.c
> @@ -411,7 +411,7 @@ static void qcom_iommu_detach_dev(struct iommu_domain *domain, struct device *de
>   }
>   
>   static int qcom_iommu_map(struct iommu_domain *domain, unsigned long iova,
> -			  phys_addr_t paddr, size_t size, int prot)
> +			  phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
>   {
>   	int ret;
>   	unsigned long flags;
> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
> index 77d4bd93fe4b..aa3507f35107 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -760,7 +760,7 @@ static int rk_iommu_map_iova(struct rk_iommu_domain *rk_domain, u32 *pte_addr,
>   }
>   
>   static int rk_iommu_map(struct iommu_domain *domain, unsigned long _iova,
> -			phys_addr_t paddr, size_t size, int prot)
> +			phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
>   {
>   	struct rk_iommu_domain *rk_domain = to_rk_domain(domain);
>   	unsigned long flags;
> diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
> index 22d4db302c1c..efa6aa68521d 100644
> --- a/drivers/iommu/s390-iommu.c
> +++ b/drivers/iommu/s390-iommu.c
> @@ -265,7 +265,7 @@ static int s390_iommu_update_trans(struct s390_domain *s390_domain,
>   }
>   
>   static int s390_iommu_map(struct iommu_domain *domain, unsigned long iova,
> -			  phys_addr_t paddr, size_t size, int prot)
> +			  phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
>   {
>   	struct s390_domain *s390_domain = to_s390_domain(domain);
>   	int flags = ZPCI_PTE_VALID, rc = 0;
> diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
> index 4d8057916552..f300099852b1 100644
> --- a/drivers/iommu/tegra-gart.c
> +++ b/drivers/iommu/tegra-gart.c
> @@ -190,7 +190,7 @@ static inline int __gart_iommu_map(struct gart_device *gart, unsigned long iova,
>   }
>   
>   static int gart_iommu_map(struct iommu_domain *domain, unsigned long iova,
> -			  phys_addr_t pa, size_t bytes, int prot)
> +			  phys_addr_t pa, size_t bytes, int prot, gfp_t gfp)
>   {
>   	struct gart_device *gart = gart_handle;
>   	int ret;
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 5182c7d6171e..e1bf867e0607 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -641,7 +641,7 @@ static void tegra_smmu_set_pte(struct tegra_smmu_as *as, unsigned long iova,
>   }
>   
>   static int tegra_smmu_map(struct iommu_domain *domain, unsigned long iova,
> -			  phys_addr_t paddr, size_t size, int prot)
> +			  phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
>   {
>   	struct tegra_smmu_as *as = to_smmu_as(domain);
>   	dma_addr_t pte_dma;
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index ffbbc7e39cee..76b8e7fe3ed0 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -198,7 +198,7 @@ struct iommu_ops {
>   	int (*attach_dev)(struct iommu_domain *domain, struct device *dev);
>   	void (*detach_dev)(struct iommu_domain *domain, struct device *dev);
>   	int (*map)(struct iommu_domain *domain, unsigned long iova,
> -		   phys_addr_t paddr, size_t size, int prot);
> +		   phys_addr_t paddr, size_t size, int prot, gfp_t gfp);
>   	size_t (*unmap)(struct iommu_domain *domain, unsigned long iova,
>   		     size_t size);
>   	void (*flush_iotlb_all)(struct iommu_domain *domain);
> @@ -295,12 +295,17 @@ extern struct iommu_domain *iommu_get_domain_for_dev(struct device *dev);
>   extern struct iommu_domain *iommu_get_dma_domain(struct device *dev);
>   extern int iommu_map(struct iommu_domain *domain, unsigned long iova,
>   		     phys_addr_t paddr, size_t size, int prot);
> +extern int iommu_map_atomic(struct iommu_domain *domain, unsigned long iova,
> +		     phys_addr_t paddr, size_t size, int prot);
>   extern size_t iommu_unmap(struct iommu_domain *domain, unsigned long iova,
>   			  size_t size);
>   extern size_t iommu_unmap_fast(struct iommu_domain *domain,
>   			       unsigned long iova, size_t size);
>   extern size_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
>   			   struct scatterlist *sg,unsigned int nents, int prot);
> +extern size_t iommu_map_sg_atomic(struct iommu_domain *domain,
> +				  unsigned long iova, struct scatterlist *sg,
> +				  unsigned int nents, int prot);
>   extern phys_addr_t iommu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova);
>   extern void iommu_set_fault_handler(struct iommu_domain *domain,
>   			iommu_fault_handler_t handler, void *token);
> @@ -469,6 +474,13 @@ static inline int iommu_map(struct iommu_domain *domain, unsigned long iova,
>   	return -ENODEV;
>   }
>   
> +static inline int iommu_map_atomic(struct iommu_domain *domain,
> +				   unsigned long iova, phys_addr_t paddr,
> +				   size_t size, int prot)
> +{
> +	return -ENODEV;
> +}
> +
>   static inline size_t iommu_unmap(struct iommu_domain *domain,
>   				 unsigned long iova, size_t size)
>   {
> @@ -488,6 +500,13 @@ static inline size_t iommu_map_sg(struct iommu_domain *domain,
>   	return 0;
>   }
>   
> +static inline size_t iommu_map_sg_atomic(struct iommu_domain *domain,
> +				  unsigned long iova, struct scatterlist *sg,
> +				  unsigned int nents, int prot)
> +{
> +	return 0;
> +}
> +
>   static inline void iommu_flush_tlb_all(struct iommu_domain *domain)
>   {
>   }
> 
