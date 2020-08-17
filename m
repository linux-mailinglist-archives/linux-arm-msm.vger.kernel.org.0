Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E86F2468A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Aug 2020 16:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729038AbgHQOri (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 10:47:38 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:38348 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726630AbgHQOrh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 10:47:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597675656; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=tgTAxFdftyFAguKX6yCWKGS0/ZD3dDVKkF/drriTSI4=; b=utA0RCO3f1E+254lgNapexfM5mrqpYm8HZN5VG4uPdHnLzW9upDReIdmDG511jWBO2lR7C8b
 R2mwy9QJlzvrGY7+r9s2DjJlbxQZCKjLEGDRuOAGTH84Iv+F1FmAG4WjsBMUAnTCaFxI2ZvJ
 ljWziyXvTMRbkxTKx1IRrcqdx5Q=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f3a9888247ccc308cb2ca5b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 Aug 2020 14:47:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 49EDCC433A0; Mon, 17 Aug 2020 14:47:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 08449C433C6;
        Mon, 17 Aug 2020 14:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 08449C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org,
        "Isaac J. Manjarres" <isaacm@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv2] soc: qcom: llcc: Support chipsets that can write to llcc registers
Date:   Mon, 17 Aug 2020 20:17:22 +0530
Message-Id: <20200817144722.6665-1-saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
(sai: use table instead of dt property and minor commit msg change)
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---

Changes in v2:
 * Fix build errors reported by kernel test robot.

---
 drivers/soc/qcom/llcc-qcom.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 429b5a60a1ba..865f607cf502 100644
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
@@ -318,6 +321,11 @@ size_t llcc_get_slice_size(struct llcc_slice_desc *desc)
 }
 EXPORT_SYMBOL_GPL(llcc_get_slice_size);
 
+static const struct of_device_id __maybe_unused qcom_llcc_configure_of_match[] = {
+	{ .compatible = "qcom,sc7180-llcc" },
+	{ }
+};
+
 static int qcom_llcc_cfg_program(struct platform_device *pdev)
 {
 	int i;
@@ -327,13 +335,17 @@ static int qcom_llcc_cfg_program(struct platform_device *pdev)
 	u32 attr0_val;
 	u32 max_cap_cacheline;
 	u32 sz;
+	u32 disable_cap_alloc = 0, retain_pc = 0;
 	int ret = 0;
 	const struct llcc_slice_config *llcc_table;
 	struct llcc_slice_desc desc;
+	const struct of_device_id *llcc_configure;
 
 	sz = drv_data->cfg_size;
 	llcc_table = drv_data->cfg;
 
+	llcc_configure = of_match_node(qcom_llcc_configure_of_match, pdev->dev.of_node);
+
 	for (i = 0; i < sz; i++) {
 		attr1_cfg = LLCC_TRP_ATTR1_CFGn(llcc_table[i].slice_id);
 		attr0_cfg = LLCC_TRP_ATTR0_CFGn(llcc_table[i].slice_id);
@@ -369,6 +381,21 @@ static int qcom_llcc_cfg_program(struct platform_device *pdev)
 					attr0_val);
 		if (ret)
 			return ret;
+
+		if (llcc_configure) {
+			disable_cap_alloc |= llcc_table[i].dis_cap_alloc << llcc_table[i].slice_id;
+			ret = regmap_write(drv_data->bcast_regmap,
+						LLCC_TRP_SCID_DIS_CAP_ALLOC, disable_cap_alloc);
+			if (ret)
+				return ret;
+
+			retain_pc |= llcc_table[i].retain_on_pc << llcc_table[i].slice_id;
+			ret = regmap_write(drv_data->bcast_regmap,
+						LLCC_TRP_PCB_ACT, retain_pc);
+			if (ret)
+				return ret;
+		}
+
 		if (llcc_table[i].activate_on_init) {
 			desc.slice_id = llcc_table[i].slice_id;
 			ret = llcc_slice_activate(&desc);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

