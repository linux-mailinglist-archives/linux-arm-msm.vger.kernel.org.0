Return-Path: <linux-arm-msm+bounces-58207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF35AB9B4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 13:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E1FCA048C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 11:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C712238C1E;
	Fri, 16 May 2025 11:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SJKMPaLg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29B641760;
	Fri, 16 May 2025 11:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747395788; cv=none; b=V6r4gMbMFapdoTEIkjL20l4jrHKYZVOuzJGtn7TH3qwrRLURkcnEAip2aT0ezFQAMZFRGDMi3PH3r2bk1OW68uxBXW+xWk5C8M4k7PGYHsen+2g+IarKofuhYmtXip+a+AXoRNwqro1XlV38VhhZrAIDVApM72263AslTuquO5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747395788; c=relaxed/simple;
	bh=WmKcPjeSa4QcrzycLdW5+c1w5YVhsYcAFwCdcwW0SVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GiSW/+wv2ofIYZ2TxkD5zq1pdcoujW7QYSqR/fdryjnhHJBZPg2CeMxVYd0JcnLVh5lYvu/LrijHjQGbDzTS29TXhfTndBK3dvFkphA4sfLTS+kvErcZJi93xdEdWeFKv6gw3MCwz9hUR9iV6sAIMoyMuPtL78t4mB0u+Ks64yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJKMPaLg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81A35C4CEEF;
	Fri, 16 May 2025 11:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747395787;
	bh=WmKcPjeSa4QcrzycLdW5+c1w5YVhsYcAFwCdcwW0SVg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SJKMPaLgPydrXPIPj8zoYrEEbN9C0EVTvh7nEYywmBPRze+k4qEV2YC4Jkp79Z3fN
	 mDCmEipAG25DqH9ojHYIsGbx4UYF53xzpMr2ClLYr6B3P5RAphZBb0T1MqPlJS2PmH
	 UousGbkXNkgDfSvS7GWwOGnw0SCw2cY6o0Dh8FVtCrZ9edOOghffSTZ0mmItB2PaNG
	 XncUdOJubi4x0hXl2Eg+Ge4mHf40IKWtQIptYP+KQVy8HGaOXxHSQ9Hjf+eSPyXrzN
	 +YP88ojB/BdC89WIQr45dCTRay06FBJbj/pdfzxDCMrd1a47gxgO1g97rpq1uWFiex
	 rHiz/PExCmgZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A86C54756;
	Fri, 16 May 2025 11:43:07 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Fri, 16 May 2025 15:43:06 +0400
Subject: [PATCH v3 3/5] clk: qcom: ipq-cmn-pll: Add IPQ5018 SoC support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-ipq5018-cmn-pll-v3-3-f3867c5a2076@outlook.com>
References: <20250516-ipq5018-cmn-pll-v3-0-f3867c5a2076@outlook.com>
In-Reply-To: <20250516-ipq5018-cmn-pll-v3-0-f3867c5a2076@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747395784; l=4052;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=S1ht5tbqwChz5d/8M60AjKhgKOu4DbMAJtGD2WfstW0=;
 b=Hi+M4YQe40Iv0r8LXUpsPGkIzCPL0+6ho7VpJ9E+kfYL3jn4K9YWzVr9jgYkpRubgnKKqsVzN
 ruOkaOZS07dDHpJxdy7+aGx8DZVHgF8rBX9cbPeki5bDks+b4vKYDTB
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

The CMN PLL in IPQ5018 SoC supplies fixed clocks to XO, sleep, and the
ethernet block.

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



