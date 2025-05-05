Return-Path: <linux-arm-msm+bounces-56868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 856ABAAB311
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 06:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B5937A18C2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 04:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8653A22B8C2;
	Tue,  6 May 2025 00:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q8KBFdqA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A6735D7AF;
	Mon,  5 May 2025 23:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486223; cv=none; b=Wbw2LfRgpGYFTBuc0LZ6+um4WS+YmiDp15Ek+fPsoxeglCcZMjtDnVEzakmeCmQ8wybj2wENEOlVOqCk3UYXVA6Slalh+Fhqd5O9XN1dj5svYXVRlfJTursGq0GSlq8xiWyrQ+VkxdUY1ThQ/nDdi6N/CuFQxPWClJvClS8UUGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486223; c=relaxed/simple;
	bh=6F4NyuTwU+aeLO8gfK01++hQ8YtLGDavtq4s0fM7NUE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IFlVlKd8J4zDYdx3ChuxKoVaCOOuODYaWSc6KDw/GmfabGUBVkRkkCc6fQH+atPIYCWtNFve5ne46ttTno70hJk2pyTjCCtcfVfNKbtrRF5mLp0qWsHhCheh7vkar0x5zTkXBK7/Big3petLoFk3vXq062V5K5AA9uhs5HmHcxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q8KBFdqA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C76C4CEED;
	Mon,  5 May 2025 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486223;
	bh=6F4NyuTwU+aeLO8gfK01++hQ8YtLGDavtq4s0fM7NUE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q8KBFdqA5bdRRc034F4ec6FMI/SDn+iN+I55BjqzRh9adQgoS435ZF8mX1AlkIzdx
	 F9+vQw9j28QZ1Tn6MbohRnViIoDETah7R11Ut1TsEUveXSPRrRPl/Zfcs+iv7ZMx+t
	 IG+Mr/UaAAmFFZPGvMZ9lFltdDCbOxk/uAyQM+viIZWH3WvAbbjxZ4NVf3J7Ksb8Ig
	 KJzouuuC9LGtbdmXVfImHRiA2Wc6EflopDZ51TBytEJYAOZQLEGiEuP41IRt8P5PCR
	 MzhpXPLQxbJspWHRxVrRn6vgyJkJdRmBx8sSzBLdxLzJK2GIbVvXn9AUclL4anhDnO
	 9j9bafBewESfw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 216/294] clk: qcom: clk-alpha-pll: Do not use random stack value for recalc rate
Date: Mon,  5 May 2025 18:55:16 -0400
Message-Id: <20250505225634.2688578-216-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
Content-Transfer-Encoding: 8bit

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

[ Upstream commit 7a243e1b814a02ab40793026ef64223155d86395 ]

If regmap_read() fails, random stack value was used in calculating new
frequency in recalc_rate() callbacks.  Such failure is really not
expected as these are all MMIO reads, however code should be here
correct and bail out.  This also avoids possible warning on
uninitialized value.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Link: https://lore.kernel.org/r/20250212-b4-clk-qcom-clean-v3-1-499f37444f5d@linaro.org
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 52 ++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 80aadafffacdb..732ca46703ba3 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -645,14 +645,19 @@ clk_alpha_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	u32 alpha_width = pll_alpha_width(pll);
 
-	regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l);
+	if (regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l))
+		return 0;
+
+	if (regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &ctl))
+		return 0;
 
-	regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &ctl);
 	if (ctl & PLL_ALPHA_EN) {
-		regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL(pll), &low);
+		if (regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL(pll), &low))
+			return 0;
 		if (alpha_width > 32) {
-			regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll),
-				    &high);
+			if (regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll),
+					&high))
+				return 0;
 			a = (u64)high << 32 | low;
 		} else {
 			a = low & GENMASK(alpha_width - 1, 0);
@@ -844,8 +849,11 @@ alpha_pll_huayra_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	u32 l, alpha = 0, ctl, alpha_m, alpha_n;
 
-	regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l);
-	regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &ctl);
+	if (regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l))
+		return 0;
+
+	if (regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &ctl))
+		return 0;
 
 	if (ctl & PLL_ALPHA_EN) {
 		regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL(pll), &alpha);
@@ -1039,8 +1047,11 @@ clk_trion_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	u32 l, frac, alpha_width = pll_alpha_width(pll);
 
-	regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l);
-	regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL(pll), &frac);
+	if (regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l))
+		return 0;
+
+	if (regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL(pll), &frac))
+		return 0;
 
 	return alpha_pll_calc_rate(parent_rate, l, frac, alpha_width);
 }
@@ -1098,7 +1109,8 @@ clk_alpha_pll_postdiv_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
 	u32 ctl;
 
-	regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &ctl);
+	if (regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &ctl))
+		return 0;
 
 	ctl >>= PLL_POST_DIV_SHIFT;
 	ctl &= PLL_POST_DIV_MASK(pll);
@@ -1314,8 +1326,11 @@ static unsigned long alpha_pll_fabia_recalc_rate(struct clk_hw *hw,
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	u32 l, frac, alpha_width = pll_alpha_width(pll);
 
-	regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l);
-	regmap_read(pll->clkr.regmap, PLL_FRAC(pll), &frac);
+	if (regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l))
+		return 0;
+
+	if (regmap_read(pll->clkr.regmap, PLL_FRAC(pll), &frac))
+		return 0;
 
 	return alpha_pll_calc_rate(parent_rate, l, frac, alpha_width);
 }
@@ -1465,7 +1480,8 @@ clk_trion_pll_postdiv_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	struct regmap *regmap = pll->clkr.regmap;
 	u32 i, div = 1, val;
 
-	regmap_read(regmap, PLL_USER_CTL(pll), &val);
+	if (regmap_read(regmap, PLL_USER_CTL(pll), &val))
+		return 0;
 
 	val >>= pll->post_div_shift;
 	val &= PLL_POST_DIV_MASK(pll);
@@ -2339,9 +2355,12 @@ static unsigned long alpha_pll_lucid_evo_recalc_rate(struct clk_hw *hw,
 	struct regmap *regmap = pll->clkr.regmap;
 	u32 l, frac;
 
-	regmap_read(regmap, PLL_L_VAL(pll), &l);
+	if (regmap_read(regmap, PLL_L_VAL(pll), &l))
+		return 0;
 	l &= LUCID_EVO_PLL_L_VAL_MASK;
-	regmap_read(regmap, PLL_ALPHA_VAL(pll), &frac);
+
+	if (regmap_read(regmap, PLL_ALPHA_VAL(pll), &frac))
+		return 0;
 
 	return alpha_pll_calc_rate(parent_rate, l, frac, pll_alpha_width(pll));
 }
@@ -2416,7 +2435,8 @@ static unsigned long clk_rivian_evo_pll_recalc_rate(struct clk_hw *hw,
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	u32 l;
 
-	regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l);
+	if (regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l))
+		return 0;
 
 	return parent_rate * l;
 }
-- 
2.39.5


