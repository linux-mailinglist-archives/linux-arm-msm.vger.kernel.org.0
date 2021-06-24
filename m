Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8B53B3755
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 21:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232881AbhFXTv3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 15:51:29 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:17043 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232592AbhFXTv0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 15:51:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624564146; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=MWHYeYtEk0qF5cTCdbDuR20k/4XPFKEdMvheTpZeu8o=; b=qwee92edsh7p+BhOBtWM/sEIHAwY7/rIl40vSTpa50ppxQ8kINEQbF94CZ7lxvnniPkfTx4g
 WPoQNVb0UFtSBQwzqcmo72IHJRetu7L2W9ed+v4I0GQeqnCubB5HRGNrPC9EHebECGxy/Vmm
 pq1g2YYUlpuqGl7me8pGGVJ4D6M=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60d4e1a51938941955804d5b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 24 Jun 2021 19:48:53
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DB7E8C433D3; Thu, 24 Jun 2021 19:48:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C4417C43144;
        Thu, 24 Jun 2021 19:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C4417C43144
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, will@kernel.org,
        saiprakash.ranjan@codeaurora.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, swboyd@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 5/9] remoteproc: mss: q6v5-mss: Add modem support on SC7280
Date:   Fri, 25 Jun 2021 01:17:34 +0530
Message-Id: <1624564058-24095-6-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
References: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add out of reset sequence support for modem sub-system on SC7280 SoCs.
It requires access to an additional set of qaccept registers, external
power/clk control registers and halt vq6 register to put the modem back
into reset.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 245 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 241 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 5d21084004cb..4e32811e0025 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -77,6 +77,14 @@
 
 #define HALT_ACK_TIMEOUT_US		100000
 
+/* QACCEPT Register Offsets */
+#define QACCEPT_ACCEPT_REG		0x0
+#define QACCEPT_ACTIVE_REG		0x4
+#define QACCEPT_DENY_REG		0x8
+#define QACCEPT_REQ_REG			0xC
+
+#define QACCEPT_TIMEOUT_US		50
+
 /* QDSP6SS_RESET */
 #define Q6SS_STOP_CORE			BIT(0)
 #define Q6SS_CORE_ARES			BIT(1)
@@ -143,6 +151,9 @@ struct rproc_hexagon_res {
 	bool has_alt_reset;
 	bool has_mba_logs;
 	bool has_spare_reg;
+	bool has_qaccept_regs;
+	bool has_ext_cntl_regs;
+	bool has_vq6;
 };
 
 struct q6v5 {
@@ -158,8 +169,18 @@ struct q6v5 {
 	u32 halt_q6;
 	u32 halt_modem;
 	u32 halt_nc;
+	u32 halt_vq6;
 	u32 conn_box;
 
+	u32 qaccept_mdm;
+	u32 qaccept_cx;
+	u32 qaccept_axi;
+
+	u32 axim1_clk_off;
+	u32 crypto_clk_off;
+	u32 force_clk_on;
+	u32 rscc_disable;
+
 	struct reset_control *mss_restart;
 	struct reset_control *pdc_reset;
 
@@ -201,6 +222,9 @@ struct q6v5 {
 	bool has_alt_reset;
 	bool has_mba_logs;
 	bool has_spare_reg;
+	bool has_qaccept_regs;
+	bool has_ext_cntl_regs;
+	bool has_vq6;
 	int mpss_perm;
 	int mba_perm;
 	const char *hexagon_mdt_image;
@@ -213,6 +237,7 @@ enum {
 	MSS_MSM8996,
 	MSS_MSM8998,
 	MSS_SC7180,
+	MSS_SC7280,
 	MSS_SDM845,
 };
 
@@ -473,6 +498,12 @@ static int q6v5_reset_assert(struct q6v5 *qproc)
 		regmap_update_bits(qproc->conn_map, qproc->conn_box,
 				   AXI_GATING_VALID_OVERRIDE, 0);
 		ret = reset_control_deassert(qproc->mss_restart);
+	} else if (qproc->has_ext_cntl_regs) {
+		regmap_write(qproc->conn_map, qproc->rscc_disable, 0);
+		reset_control_assert(qproc->pdc_reset);
+		reset_control_assert(qproc->mss_restart);
+		reset_control_deassert(qproc->pdc_reset);
+		ret = reset_control_deassert(qproc->mss_restart);
 	} else {
 		ret = reset_control_assert(qproc->mss_restart);
 	}
@@ -490,7 +521,7 @@ static int q6v5_reset_deassert(struct q6v5 *qproc)
 		ret = reset_control_reset(qproc->mss_restart);
 		writel(0, qproc->rmb_base + RMB_MBA_ALT_RESET);
 		reset_control_deassert(qproc->pdc_reset);
-	} else if (qproc->has_spare_reg) {
+	} else if (qproc->has_spare_reg || qproc->has_ext_cntl_regs) {
 		ret = reset_control_reset(qproc->mss_restart);
 	} else {
 		ret = reset_control_deassert(qproc->mss_restart);
@@ -604,7 +635,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 		}
 
 		goto pbl_wait;
-	} else if (qproc->version == MSS_SC7180) {
+	} else if (qproc->version == MSS_SC7180 || qproc->version == MSS_SC7280) {
 		val = readl(qproc->reg_base + QDSP6SS_SLEEP);
 		val |= Q6SS_CBCR_CLKEN;
 		writel(val, qproc->reg_base + QDSP6SS_SLEEP);
@@ -787,6 +818,82 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 	return ret;
 }
 
