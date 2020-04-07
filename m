Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC1D21A14A0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2020 20:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728036AbgDGSjV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 14:39:21 -0400
Received: from 8bytes.org ([81.169.241.247]:57778 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726901AbgDGSiA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 14:38:00 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id E4DB248C; Tue,  7 Apr 2020 20:37:51 +0200 (CEST)
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
Subject: [RFC PATCH 19/34] iommu/pamu: Convert to probe/release_device() call-backs
Date:   Tue,  7 Apr 2020 20:37:27 +0200
Message-Id: <20200407183742.4344-20-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200407183742.4344-1-joro@8bytes.org>
References: <20200407183742.4344-1-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Joerg Roedel <jroedel@suse.de>

Convert the PAMU IOMMU driver to use the probe_device() and
release_device() call-backs of iommu_ops, so that the iommu core code
does the group and sysfs setup.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/fsl_pamu_domain.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index 06828e2698d5..928d37771ece 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -1016,25 +1016,13 @@ static struct iommu_group *fsl_pamu_device_group(struct device *dev)
 	return group;
 }
 
-static int fsl_pamu_add_device(struct device *dev)
+static struct iommu_device *fsl_pamu_probe_device(struct device *dev)
 {
-	struct iommu_group *group;
-
-	group = iommu_group_get_for_dev(dev);
-	if (IS_ERR(group))
-		return PTR_ERR(group);
-
-	iommu_group_put(group);
-
-	iommu_device_link(&pamu_iommu, dev);
-
-	return 0;
+	return &pamu_iommu;
 }
 
-static void fsl_pamu_remove_device(struct device *dev)
+static void fsl_pamu_release_device(struct device *dev)
 {
-	iommu_device_unlink(&pamu_iommu, dev);
-	iommu_group_remove_device(dev);
 }
 
 static const struct iommu_ops fsl_pamu_ops = {
@@ -1048,8 +1036,8 @@ static const struct iommu_ops fsl_pamu_ops = {
 	.iova_to_phys	= fsl_pamu_iova_to_phys,
 	.domain_set_attr = fsl_pamu_set_domain_attr,
 	.domain_get_attr = fsl_pamu_get_domain_attr,
-	.add_device	= fsl_pamu_add_device,
-	.remove_device	= fsl_pamu_remove_device,
+	.probe_device	= fsl_pamu_probe_device,
+	.release_device	= fsl_pamu_release_device,
 	.device_group   = fsl_pamu_device_group,
 };
 
-- 
2.17.1

