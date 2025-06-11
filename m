Return-Path: <linux-arm-msm+bounces-60937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FA1AD507A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 11:48:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B48361884B2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 09:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B2925C83E;
	Wed, 11 Jun 2025 09:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="D7M0jQva"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EE4235062;
	Wed, 11 Jun 2025 09:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749635200; cv=none; b=HZGpy6X2127+ei1sqGOcf+KR839HyNl9DhZoDFfVbYYqr0YAnq/KW2fyFxi95D6XUHHVGcdgTdcuiborF675L6FvYjXoeIbBHEMR/zqdPnD6w59rEZbnE2hvfR2ImkzoOBI0Lpy7UFqiDwlLID5rFefWGhDk4BM94AlahwfDn4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749635200; c=relaxed/simple;
	bh=1nJPffGDWp+469Tu3HLFMSVE26vvsQDrRNZ43oyrncA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=Z0FWULDLgxBzXvrFL9vWDLEcaP2PUinCCVfdbo3k6V2ScdVD8iUYSARpJ7VJNAOwLlmayRMmw8EvE546jLl25CMPC1hccw9Dfb6P3QZ8BjgCTYj+mM0BM1o65f0I8f+o2WqnRXFm3FcXzhZH19Qx2glbC4WpaxC8zESI4sMg/r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=D7M0jQva; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250611094630euoutp020a8d12ac42d98b28cec73e3a51148e4c~H8_91aj7i2986829868euoutp02q;
	Wed, 11 Jun 2025 09:46:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250611094630euoutp020a8d12ac42d98b28cec73e3a51148e4c~H8_91aj7i2986829868euoutp02q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749635190;
	bh=Xc1Rw8rxxHeqcL2S98t+3Zj03z6AtNBwZXlDz1pqDvA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=D7M0jQva/CmleKGyjhOgJl78zjV/oPx6s5KxnXtLUYYdEaml2NNAYdEs9/7As/Eia
	 YSQHUvoHjilQEyBpFlxkzghHuFOR7/FgJCv4co3qfOojnfgqtbKkOvhpftKuev4720
	 5cdGTpagHumvO3lEJCpPxI6ssKCDarO+B8joe2aE=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250611094629eucas1p11c41674f1a6fcbefd14b4fd99166cae1~H8_9eZCnm1166611666eucas1p11;
	Wed, 11 Jun 2025 09:46:29 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250611094624eusmtip20a59cf478d3dc363416fa64f5fe470b4~H8_5DJCRv0322703227eusmtip2K;
	Wed, 11 Jun 2025 09:46:24 +0000 (GMT)
Message-ID: <ffa49c2a-9197-4820-96b0-636b3e649cf5@samsung.com>
Date: Wed, 11 Jun 2025 11:46:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] iommu: Remove iommu_ops pgsize_bitmap from
 simple drivers
To: Jason Gunthorpe <jgg@nvidia.com>, Alexandre Ghiti <alex@ghiti.fr>, Alim
	Akhtar <alim.akhtar@samsung.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Albert
	Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev, Baolin Wang
	<baolin.wang@linux.alibaba.com>, David Woodhouse <dwmw2@infradead.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Stuebner
	<heiko@sntech.de>, iommu@lists.linux.dev, Janne Grunau <j@jannau.net>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Joerg
	Roedel <joro@8bytes.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>, Neal Gompa <neal@gompa.dev>, Orson
	Zhai <orsonzhai@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
	Walmsley <paul.walmsley@sifive.com>, Rob Clark
	<robin.clark@oss.qualcomm.com>, Robin Murphy <robin.murphy@arm.com>, Samuel
	Holland <samuel@sholland.org>, Sven Peter <sven@kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>,
	virtualization@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>, Will Deacon
	<will@kernel.org>, Yong Wu <yong.wu@mediatek.com>, Chunyan Zhang
	<zhang.lyra@gmail.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>,
	patches@lists.linux.dev, Niklas Schnelle <schnelle@linux.ibm.com>, Sven
	Peter <sven@svenpeter.dev>, Tomasz Jeznach <tjeznach@rivosinc.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <4-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250611094629eucas1p11c41674f1a6fcbefd14b4fd99166cae1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250609204211eucas1p171527915cb5843e72782a02a3521d2c7
