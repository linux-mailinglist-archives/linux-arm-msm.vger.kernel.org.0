Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7FBC26EA54
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 03:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgIRBMy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Sep 2020 21:12:54 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:36312 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725886AbgIRBMy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Sep 2020 21:12:54 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 84CE1DB575499A97B6FC;
        Fri, 18 Sep 2020 09:12:52 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Fri, 18 Sep 2020
 09:12:46 +0800
From:   Yu Kuai <yukuai3@huawei.com>
To:     <robdclark@gmail.com>, <will@kernel.org>, <joro@8bytes.org>
CC:     <iommu@lists.linux-foundation.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <yukuai3@huawei.com>,
        <yi.zhang@huawei.com>
Subject: [PATCH] iommu/qcom: add missing put_device() call in qcom_iommu_of_xlate()
Date:   Fri, 18 Sep 2020 09:13:57 +0800
Message-ID: <20200918011357.909335-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

if of_find_device_by_node() succeed, qcom_iommu_of_xlate() doesn't have
a corresponding put_device(). Thus add put_device() to fix the exception
handling for this function implementation.

Fixes: e86d1aa8b60f ("iommu/arm-smmu: Move Arm SMMU drivers into their own subdirectory")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 9535a6af7553..7a9594d221e0 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -584,8 +584,10 @@ static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 	 * index into qcom_iommu->ctxs:
 	 */
 	if (WARN_ON(asid < 1) ||
-	    WARN_ON(asid > qcom_iommu->num_ctxs))
+	    WARN_ON(asid > qcom_iommu->num_ctxs)) {
+		put_device(&iommu_pdev->dev);
 		return -EINVAL;
+	}
 
 	if (!dev_iommu_priv_get(dev)) {
 		dev_iommu_priv_set(dev, qcom_iommu);
@@ -595,6 +597,7 @@ static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 		 * banks are ok, but multiple devices are not:
 		 */
 		if (WARN_ON(qcom_iommu != dev_iommu_priv_get(dev)))
+			put_device(&iommu_pdev->dev);
 			return -EINVAL;
 	}
 
-- 
2.25.4

