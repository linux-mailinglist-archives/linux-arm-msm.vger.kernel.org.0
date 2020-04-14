Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45B8A1A7D2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 15:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502905AbgDNNTx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 09:19:53 -0400
Received: from 8bytes.org ([81.169.241.247]:35334 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2502896AbgDNNQG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 09:16:06 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 49BD8694; Tue, 14 Apr 2020 15:15:55 +0200 (CEST)
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
Subject: [PATCH v2 20/33] iommu/virtio: Convert to probe/release_device() call-backs
Date:   Tue, 14 Apr 2020 15:15:29 +0200
Message-Id: <20200414131542.25608-21-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200414131542.25608-1-joro@8bytes.org>
References: <20200414131542.25608-1-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Joerg Roedel <jroedel@suse.de>

Convert the VirtIO IOMMU driver to use the probe_device() and
release_device() call-backs of iommu_ops, so that the iommu core code
does the group and sysfs setup.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/virtio-iommu.c | 41 +++++++++---------------------------
 1 file changed, 10 insertions(+), 31 deletions(-)

diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index d5cac4f46ca5..bda300c2a438 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -865,24 +865,23 @@ static struct viommu_dev *viommu_get_by_fwnode(struct fwnode_handle *fwnode)
 	return dev ? dev_to_virtio(dev)->priv : NULL;
 }
 
-static int viommu_add_device(struct device *dev)
+static struct iommu_device *viommu_probe_device(struct device *dev)
 {
 	int ret;
-	struct iommu_group *group;
 	struct viommu_endpoint *vdev;
 	struct viommu_dev *viommu = NULL;
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 
 	if (!fwspec || fwspec->ops != &viommu_ops)
-		return -ENODEV;
+		return ERR_PTR(-ENODEV);
 
 	viommu = viommu_get_by_fwnode(fwspec->iommu_fwnode);
 	if (!viommu)
-		return -ENODEV;
+		return ERR_PTR(-ENODEV);
 
 	vdev = kzalloc(sizeof(*vdev), GFP_KERNEL);
 	if (!vdev)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	vdev->dev = dev;
 	vdev->viommu = viommu;
@@ -896,45 +895,25 @@ static int viommu_add_device(struct device *dev)
 			goto err_free_dev;
 	}
 
-	ret = iommu_device_link(&viommu->iommu, dev);
-	if (ret)
-		goto err_free_dev;
+	return &viommu->iommu;
 
-	/*
-	 * Last step creates a default domain and attaches to it. Everything
-	 * must be ready.
-	 */
-	group = iommu_group_get_for_dev(dev);
-	if (IS_ERR(group)) {
-		ret = PTR_ERR(group);
-		goto err_unlink_dev;
-	}
-
-	iommu_group_put(group);
-
-	return PTR_ERR_OR_ZERO(group);
-
-err_unlink_dev:
-	iommu_device_unlink(&viommu->iommu, dev);
 err_free_dev:
 	generic_iommu_put_resv_regions(dev, &vdev->resv_regions);
 	kfree(vdev);
 
-	return ret;
+	return ERR_PTR(ret);
 }
 
-static void viommu_remove_device(struct device *dev)
+static void viommu_release_device(struct device *dev)
 {
-	struct viommu_endpoint *vdev;
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct viommu_endpoint *vdev;
 
 	if (!fwspec || fwspec->ops != &viommu_ops)
 		return;
 
 	vdev = dev_iommu_priv_get(dev);
 
-	iommu_group_remove_device(dev);
-	iommu_device_unlink(&vdev->viommu->iommu, dev);
 	generic_iommu_put_resv_regions(dev, &vdev->resv_regions);
 	kfree(vdev);
 }
@@ -960,8 +939,8 @@ static struct iommu_ops viommu_ops = {
 	.unmap			= viommu_unmap,
 	.iova_to_phys		= viommu_iova_to_phys,
 	.iotlb_sync		= viommu_iotlb_sync,
-	.add_device		= viommu_add_device,
-	.remove_device		= viommu_remove_device,
+	.probe_device		= viommu_probe_device,
+	.release_device		= viommu_release_device,
 	.device_group		= viommu_device_group,
 	.get_resv_regions	= viommu_get_resv_regions,
 	.put_resv_regions	= generic_iommu_put_resv_regions,
-- 
2.17.1

