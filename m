Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA171A140F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2020 20:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbgDGSiE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 14:38:04 -0400
Received: from 8bytes.org ([81.169.241.247]:57616 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727192AbgDGSiE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 14:38:04 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 12C8A70B; Tue,  7 Apr 2020 20:37:54 +0200 (CEST)
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
Subject: [RFC PATCH 34/34] iommu: Unexport iommu_group_get_for_dev()
Date:   Tue,  7 Apr 2020 20:37:42 +0200
Message-Id: <20200407183742.4344-35-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200407183742.4344-1-joro@8bytes.org>
References: <20200407183742.4344-1-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Joerg Roedel <jroedel@suse.de>

The function is now only used in IOMMU core code and shouldn't be used
outside of it anyway, so remove the export for it.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/iommu.c | 4 ++--
 include/linux/iommu.h | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index d9032f9d597c..8a5e1ac328dd 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -91,6 +91,7 @@ static void __iommu_detach_group(struct iommu_domain *domain,
 				 struct iommu_group *group);
 static int iommu_create_device_direct_mappings(struct iommu_group *group,
 					       struct device *dev);
+static struct iommu_group *iommu_group_get_for_dev(struct device *dev);
 
 #define IOMMU_GROUP_ATTR(_name, _mode, _show, _store)		\
 struct iommu_group_attribute iommu_group_attr_##_name =		\
@@ -1483,7 +1484,7 @@ static int iommu_alloc_default_domain(struct device *dev)
  * to the returned IOMMU group, which will already include the provided
  * device.  The reference should be released with iommu_group_put().
  */
-struct iommu_group *iommu_group_get_for_dev(struct device *dev)
+static struct iommu_group *iommu_group_get_for_dev(struct device *dev)
 {
 	const struct iommu_ops *ops = dev->bus->iommu_ops;
 	struct iommu_group *group;
@@ -1514,7 +1515,6 @@ struct iommu_group *iommu_group_get_for_dev(struct device *dev)
 
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL(iommu_group_get_for_dev);
 
 struct iommu_domain *iommu_group_default_domain(struct iommu_group *group)
 {
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index dd076366383f..7cfd2dddb49d 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -527,7 +527,6 @@ extern int iommu_page_response(struct device *dev,
 			       struct iommu_page_response *msg);
 
 extern int iommu_group_id(struct iommu_group *group);
-extern struct iommu_group *iommu_group_get_for_dev(struct device *dev);
 extern struct iommu_domain *iommu_group_default_domain(struct iommu_group *);
 
 extern int iommu_domain_get_attr(struct iommu_domain *domain, enum iommu_attr,
-- 
2.17.1

