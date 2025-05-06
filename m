Return-Path: <linux-arm-msm+bounces-56897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B12AABBB7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 09:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1CCF3A7E2B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 07:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C08296152;
	Tue,  6 May 2025 05:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kxZZ6jKE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614E229551C;
	Tue,  6 May 2025 05:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746510261; cv=none; b=KSVjufyI6J+R4krzBXwHHAuSNBO9rNPlAzvA68mXkyBAc9g00ErnKDUSe91u/Bc/XN7IHhDH9Ly2Ogu4pnTHgWEvP/gRfIb8fWEK6/6EUAk3gZbRhhZI3jqJsl34wFeeq4BgNikv4TTaON/5/HRzYhhqqHX9fcvB0viPhtnhGiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746510261; c=relaxed/simple;
	bh=oZZPzXRkRK1qwT8QXo+WyiPkT8wvLk9sLQ2Tj8Rhwsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M60sJx/4tFOHDksv8RbxaGRNLIF8svZTbz/6AiuaVeJbLO5xIXPWFd99IGlG9rCCPdCC8Ll791zUkDMCz7u/1vAtgrANbEGsMJXl2+gxRRw3zSXx3nQ+YlYIj3sSi3cay1sFqEKiXiGIKgGdx1up+6torN+gjkIngKWY3h+r6ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kxZZ6jKE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD3D1C4CEF4;
	Tue,  6 May 2025 05:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746510260;
	bh=oZZPzXRkRK1qwT8QXo+WyiPkT8wvLk9sLQ2Tj8Rhwsc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kxZZ6jKEjLu3J/TvjDFTi1mWqiBy9JC2jawEEd6HcvGG4ZetWoMw8Enl++i9bW9ta
	 I0qzpzEKqYjB1qPmTtl0MInuGP1KivmZ2UwD7wtfFG9B8mTo+/fds6wnbuGNUogp0L
	 76wETuUZ9aaS7TWU57GVkcRFBt4HGGNOUMchDDN0ZQxAbxzqiyGjF5Svzn9kI/h8X9
	 adHakzhwFIx6fT8QhJRXf6Ra70MxeHN0pEObsgfXz8R8pcvDQU95vfZ5Ok4GQhslfH
	 zPGMv4nFNrlG7jQErffyJreQNDMmyqkJC19XxetJmMqMHV3sK6ilmvz5eYms7ziQw2
	 Ms1lz+dx1MMTg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7616C3ABBC;
	Tue,  6 May 2025 05:44:20 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 06 May 2025 09:43:36 +0400
Subject: [PATCH v2 4/6] clk: qcom: ipq-cmn-pll: Add IPQ5018 SoC support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-ipq5018-cmn-pll-v2-4-c0a9fcced114@outlook.com>
References: <20250506-ipq5018-cmn-pll-v2-0-c0a9fcced114@outlook.com>
In-Reply-To: <20250506-ipq5018-cmn-pll-v2-0-c0a9fcced114@outlook.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>, 
 Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746510258; l=4181;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=RLCf5CaWa6JRGj1tMwC22OxTx2xTaEIjQUUkGIrSCqw=;
 b=CK+Io6bobabhxzkFJqjpS4kSr6iNuus3yW3mS3XzztrG48y9lp3tMHgzE++4lSIrx7RsmdvxZ
 HOJGKGP00WbCNAwuSkjYBBr4f/vt5WuQBvtEHmZtcxbXWYp2K5Ogiof
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
 drivers/clk/qcom/ipq-cmn-pll.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index b34d6faf67b8dd74402fabdb8dfe5ea52edd52f4..b3d7169c63e5fa7638fee80094a47746a0b6845e 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -50,6 +50,7 @@
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
+#include <dt-bindings/clock/qcom,ipq5018-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5424-cmn-pll.h>
 
 #define CMN_PLL_REFCLK_SRC_SELECTION		0x28
@@ -110,16 +111,10 @@ static const struct regmap_config ipq_cmn_pll_regmap_config = {
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
 
@@ -136,6 +131,19 @@ static const struct cmn_pll_fixed_output_clk ipq5424_output_clks[] = {
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
@@ -399,11 +407,11 @@ static int ipq_cmn_pll_clk_probe(struct platform_device *pdev)
 	 */
 	ret = pm_clk_add(dev, "ahb");
 	if (ret)
-		return dev_err_probe(dev, ret, "Fail to add AHB clock\n");
+		return dev_err_probe(dev, ret, "Failed to add AHB clock\n");
 
 	ret = pm_clk_add(dev, "sys");
 	if (ret)
-		return dev_err_probe(dev, ret, "Fail to add SYS clock\n");
+		return dev_err_probe(dev, ret, "Failed to add SYS clock\n");
 
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
@@ -414,7 +422,7 @@ static int ipq_cmn_pll_clk_probe(struct platform_device *pdev)
 	pm_runtime_put(dev);
 	if (ret)
 		return dev_err_probe(dev, ret,
-				     "Fail to register CMN PLL clocks\n");
+				     "Failed to register CMN PLL clocks\n");
 
 	return 0;
 }
@@ -439,8 +447,9 @@ static const struct dev_pm_ops ipq_cmn_pll_pm_ops = {
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



