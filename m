Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3381942AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2020 16:09:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728187AbgCZPIv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Mar 2020 11:08:51 -0400
Received: from 8bytes.org ([81.169.241.247]:55856 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728110AbgCZPIv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Mar 2020 11:08:51 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 1D83375B; Thu, 26 Mar 2020 16:08:46 +0100 (CET)
From:   Joerg Roedel <joro@8bytes.org>
To:     iommu@lists.linux-foundation.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org, guohanjun@huawei.com,
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joerg Roedel <jroedel@suse.de>
Subject: [PATCH v4 07/16] iommu/arm-smmu: Fix uninitilized variable warning
Date:   Thu, 26 Mar 2020 16:08:32 +0100
Message-Id: <20200326150841.10083-8-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326150841.10083-1-joro@8bytes.org>
References: <20200326150841.10083-1-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Joerg Roedel <jroedel@suse.de>

Some unrelated changes in the iommu code caused a new warning to
appear in the arm-smmu driver:

  CC      drivers/iommu/arm-smmu.o
drivers/iommu/arm-smmu.c: In function 'arm_smmu_add_device':
drivers/iommu/arm-smmu.c:1441:2: warning: 'smmu' may be used uninitialized in this function [-Wmaybe-uninitialized]
  arm_smmu_rpm_put(smmu);
  ^~~~~~~~~~~~~~~~~~~~~~

The warning is a false positive, but initialize the variable to NULL
to get rid of it.

Tested-by: Will Deacon <will@kernel.org> # arm-smmu
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/arm-smmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 16c4b87af42b..980aae73b45b 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -1383,7 +1383,7 @@ struct arm_smmu_device *arm_smmu_get_by_fwnode(struct fwnode_handle *fwnode)
 
 static int arm_smmu_add_device(struct device *dev)
 {
-	struct arm_smmu_device *smmu;
+	struct arm_smmu_device *smmu = NULL;
 	struct arm_smmu_master_cfg *cfg;
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	int i, ret;
-- 
2.17.1

