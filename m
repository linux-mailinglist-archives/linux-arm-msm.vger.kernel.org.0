Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B26444F3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 00:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbfFMWja (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 18:39:30 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:37855 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727112AbfFMWja (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 18:39:30 -0400
Received: by mail-ed1-f66.google.com with SMTP id w13so519425eds.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2019 15:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tcd-ie.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X6VxjOtgTFHE4TWgWjXdlwatnJXvGomXFADLAPuckoA=;
        b=N/YQvZWUm60765FKNoWCR1b5rnIcvbaIaAKSYwIs1y5cZoB2MSnJcR1gDkM2eymdRw
         2ruZpyflOLl+kp7p9N68zrg9C0r7EHbezluR9Uyo2yqnCl3lHAS8UqpFgkU5RssyHAo4
         g29+PZl00jcU0oTx9024pFKgqE4X095CYvM+WZjH3I5rOm9OTPvMxjaahZMl4w69H4bX
         XdDzT0qwDxPqodhOqRvKvIKmIIpDe5G5ERDa/g2Q8uhZn/Y+9tQi+/gRKH1/pKFuUGHf
         Z/kXPuZipzJ+m95dNYyeKzGve3kq7faqFgdWlemD9GjCKZNa9Pb1++SSpmQboG+6DUcT
         EHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X6VxjOtgTFHE4TWgWjXdlwatnJXvGomXFADLAPuckoA=;
        b=pKeXgBfkr96NbfZY8Ti07QB69SYBCHhpEFpTfRTqNHfkkxYmWjxZ6svzYSq+AcTH7R
         U1fhr6gTpruX6BF1FQGKrUCH4iLFYVZcpm98LuRiCnRIvB8sQPtqrJV909GPHniuLJQK
         SMrK48L1Y1eDyCSWv30mjWFDjg55ts5zz6IoYSyndVd8F8+QsX/g462hBcd6lBHEbGZQ
         ppBOT7EGP/cS2u8yLv/EkL6w5fVihdf1sanNoClp7zxrcdwv8K5EOIOh+8gdPVu3reIK
         b0QKoi6HHTdrWb+1fkfif2BeuzIzjtC9fUyMwGC1/dC3h0XUJFZ2pEsaE2bKuVIcQrRl
         pjng==
X-Gm-Message-State: APjAAAWTAuYixN67wlj1BI9lY0k0xRgc7T48xM3fvSL/hT5rhAfLm/B7
        ViScXysJcK3DG2A7brMw5frVqA==
X-Google-Smtp-Source: APXvYqz5eYu3NL8Q+byuz93QQd48FOs6yXRwsKpx1LryIdsXtIRy3YlDKZTb5v9YL/yc2pxRZPHC1A==
X-Received: by 2002:a17:906:d182:: with SMTP id c2mr63462851ejz.311.1560465567384;
        Thu, 13 Jun 2019 15:39:27 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8084:a0:bc00:8042:d435:a754:1f22])
        by smtp.googlemail.com with ESMTPSA id s16sm216522eji.27.2019.06.13.15.39.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 15:39:26 -0700 (PDT)
From:   Tom Murphy <murphyt7@tcd.ie>
To:     iommu@lists.linux-foundation.org
Cc:     Tom Murphy <murphyt7@tcd.ie>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will.deacon@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: [PATCH v4 2/5] iommu: Add gfp parameter to iommu_ops::map
Date:   Thu, 13 Jun 2019 23:38:57 +0100
Message-Id: <20190613223901.9523-3-murphyt7@tcd.ie>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613223901.9523-1-murphyt7@tcd.ie>
References: <20190613223901.9523-1-murphyt7@tcd.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a gfp_t parameter to the iommu_ops::map function.
Remove the needless locking in the AMD iommu driver.

