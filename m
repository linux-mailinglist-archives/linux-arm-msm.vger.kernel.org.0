Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6E2817F326
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 10:14:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgCJJNN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 05:13:13 -0400
Received: from 8bytes.org ([81.169.241.247]:50586 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726481AbgCJJMh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 05:12:37 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 633C0869; Tue, 10 Mar 2020 10:12:33 +0100 (CET)
From:   Joerg Roedel <joro@8bytes.org>
To:     iommu@lists.linux-foundation.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        virtualization@lists.linux-foundation.org,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <jroedel@suse.de>
Subject: [PATCH 09/15] iommu/arm-smmu-v3: Use accessor functions for iommu private data
Date:   Tue, 10 Mar 2020 10:12:23 +0100
Message-Id: <20200310091229.29830-10-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200310091229.29830-1-joro@8bytes.org>
References: <20200310091229.29830-1-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Joerg Roedel <jroedel@suse.de>

Make use of dev_iommu_priv_set/get() functions in the code.

Tested-by: Hanjun Guo <guohanjun@huawei.com>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/arm-smmu-v3.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index aa3ac2a03807..2b68498dfb66 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -2659,7 +2659,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 	if (!fwspec)
 		return -ENOENT;
 
-	master = fwspec->iommu_priv;
+	master = dev_iommu_priv_get(dev);
 	smmu = master->smmu;
 
 	arm_smmu_detach_dev(master);
@@ -2795,7 +2795,7 @@ static int arm_smmu_add_device(struct device *dev)
 	if (!fwspec || fwspec->ops != &arm_smmu_ops)
 		return -ENODEV;
 
-	if (WARN_ON_ONCE(fwspec->iommu_priv))
+	if (WARN_ON_ONCE(dev_iommu_priv_get(dev)))
 		return -EBUSY;
 
 	smmu = arm_smmu_get_by_fwnode(fwspec->iommu_fwnode);
@@ -2810,7 +2810,7 @@ static int arm_smmu_add_device(struct device *dev)
 	master->smmu = smmu;
 	master->sids = fwspec->ids;
 	master->num_sids = fwspec->num_ids;
-	fwspec->iommu_priv = master;
+	dev_iommu_priv_set(dev, master);
 
 	/* Check the SIDs are in range of the SMMU and our stream table */
 	for (i = 0; i < master->num_sids; i++) {
@@ -2852,7 +2852,7 @@ static int arm_smmu_add_device(struct device *dev)
 	iommu_device_unlink(&smmu->iommu, dev);
 err_free_master:
 	kfree(master);
-	fwspec->iommu_priv = NULL;
+	dev_iommu_priv_set(dev, NULL);
 	return ret;
 }
 
@@ -2865,7 +2865,7 @@ static void arm_smmu_remove_device(struct device *dev)
 	if (!fwspec || fwspec->ops != &arm_smmu_ops)
 		return;
 
-	master = fwspec->iommu_priv;
+	master = dev_iommu_priv_get(dev);
 	smmu = master->smmu;
 	arm_smmu_detach_dev(master);
 	iommu_group_remove_device(dev);
-- 
2.17.1

