Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 242CB2F5259
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 19:39:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728426AbhAMSjE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 13:39:04 -0500
Received: from relay03.th.seeweb.it ([5.144.164.164]:41667 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728362AbhAMSjD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 13:39:03 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 25DDF2006F;
        Wed, 13 Jan 2021 19:38:21 +0100 (CET)
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
Subject: [PATCH v2 6/9] clk: qcom: mmcc-msm8996: Migrate gfx3d clock to clk_rcg2_gfx3d
Date:   Wed, 13 Jan 2021 19:38:14 +0100
Message-Id: <20210113183817.447866-7-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org>
References: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In commit 734bdefdb043 ("clk: qcom: rcg2: Stop hardcoding gfx3d
pingpong parent numbers") the gfx3d ping-pong ops (clk_gfx3d_ops)
were generalized in order to be able to reuse the same ops for
more than just one clock for one SoC: follow the change here in
the MSM8996 MMCC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/clk/qcom/mmcc-msm8996.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index 3b3aac07fb2d..24843e4f2599 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -528,16 +528,23 @@ static struct clk_rcg2 maxi_clk_src = {
 	},
 };
 
-static struct clk_rcg2 gfx3d_clk_src = {
-	.cmd_rcgr = 0x4000,
-	.hid_width = 5,
-	.parent_map = mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_map,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gfx3d_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0,
-		.num_parents = 6,
-		.ops = &clk_gfx3d_ops,
-		.flags = CLK_SET_RATE_PARENT,
+static struct clk_rcg2_gfx3d gfx3d_clk_src = {
+	.rcg = {
+		.cmd_rcgr = 0x4000,
+		.hid_width = 5,
+		.parent_map = mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_map,
+		.clkr.hw.init = &(struct clk_init_data){
+			.name = "gfx3d_clk_src",
+			.parent_names = mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0,
+			.num_parents = 6,
+			.ops = &clk_gfx3d_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+	.hws = (struct clk_hw*[]) {
+		&mmpll9.clkr.hw,
+		&mmpll2.clkr.hw,
+		&mmpll8.clkr.hw
 	},
 };
 
@@ -3089,7 +3096,7 @@ static struct clk_regmap *mmcc_msm8996_clocks[] = {
 	[AHB_CLK_SRC] = &ahb_clk_src.clkr,
 	[AXI_CLK_SRC] = &axi_clk_src.clkr,
 	[MAXI_CLK_SRC] = &maxi_clk_src.clkr,
-	[GFX3D_CLK_SRC] = &gfx3d_clk_src.clkr,
+	[GFX3D_CLK_SRC] = &gfx3d_clk_src.rcg.clkr,
 	[RBBMTIMER_CLK_SRC] = &rbbmtimer_clk_src.clkr,
 	[ISENSE_CLK_SRC] = &isense_clk_src.clkr,
 	[RBCPR_CLK_SRC] = &rbcpr_clk_src.clkr,
-- 
2.29.2

