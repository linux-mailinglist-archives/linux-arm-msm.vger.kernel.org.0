Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0352D41634E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 18:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242439AbhIWQ2s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Sep 2021 12:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242293AbhIWQ2e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Sep 2021 12:28:34 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02783C061756;
        Thu, 23 Sep 2021 09:27:01 -0700 (PDT)
Received: from localhost.localdomain (83.6.166.81.neoplus.adsl.tpnet.pl [83.6.166.81])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id DE0723F604;
        Thu, 23 Sep 2021 18:26:59 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 8/9] clk: qcom: gcc-msm8994: Add proper msm8992 support
Date:   Thu, 23 Sep 2021 18:26:41 +0200
Message-Id: <20210923162645.23257-8-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923162645.23257-1-konrad.dybcio@somainline.org>
References: <20210923162645.23257-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8992 is a cut-down version of MSM8994, featuring
largely the same hardware.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/clk/qcom/gcc-msm8994.c | 71 +++++++++++++++++++++++++++++++++-
 1 file changed, 70 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8994.c b/drivers/clk/qcom/gcc-msm8994.c
index 7545e973fd0d..59aab9507735 100644
--- a/drivers/clk/qcom/gcc-msm8994.c
+++ b/drivers/clk/qcom/gcc-msm8994.c
@@ -8,6 +8,7 @@
 #include <linux/ctype.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
@@ -218,6 +219,17 @@ static struct freq_tbl ftbl_blsp1_qup1_spi_apps_clk_src[] = {
 	{ }
 };
 
+static struct freq_tbl ftbl_blsp1_qup_spi_apps_clk_src_8992[] = {
+	F(960000, P_XO, 10, 1, 2),
+	F(4800000, P_XO, 4, 0, 0),
+	F(9600000, P_XO, 2, 0, 0),
+	F(15000000, P_GPLL0, 10, 1, 4),
+	F(19200000, P_XO, 1, 0, 0),
+	F(25000000, P_GPLL0, 12, 1, 2),
+	F(50000000, P_GPLL0, 12, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
 	.cmd_rcgr = 0x064c,
 	.mnd_width = 8,
@@ -974,6 +986,18 @@ static struct freq_tbl ftbl_sdcc1_apps_clk_src[] = {
 	{ }
 };
 
+static struct freq_tbl ftbl_sdcc1_apps_clk_src_8992[] = {
+	F(144000, P_XO, 16, 3, 25),
+	F(400000, P_XO, 12, 1, 4),
+	F(20000000, P_GPLL0, 15, 1, 2),
+	F(25000000, P_GPLL0, 12, 1, 2),
+	F(50000000, P_GPLL0, 12, 0, 0),
+	F(100000000, P_GPLL0, 6, 0, 0),
+	F(172000000, P_GPLL4, 2, 0, 0),
+	F(344000000, P_GPLL4, 1, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 sdcc1_apps_clk_src = {
 	.cmd_rcgr = 0x04d0,
 	.mnd_width = 8,
@@ -2710,13 +2734,58 @@ static const struct qcom_cc_desc gcc_msm8994_desc = {
 };
 
 static const struct of_device_id gcc_msm8994_match_table[] = {
-	{ .compatible = "qcom,gcc-msm8994" },
+	{ .compatible = "qcom,gcc-msm8992" },
+	{ .compatible = "qcom,gcc-msm8994" }, /* V2 and V2.1 */
 	{}
 };
 MODULE_DEVICE_TABLE(of, gcc_msm8994_match_table);
 
 static int gcc_msm8994_probe(struct platform_device *pdev)
 {
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,gcc-msm8992")) {
+		/* MSM8992 features less clocks and some have different freq tables */
+		gcc_msm8994_desc.clks[UFS_AXI_CLK_SRC] = NULL;
+		gcc_msm8994_desc.clks[GCC_LPASS_Q6_AXI_CLK] = NULL;
+		gcc_msm8994_desc.clks[UFS_PHY_LDO] = NULL;
+		gcc_msm8994_desc.clks[GCC_UFS_AHB_CLK] = NULL;
+		gcc_msm8994_desc.clks[GCC_UFS_AXI_CLK] = NULL;
+		gcc_msm8994_desc.clks[GCC_UFS_RX_CFG_CLK] = NULL;
+		gcc_msm8994_desc.clks[GCC_UFS_RX_SYMBOL_0_CLK] = NULL;
+		gcc_msm8994_desc.clks[GCC_UFS_RX_SYMBOL_1_CLK] = NULL;
+		gcc_msm8994_desc.clks[GCC_UFS_TX_CFG_CLK] = NULL;
+		gcc_msm8994_desc.clks[GCC_UFS_TX_SYMBOL_0_CLK] = NULL;
+		gcc_msm8994_desc.clks[GCC_UFS_TX_SYMBOL_1_CLK] = NULL;
+
+		sdcc1_apps_clk_src.freq_tbl = ftbl_sdcc1_apps_clk_src_8992;
+		blsp1_qup1_i2c_apps_clk_src.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src_8992;
+		blsp1_qup2_i2c_apps_clk_src.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src_8992;
+		blsp1_qup3_i2c_apps_clk_src.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src_8992;
+		blsp1_qup4_i2c_apps_clk_src.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src_8992;
+		blsp1_qup5_i2c_apps_clk_src.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src_8992;
+		blsp1_qup6_i2c_apps_clk_src.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src_8992;
+		blsp2_qup1_i2c_apps_clk_src.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src_8992;
+		blsp2_qup2_i2c_apps_clk_src.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src_8992;
+		blsp2_qup3_i2c_apps_clk_src.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src_8992;
+		blsp2_qup4_i2c_apps_clk_src.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src_8992;
+		blsp2_qup5_i2c_apps_clk_src.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src_8992;
+		blsp2_qup6_i2c_apps_clk_src.freq_tbl = ftbl_blsp1_qup_spi_apps_clk_src_8992;
+
+		/*
+		 * Some 8992 boards might *possibly* use
+		 * PCIe1 clocks and controller, but it's not
+		 * standard and they should be disabled otherwise.
+		 */
+		gcc_msm8994_desc.clks[PCIE_1_AUX_CLK_SRC] = NULL;
+		gcc_msm8994_desc.clks[PCIE_1_PIPE_CLK_SRC] = NULL;
+		gcc_msm8994_desc.clks[PCIE_1_PHY_LDO] = NULL;
+		gcc_msm8994_desc.clks[GCC_PCIE_1_AUX_CLK] = NULL;
+		gcc_msm8994_desc.clks[GCC_PCIE_1_CFG_AHB_CLK] = NULL;
+		gcc_msm8994_desc.clks[GCC_PCIE_1_MSTR_AXI_CLK] = NULL;
+		gcc_msm8994_desc.clks[GCC_PCIE_1_PIPE_CLK] = NULL;
+		gcc_msm8994_desc.clks[GCC_PCIE_1_SLV_AXI_CLK] = NULL;
+		gcc_msm8994_desc.clks[GCC_SYS_NOC_UFS_AXI_CLK] = NULL;
+	}
+
 	return qcom_cc_probe(pdev, &gcc_msm8994_desc);
 }
 
-- 
2.33.0

