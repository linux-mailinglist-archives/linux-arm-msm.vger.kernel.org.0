Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6671A7D29
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 15:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730716AbgDNNTw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 09:19:52 -0400
Received: from 8bytes.org ([81.169.241.247]:35236 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2502906AbgDNNQH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 09:16:07 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 470097E3; Tue, 14 Apr 2020 15:15:57 +0200 (CEST)
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
Subject: [PATCH v2 30/33] iommu/exynos: Use first SYSMMU in controllers list for IOMMU core
Date:   Tue, 14 Apr 2020 15:15:39 +0200
Message-Id: <20200414131542.25608-31-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200414131542.25608-1-joro@8bytes.org>
References: <20200414131542.25608-1-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Joerg Roedel <jroedel@suse.de>

On Exynos platforms there can be more than one SYSMMU (IOMMU) for one
DMA master device. Since the IOMMU core code expects only one hardware
IOMMU, use the first SYSMMU in the list.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/exynos-iommu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 186ff5cc975c..09cdd163560a 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -1261,6 +1261,11 @@ static int exynos_iommu_add_device(struct device *dev)
 	}
 	iommu_group_put(group);
 
+	/* There is always at least one entry, see exynos_iommu_of_xlate() */
+	data = list_first_entry(&owner->controllers,
+				struct sysmmu_drvdata, owner_node);
+	iommu_device_link(&data->iommu, dev);
+
 	return 0;
 }
 
@@ -1286,6 +1291,11 @@ static void exynos_iommu_remove_device(struct device *dev)
 
 	list_for_each_entry(data, &owner->controllers, owner_node)
 		device_link_del(data->link);
+
+	/* There is always at least one entry, see exynos_iommu_of_xlate() */
+	data = list_first_entry(&owner->controllers,
+				struct sysmmu_drvdata, owner_node);
+	iommu_device_unlink(&data->iommu, dev);
 }
 
 static int exynos_iommu_of_xlate(struct device *dev,
-- 
2.17.1

