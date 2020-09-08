Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1478260A2A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 07:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbgIHFgx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 01:36:53 -0400
Received: from a27-10.smtp-out.us-west-2.amazonses.com ([54.240.27.10]:51030
        "EHLO a27-10.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725938AbgIHFgs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 01:36:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599543408;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
        bh=A6Xgkj5tRedzTXTr+PtsbaW7vc2IQ8D/TM5K5CiUam8=;
        b=H0qo4CTAFkMqIGb9LTC/pCsSRulBD+w2P7tWhj7CIZNcbgyUPHZfEZLEzXUfHE0n
        eC2R9vVBjkPvqU02uzUS9yo7Z19dmRDYPEtp2/bKRSBPR5AqVGGHH5UAtPovGlLygyV
        t1OGnGOnlXFoPuB/qU8VDSlLkagUrr03939U6/Nc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599543408;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=A6Xgkj5tRedzTXTr+PtsbaW7vc2IQ8D/TM5K5CiUam8=;
        b=F/OdUYS3Ud0fdErUdlPHkGDonjS7xnP2clsvhX2Bapr3gzRLywehebszY4GScDCn
        NdtP6bdyHHsQCmJ9kSWKaFIlr5yFcPa1eqNfbEgY6SL/uyIv8uSY6nzY2LHHcPNHtah
        Tjg7mniT2VVq87mNEuUS2jPW6s6OHaWRNxb6DbIE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 44C81C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        "Isaac J. Manjarres" <isaacm@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv3] soc: qcom: llcc: Support chipsets that can write to llcc registers
Date:   Tue, 8 Sep 2020 05:36:48 +0000
Message-ID: <010101746c377537-ce93e925-598b-4dce-bb16-4cda020f4d6f-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2020.09.08-54.240.27.10
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: "Isaac J. Manjarres" <isaacm@codeaurora.org>

Older chipsets may not be allowed to configure certain LLCC registers
as that is handled by the secure side software. However, this is not
the case for newer chipsets and they must configure these registers
according to the contents of the SCT table, while keeping in mind that
older targets may not have these capabilities. So add support to allow
such configuration of registers to enable capacity based allocation
and power collapse retention for capable chipsets.

Reason for choosing capacity based allocation rather than the default
way based allocation is because capacity based allocation allows more
finer grain partition and provides more flexibility in configuration.
As for the retention through power collapse, it has an advantage where
the cache hits are more when we wake up from power collapse although
it does burn more power but the exact power numbers are not known at
the moment.

Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
(sai: use existing config instead of dt property and commit msg change)
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---

Changes in v3:
 * Drop separate table and use existing qcom_llcc_config (Doug)
 * More descriptive commit msg (Doug)
 * Directly set the config instead of '|=' (Doug)

Changes in v2:
 * Fix build errors reported by kernel test robot.

---
 drivers/soc/qcom/llcc-qcom.c       | 23 +++++++++++++++++++++++
 include/linux/soc/qcom/llcc-qcom.h |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 429b5a60a1ba..b908656ce519 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -45,6 +45,9 @@
 #define LLCC_TRP_ATTR0_CFGn(n)        (0x21000 + SZ_8 * n)
 #define LLCC_TRP_ATTR1_CFGn(n)        (0x21004 + SZ_8 * n)
 
+#define LLCC_TRP_SCID_DIS_CAP_ALLOC   0x21F00
+#define LLCC_TRP_PCB_ACT              0x21F04
+
 #define BANK_OFFSET_STRIDE	      0x80000
 
 /**
@@ -89,6 +92,7 @@ struct llcc_slice_config {
 struct qcom_llcc_config {
 	const struct llcc_slice_config *sct_data;
 	int size;
+	bool need_llcc_cfg;
 };
 
 static const struct llcc_slice_config sc7180_data[] =  {
@@ -122,11 +126,13 @@ static const struct llcc_slice_config sdm845_data[] =  {
 static const struct qcom_llcc_config sc7180_cfg = {
 	.sct_data	= sc7180_data,
 	.size		= ARRAY_SIZE(sc7180_data),
+	.need_llcc_cfg	= true,
 };
 
 static const struct qcom_llcc_config sdm845_cfg = {
 	.sct_data	= sdm845_data,
 	.size		= ARRAY_SIZE(sdm845_data),
+	.need_llcc_cfg	= false,
 };
 
 static struct llcc_drv_data *drv_data = (void *) -EPROBE_DEFER;
@@ -327,6 +333,7 @@ static int qcom_llcc_cfg_program(struct platform_device *pdev)
 	u32 attr0_val;
 	u32 max_cap_cacheline;
 	u32 sz;
+	u32 disable_cap_alloc, retain_pc;
 	int ret = 0;
 	const struct llcc_slice_config *llcc_table;
 	struct llcc_slice_desc desc;
@@ -369,6 +376,21 @@ static int qcom_llcc_cfg_program(struct platform_device *pdev)
 					attr0_val);
 		if (ret)
 			return ret;
+
+		if (drv_data->need_llcc_config) {
+			disable_cap_alloc = llcc_table[i].dis_cap_alloc << llcc_table[i].slice_id;
+			ret = regmap_write(drv_data->bcast_regmap,
+						LLCC_TRP_SCID_DIS_CAP_ALLOC, disable_cap_alloc);
+			if (ret)
+				return ret;
+
+			retain_pc = llcc_table[i].retain_on_pc << llcc_table[i].slice_id;
+			ret = regmap_write(drv_data->bcast_regmap,
+						LLCC_TRP_PCB_ACT, retain_pc);
+			if (ret)
+				return ret;
+		}
+
 		if (llcc_table[i].activate_on_init) {
 			desc.slice_id = llcc_table[i].slice_id;
 			ret = llcc_slice_activate(&desc);
@@ -474,6 +496,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 
 	drv_data->cfg = llcc_cfg;
 	drv_data->cfg_size = sz;
+	drv_data->need_llcc_config = cfg->need_llcc_cfg;
 	mutex_init(&drv_data->lock);
 	platform_set_drvdata(pdev, drv_data);
 
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index 90b864655822..52c780085f61 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -73,6 +73,7 @@ struct llcc_edac_reg_data {
  * @bitmap: Bit map to track the active slice ids
  * @offsets: Pointer to the bank offsets array
  * @ecc_irq: interrupt for llcc cache error detection and reporting
+ * @need_llcc_config: check if llcc configuration is required
  */
 struct llcc_drv_data {
 	struct regmap *regmap;
@@ -85,6 +86,7 @@ struct llcc_drv_data {
 	unsigned long *bitmap;
 	u32 *offsets;
 	int ecc_irq;
+	bool need_llcc_config;
 };
 
 #if IS_ENABLED(CONFIG_QCOM_LLCC)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

