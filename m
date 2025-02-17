Return-Path: <linux-arm-msm+bounces-48291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B40FDA38EAB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 23:09:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D33E03A4C46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 22:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E210D1B3930;
	Mon, 17 Feb 2025 22:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="TJxY572n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47ADC1ADC8F;
	Mon, 17 Feb 2025 22:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739829961; cv=none; b=Qkxjj62u6WCc8Fr131Rw7e6hse/hU3jyGxbs2CH3EYFeS6NI83eFuLbc0RysmRUc66UlCPmFYDwpo0cgrzuqepMgKptJMcHFPNnaj+A4onMOPdQqozHFgLR0vwF3TivwHKZUQe73qM866P4GtPOxsYAZ00c/5jO8EGd5Pv0+mNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739829961; c=relaxed/simple;
	bh=jzcNli27LUdsL9VJ+ehFrcGlpTwcwcoLcSqPL2BYkoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WI+Rm+F7iLzumWfndR6GS/n8+zfjyMNJyppVQSts9SrjDEwGD2dcaBUY6jPlzMZa94K2EPRfIGQELGt6gYMz0MGRRgy4Tvo6l66gi2hj8Ul4cWwl5JWj8SCuOuANIOFu/mlqF1WAKFSz2WiaLIixFDWX82BV0R2zMP5BN0azt/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=TJxY572n; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1739829949; bh=jzcNli27LUdsL9VJ+ehFrcGlpTwcwcoLcSqPL2BYkoQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TJxY572nFBOjq7LQestd6ttkd6roRQTGkWJ8kxwF9uYIQ10+hB37s+H+vuGsbshC0
	 iBUNIjN3ma2u9yYMu0D2hFLyi1RVTPJOBwKt3oGvz08NmVj26O4zLakaQjGyjrXMTY
	 tbushUA9G4hhf2YegbQlkV3nuM54DCP84Bs+7RhY=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Mon, 17 Feb 2025 23:05:19 +0100
Subject: [PATCH v5 05/13] remoteproc: qcom_q6v5_mss: Add modem support on
 MSM8226
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250217-msm8226-modem-v5-5-2bc74b80e0ae@lucaweiss.eu>
References: <20250217-msm8226-modem-v5-0-2bc74b80e0ae@lucaweiss.eu>
In-Reply-To: <20250217-msm8226-modem-v5-0-2bc74b80e0ae@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8753; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=jzcNli27LUdsL9VJ+ehFrcGlpTwcwcoLcSqPL2BYkoQ=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBns7KzYDAyu/p5fZxXr1PmOTV7skYKsZlPjESWH
 L9SiMXa2ryJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ7OyswAKCRBy2EO4nU3X
 Vl/cD/0dmO1PTqq1oNyUJ/xx5GbgP1CD5XstSkHXQyt7WqtaN2jmtTdgLIh9Oc/gHrqNEQxyoXd
 fE0nEsHVGvlEbAbOIwLVZ3Vaw5OgljN4kfsQox6iK9utxp0QlnGjGpevR3eagZLcmYz2XtrelR7
 m2FGw8wtoJKC+EEMypI8Xti0hDFV52NVNTEVMobq78Tr/6edeE3nmFn+c708lNKHVouTIkIAhcy
 xvpbiJfC1EmzXD5Zxlv9gHtGnkindYlqYejKpUj15kxU2iNzu9wLM0d/6X5dP90vV6S6u0CCNvA
 HEf3SgNH+Es4WVUejWkUqAkZ8YxsMw+sRMSQx8VTr/4IQvSGbHSgVMV58u6e6qdaLojBWV6L3So
 0h54cysThFf0lf3NplfuTMv/D5zXVG7uR5fz3v3aoKnPuPZsMgWRq9sV5gkgwwfhiIHyqKc0T2x
 ROSsGTmQqPWadoly0O9u6X2doeG9hOkyYyZdJw1DXvnZNfwlKsvIXdBI2vCy/3Ba/bcBvs2GJlg
 cd2hOL2McrgJfIUzc/b+wKrCufkOR/NBt3H6pszkwfzz3jrRZYKQawDKJFYCNJ0lOIp8sRVZcmZ
 TH5aPw+JOQHNcC1x4t/f98qSvF6wQ4jOg3anW2+LohmGSUCnRHoMZSkrmzO988dWfXwYL6Zagbf
 43G6UN6x4o/uyzA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add support for the external power block headswitch register needed by
MSM8226 and some other qcom platforms.

Co-developed-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 117 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 116 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 2c80d7fe39f8e308eb12e79415a551b5009b3fe4..6f590f9128409b4aa427ab6bde1a9c4a966b3d15 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -134,6 +134,11 @@
 #define BOOT_FSM_TIMEOUT                10000
 #define BHS_CHECK_MAX_LOOPS             200
 
