Return-Path: <linux-arm-msm+bounces-82001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F8EC61D81
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 22:36:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3F2E935C1A4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 21:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D92275AF0;
	Sun, 16 Nov 2025 21:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="QR2pVfKY";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="yZCfNDok"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1718A26F29C;
	Sun, 16 Nov 2025 21:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763328987; cv=none; b=TtTFo9vrPeyp/mOYGJ4ksMBZto7rRxnMo831dBf+fKHljHBxupE5fbMLhosO8SiKKABAEFcSBplPNHkNe08R5nWdsscN3zn8OO8Dc2LAGgZA/Ul7pWfJotJpbXsnSwPH//UCrE19mOpcY/7GjydqKYlBK/K/XmQRCD23bsYbumM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763328987; c=relaxed/simple;
	bh=486CR4zcZyaZt91pKy2VFtFPopjl5/WpEv0OmXujqLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g1X0aiIfe/DBmXWINeU5Zu33BPxzXD6WLslYeNlA1zlOmF2/ARsuqY3QRlwg77lhCC4dYsuMu64HNFkEW5/5qsSamhcUi4FiMJOclIt8u4xg+YgnqCSLKvTIh64FFcaj/5srpZ+klWac6T4hNmh7RExjLrRzIZ5GpVmHRHbxbJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=QR2pVfKY; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=yZCfNDok; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763328961; bh=PGiXFOnN39t0Yul/dl68Dsy
	oV4pd1KRudxIDrbqH6aA=; b=QR2pVfKY5HvKyXJnyrgKI6KnG/ZdebHOhXJsxylQNCNF6djoqA
	y8rtJ99fnuCy5htvTbsv1YRJhqWlFHpBrpo09AdzXWiq7IeqryyrUvvLLRajXsbNiJ4GhBhxE92
	d7K6Q2GPkMpdnezlc17oN8OuF76B945GeeYcvR/uCRXl0SHpwEctS0wdSgSsueVVmexM1aa6JGE
	UEp+vmOI1Ekxwey/6jxRYZNEYL6qp2TFjQ/MqH/4sgf4dt7gjjIMubSl2AVh0hSV7/Y1IgLCnDC
	r+s/1AC3/eqm6+UeENFV4pfNsWQMGGkesOjzuN3aoYuWIgPjIl2z6QvWT0Da+G+jF2g==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763328961; bh=PGiXFOnN39t0Yul/dl68Dsy
	oV4pd1KRudxIDrbqH6aA=; b=yZCfNDokLWUd3HODTM7KvQUABUIj5/qnkkWmJkaDrv8izGO202
	eCbCIqmxd2tWUdMNnAtnDIsFg1Pbkmg8nTCQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 16 Nov 2025 22:35:59 +0100
Subject: [PATCH 4/4] clk: qcom: gcc: Add support for Global Clock
 controller found on SDM439
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251116-gcc-msm8940-sdm439-v1-4-7c0dc89c922c@mainlining.org>
References: <20251116-gcc-msm8940-sdm439-v1-0-7c0dc89c922c@mainlining.org>
In-Reply-To: <20251116-gcc-msm8940-sdm439-v1-0-7c0dc89c922c@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Adam Skladowski <a_skl39@protonmail.com>, 
 Sireesh Kodali <sireeshkodali@protonmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Lanik <daniilt971@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763328958; l=4620;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=823C5pOAczA017jwcu9YCz+q+zjkKYskfQhyTrnW6VI=;
 b=7YwMvTJO22GsHTWYUsYknlj4kUPNkLNz3fJsMaMgGL15cyLroxwDVqls91/ycA0zfcC56ELXE
 PnsvLl4lZyLBel08LrPpEZp3GvRDVkPOwSpG6/g8AdojbNFgn7HSTtJ
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

From: Lanik <daniilt971@gmail.com>

Modify existing MSM8917 driver to support SDM439 SoC. SDM439 SoC has the
same changes as MSM8937 SoC, but with different gpll3 vco rate and
different GFX3D clock frequency table.

Signed-off-by: Lanik <daniilt971@gmail.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/clk/qcom/Kconfig       |  4 +--
 drivers/clk/qcom/gcc-msm8917.c | 55 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index c2c62b3a5bdc..b74f4bfcbe5e 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -370,12 +370,12 @@ config MSM_GCC_8916
 	  SD/eMMC, display, graphics, camera etc.
 
 config MSM_GCC_8917
-	tristate "MSM89(17/37/40)/QM215 Global Clock Controller"
+	tristate "MSM89(17/37/40)/QM215/SDM439 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	help
 	  Support for the global clock controller on msm8917, msm8937,
-	  msm8940 and qm215 devices.
+	  msm8940, qm215 and sdm439 devices.
 	  Say Y if you want to use devices such as UART, SPI i2c, USB,
 	  SD/eMMC, display, graphics, camera etc.
 
