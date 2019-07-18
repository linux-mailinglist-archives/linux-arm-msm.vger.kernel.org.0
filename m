Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A1676CE7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2019 15:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726649AbfGRNDE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jul 2019 09:03:04 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:41878 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727623AbfGRNDE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jul 2019 09:03:04 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E25F6602A8; Thu, 18 Jul 2019 13:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563454983;
        bh=gneXePiPfPnUPOowcmKnHrB/RAgCMyJVUI6J+o0briM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QAWiyJvv5EvYLC66r6JbVt9iJI/qCd5+Pu1rYBSolXvo+g46UsLjXQf/xiJObP+2c
         LScrwjmYobdR5Cl7VcfkrMeaGPIG5G98rNvcaW8hDnSjtOO7nYjrAMgfH7qpriVuqz
         gG4kDoGam9V3t6fOoL1xEgTfJf/e57QudEPn/m5g=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1AF9C616DA;
        Thu, 18 Jul 2019 13:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563454979;
        bh=gneXePiPfPnUPOowcmKnHrB/RAgCMyJVUI6J+o0briM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KF5lwZNt0cTHHL+iaP719VQpvmiLRHia0xerG3x9XIrquwaHHIDUzdurH/7AE5VZ/
         4wPCeJ+y6LpX5i/2HNmfjwx+ksvGVaQoXvt82+c8ysqBjtXO1xq0S7TMMSMBo7Ojaj
         YnyzQIIS95cR2XmrsI9F2KXgxaEpMlVJ3Jc/d7GU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1AF9C616DA
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
To:     agross@kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, jcrouse@codeaurora.org,
        rishabhb@codeaurora.org, evgreen@chromium.org,
        linux-kernel@vger.kernel.org,
        Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH 3/3] soc: qcom: Make llcc-qcom a generic driver
Date:   Thu, 18 Jul 2019 18:32:38 +0530
Message-Id: <20190718130238.11324-4-vivek.gautam@codeaurora.org>
X-Mailer: git-send-email 2.16.1.72.g5be1f00a9a70
In-Reply-To: <20190718130238.11324-1-vivek.gautam@codeaurora.org>
References: <20190718130238.11324-1-vivek.gautam@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This makes way for adding future llcc versions.
Also pull out the llcc-qcom specific definitions from includes.
Includes path now contains the only definitions that are
to be exposed to other subsystems.

Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
---
 drivers/soc/qcom/llcc-qcom.c       | 137 +++++++++++++++++++++++++++++++------
 include/linux/soc/qcom/llcc-qcom.h |  89 ------------------------
 2 files changed, 116 insertions(+), 110 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 574bb5bf20bc..98563ef0ac6b 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -47,6 +47,100 @@
 
 #define BANK_OFFSET_STRIDE	      0x80000
 
