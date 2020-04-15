Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 910041AAAE2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 16:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S371013AbgDOOvk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 10:51:40 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:39605 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S371020AbgDOOvi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 10:51:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586962297; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Kb6I3a5c6ooAs/g7ThP2VEk7gvbB34RVJxobl7NaKzw=; b=q6MD5pb8t2HOwjkPW1FmM7Zjc8793nRTn0Zfe0vyo6edLidTDwtQG3SwRdnZ3p2IioU907Wp
 wsRAgDMrHbwAHxWOOfiBFGA3OZL+MNv6S7GQOavGhcw1OdZl3ZWcenUosVRNYL0pYHeonRSJ
 t+qCsF996sSIfLU3U2h84SgvSaM=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e971f78.7fc372a55d18-smtp-out-n03;
 Wed, 15 Apr 2020 14:51:36 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 36711C433F2; Wed, 15 Apr 2020 14:51:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DD5A8C43636;
        Wed, 15 Apr 2020 14:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DD5A8C43636
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 2/2] remoteproc: qcom_q6v5_mss: Drop accesses to MPSS PERPH register space
Date:   Wed, 15 Apr 2020 20:21:10 +0530
Message-Id: <20200415145110.20624-3-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200415145110.20624-1-sibis@codeaurora.org>
References: <20200415145110.20624-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

7C retail devices using MSA based boot will result in a fuse combination
which will prevent accesses to MSS PERPH register space where the mpss
clocks and halt-nav reside. So drop all accesses to the MPSS PERPH
register space. Issuing HALT NAV request and turning on the mss clocks
as part of SSR will no longer be required since the modem firmware will
have the necessary fixes to ensure that there are no pending NAV DMA
transactions.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 102 +++++------------------------
 1 file changed, 18 insertions(+), 84 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 6a19e0e77236e..3a7352776a319 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -69,13 +69,9 @@
 #define AXI_HALTREQ_REG			0x0
 #define AXI_HALTACK_REG			0x4
 #define AXI_IDLE_REG			0x8
-#define NAV_AXI_HALTREQ_BIT		BIT(0)
-#define NAV_AXI_HALTACK_BIT		BIT(1)
-#define NAV_AXI_IDLE_BIT		BIT(2)
 #define AXI_GATING_VALID_OVERRIDE	BIT(0)
 
 #define HALT_ACK_TIMEOUT_US		100000
-#define NAV_HALT_ACK_TIMEOUT_US		200
 
 /* QDSP6SS_RESET */
 #define Q6SS_STOP_CORE			BIT(0)
