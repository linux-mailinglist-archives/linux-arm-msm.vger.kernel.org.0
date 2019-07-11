Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0C9C654EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2019 13:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728298AbfGKLEA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jul 2019 07:04:00 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:33796 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728024AbfGKLD7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jul 2019 07:03:59 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id CAF7A60DB3; Thu, 11 Jul 2019 11:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562843038;
        bh=L93FB1uglHy+RXCU4rSQkxj+vgA1oeF54LVXpag5T1Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cMNKr7wgpp3sQ/qWr7b38DRWZRe0ITB4YteM0APgpZPCeLWRMT2qzReiQB0mWVXlG
         5+WVC2jxLuijci07O93TsYRelKPMtvyLZ9Uu6tBHumaZAbXnnqouV2Sst74UXzS79L
         WdboTJmevqzBsNHahvTcyXriZdT9bLb58u8Qpp9A=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-41.ap.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A0FFB60863;
        Thu, 11 Jul 2019 11:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562843038;
        bh=L93FB1uglHy+RXCU4rSQkxj+vgA1oeF54LVXpag5T1Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cMNKr7wgpp3sQ/qWr7b38DRWZRe0ITB4YteM0APgpZPCeLWRMT2qzReiQB0mWVXlG
         5+WVC2jxLuijci07O93TsYRelKPMtvyLZ9Uu6tBHumaZAbXnnqouV2Sst74UXzS79L
         WdboTJmevqzBsNHahvTcyXriZdT9bLb58u8Qpp9A=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A0FFB60863
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
To:     agross@kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, jcrouse@codeaurora.org,
        rishabhb@codeaurora.org, vnkgutta@codeaurora.org,
        evgreen@chromium.org, linux-kernel@vger.kernel.org,
        Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH 2/2] soc: qcom: llcc-plat: Make the driver more generic
Date:   Thu, 11 Jul 2019 16:33:40 +0530
Message-Id: <20190711110340.16672-2-vivek.gautam@codeaurora.org>
X-Mailer: git-send-email 2.16.1.72.g5be1f00a9a70
In-Reply-To: <20190711110340.16672-1-vivek.gautam@codeaurora.org>
References: <20190711110340.16672-1-vivek.gautam@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

- Remove 'sdm845' from names, and use 'plat' instead.
- Move SCT_ENTRY macro to header file.
- Create a new config structure to asssign to of-match-data.

Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
---
 drivers/soc/qcom/llcc-plat.c       | 77 ++++++++++++--------------------------
 include/linux/soc/qcom/llcc-qcom.h | 45 ++++++++++++++++++++++
 2 files changed, 68 insertions(+), 54 deletions(-)

diff --git a/drivers/soc/qcom/llcc-plat.c b/drivers/soc/qcom/llcc-plat.c
index 86600d97c36d..31cff0f75b53 100644
--- a/drivers/soc/qcom/llcc-plat.c
+++ b/drivers/soc/qcom/llcc-plat.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
  *
  */
 
@@ -10,47 +10,7 @@
 #include <linux/of_device.h>
 #include <linux/soc/qcom/llcc-qcom.h>
 
