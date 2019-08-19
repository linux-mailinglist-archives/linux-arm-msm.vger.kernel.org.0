Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBF1D94CAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2019 20:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728227AbfHSSXr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Aug 2019 14:23:47 -0400
Received: from foss.arm.com ([217.140.110.172]:58462 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726959AbfHSSXr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Aug 2019 14:23:47 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F2BE1576;
        Mon, 19 Aug 2019 11:23:45 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B55D3F246;
        Mon, 19 Aug 2019 11:23:42 -0700 (PDT)
Subject: Re: [PATCH V5 2/5] iommu: Add gfp parameter to iommu_ops::map
To:     Tom Murphy <murphyt7@tcd.ie>, iommu@lists.linux-foundation.org
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org
References: <20190815110944.3579-1-murphyt7@tcd.ie>
 <20190815110944.3579-3-murphyt7@tcd.ie>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <1eb19886-ad52-95c5-6213-fcdd1bb2bafe@arm.com>
Date:   Mon, 19 Aug 2019 19:23:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190815110944.3579-3-murphyt7@tcd.ie>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/08/2019 12:09, Tom Murphy wrote:
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

Looks reasonable to me - once we get the merges sorted out I'll take a 
look at propagating the flags through to io-pgtable for the SMMU drivers 
and friends.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
> ---
>   drivers/iommu/amd_iommu.c      |  3 ++-
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
>   drivers/iommu/virtio-iommu.c   |  2 +-
>   include/linux/iommu.h          | 21 ++++++++++++++++-
>   19 files changed, 77 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
> index 1948be7ac8f8..0e53f9bd2be7 100644
> --- a/drivers/iommu/amd_iommu.c
> +++ b/drivers/iommu/amd_iommu.c
> @@ -3030,7 +3030,8 @@ static int amd_iommu_attach_device(struct iommu_domain *dom,
>   }
>   
>   static int amd_iommu_map(struct iommu_domain *dom, unsigned long iova,
> -			 phys_addr_t paddr, size_t page_size, int iommu_prot)
> +			 phys_addr_t paddr, size_t page_size, int iommu_prot,
> +			 gfp_t gfp)
>   {
>   	struct protection_domain *domain = to_pdomain(dom);
>   	int prot = 0;
> diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
> index e7f49fd1a7ba..acc0eae7963f 100644
> --- a/drivers/iommu/arm-smmu-v3.c
> +++ b/drivers/iommu/arm-smmu-v3.c
> @@ -1975,7 +1975,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>   }
>   
>   static int arm_smmu_map(struct iommu_domain *domain, unsigned long iova,
> -			phys_addr_t paddr, size_t size, int prot)
> +			phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
>   {
>   	struct io_pgtable_ops *ops = to_smmu_domain(domain)->pgtbl_ops;
>   
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index aa06498f291d..05f42bdee494 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -1284,7 +1284,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>   }
>   
>   static int arm_smmu_map(struct iommu_domain *domain, unsigned long iova,
> -			phys_addr_t paddr, size_t size, int prot)
> +			phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
>   {
>   	struct io_pgtable_ops *ops = to_smmu_domain(domain)->pgtbl_ops;
>   	struct arm_smmu_device *smmu = to_smmu_domain(domain)->smmu;
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index d991d40f797f..2712fbc68b28 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -469,7 +469,7 @@ static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
>   	if (!iova)
>   		return DMA_MAPPING_ERROR;
>   
> -	if (iommu_map(domain, iova, phys - iova_off, size, prot)) {
> +	if (iommu_map_atomic(domain, iova, phys - iova_off, size, prot)) {
>   		iommu_dma_free_iova(cookie, iova, size);
>   		return DMA_MAPPING_ERROR;
>   	}
> @@ -613,7 +613,7 @@ static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
>   			arch_dma_prep_coherent(sg_page(sg), sg->length);
>   	}
>   
> -	if (iommu_map_sg(domain, iova, sgt.sgl, sgt.orig_nents, ioprot)
> +	if (iommu_map_sg_atomic(domain, iova, sgt.sgl, sgt.orig_nents, ioprot)
>   			< size)
>   		goto out_free_sg;
>   
> @@ -873,7 +873,7 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
>   	 * We'll leave any physical concatenation to the IOMMU driver's
>   	 * implementation - it knows better than we do.
>   	 */
> -	if (iommu_map_sg(domain, iova, sg, nents, prot) < iova_len)
> +	if (iommu_map_sg_atomic(domain, iova, sg, nents, prot) < iova_len)
>   		goto out_free_iova;
>   
>   	return __finalise_sg(dev, sg, nents, iova);
> diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> index 1934c16a5abc..b7dd46884692 100644
> --- a/drivers/iommu/exynos-iommu.c
> +++ b/drivers/iommu/exynos-iommu.c
> @@ -1073,7 +1073,7 @@ static int lv2set_page(sysmmu_pte_t *pent, phys_addr_t paddr, size_t size,
>    */
>   static int exynos_iommu_map(struct iommu_domain *iommu_domain,
>   			    unsigned long l_iova, phys_addr_t paddr, size_t size,
> -			    int prot)
> +			    int prot, gfp_t gfp)
>   {
>   	struct exynos_iommu_domain *domain = to_exynos_domain(iommu_domain);
>   	sysmmu_pte_t *entry;
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index 12d094d08c0a..0e7cb0cbbd46 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -5113,7 +5113,7 @@ static void intel_iommu_aux_detach_device(struct iommu_domain *domain,
>   
>   static int intel_iommu_map(struct iommu_domain *domain,
>   			   unsigned long iova, phys_addr_t hpa,
> -			   size_t size, int iommu_prot)
> +			   size_t size, int iommu_prot, gfp_t gfp)
>   {
>   	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
>   	u64 max_addr;
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 0c674d80c37f..133ec8e00a3a 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1799,8 +1799,8 @@ static size_t iommu_pgsize(struct iommu_domain *domain,
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
> @@ -1837,8 +1837,8 @@ int iommu_map(struct iommu_domain *domain, unsigned long iova,
>   
>   		pr_debug("mapping: iova 0x%lx pa %pa pgsize 0x%zx\n",
>   			 iova, &paddr, pgsize);
> +		ret = ops->map(domain, iova, paddr, pgsize, prot, gfp);
>   
> -		ret = ops->map(domain, iova, paddr, pgsize, prot);
>   		if (ret)
>   			break;
>   
> @@ -1858,8 +1858,22 @@ int iommu_map(struct iommu_domain *domain, unsigned long iova,
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
> @@ -1934,8 +1948,9 @@ size_t iommu_unmap_fast(struct iommu_domain *domain,
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
> @@ -1946,7 +1961,9 @@ size_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
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
> @@ -1974,8 +1991,22 @@ size_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
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
> index ad0098c0c87c..41572b40b844 100644
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -722,7 +722,7 @@ static void ipmmu_detach_device(struct iommu_domain *io_domain,
>   }
>   
>   static int ipmmu_map(struct iommu_domain *io_domain, unsigned long iova,
> -		     phys_addr_t paddr, size_t size, int prot)
> +		     phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
>   {
>   	struct ipmmu_vmsa_domain *domain = to_vmsa_domain(io_domain);
>   
> diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
> index 3df9266abe65..5fa915c5d541 100644
> --- a/drivers/iommu/msm_iommu.c
> +++ b/drivers/iommu/msm_iommu.c
> @@ -495,7 +495,7 @@ static void msm_iommu_detach_dev(struct iommu_domain *domain,
>   }
>   
>   static int msm_iommu_map(struct iommu_domain *domain, unsigned long iova,
> -			 phys_addr_t pa, size_t len, int prot)
> +			 phys_addr_t pa, size_t len, int prot, gfp_t gfp)
>   {
>   	struct msm_priv *priv = to_msm_priv(domain);
>   	unsigned long flags;
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 82e4be4dfdaf..53371b9e9af5 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -356,7 +356,7 @@ static void mtk_iommu_detach_device(struct iommu_domain *domain,
>   }
>   
>   static int mtk_iommu_map(struct iommu_domain *domain, unsigned long iova,
> -			 phys_addr_t paddr, size_t size, int prot)
> +			 phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
>   {
>   	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
>   	unsigned long flags;
> diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
> index abeeac488372..453e704bee3d 100644
> --- a/drivers/iommu/mtk_iommu_v1.c
> +++ b/drivers/iommu/mtk_iommu_v1.c
> @@ -295,7 +295,7 @@ static void mtk_iommu_detach_device(struct iommu_domain *domain,
>   }
>   
>   static int mtk_iommu_map(struct iommu_domain *domain, unsigned long iova,
> -			 phys_addr_t paddr, size_t size, int prot)
> +			 phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
>   {
>   	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
>   	unsigned int page_num = size >> MT2701_IOMMU_PAGE_SHIFT;
> diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
> index 99a9ff3e7f71..3c530768200e 100644
> --- a/drivers/iommu/omap-iommu.c
> +++ b/drivers/iommu/omap-iommu.c
> @@ -1339,7 +1339,7 @@ static u32 iotlb_init_entry(struct iotlb_entry *e, u32 da, u32 pa, int pgsz)
>   }
>   
>   static int omap_iommu_map(struct iommu_domain *domain, unsigned long da,
> -			  phys_addr_t pa, size_t bytes, int prot)
> +			  phys_addr_t pa, size_t bytes, int prot, gfp_t gfp)
>   {
>   	struct omap_iommu_domain *omap_domain = to_omap_domain(domain);
>   	struct device *dev = omap_domain->dev;
> diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
> index fb45486c6d14..b373c0f18ad5 100644
> --- a/drivers/iommu/qcom_iommu.c
> +++ b/drivers/iommu/qcom_iommu.c
> @@ -400,7 +400,7 @@ static void qcom_iommu_detach_dev(struct iommu_domain *domain, struct device *de
>   }
>   
>   static int qcom_iommu_map(struct iommu_domain *domain, unsigned long iova,
> -			  phys_addr_t paddr, size_t size, int prot)
> +			  phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
>   {
>   	int ret;
>   	unsigned long flags;
> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
> index dc26d74d79c2..b06d2986b52e 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -757,7 +757,7 @@ static int rk_iommu_map_iova(struct rk_iommu_domain *rk_domain, u32 *pte_addr,
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
> index 6d40bc1b38bf..43c725243e8a 100644
> --- a/drivers/iommu/tegra-gart.c
> +++ b/drivers/iommu/tegra-gart.c
> @@ -178,7 +178,7 @@ static inline int __gart_iommu_map(struct gart_device *gart, unsigned long iova,
>   }
>   
>   static int gart_iommu_map(struct iommu_domain *domain, unsigned long iova,
> -			  phys_addr_t pa, size_t bytes, int prot)
> +			  phys_addr_t pa, size_t bytes, int prot, gfp_t gfp)
>   {
>   	struct gart_device *gart = gart_handle;
>   	int ret;
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index c4a652b227f8..6ec58a2bcc13 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -650,7 +650,7 @@ static void tegra_smmu_set_pte(struct tegra_smmu_as *as, unsigned long iova,
>   }
>   
>   static int tegra_smmu_map(struct iommu_domain *domain, unsigned long iova,
> -			  phys_addr_t paddr, size_t size, int prot)
> +			  phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
>   {
>   	struct tegra_smmu_as *as = to_smmu_as(domain);
>   	dma_addr_t pte_dma;
> diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
> index 80a740df0737..15443457f3fc 100644
> --- a/drivers/iommu/virtio-iommu.c
> +++ b/drivers/iommu/virtio-iommu.c
> @@ -713,7 +713,7 @@ static int viommu_attach_dev(struct iommu_domain *domain, struct device *dev)
>   }
>   
>   static int viommu_map(struct iommu_domain *domain, unsigned long iova,
> -		      phys_addr_t paddr, size_t size, int prot)
> +		      phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
>   {
>   	int ret;
>   	u32 flags;
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index fdc355ccc570..89af6271c506 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -240,7 +240,7 @@ struct iommu_ops {
>   	int (*attach_dev)(struct iommu_domain *domain, struct device *dev);
>   	void (*detach_dev)(struct iommu_domain *domain, struct device *dev);
>   	int (*map)(struct iommu_domain *domain, unsigned long iova,
> -		   phys_addr_t paddr, size_t size, int prot);
> +		   phys_addr_t paddr, size_t size, int prot, gfp_t gfp);
>   	size_t (*unmap)(struct iommu_domain *domain, unsigned long iova,
>   		     size_t size);
>   	void (*flush_iotlb_all)(struct iommu_domain *domain);
> @@ -399,12 +399,17 @@ extern struct iommu_domain *iommu_get_domain_for_dev(struct device *dev);
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
> @@ -614,6 +619,13 @@ static inline int iommu_map(struct iommu_domain *domain, unsigned long iova,
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
> @@ -633,6 +645,13 @@ static inline size_t iommu_map_sg(struct iommu_domain *domain,
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
