Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 622245239C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 08:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729418AbfFYGfH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 02:35:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:41722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726321AbfFYGfH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 02:35:07 -0400
Received: from localhost.localdomain (unknown [106.201.40.23])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 35E4F2085A;
        Tue, 25 Jun 2019 06:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561444507;
        bh=4p3TclynktLEVHGnNL/mLsnZWSfnsqwzBkuTC1A6VEo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IdfKzvRQHtACtYVzSU9BRHVOHPalr4PbGL+09cbQ96eB34hOoExQMgbpaXm/i7bhm
         2bQ2f4uETBY4LkqGS6UaphFLdYR9jmIy/H85EyhiqkYXDPLrI2w7MZLIIXC9sV6c9A
         VrOpwRSyHI/GCVIPSRG86l+MAqRz43L6up01O4Nw=
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v3 1/3] clk: qcom: clk-alpha-pll: Remove post_div_table checks
Date:   Tue, 25 Jun 2019 12:01:38 +0530
Message-Id: <20190625063140.17106-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625063140.17106-1-vkoul@kernel.org>
References: <20190625063140.17106-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We want users to code properly and fix the post_div_table missing and
not reply on core to check. So remove the post_div_table check.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index b48707693ffd..2c6773188761 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1036,11 +1036,6 @@ static unsigned long clk_alpha_pll_postdiv_fabia_recalc_rate(struct clk_hw *hw,
 	u32 i, div = 1, val;
 	int ret;
 
-	if (!pll->post_div_table) {
-		pr_err("Missing the post_div_table for the PLL\n");
-		return -EINVAL;
-	}
-
 	ret = regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &val);
 	if (ret)
 		return ret;
@@ -1063,11 +1058,6 @@ static long clk_alpha_pll_postdiv_fabia_round_rate(struct clk_hw *hw,
 {
 	struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
 
-	if (!pll->post_div_table) {
-		pr_err("Missing the post_div_table for the PLL\n");
-		return -EINVAL;
-	}
-
 	return divider_round_rate(hw, rate, prate, pll->post_div_table,
 				pll->width, CLK_DIVIDER_ROUND_CLOSEST);
 }
@@ -1089,11 +1079,6 @@ static int clk_alpha_pll_postdiv_fabia_set_rate(struct clk_hw *hw,
 	if (val & PLL_VOTE_FSM_ENA)
 		return 0;
 
-	if (!pll->post_div_table) {
-		pr_err("Missing the post_div_table for the PLL\n");
-		return -EINVAL;
-	}
-
 	div = DIV_ROUND_UP_ULL(parent_rate, rate);
 	for (i = 0; i < pll->num_post_div; i++) {
 		if (pll->post_div_table[i].div == div) {
-- 
2.20.1

