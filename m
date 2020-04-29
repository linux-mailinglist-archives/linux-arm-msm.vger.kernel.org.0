Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99E881BDF27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 15:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728570AbgD2Nk6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 09:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727878AbgD2Nhj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 09:37:39 -0400
Received: from theia.8bytes.org (8bytes.org [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C60BC03C1AD;
        Wed, 29 Apr 2020 06:37:38 -0700 (PDT)
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 545071AF; Wed, 29 Apr 2020 15:37:35 +0200 (CEST)
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
Cc:     Daniel Drake <drake@endlessm.com>, jonathan.derrick@intel.com,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Joerg Roedel <jroedel@suse.de>
Subject: [PATCH v3 01/34] iommu: Move default domain allocation to separate function
Date:   Wed, 29 Apr 2020 15:36:39 +0200
Message-Id: <20200429133712.31431-2-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429133712.31431-1-joro@8bytes.org>
References: <20200429133712.31431-1-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Joerg Roedel <jroedel@suse.de>

Move the code out of iommu_group_get_for_dev() into a separate
function.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/iommu.c | 74 ++++++++++++++++++++++++++-----------------
 1 file changed, 45 insertions(+), 29 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 2b471419e26c..bfe011760ed1 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1361,6 +1361,41 @@ struct iommu_group *fsl_mc_device_group(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(fsl_mc_device_group);
 
+static int iommu_alloc_default_domain(struct device *dev,
+				      struct iommu_group *group)
+{
+	struct iommu_domain *dom;
+
+	if (group->default_domain)
+		return 0;
+
+	dom = __iommu_domain_alloc(dev->bus, iommu_def_domain_type);
+	if (!dom && iommu_def_domain_type != IOMMU_DOMAIN_DMA) {
+		dom = __iommu_domain_alloc(dev->bus, IOMMU_DOMAIN_DMA);
+		if (dom) {
+			dev_warn(dev,
+				 "failed to allocate default IOMMU domain of type %u; falling back to IOMMU_DOMAIN_DMA",
+				 iommu_def_domain_type);
+		}
+	}
+
+	if (!dom)
+		return -ENOMEM;
+
+	group->default_domain = dom;
+	if (!group->domain)
+		group->domain = dom;
+
+	if (!iommu_dma_strict) {
+		int attr = 1;
+		iommu_domain_set_attr(dom,
+				      DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
+				      &attr);
+	}
+
+	return 0;
+}
+
 /**
  * iommu_group_get_for_dev - Find or create the IOMMU group for a device
  * @dev: target device
@@ -1393,40 +1428,21 @@ struct iommu_group *iommu_group_get_for_dev(struct device *dev)
 
 	/*
 	 * Try to allocate a default domain - needs support from the
-	 * IOMMU driver.
+	 * IOMMU driver. There are still some drivers which don't support
+	 * default domains, so the return value is not yet checked.
 	 */
-	if (!group->default_domain) {
-		struct iommu_domain *dom;
-
-		dom = __iommu_domain_alloc(dev->bus, iommu_def_domain_type);
-		if (!dom && iommu_def_domain_type != IOMMU_DOMAIN_DMA) {
-			dom = __iommu_domain_alloc(dev->bus, IOMMU_DOMAIN_DMA);
-			if (dom) {
-				dev_warn(dev,
-					 "failed to allocate default IOMMU domain of type %u; falling back to IOMMU_DOMAIN_DMA",
-					 iommu_def_domain_type);
-			}
-		}
-
-		group->default_domain = dom;
-		if (!group->domain)
-			group->domain = dom;
-
-		if (dom && !iommu_dma_strict) {
-			int attr = 1;
-			iommu_domain_set_attr(dom,
-					      DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
-					      &attr);
-		}
-	}
+	iommu_alloc_default_domain(dev, group);
 
 	ret = iommu_group_add_device(group, dev);
-	if (ret) {
-		iommu_group_put(group);
-		return ERR_PTR(ret);
-	}
+	if (ret)
+		goto out_put_group;
 
 	return group;
+
+out_put_group:
+	iommu_group_put(group);
+
+	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL(iommu_group_get_for_dev);
 
-- 
2.17.1

