Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0AB92F526B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 19:39:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728607AbhAMSj3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 13:39:29 -0500
Received: from m-r1.th.seeweb.it ([5.144.164.170]:44633 "EHLO
        m-r1.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728373AbhAMSjT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 13:39:19 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id CF7992005E;
        Wed, 13 Jan 2021 19:38:20 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v2 5/9] clk: qcom: rcg2: Stop hardcoding gfx3d pingpong parent numbers
Date:   Wed, 13 Jan 2021 19:38:13 +0100
Message-Id: <20210113183817.447866-6-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org>
References: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The function clk_gfx3d_determine_rate is selecting different PLLs
to manage the GFX3D clock source in a special way: this one needs
to be ping-pong'ed on different PLLs to ensure stability during
frequency switching (set a PLL rate, let it stabilize, switch the
RCG to the new PLL) and fast frequency transitions.

This technique is currently being used in the MSM8996 SoC and the
function was assuming that the parents were always at a specific
index in the parents list, which is TRUE, if we use this only on
the MSM8996 MMCC.
Unfortunately, MSM8996 is not the only SoC that needs to ping-pong
the graphics RCG, so choices are:
1. Make new special ops just to hardcode *again* other indexes,
   creating code duplication for (imo) no reason; or
2. Generalize this function, so that it becomes usable for a range
   of SoCs with slightly different ping-pong configuration.

In this commit, the second road was taken: define a new "special"
struct clk_rcg2_gfx3d, containing the ordered list of parents to
ping-pong the graphics clock on, and the "regular" rcg2 clock
structure in order to generalize the clk_gfx3d_determine_rate
function and make it working for other SoCs.

As for the function itself it is left with the assumption that we
need to ping-pong over three parents. The reasons for this are:
1. The initial model was MSM8996, which has 3 parents for the
   graphics clock pingpong;
2. The other example that was taken into consideration is the
   SDM630/636/660 SoC gpu clock controller, which is ping-ponging
   over two dynamic clocked and one fixed clock PLL.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/clk/qcom/clk-rcg.h  |  9 ++++++
 drivers/clk/qcom/clk-rcg2.c | 56 ++++++++++++++++++++++++-------------
 2 files changed, 45 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index 86d2b8b90173..99efcc7f8d88 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -153,6 +153,15 @@ struct clk_rcg2 {
 
 #define to_clk_rcg2(_hw) container_of(to_clk_regmap(_hw), struct clk_rcg2, clkr)
 
+struct clk_rcg2_gfx3d {
+	u8 div;
+	struct clk_rcg2 rcg;
+	struct clk_hw **hws;
+};
+
+#define to_clk_rcg2_gfx3d(_hw) \
+	container_of(to_clk_rcg2(_hw), struct clk_rcg2_gfx3d, rcg)
+
 extern const struct clk_ops clk_rcg2_ops;
 extern const struct clk_ops clk_rcg2_floor_ops;
 extern const struct clk_ops clk_edp_pixel_ops;
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 59a5a0f261f3..9a4604237de4 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -728,40 +728,49 @@ static int clk_gfx3d_determine_rate(struct clk_hw *hw,
 				    struct clk_rate_request *req)
 {
 	struct clk_rate_request parent_req = { };
-	struct clk_hw *p2, *p8, *p9, *xo;
-	unsigned long p9_rate;
+	struct clk_rcg2_gfx3d *cgfx = to_clk_rcg2_gfx3d(hw);
+	struct clk_hw *xo;
+	unsigned long request, p0_rate;
 	int ret;
 
+	/*
+	 * This function does ping-pong the RCG between PLLs: if we don't
+	 * have at least one fixed PLL and two variable ones,
+	 * then it's not going to work correctly.
+	 */
+	if (unlikely(cgfx->hws[0] == NULL || cgfx->hws[1] == NULL ||
+	    cgfx->hws[2] == NULL))
+		return -EINVAL;
+
 	xo = clk_hw_get_parent_by_index(hw, 0);
 	if (req->rate == clk_hw_get_rate(xo)) {
 		req->best_parent_hw = xo;
 		return 0;
 	}
 
-	p9 = clk_hw_get_parent_by_index(hw, 2);
-	p2 = clk_hw_get_parent_by_index(hw, 3);
-	p8 = clk_hw_get_parent_by_index(hw, 4);
+	request = req->rate;
+	if (cgfx->div > 1)
+		parent_req.rate = request = request * cgfx->div;
 
-	/* PLL9 is a fixed rate PLL */
-	p9_rate = clk_hw_get_rate(p9);
+	/* This has to be a fixed rate PLL */
+	p0_rate = clk_hw_get_rate(cgfx->hws[0]);
 
-	parent_req.rate = req->rate = min(req->rate, p9_rate);
-	if (req->rate == p9_rate) {
-		req->rate = req->best_parent_rate = p9_rate;
-		req->best_parent_hw = p9;
+	if (request == p0_rate) {
+		req->rate = req->best_parent_rate = p0_rate;
+		req->best_parent_hw = cgfx->hws[0];
 		return 0;
 	}
 
-	if (req->best_parent_hw == p9) {
+	if (req->best_parent_hw == cgfx->hws[0]) {
 		/* Are we going back to a previously used rate? */
-		if (clk_hw_get_rate(p8) == req->rate)
-			req->best_parent_hw = p8;
+		if (clk_hw_get_rate(cgfx->hws[2]) == request)
+			req->best_parent_hw = cgfx->hws[2];
 		else
-			req->best_parent_hw = p2;
-	} else if (req->best_parent_hw == p8) {
-		req->best_parent_hw = p2;
+			req->best_parent_hw = cgfx->hws[1];
+	} else if (req->best_parent_hw == cgfx->hws[2]) {
+		req->best_parent_hw = cgfx->hws[1];
 	} else {
-		req->best_parent_hw = p8;
+		req->best_parent_hw = cgfx->hws[2];
 	}
 
 	ret = __clk_determine_rate(req->best_parent_hw, &parent_req);
@@ -770,18 +779,25 @@ static int clk_gfx3d_determine_rate(struct clk_hw *hw,
 
 	req->rate = req->best_parent_rate = parent_req.rate;
 
+	if (cgfx->div > 1)
+		do_div(req->rate, cgfx->div);
+
 	return 0;
 }
 
 static int clk_gfx3d_set_rate_and_parent(struct clk_hw *hw, unsigned long rate,
 		unsigned long parent_rate, u8 index)
 {
-	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	struct clk_rcg2_gfx3d *cgfx = to_clk_rcg2_gfx3d(hw);
+	struct clk_rcg2 *rcg = &cgfx->rcg;
 	u32 cfg;
 	int ret;
 
-	/* Just mux it, we don't use the division or m/n hardware */
 	cfg = rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
+	/* On some targets, the GFX3D RCG may need to divide PLL frequency */
+	if (cgfx->div > 1)
+		cfg |= ((2 * cgfx->div) - 1) << CFG_SRC_DIV_SHIFT;
+
 	ret = regmap_write(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, cfg);
 	if (ret)
 		return ret;
-- 
2.29.2

