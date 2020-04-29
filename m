Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 439FA1BDF24
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 15:41:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgD2Nky (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 09:40:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727879AbgD2Nhk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 09:37:40 -0400
Received: from theia.8bytes.org (8bytes.org [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3F83C03C1AE;
        Wed, 29 Apr 2020 06:37:39 -0700 (PDT)
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id B843B6BB; Wed, 29 Apr 2020 15:37:35 +0200 (CEST)
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
Subject: [PATCH v3 03/34] iommu/amd: Implement iommu_ops->def_domain_type call-back
Date:   Wed, 29 Apr 2020 15:36:41 +0200
Message-Id: <20200429133712.31431-4-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429133712.31431-1-joro@8bytes.org>
References: <20200429133712.31431-1-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Joerg Roedel <jroedel@suse.de>

Implement the new def_domain_type call-back for the AMD IOMMU driver.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/amd_iommu.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index 20cce366e951..73b4f84cf449 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -2661,6 +2661,20 @@ static void amd_iommu_iotlb_sync(struct iommu_domain *domain,
 	amd_iommu_flush_iotlb_all(domain);
 }
 
+static int amd_iommu_def_domain_type(struct device *dev)
+{
+	struct iommu_dev_data *dev_data;
+
+	dev_data = get_dev_data(dev);
+	if (!dev_data)
+		return 0;
+
+	if (dev_data->iommu_v2)
+		return IOMMU_DOMAIN_IDENTITY;
+
+	return 0;
+}
+
 const struct iommu_ops amd_iommu_ops = {
 	.capable = amd_iommu_capable,
 	.domain_alloc = amd_iommu_domain_alloc,
@@ -2680,6 +2694,7 @@ const struct iommu_ops amd_iommu_ops = {
 	.pgsize_bitmap	= AMD_IOMMU_PGSIZES,
 	.flush_iotlb_all = amd_iommu_flush_iotlb_all,
 	.iotlb_sync = amd_iommu_iotlb_sync,
+	.def_domain_type = amd_iommu_def_domain_type,
 };
 
 /*****************************************************************************
-- 
2.17.1

