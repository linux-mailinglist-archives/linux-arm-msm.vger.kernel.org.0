Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5EF1A1426
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2020 20:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727797AbgDGSi2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 14:38:28 -0400
Received: from 8bytes.org ([81.169.241.247]:57778 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727109AbgDGSiD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 14:38:03 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id CF58C694; Tue,  7 Apr 2020 20:37:53 +0200 (CEST)
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
Subject: [RFC PATCH 29/34] iommu/omap: Remove orphan_dev tracking
Date:   Tue,  7 Apr 2020 20:37:37 +0200
Message-Id: <20200407183742.4344-30-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200407183742.4344-1-joro@8bytes.org>
References: <20200407183742.4344-1-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Joerg Roedel <jroedel@suse.de>

Remove the tracking of device which could not be probed because
their IOMMU is not probed yet. Replace it with a call to
bus_iommu_probe() when a new IOMMU is probed.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/omap-iommu.c | 54 +++-----------------------------------
 1 file changed, 4 insertions(+), 50 deletions(-)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 887fefcb03b4..ecc9d0829a91 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -35,15 +35,6 @@
 
 static const struct iommu_ops omap_iommu_ops;
 
-struct orphan_dev {
-	struct device *dev;
-	struct list_head node;
-};
-
-static LIST_HEAD(orphan_dev_list);
-
-static DEFINE_SPINLOCK(orphan_lock);
-
 #define to_iommu(dev)	((struct omap_iommu *)dev_get_drvdata(dev))
 
 /* bitmap of the page sizes currently supported */
@@ -62,8 +53,6 @@ static DEFINE_SPINLOCK(orphan_lock);
 static struct platform_driver omap_iommu_driver;
 static struct kmem_cache *iopte_cachep;
 
-static int _omap_iommu_add_device(struct device *dev);
-
 /**
  * to_omap_domain - Get struct omap_iommu_domain from generic iommu_domain
  * @dom:	generic iommu domain handle
@@ -1177,7 +1166,6 @@ static int omap_iommu_probe(struct platform_device *pdev)
 	struct omap_iommu *obj;
 	struct resource *res;
 	struct device_node *of = pdev->dev.of_node;
-	struct orphan_dev *orphan_dev, *tmp;
 
 	if (!of) {
 		pr_err("%s: only DT-based devices are supported\n", __func__);
@@ -1260,13 +1248,8 @@ static int omap_iommu_probe(struct platform_device *pdev)
 
 	dev_info(&pdev->dev, "%s registered\n", obj->name);
 
-	list_for_each_entry_safe(orphan_dev, tmp, &orphan_dev_list, node) {
-		err = _omap_iommu_add_device(orphan_dev->dev);
-		if (!err) {
-			list_del(&orphan_dev->node);
-			kfree(orphan_dev);
-		}
-	}
+	/* Re-probe bus to probe device attached to this IOMMU */
+	bus_iommu_probe(&platform_bus_type);
 
 	return 0;
 
@@ -1657,7 +1640,7 @@ static phys_addr_t omap_iommu_iova_to_phys(struct iommu_domain *domain,
 	return ret;
 }
 
-static int _omap_iommu_add_device(struct device *dev)
+static int omap_iommu_add_device(struct device *dev)
 {
 	struct omap_iommu_arch_data *arch_data, *tmp;
 	struct omap_iommu *oiommu;
@@ -1666,8 +1649,6 @@ static int _omap_iommu_add_device(struct device *dev)
 	struct platform_device *pdev;
 	int num_iommus, i;
 	int ret;
-	struct orphan_dev *orphan_dev;
-	unsigned long flags;
 
 	/*
 	 * Allocate the archdata iommu structure for DT-based devices.
@@ -1702,23 +1683,7 @@ static int _omap_iommu_add_device(struct device *dev)
 		if (!pdev) {
 			of_node_put(np);
 			kfree(arch_data);
-			spin_lock_irqsave(&orphan_lock, flags);
-			list_for_each_entry(orphan_dev, &orphan_dev_list,
-					    node) {
-				if (orphan_dev->dev == dev)
-					break;
-			}
-			spin_unlock_irqrestore(&orphan_lock, flags);
-
-			if (orphan_dev && orphan_dev->dev == dev)
-				return -EPROBE_DEFER;
-
-			orphan_dev = kzalloc(sizeof(*orphan_dev), GFP_KERNEL);
-			orphan_dev->dev = dev;
-			spin_lock_irqsave(&orphan_lock, flags);
-			list_add(&orphan_dev->node, &orphan_dev_list);
-			spin_unlock_irqrestore(&orphan_lock, flags);
-			return -EPROBE_DEFER;
+			return -ENODEV;
 		}
 
 		oiommu = platform_get_drvdata(pdev);
@@ -1764,17 +1729,6 @@ static int _omap_iommu_add_device(struct device *dev)
 	return 0;
 }
 
-static int omap_iommu_add_device(struct device *dev)
-{
-	int ret;
-
-	ret = _omap_iommu_add_device(dev);
-	if (ret == -EPROBE_DEFER)
-		return 0;
-
-	return ret;
-}
-
 static void omap_iommu_remove_device(struct device *dev)
 {
 	struct omap_iommu_arch_data *arch_data = dev->archdata.iommu;
-- 
2.17.1

