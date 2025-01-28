Return-Path: <linux-arm-msm+bounces-46433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 944AEA2151A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 00:37:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCF661674EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 23:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B9C1F755D;
	Tue, 28 Jan 2025 23:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="yx1qViwT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63C81F473E;
	Tue, 28 Jan 2025 23:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738107392; cv=none; b=PC5DP8vB2JTS3zRN1uEDS9hfcW1HC5fThpX8f82q1wCiQ680F0UFezihUs6sabzJWZ3qH54jj2fHgYCx2oVyDmfLpK2s7C3hwKBYw1QAcZ8VzXjytexOpTo2g8NRRqubuaHGMKmvQ9hf9dBwBSlzDIm2NODtw54FYP0bHnyX2uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738107392; c=relaxed/simple;
	bh=WO0lvLO0J+rH/nOFep5/U1opFixrzWGFvLwItbmHAek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JNrVCmhAsloDEQdiNItrqjzsHkvTyK9RwmNOD40PaPpxy9l0hRaJbEF3WOS9s54IPvppka1guBLE4szRaGbH1gXH4tjmYHQP781MWbwvKFs8mBQ+X53OgXSf3aM9bKDcw3p/66eShjsLWmpa5faD16d/VgYO2QcvabhSg/hpnQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=yx1qViwT; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738107379; bh=WO0lvLO0J+rH/nOFep5/U1opFixrzWGFvLwItbmHAek=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=yx1qViwTXzVpsoIleU93JdH/jZuV/aLZDOZ44FfACqmHdB3bVjvkdl0kWnF1yz1PC
	 mPxKQWQZoHwfRI7CuRPcowceurE/AkFHBXcL7gg5vS0dUifZEnkXqKPQ1BJvoKbAHw
	 F/nX+KQ6phPNt2XDiKv8jbIosGpBiiPCb97FWayc=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 29 Jan 2025 00:35:37 +0100
Subject: [PATCH v4 05/13] remoteproc: qcom_q6v5_mss: Add modem support on
 MSM8226
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250129-msm8226-modem-v4-5-2b02ed7b7f1c@lucaweiss.eu>
References: <20250129-msm8226-modem-v4-0-2b02ed7b7f1c@lucaweiss.eu>
In-Reply-To: <20250129-msm8226-modem-v4-0-2b02ed7b7f1c@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8694; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=WO0lvLO0J+rH/nOFep5/U1opFixrzWGFvLwItbmHAek=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmWnpfsk+S2KK9NCF3sxU9MupfW8ImgUte7Epn
 iZfGLTWj92JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5lp6QAKCRBy2EO4nU3X
 VnxrD/0RmIyOlmolGqZMnfqOtJq1m+GgtHSRAxOjmtUKU+Wr5NmydSAJR1Hzz36pasNiiENwAEg
 Sr+JQmDeqNWnXVQFZ5iBdd3ZRpfWAWfnNLSVZBgSUt7K8x915OGr6u1U4uU/SrINIWxcsFP7KF4
 uYu8fo8t7Q0fs8twR3WEDe11/wynLGGpdhPEPEnk+DGAwtJeF17H/a9s5Yx08NOVKfDhmXetoEc
 bjIGStyiHn8tOASrIhbNhasIih4py8mgFDkz94N6jlVSG7Fi49c2GkcYnLfAqRwkb/oDZbpHQD3
 K6hPRVHchaOrVyJjh9H6REbC0YQa64P7p/FQbOAxIe1eI4aTFSvAnn7flBxMm4CCTRKKenlIbDR
 XzBm8NinaEinWfPHsouifeDURI3qMLLhvF1ut3ELQF+ToeV5TFKLiTmjmrpLr+ToxgpIq5r34LE
 YDNni3Ygsg0u6Td2YVPOo1nVl5UkKBChWp3YSo7PogmOss2vxl/Y89rGTQ6sK+bWzbpUEQ3Mqi7
 TPWWzBmS9R8F5CUmBsdoRtyQKKa4s6oqK8E5dvFVoU7vj70XYyZKU+sWulfFp3MAGnu5ZkAZnCj
 k7xxiGOYaBJfqniy8UglwTYRyYgaZ8VOEltGD/pVDuIcQO/QBg8rA/pVPrmc3U0g4UiMxNcBG1O
 gWuJi6NMPghZHSg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add support for the external power block headswitch register needed by
MSM8226 and some other qcom platforms.

Co-developed-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
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


