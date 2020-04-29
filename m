Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 673D81BDE59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 15:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728196AbgD2Nib (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 09:38:31 -0400
Received: from 8bytes.org ([81.169.241.247]:39838 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728045AbgD2Nhz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 09:37:55 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 52035F0E; Wed, 29 Apr 2020 15:37:41 +0200 (CEST)
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
Subject: [PATCH v3 31/34] iommu/exynos: Convert to probe/release_device() call-backs
Date:   Wed, 29 Apr 2020 15:37:09 +0200
Message-Id: <20200429133712.31431-32-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429133712.31431-1-joro@8bytes.org>
References: <20200429133712.31431-1-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Joerg Roedel <jroedel@suse.de>

Convert the Exynos IOMMU driver to use the probe_device() and
release_device() call-backs of iommu_ops, so that the iommu core code
does the group and sysfs setup.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/exynos-iommu.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 09cdd163560a..60c8a56e4a3f 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -1235,19 +1235,13 @@ static phys_addr_t exynos_iommu_iova_to_phys(struct iommu_domain *iommu_domain,
 	return phys;
 }
 
-static int exynos_iommu_add_device(struct device *dev)
+static struct iommu_device *exynos_iommu_probe_device(struct device *dev)
 {
 	struct exynos_iommu_owner *owner = dev->archdata.iommu;
 	struct sysmmu_drvdata *data;
-	struct iommu_group *group;
 
 	if (!has_sysmmu(dev))
-		return -ENODEV;
-
-	group = iommu_group_get_for_dev(dev);
-
-	if (IS_ERR(group))
-		return PTR_ERR(group);
+		return ERR_PTR(-ENODEV);
 
 	list_for_each_entry(data, &owner->controllers, owner_node) {
 		/*
@@ -1259,17 +1253,15 @@ static int exynos_iommu_add_device(struct device *dev)
 					     DL_FLAG_STATELESS |
 					     DL_FLAG_PM_RUNTIME);
 	}
-	iommu_group_put(group);
 
 	/* There is always at least one entry, see exynos_iommu_of_xlate() */
 	data = list_first_entry(&owner->controllers,
 				struct sysmmu_drvdata, owner_node);
-	iommu_device_link(&data->iommu, dev);
 
-	return 0;
+	return &data->iommu;
 }
 
-static void exynos_iommu_remove_device(struct device *dev)
+static void exynos_iommu_release_device(struct device *dev)
 {
 	struct exynos_iommu_owner *owner = dev->archdata.iommu;
 	struct sysmmu_drvdata *data;
@@ -1287,15 +1279,9 @@ static void exynos_iommu_remove_device(struct device *dev)
 			iommu_group_put(group);
 		}
 	}
-	iommu_group_remove_device(dev);
 
 	list_for_each_entry(data, &owner->controllers, owner_node)
 		device_link_del(data->link);
-
-	/* There is always at least one entry, see exynos_iommu_of_xlate() */
-	data = list_first_entry(&owner->controllers,
-				struct sysmmu_drvdata, owner_node);
-	iommu_device_unlink(&data->iommu, dev);
 }
 
 static int exynos_iommu_of_xlate(struct device *dev,
@@ -1341,8 +1327,8 @@ static const struct iommu_ops exynos_iommu_ops = {
 	.unmap = exynos_iommu_unmap,
 	.iova_to_phys = exynos_iommu_iova_to_phys,
 	.device_group = generic_device_group,
-	.add_device = exynos_iommu_add_device,
-	.remove_device = exynos_iommu_remove_device,
+	.probe_device = exynos_iommu_probe_device,
+	.release_device = exynos_iommu_release_device,
 	.pgsize_bitmap = SECT_SIZE | LPAGE_SIZE | SPAGE_SIZE,
 	.of_xlate = exynos_iommu_of_xlate,
 };
-- 
2.17.1

