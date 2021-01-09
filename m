Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78CF52F0018
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 14:47:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbhAINrG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Jan 2021 08:47:06 -0500
Received: from relay07.th.seeweb.it ([5.144.164.168]:59953 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725850AbhAINrG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Jan 2021 08:47:06 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id CAB6D3EF25;
        Sat,  9 Jan 2021 14:46:22 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 9/9] clk: qcom: gpucc-msm8998: Allow fabia gpupll0 rate setting
Date:   Sat,  9 Jan 2021 14:46:17 +0100
Message-Id: <20210109134617.146275-10-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109134617.146275-1-angelogioacchino.delregno@somainline.org>
References: <20210109134617.146275-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The GPU PLL0 is not a fixed PLL and the rate can be set on it:
this is necessary especially on boards which bootloader is setting
a very low rate on this PLL before booting Linux, which would be
unsuitable for postdividing to reach the maximum allowed Adreno GPU
frequency of 710MHz (or, actually, even 670MHz..) on this SoC.

To allow setting rates on the GPU PLL0, also define VCO boundaries
and set the CLK_SET_RATE_PARENT flag to the GPU PLL0 postdivider.

With this change, the Adreno GPU is now able to scale through all
the available frequencies.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/clk/qcom/gpucc-msm8998.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-msm8998.c
index 1a518c4915b4..fedfffaf0a8d 100644
--- a/drivers/clk/qcom/gpucc-msm8998.c
+++ b/drivers/clk/qcom/gpucc-msm8998.c
@@ -50,6 +50,11 @@ static struct clk_branch gpucc_cxo_clk = {
 	},
 };
 
+static struct pll_vco fabia_vco[] = {
+	{ 249600000, 2000000000, 0 },
+	{ 125000000, 1000000000, 1 },
+};
+
 static const struct clk_div_table post_div_table_fabia_even[] = {
 	{ 0x0, 1 },
 	{ 0x1, 2 },
@@ -61,11 +66,13 @@ static const struct clk_div_table post_div_table_fabia_even[] = {
 static struct clk_alpha_pll gpupll0 = {
 	.offset = 0x0,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
+	.vco_table = fabia_vco,
+	.num_vco = ARRAY_SIZE(fabia_vco),
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpupll0",
 		.parent_hws = (const struct clk_hw *[]){ &gpucc_cxo_clk.clkr.hw },
 		.num_parents = 1,
-		.ops = &clk_alpha_pll_fixed_fabia_ops,
+		.ops = &clk_alpha_pll_fabia_ops,
 	},
 };
 
@@ -80,6 +87,7 @@ static struct clk_alpha_pll_postdiv gpupll0_out_even = {
 		.name = "gpupll0_out_even",
 		.parent_hws = (const struct clk_hw *[]){ &gpupll0.clkr.hw },
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
 };
-- 
2.29.2

