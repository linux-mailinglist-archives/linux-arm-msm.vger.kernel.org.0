Return-Path: <linux-arm-msm+bounces-56474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED60CAA6F3A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 12:16:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5730A4C17FC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 10:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A825A23C4EA;
	Fri,  2 May 2025 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rSJpHzBq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BE4231849;
	Fri,  2 May 2025 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180949; cv=none; b=qYRf2CzyB5uuU0Qqgx1+V0VpZsmGIYt5InWEznYPGPDEpLwZUotaEhlHwVC5pb5l4zdR+aUj7obm/cA6eos6zbH1+AG2miLa40BZr7hdDpwTusRaTlUTnKyOnUrgCsGyqus9yrVYFunVrpbUvWaqUquiIazvg89LZn6pVgcv7Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180949; c=relaxed/simple;
	bh=+i6U5gzgaJQuykdrlR9696g2Ug/pI295l1VkB4dqmU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PsS5CJXFXb/fQzMl59qzeYcN0FaO6vDiEM6QEUkR6hkK3euFHv2m9hwoogyFo+momfC8VSuqqd8ekWuizxjsjGU4U4goXJaVo2lB1l/wD59906SzVNBsIVv6pZBrmqCS8+kt/Jnw0kdz4AzzhcXgrp+4xrU4s8dZH5/Ahy3TNu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rSJpHzBq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13006C4CEEF;
	Fri,  2 May 2025 10:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746180949;
	bh=+i6U5gzgaJQuykdrlR9696g2Ug/pI295l1VkB4dqmU8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rSJpHzBqVAGBEJkKavDLNgcVgbYPj4P/aY82vHe+99Rx+X8lY24bRVY5uvkORXUfd
	 zpwS4+5AbBhBFQKkIE0ZyaqDPJ/ieqqIMhp62e24z2fwDXXFzymsQGQ6T6vJjnbOU/
	 TQXlaaEF9AsqcVAaNY1o3UGVhMEQX7JbN3HWGpCZPP7ig9zzWZxjGdFR+A4eRlCVtt
	 WQAcN04F6S28V2a3MYUS7Yp4HgVTTkdT4GVSplWVk62QP78DbkxXCvqEB0IazcXMqx
	 eJGETVQU0bIyL3VPBix4BNKk40N3VmJKvDF+O1ka/j+W8KBRMSjLPw39XN4LiBP0qW
	 wAmeJYImcNXjA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 031ECC3ABAC;
	Fri,  2 May 2025 10:15:49 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Fri, 02 May 2025 14:15:45 +0400
Subject: [PATCH 3/6] clk: qcom: ipq-cmn-pll: Add IPQ5018 SoC support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-ipq5018-cmn-pll-v1-3-27902c1c4071@outlook.com>
References: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
In-Reply-To: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>, 
 Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746180945; l=5376;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=PEmE2g2mhIp+5KgVZEFjuRFR4mN6d1vKPr3n1ioKGP8=;
 b=xk+zmNRHrItlJ/CpcHVMMaOP1kSYV0bYRvjVOWbUkf+M1rcau8nVETBYhlAkWKdsURB2xLwH0
 GTEWGj0s7myDrxdUB5zfDMoVjV1hG7b6KMfgWqs67TkWWb8FpAoKKDZ
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

The CMN PLL in IPQ5018 SoC supplies fixed clocks to XO, sleep, and the
ethernet block. The CMN PLL to the ethernet block must be enabled first
by setting a specific register in the TCSR area set in the device tree.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 72 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 61 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index b34d6faf67b8dd74402fabdb8dfe5ea52edd52f4..8e1faea1f980fd53f62b340aa31b6cf1b14f7923 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -42,6 +42,7 @@
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/mfd/syscon.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -50,6 +51,7 @@
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
+#include <dt-bindings/clock/qcom,ipq5018-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5424-cmn-pll.h>
 
 #define CMN_PLL_REFCLK_SRC_SELECTION		0x28
@@ -72,6 +74,9 @@
 #define CMN_PLL_DIVIDER_CTRL			0x794
 #define CMN_PLL_DIVIDER_CTRL_FACTOR		GENMASK(9, 0)
 