+static int q6v5proc_enable_qchannel(struct q6v5 *qproc, struct regmap *map, u32 offset)
+{
+	unsigned int val;
+	int ret;
+
+	if (!qproc->has_qaccept_regs)
+		return 0;
+
+	if (qproc->has_ext_cntl_regs) {
+		regmap_write(qproc->conn_map, qproc->rscc_disable, 0);
+		regmap_write(qproc->conn_map, qproc->force_clk_on, 1);
+
+		ret = regmap_read_poll_timeout(qproc->halt_map, qproc->axim1_clk_off, val,
+					       !val, 1, Q6SS_CBCR_TIMEOUT_US);
+		if (ret) {
+			dev_err(qproc->dev, "failed to enable axim1 clock\n");
+			return -ETIMEDOUT;
+		}
+	}
+
+	regmap_write(map, offset + QACCEPT_REQ_REG, 1);
+
+	/* Wait for accept */
+	ret = regmap_read_poll_timeout(map, offset + QACCEPT_ACCEPT_REG, val, val, 5,
+				       QACCEPT_TIMEOUT_US);
+	if (ret) {
+		dev_err(qproc->dev, "qchannel enable failed\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static void q6v5proc_disable_qchannel(struct q6v5 *qproc, struct regmap *map, u32 offset)
+{
+	int ret;
+	unsigned int val, retry;
+	unsigned int nretry = 10;
+	bool takedown_complete = false;
+
+	if (!qproc->has_qaccept_regs)
+		return;
+
+	while (!takedown_complete && nretry) {
+		nretry--;
+
+		regmap_read_poll_timeout(map, offset + QACCEPT_ACTIVE_REG, val, !val, 5,
+					 QACCEPT_TIMEOUT_US);
+
+		regmap_write(map, offset + QACCEPT_REQ_REG, 0);
+
+		retry = 10;
+		while (retry) {
+			usleep_range(5, 10);
+			retry--;
+			ret = regmap_read(map, offset + QACCEPT_DENY_REG, &val);
+			if (!ret && val) {
+				regmap_write(map, offset + QACCEPT_REQ_REG, 1);
+				break;
+			}
+
+			ret = regmap_read(map, offset + QACCEPT_ACCEPT_REG, &val);
+			if (!ret && !val) {
+				takedown_complete = true;
+				break;
+			}
+		}
+
+		if (!retry)
+			break;
+	}
+
+	if (!takedown_complete)
+		dev_err(qproc->dev, "qchannel takedown failed\n");
+}
+
 static void q6v5proc_halt_axi_port(struct q6v5 *qproc,
 				   struct regmap *halt_map,
 				   u32 offset)
@@ -950,6 +1057,12 @@ static int q6v5_mba_load(struct q6v5 *qproc)
 		goto assert_reset;
 	}
 
+	ret = q6v5proc_enable_qchannel(qproc, qproc->halt_map, qproc->qaccept_axi);
+	if (ret) {
+		dev_err(qproc->dev, "failed to enable axi bridge\n");
+		goto disable_active_clks;
+	}
+
 	/*
 	 * Some versions of the MBA firmware will upon boot wipe the MPSS region as well, so provide
 	 * the Q6 access to this region.
@@ -996,8 +1109,13 @@ static int q6v5_mba_load(struct q6v5 *qproc)
 
 halt_axi_ports:
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_q6);
+	if (qproc->has_vq6)
+		q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_vq6);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
+	q6v5proc_disable_qchannel(qproc, qproc->halt_map, qproc->qaccept_mdm);
+	q6v5proc_disable_qchannel(qproc, qproc->halt_map, qproc->qaccept_cx);
+	q6v5proc_disable_qchannel(qproc, qproc->halt_map, qproc->qaccept_axi);
 	mba_load_err = true;
 reclaim_mba:
 	xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true,
@@ -1047,6 +1165,8 @@ static void q6v5_mba_reclaim(struct q6v5 *qproc)
 	qproc->dp_size = 0;
 
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_q6);
+	if (qproc->has_vq6)
+		q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_vq6);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
 	if (qproc->version == MSS_MSM8996) {
@@ -1059,6 +1179,24 @@ static void q6v5_mba_reclaim(struct q6v5 *qproc)
 		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
 	}
 
+	if (qproc->has_ext_cntl_regs) {
+		regmap_write(qproc->conn_map, qproc->rscc_disable, 1);
+
+		ret = regmap_read_poll_timeout(qproc->halt_map, qproc->axim1_clk_off, val,
+					       !val, 1, Q6SS_CBCR_TIMEOUT_US);
+		if (ret)
+			dev_err(qproc->dev, "failed to enable axim1 clock\n");
+
+		ret = regmap_read_poll_timeout(qproc->halt_map, qproc->crypto_clk_off, val,
+					       !val, 1, Q6SS_CBCR_TIMEOUT_US);
+		if (ret)
+			dev_err(qproc->dev, "failed to enable crypto clock\n");
+	}
+
+	q6v5proc_disable_qchannel(qproc, qproc->halt_map, qproc->qaccept_mdm);
+	q6v5proc_disable_qchannel(qproc, qproc->halt_map, qproc->qaccept_cx);
+	q6v5proc_disable_qchannel(qproc, qproc->halt_map, qproc->qaccept_axi);
+
 	q6v5_reset_assert(qproc);
 
 	q6v5_clk_disable(qproc->dev, qproc->reset_clks,
@@ -1471,6 +1609,7 @@ static int q6v5_init_mem(struct q6v5 *qproc, struct platform_device *pdev)
 {
 	struct of_phandle_args args;
 	struct resource *res;
+	int halt_cell_cnt = 3;
 	int ret;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "qdsp6");
@@ -1483,8 +1622,11 @@ static int q6v5_init_mem(struct q6v5 *qproc, struct platform_device *pdev)
 	if (IS_ERR(qproc->rmb_base))
 		return PTR_ERR(qproc->rmb_base);
 
+	if (qproc->has_vq6)
+		halt_cell_cnt++;
+
 	ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
-					       "qcom,halt-regs", 3, 0, &args);
+					       "qcom,halt-regs", halt_cell_cnt, 0, &args);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to parse qcom,halt-regs\n");
 		return -EINVAL;
@@ -1499,6 +1641,52 @@ static int q6v5_init_mem(struct q6v5 *qproc, struct platform_device *pdev)
 	qproc->halt_modem = args.args[1];
 	qproc->halt_nc = args.args[2];
 
+	if (qproc->has_vq6)
+		qproc->halt_vq6 = args.args[3];
+
+	if (qproc->has_qaccept_regs) {
+		ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
+						       "qcom,qaccept-regs",
+						       3, 0, &args);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "failed to parse qaccept-regs\n");
+			return -EINVAL;
+		}
+
+		qproc->qaccept_mdm = args.args[0];
+		qproc->qaccept_cx = args.args[1];
+		qproc->qaccept_axi = args.args[2];
+	}
+
+	if (qproc->has_ext_cntl_regs) {
+		ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
+						       "qcom,ext-regs",
+						       2, 0, &args);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "failed to parse ext-regs index 0\n");
+			return -EINVAL;
+		}
+
+		qproc->conn_map = syscon_node_to_regmap(args.np);
+		of_node_put(args.np);
+		if (IS_ERR(qproc->conn_map))
+			return PTR_ERR(qproc->conn_map);
+
+		qproc->force_clk_on = args.args[0];
+		qproc->rscc_disable = args.args[1];
+
+		ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
+						       "qcom,ext-regs",
+						       2, 1, &args);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "failed to parse ext-regs index 1\n");
+			return -EINVAL;
+		}
+
+		qproc->axim1_clk_off = args.args[0];
+		qproc->crypto_clk_off = args.args[1];
+	}
+
 	if (qproc->has_spare_reg) {
 		ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
 						       "qcom,spare-regs",
@@ -1590,7 +1778,7 @@ static int q6v5_init_reset(struct q6v5 *qproc)
 		return PTR_ERR(qproc->mss_restart);
 	}
 
-	if (qproc->has_alt_reset || qproc->has_spare_reg) {
+	if (qproc->has_alt_reset || qproc->has_spare_reg || qproc->has_ext_cntl_regs) {
 		qproc->pdc_reset = devm_reset_control_get_exclusive(qproc->dev,
 								    "pdc_reset");
 		if (IS_ERR(qproc->pdc_reset)) {
@@ -1697,6 +1885,9 @@ static int q6v5_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, qproc);
 
+	qproc->has_qaccept_regs = desc->has_qaccept_regs;
+	qproc->has_ext_cntl_regs = desc->has_ext_cntl_regs;
+	qproc->has_vq6 = desc->has_vq6;
 	qproc->has_spare_reg = desc->has_spare_reg;
 	ret = q6v5_init_mem(qproc, pdev);
 	if (ret)
@@ -1857,9 +2048,39 @@ static const struct rproc_hexagon_res sc7180_mss = {
 	.has_alt_reset = false,
 	.has_mba_logs = true,
 	.has_spare_reg = true,
+	.has_qaccept_regs = false,
+	.has_ext_cntl_regs = false,
+	.has_vq6 = false,
 	.version = MSS_SC7180,
 };
 
+static const struct rproc_hexagon_res sc7280_mss = {
+	.hexagon_mba_image = "mba.mbn",
+	.proxy_clk_names = (char*[]){
+		"xo",
+		NULL
+	},
+	.active_clk_names = (char*[]){
+		"iface",
+		"offline",
+		"snoc_axi",
+		NULL
+	},
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mss",
+		NULL
+	},
+	.need_mem_protection = true,
+	.has_alt_reset = false,
+	.has_mba_logs = true,
+	.has_spare_reg = false,
+	.has_qaccept_regs = true,
+	.has_ext_cntl_regs = true,
+	.has_vq6 = true,
+	.version = MSS_SC7280,
+};
+
 static const struct rproc_hexagon_res sdm845_mss = {
 	.hexagon_mba_image = "mba.mbn",
 	.proxy_clk_names = (char*[]){
@@ -1889,6 +2110,9 @@ static const struct rproc_hexagon_res sdm845_mss = {
 	.has_alt_reset = true,
 	.has_mba_logs = false,
 	.has_spare_reg = false,
+	.has_qaccept_regs = false,
+	.has_ext_cntl_regs = false,
+	.has_vq6 = false,
 	.version = MSS_SDM845,
 };
 
@@ -1917,6 +2141,9 @@ static const struct rproc_hexagon_res msm8998_mss = {
 	.has_alt_reset = false,
 	.has_mba_logs = false,
 	.has_spare_reg = false,
+	.has_qaccept_regs = false,
+	.has_ext_cntl_regs = false,
+	.has_vq6 = false,
 	.version = MSS_MSM8998,
 };
 
@@ -1948,6 +2175,9 @@ static const struct rproc_hexagon_res msm8996_mss = {
 	.has_alt_reset = false,
 	.has_mba_logs = false,
 	.has_spare_reg = false,
+	.has_qaccept_regs = false,
+	.has_ext_cntl_regs = false,
+	.has_vq6 = false,
 	.version = MSS_MSM8996,
 };
 
@@ -1990,6 +2220,9 @@ static const struct rproc_hexagon_res msm8916_mss = {
 	.has_alt_reset = false,
 	.has_mba_logs = false,
 	.has_spare_reg = false,
+	.has_qaccept_regs = false,
+	.has_ext_cntl_regs = false,
+	.has_vq6 = false,
 	.version = MSS_MSM8916,
 };
 
@@ -2040,6 +2273,9 @@ static const struct rproc_hexagon_res msm8974_mss = {
 	.has_alt_reset = false,
 	.has_mba_logs = false,
 	.has_spare_reg = false,
+	.has_qaccept_regs = false,
+	.has_ext_cntl_regs = false,
+	.has_vq6 = false,
 	.version = MSS_MSM8974,
 };
 
@@ -2050,6 +2286,7 @@ static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,msm8996-mss-pil", .data = &msm8996_mss},
 	{ .compatible = "qcom,msm8998-mss-pil", .data = &msm8998_mss},
 	{ .compatible = "qcom,sc7180-mss-pil", .data = &sc7180_mss},
+	{ .compatible = "qcom,sc7280-mss-pil", .data = &sc7280_mss},
 	{ .compatible = "qcom,sdm845-mss-pil", .data = &sdm845_mss},
 	{ },
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