X-EPHeader: CA
X-CMS-RootMailID: 20250609204211eucas1p171527915cb5843e72782a02a3521d2c7
References: <CGME20250609204211eucas1p171527915cb5843e72782a02a3521d2c7@eucas1p1.samsung.com>
	<4-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>

On 09.06.2025 22:41, Jason Gunthorpe wrote:
> These drivers just have a constant value for their page size, move it
> into their domain_alloc_paging function before setting up the geometry.
>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Acked-by: Niklas Schnelle <schnelle@linux.ibm.com> # for s390-iommu.c
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/exynos-iommu.c   | 3 ++-
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com> # for exynos-iommu.c
>   drivers/iommu/ipmmu-vmsa.c     | 4 ++--
>   drivers/iommu/mtk_iommu_v1.c   | 3 ++-
>   drivers/iommu/omap-iommu.c     | 3 ++-
>   drivers/iommu/rockchip-iommu.c | 3 ++-
>   drivers/iommu/s390-iommu.c     | 2 +-
>   drivers/iommu/sprd-iommu.c     | 3 ++-
>   drivers/iommu/sun50i-iommu.c   | 3 ++-
>   drivers/iommu/tegra-smmu.c     | 3 ++-
>   9 files changed, 17 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> index fcb6a0f7c08275..b62a8f35c3e851 100644
> --- a/drivers/iommu/exynos-iommu.c
> +++ b/drivers/iommu/exynos-iommu.c
> @@ -925,6 +925,8 @@ static struct iommu_domain *exynos_iommu_domain_alloc_paging(struct device *dev)
>   	spin_lock_init(&domain->pgtablelock);
>   	INIT_LIST_HEAD(&domain->clients);
>   
> +	domain->domain.pgsize_bitmap = SECT_SIZE | LPAGE_SIZE | SPAGE_SIZE;
> +
>   	domain->domain.geometry.aperture_start = 0;
>   	domain->domain.geometry.aperture_end   = ~0UL;
>   	domain->domain.geometry.force_aperture = true;
> @@ -1477,7 +1479,6 @@ static const struct iommu_ops exynos_iommu_ops = {
>   	.device_group = generic_device_group,
>   	.probe_device = exynos_iommu_probe_device,
>   	.release_device = exynos_iommu_release_device,
> -	.pgsize_bitmap = SECT_SIZE | LPAGE_SIZE | SPAGE_SIZE,
>   	.of_xlate = exynos_iommu_of_xlate,
>   	.default_domain_ops = &(const struct iommu_domain_ops) {
>   		.attach_dev	= exynos_iommu_attach_device,
> diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> index 90341b24a81155..ffa892f6571406 100644
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -430,7 +430,7 @@ static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
>   	 * non-secure mode.
>   	 */
>   	domain->cfg.quirks = IO_PGTABLE_QUIRK_ARM_NS;
> -	domain->cfg.pgsize_bitmap = SZ_1G | SZ_2M | SZ_4K;
> +	domain->cfg.pgsize_bitmap = domain->io_domain.pgsize_bitmap;
>   	domain->cfg.ias = 32;
>   	domain->cfg.oas = 40;
>   	domain->cfg.tlb = &ipmmu_flush_ops;
> @@ -571,6 +571,7 @@ static struct iommu_domain *ipmmu_domain_alloc_paging(struct device *dev)
>   		return NULL;
>   
>   	mutex_init(&domain->mutex);
> +	domain->io_domain.pgsize_bitmap = SZ_1G | SZ_2M | SZ_4K;
>   
>   	return &domain->io_domain;
>   }
> @@ -882,7 +883,6 @@ static const struct iommu_ops ipmmu_ops = {
>   	 */
>   	.device_group = IS_ENABLED(CONFIG_ARM) && !IS_ENABLED(CONFIG_IOMMU_DMA)
>   			? generic_device_group : generic_single_device_group,
> -	.pgsize_bitmap = SZ_1G | SZ_2M | SZ_4K,
>   	.of_xlate = ipmmu_of_xlate,
>   	.default_domain_ops = &(const struct iommu_domain_ops) {
>   		.attach_dev	= ipmmu_attach_device,
> diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
> index 66824982e05fbf..496cfe37243ac2 100644
> --- a/drivers/iommu/mtk_iommu_v1.c
> +++ b/drivers/iommu/mtk_iommu_v1.c
> @@ -288,6 +288,8 @@ static struct iommu_domain *mtk_iommu_v1_domain_alloc_paging(struct device *dev)
>   	if (!dom)
>   		return NULL;
>   
> +	dom->domain.pgsize_bitmap = MT2701_IOMMU_PAGE_SIZE;
> +
>   	return &dom->domain;
>   }
>   
> @@ -582,7 +584,6 @@ static const struct iommu_ops mtk_iommu_v1_ops = {
>   	.probe_finalize = mtk_iommu_v1_probe_finalize,
>   	.release_device	= mtk_iommu_v1_release_device,
>   	.device_group	= generic_device_group,
> -	.pgsize_bitmap	= MT2701_IOMMU_PAGE_SIZE,
>   	.owner          = THIS_MODULE,
>   	.default_domain_ops = &(const struct iommu_domain_ops) {
>   		.attach_dev	= mtk_iommu_v1_attach_device,
> diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
> index 3c62337f43c677..21c218976143ef 100644
> --- a/drivers/iommu/omap-iommu.c
> +++ b/drivers/iommu/omap-iommu.c
> @@ -1584,6 +1584,8 @@ static struct iommu_domain *omap_iommu_domain_alloc_paging(struct device *dev)
>   
>   	spin_lock_init(&omap_domain->lock);
>   
> +	omap_domain->domain.pgsize_bitmap = OMAP_IOMMU_PGSIZES;
> +
>   	omap_domain->domain.geometry.aperture_start = 0;
>   	omap_domain->domain.geometry.aperture_end   = (1ULL << 32) - 1;
>   	omap_domain->domain.geometry.force_aperture = true;
> @@ -1735,7 +1737,6 @@ static const struct iommu_ops omap_iommu_ops = {
>   	.release_device	= omap_iommu_release_device,
>   	.device_group	= generic_single_device_group,
>   	.of_xlate	= omap_iommu_of_xlate,
> -	.pgsize_bitmap	= OMAP_IOMMU_PGSIZES,
>   	.default_domain_ops = &(const struct iommu_domain_ops) {
>   		.attach_dev	= omap_iommu_attach_dev,
>   		.map_pages	= omap_iommu_map,
> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
> index 22f74ba33a0e38..f4a5ad096343ab 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -1081,6 +1081,8 @@ static struct iommu_domain *rk_iommu_domain_alloc_paging(struct device *dev)
>   	spin_lock_init(&rk_domain->dt_lock);
>   	INIT_LIST_HEAD(&rk_domain->iommus);
>   
> +	rk_domain->domain.pgsize_bitmap = RK_IOMMU_PGSIZE_BITMAP;
> +
>   	rk_domain->domain.geometry.aperture_start = 0;
>   	rk_domain->domain.geometry.aperture_end   = DMA_BIT_MASK(32);
>   	rk_domain->domain.geometry.force_aperture = true;
> @@ -1171,7 +1173,6 @@ static const struct iommu_ops rk_iommu_ops = {
>   	.probe_device = rk_iommu_probe_device,
>   	.release_device = rk_iommu_release_device,
>   	.device_group = generic_single_device_group,
> -	.pgsize_bitmap = RK_IOMMU_PGSIZE_BITMAP,
>   	.of_xlate = rk_iommu_of_xlate,
>   	.default_domain_ops = &(const struct iommu_domain_ops) {
>   		.attach_dev	= rk_iommu_attach_device,
> diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
> index 433b59f435302b..9c80d61deb2c0b 100644
> --- a/drivers/iommu/s390-iommu.c
> +++ b/drivers/iommu/s390-iommu.c
> @@ -557,6 +557,7 @@ static struct iommu_domain *s390_domain_alloc_paging(struct device *dev)
>   	}
>   	zdev->end_dma = zdev->start_dma + aperture_size - 1;
>   
> +	s390_domain->domain.pgsize_bitmap = SZ_4K;
>   	s390_domain->domain.geometry.force_aperture = true;
>   	s390_domain->domain.geometry.aperture_start = 0;
>   	s390_domain->domain.geometry.aperture_end = max_tbl_size(s390_domain);
> @@ -1158,7 +1159,6 @@ static struct iommu_domain blocking_domain = {
>   	.domain_alloc_paging = s390_domain_alloc_paging, \
>   	.probe_device = s390_iommu_probe_device, \
>   	.device_group = generic_device_group, \
> -	.pgsize_bitmap = SZ_4K, \
>   	.get_resv_regions = s390_iommu_get_resv_regions, \
>   	.default_domain_ops = &(const struct iommu_domain_ops) { \
>   		.attach_dev	= s390_iommu_attach_device, \
> diff --git a/drivers/iommu/sprd-iommu.c b/drivers/iommu/sprd-iommu.c
> index 941d1f361c8cda..c7ca1d8a0b1530 100644
> --- a/drivers/iommu/sprd-iommu.c
> +++ b/drivers/iommu/sprd-iommu.c
> @@ -143,6 +143,8 @@ static struct iommu_domain *sprd_iommu_domain_alloc_paging(struct device *dev)
>   
>   	spin_lock_init(&dom->pgtlock);
>   
> +	dom->domain.pgsize_bitmap = SPRD_IOMMU_PAGE_SIZE;
> +
>   	dom->domain.geometry.aperture_start = 0;
>   	dom->domain.geometry.aperture_end = SZ_256M - 1;
>   	dom->domain.geometry.force_aperture = true;
> @@ -410,7 +412,6 @@ static const struct iommu_ops sprd_iommu_ops = {
>   	.probe_device	= sprd_iommu_probe_device,
>   	.device_group	= generic_single_device_group,
>   	.of_xlate	= sprd_iommu_of_xlate,
> -	.pgsize_bitmap	= SPRD_IOMMU_PAGE_SIZE,
>   	.owner		= THIS_MODULE,
>   	.default_domain_ops = &(const struct iommu_domain_ops) {
>   		.attach_dev	= sprd_iommu_attach_device,
> diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
> index 76c9620af4bba8..de10b569d9a940 100644
> --- a/drivers/iommu/sun50i-iommu.c
> +++ b/drivers/iommu/sun50i-iommu.c
> @@ -697,6 +697,8 @@ sun50i_iommu_domain_alloc_paging(struct device *dev)
>   
>   	refcount_set(&sun50i_domain->refcnt, 1);
>   
> +	sun50i_domain->domain.pgsize_bitmap = SZ_4K;
> +
>   	sun50i_domain->domain.geometry.aperture_start = 0;
>   	sun50i_domain->domain.geometry.aperture_end = DMA_BIT_MASK(32);
>   	sun50i_domain->domain.geometry.force_aperture = true;
> @@ -842,7 +844,6 @@ static int sun50i_iommu_of_xlate(struct device *dev,
>   
>   static const struct iommu_ops sun50i_iommu_ops = {
>   	.identity_domain = &sun50i_iommu_identity_domain,
> -	.pgsize_bitmap	= SZ_4K,
>   	.device_group	= generic_single_device_group,
>   	.domain_alloc_paging = sun50i_iommu_domain_alloc_paging,
>   	.of_xlate	= sun50i_iommu_of_xlate,
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 61897d50162dd7..fa0913e9346c71 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -318,6 +318,8 @@ static struct iommu_domain *tegra_smmu_domain_alloc_paging(struct device *dev)
>   
>   	spin_lock_init(&as->lock);
>   
> +	as->domain.pgsize_bitmap = SZ_4K;
> +
>   	/* setup aperture */
>   	as->domain.geometry.aperture_start = 0;
>   	as->domain.geometry.aperture_end = 0xffffffff;
> @@ -1002,7 +1004,6 @@ static const struct iommu_ops tegra_smmu_ops = {
>   	.probe_device = tegra_smmu_probe_device,
>   	.device_group = tegra_smmu_device_group,
>   	.of_xlate = tegra_smmu_of_xlate,
> -	.pgsize_bitmap = SZ_4K,
>   	.default_domain_ops = &(const struct iommu_domain_ops) {
>   		.attach_dev	= tegra_smmu_attach_dev,
>   		.map_pages	= tegra_smmu_map,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


