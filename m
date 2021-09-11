Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2D7C407673
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Sep 2021 14:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235488AbhIKMPQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Sep 2021 08:15:16 -0400
Received: from relay05.th.seeweb.it ([5.144.164.166]:43387 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235768AbhIKMPN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Sep 2021 08:15:13 -0400
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B478F3F401;
        Sat, 11 Sep 2021 14:13:58 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] clk: qcom: gpucc-msm8998: Use ARRAY_SIZE for num_parents
Date:   Sat, 11 Sep 2021 14:13:36 +0200
Message-Id: <20210911121340.261920-5-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911121340.261920-1-marijn.suijten@somainline.org>
References: <20210911121340.261920-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Where possible, use ARRAY_SIZE to determine the number of parents in
clk_parent_data, instead of hardcoding it.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/clk/qcom/gpucc-msm8998.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-msm8998.c
index fedfffaf0a8d..3ac6fbfbd414 100644
--- a/drivers/clk/qcom/gpucc-msm8998.c
+++ b/drivers/clk/qcom/gpucc-msm8998.c
@@ -126,7 +126,7 @@ static struct clk_rcg2 rbcpr_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "rbcpr_clk_src",
 		.parent_data = gpu_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gpu_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -144,7 +144,7 @@ static struct clk_rcg2 gfx3d_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gfx3d_clk_src",
 		.parent_data = gpu_xo_gpupll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gpu_xo_gpupll0),
 		.ops = &clk_rcg2_ops,
 		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 	},
@@ -163,7 +163,7 @@ static struct clk_rcg2 rbbmtimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "rbbmtimer_clk_src",
 		.parent_data = gpu_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gpu_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -184,7 +184,7 @@ static struct clk_rcg2 gfx3d_isense_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gfx3d_isense_clk_src",
 		.parent_data = gpu_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gpu_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
-- 
2.33.0