-/*
- * SCT(System Cache Table) entry contains of the following members:
- * usecase_id: Unique id for the client's use case
- * slice_id: llcc slice id for each client
- * max_cap: The maximum capacity of the cache slice provided in KB
- * priority: Priority of the client used to select victim line for replacement
- * fixed_size: Boolean indicating if the slice has a fixed capacity
- * bonus_ways: Bonus ways are additional ways to be used for any slice,
- *		if client ends up using more than reserved cache ways. Bonus
- *		ways are allocated only if they are not reserved for some
- *		other client.
- * res_ways: Reserved ways for the cache slice, the reserved ways cannot
- *		be used by any other client than the one its assigned to.
- * cache_mode: Each slice operates as a cache, this controls the mode of the
- *             slice: normal or TCM(Tightly Coupled Memory)
- * probe_target_ways: Determines what ways to probe for access hit. When
- *                    configured to 1 only bonus and reserved ways are probed.
- *                    When configured to 0 all ways in llcc are probed.
- * dis_cap_alloc: Disable capacity based allocation for a client
- * retain_on_pc: If this bit is set and client has maintained active vote
- *               then the ways assigned to this client are not flushed on power
- *               collapse.
- * activate_on_init: Activate the slice immediately after the SCT is programmed
- */
-#define SCT_ENTRY(uid, sid, mc, p, fs, bway, rway, cmod, ptw, dca, rp, a) \
-	{					\
-		.usecase_id = uid,		\
-		.slice_id = sid,		\
-		.max_cap = mc,			\
-		.priority = p,			\
-		.fixed_size = fs,		\
-		.bonus_ways = bway,		\
-		.res_ways = rway,		\
-		.cache_mode = cmod,		\
-		.probe_target_ways = ptw,	\
-		.dis_cap_alloc = dca,		\
-		.retain_on_pc = rp,		\
-		.activate_on_init = a,		\
-	}
-
-static struct llcc_slice_config sdm845_data[] =  {
+static const struct llcc_slice_config sdm845_data[] =  {
 	SCT_ENTRY(LLCC_CPUSS,    1,  2816, 1, 0, 0xffc, 0x2,   0, 0, 1, 1, 1),
 	SCT_ENTRY(LLCC_VIDSC0,   2,  512,  2, 1, 0x0,   0x0f0, 0, 0, 1, 1, 0),
 	SCT_ENTRY(LLCC_VIDSC1,   3,  512,  2, 1, 0x0,   0x0f0, 0, 0, 1, 1, 0),
@@ -71,30 +31,39 @@ static struct llcc_slice_config sdm845_data[] =  {
 	SCT_ENTRY(LLCC_AUDHW,    22, 1024, 1, 1, 0xffc, 0x2,   0, 0, 1, 1, 0),
 };
 
-static int sdm845_qcom_llcc_remove(struct platform_device *pdev)
+static const struct qcom_llcc_config sdm845_cfg = {
+	.sct_data	= sdm845_data,
+	.size		= ARRAY_SIZE(sdm845_data),
+};
+
+static int qcom_plat_llcc_remove(struct platform_device *pdev)
 {
 	return qcom_llcc_remove(pdev);
 }
 
-static int sdm845_qcom_llcc_probe(struct platform_device *pdev)
+static int qcom_plat_llcc_probe(struct platform_device *pdev)
 {
-	return qcom_llcc_probe(pdev, sdm845_data, ARRAY_SIZE(sdm845_data));
+	const struct qcom_llcc_config *cfg;
+
+	cfg = of_device_get_match_data(&pdev->dev);
+
+	return qcom_llcc_probe(pdev, cfg->sct_data, cfg->size);
 }
 
-static const struct of_device_id sdm845_qcom_llcc_of_match[] = {
-	{ .compatible = "qcom,sdm845-llcc", },
+static const struct of_device_id qcom_plat_llcc_of_match[] = {
+	{ .compatible = "qcom,sdm845-llcc", .data = &sdm845_cfg },
 	{ }
 };
 
-static struct platform_driver sdm845_qcom_llcc_driver = {
+static struct platform_driver qcom_plat_llcc_driver = {
 	.driver = {
-		.name = "sdm845-llcc",
-		.of_match_table = sdm845_qcom_llcc_of_match,
+		.name = "qcom-plat-llcc",
+		.of_match_table = qcom_plat_llcc_of_match,
 	},
-	.probe = sdm845_qcom_llcc_probe,
-	.remove = sdm845_qcom_llcc_remove,
+	.probe = qcom_plat_llcc_probe,
+	.remove = qcom_plat_llcc_remove,
 };
-module_platform_driver(sdm845_qcom_llcc_driver);
+module_platform_driver(qcom_plat_llcc_driver);
 
-MODULE_DESCRIPTION("QCOM sdm845 LLCC driver");
+MODULE_DESCRIPTION("QCOM platform LLCC driver");
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index eb71a50b8afc..8776bb5d3891 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -27,6 +27,46 @@
 #define LLCC_MDMPNG      21
 #define LLCC_AUDHW       22
 
+/*
+ * SCT(System Cache Table) entry contains of the following members:
+ * usecase_id: Unique id for the client's use case
+ * slice_id: llcc slice id for each client
+ * max_cap: The maximum capacity of the cache slice provided in KB
+ * priority: Priority of the client used to select victim line for replacement
+ * fixed_size: Boolean indicating if the slice has a fixed capacity
+ * bonus_ways: Bonus ways are additional ways to be used for any slice,
+ *		if client ends up using more than reserved cache ways. Bonus
+ *		ways are allocated only if they are not reserved for some
+ *		other client.
+ * res_ways: Reserved ways for the cache slice, the reserved ways cannot
+ *		be used by any other client than the one its assigned to.
+ * cache_mode: Each slice operates as a cache, this controls the mode of the
+ *             slice: normal or TCM(Tightly Coupled Memory)
+ * probe_target_ways: Determines what ways to probe for access hit. When
+ *                    configured to 1 only bonus and reserved ways are probed.
+ *                    When configured to 0 all ways in llcc are probed.
+ * dis_cap_alloc: Disable capacity based allocation for a client
+ * retain_on_pc: If this bit is set and client has maintained active vote
+ *               then the ways assigned to this client are not flushed on power
+ *               collapse.
+ * activate_on_init: Activate the slice immediately after the SCT is programmed
+ */
+#define SCT_ENTRY(uid, sid, mc, p, fs, bway, rway, cmod, ptw, dca, rp, a) \
+	{					\
+		.usecase_id = uid,		\
+		.slice_id = sid,		\
+		.max_cap = mc,			\
+		.priority = p,			\
+		.fixed_size = fs,		\
+		.bonus_ways = bway,		\
+		.res_ways = rway,		\
+		.cache_mode = cmod,		\
+		.probe_target_ways = ptw,	\
+		.dis_cap_alloc = dca,		\
+		.retain_on_pc = rp,		\
+		.activate_on_init = a,		\
+	}
+
 /**
  * llcc_slice_desc - Cache slice descriptor
  * @slice_id: llcc slice id
@@ -67,6 +107,11 @@ struct llcc_slice_config {
 	bool activate_on_init;
 };
 
+struct qcom_llcc_config {
+	const struct llcc_slice_config *sct_data;
+	int size;
+};
+
 /**
  * llcc_drv_data - Data associated with the llcc driver
  * @regmap: regmap associated with the llcc device
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