+#define TCSR_CMN_PLL_ETH			0x4
+#define TCSR_CMN_PLL_ETH_ENABLE			BIT(0)
+
 /**
  * struct cmn_pll_fixed_output_clk - CMN PLL output clocks information
  * @id:	Clock specifier to be supplied
@@ -92,6 +97,7 @@ struct cmn_pll_fixed_output_clk {
 struct clk_cmn_pll {
 	struct regmap *regmap;
 	struct clk_hw hw;
+	struct regmap *tcsr;
 };
 
 #define CLK_PLL_OUTPUT(_id, _name, _rate) {		\
@@ -110,16 +116,10 @@ static const struct regmap_config ipq_cmn_pll_regmap_config = {
 	.fast_io = true,
 };
 
-static const struct cmn_pll_fixed_output_clk ipq9574_output_clks[] = {
-	CLK_PLL_OUTPUT(XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
-	CLK_PLL_OUTPUT(SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
-	CLK_PLL_OUTPUT(PCS_31P25MHZ_CLK, "pcs-31p25mhz", 31250000UL),
-	CLK_PLL_OUTPUT(NSS_1200MHZ_CLK, "nss-1200mhz", 1200000000UL),
-	CLK_PLL_OUTPUT(PPE_353MHZ_CLK, "ppe-353mhz", 353000000UL),
-	CLK_PLL_OUTPUT(ETH0_50MHZ_CLK, "eth0-50mhz", 50000000UL),
-	CLK_PLL_OUTPUT(ETH1_50MHZ_CLK, "eth1-50mhz", 50000000UL),
-	CLK_PLL_OUTPUT(ETH2_50MHZ_CLK, "eth2-50mhz", 50000000UL),
-	CLK_PLL_OUTPUT(ETH_25MHZ_CLK, "eth-25mhz", 25000000UL),
+static const struct cmn_pll_fixed_output_clk ipq5018_output_clks[] = {
+	CLK_PLL_OUTPUT(IPQ5018_XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
+	CLK_PLL_OUTPUT(IPQ5018_SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
+	CLK_PLL_OUTPUT(IPQ5018_ETH_50MHZ_CLK, "eth-50mhz", 50000000UL),
 	{ /* Sentinel */ }
 };
 
@@ -136,6 +136,19 @@ static const struct cmn_pll_fixed_output_clk ipq5424_output_clks[] = {
 	{ /* Sentinel */ }
 };
 
+static const struct cmn_pll_fixed_output_clk ipq9574_output_clks[] = {
+	CLK_PLL_OUTPUT(XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
+	CLK_PLL_OUTPUT(SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
+	CLK_PLL_OUTPUT(PCS_31P25MHZ_CLK, "pcs-31p25mhz", 31250000UL),
+	CLK_PLL_OUTPUT(NSS_1200MHZ_CLK, "nss-1200mhz", 1200000000UL),
+	CLK_PLL_OUTPUT(PPE_353MHZ_CLK, "ppe-353mhz", 353000000UL),
+	CLK_PLL_OUTPUT(ETH0_50MHZ_CLK, "eth0-50mhz", 50000000UL),
+	CLK_PLL_OUTPUT(ETH1_50MHZ_CLK, "eth1-50mhz", 50000000UL),
+	CLK_PLL_OUTPUT(ETH2_50MHZ_CLK, "eth2-50mhz", 50000000UL),
+	CLK_PLL_OUTPUT(ETH_25MHZ_CLK, "eth-25mhz", 25000000UL),
+	{ /* Sentinel */ }
+};
+
 /*
  * CMN PLL has the single parent clock, which supports the several
  * possible parent clock rates, each parent clock rate is reflected
@@ -380,11 +393,47 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 	return ret;
 }
 
+static inline int ipq_cmn_pll_eth_enable(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	unsigned int cmn_pll_offset;
+	struct regmap *tcsr;
+	int ret;
+
+	tcsr = syscon_regmap_lookup_by_phandle_args(dev->of_node, "qcom,cmn-pll-eth-enable",
+						    1, &cmn_pll_offset);
+	if (IS_ERR(tcsr)) {
+		ret = PTR_ERR(tcsr);
+		/*
+		 * continue if -ENODEV is returned as not all IPQ SoCs
+		 * need to enable CMN PLL. If it's another error, return it.
+		 */
+		if (ret == -ENODEV)
+			tcsr = NULL;
+		else
+			return ret;
+	}
+
+	if (tcsr) {
+		ret = regmap_update_bits(tcsr, cmn_pll_offset + TCSR_CMN_PLL_ETH,
+					 TCSR_CMN_PLL_ETH_ENABLE, TCSR_CMN_PLL_ETH_ENABLE);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int ipq_cmn_pll_clk_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	int ret;
 
+	ret = ipq_cmn_pll_eth_enable(pdev);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Fail to enable CMN PLL to ethernet");
+
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		return ret;
@@ -439,8 +488,9 @@ static const struct dev_pm_ops ipq_cmn_pll_pm_ops = {
 };
 
 static const struct of_device_id ipq_cmn_pll_clk_ids[] = {
-	{ .compatible = "qcom,ipq9574-cmn-pll", .data = &ipq9574_output_clks },
+	{ .compatible = "qcom,ipq5018-cmn-pll", .data = &ipq5018_output_clks },
 	{ .compatible = "qcom,ipq5424-cmn-pll", .data = &ipq5424_output_clks },
+	{ .compatible = "qcom,ipq9574-cmn-pll", .data = &ipq9574_output_clks },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ipq_cmn_pll_clk_ids);

-- 
2.49.0



