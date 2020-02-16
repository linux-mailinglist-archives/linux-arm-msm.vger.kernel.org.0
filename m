Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0166D16037F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Feb 2020 11:28:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbgBPK2j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Feb 2020 05:28:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:44460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725951AbgBPK2j (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Feb 2020 05:28:39 -0500
Received: from localhost.localdomain (unknown [122.178.194.127])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B47F120857;
        Sun, 16 Feb 2020 10:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581848918;
        bh=I45mpKN9HaTxsj/paq804ElnxebxHGDKm3u/O96MCI8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=zXW/WK1U1ozaJ3ClK0sslzWYqjwg5HNAH3eia64mkIxZrUUKsZsFAfJ+ctbLrd+ql
         ddcnpGnPTZNo7mZRCHkrIaWCcYXcGqLSKokzDP3r2BfhIhJoYOuM/0FvSxBVOw7CGP
         ao7vFCw2vfKwpsIFoqv8Y4m8ZvcA0kiMLeCzgPv4=
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
Subject: [PATCH v3 2/5] clk: qcom: clk-alpha-pll: Refactor trion PLL
Date:   Sun, 16 Feb 2020 15:57:22 +0530
Message-Id: <20200216102725.2629155-3-vkoul@kernel.org>
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

Remove duplicate function for calculating the round rate of PLL and also
update the trion pll ops to use the common function.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 33 ++++++--------------------------
 1 file changed, 6 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 0bdf6e45fac9..0adec585eb4f 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -845,33 +845,12 @@ static unsigned long
 clk_trion_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
-	struct regmap *regmap = pll->clkr.regmap;
-	u32 l, frac;
-	u64 prate = parent_rate;
-
-	regmap_read(regmap, PLL_L_VAL(pll), &l);
-	regmap_read(regmap, PLL_ALPHA_VAL(pll), &frac);
-
-	return alpha_pll_calc_rate(prate, l, frac, ALPHA_REG_16BIT_WIDTH);
-}
-
-static long clk_trion_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
-{
-	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
-	unsigned long min_freq, max_freq;
-	u32 l;
-	u64 a;
-
-	rate = alpha_pll_round_rate(rate, *prate,
-				    &l, &a, ALPHA_REG_16BIT_WIDTH);
-	if (!pll->vco_table || alpha_pll_find_vco(pll, rate))
-		return rate;
+	u32 l, frac, alpha_width = pll_alpha_width(pll);
 
-	min_freq = pll->vco_table[0].min_freq;
-	max_freq = pll->vco_table[pll->num_vco - 1].max_freq;
+	regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l);
+	regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL(pll), &frac);
 
-	return clamp(rate, min_freq, max_freq);
+	return alpha_pll_calc_rate(parent_rate, l, frac, alpha_width);
 }
 
 const struct clk_ops clk_alpha_pll_fixed_ops = {
@@ -917,7 +896,7 @@ const struct clk_ops clk_trion_fixed_pll_ops = {
 	.disable = clk_trion_pll_disable,
 	.is_enabled = clk_trion_pll_is_enabled,
 	.recalc_rate = clk_trion_pll_recalc_rate,
-	.round_rate = clk_trion_pll_round_rate,
+	.round_rate = clk_alpha_pll_round_rate,
 };
 EXPORT_SYMBOL_GPL(clk_trion_fixed_pll_ops);
 
@@ -1173,7 +1152,7 @@ static int alpha_pll_fabia_set_rate(struct clk_hw *hw, unsigned long rate,
 	 * Due to limited number of bits for fractional rate programming, the
 	 * rounded up rate could be marginally higher than the requested rate.
 	 */
-	if (rrate > max || rrate < rate) {
+	if (rrate > (rate + PLL_RATE_MARGIN) || rrate < rate) {
 		pr_err("%s: Rounded rate %lu not within range [%lu, %lu)\n",
 		       clk_hw_get_name(hw), rrate, rate, max);
 		return -EINVAL;
-- 
2.24.1

