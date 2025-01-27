Return-Path: <linux-arm-msm+bounces-46301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C9CA200F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 23:48:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9833C163A50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 22:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7AD1DE4F9;
	Mon, 27 Jan 2025 22:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="Id7U+SnB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC191DE2BD;
	Mon, 27 Jan 2025 22:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738018003; cv=none; b=uS7DmN64f2D2odq2lljON4GwYP1WL24hbEnax36nFenyjsQp1kueMYDjb15qcTZlDnqKETp6U04aZdVQAOLkj/e/MLft6TyO5fdVGTHbEqf75KbMNtVsvn3ZsZFFYIJreeH6sTZPjXnc5vebWA1ZEiwQisX86f05vQnV8K6v1T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738018003; c=relaxed/simple;
	bh=8z+JuB535l7cRJzFcRHCvWml03C9Vi2YRxRm44GJLpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oyWkBpTUqoQt386cJyEU4e3SVSzaB7aSgMRjW7AQmE9QcJhjqJofufSuMTSKL48+3H6PXh3rTtZA+FLTSrIQ1kZRWmFU+L8xfFPc7POWo+/XnT1xk65CsAu+5PXGdBYWVpZ3749shAQJgKYMKDJ3MnUzohF9lyzrmlk7nkvKgRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=Id7U+SnB; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738017997; bh=8z+JuB535l7cRJzFcRHCvWml03C9Vi2YRxRm44GJLpw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Id7U+SnB0ODrIKWJHQYPLqgXOyfRMuHdGiBJj5oNABOmJq6eNFLPMia9dSJ5A05b7
	 48EzXZb2j5D2OjNkiBhUhHSUAySnnmObnLz6+zc4NddiO6MEP32XK6kf0QJbsS9x9D
	 EVzdBLCqtVJl/c8AtLxJyZXEQQIvLiaFOW6HYGoE=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Mon, 27 Jan 2025 23:45:37 +0100
Subject: [PATCH v3 05/13] remoteproc: qcom_q6v5_mss: Add modem support on
 MSM8226
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250127-msm8226-modem-v3-5-67e968787eef@lucaweiss.eu>
References: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
In-Reply-To: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8160; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=8z+JuB535l7cRJzFcRHCvWml03C9Vi2YRxRm44GJLpw=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmAzCRBdlHl4KmBtfNFXDLjCKHo+4eAF5X7LN8
 imT1vIWeI6JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5gMwgAKCRBy2EO4nU3X
 VrxKD/0eMIpPTO7zM+MPQk/0+V+anbghyNImlqppRS1nRf98JD2Dt2N1q9/FBunIc4MSuIeoPO/
 7VJJ/dUyBEQbn0ELy/bmXZuHDibwj7BqZ2fL6znD+jab6LyvIum9zEnV1CIo3ajowaL6ASnHJXW
 oHG3xmkchmKwartKaQ11sMqn/oguP5cI8ft3+p9Tvv60J3/04/DI/EF6snY9sxw1XQIE1nTe7h3
 Mf7A3aWusdQUYRjla30Zvx/HyMbST6jg0q6eqptlaMS2fEP+201TymmKSIsVzk/WcLseyOdPejj
 yF/LChffh4htR9qyNVVpn9wWXt3b+8YxJCHUs8Z0ubRTo69t3JpxlLmLC6h5rE4MLqX60VVr3vs
 JP/qNRBUVY/R2kHtzDzbFLs2x+MEej9Vd+MpLhtFdOjpYJ22uS1FmxIkop4foiYOORl/g1HN8Pz
 ytLn++2cF5+JnzetyUjxPQ7GdfRJpO8Ju/F3wvKRozMUQ0GnK549dasJ8mKrPmVyXDd0epGJsMW
 r89pLc7GQS74YbfeAClCKsEuAQEZ25WiTU1BMo1dTlZ35n81trhJq8VJ+5t/D8xqjnUXd3hKOZl
 VE4n9+cwpSJV2777EsohwPI0qMceGmXPRa08L3hHDZOAzGNcSInnqiKb/nHKFwPHRUVxR08lpPu
 ZjaV80SqpdhT1hw==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add support for the external power block headswitch register needed by
MSM8226 and some other qcom platforms.

