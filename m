Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 821B332B2FC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Mar 2021 04:49:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242760AbhCCBQl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Mar 2021 20:16:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233643AbhCBXyn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Mar 2021 18:54:43 -0500
X-Greylist: delayed 530 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 02 Mar 2021 15:53:39 PST
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E397C06178C
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Mar 2021 15:53:39 -0800 (PST)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id F157E3ED8B;
        Wed,  3 Mar 2021 00:42:36 +0100 (CET)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        angelogioacchino.delregno@somainline.org,
        konrad.dybcio@somainline.org, martin.botka@somainline.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: rcg2: Rectify clk_gfx3d rate rounding without mux division
Date:   Wed,  3 Mar 2021 00:41:06 +0100
Message-Id: <20210302234106.3418665-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In case the mux is not divided parent_req was mistakenly not assigned to
leading __clk_determine_rate to determine the best frequency setting for
a requested rate of 0, resulting in the msm8996 platform not booting.
Rectify this by refactoring the logic to unconditionally assign to
parent_req.rate with the clock rate the caller is expecting.

Fixes: 7cbb78a99db6 ("clk: qcom: rcg2: Stop hardcoding gfx3d pingpong parent numbers")
Reported-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Tested-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/clk/qcom/clk-rcg2.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 42f13a2d1cc1..05ff3b0d233e 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -730,7 +730,8 @@ static int clk_gfx3d_determine_rate(struct clk_hw *hw,
 	struct clk_rate_request parent_req = { };
 	struct clk_rcg2_gfx3d *cgfx = to_clk_rcg2_gfx3d(hw);
 	struct clk_hw *xo, *p0, *p1, *p2;
-	unsigned long request, p0_rate;
+	unsigned long p0_rate;
+	u8 mux_div = cgfx->div;
 	int ret;
 
 	p0 = cgfx->hws[0];
@@ -750,14 +751,15 @@ static int clk_gfx3d_determine_rate(struct clk_hw *hw,
 		return 0;
 	}
 
-	request = req->rate;
-	if (cgfx->div > 1)
-		parent_req.rate = request = request * cgfx->div;
+	if (mux_div == 0)
+		mux_div = 1;
+
+	parent_req.rate = req->rate * mux_div;
 
 	/* This has to be a fixed rate PLL */
 	p0_rate = clk_hw_get_rate(p0);
 
-	if (request == p0_rate) {
+	if (parent_req.rate == p0_rate) {
 		req->rate = req->best_parent_rate = p0_rate;
 		req->best_parent_hw = p0;
 		return 0;
@@ -765,7 +767,7 @@ static int clk_gfx3d_determine_rate(struct clk_hw *hw,
 
 	if (req->best_parent_hw == p0) {
 		/* Are we going back to a previously used rate? */
-		if (clk_hw_get_rate(p2) == request)
+		if (clk_hw_get_rate(p2) == parent_req.rate)
 			req->best_parent_hw = p2;
 		else
 			req->best_parent_hw = p1;
@@ -780,8 +782,7 @@ static int clk_gfx3d_determine_rate(struct clk_hw *hw,
 		return ret;
 
 	req->rate = req->best_parent_rate = parent_req.rate;
-	if (cgfx->div > 1)
-		req->rate /= cgfx->div;
+	req->rate /= mux_div;
 
 	return 0;
 }
-- 
2.30.1

