Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 462B82F98C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 05:45:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730652AbhAREok (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Jan 2021 23:44:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:56830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731039AbhAREog (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Jan 2021 23:44:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF64A224B8;
        Mon, 18 Jan 2021 04:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610945036;
        bh=ujekwcrP8/ZvXDo6NAzxT624d7YlfKOIsh1MNlzQXL8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HU7jygmakiUs7elE/rEdfOsgxh+dqEtdpy7Rx57OM7tc9IJOmxvMy7Wn67vUf3Y6n
         sw5frbfK34dMU5lPFectduXcGK/V7leInaGVL58RKWyd9SF9BV/Slm34gGac432/PD
         G6iNcBG9F6HuPRsRMpjtKMRp0zV9Fv+hrBvyW/b8OoyDToHq4DntUTUuuTwprks4sE
         A0KPXXUuo31rZW2iWXbjsDYXy0EaXSxYYl/p5/B/j/s8BedJMiPKWkjA3Qay5pKcXt
         jSdf74Scb8ZJjd6cIlV2X7VdlDUZzNe7x1jkm+ms11FphfpUVD1OVO4vk8NG+AHdEv
         GhNkJYCvGBZeg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/5] clk: qcom: clk-alpha-pll: modularize alpha_pll_trion_set_rate()
Date:   Mon, 18 Jan 2021 10:13:18 +0530
Message-Id: <20210118044321.2571775-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210118044321.2571775-1-vkoul@kernel.org>
References: <20210118044321.2571775-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Trion 5LPE set rate uses code similar to alpha_pll_trion_set_rate() but
with different registers. Modularize these by moving out latch and latch
ack bits so that we can reuse the function.

Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index f7721088494c..a30ea7b09224 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1471,8 +1471,8 @@ static int alpha_pll_lucid_prepare(struct clk_hw *hw)
 	return __alpha_pll_trion_prepare(hw, LUCID_PCAL_DONE);
 }
 
-static int alpha_pll_trion_set_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long prate)
+static int __alpha_pll_trion_set_rate(struct clk_hw *hw, unsigned long rate,
+				      unsigned long prate, u32 latch_bit, u32 latch_ack)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	unsigned long rrate;
@@ -1490,22 +1490,20 @@ static int alpha_pll_trion_set_rate(struct clk_hw *hw, unsigned long rate,
 	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
 
 	/* Latch the PLL input */
-	ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll),
-				 PLL_UPDATE, PLL_UPDATE);
+	ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), latch_bit, latch_bit);
 	if (ret)
 		return ret;
 
 	/* Wait for 2 reference cycles before checking the ACK bit. */
 	udelay(1);
 	regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
-	if (!(val & ALPHA_PLL_ACK_LATCH)) {
+	if (!(val & latch_ack)) {
 		pr_err("Lucid PLL latch failed. Output may be unstable!\n");
 		return -EINVAL;
 	}
 
 	/* Return the latch input to 0 */
-	ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll),
-				 PLL_UPDATE, 0);
+	ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), latch_bit, 0);
 	if (ret)
 		return ret;
 
@@ -1520,6 +1518,12 @@ static int alpha_pll_trion_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
+static int alpha_pll_trion_set_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long prate)
+{
+	return __alpha_pll_trion_set_rate(hw, rate, prate, PLL_UPDATE, ALPHA_PLL_ACK_LATCH);
+}
+
 const struct clk_ops clk_alpha_pll_trion_ops = {
 	.prepare = alpha_pll_trion_prepare,
 	.enable = clk_trion_pll_enable,
-- 
2.26.2