+/* External power block headswitch */
+#define EXTERNAL_BHS_ON			BIT(0)
+#define EXTERNAL_BHS_STATUS		BIT(4)
+#define EXTERNAL_BHS_TIMEOUT_US		50
+
 struct reg_info {
 	struct regulator *reg;
 	int uV;
@@ -161,6 +166,7 @@ struct rproc_hexagon_res {
 	bool has_mba_logs;
 	bool has_spare_reg;
 	bool has_qaccept_regs;
+	bool has_ext_bhs_reg;
 	bool has_ext_cntl_regs;
 	bool has_vq6;
 };
@@ -180,6 +186,7 @@ struct q6v5 {
 	u32 halt_nc;
 	u32 halt_vq6;
 	u32 conn_box;
+	u32 ext_bhs;
 
 	u32 qaccept_mdm;
 	u32 qaccept_cx;
@@ -237,6 +244,7 @@ struct q6v5 {
 	bool has_mba_logs;
 	bool has_spare_reg;
 	bool has_qaccept_regs;
+	bool has_ext_bhs_reg;
 	bool has_ext_cntl_regs;
 	bool has_vq6;
 	u64 mpss_perm;
@@ -246,6 +254,7 @@ struct q6v5 {
 };
 
 enum {
+	MSS_MSM8226,
 	MSS_MSM8909,
 	MSS_MSM8916,
 	MSS_MSM8953,
@@ -415,6 +424,34 @@ static void q6v5_pds_disable(struct q6v5 *qproc, struct device **pds,
 	}
 }
 
+static int q6v5_external_bhs_enable(struct q6v5 *qproc)
+{
+	u32 val;
+	int ret = 0;
+
+	/*
+	 * Enable external power block headswitch and wait for it to
+	 * stabilize
+	 */
+	regmap_set_bits(qproc->conn_map, qproc->ext_bhs, EXTERNAL_BHS_ON);
+
+	ret = regmap_read_poll_timeout(qproc->conn_map, qproc->ext_bhs,
+				       val, val & EXTERNAL_BHS_STATUS,
+				       1, EXTERNAL_BHS_TIMEOUT_US);
+
+	if (ret) {
+		dev_err(qproc->dev, "External BHS timed out\n");
+		ret = -ETIMEDOUT;
+	}
+
+	return ret;
+}
+
+static void q6v5_external_bhs_disable(struct q6v5 *qproc)
+{
+	regmap_clear_bits(qproc->conn_map, qproc->ext_bhs, EXTERNAL_BHS_ON);
+}
+
 static int q6v5_xfer_mem_ownership(struct q6v5 *qproc, u64 *current_perm,
 				   bool local, bool remote, phys_addr_t addr,
 				   size_t size)
@@ -1112,11 +1149,17 @@ static int q6v5_mba_load(struct q6v5 *qproc)
 		goto disable_proxy_clk;
 	}
 
+	if (qproc->has_ext_bhs_reg) {
+		ret = q6v5_external_bhs_enable(qproc);
+		if (ret < 0)
+			goto disable_vdd;
+	}
+
 	ret = q6v5_clk_enable(qproc->dev, qproc->reset_clks,
 			      qproc->reset_clk_count);
 	if (ret) {
 		dev_err(qproc->dev, "failed to enable reset clocks\n");
-		goto disable_vdd;
+		goto disable_ext_bhs;
 	}
 
 	ret = q6v5_reset_deassert(qproc);
@@ -1214,6 +1257,9 @@ static int q6v5_mba_load(struct q6v5 *qproc)
 disable_reset_clks:
 	q6v5_clk_disable(qproc->dev, qproc->reset_clks,
 			 qproc->reset_clk_count);
+disable_ext_bhs:
+	if (qproc->has_ext_bhs_reg)
+		q6v5_external_bhs_disable(qproc);
 disable_vdd:
 	q6v5_regulator_disable(qproc, qproc->active_regs,
 			       qproc->active_reg_count);
@@ -1281,6 +1327,8 @@ static void q6v5_mba_reclaim(struct q6v5 *qproc)
 			 qproc->reset_clk_count);
 	q6v5_clk_disable(qproc->dev, qproc->active_clks,
 			 qproc->active_clk_count);
+	if (qproc->has_ext_bhs_reg)
+		q6v5_external_bhs_disable(qproc);
 	q6v5_regulator_disable(qproc, qproc->active_regs,
 			       qproc->active_reg_count);
 
@@ -1750,6 +1798,23 @@ static int q6v5_init_mem(struct q6v5 *qproc, struct platform_device *pdev)
 		qproc->qaccept_axi = args.args[2];
 	}
 
+	if (qproc->has_ext_bhs_reg) {
+		ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
+						       "qcom,ext-bhs-reg",
+						       1, 0, &args);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "failed to parse ext-bhs-reg index 0\n");
+			return -EINVAL;
+		}
+
+		qproc->conn_map = syscon_node_to_regmap(args.np);
+		of_node_put(args.np);
+		if (IS_ERR(qproc->conn_map))
+			return PTR_ERR(qproc->conn_map);
+
+		qproc->ext_bhs = args.args[0];
+	}
+
 	if (qproc->has_ext_cntl_regs) {
 		ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
 						       "qcom,ext-regs",
@@ -2021,6 +2086,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, qproc);
 
 	qproc->has_qaccept_regs = desc->has_qaccept_regs;
