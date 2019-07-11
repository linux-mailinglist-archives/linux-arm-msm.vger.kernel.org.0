Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8A5F65AE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2019 17:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728761AbfGKPrq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jul 2019 11:47:46 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:11122 "EHLO
        alexa-out-blr.qualcomm.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726833AbfGKPrp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jul 2019 11:47:45 -0400
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr.qualcomm.com with ESMTP/TLS/AES256-SHA; 11 Jul 2019 21:11:32 +0530
X-IronPort-AV: E=McAfee;i="6000,8403,9314"; a="10317410"
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg02-blr.qualcomm.com with ESMTP; 11 Jul 2019 21:11:11 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 2FEFF35D1; Thu, 11 Jul 2019 21:11:09 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     agross@kernel.org, david.brown@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, sboyd@kernel.org,
        jassisinghbrar@gmail.com, ohad@wizery.com,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: [PATCH 05/12] remoteproc: qcom: Update regmap offsets for halt register
Date:   Thu, 11 Jul 2019 21:11:01 +0530
Message-Id: <1562859668-14209-6-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1562859668-14209-1-git-send-email-gokulsri@codeaurora.org>
References: <1562859668-14209-1-git-send-email-gokulsri@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixed issue in reading halt-regs parameter from device-tree.
Also adding a flag to check for bcr reset which is not
required for ipq8074.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 6d3ef06..b4ef5d3 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -83,7 +83,7 @@
 #define TCSR_WCSS_CLK_MASK	0x1F
 #define TCSR_WCSS_CLK_ENABLE	0x14
 
-#define MAX_HALT_REG		3
+#define MAX_HALT_REG		4
 
 #define WCNSS_PAS_ID		6
 
@@ -149,6 +149,7 @@ struct wcss_data {
 	int crash_reason_smem;
 	u8 version;
 	bool aon_reset_required;
+	bool bcr_reset_required;
 	const char *ssr_name;
 	const char *sysmon_name;
 	int ssctl_id;
@@ -810,7 +811,8 @@ static int q6v5_wcss_load(struct rproc *rproc, const struct firmware *fw)
 };
 
 static int q6v5_wcss_init_reset(struct q6v5_wcss *wcss,
-				bool aon_reset_required)
+				bool aon_reset_required,
+				bool bcr_reset_required)
 {
 	struct device *dev = wcss->dev;
 
@@ -834,10 +836,13 @@ static int q6v5_wcss_init_reset(struct q6v5_wcss *wcss,
 		return PTR_ERR(wcss->wcss_q6_reset);
 	}
 
-	wcss->wcss_q6_bcr_reset = devm_reset_control_get_exclusive(dev, "wcss_q6_bcr_reset");
-	if (IS_ERR(wcss->wcss_q6_bcr_reset)) {
-		dev_err(wcss->dev, "unable to acquire wcss_q6_bcr_reset\n");
-		return PTR_ERR(wcss->wcss_q6_reset);
+	if (bcr_reset_required) {
+		wcss->wcss_q6_bcr_reset = devm_reset_control_get_exclusive(dev,
+									   "wcss_q6_bcr_reset");
+		if (IS_ERR(wcss->wcss_q6_bcr_reset)) {
+			dev_err(wcss->dev, "unable to acquire wcss_q6_bcr_reset\n");
+			return PTR_ERR(wcss->wcss_q6_reset);
+		}
 	}
 
 	return 0;
@@ -885,9 +890,9 @@ static int q6v5_wcss_init_mmio(struct q6v5_wcss *wcss,
 		return -EINVAL;
 	}
 
-	wcss->halt_q6 = halt_reg[0];
-	wcss->halt_wcss = halt_reg[1];
-	wcss->halt_nc = halt_reg[2];
+	wcss->halt_q6 = halt_reg[1];
+	wcss->halt_wcss = halt_reg[2];
+	wcss->halt_nc = halt_reg[3];
 
 	return 0;
 }
@@ -1111,7 +1116,8 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 			goto free_rproc;
 	}
 
-	ret = q6v5_wcss_init_reset(wcss, desc->aon_reset_required);
+	ret = q6v5_wcss_init_reset(wcss, desc->aon_reset_required,
+				   desc->bcr_reset_required);
 	if (ret)
 		goto free_rproc;
 
@@ -1156,6 +1162,7 @@ static int q6v5_wcss_remove(struct platform_device *pdev)
 	.m3_firmware_name = "IPQ8074/m3_fw.mdt",
 	.crash_reason_smem = 421,
 	.aon_reset_required = true,
+	.bcr_reset_required = false,
 	.ssr_name = "q6wcss",
 	.ops = &q6v5_wcss_ipq8074_ops,
 	.requires_force_stop = true,
@@ -1169,6 +1176,7 @@ static int q6v5_wcss_remove(struct platform_device *pdev)
 	.q6_firmware_name = "wcnss.mdt",
 	.version = WCSS_QCS404,
 	.aon_reset_required = false,
+	.bcr_reset_required = true,
 	.ssr_name = "mpss",
 	.sysmon_name = "wcnss",
 	.ssctl_id = 0x12,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

