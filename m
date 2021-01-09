Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D13F62F0021
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 14:47:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbhAINrS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Jan 2021 08:47:18 -0500
Received: from relay05.th.seeweb.it ([5.144.164.166]:49175 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbhAINrS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Jan 2021 08:47:18 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 8BF653EEBB;
        Sat,  9 Jan 2021 14:46:20 +0100 (CET)
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
Subject: [PATCH 2/9] clk: qcom: gcc-msm8998: Add missing hmss_gpll0_clk_src clock
Date:   Sat,  9 Jan 2021 14:46:10 +0100
Message-Id: <20210109134617.146275-3-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109134617.146275-1-angelogioacchino.delregno@somainline.org>
References: <20210109134617.146275-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To achieve CPR-Hardened functionality this clock must be on: add it
in order to be able to get it managed by the CPR3 driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/clk/qcom/gcc-msm8998.c               | 20 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8998.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index d51c556851ca..c8d4c0348952 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -2160,6 +2160,25 @@ static struct clk_branch gcc_hmss_trig_clk = {
 	},
 };
 
+static struct freq_tbl ftbl_hmss_gpll0_clk_src[] = {
+	F( 300000000, P_GPLL0_OUT_MAIN, 2, 0, 0),
+	F( 600000000, P_GPLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 hmss_gpll0_clk_src = {
+	.cmd_rcgr = 0x4805c,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_hmss_gpll0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "hmss_gpll0_clk_src",
+		.parent_names = gcc_parent_names_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_1),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
 static struct clk_branch gcc_mmss_noc_cfg_ahb_clk = {
 	.halt_reg = 0x9004,
 	.halt_check = BRANCH_HALT,
@@ -2961,6 +2980,7 @@ static struct clk_regmap *gcc_msm8998_clocks[] = {
 	[GCC_MSS_SNOC_AXI_CLK] = &gcc_mss_snoc_axi_clk.clkr,
 	[GCC_MSS_MNOC_BIMC_AXI_CLK] = &gcc_mss_mnoc_bimc_axi_clk.clkr,
 	[GCC_MMSS_GPLL0_CLK] = &gcc_mmss_gpll0_clk.clkr,
+	[HMSS_GPLL0_CLK_SRC] = &hmss_gpll0_clk_src.clkr,
 };
 
 static struct gdsc *gcc_msm8998_gdscs[] = {
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8998.h b/include/dt-bindings/clock/qcom,gcc-msm8998.h
index 47ca17df780b..72c99e486d86 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8998.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8998.h
@@ -185,6 +185,7 @@
 #define GCC_BIMC_GFX_CLK					176
 #define UFS_UNIPRO_CORE_CLK_SRC					177
 #define GCC_MMSS_GPLL0_CLK					178
+#define HMSS_GPLL0_CLK_SRC					179
 
 #define PCIE_0_GDSC						0
 #define UFS_GDSC						1
-- 
2.29.2