The iommu_ops::map function (or the iommu_map function which calls it)
was always supposed to be sleepable (according to Joerg's comment in
this thread: https://lore.kernel.org/patchwork/patch/977520/ ) and so
should probably have had a "might_sleep()" since it was written. However
currently the dma-iommu api can call iommu_map in an atomic context,
which it shouldn't do. This doesn't cause any problems because any iommu
driver which uses the dma-iommu api uses gfp_atomic in it's
iommu_ops::map function. But doing this wastes the memory allocators
atomic pools.

Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
---
 drivers/iommu/amd_iommu.c      |  3 ++-
 drivers/iommu/arm-smmu-v3.c    |  2 +-
 drivers/iommu/arm-smmu.c       |  2 +-
 drivers/iommu/dma-iommu.c      |  6 ++---
 drivers/iommu/exynos-iommu.c   |  2 +-
 drivers/iommu/intel-iommu.c    |  2 +-
 drivers/iommu/iommu.c          | 43 +++++++++++++++++++++++++++++-----
 drivers/iommu/ipmmu-vmsa.c     |  2 +-
 drivers/iommu/msm_iommu.c      |  2 +-
 drivers/iommu/mtk_iommu.c      |  2 +-
 drivers/iommu/mtk_iommu_v1.c   |  2 +-
 drivers/iommu/omap-iommu.c     |  2 +-
 drivers/iommu/qcom_iommu.c     |  2 +-
 drivers/iommu/rockchip-iommu.c |  2 +-
 drivers/iommu/s390-iommu.c     |  2 +-
 drivers/iommu/tegra-gart.c     |  2 +-
 drivers/iommu/tegra-smmu.c     |  2 +-
 drivers/iommu/virtio-iommu.c   |  2 +-
 include/linux/iommu.h          | 21 ++++++++++++++++-
 19 files changed, 77 insertions(+), 26 deletions(-)

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index 065639e090fe..fd8da60f7359 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -3030,7 +3030,8 @@ static int amd_iommu_attach_device(struct iommu_domain *dom,
 }
 
 static int amd_iommu_map(struct iommu_domain *dom, unsigned long iova,
-			 phys_addr_t paddr, size_t page_size, int iommu_prot)
+			 phys_addr_t paddr, size_t page_size, int iommu_prot,
+			 gfp_t gfp)
 {
 	struct protection_domain *domain = to_pdomain(dom);
 	int prot = 0;
diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index 4d5a694f02c2..66dee90877d7 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -1964,7 +1964,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 }
 
 static int arm_smmu_map(struct iommu_domain *domain, unsigned long iova,
-			phys_addr_t paddr, size_t size, int prot)
+			phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
 {
 	struct io_pgtable_ops *ops = to_smmu_domain(domain)->pgtbl_ops;
 
diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 5aeb1dbfaa08..f33ab7ef9049 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -1277,7 +1277,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 }
 
 static int arm_smmu_map(struct iommu_domain *domain, unsigned long iova,
-			phys_addr_t paddr, size_t size, int prot)
+			phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
 {
 	struct io_pgtable_ops *ops = to_smmu_domain(domain)->pgtbl_ops;
 	struct arm_smmu_device *smmu = to_smmu_domain(domain)->smmu;
diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 0dee374fc64a..e64dbbcde63c 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -471,7 +471,7 @@ static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
 	if (!iova)
 		return DMA_MAPPING_ERROR;
 
-	if (iommu_map(domain, iova, phys - iova_off, size, prot)) {
+	if (iommu_map_atomic(domain, iova, phys - iova_off, size, prot)) {
 		iommu_dma_free_iova(cookie, iova, size);
 		return DMA_MAPPING_ERROR;
 	}
@@ -615,7 +615,7 @@ static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
 			arch_dma_prep_coherent(sg_page(sg), sg->length);
 	}
 
-	if (iommu_map_sg(domain, iova, sgt.sgl, sgt.orig_nents, ioprot)
+	if (iommu_map_sg_atomic(domain, iova, sgt.sgl, sgt.orig_nents, ioprot)
 			< size)
 		goto out_free_sg;
 
@@ -875,7 +875,7 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	 * We'll leave any physical concatenation to the IOMMU driver's
 	 * implementation - it knows better than we do.
 	 */
-	if (iommu_map_sg(domain, iova, sg, nents, prot) < iova_len)
+	if (iommu_map_sg_atomic(domain, iova, sg, nents, prot) < iova_len)
 		goto out_free_iova;
 
 	return __finalise_sg(dev, sg, nents, iova);
diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 05c6bc099d62..46414234c179 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -1078,7 +1078,7 @@ static int lv2set_page(sysmmu_pte_t *pent, phys_addr_t paddr, size_t size,
  */
 static int exynos_iommu_map(struct iommu_domain *iommu_domain,
 			    unsigned long l_iova, phys_addr_t paddr, size_t size,
-			    int prot)
+			    int prot, gfp_t gfp)
 {
 	struct exynos_iommu_domain *domain = to_exynos_domain(iommu_domain);
 	sysmmu_pte_t *entry;
diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 53998200ba9d..34b0587ac444 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -5173,7 +5173,7 @@ static void intel_iommu_aux_detach_device(struct iommu_domain *domain,
 
 static int intel_iommu_map(struct iommu_domain *domain,
 			   unsigned long iova, phys_addr_t hpa,
-			   size_t size, int iommu_prot)
+			   size_t size, int iommu_prot, gfp_t gfp)
 {
 	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
 	u64 max_addr;
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index d20a8e76afc3..de93eea22e0f 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1565,8 +1565,8 @@ static size_t iommu_pgsize(struct iommu_domain *domain,
 	return pgsize;
 }
 
-int iommu_map(struct iommu_domain *domain, unsigned long iova,
-	      phys_addr_t paddr, size_t size, int prot)
+int __iommu_map(struct iommu_domain *domain, unsigned long iova,
+	      phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
 {
 	const struct iommu_ops *ops = domain->ops;
 	unsigned long orig_iova = iova;
@@ -1603,8 +1603,8 @@ int iommu_map(struct iommu_domain *domain, unsigned long iova,
 
 		pr_debug("mapping: iova 0x%lx pa %pa pgsize 0x%zx\n",
 			 iova, &paddr, pgsize);
+		ret = ops->map(domain, iova, paddr, pgsize, prot, gfp);
 
-		ret = ops->map(domain, iova, paddr, pgsize, prot);
 		if (ret)
 			break;
 
@@ -1624,8 +1624,22 @@ int iommu_map(struct iommu_domain *domain, unsigned long iova,
 
 	return ret;
 }
+
+int iommu_map(struct iommu_domain *domain, unsigned long iova,
+	      phys_addr_t paddr, size_t size, int prot)
+{
+	might_sleep();
+	return __iommu_map(domain, iova, paddr, size, prot, GFP_KERNEL);
+}
 EXPORT_SYMBOL_GPL(iommu_map);
 
+int iommu_map_atomic(struct iommu_domain *domain, unsigned long iova,
+	      phys_addr_t paddr, size_t size, int prot)
+{
+	return __iommu_map(domain, iova, paddr, size, prot, GFP_ATOMIC);
+}
+EXPORT_SYMBOL_GPL(iommu_map_atomic);
+
 static size_t __iommu_unmap(struct iommu_domain *domain,
 			    unsigned long iova, size_t size,
 			    bool sync)
@@ -1700,8 +1714,9 @@ size_t iommu_unmap_fast(struct iommu_domain *domain,
 }
 EXPORT_SYMBOL_GPL(iommu_unmap_fast);
 
-size_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
-		    struct scatterlist *sg, unsigned int nents, int prot)
+size_t __iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
+		    struct scatterlist *sg, unsigned int nents, int prot,
+		    gfp_t gfp)
 {
 	size_t len = 0, mapped = 0;
 	phys_addr_t start;
@@ -1712,7 +1727,9 @@ size_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
 		phys_addr_t s_phys = sg_phys(sg);
 
 		if (len && s_phys != start + len) {
-			ret = iommu_map(domain, iova + mapped, start, len, prot);
+			ret = __iommu_map(domain, iova + mapped, start,
+					len, prot, gfp);
+
 			if (ret)
 				goto out_err;
 
@@ -1740,8 +1757,22 @@ size_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
 	return 0;
 
 }
+
+size_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
+		    struct scatterlist *sg, unsigned int nents, int prot)
+{
+	might_sleep();
+	return __iommu_map_sg(domain, iova, sg, nents, prot, GFP_KERNEL);
+}
 EXPORT_SYMBOL_GPL(iommu_map_sg);
 
+size_t iommu_map_sg_atomic(struct iommu_domain *domain, unsigned long iova,
+		    struct scatterlist *sg, unsigned int nents, int prot)
+{
+	return __iommu_map_sg(domain, iova, sg, nents, prot, GFP_ATOMIC);
+}
+EXPORT_SYMBOL_GPL(iommu_map_sg_atomic);
+
 int iommu_domain_window_enable(struct iommu_domain *domain, u32 wnd_nr,
 			       phys_addr_t paddr, u64 size, int prot)
 {
diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 408ad0b25919..7f4cdaf59f0b 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -721,7 +721,7 @@ static void ipmmu_detach_device(struct iommu_domain *io_domain,
 }
 
 static int ipmmu_map(struct iommu_domain *io_domain, unsigned long iova,
-		     phys_addr_t paddr, size_t size, int prot)
+		     phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
 {
 	struct ipmmu_vmsa_domain *domain = to_vmsa_domain(io_domain);
 
diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index b25e2eb9e038..ba89cbca0d87 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -495,7 +495,7 @@ static void msm_iommu_detach_dev(struct iommu_domain *domain,
 }
 
 static int msm_iommu_map(struct iommu_domain *domain, unsigned long iova,
-			 phys_addr_t pa, size_t len, int prot)
+			 phys_addr_t pa, size_t len, int prot, gfp_t gfp)
 {
 	struct msm_priv *priv = to_msm_priv(domain);
 	unsigned long flags;
diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 82e4be4dfdaf..53371b9e9af5 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -356,7 +356,7 @@ static void mtk_iommu_detach_device(struct iommu_domain *domain,
 }
 
 static int mtk_iommu_map(struct iommu_domain *domain, unsigned long iova,
-			 phys_addr_t paddr, size_t size, int prot)
+			 phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
 {
 	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
 	unsigned long flags;
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index abeeac488372..453e704bee3d 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -295,7 +295,7 @@ static void mtk_iommu_detach_device(struct iommu_domain *domain,
 }
 
 static int mtk_iommu_map(struct iommu_domain *domain, unsigned long iova,
-			 phys_addr_t paddr, size_t size, int prot)
+			 phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
 {
 	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
 	unsigned int page_num = size >> MT2701_IOMMU_PAGE_SHIFT;
diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index d2fb347aa4ff..c1d5a71285dc 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1109,7 +1109,7 @@ static u32 iotlb_init_entry(struct iotlb_entry *e, u32 da, u32 pa, int pgsz)
 }
 
 static int omap_iommu_map(struct iommu_domain *domain, unsigned long da,
-			  phys_addr_t pa, size_t bytes, int prot)
+			  phys_addr_t pa, size_t bytes, int prot, gfp_t gfp)
 {
 	struct omap_iommu_domain *omap_domain = to_omap_domain(domain);
 	struct device *dev = omap_domain->dev;
diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index 8cdd3f059513..a01e07a4e76f 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -411,7 +411,7 @@ static void qcom_iommu_detach_dev(struct iommu_domain *domain, struct device *de
 }
 
 static int qcom_iommu_map(struct iommu_domain *domain, unsigned long iova,
-			  phys_addr_t paddr, size_t size, int prot)
+			  phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
 {
 	int ret;
 	unsigned long flags;
diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 77d4bd93fe4b..aa3507f35107 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -760,7 +760,7 @@ static int rk_iommu_map_iova(struct rk_iommu_domain *rk_domain, u32 *pte_addr,
 }
 
 static int rk_iommu_map(struct iommu_domain *domain, unsigned long _iova,
-			phys_addr_t paddr, size_t size, int prot)
+			phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
 {
 	struct rk_iommu_domain *rk_domain = to_rk_domain(domain);
 	unsigned long flags;
diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
index 22d4db302c1c..efa6aa68521d 100644
--- a/drivers/iommu/s390-iommu.c
+++ b/drivers/iommu/s390-iommu.c
@@ -265,7 +265,7 @@ static int s390_iommu_update_trans(struct s390_domain *s390_domain,
 }
 
 static int s390_iommu_map(struct iommu_domain *domain, unsigned long iova,
-			  phys_addr_t paddr, size_t size, int prot)
+			  phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
 {
 	struct s390_domain *s390_domain = to_s390_domain(domain);
 	int flags = ZPCI_PTE_VALID, rc = 0;
diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
index 6d40bc1b38bf..43c725243e8a 100644
--- a/drivers/iommu/tegra-gart.c
+++ b/drivers/iommu/tegra-gart.c
@@ -178,7 +178,7 @@ static inline int __gart_iommu_map(struct gart_device *gart, unsigned long iova,
 }
 
 static int gart_iommu_map(struct iommu_domain *domain, unsigned long iova,
-			  phys_addr_t pa, size_t bytes, int prot)
+			  phys_addr_t pa, size_t bytes, int prot, gfp_t gfp)
 {
 	struct gart_device *gart = gart_handle;
 	int ret;
diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 463ee08f7d3a..32178364cfe2 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -653,7 +653,7 @@ static void tegra_smmu_set_pte(struct tegra_smmu_as *as, unsigned long iova,
 }
 
 static int tegra_smmu_map(struct iommu_domain *domain, unsigned long iova,
-			  phys_addr_t paddr, size_t size, int prot)
+			  phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
 {
 	struct tegra_smmu_as *as = to_smmu_as(domain);
 	dma_addr_t pte_dma;
diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index 4620dd221ffd..dbf5632bee3c 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -707,7 +707,7 @@ static int viommu_attach_dev(struct iommu_domain *domain, struct device *dev)
 }
 
 static int viommu_map(struct iommu_domain *domain, unsigned long iova,
-		      phys_addr_t paddr, size_t size, int prot)
+		      phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
 {
 	int ret;
 	int flags;
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 374ef0cfd343..e9f3ceda38a6 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -224,7 +224,7 @@ struct iommu_ops {
 	int (*attach_dev)(struct iommu_domain *domain, struct device *dev);
 	void (*detach_dev)(struct iommu_domain *domain, struct device *dev);
 	int (*map)(struct iommu_domain *domain, unsigned long iova,
-		   phys_addr_t paddr, size_t size, int prot);
+		   phys_addr_t paddr, size_t size, int prot, gfp_t gfp);
 	size_t (*unmap)(struct iommu_domain *domain, unsigned long iova,
 		     size_t size);
 	void (*flush_iotlb_all)(struct iommu_domain *domain);
@@ -337,12 +337,17 @@ extern struct iommu_domain *iommu_get_domain_for_dev(struct device *dev);
 extern struct iommu_domain *iommu_get_dma_domain(struct device *dev);
 extern int iommu_map(struct iommu_domain *domain, unsigned long iova,
 		     phys_addr_t paddr, size_t size, int prot);
+extern int iommu_map_atomic(struct iommu_domain *domain, unsigned long iova,
+		     phys_addr_t paddr, size_t size, int prot);
 extern size_t iommu_unmap(struct iommu_domain *domain, unsigned long iova,
 			  size_t size);
 extern size_t iommu_unmap_fast(struct iommu_domain *domain,
 			       unsigned long iova, size_t size);
 extern size_t iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
 			   struct scatterlist *sg,unsigned int nents, int prot);
+extern size_t iommu_map_sg_atomic(struct iommu_domain *domain,
+				  unsigned long iova, struct scatterlist *sg,
+				  unsigned int nents, int prot);
 extern phys_addr_t iommu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova);
 extern void iommu_set_fault_handler(struct iommu_domain *domain,
 			iommu_fault_handler_t handler, void *token);
@@ -540,6 +545,13 @@ static inline int iommu_map(struct iommu_domain *domain, unsigned long iova,
 	return -ENODEV;
 }
 
+static inline int iommu_map_atomic(struct iommu_domain *domain,
+				   unsigned long iova, phys_addr_t paddr,
+				   size_t size, int prot)
+{
+	return -ENODEV;
+}
+
 static inline size_t iommu_unmap(struct iommu_domain *domain,
 				 unsigned long iova, size_t size)
 {
@@ -559,6 +571,13 @@ static inline size_t iommu_map_sg(struct iommu_domain *domain,
 	return 0;
 }
 
+static inline size_t iommu_map_sg_atomic(struct iommu_domain *domain,
+				  unsigned long iova, struct scatterlist *sg,
+				  unsigned int nents, int prot)
+{
+	return 0;
+}
+
 static inline void iommu_flush_tlb_all(struct iommu_domain *domain)
 {
 }
-- 
2.20.1