+	qproc->has_ext_bhs_reg = desc->has_ext_bhs_reg;
 	qproc->has_ext_cntl_regs = desc->has_ext_cntl_regs;
 	qproc->has_vq6 = desc->has_vq6;
 	qproc->has_spare_reg = desc->has_spare_reg;
@@ -2174,6 +2240,7 @@ static const struct rproc_hexagon_res sc7180_mss = {
 	.has_mba_logs = true,
 	.has_spare_reg = true,
 	.has_qaccept_regs = false,
+	.has_ext_bhs_reg = false,
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_SC7180,
@@ -2202,6 +2269,7 @@ static const struct rproc_hexagon_res sc7280_mss = {
 	.has_mba_logs = true,
 	.has_spare_reg = false,
 	.has_qaccept_regs = true,
+	.has_ext_bhs_reg = false,
 	.has_ext_cntl_regs = true,
 	.has_vq6 = true,
 	.version = MSS_SC7280,
@@ -2233,6 +2301,7 @@ static const struct rproc_hexagon_res sdm660_mss = {
 	.has_mba_logs = false,
 	.has_spare_reg = false,
 	.has_qaccept_regs = false,
+	.has_ext_bhs_reg = false,
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_SDM660,
@@ -2268,6 +2337,7 @@ static const struct rproc_hexagon_res sdm845_mss = {
 	.has_mba_logs = false,
 	.has_spare_reg = false,
 	.has_qaccept_regs = false,
+	.has_ext_bhs_reg = false,
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_SDM845,
@@ -2299,6 +2369,7 @@ static const struct rproc_hexagon_res msm8998_mss = {
 	.has_mba_logs = false,
 	.has_spare_reg = false,
 	.has_qaccept_regs = false,
+	.has_ext_bhs_reg = false,
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8998,
@@ -2337,6 +2408,7 @@ static const struct rproc_hexagon_res msm8996_mss = {
 	.has_mba_logs = false,
 	.has_spare_reg = false,
 	.has_qaccept_regs = false,
+	.has_ext_bhs_reg = false,
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8996,
@@ -2371,6 +2443,7 @@ static const struct rproc_hexagon_res msm8909_mss = {
 	.has_mba_logs = false,
 	.has_spare_reg = false,
 	.has_qaccept_regs = false,
+	.has_ext_bhs_reg = false,
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8909,
@@ -2416,6 +2489,7 @@ static const struct rproc_hexagon_res msm8916_mss = {
 	.has_mba_logs = false,
 	.has_spare_reg = false,
 	.has_qaccept_regs = false,
+	.has_ext_bhs_reg = false,
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8916,
@@ -2451,6 +2525,7 @@ static const struct rproc_hexagon_res msm8953_mss = {
 	.has_mba_logs = false,
 	.has_spare_reg = false,
 	.has_qaccept_regs = false,
+	.has_ext_bhs_reg = false,
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8953,
@@ -2503,13 +2578,53 @@ static const struct rproc_hexagon_res msm8974_mss = {
 	.has_mba_logs = false,
 	.has_spare_reg = false,
 	.has_qaccept_regs = false,
+	.has_ext_bhs_reg = false,
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8974,
 };
 
+static const struct rproc_hexagon_res msm8226_mss = {
+	.hexagon_mba_image = "mba.b00",
+	.proxy_supply = (struct qcom_mss_reg_res[]) {
+		{
+			.supply = "pll",
+			.uA = 100000,
+		},
+		{
+			.supply = "mx",
+			.uV = 1050000,
+		},
+		{}
+	},
+	.proxy_clk_names = (char*[]){
+		"xo",
+		NULL
+	},
+	.active_clk_names = (char*[]){
+		"iface",
+		"bus",
+		"mem",
+		NULL
+	},
+	.proxy_pd_names = (char*[]){
+		"cx",
+		NULL
+	},
+	.need_mem_protection = false,
+	.has_alt_reset = false,
+	.has_mba_logs = false,
+	.has_spare_reg = false,
+	.has_qaccept_regs = false,
+	.has_ext_bhs_reg = true,
+	.has_ext_cntl_regs = false,
+	.has_vq6 = false,
+	.version = MSS_MSM8226,
+};
+
 static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,q6v5-pil", .data = &msm8916_mss},
+	{ .compatible = "qcom,msm8226-mss-pil", .data = &msm8226_mss},
 	{ .compatible = "qcom,msm8909-mss-pil", .data = &msm8909_mss},
 	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},
 	{ .compatible = "qcom,msm8953-mss-pil", .data = &msm8953_mss},

-- 
2.48.1