Co-developed-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 113 +++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 0e1b0934ceedd13d5790b798afc95d68a8314c75..32f35fe89416f167fe49be7ca02a24af842e0073 100644
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
@@ -1750,6 +1759,23 @@ static int q6v5_init_mem(struct q6v5 *qproc, struct platform_device *pdev)
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
@@ -1871,6 +1897,34 @@ static void q6v5_pds_detach(struct q6v5 *qproc, struct device **pds,
 		dev_pm_domain_detach(pds[i], false);
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
 static int q6v5_init_reset(struct q6v5 *qproc)
 {
 	qproc->mss_restart = devm_reset_control_get_exclusive(qproc->dev,
@@ -2021,6 +2075,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, qproc);
 
 	qproc->has_qaccept_regs = desc->has_qaccept_regs;
+	qproc->has_ext_bhs_reg = desc->has_ext_bhs_reg;
 	qproc->has_ext_cntl_regs = desc->has_ext_cntl_regs;
 	qproc->has_vq6 = desc->has_vq6;
 	qproc->has_spare_reg = desc->has_spare_reg;
@@ -2079,6 +2134,12 @@ static int q6v5_probe(struct platform_device *pdev)
 		qproc->proxy_pd_count = ret;
 	}
 
+	if (qproc->has_ext_bhs_reg) {
+		ret = q6v5_external_bhs_enable(qproc);
+		if (ret < 0)
+			goto detach_proxy_pds;
+	}
+
 	qproc->has_alt_reset = desc->has_alt_reset;
 	ret = q6v5_init_reset(qproc);
 	if (ret)
@@ -2143,6 +2204,9 @@ static void q6v5_remove(struct platform_device *pdev)
 	qcom_remove_smd_subdev(rproc, &qproc->smd_subdev);
 	qcom_remove_glink_subdev(rproc, &qproc->glink_subdev);
 
+	if (qproc->has_ext_bhs_reg)
+		q6v5_external_bhs_disable(qproc);
+
 	q6v5_pds_detach(qproc, qproc->proxy_pds, qproc->proxy_pd_count);
 }
 
@@ -2174,6 +2238,7 @@ static const struct rproc_hexagon_res sc7180_mss = {
 	.has_mba_logs = true,
 	.has_spare_reg = true,
 	.has_qaccept_regs = false,
+	.has_ext_bhs_reg = false,
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_SC7180,
@@ -2202,6 +2267,7 @@ static const struct rproc_hexagon_res sc7280_mss = {
 	.has_mba_logs = true,
 	.has_spare_reg = false,
 	.has_qaccept_regs = true,
+	.has_ext_bhs_reg = false,
 	.has_ext_cntl_regs = true,
 	.has_vq6 = true,
 	.version = MSS_SC7280,
@@ -2233,6 +2299,7 @@ static const struct rproc_hexagon_res sdm660_mss = {
 	.has_mba_logs = false,
 	.has_spare_reg = false,
 	.has_qaccept_regs = false,
+	.has_ext_bhs_reg = false,
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_SDM660,
@@ -2268,6 +2335,7 @@ static const struct rproc_hexagon_res sdm845_mss = {
 	.has_mba_logs = false,
 	.has_spare_reg = false,
 	.has_qaccept_regs = false,
+	.has_ext_bhs_reg = false,
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_SDM845,
@@ -2299,6 +2367,7 @@ static const struct rproc_hexagon_res msm8998_mss = {
 	.has_mba_logs = false,
 	.has_spare_reg = false,
 	.has_qaccept_regs = false,
+	.has_ext_bhs_reg = false,
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8998,
@@ -2337,6 +2406,7 @@ static const struct rproc_hexagon_res msm8996_mss = {
 	.has_mba_logs = false,
 	.has_spare_reg = false,
 	.has_qaccept_regs = false,
+	.has_ext_bhs_reg = false,
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8996,
@@ -2371,6 +2441,7 @@ static const struct rproc_hexagon_res msm8909_mss = {
 	.has_mba_logs = false,
 	.has_spare_reg = false,
 	.has_qaccept_regs = false,
+	.has_ext_bhs_reg = false,
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8909,
@@ -2416,6 +2487,7 @@ static const struct rproc_hexagon_res msm8916_mss = {
 	.has_mba_logs = false,
 	.has_spare_reg = false,
 	.has_qaccept_regs = false,
+	.has_ext_bhs_reg = false,
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8916,
@@ -2451,6 +2523,7 @@ static const struct rproc_hexagon_res msm8953_mss = {
 	.has_mba_logs = false,
 	.has_spare_reg = false,
 	.has_qaccept_regs = false,
+	.has_ext_bhs_reg = false,
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8953,
@@ -2504,13 +2577,53 @@ static const struct rproc_hexagon_res msm8974_mss = {
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


