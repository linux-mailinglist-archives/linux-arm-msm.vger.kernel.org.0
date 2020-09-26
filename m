Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 896A527996C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 15:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729361AbgIZNCh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 09:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729232AbgIZNCd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 09:02:33 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62AD5C0613D3;
        Sat, 26 Sep 2020 06:02:33 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id c18so6841691wrm.9;
        Sat, 26 Sep 2020 06:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RF6uKvZavvowj2I1gkFOG5Tu0nXrkkBteA0YR3Nz268=;
        b=YZfC69KrbcZm5/QL52L0Ry7qCg/f1gozcxMbjkerepOGelt/DbyXIYZmeqtRDmqyFm
         H3VYTLr2sMMJKCtL/LIHc9f/VHjpl6OhU4JBGwQNkyPL2kVzDrXPh9xTAL6q3exYxcNx
         n5ngauYqiSmg9L68cxTn5Wj0Sf8fwx66nCoXl4oU9nDrjzMNYbzGyfxynu2mXdUCpxsX
         sQOV1DoNOsO6umkUMaLUOPXE/A2rQjbZ41PVMnD0VC6j5K4LAw/umUoB5sfMsQWzKfAf
         lzRCkCeUbn3WmPFmTgOoNwOjaI0RNyg9kHMgFvdO955WAUmQ7didfQCIDfdNgDefMzy5
         JT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RF6uKvZavvowj2I1gkFOG5Tu0nXrkkBteA0YR3Nz268=;
        b=gQIVmx4QsYcrNPQOtc8+Hj27JOuL+uQqXjSNILSiz//p2Jef7bVQefnJb7cbCNL9ce
         NY+DMQYqQGmBGQwQbUwlNcqgruAO1AWiQHqeDu/24EXSTQMbRfl7YVVImTJhwcgKOakd
         dHtOk2FWO5oEKE/JkaCl9vC7h9SFOobaeGZ+zWlrk9A5YMnEJj5NCa4899Cp6YsJYHgz
         MpLu08QLAyleRV+XmqApvbg2cbYiSDKDovIeaQeLC1C0zQP4qwdnGLeVRMxs1mKGD24T
         bNJY2ItP6ffqXJ2JCfAFrvQQTKZ1/cuGeRvmF91ri6TuHDg45QOzazk1kv4LbQT8ssYa
         Dn1g==
X-Gm-Message-State: AOAM531dNYQC+NF2VVTeM/MrcXW21PYIklqo19jrqGHkjHcO8itCh9+1
        tpH7MzyFXjpqFacEnHNLV+4G+Zr5UXp63g==
X-Google-Smtp-Source: ABdhPJxt6zY9xjcjqXL2SLBaMcygEzD+IzSi7RHqHv/8cTHvpCeBgb9Dx6ctpnWAFOAs83dGSCGGVg==
X-Received: by 2002:a5d:6301:: with SMTP id i1mr9043555wru.323.1601125351919;
        Sat, 26 Sep 2020 06:02:31 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id f14sm7137738wrt.53.2020.09.26.06.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:02:31 -0700 (PDT)
From:   kholk11@gmail.com
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, sboyd@kernel.org, kholk11@gmail.com,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] clk: qcom: rcg2: Stop hardcoding gfx3d pingpong parent numbers
Date:   Sat, 26 Sep 2020 15:02:24 +0200
Message-Id: <20200926130225.13733-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926130225.13733-1-kholk11@gmail.com>
References: <20200926130225.13733-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

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

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
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
index 357159fe85b5..cebdacc188aa 100644
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
2.28.0

