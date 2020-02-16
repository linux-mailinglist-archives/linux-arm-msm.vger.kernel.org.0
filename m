Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8BA16037C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Feb 2020 11:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbgBPK2X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Feb 2020 05:28:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:44354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725951AbgBPK2X (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Feb 2020 05:28:23 -0500
Received: from localhost.localdomain (unknown [122.178.194.127])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DED9124670;
        Sun, 16 Feb 2020 10:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581848901;
        bh=gnBUbAVvQ/znBp5r6XVo7TvmU96qO2uqPCr26cpQG7k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Xt8EjqewbV1vVZN8lkyKHXboPaW2pMKkHxOle6tsaHYPC3yHo6GSMb3GG2R0Va2Zk
         vA3issNUCjNKoEt5mtJtj1fp4HDxvpLfwaQi9yypj7f3NNguU1iABII+O+GTNc0ssf
         ZLv/qCGsAWqXFOjOHl9TQp47G8vYr1cfWHoiXftQ=
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Taniya Das <tdas@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        psodagud@codeaurora.org, tsoni@codeaurora.org,
        jshriram@codeaurora.org, vnkgutta@codeaurora.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v3 1/5] clk: qcom: clk-alpha-pll: Use common names for defines
Date:   Sun, 16 Feb 2020 15:57:21 +0530
Message-Id: <20200216102725.2629155-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200216102725.2629155-1-vkoul@kernel.org>
References: <20200216102725.2629155-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Taniya Das <tdas@codeaurora.org>

The PLL run and standby modes are similar across the PLLs, thus rename
them to common names and update the use of these.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 40 ++++++++++++++------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 6d946770a80f..0bdf6e45fac9 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -134,15 +134,10 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
 #define PLL_HUAYRA_N_MASK		0xff
 #define PLL_HUAYRA_ALPHA_WIDTH		16
 
-#define FABIA_OPMODE_STANDBY	0x0
-#define FABIA_OPMODE_RUN	0x1
-
-#define FABIA_PLL_OUT_MASK	0x7
-#define FABIA_PLL_RATE_MARGIN	500
-
-#define TRION_PLL_STANDBY	0x0
-#define TRION_PLL_RUN		0x1
-#define TRION_PLL_OUT_MASK	0x7
+#define PLL_STANDBY		0x0
+#define PLL_RUN			0x1
+#define PLL_OUT_MASK		0x7
+#define PLL_RATE_MARGIN		500
 
 #define pll_alpha_width(p)					\
 		((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
@@ -766,7 +761,7 @@ static int trion_pll_is_enabled(struct clk_alpha_pll *pll,
 	if (ret)
 		return 0;
 
-	return ((opmode_regval & TRION_PLL_RUN) && (mode_regval & PLL_OUTCTRL));
+	return ((opmode_regval & PLL_RUN) && (mode_regval & PLL_OUTCTRL));
 }
 
 static int clk_trion_pll_is_enabled(struct clk_hw *hw)
@@ -796,7 +791,7 @@ static int clk_trion_pll_enable(struct clk_hw *hw)
 	}
 
 	/* Set operation mode to RUN */
-	regmap_write(regmap, PLL_OPMODE(pll), TRION_PLL_RUN);
+	regmap_write(regmap, PLL_OPMODE(pll), PLL_RUN);
 
 	ret = wait_for_pll_enable_lock(pll);
 	if (ret)
@@ -804,7 +799,7 @@ static int clk_trion_pll_enable(struct clk_hw *hw)
 
 	/* Enable the PLL outputs */
 	ret = regmap_update_bits(regmap, PLL_USER_CTL(pll),
-				 TRION_PLL_OUT_MASK, TRION_PLL_OUT_MASK);
+				 PLL_OUT_MASK, PLL_OUT_MASK);
 	if (ret)
 		return ret;
 
@@ -837,12 +832,12 @@ static void clk_trion_pll_disable(struct clk_hw *hw)
 
 	/* Disable the PLL outputs */
 	ret = regmap_update_bits(regmap, PLL_USER_CTL(pll),
-				 TRION_PLL_OUT_MASK, 0);
+				 PLL_OUT_MASK, 0);
 	if (ret)
 		return;
 
 	/* Place the PLL mode in STANDBY */
-	regmap_write(regmap, PLL_OPMODE(pll), TRION_PLL_STANDBY);
+	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
 	regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
 }
 
@@ -1089,14 +1084,14 @@ static int alpha_pll_fabia_enable(struct clk_hw *hw)
 		return ret;
 
 	/* Skip If PLL is already running */
-	if ((opmode_val & FABIA_OPMODE_RUN) && (val & PLL_OUTCTRL))
+	if ((opmode_val & PLL_RUN) && (val & PLL_OUTCTRL))
 		return 0;
 
 	ret = regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
 	if (ret)
 		return ret;
 
-	ret = regmap_write(regmap, PLL_OPMODE(pll), FABIA_OPMODE_STANDBY);
+	ret = regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
 	if (ret)
 		return ret;
 
@@ -1105,7 +1100,7 @@ static int alpha_pll_fabia_enable(struct clk_hw *hw)
 	if (ret)
 		return ret;
 
-	ret = regmap_write(regmap, PLL_OPMODE(pll), FABIA_OPMODE_RUN);
+	ret = regmap_write(regmap, PLL_OPMODE(pll), PLL_RUN);
 	if (ret)
 		return ret;
 
@@ -1114,7 +1109,7 @@ static int alpha_pll_fabia_enable(struct clk_hw *hw)
 		return ret;
 
 	ret = regmap_update_bits(regmap, PLL_USER_CTL(pll),
-				 FABIA_PLL_OUT_MASK, FABIA_PLL_OUT_MASK);
+				 PLL_OUT_MASK, PLL_OUT_MASK);
 	if (ret)
 		return ret;
 
@@ -1144,13 +1139,12 @@ static void alpha_pll_fabia_disable(struct clk_hw *hw)
 		return;
 
 	/* Disable main outputs */
-	ret = regmap_update_bits(regmap, PLL_USER_CTL(pll), FABIA_PLL_OUT_MASK,
-				 0);
+	ret = regmap_update_bits(regmap, PLL_USER_CTL(pll), PLL_OUT_MASK, 0);
 	if (ret)
 		return;
 
 	/* Place the PLL in STANDBY */
-	regmap_write(regmap, PLL_OPMODE(pll), FABIA_OPMODE_STANDBY);
+	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
 }
 
 static unsigned long alpha_pll_fabia_recalc_rate(struct clk_hw *hw,
@@ -1171,7 +1165,7 @@ static int alpha_pll_fabia_set_rate(struct clk_hw *hw, unsigned long rate,
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	u32 l, alpha_width = pll_alpha_width(pll);
 	u64 a;
-	unsigned long rrate, max = rate + FABIA_PLL_RATE_MARGIN;
+	unsigned long rrate, max = rate + PLL_RATE_MARGIN;
 
 	rrate = alpha_pll_round_rate(rate, prate, &l, &a, alpha_width);
 
@@ -1230,7 +1224,7 @@ static int alpha_pll_fabia_prepare(struct clk_hw *hw)
 	 * Due to a limited number of bits for fractional rate programming, the
 	 * rounded up rate could be marginally higher than the requested rate.
 	 */
-	if (rrate > (cal_freq + FABIA_PLL_RATE_MARGIN) || rrate < cal_freq)
+	if (rrate > (cal_freq + PLL_RATE_MARGIN) || rrate < cal_freq)
 		return -EINVAL;
 
 	/* Setup PLL for calibration frequency */
-- 
2.24.1

