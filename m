Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9FA1BDE62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 15:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728070AbgD2Nhy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 09:37:54 -0400
Received: from 8bytes.org ([81.169.241.247]:39788 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728028AbgD2Nhw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 09:37:52 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 50F30F06; Wed, 29 Apr 2020 15:37:40 +0200 (CEST)
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
Subject: [PATCH v3 26/34] iommu/tegra: Convert to probe/release_device() call-backs
Date:   Wed, 29 Apr 2020 15:37:04 +0200
Message-Id: <20200429133712.31431-27-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429133712.31431-1-joro@8bytes.org>
References: <20200429133712.31431-1-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Joerg Roedel <jroedel@suse.de>

Convert the Tegra IOMMU drivers to use the probe_device() and
release_device() call-backs of iommu_ops, so that the iommu core code
does the group and sysfs setup.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/tegra-gart.c | 24 ++++++------------------
 drivers/iommu/tegra-smmu.c | 31 ++++++++-----------------------
 2 files changed, 14 insertions(+), 41 deletions(-)

diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
index db6559e8336f..5fbdff6ff41a 100644
--- a/drivers/iommu/tegra-gart.c
+++ b/drivers/iommu/tegra-gart.c
@@ -243,28 +243,16 @@ static bool gart_iommu_capable(enum iommu_cap cap)
 	return false;
 }
 
-static int gart_iommu_add_device(struct device *dev)
+static struct iommu_device *gart_iommu_probe_device(struct device *dev)
 {
-	struct iommu_group *group;
-
 	if (!dev_iommu_fwspec_get(dev))
-		return -ENODEV;
-
-	group = iommu_group_get_for_dev(dev);
-	if (IS_ERR(group))
-		return PTR_ERR(group);
-
-	iommu_group_put(group);
+		return ERR_PTR(-ENODEV);
 
-	iommu_device_link(&gart_handle->iommu, dev);
-
-	return 0;
+	return &gart_handle->iommu;
 }
 
-static void gart_iommu_remove_device(struct device *dev)
+static void gart_iommu_release_device(struct device *dev)
 {
-	iommu_group_remove_device(dev);
-	iommu_device_unlink(&gart_handle->iommu, dev);
 }
 
 static int gart_iommu_of_xlate(struct device *dev,
@@ -290,8 +278,8 @@ static const struct iommu_ops gart_iommu_ops = {
 	.domain_free	= gart_iommu_domain_free,
 	.attach_dev	= gart_iommu_attach_dev,
 	.detach_dev	= gart_iommu_detach_dev,
-	.add_device	= gart_iommu_add_device,
-	.remove_device	= gart_iommu_remove_device,
+	.probe_device	= gart_iommu_probe_device,
+	.release_device	= gart_iommu_release_device,
 	.device_group	= generic_device_group,
 	.map		= gart_iommu_map,
 	.unmap		= gart_iommu_unmap,
diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 63a147b623e6..7426b7666e2b 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -757,11 +757,10 @@ static int tegra_smmu_configure(struct tegra_smmu *smmu, struct device *dev,
 	return 0;
 }
 
-static int tegra_smmu_add_device(struct device *dev)
+static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
 {
 	struct device_node *np = dev->of_node;
 	struct tegra_smmu *smmu = NULL;
-	struct iommu_group *group;
 	struct of_phandle_args args;
 	unsigned int index = 0;
 	int err;
@@ -774,7 +773,7 @@ static int tegra_smmu_add_device(struct device *dev)
 			of_node_put(args.np);
 
 			if (err < 0)
-				return err;
+				return ERR_PTR(err);
 
 			/*
 			 * Only a single IOMMU master interface is currently
@@ -783,8 +782,6 @@ static int tegra_smmu_add_device(struct device *dev)
 			 */
 			dev->archdata.iommu = smmu;
 
-			iommu_device_link(&smmu->iommu, dev);
-
 			break;
 		}
 
@@ -793,26 +790,14 @@ static int tegra_smmu_add_device(struct device *dev)
 	}
 
 	if (!smmu)
-		return -ENODEV;
-
-	group = iommu_group_get_for_dev(dev);
-	if (IS_ERR(group))
-		return PTR_ERR(group);
-
-	iommu_group_put(group);
+		return ERR_PTR(-ENODEV);
 
-	return 0;
+	return &smmu->iommu;
 }
 
-static void tegra_smmu_remove_device(struct device *dev)
+static void tegra_smmu_release_device(struct device *dev)
 {
-	struct tegra_smmu *smmu = dev->archdata.iommu;
-
-	if (smmu)
-		iommu_device_unlink(&smmu->iommu, dev);
-
 	dev->archdata.iommu = NULL;
-	iommu_group_remove_device(dev);
 }
 
 static const struct tegra_smmu_group_soc *
@@ -895,8 +880,8 @@ static const struct iommu_ops tegra_smmu_ops = {
 	.domain_free = tegra_smmu_domain_free,
 	.attach_dev = tegra_smmu_attach_dev,
 	.detach_dev = tegra_smmu_detach_dev,
-	.add_device = tegra_smmu_add_device,
-	.remove_device = tegra_smmu_remove_device,
+	.probe_device = tegra_smmu_probe_device,
+	.release_device = tegra_smmu_release_device,
 	.device_group = tegra_smmu_device_group,
 	.map = tegra_smmu_map,
 	.unmap = tegra_smmu_unmap,
@@ -1015,7 +1000,7 @@ struct tegra_smmu *tegra_smmu_probe(struct device *dev,
 	 * value. However the IOMMU registration process will attempt to add
 	 * all devices to the IOMMU when bus_set_iommu() is called. In order
 	 * not to rely on global variables to track the IOMMU instance, we
-	 * set it here so that it can be looked up from the .add_device()
+	 * set it here so that it can be looked up from the .probe_device()
 	 * callback via the IOMMU device's .drvdata field.
 	 */
 	mc->smmu = smmu;
-- 
2.17.1

