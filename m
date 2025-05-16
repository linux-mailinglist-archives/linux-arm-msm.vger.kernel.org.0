Return-Path: <linux-arm-msm+bounces-58217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D9EAB9C3D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 14:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C0143AC631
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 12:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59CCE241680;
	Fri, 16 May 2025 12:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZhLcNiMG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185E423E35D;
	Fri, 16 May 2025 12:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747398971; cv=none; b=FkJH7Eywl6ZwL+Rr0zHD9jHtQFEwG5AnNa+tLZpJr+/hw93L8Q8m9EzI0XOTvLMLd1SU8hOSvIQj2o/D0JFnBBaxPfbCi8H6qatC83LgKtVoHD23BJJ/223dqVmw8lWO7nCoC/MEcl69WV+Xz1dEAhZ75BOXbmm56zCYKexo8Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747398971; c=relaxed/simple;
	bh=WmKcPjeSa4QcrzycLdW5+c1w5YVhsYcAFwCdcwW0SVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BuV++mHnV3Bmh7EZ+LIrZWFCn9rcgVPKcjglEpRcmEXoTgTDkD//Bc+q/9Kj6lzNfsLD7BzyLlSbckUlOpdS+3gIHBGD4jCJKhmDk5ab8YRwNBRPXDRqwSdrbY++SMHtdNV/4imR02Ui9oVwaJ55CLeJksnuPUehoXS2/wLdnFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZhLcNiMG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D7EAC4CEF3;
	Fri, 16 May 2025 12:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747398970;
	bh=WmKcPjeSa4QcrzycLdW5+c1w5YVhsYcAFwCdcwW0SVg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZhLcNiMG+mBR3uPrtHWprcN8tga2LIUBjviMFA4oNhmuUtu8ZDAPaP4BfRxqSuYXz
	 hsLqOq/IG+3C3QptdeQD5du2KrtflO2xopB0Yq+f9zh6xdGVL3pvvdRe0hVGOOvKIH
	 +90AaW1zTG35nv5uko9E133mTftzChzPJ/KLsJ4ndM4sX1AI/4c7p5UUNFN5PUvCCm
	 AMqdzZOoXuFf/mZoH1FdUlb84pLLpO0N/EI4g6A84GnCwer+cwOoSyK28mkKHkhjpk
	 d2CH3doIaSIysNwLJtTLUQNDSUCL5miaP2tYmwrXZBVmk3Gmg/yWexj65OOxL2KQwG
	 3JtHbUz//aQdg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7174CC3DA6D;
	Fri, 16 May 2025 12:36:10 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Fri, 16 May 2025 16:36:10 +0400
Subject: [PATCH v4 3/5] clk: qcom: ipq-cmn-pll: Add IPQ5018 SoC support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-ipq5018-cmn-pll-v4-3-389a6b30e504@outlook.com>
References: <20250516-ipq5018-cmn-pll-v4-0-389a6b30e504@outlook.com>
In-Reply-To: <20250516-ipq5018-cmn-pll-v4-0-389a6b30e504@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747398968; l=4052;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=S1ht5tbqwChz5d/8M60AjKhgKOu4DbMAJtGD2WfstW0=;
 b=cVIl4bA6gtpQmW+97QyVMEQnktjFtHLpItj4cl6LnltuQ2Dd6XnA8NdI2VkVFJixZSiP+q3yR
 GcKC7HxXuYtApwsYk0H+n5lFL2w+GD5Y5pJctVXjcDanUBFIGKf3EQH
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



