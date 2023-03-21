Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3B636C2CBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 09:42:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230353AbjCUImp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 04:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbjCUIml (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 04:42:41 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9DC13E0B8
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 01:42:06 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1peXYh-0001Qw-1d; Tue, 21 Mar 2023 09:41:31 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1peXYe-005e98-92; Tue, 21 Mar 2023 09:41:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1peXYd-006hGQ-Kz; Tue, 21 Mar 2023 09:41:27 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robdclark@gmail.com>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        Jon Nettleton <jon@solid-run.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
Subject: [PATCH 04/10] iommu/arm-smmu: Convert to platform remove callback returning void
Date:   Tue, 21 Mar 2023 09:41:19 +0100
Message-Id: <20230321084125.337021-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230321084125.337021-1-u.kleine-koenig@pengutronix.de>
References: <20230321084125.337021-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4043; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=kWXkpZvflB5lXmWdM+KWkhTmexW66ttD1wVrWW+1BEE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkGW2pyeSt++0Ck5M1wwdirw6aPtPBEgAcXhET0 dJQAwUgfduJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBltqQAKCRCPgPtYfRL+ TsdHB/9GdPL0vQeQFhDM5ToYGFN6yHJqk1nFiLrCVfTQ1N/bX34jdZxuTtpgM2zGFPr05cYkP4E 4wrUpa7g3VzYI23iqM41V4zgp7lmjvo1xmS8F/bwrJlDOqv7UWg4ozYW4cSs1pj3y4FlqKYTek1 lJGgo5D8keYbW3vQdUewYR9AjUeJ0SGohI47mUymddfQAEo7sKrag/UaemSp5YOMFiC4nVmqwuq Mc9ZQEiK8Su+43v97WXtsnFSrJ5Lz/OmMs3gwDHo3bGNjpR6Q3o9G0Y19CRx3KG5fc/GC8UE2gz j1YKG9DxZ+QciLHOUAVay/3V4mcO6KBgIqsuyEes3GJWaTxe
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c   |  6 ++----
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 12 ++++--------
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index f4a36533ae47..b30a4bd7c79d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -2211,7 +2211,7 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
 	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
 }
 
-static int arm_smmu_device_remove(struct platform_device *pdev)
+static void arm_smmu_device_remove(struct platform_device *pdev)
 {
 	struct arm_smmu_device *smmu = platform_get_drvdata(pdev);
 
@@ -2219,8 +2219,6 @@ static int arm_smmu_device_remove(struct platform_device *pdev)
 	iommu_device_sysfs_remove(&smmu->iommu);
 
 	arm_smmu_device_shutdown(pdev);
-
-	return 0;
 }
 
 static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
@@ -2296,7 +2294,7 @@ static struct platform_driver arm_smmu_driver = {
 		.suppress_bind_attrs    = true,
 	},
 	.probe	= arm_smmu_device_probe,
-	.remove	= arm_smmu_device_remove,
+	.remove_new = arm_smmu_device_remove,
 	.shutdown = arm_smmu_device_shutdown,
 };
 module_platform_driver(arm_smmu_driver);
diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index c8b70f476cd8..a503ed758ec3 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -682,7 +682,7 @@ static int qcom_iommu_ctx_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int qcom_iommu_ctx_remove(struct platform_device *pdev)
+static void qcom_iommu_ctx_remove(struct platform_device *pdev)
 {
 	struct qcom_iommu_dev *qcom_iommu = dev_get_drvdata(pdev->dev.parent);
 	struct qcom_iommu_ctx *ctx = platform_get_drvdata(pdev);
@@ -690,8 +690,6 @@ static int qcom_iommu_ctx_remove(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 
 	qcom_iommu->ctxs[ctx->asid - 1] = NULL;
-
-	return 0;
 }
 
 static const struct of_device_id ctx_of_match[] = {
@@ -706,7 +704,7 @@ static struct platform_driver qcom_iommu_ctx_driver = {
 		.of_match_table	= ctx_of_match,
 	},
 	.probe	= qcom_iommu_ctx_probe,
-	.remove = qcom_iommu_ctx_remove,
+	.remove_new = qcom_iommu_ctx_remove,
 };
 
 static bool qcom_iommu_has_secure_context(struct qcom_iommu_dev *qcom_iommu)
@@ -824,7 +822,7 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int qcom_iommu_device_remove(struct platform_device *pdev)
+static void qcom_iommu_device_remove(struct platform_device *pdev)
 {
 	struct qcom_iommu_dev *qcom_iommu = platform_get_drvdata(pdev);
 
@@ -832,8 +830,6 @@ static int qcom_iommu_device_remove(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 	iommu_device_sysfs_remove(&qcom_iommu->iommu);
 	iommu_device_unregister(&qcom_iommu->iommu);
-
-	return 0;
 }
 
 static int __maybe_unused qcom_iommu_resume(struct device *dev)
@@ -870,7 +866,7 @@ static struct platform_driver qcom_iommu_driver = {
 		.pm		= &qcom_iommu_pm_ops,
 	},
 	.probe	= qcom_iommu_device_probe,
-	.remove	= qcom_iommu_device_remove,
+	.remove_new = qcom_iommu_device_remove,
 };
 
 static int __init qcom_iommu_init(void)
-- 
2.39.2

