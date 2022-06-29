Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C503560CBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 00:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231292AbiF2Wyn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jun 2022 18:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231293AbiF2WyM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jun 2022 18:54:12 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA9D9396AA;
        Wed, 29 Jun 2022 15:53:55 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 4DD373F7DC;
        Thu, 30 Jun 2022 00:53:53 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Jonathan Marek <jonathan@marek.ca>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 10/11] drm/msm/dsi_phy_10nm: Replace parent names with clk_hw pointers
Date:   Thu, 30 Jun 2022 00:53:30 +0200
Message-Id: <20220629225331.357308-11-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220629225331.357308-1-marijn.suijten@somainline.org>
References: <20220629225331.357308-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

parent_hw pointers are easier to manage and cheaper to use than
repeatedly formatting the parent name and subsequently leaving the clk
framework to perform lookups based on that name.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 79 ++++++++++------------
 1 file changed, 36 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 8bd7b97b1b9b..ae57f95edf63 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -574,24 +574,24 @@ static int dsi_10nm_set_usecase(struct msm_dsi_phy *phy)
  */
 static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **provided_clocks)
 {
-	char clk_name[32], parent[32], vco_name[32];
-	char parent2[32], parent3[32], parent4[32];
+	char clk_name[32];
 	struct clk_init_data vco_init = {
 		.parent_data = &(const struct clk_parent_data) {
 			.fw_name = "ref",
 		},
 		.num_parents = 1,
-		.name = vco_name,
+		.name = clk_name,
 		.flags = CLK_IGNORE_UNUSED,
 		.ops = &clk_ops_dsi_pll_10nm_vco,
 	};
 	struct device *dev = &pll_10nm->phy->pdev->dev;
-	struct clk_hw *hw;
+	struct clk_hw *hw, *pll_out_div, *pll_bit, *pll_by_2_bit;
+	struct clk_hw *pll_post_out_div, *pclk_mux;
 	int ret;
 
 	DBG("DSI%d", pll_10nm->phy->id);
 
-	snprintf(vco_name, sizeof(vco_name), "dsi%dvco_clk", pll_10nm->phy->id);
+	snprintf(clk_name, sizeof(clk_name), "dsi%dvco_clk", pll_10nm->phy->id);
 	pll_10nm->clk_hw.init = &vco_init;
 
 	ret = devm_clk_hw_register(dev, &pll_10nm->clk_hw);
@@ -599,36 +599,34 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 		return ret;
 
 	snprintf(clk_name, sizeof(clk_name), "dsi%d_pll_out_div_clk", pll_10nm->phy->id);
-	snprintf(parent, sizeof(parent), "dsi%dvco_clk", pll_10nm->phy->id);
 
-	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
-			CLK_SET_RATE_PARENT, pll_10nm->phy->pll_base +
+	pll_out_div = devm_clk_hw_register_divider_parent_hw(dev, clk_name,
+			&pll_10nm->clk_hw, CLK_SET_RATE_PARENT,
+			pll_10nm->phy->pll_base +
 				REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE,
 			0, 2, CLK_DIVIDER_POWER_OF_TWO, NULL);
-	if (IS_ERR(hw)) {
-		ret = PTR_ERR(hw);
+	if (IS_ERR(pll_out_div)) {
+		ret = PTR_ERR(pll_out_div);
 		goto fail;
 	}
 
 	snprintf(clk_name, sizeof(clk_name), "dsi%d_pll_bit_clk", pll_10nm->phy->id);
-	snprintf(parent, sizeof(parent), "dsi%d_pll_out_div_clk", pll_10nm->phy->id);
 
 	/* BIT CLK: DIV_CTRL_3_0 */
-	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
-			CLK_SET_RATE_PARENT,
+	pll_bit = devm_clk_hw_register_divider_parent_hw(dev, clk_name,
+			pll_out_div, CLK_SET_RATE_PARENT,
 			pll_10nm->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG0,
 			0, 4, CLK_DIVIDER_ONE_BASED, &pll_10nm->postdiv_lock);
-	if (IS_ERR(hw)) {
-		ret = PTR_ERR(hw);
+	if (IS_ERR(pll_bit)) {
+		ret = PTR_ERR(pll_bit);
 		goto fail;
 	}
 
 	snprintf(clk_name, sizeof(clk_name), "dsi%d_phy_pll_out_byteclk", pll_10nm->phy->id);
-	snprintf(parent, sizeof(parent), "dsi%d_pll_bit_clk", pll_10nm->phy->id);
 
 	/* DSI Byte clock = VCO_CLK / OUT_DIV / BIT_DIV / 8 */
-	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
-					       CLK_SET_RATE_PARENT, 1, 8);
+	hw = devm_clk_hw_register_fixed_factor_parent_hw(dev, clk_name,
+			pll_bit, CLK_SET_RATE_PARENT, 1, 8);
 	if (IS_ERR(hw)) {
 		ret = PTR_ERR(hw);
 		goto fail;
@@ -637,48 +635,43 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 	provided_clocks[DSI_BYTE_PLL_CLK] = hw;
 
 	snprintf(clk_name, sizeof(clk_name), "dsi%d_pll_by_2_bit_clk", pll_10nm->phy->id);
-	snprintf(parent, sizeof(parent), "dsi%d_pll_bit_clk", pll_10nm->phy->id);
 
-	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
-					       0, 1, 2);
-	if (IS_ERR(hw)) {
-		ret = PTR_ERR(hw);
+	pll_by_2_bit = devm_clk_hw_register_fixed_factor_parent_hw(dev,
+			clk_name, pll_bit, 0, 1, 2);
+	if (IS_ERR(pll_by_2_bit)) {
+		ret = PTR_ERR(pll_by_2_bit);
 		goto fail;
 	}
 
 	snprintf(clk_name, sizeof(clk_name), "dsi%d_pll_post_out_div_clk", pll_10nm->phy->id);
-	snprintf(parent, sizeof(parent), "dsi%d_pll_out_div_clk", pll_10nm->phy->id);
 
-	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
-					       0, 1, 4);
-	if (IS_ERR(hw)) {
-		ret = PTR_ERR(hw);
+	pll_post_out_div = devm_clk_hw_register_fixed_factor_parent_hw(dev,
+			clk_name, pll_out_div, 0, 1, 4);
+	if (IS_ERR(pll_post_out_div)) {
+		ret = PTR_ERR(pll_post_out_div);
 		goto fail;
 	}
 
 	snprintf(clk_name, sizeof(clk_name), "dsi%d_pclk_mux", pll_10nm->phy->id);
-	snprintf(parent, sizeof(parent), "dsi%d_pll_bit_clk", pll_10nm->phy->id);
-	snprintf(parent2, sizeof(parent2), "dsi%d_pll_by_2_bit_clk", pll_10nm->phy->id);
-	snprintf(parent3, sizeof(parent3), "dsi%d_pll_out_div_clk", pll_10nm->phy->id);
-	snprintf(parent4, sizeof(parent4), "dsi%d_pll_post_out_div_clk", pll_10nm->phy->id);
-
-	hw = devm_clk_hw_register_mux(dev, clk_name,
-			((const char *[]){
-				parent, parent2, parent3, parent4,
+
+	pclk_mux = devm_clk_hw_register_mux_parent_hws(dev, clk_name,
+			((const struct clk_hw *[]){
+				pll_bit,
+				pll_by_2_bit,
+				pll_out_div,
+				pll_post_out_div,
 			}), 4, 0, pll_10nm->phy->base +
-				REG_DSI_10nm_PHY_CMN_CLK_CFG1,
-			0, 2, 0, NULL);
-	if (IS_ERR(hw)) {
-		ret = PTR_ERR(hw);
+				REG_DSI_10nm_PHY_CMN_CLK_CFG1, 0, 2, 0, NULL);
+	if (IS_ERR(pclk_mux)) {
+		ret = PTR_ERR(pclk_mux);
 		goto fail;
 	}
 
 	snprintf(clk_name, sizeof(clk_name), "dsi%d_phy_pll_out_dsiclk", pll_10nm->phy->id);
-	snprintf(parent, sizeof(parent), "dsi%d_pclk_mux", pll_10nm->phy->id);
 
 	/* PIX CLK DIV : DIV_CTRL_7_4*/
-	hw = devm_clk_hw_register_divider(dev, clk_name, parent, 0,
-			pll_10nm->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG0,
+	hw = devm_clk_hw_register_divider_parent_hw(dev, clk_name, pclk_mux,
+			0, pll_10nm->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG0,
 			4, 4, CLK_DIVIDER_ONE_BASED, &pll_10nm->postdiv_lock);
 	if (IS_ERR(hw)) {
 		ret = PTR_ERR(hw);
-- 
2.37.0

