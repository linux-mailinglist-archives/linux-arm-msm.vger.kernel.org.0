Return-Path: <linux-arm-msm+bounces-82140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AE37DC655EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 18:11:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 90DEB3628EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 17:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC534305063;
	Mon, 17 Nov 2025 16:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="fKKesoZA";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="2lfrcH6I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1BB30217A;
	Mon, 17 Nov 2025 16:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763398669; cv=none; b=bwYK3snS8Tbyqd7T5PyQOgJBfrZMQAkIguu8E7faUxBNCkMt5FoXrcC6lKKXmbB+YBjhalkmPZ5rzP4GhBfKVNuCH45l6v2k1dNlXCk+RVXQQj2G/lKv6iLiLQEHPhaSqjZLSmihsEb6rCw9eVxwZgi6UItG5YRkTI3FFSsfZK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763398669; c=relaxed/simple;
	bh=xO06RRgqBP2BsiQpsl/we/o5YWM8pv0YoQoTIL842yU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BAObj2h91JEOLbcHOVl00xvxDqEaBOtvqwIyx6LtSvMO93za7IeYXzjLNrowbabKA5n82Y40ZEqjS2bnoqCP8xjC/FlqKKGD6fAMsE3V2r/11wOnHlGPrYQBIjqATsn8806XzATOET4nLn7XDHKDobHEta366wjBj895sePNALM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=fKKesoZA; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=2lfrcH6I; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763398643; bh=bNWufHuKYDFnV1FNDz6Fh6g
	PSlwGckLr1FqoPCfqVqE=; b=fKKesoZAMSUb3x7uvfwpSU/qLpDJAw8rUGOY+PkavBcPwjRsan
	go2Fl1p47sDr2FcT02kcPDK2Wd7HwGJdZivviRZDFLCVmJB33Vndj9NRDBidvgnEqGx9BjjKog/
	8ZxsQZfV6x6ZQ/XgLj0VSVyd6XTAnzaiK4zmuMfCiCzFnDGVguUKGWeW+k3Kp8TclBKyAEdYhop
	HkadyJ/cuibVZAZK3LP9olskubH9wqkK+n3CbSvVp/aaK7ige6Ie24ngwmIDlL/e8hbBon569o2
	owmBr0ZIhteETR5+FxqL071Uj/1xhQHvi4GShtXBIpkiGlbe5CZICIxkIlPQeB3hiAg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763398643; bh=bNWufHuKYDFnV1FNDz6Fh6g
	PSlwGckLr1FqoPCfqVqE=; b=2lfrcH6IYU4GN1BZVkQApECaaTgLnKecPGuDv3jVsg1avcFHF8
	vM3BuqxdFg5gGq7AZ62pZizO8gGXzz2zLFAg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 17 Nov 2025 17:57:09 +0100
Subject: [PATCH v2 4/4] clk: qcom: gcc: Add support for Global Clock
 controller found on SDM439
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251117-gcc-msm8940-sdm439-v2-4-4af57c8bc7eb@mainlining.org>
References: <20251117-gcc-msm8940-sdm439-v2-0-4af57c8bc7eb@mainlining.org>
In-Reply-To: <20251117-gcc-msm8940-sdm439-v2-0-4af57c8bc7eb@mainlining.org>
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
 Daniil Titov <daniilt971@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763398640; l=4484;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=4iYya7m4c1VKYu/N38D8gwQZhGVnVsDrhXO5R//f1zk=;
 b=hbkBuv4pzjPvlVfr3S8EUHpBAHCmWTkU8NdLFp+1521dG2ukdKhv81zVqDM/lmmiUpNMN3d62
 uF4CDErlOUuBB4bw4UOGEpQHYGS1pgPyhkXJpLx3wB6oJkz085T/2Vr
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

From: Daniil Titov <daniilt971@gmail.com>

Modify existing MSM8917 driver to support SDM439 SoC. SDM439 SoC has the
same changes as MSM8937 SoC, but with different gpll3 vco rate and
different GFX3D clock frequency table.

Signed-off-by: Daniil Titov <daniilt971@gmail.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/clk/qcom/Kconfig       |  4 ++--
 drivers/clk/qcom/gcc-msm8917.c | 49 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+), 2 deletions(-)

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
index 6985888def5e..835bc33c05c1 100644
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
@@ -4085,6 +4116,21 @@ static void msm8937_clock_override(void)
 	usb_hs_system_clk_src.freq_tbl = ftbl_usb_hs_system_clk_src_msm8937;
 }
 
+static void sdm439_clock_override(void)
+{
+	vcodec0_clk_src.parent_map = gcc_cpp_map;
+	vcodec0_clk_src.clkr.hw.init = &vcodec0_clk_src_init_msm8937;
+
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
@@ -4100,6 +4146,8 @@ static int gcc_msm8917_probe(struct platform_device *pdev)
 	} else if (gcc_desc == &gcc_msm8940_desc) {
 		msm8937_clock_override();
 		gfx3d_clk_src.freq_tbl = ftbl_gfx3d_clk_src_msm8940;
+	} else if (gcc_desc == &gcc_sdm439_desc) {
+		sdm439_clock_override();
 	}
 
 	regmap = qcom_cc_map(pdev, gcc_desc);
@@ -4116,6 +4164,7 @@ static const struct of_device_id gcc_msm8917_match_table[] = {
 	{ .compatible = "qcom,gcc-qm215", .data = &gcc_qm215_desc },
 	{ .compatible = "qcom,gcc-msm8937", .data = &gcc_msm8937_desc },
 	{ .compatible = "qcom,gcc-msm8940", .data = &gcc_msm8940_desc },
+	{ .compatible = "qcom,gcc-sdm439", .data = &gcc_sdm439_desc },
 	{},
 };
 MODULE_DEVICE_TABLE(of, gcc_msm8917_match_table);

-- 
2.51.2


