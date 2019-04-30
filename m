Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5C1BF526
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2019 13:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbfD3LM3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Apr 2019 07:12:29 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:48492 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726646AbfD3LM3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Apr 2019 07:12:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=3b8GPUegqQUF4wDq195k1NdogdhAOi+jHdkKbAeMNXk=; b=F3/ToI/cGQpIQDelBBhQYnWX+
        j/xuGx+L1kIm2FSTo7U3U03O465noF7Ch5TSDDM86npY3ruQIM9sll9MuG7K/+YYh8X4jSIhuLeEO
        pAXjK4deVUdabsxwofOwGjKigeBSNURJk0377mkTSV6sVoLDBF57Hl+SF3+fJXOjUb/H6BizwrgKI
        /GLoWLA+/q2gzGn8tXJsI2rhxWV6/isd0OZwI6N500QaWB+T5QtXI2RDHsnpPv9LQ4/VC5sWfoTRZ
        NfaA0c3rbTb0/Oh0cAJfITFvaLZF0KhntbFaqWGerxOD1HdKGVcG8oK5fvZgQWW3V1qxC1Q7Iv6Sz
        H2jNgcYYw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hLQgR-0005Dn-0q; Tue, 30 Apr 2019 11:12:23 +0000
Date:   Tue, 30 Apr 2019 04:12:22 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Tom Murphy <tmurphy@arista.com>
Cc:     iommu@lists.linux-foundation.org, Heiko Stuebner <heiko@sntech.de>,
        Will Deacon <will.deacon@arm.com>,
        David Brown <david.brown@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Andy Gross <andy.gross@linaro.org>,
        linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Robin Murphy <robin.murphy@arm.com>,
        linux-kernel@vger.kernel.org, murphyt7@tcd.ie,
        David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2 3/4] iommu/dma-iommu: Use the dev->coherent_dma_mask
Message-ID: <20190430111222.GA3191@infradead.org>
References: <20190430002952.18909-1-tmurphy@arista.com>
 <20190430002952.18909-4-tmurphy@arista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190430002952.18909-4-tmurphy@arista.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>  static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
> -		size_t size, int prot, struct iommu_domain *domain)
> +		size_t size, int prot, struct iommu_domain *domain,
> +		dma_addr_t dma_limit)

Can we just call this dma_mask?

>  static void iommu_dma_unmap_resource(struct device *dev, dma_addr_t handle,
> @@ -1250,7 +1251,8 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
>  	if (!msi_page)
>  		return NULL;
>  
> -	iova = __iommu_dma_map(dev, msi_addr, size, prot, domain);
> +	iova = __iommu_dma_map(dev, msi_addr, size, prot, domain,
> +			dma_get_mask(dev));

Hmm, I don't think we need the DMA mask for the MSI mapping, this
should probably always use a 64-bit mask.  Or we could just untangle
it from the DMA mapping fast path entire, something like:

---
From 0debafc85174ca830f2e371ff8e8f7465bde3ad8 Mon Sep 17 00:00:00 2001
From: Christoph Hellwig <hch@lst.de>
Date: Tue, 30 Apr 2019 07:06:23 -0400
Subject: iommu/dma: opencode __iommu_dma_map in iommu_dma_get_msi_page

The MSI page mapping really is a little different from the normal DMA
mappings and doesn't need to look at the DMA mask.  Just open code
it instead of trying to squeeze the behavior into the DMA path helpers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/dma-iommu.c | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 58c35bab7626..2ac0df0879d7 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -358,11 +358,6 @@ static dma_addr_t iommu_dma_alloc_iova(struct iommu_domain *domain,
 	struct iova_domain *iovad = &cookie->iovad;
 	unsigned long shift, iova_len, iova = 0;
 
-	if (cookie->type == IOMMU_DMA_MSI_COOKIE) {
-		cookie->msi_iova += size;
-		return cookie->msi_iova - size;
-	}
-
 	shift = iova_shift(iovad);
 	iova_len = size >> shift;
 	/*
@@ -397,10 +392,7 @@ static void iommu_dma_free_iova(struct iommu_dma_cookie *cookie,
 {
 	struct iova_domain *iovad = &cookie->iovad;
 
-	/* The MSI case is only ever cleaning up its most recent allocation */
-	if (cookie->type == IOMMU_DMA_MSI_COOKIE)
-		cookie->msi_iova -= size;
-	else if (cookie->fq_domain)	/* non-strict mode */
+	if (cookie->fq_domain)	/* non-strict mode */
 		queue_iova(iovad, iova_pfn(iovad, iova),
 				size >> iova_shift(iovad), 0);
 	else
@@ -430,14 +422,10 @@ static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
 {
 	struct iommu_domain *domain = iommu_get_dma_domain(dev);
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
-	size_t iova_off = 0;
+	size_t iova_off = iova_offset(&cookie->iovad, phys);
 	dma_addr_t iova;
 
-	if (cookie->type == IOMMU_DMA_IOVA_COOKIE) {
-		iova_off = iova_offset(&cookie->iovad, phys);
-		size = iova_align(&cookie->iovad, size + iova_off);
-	}
-
+	size = iova_align(&cookie->iovad, size + iova_off);
 	iova = iommu_dma_alloc_iova(domain, size, dma_get_mask(dev), dev);
 	if (!iova)
 		return DMA_MAPPING_ERROR;
@@ -1121,7 +1109,6 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
 {
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
 	struct iommu_dma_msi_page *msi_page;
-	dma_addr_t iova;
 	int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
 	size_t size = cookie_msi_granule(cookie);
 
@@ -1134,16 +1121,16 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
 	if (!msi_page)
 		return NULL;
 
-	iova = __iommu_dma_map(dev, msi_addr, size, prot);
-	if (iova == DMA_MAPPING_ERROR)
+	if (iommu_map(domain, cookie->msi_iova, msi_addr, size, prot))
 		goto out_free_page;
 
 	INIT_LIST_HEAD(&msi_page->list);
 	msi_page->phys = msi_addr;
-	msi_page->iova = iova;
+	msi_page->iova = cookie->msi_iova;
 	list_add(&msi_page->list, &cookie->msi_page_list);
-	return msi_page;
 
+	cookie->msi_iova += size;
+	return msi_page;
 out_free_page:
 	kfree(msi_page);
 	return NULL;
-- 
2.20.1