@@ -143,7 +139,7 @@ struct rproc_hexagon_res {
 	int version;
 	bool need_mem_protection;
 	bool has_alt_reset;
-	bool has_halt_nav;
+	bool has_spare_reg;
 };
 
 struct q6v5 {
@@ -154,13 +150,11 @@ struct q6v5 {
 	void __iomem *rmb_base;
 
 	struct regmap *halt_map;
-	struct regmap *halt_nav_map;
 	struct regmap *conn_map;
 
 	u32 halt_q6;
 	u32 halt_modem;
 	u32 halt_nc;
-	u32 halt_nav;
 	u32 conn_box;
 
 	struct reset_control *mss_restart;
@@ -205,7 +199,7 @@ struct q6v5 {
 	struct qcom_sysmon *sysmon;
 	bool need_mem_protection;
 	bool has_alt_reset;
-	bool has_halt_nav;
+	bool has_spare_reg;
 	int mpss_perm;
 	int mba_perm;
 	const char *hexagon_mdt_image;
@@ -426,21 +420,19 @@ static int q6v5_reset_assert(struct q6v5 *qproc)
 		reset_control_assert(qproc->pdc_reset);
 		ret = reset_control_reset(qproc->mss_restart);
 		reset_control_deassert(qproc->pdc_reset);
-	} else if (qproc->has_halt_nav) {
+	} else if (qproc->has_spare_reg) {
 		/*
 		 * When the AXI pipeline is being reset with the Q6 modem partly
 		 * operational there is possibility of AXI valid signal to
 		 * glitch, leading to spurious transactions and Q6 hangs. A work
 		 * around is employed by asserting the AXI_GATING_VALID_OVERRIDE
-		 * BIT before triggering Q6 MSS reset. Both the HALTREQ and
-		 * AXI_GATING_VALID_OVERRIDE are withdrawn post MSS assert
-		 * followed by a MSS deassert, while holding the PDC reset.
+		 * BIT before triggering Q6 MSS reset. AXI_GATING_VALID_OVERRIDE
+		 * is withdrawn post MSS assert followed by a MSS deassert,
+		 * while holding the PDC reset.
 		 */
 		reset_control_assert(qproc->pdc_reset);
 		regmap_update_bits(qproc->conn_map, qproc->conn_box,
 				   AXI_GATING_VALID_OVERRIDE, 1);
-		regmap_update_bits(qproc->halt_nav_map, qproc->halt_nav,
-				   NAV_AXI_HALTREQ_BIT, 0);
 		reset_control_assert(qproc->mss_restart);
 		reset_control_deassert(qproc->pdc_reset);
 		regmap_update_bits(qproc->conn_map, qproc->conn_box,
@@ -463,7 +455,7 @@ static int q6v5_reset_deassert(struct q6v5 *qproc)
 		ret = reset_control_reset(qproc->mss_restart);
 		writel(0, qproc->rmb_base + RMB_MBA_ALT_RESET);
 		reset_control_deassert(qproc->pdc_reset);
-	} else if (qproc->has_halt_nav) {
+	} else if (qproc->has_spare_reg) {
 		ret = reset_control_reset(qproc->mss_restart);
 	} else {
 		ret = reset_control_deassert(qproc->mss_restart);
@@ -760,32 +752,6 @@ static void q6v5proc_halt_axi_port(struct q6v5 *qproc,
 	regmap_write(halt_map, offset + AXI_HALTREQ_REG, 0);
 }
 
-static void q6v5proc_halt_nav_axi_port(struct q6v5 *qproc,
-				       struct regmap *halt_map,
-				       u32 offset)
-{
-	unsigned int val;
-	int ret;
-
-	/* Check if we're already idle */
-	ret = regmap_read(halt_map, offset, &val);
-	if (!ret && (val & NAV_AXI_IDLE_BIT))
-		return;
-
-	/* Assert halt request */
-	regmap_update_bits(halt_map, offset, NAV_AXI_HALTREQ_BIT,
-			   NAV_AXI_HALTREQ_BIT);
-
-	/* Wait for halt ack*/
-	regmap_read_poll_timeout(halt_map, offset, val,
-				 (val & NAV_AXI_HALTACK_BIT),
-				 5, NAV_HALT_ACK_TIMEOUT_US);
-
-	ret = regmap_read(halt_map, offset, &val);
-	if (ret || !(val & NAV_AXI_IDLE_BIT))
-		dev_err(qproc->dev, "port failed halt\n");
-}
-
 static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
 {
 	unsigned long dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
@@ -950,9 +916,6 @@ static int q6v5_mba_load(struct q6v5 *qproc)
 halt_axi_ports:
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_q6);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
-	if (qproc->has_halt_nav)
-		q6v5proc_halt_nav_axi_port(qproc, qproc->halt_nav_map,
-					   qproc->halt_nav);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
 
 reclaim_mba:
@@ -1000,9 +963,6 @@ static void q6v5_mba_reclaim(struct q6v5 *qproc)
 
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_q6);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
-	if (qproc->has_halt_nav)
-		q6v5proc_halt_nav_axi_port(qproc, qproc->halt_nav_map,
-					   qproc->halt_nav);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
 	if (qproc->version == MSS_MSM8996) {
 		/*
@@ -1433,36 +1393,12 @@ static int q6v5_init_mem(struct q6v5 *qproc, struct platform_device *pdev)
 	qproc->halt_modem = args.args[1];
 	qproc->halt_nc = args.args[2];
 
-	if (qproc->has_halt_nav) {
-		struct platform_device *nav_pdev;
-
+	if (qproc->has_spare_reg) {
 		ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
-						       "qcom,halt-nav-regs",
+						       "qcom,spare-regs",
 						       1, 0, &args);
 		if (ret < 0) {
-			dev_err(&pdev->dev, "failed to parse halt-nav-regs\n");
-			return -EINVAL;
-		}
-
-		nav_pdev = of_find_device_by_node(args.np);
-		of_node_put(args.np);
-		if (!nav_pdev) {
-			dev_err(&pdev->dev, "failed to get mss clock device\n");
-			return -EPROBE_DEFER;
-		}
-
-		qproc->halt_nav_map = dev_get_regmap(&nav_pdev->dev, NULL);
-		if (!qproc->halt_nav_map) {
-			dev_err(&pdev->dev, "failed to get map from device\n");
-			return -EINVAL;
-		}
-		qproc->halt_nav = args.args[0];
-
-		ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
-						       "qcom,halt-nav-regs",
-						       1, 1, &args);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "failed to parse halt-nav-regs\n");
+			dev_err(&pdev->dev, "failed to parse spare-regs\n");
 			return -EINVAL;
 		}
 
@@ -1548,7 +1484,7 @@ static int q6v5_init_reset(struct q6v5 *qproc)
 		return PTR_ERR(qproc->mss_restart);
 	}
 
-	if (qproc->has_alt_reset || qproc->has_halt_nav) {
+	if (qproc->has_alt_reset || qproc->has_spare_reg) {
 		qproc->pdc_reset = devm_reset_control_get_exclusive(qproc->dev,
 								    "pdc_reset");
 		if (IS_ERR(qproc->pdc_reset)) {
@@ -1674,7 +1610,7 @@ static int q6v5_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, qproc);
 
-	qproc->has_halt_nav = desc->has_halt_nav;
+	qproc->has_spare_reg = desc->has_spare_reg;
 	ret = q6v5_init_mem(qproc, pdev);
 	if (ret)
 		goto free_rproc;
@@ -1816,8 +1752,6 @@ static const struct rproc_hexagon_res sc7180_mss = {
 	.active_clk_names = (char*[]){
 		"mnoc_axi",
 		"nav",
-		"mss_nav",
-		"mss_crypto",
 		NULL
 	},
 	.active_pd_names = (char*[]){
@@ -1832,7 +1766,7 @@ static const struct rproc_hexagon_res sc7180_mss = {
 	},
 	.need_mem_protection = true,
 	.has_alt_reset = false,
-	.has_halt_nav = true,
+	.has_spare_reg = true,
 	.version = MSS_SC7180,
 };
 
@@ -1867,7 +1801,7 @@ static const struct rproc_hexagon_res sdm845_mss = {
 	},
 	.need_mem_protection = true,
 	.has_alt_reset = true,
-	.has_halt_nav = false,
+	.has_spare_reg = false,
 	.version = MSS_SDM845,
 };
 
@@ -1894,7 +1828,7 @@ static const struct rproc_hexagon_res msm8998_mss = {
 	},
 	.need_mem_protection = true,
 	.has_alt_reset = false,
-	.has_halt_nav = false,
+	.has_spare_reg = false,
 	.version = MSS_MSM8998,
 };
 
@@ -1924,7 +1858,7 @@ static const struct rproc_hexagon_res msm8996_mss = {
 	},
 	.need_mem_protection = true,
 	.has_alt_reset = false,
-	.has_halt_nav = false,
+	.has_spare_reg = false,
 	.version = MSS_MSM8996,
 };
 
@@ -1957,7 +1891,7 @@ static const struct rproc_hexagon_res msm8916_mss = {
 	},
 	.need_mem_protection = false,
 	.has_alt_reset = false,
-	.has_halt_nav = false,
+	.has_spare_reg = false,
 	.version = MSS_MSM8916,
 };
 
@@ -1998,7 +1932,7 @@ static const struct rproc_hexagon_res msm8974_mss = {
 	},
 	.need_mem_protection = false,
 	.has_alt_reset = false,
-	.has_halt_nav = false,
+	.has_spare_reg = false,
 	.version = MSS_MSM8974,
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
