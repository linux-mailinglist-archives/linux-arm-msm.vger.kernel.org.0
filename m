Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77B521A7CF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 15:18:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503025AbgDNNR4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 09:17:56 -0400
Received: from 8bytes.org ([81.169.241.247]:35058 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2502905AbgDNNQI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 09:16:08 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 076337BA; Tue, 14 Apr 2020 15:15:56 +0200 (CEST)
From:   Joerg Roedel <joro@8bytes.org>
To:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc:     iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Joerg Roedel <jroedel@suse.de>
Subject: [PATCH v2 29/33] iommu/omap: Convert to probe/release_device() call-backs
Date:   Tue, 14 Apr 2020 15:15:38 +0200
Message-Id: <20200414131542.25608-30-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200414131542.25608-1-joro@8bytes.org>
References: <20200414131542.25608-1-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Joerg Roedel <jroedel@suse.de>

Convert the OMAP IOMMU driver to use the probe_device() and
release_device() call-backs of iommu_ops, so that the iommu core code
does the group and sysfs setup.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/omap-iommu.c | 49 ++++++++++----------------------------
 1 file changed, 13 insertions(+), 36 deletions(-)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index ecc9d0829a91..6699fe6d9e06 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1640,15 +1640,13 @@ static phys_addr_t omap_iommu_iova_to_phys(struct iommu_domain *domain,
 	return ret;
 }
 
-static int omap_iommu_add_device(struct device *dev)
+static struct iommu_device *omap_iommu_probe_device(struct device *dev)
 {
 	struct omap_iommu_arch_data *arch_data, *tmp;
+	struct platform_device *pdev;
 	struct omap_iommu *oiommu;
-	struct iommu_group *group;
 	struct device_node *np;
-	struct platform_device *pdev;
 	int num_iommus, i;
-	int ret;
 
 	/*
 	 * Allocate the archdata iommu structure for DT-based devices.
@@ -1657,7 +1655,7 @@ static int omap_iommu_add_device(struct device *dev)
 	 * IOMMU users.
 	 */
 	if (!dev->of_node)
-		return 0;
+		return ERR_PTR(-ENODEV);
 
 	/*
 	 * retrieve the count of IOMMU nodes using phandle size as element size
@@ -1670,27 +1668,27 @@ static int omap_iommu_add_device(struct device *dev)
 
 	arch_data = kcalloc(num_iommus + 1, sizeof(*arch_data), GFP_KERNEL);
 	if (!arch_data)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	for (i = 0, tmp = arch_data; i < num_iommus; i++, tmp++) {
 		np = of_parse_phandle(dev->of_node, "iommus", i);
 		if (!np) {
 			kfree(arch_data);
-			return -EINVAL;
+			return ERR_PTR(-EINVAL);
 		}
 
 		pdev = of_find_device_by_node(np);
 		if (!pdev) {
 			of_node_put(np);
 			kfree(arch_data);
-			return -ENODEV;
+			return ERR_PTR(-ENODEV);
 		}
 
 		oiommu = platform_get_drvdata(pdev);
 		if (!oiommu) {
 			of_node_put(np);
 			kfree(arch_data);
-			return -EINVAL;
+			return ERR_PTR(-EINVAL);
 		}
 
 		tmp->iommu_dev = oiommu;
@@ -1699,46 +1697,25 @@ static int omap_iommu_add_device(struct device *dev)
 		of_node_put(np);
 	}
 
+	dev->archdata.iommu = arch_data;
+
 	/*
 	 * use the first IOMMU alone for the sysfs device linking.
 	 * TODO: Evaluate if a single iommu_group needs to be
 	 * maintained for both IOMMUs
 	 */
 	oiommu = arch_data->iommu_dev;
-	ret = iommu_device_link(&oiommu->iommu, dev);
-	if (ret) {
-		kfree(arch_data);
-		return ret;
-	}
-
-	dev->archdata.iommu = arch_data;
-
-	/*
-	 * IOMMU group initialization calls into omap_iommu_device_group, which
-	 * needs a valid dev->archdata.iommu pointer
-	 */
-	group = iommu_group_get_for_dev(dev);
-	if (IS_ERR(group)) {
-		iommu_device_unlink(&oiommu->iommu, dev);
-		dev->archdata.iommu = NULL;
-		kfree(arch_data);
-		return PTR_ERR(group);
-	}
-	iommu_group_put(group);
 
-	return 0;
+	return &oiommu->iommu;
 }
 
-static void omap_iommu_remove_device(struct device *dev)
+static void omap_iommu_release_device(struct device *dev)
 {
 	struct omap_iommu_arch_data *arch_data = dev->archdata.iommu;
 
 	if (!dev->of_node || !arch_data)
 		return;
 
-	iommu_device_unlink(&arch_data->iommu_dev->iommu, dev);
-	iommu_group_remove_device(dev);
-
 	dev->archdata.iommu = NULL;
 	kfree(arch_data);
 
@@ -1763,8 +1740,8 @@ static const struct iommu_ops omap_iommu_ops = {
 	.map		= omap_iommu_map,
 	.unmap		= omap_iommu_unmap,
 	.iova_to_phys	= omap_iommu_iova_to_phys,
-	.add_device	= omap_iommu_add_device,
-	.remove_device	= omap_iommu_remove_device,
+	.probe_device	= omap_iommu_probe_device,
+	.release_device	= omap_iommu_release_device,
 	.device_group	= omap_iommu_device_group,
 	.pgsize_bitmap	= OMAP_IOMMU_PGSIZES,
 };
-- 
2.17.1

