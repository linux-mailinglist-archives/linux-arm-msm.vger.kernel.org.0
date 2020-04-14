Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8225A1A7D90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 15:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731722AbgDNNX5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 09:23:57 -0400
Received: from 8bytes.org ([81.169.241.247]:35058 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2502885AbgDNNQC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 09:16:02 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 31ED54F2; Tue, 14 Apr 2020 15:15:53 +0200 (CEST)
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
Subject: [PATCH v2 10/33] iommu: Move new probe_device path to separate function
Date:   Tue, 14 Apr 2020 15:15:19 +0200
Message-Id: <20200414131542.25608-11-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200414131542.25608-1-joro@8bytes.org>
References: <20200414131542.25608-1-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Joerg Roedel <jroedel@suse.de>

This makes it easier to remove to old code-path when all drivers are
converted. As a side effect that it also fixes the error cleanup
path.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/iommu.c | 69 ++++++++++++++++++++++++++++---------------
 1 file changed, 46 insertions(+), 23 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 18eb3623bd00..8be047a4808f 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -218,12 +218,55 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 	return ret;
 }
 
+static int __iommu_probe_device_helper(struct device *dev)
+{
+	const struct iommu_ops *ops = dev->bus->iommu_ops;
+	struct iommu_group *group;
+	int ret;
+
+	ret = __iommu_probe_device(dev, NULL);
+	if (ret)
+		goto err_out;
+
+	/*
+	 * Try to allocate a default domain - needs support from the
+	 * IOMMU driver. There are still some drivers which don't
+	 * support default domains, so the return value is not yet
+	 * checked.
+	 */
+	iommu_alloc_default_domain(dev);
+
+	group = iommu_group_get(dev);
+	if (!group)
+		goto err_release;
+
+	if (group->default_domain)
+		ret = __iommu_attach_device(group->default_domain, dev);
+
+	iommu_group_put(group);
+
+	if (ret)
+		goto err_release;
+
+	if (ops->probe_finalize)
+		ops->probe_finalize(dev);
+
+	return 0;
+
+err_release:
+	iommu_release_device(dev);
+err_out:
+	return ret;
+
+}
+
 int iommu_probe_device(struct device *dev)
 {
 	const struct iommu_ops *ops = dev->bus->iommu_ops;
 	int ret;
 
 	WARN_ON(dev->iommu_group);
+
 	if (!ops)
 		return -EINVAL;
 
@@ -235,30 +278,10 @@ int iommu_probe_device(struct device *dev)
 		goto err_free_dev_param;
 	}
 
-	if (ops->probe_device) {
-		struct iommu_group *group;
-
-		ret = __iommu_probe_device(dev, NULL);
-
-		/*
-		 * Try to allocate a default domain - needs support from the
-		 * IOMMU driver. There are still some drivers which don't
-		 * support default domains, so the return value is not yet
-		 * checked.
-		 */
-		if (!ret)
-			iommu_alloc_default_domain(dev);
-
-		group = iommu_group_get(dev);
-		if (group && group->default_domain) {
-			ret = __iommu_attach_device(group->default_domain, dev);
-			iommu_group_put(group);
-		}
-
-	} else {
-		ret = ops->add_device(dev);
-	}
+	if (ops->probe_device)
+		return __iommu_probe_device_helper(dev);
 
+	ret = ops->add_device(dev);
 	if (ret)
 		goto err_module_put;
 
-- 
2.17.1

