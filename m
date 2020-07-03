Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6530C213700
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2020 11:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbgGCJDN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jul 2020 05:03:13 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:53787 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725648AbgGCJDN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jul 2020 05:03:13 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 03 Jul 2020 02:03:13 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 03 Jul 2020 02:03:11 -0700
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg02-blr.qualcomm.com with ESMTP; 03 Jul 2020 14:32:53 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 9337C2168F; Fri,  3 Jul 2020 14:32:52 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     gokulsri@codeaurora.org, sboyd@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com,
        robh+dt@kernel.org, sricharan@codeaurora.org,
        nprakash@codeaurora.org
Subject: [PATCH V6 01/10] remoteproc: qcom: Add PRNG proxy clock
Date:   Fri,  3 Jul 2020 14:32:43 +0530
Message-Id: <1593766972-29101-2-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593766972-29101-1-git-send-email-gokulsri@codeaurora.org>
References: <1593766972-29101-1-git-send-email-gokulsri@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PRNG clock is needed by the secure PIL, support for the same
is added in subsequent patches.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
Signed-off-by: Nikhil Prakash V <nprakash@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 65 +++++++++++++++++++++++++++----------
 1 file changed, 47 insertions(+), 18 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index d5107c6..9e9d702 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -91,19 +91,6 @@ enum {
 	WCSS_QCS404,
 };
 
-struct wcss_data {
-	const char *firmware_name;
-	int crash_reason_smem;
-	u32 version;
-	bool aon_reset_required;
-	bool wcss_q6_reset_required;
-	const char *ssr_name;
-	const char *sysmon_name;
-	int ssctl_id;
-	const struct rproc_ops *ops;
-	bool requires_force_stop;
-};
-
 struct q6v5_wcss {
 	struct device *dev;
 
@@ -128,6 +115,7 @@ struct q6v5_wcss {
 	struct clk *qdsp6ss_xo_cbcr;
 	struct clk *qdsp6ss_core_gfmux;
 	struct clk *lcc_bcr_sleep;
+	struct clk *prng_clk;
 	struct regulator *cx_supply;
 	struct qcom_sysmon *sysmon;
 
@@ -151,6 +139,21 @@ struct q6v5_wcss {
 	struct qcom_rproc_ssr ssr_subdev;
 };
 
+struct wcss_data {
+	int (*init_clock)(struct q6v5_wcss *wcss);
+	int (*init_regulator)(struct q6v5_wcss *wcss);
+	const char *firmware_name;
+	int crash_reason_smem;
+	u32 version;
+	bool aon_reset_required;
+	bool wcss_q6_reset_required;
+	const char *ssr_name;
+	const char *sysmon_name;
+	int ssctl_id;
+	const struct rproc_ops *ops;
+	bool requires_force_stop;
+};
+
 static int q6v5_wcss_reset(struct q6v5_wcss *wcss)
 {
 	int ret;
@@ -240,6 +243,12 @@ static int q6v5_wcss_start(struct rproc *rproc)
 	struct q6v5_wcss *wcss = rproc->priv;
 	int ret;
 
+	ret = clk_prepare_enable(wcss->prng_clk);
+	if (ret) {
+		dev_err(wcss->dev, "prng clock enable failed\n");
+		return ret;
+	}
+
 	qcom_q6v5_prepare(&wcss->q6v5);
 
 	/* Release Q6 and WCSS reset */
@@ -732,6 +741,7 @@ static int q6v5_wcss_stop(struct rproc *rproc)
 			return ret;
 	}
 
+	clk_disable_unprepare(wcss->prng_clk);
 	qcom_q6v5_unprepare(&wcss->q6v5);
 
 	return 0;
@@ -889,7 +899,21 @@ static int q6v5_alloc_memory_region(struct q6v5_wcss *wcss)
 	return 0;
 }
 
-static int q6v5_wcss_init_clock(struct q6v5_wcss *wcss)
+static int ipq8074_init_clock(struct q6v5_wcss *wcss)
+{
+	int ret;
+
+	wcss->prng_clk = devm_clk_get(wcss->dev, "prng");
+	if (IS_ERR(wcss->prng_clk)) {
+		ret = PTR_ERR(wcss->prng_clk);
+		if (ret != -EPROBE_DEFER)
+			dev_err(wcss->dev, "Failed to get prng clock\n");
+		return ret;
+	}
+	return 0;
+}
+
+static int qcs404_init_clock(struct q6v5_wcss *wcss)
 {
 	int ret;
 
@@ -979,7 +1003,7 @@ static int q6v5_wcss_init_clock(struct q6v5_wcss *wcss)
 	return 0;
 }
 
-static int q6v5_wcss_init_regulator(struct q6v5_wcss *wcss)
+static int qcs404_init_regulator(struct q6v5_wcss *wcss)
 {
 	wcss->cx_supply = devm_regulator_get(wcss->dev, "cx");
 	if (IS_ERR(wcss->cx_supply))
@@ -1023,12 +1047,14 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
-	if (wcss->version == WCSS_QCS404) {
-		ret = q6v5_wcss_init_clock(wcss);
+	if (desc->init_clock) {
+		ret = desc->init_clock(wcss);
 		if (ret)
 			goto free_rproc;
+	}
 
-		ret = q6v5_wcss_init_regulator(wcss);
+	if (desc->init_regulator) {
+		ret = desc->init_regulator(wcss);
 		if (ret)
 			goto free_rproc;
 	}
@@ -1073,6 +1099,7 @@ static int q6v5_wcss_remove(struct platform_device *pdev)
 }
 
 static const struct wcss_data wcss_ipq8074_res_init = {
+	.init_clock = ipq8074_init_clock,
 	.firmware_name = "IPQ8074/q6_fw.mdt",
 	.crash_reason_smem = WCSS_CRASH_REASON,
 	.aon_reset_required = true,
@@ -1082,6 +1109,8 @@ static const struct wcss_data wcss_ipq8074_res_init = {
 };
 
 static const struct wcss_data wcss_qcs404_res_init = {
+	.init_clock = qcs404_init_clock,
+	.init_regulator = qcs404_init_regulator,
 	.crash_reason_smem = WCSS_CRASH_REASON,
 	.firmware_name = "wcnss.mdt",
 	.version = WCSS_QCS404,
-- 
2.7.4