diff --git a/drivers/clk/qcom/gcc-msm8917.c b/drivers/clk/qcom/gcc-msm8917.c
index 6985888def5e..b6df627b0e05 100644
--- a/drivers/clk/qcom/gcc-msm8917.c
+++ b/drivers/clk/qcom/gcc-msm8917.c
@@ -978,6 +978,27 @@ static const struct freq_tbl ftbl_gfx3d_clk_src_msm8940[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_gfx3d_clk_src_sdm439[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(50000000, P_GPLL0, 16, 0, 0),
+	F(80000000, P_GPLL0, 10, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
+	F(160000000, P_GPLL0, 5, 0, 0),
+	F(200000000, P_GPLL0, 4, 0, 0),
+	F(216000000, P_GPLL6, 5, 0, 0),
+	F(228570000, P_GPLL0, 3.5, 0, 0),
+	F(240000000, P_GPLL6, 4.5, 0, 0),
+	F(266670000, P_GPLL0, 3, 0, 0),
+	F(320000000, P_GPLL0, 2.5, 0, 0),
+	F(355200000, P_GPLL3, 1, 0, 0),
+	F(400000000, P_GPLL0, 2, 0, 0),
+	F(450000000, P_GPLL3, 1, 0, 0),
+	F(510000000, P_GPLL3, 1, 0, 0),
+	F(560000000, P_GPLL3, 1, 0, 0),
+	F(650000000, P_GPLL3, 1, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 gfx3d_clk_src = {
 	.cmd_rcgr = 0x59000,
 	.hid_width = 5,
@@ -4060,6 +4081,16 @@ static const struct qcom_cc_desc gcc_msm8940_desc = {
 	.num_gdscs = ARRAY_SIZE(gcc_msm8937_gdscs),
 };
 
+static const struct qcom_cc_desc gcc_sdm439_desc = {
+	.config = &gcc_msm8917_regmap_config,
+	.clks = gcc_msm8937_clocks,
+	.num_clks = ARRAY_SIZE(gcc_msm8937_clocks),
+	.resets = gcc_msm8917_resets,
+	.num_resets = ARRAY_SIZE(gcc_msm8917_resets),
+	.gdscs = gcc_msm8937_gdscs,
+	.num_gdscs = ARRAY_SIZE(gcc_msm8937_gdscs),
+};
+
 static void msm8937_clock_override(void)
 {
 	/* GPLL3 750MHz configuration */
@@ -4085,6 +4116,27 @@ static void msm8937_clock_override(void)
 	usb_hs_system_clk_src.freq_tbl = ftbl_usb_hs_system_clk_src_msm8937;
 }
 
+static void sdm439_clock_override(void)
+{
+	/*
+	 * Set below clocks for use specific sdm439 parent map.
+	 */
+	vcodec0_clk_src.parent_map = gcc_cpp_map;
+	vcodec0_clk_src.clkr.hw.init = &vcodec0_clk_src_init_msm8937;
+
+	/*
+	 * Set below clocks for use specific sdm439 freq table.
+	 */
+	vfe0_clk_src.freq_tbl = ftbl_vfe_clk_src_msm8937;
+	vfe1_clk_src.freq_tbl = ftbl_vfe_clk_src_msm8937;
+	cpp_clk_src.freq_tbl = ftbl_cpp_clk_src_msm8937;
+	vcodec0_clk_src.freq_tbl = ftbl_vcodec0_clk_src_msm8937;
+	gfx3d_clk_src.freq_tbl = ftbl_gfx3d_clk_src_sdm439;
+	csi0phytimer_clk_src.freq_tbl = ftbl_csi_phytimer_clk_src_msm8937;
+	csi1phytimer_clk_src.freq_tbl = ftbl_csi_phytimer_clk_src_msm8937;
+	usb_hs_system_clk_src.freq_tbl = ftbl_usb_hs_system_clk_src_msm8937;
+}
+
 static int gcc_msm8917_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
@@ -4100,6 +4152,8 @@ static int gcc_msm8917_probe(struct platform_device *pdev)
 	} else if (gcc_desc == &gcc_msm8940_desc) {
 		msm8937_clock_override();
 		gfx3d_clk_src.freq_tbl = ftbl_gfx3d_clk_src_msm8940;
+	} else if (gcc_desc == &gcc_sdm439_desc) {
+		sdm439_clock_override();
 	}
 
 	regmap = qcom_cc_map(pdev, gcc_desc);
@@ -4116,6 +4170,7 @@ static const struct of_device_id gcc_msm8917_match_table[] = {
 	{ .compatible = "qcom,gcc-qm215", .data = &gcc_qm215_desc },
 	{ .compatible = "qcom,gcc-msm8937", .data = &gcc_msm8937_desc },
 	{ .compatible = "qcom,gcc-msm8940", .data = &gcc_msm8940_desc },
+	{ .compatible = "qcom,gcc-sdm439", .data = &gcc_sdm439_desc },
 	{},
 };
 MODULE_DEVICE_TABLE(of, gcc_msm8917_match_table);

-- 
2.51.2


