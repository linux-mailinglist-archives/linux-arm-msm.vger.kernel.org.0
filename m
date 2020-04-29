Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 625FC1BDEC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 15:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727934AbgD2Nhp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 09:37:45 -0400
Received: from 8bytes.org ([81.169.241.247]:39788 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727917AbgD2Nhp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 09:37:45 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id ED118BAD; Wed, 29 Apr 2020 15:37:36 +0200 (CEST)
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
Subject: [PATCH v3 09/34] iommu: Keep a list of allocated groups in __iommu_probe_device()
Date:   Wed, 29 Apr 2020 15:36:47 +0200
Message-Id: <20200429133712.31431-10-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429133712.31431-1-joro@8bytes.org>
References: <20200429133712.31431-1-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Joerg Roedel <jroedel@suse.de>

This is needed to defer default_domain allocation for new IOMMU groups
until all devices have been added to the group.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/iommu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 7a385c18e1a5..18eb3623bd00 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -44,6 +44,7 @@ struct iommu_group {
 	int id;
 	struct iommu_domain *default_domain;
 	struct iommu_domain *domain;
+	struct list_head entry;
 };
 
 struct group_device {
@@ -184,7 +185,7 @@ static void dev_iommu_free(struct device *dev)
 	dev->iommu = NULL;
 }
 
-static int __iommu_probe_device(struct device *dev)
+static int __iommu_probe_device(struct device *dev, struct list_head *group_list)
 {
 	const struct iommu_ops *ops = dev->bus->iommu_ops;
 	struct iommu_device *iommu_dev;
@@ -204,6 +205,9 @@ static int __iommu_probe_device(struct device *dev)
 	}
 	iommu_group_put(group);
 
+	if (group_list && !group->default_domain && list_empty(&group->entry))
+		list_add_tail(&group->entry, group_list);
+
 	iommu_device_link(iommu_dev, dev);
 
 	return 0;
@@ -234,7 +238,7 @@ int iommu_probe_device(struct device *dev)
 	if (ops->probe_device) {
 		struct iommu_group *group;
 
-		ret = __iommu_probe_device(dev);
+		ret = __iommu_probe_device(dev, NULL);
 
 		/*
 		 * Try to allocate a default domain - needs support from the
@@ -567,6 +571,7 @@ struct iommu_group *iommu_group_alloc(void)
 	group->kobj.kset = iommu_group_kset;
 	mutex_init(&group->mutex);
 	INIT_LIST_HEAD(&group->devices);
+	INIT_LIST_HEAD(&group->entry);
 	BLOCKING_INIT_NOTIFIER_HEAD(&group->notifier);
 
 	ret = ida_simple_get(&iommu_group_ida, 0, 0, GFP_KERNEL);
-- 
2.17.1

