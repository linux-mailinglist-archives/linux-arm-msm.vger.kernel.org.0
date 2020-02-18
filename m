Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD489162DEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 19:13:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbgBRSMu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 13:12:50 -0500
Received: from foss.arm.com ([217.140.110.172]:57990 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726770AbgBRSMu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 13:12:50 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FE9D101E;
        Tue, 18 Feb 2020 10:12:49 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 82C723F73B;
        Tue, 18 Feb 2020 10:12:48 -0800 (PST)
From:   Robin Murphy <robin.murphy@arm.com>
To:     joro@8bytes.org, robdclark@gmail.com
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, stephan@gerhold.net,
        linux-arm-msm@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: [PATCH] iommu/qcom: Fix bogus detach logic
Date:   Tue, 18 Feb 2020 18:12:41 +0000
Message-Id: <be92829c6e5467634b109add002351e6cf9e18d2.1582049382.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.23.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently, the implementation of qcom_iommu_domain_free() is guaranteed
to do one of two things: WARN() and leak everything, or dereference NULL
and crash. That alone is terrible, but in fact the whole idea of trying
to track the liveness of a domain via the qcom_domain->iommu pointer as
a sanity check is full of fundamentally flawed assumptions. Make things
robust and actually functional by not trying to be quite so clever.

Reported-by: Brian Masney <masneyb@onstation.org>
Tested-by: Brian Masney <masneyb@onstation.org>
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Fixes: 0ae349a0f33f ("iommu/qcom: Add qcom_iommu")
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/qcom_iommu.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index 39759db4f003..4328da0b0a9f 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -344,21 +344,19 @@ static void qcom_iommu_domain_free(struct iommu_domain *domain)
 {
 	struct qcom_iommu_domain *qcom_domain = to_qcom_iommu_domain(domain);
 
-	if (WARN_ON(qcom_domain->iommu))    /* forgot to detach? */
-		return;
-
 	iommu_put_dma_cookie(domain);
 
-	/* NOTE: unmap can be called after client device is powered off,
-	 * for example, with GPUs or anything involving dma-buf.  So we
-	 * cannot rely on the device_link.  Make sure the IOMMU is on to
-	 * avoid unclocked accesses in the TLB inv path:
-	 */
-	pm_runtime_get_sync(qcom_domain->iommu->dev);
-
-	free_io_pgtable_ops(qcom_domain->pgtbl_ops);
-
-	pm_runtime_put_sync(qcom_domain->iommu->dev);
+	if (qcom_domain->iommu) {
+		/*
+		 * NOTE: unmap can be called after client device is powered
+		 * off, for example, with GPUs or anything involving dma-buf.
+		 * So we cannot rely on the device_link.  Make sure the IOMMU
+		 * is on to avoid unclocked accesses in the TLB inv path:
+		 */
+		pm_runtime_get_sync(qcom_domain->iommu->dev);
+		free_io_pgtable_ops(qcom_domain->pgtbl_ops);
+		pm_runtime_put_sync(qcom_domain->iommu->dev);
+	}
 
 	kfree(qcom_domain);
 }
@@ -404,7 +402,7 @@ static void qcom_iommu_detach_dev(struct iommu_domain *domain, struct device *de
 	struct qcom_iommu_domain *qcom_domain = to_qcom_iommu_domain(domain);
 	unsigned i;
 
-	if (!qcom_domain->iommu)
+	if (WARN_ON(!qcom_domain->iommu))
 		return;
 
 	pm_runtime_get_sync(qcom_iommu->dev);
@@ -417,8 +415,6 @@ static void qcom_iommu_detach_dev(struct iommu_domain *domain, struct device *de
 		ctx->domain = NULL;
 	}
 	pm_runtime_put_sync(qcom_iommu->dev);
-
-	qcom_domain->iommu = NULL;
 }
 
 static int qcom_iommu_map(struct iommu_domain *domain, unsigned long iova,
-- 
2.23.0.dirty