+/**
+ * llcc_slice_config - Data associated with the llcc slice
+ * @usecase_id: Unique id for the client's use case
+ * @slice_id: llcc slice id for each client
+ * @max_cap: The maximum capacity of the cache slice provided in KB
+ * @priority: Priority of the client used to select victim line for replacement
+ * @fixed_size: Boolean indicating if the slice has a fixed capacity
+ * @bonus_ways: Bonus ways are additional ways to be used for any slice,
+ *		if client ends up using more than reserved cache ways. Bonus
+ *		ways are allocated only if they are not reserved for some
+ *		other client.
+ * @res_ways: Reserved ways for the cache slice, the reserved ways cannot
+ *		be used by any other client than the one its assigned to.
+ * @cache_mode: Each slice operates as a cache, this controls the mode of the
+ *             slice: normal or TCM(Tightly Coupled Memory)
+ * @probe_target_ways: Determines what ways to probe for access hit. When
+ *                    configured to 1 only bonus and reserved ways are probed.
+ *                    When configured to 0 all ways in llcc are probed.
+ * @dis_cap_alloc: Disable capacity based allocation for a client
+ * @retain_on_pc: If this bit is set and client has maintained active vote
+ *               then the ways assigned to this client are not flushed on power
+ *               collapse.
+ * @activate_on_init: Activate the slice immediately after it is programmed
+ */
+struct llcc_slice_config {
+	u32 usecase_id;
+	u32 slice_id;
+	u32 max_cap;
+	u32 priority;
+	bool fixed_size;
+	u32 bonus_ways;
+	u32 res_ways;
+	u32 cache_mode;
+	u32 probe_target_ways;
+	bool dis_cap_alloc;
+	bool retain_on_pc;
+	bool activate_on_init;
+};
+
+/**
+ * llcc_drv_data - Data associated with the llcc driver
+ * @regmap: regmap associated with the llcc device
+ * @bcast_regmap: regmap associated with llcc broadcast offset
+ * @cfg: pointer to the data structure for slice configuration
+ * @lock: mutex associated with each slice
+ * @cfg_size: size of the config data table
+ * @max_slices: max slices as read from device tree
+ * @num_banks: Number of llcc banks
+ * @bitmap: Bit map to track the active slice ids
+ * @offsets: Pointer to the bank offsets array
+ * @ecc_irq: interrupt for llcc cache error detection and reporting
+ */
+struct llcc_drv_data {
+	struct regmap *regmap;
+	struct regmap *bcast_regmap;
+	const struct llcc_slice_config *cfg;
+	struct mutex lock;
+	u32 cfg_size;
+	u32 max_slices;
+	u32 num_banks;
+	unsigned long *bitmap;
+	u32 *offsets;
+	int ecc_irq;
+};
+
+/**
+ * llcc_edac_reg_data - llcc edac registers data for each error type
+ * @name: Name of the error
+ * @synd_reg: Syndrome register address
+ * @count_status_reg: Status register address to read the error count
+ * @ways_status_reg: Status register address to read the error ways
+ * @reg_cnt: Number of registers
+ * @count_mask: Mask value to get the error count
+ * @ways_mask: Mask value to get the error ways
+ * @count_shift: Shift value to get the error count
+ * @ways_shift: Shift value to get the error ways
+ */
+struct llcc_edac_reg_data {
+	char *name;
+	u64 synd_reg;
+	u64 count_status_reg;
+	u64 ways_status_reg;
+	u32 reg_cnt;
+	u32 count_mask;
+	u32 ways_mask;
+	u8  count_shift;
+	u8  ways_shift;
+};
+
+struct qcom_llcc_config {
+	const struct llcc_slice_config *sct_data;
+	int size;
+};
+
 static struct llcc_slice_config sdm845_data[] =  {
 	{ LLCC_CPUSS,    1,  2816, 1, 0, 0xffc, 0x2,   0, 0, 1, 1, 1 },
 	{ LLCC_VIDSC0,   2,  512,  2, 1, 0x0,   0x0f0, 0, 0, 1, 1, 0 },
@@ -68,6 +162,11 @@ static struct llcc_slice_config sdm845_data[] =  {
 	{ LLCC_AUDHW,    22, 1024, 1, 1, 0xffc, 0x2,   0, 0, 1, 1, 0 },
 };
 
+static const struct qcom_llcc_config sdm845_cfg = {
+	.sct_data	= sdm845_data,
+	.size		= ARRAY_SIZE(sdm845_data),
+};
+
 static struct llcc_drv_data *drv_data = (void *) -EPROBE_DEFER;
 
 static const struct regmap_config llcc_regmap_config = {
@@ -347,13 +446,15 @@ static struct regmap *qcom_llcc_init_mmio(struct platform_device *pdev,
 	return devm_regmap_init_mmio(&pdev->dev, base, &llcc_regmap_config);
 }
 
-static int qcom_llcc_probe(struct platform_device *pdev,
-			   const struct llcc_slice_config *llcc_cfg, u32 sz)
+static int qcom_llcc_probe(struct platform_device *pdev)
 {
 	u32 num_banks;
 	struct device *dev = &pdev->dev;
 	int ret, i;
 	struct platform_device *llcc_edac;
+	const struct qcom_llcc_config *cfg;
+	const struct llcc_slice_config *llcc_cfg;
+	u32 sz;
 
 	drv_data = devm_kzalloc(dev, sizeof(*drv_data), GFP_KERNEL);
 	if (!drv_data) {
@@ -383,6 +484,10 @@ static int qcom_llcc_probe(struct platform_device *pdev,
 	num_banks >>= LLCC_LB_CNT_SHIFT;
 	drv_data->num_banks = num_banks;
 
+	cfg = of_device_get_match_data(&pdev->dev);
+	llcc_cfg = cfg->sct_data;
+	sz = cfg->size;
+
 	for (i = 0; i < sz; i++)
 		if (llcc_cfg[i].slice_id > drv_data->max_slices)
 			drv_data->max_slices = llcc_cfg[i].slice_id;
@@ -429,30 +534,20 @@ static int qcom_llcc_probe(struct platform_device *pdev,
 	return ret;
 }
 
-static int sdm845_qcom_llcc_remove(struct platform_device *pdev)
-{
-	return qcom_llcc_remove(pdev);
-}
-
-static int sdm845_qcom_llcc_probe(struct platform_device *pdev)
-{
-	return qcom_llcc_probe(pdev, sdm845_data, ARRAY_SIZE(sdm845_data));
-}
-
-static const struct of_device_id sdm845_qcom_llcc_of_match[] = {
-	{ .compatible = "qcom,sdm845-llcc", },
+static const struct of_device_id qcom_llcc_of_match[] = {
+	{ .compatible = "qcom,sdm845-llcc", .data = &sdm845_cfg },
 	{ }
 };
 
-static struct platform_driver sdm845_qcom_llcc_driver = {
+static struct platform_driver qcom_llcc_driver = {
 	.driver = {
-		.name = "sdm845-llcc",
-		.of_match_table = sdm845_qcom_llcc_of_match,
+		.name = "qcom-llcc",
+		.of_match_table = qcom_llcc_of_match,
 	},
-	.probe = sdm845_qcom_llcc_probe,
-	.remove = sdm845_qcom_llcc_remove,
+	.probe = qcom_llcc_probe,
+	.remove = qcom_llcc_remove,
 };
-module_platform_driver(sdm845_qcom_llcc_driver);
+module_platform_driver(qcom_llcc_driver);
 
-MODULE_DESCRIPTION("QCOM sdm845 LLCC driver");
+MODULE_DESCRIPTION("Qualcomm Last Level Cache Controller");
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index d5cad6f7953c..c0acdb28fde8 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -37,95 +37,6 @@ struct llcc_slice_desc {
 	size_t slice_size;
 };
 
-/**
- * llcc_slice_config - Data associated with the llcc slice
- * @usecase_id: Unique id for the client's use case
- * @slice_id: llcc slice id for each client
- * @max_cap: The maximum capacity of the cache slice provided in KB
- * @priority: Priority of the client used to select victim line for replacement
- * @fixed_size: Boolean indicating if the slice has a fixed capacity
- * @bonus_ways: Bonus ways are additional ways to be used for any slice,
- *		if client ends up using more than reserved cache ways. Bonus
- *		ways are allocated only if they are not reserved for some
- *		other client.
- * @res_ways: Reserved ways for the cache slice, the reserved ways cannot
- *		be used by any other client than the one its assigned to.
- * @cache_mode: Each slice operates as a cache, this controls the mode of the
- *             slice: normal or TCM(Tightly Coupled Memory)
- * @probe_target_ways: Determines what ways to probe for access hit. When
- *                    configured to 1 only bonus and reserved ways are probed.
- *                    When configured to 0 all ways in llcc are probed.
- * @dis_cap_alloc: Disable capacity based allocation for a client
- * @retain_on_pc: If this bit is set and client has maintained active vote
- *               then the ways assigned to this client are not flushed on power
- *               collapse.
- * @activate_on_init: Activate the slice immediately after it is programmed
- */
-struct llcc_slice_config {
-	u32 usecase_id;
-	u32 slice_id;
-	u32 max_cap;
-	u32 priority;
-	bool fixed_size;
-	u32 bonus_ways;
-	u32 res_ways;
-	u32 cache_mode;
-	u32 probe_target_ways;
-	bool dis_cap_alloc;
-	bool retain_on_pc;
-	bool activate_on_init;
-};
-
-/**
- * llcc_drv_data - Data associated with the llcc driver
- * @regmap: regmap associated with the llcc device
- * @bcast_regmap: regmap associated with llcc broadcast offset
- * @cfg: pointer to the data structure for slice configuration
- * @lock: mutex associated with each slice
- * @cfg_size: size of the config data table
- * @max_slices: max slices as read from device tree
- * @num_banks: Number of llcc banks
- * @bitmap: Bit map to track the active slice ids
- * @offsets: Pointer to the bank offsets array
- * @ecc_irq: interrupt for llcc cache error detection and reporting
- */
-struct llcc_drv_data {
-	struct regmap *regmap;
-	struct regmap *bcast_regmap;
-	const struct llcc_slice_config *cfg;
-	struct mutex lock;
-	u32 cfg_size;
-	u32 max_slices;
-	u32 num_banks;
-	unsigned long *bitmap;
-	u32 *offsets;
-	int ecc_irq;
-};
-
-/**
- * llcc_edac_reg_data - llcc edac registers data for each error type
- * @name: Name of the error
- * @synd_reg: Syndrome register address
- * @count_status_reg: Status register address to read the error count
- * @ways_status_reg: Status register address to read the error ways
- * @reg_cnt: Number of registers
- * @count_mask: Mask value to get the error count
- * @ways_mask: Mask value to get the error ways
- * @count_shift: Shift value to get the error count
- * @ways_shift: Shift value to get the error ways
- */
-struct llcc_edac_reg_data {
-	char *name;
-	u64 synd_reg;
-	u64 count_status_reg;
-	u64 ways_status_reg;
-	u32 reg_cnt;
-	u32 count_mask;
-	u32 ways_mask;
-	u8  count_shift;
-	u8  ways_shift;
-};
-
 #if IS_ENABLED(CONFIG_QCOM_LLCC)
 /**
  * llcc_slice_getd - get llcc slice descriptor
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

