Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1344938F5E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 00:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbhEXW4h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 May 2021 18:56:37 -0400
Received: from relay07.th.seeweb.it ([5.144.164.168]:48311 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbhEXW4g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 May 2021 18:56:36 -0400
Received: from localhost.localdomain (83.6.165.117.neoplus.adsl.tpnet.pl [83.6.165.117])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 9AEA73ED51;
        Tue, 25 May 2021 00:55:05 +0200 (CEST)
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
Subject: [PATCH 2/2] clk: qcom: smd-rpm: De-duplicate identical entries
Date:   Tue, 25 May 2021 00:54:56 +0200
Message-Id: <20210524225456.398817-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524225456.398817-1-konrad.dybcio@somainline.org>
References: <20210524225456.398817-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It makes negative sense to keep repeating the same definitions
over and over and over and over again, just with changed names..

De-duplicate to make for a drastically smaller file size.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 652 +++++++++++++--------------------
 1 file changed, 247 insertions(+), 405 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 9204aae1867e..295fc08eddb9 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -418,7 +418,6 @@ static const struct clk_ops clk_smd_rpm_branch_ops = {
 	.unprepare	= clk_smd_rpm_unprepare,
 };
 
-/* msm8916 */
 DEFINE_CLK_SMD_RPM(msm8916, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
 DEFINE_CLK_SMD_RPM(msm8916, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
 DEFINE_CLK_SMD_RPM(msm8916, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
@@ -464,48 +463,35 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8916 = {
 	.num_clks = ARRAY_SIZE(msm8916_clks),
 };
 
-/* msm8936 */
-DEFINE_CLK_SMD_RPM(msm8936, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
-DEFINE_CLK_SMD_RPM(msm8936, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
-DEFINE_CLK_SMD_RPM(msm8936, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
 DEFINE_CLK_SMD_RPM(msm8936, sysmmnoc_clk, sysmmnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
-DEFINE_CLK_SMD_RPM_QDSS(msm8936, qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_CLK, 1);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8936, bb_clk1, bb_clk1_a, 1);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8936, bb_clk2, bb_clk2_a, 2);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8936, rf_clk1, rf_clk1_a, 4);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8936, rf_clk2, rf_clk2_a, 5);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8936, bb_clk1_pin, bb_clk1_a_pin, 1);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8936, bb_clk2_pin, bb_clk2_a_pin, 2);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8936, rf_clk1_pin, rf_clk1_a_pin, 4);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8936, rf_clk2_pin, rf_clk2_a_pin, 5);
 
 static struct clk_smd_rpm *msm8936_clks[] = {
-	[RPM_SMD_PCNOC_CLK]		= &msm8936_pcnoc_clk,
-	[RPM_SMD_PCNOC_A_CLK]		= &msm8936_pcnoc_a_clk,
-	[RPM_SMD_SNOC_CLK]		= &msm8936_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK]		= &msm8936_snoc_a_clk,
-	[RPM_SMD_BIMC_CLK]		= &msm8936_bimc_clk,
-	[RPM_SMD_BIMC_A_CLK]		= &msm8936_bimc_a_clk,
+	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_pcnoc_clk,
+	[RPM_SMD_SNOC_CLK]		= &msm8916_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK]		= &msm8916_snoc_a_clk,
+	[RPM_SMD_BIMC_CLK]		= &msm8916_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK]		= &msm8916_bimc_a_clk,
 	[RPM_SMD_SYSMMNOC_CLK]		= &msm8936_sysmmnoc_clk,
 	[RPM_SMD_SYSMMNOC_A_CLK]	= &msm8936_sysmmnoc_a_clk,
-	[RPM_SMD_QDSS_CLK]		= &msm8936_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK]		= &msm8936_qdss_a_clk,
-	[RPM_SMD_BB_CLK1]		= &msm8936_bb_clk1,
-	[RPM_SMD_BB_CLK1_A]		= &msm8936_bb_clk1_a,
-	[RPM_SMD_BB_CLK2]		= &msm8936_bb_clk2,
-	[RPM_SMD_BB_CLK2_A]		= &msm8936_bb_clk2_a,
-	[RPM_SMD_RF_CLK1]		= &msm8936_rf_clk1,
-	[RPM_SMD_RF_CLK1_A]		= &msm8936_rf_clk1_a,
-	[RPM_SMD_RF_CLK2]		= &msm8936_rf_clk2,
-	[RPM_SMD_RF_CLK2_A]		= &msm8936_rf_clk2_a,
-	[RPM_SMD_BB_CLK1_PIN]		= &msm8936_bb_clk1_pin,
-	[RPM_SMD_BB_CLK1_A_PIN]		= &msm8936_bb_clk1_a_pin,
-	[RPM_SMD_BB_CLK2_PIN]		= &msm8936_bb_clk2_pin,
-	[RPM_SMD_BB_CLK2_A_PIN]		= &msm8936_bb_clk2_a_pin,
-	[RPM_SMD_RF_CLK1_PIN]		= &msm8936_rf_clk1_pin,
-	[RPM_SMD_RF_CLK1_A_PIN]		= &msm8936_rf_clk1_a_pin,
-	[RPM_SMD_RF_CLK2_PIN]		= &msm8936_rf_clk2_pin,
-	[RPM_SMD_RF_CLK2_A_PIN]		= &msm8936_rf_clk2_a_pin,
+	[RPM_SMD_QDSS_CLK]		= &msm8916_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK]		= &msm8916_qdss_a_clk,
+	[RPM_SMD_BB_CLK1]		= &msm8916_bb_clk1,
+	[RPM_SMD_BB_CLK1_A]		= &msm8916_bb_clk1_a,
+	[RPM_SMD_BB_CLK2]		= &msm8916_bb_clk2,
+	[RPM_SMD_BB_CLK2_A]		= &msm8916_bb_clk2_a,
+	[RPM_SMD_RF_CLK1]		= &msm8916_rf_clk1,
+	[RPM_SMD_RF_CLK1_A]		= &msm8916_rf_clk1_a,
+	[RPM_SMD_RF_CLK2]		= &msm8916_rf_clk2,
+	[RPM_SMD_RF_CLK2_A]		= &msm8916_rf_clk2_a,
+	[RPM_SMD_BB_CLK1_PIN]		= &msm8916_bb_clk1_pin,
+	[RPM_SMD_BB_CLK1_A_PIN]		= &msm8916_bb_clk1_a_pin,
+	[RPM_SMD_BB_CLK2_PIN]		= &msm8916_bb_clk2_pin,
+	[RPM_SMD_BB_CLK2_A_PIN]		= &msm8916_bb_clk2_a_pin,
+	[RPM_SMD_RF_CLK1_PIN]		= &msm8916_rf_clk1_pin,
+	[RPM_SMD_RF_CLK1_A_PIN]		= &msm8916_rf_clk1_a_pin,
+	[RPM_SMD_RF_CLK2_PIN]		= &msm8916_rf_clk2_pin,
+	[RPM_SMD_RF_CLK2_A_PIN]		= &msm8916_rf_clk2_a_pin,
 };
 
 static const struct rpm_smd_clk_desc rpm_clk_msm8936 = {
@@ -513,15 +499,10 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8936 = {
 		.num_clks = ARRAY_SIZE(msm8936_clks),
 };
 
-/* msm8974 */
-DEFINE_CLK_SMD_RPM(msm8974, pnoc_clk, pnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
-DEFINE_CLK_SMD_RPM(msm8974, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
 DEFINE_CLK_SMD_RPM(msm8974, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
 DEFINE_CLK_SMD_RPM(msm8974, mmssnoc_ahb_clk, mmssnoc_ahb_a_clk, QCOM_SMD_RPM_BUS_CLK, 3);
-DEFINE_CLK_SMD_RPM(msm8974, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
 DEFINE_CLK_SMD_RPM(msm8974, gfx3d_clk_src, gfx3d_a_clk_src, QCOM_SMD_RPM_MEM_CLK, 1);
 DEFINE_CLK_SMD_RPM(msm8974, ocmemgx_clk, ocmemgx_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
-DEFINE_CLK_SMD_RPM_QDSS(msm8974, qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_CLK, 1);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, cxo_d0, cxo_d0_a, 1);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, cxo_d1, cxo_d1_a, 2);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, cxo_a0, cxo_a0_a, 4);
@@ -537,22 +518,22 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a1_pin, cxo_a1_a_pin, 5);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a2_pin, cxo_a2_a_pin, 6);
 
 static struct clk_smd_rpm *msm8974_clks[] = {
-	[RPM_SMD_PNOC_CLK]		= &msm8974_pnoc_clk,
-	[RPM_SMD_PNOC_A_CLK]		= &msm8974_pnoc_a_clk,
-	[RPM_SMD_SNOC_CLK]		= &msm8974_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK]		= &msm8974_snoc_a_clk,
+	[RPM_SMD_PNOC_CLK]		= &msm8916_pcnoc_a_clk,
+	[RPM_SMD_PNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK]		= &msm8916_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK]		= &msm8916_snoc_a_clk,
 	[RPM_SMD_CNOC_CLK]		= &msm8974_cnoc_clk,
 	[RPM_SMD_CNOC_A_CLK]		= &msm8974_cnoc_a_clk,
 	[RPM_SMD_MMSSNOC_AHB_CLK]	= &msm8974_mmssnoc_ahb_clk,
 	[RPM_SMD_MMSSNOC_AHB_A_CLK]	= &msm8974_mmssnoc_ahb_a_clk,
-	[RPM_SMD_BIMC_CLK]		= &msm8974_bimc_clk,
+	[RPM_SMD_BIMC_CLK]		= &msm8916_bimc_clk,
 	[RPM_SMD_GFX3D_CLK_SRC]		= &msm8974_gfx3d_clk_src,
 	[RPM_SMD_GFX3D_A_CLK_SRC]	= &msm8974_gfx3d_a_clk_src,
-	[RPM_SMD_BIMC_A_CLK]		= &msm8974_bimc_a_clk,
+	[RPM_SMD_BIMC_A_CLK]		= &msm8916_bimc_a_clk,
 	[RPM_SMD_OCMEMGX_CLK]		= &msm8974_ocmemgx_clk,
 	[RPM_SMD_OCMEMGX_A_CLK]		= &msm8974_ocmemgx_a_clk,
-	[RPM_SMD_QDSS_CLK]		= &msm8974_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK]		= &msm8974_qdss_a_clk,
+	[RPM_SMD_QDSS_CLK]		= &msm8916_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK]		= &msm8916_qdss_a_clk,
 	[RPM_SMD_CXO_D0]		= &msm8974_cxo_d0,
 	[RPM_SMD_CXO_D0_A]		= &msm8974_cxo_d0_a,
 	[RPM_SMD_CXO_D1]		= &msm8974_cxo_d1,
@@ -586,46 +567,33 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8974 = {
 	.num_clks = ARRAY_SIZE(msm8974_clks),
 };
 
-
-/* msm8976 */
-DEFINE_CLK_SMD_RPM(msm8976, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
-DEFINE_CLK_SMD_RPM(msm8976, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
 DEFINE_CLK_SMD_RPM(msm8976, mmssnoc_ahb_clk, mmssnoc_ahb_a_clk,
 		   QCOM_SMD_RPM_BUS_CLK, 2);
-DEFINE_CLK_SMD_RPM(msm8976, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
 DEFINE_CLK_SMD_RPM(msm8976, ipa_clk, ipa_a_clk, QCOM_SMD_RPM_IPA_CLK, 0);
-DEFINE_CLK_SMD_RPM_QDSS(msm8976, qdss_clk, qdss_a_clk,
-			QCOM_SMD_RPM_MISC_CLK, 1);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8976, bb_clk1, bb_clk1_a, 1);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8976, bb_clk2, bb_clk2_a, 2);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8976, rf_clk2, rf_clk2_a, 5);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8976, div_clk2, div_clk2_a, 12);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8976, bb_clk1_pin, bb_clk1_a_pin, 1);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8976, bb_clk2_pin, bb_clk2_a_pin, 2);
 
 static struct clk_smd_rpm *msm8976_clks[] = {
-	[RPM_SMD_PCNOC_CLK] = &msm8976_pcnoc_clk,
-	[RPM_SMD_PCNOC_A_CLK] = &msm8976_pcnoc_a_clk,
-	[RPM_SMD_SNOC_CLK] = &msm8976_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &msm8976_snoc_a_clk,
-	[RPM_SMD_BIMC_CLK] = &msm8976_bimc_clk,
-	[RPM_SMD_BIMC_A_CLK] = &msm8976_bimc_a_clk,
-	[RPM_SMD_QDSS_CLK] = &msm8976_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK] = &msm8976_qdss_a_clk,
-	[RPM_SMD_BB_CLK1] = &msm8976_bb_clk1,
-	[RPM_SMD_BB_CLK1_A] = &msm8976_bb_clk1_a,
-	[RPM_SMD_BB_CLK2] = &msm8976_bb_clk2,
-	[RPM_SMD_BB_CLK2_A] = &msm8976_bb_clk2_a,
-	[RPM_SMD_RF_CLK2] = &msm8976_rf_clk2,
-	[RPM_SMD_RF_CLK2_A] = &msm8976_rf_clk2_a,
-	[RPM_SMD_BB_CLK1_PIN] = &msm8976_bb_clk1_pin,
-	[RPM_SMD_BB_CLK1_A_PIN] = &msm8976_bb_clk1_a_pin,
-	[RPM_SMD_BB_CLK2_PIN] = &msm8976_bb_clk2_pin,
-	[RPM_SMD_BB_CLK2_A_PIN] = &msm8976_bb_clk2_a_pin,
+	[RPM_SMD_PCNOC_CLK] = &msm8916_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK] = &msm8916_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK] = &msm8916_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &msm8916_snoc_a_clk,
+	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
+	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &msm8916_qdss_a_clk,
+	[RPM_SMD_BB_CLK1] = &msm8916_bb_clk1,
+	[RPM_SMD_BB_CLK1_A] = &msm8916_bb_clk1_a,
+	[RPM_SMD_BB_CLK2] = &msm8916_bb_clk2,
+	[RPM_SMD_BB_CLK2_A] = &msm8916_bb_clk2_a,
+	[RPM_SMD_RF_CLK2] = &msm8916_rf_clk2,
+	[RPM_SMD_RF_CLK2_A] = &msm8916_rf_clk2_a,
+	[RPM_SMD_BB_CLK1_PIN] = &msm8916_bb_clk1_pin,
+	[RPM_SMD_BB_CLK1_A_PIN] = &msm8916_bb_clk1_a_pin,
+	[RPM_SMD_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
+	[RPM_SMD_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
 	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8976_mmssnoc_ahb_clk,
 	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8976_mmssnoc_ahb_a_clk,
-	[RPM_SMD_DIV_CLK2] = &msm8976_div_clk2,
-	[RPM_SMD_DIV_A_CLK2] = &msm8976_div_clk2_a,
+	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
+	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_a_clk2,
 	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
 	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
 };
@@ -635,78 +603,55 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8976 = {
 	.num_clks = ARRAY_SIZE(msm8976_clks),
 };
 
-/* msm8992 */
-DEFINE_CLK_SMD_RPM(msm8992, pnoc_clk, pnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
-DEFINE_CLK_SMD_RPM(msm8992, ocmemgx_clk, ocmemgx_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
-DEFINE_CLK_SMD_RPM(msm8992, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
-DEFINE_CLK_SMD_RPM(msm8992, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
-DEFINE_CLK_SMD_RPM(msm8992, gfx3d_clk_src, gfx3d_a_clk_src, QCOM_SMD_RPM_MEM_CLK, 1);
-DEFINE_CLK_SMD_RPM(msm8992, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, bb_clk1, bb_clk1_a, 1);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8992, bb_clk1_pin, bb_clk1_a_pin, 1);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, bb_clk2, bb_clk2_a, 2);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8992, bb_clk2_pin, bb_clk2_a_pin, 2);
-
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk1, div_clk1_a, 11);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk2, div_clk2_a, 12);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk3, div_clk3_a, 13);
-DEFINE_CLK_SMD_RPM(msm8992, ipa_clk, ipa_a_clk, QCOM_SMD_RPM_IPA_CLK, 0);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, ln_bb_clk, ln_bb_a_clk, 8);
-DEFINE_CLK_SMD_RPM(msm8992, mmssnoc_ahb_clk, mmssnoc_ahb_a_clk,
-		   QCOM_SMD_RPM_BUS_CLK, 3);
-DEFINE_CLK_SMD_RPM_QDSS(msm8992, qdss_clk, qdss_a_clk,
-			QCOM_SMD_RPM_MISC_CLK, 1);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, rf_clk1, rf_clk1_a, 4);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, rf_clk2, rf_clk2_a, 5);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8992, rf_clk1_pin, rf_clk1_a_pin, 4);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8992, rf_clk2_pin, rf_clk2_a_pin, 5);
 
 DEFINE_CLK_SMD_RPM(msm8992, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
 DEFINE_CLK_SMD_RPM(msm8992, ce2_clk, ce2_a_clk, QCOM_SMD_RPM_CE_CLK, 1);
 
 static struct clk_smd_rpm *msm8992_clks[] = {
-	[RPM_SMD_PNOC_CLK] = &msm8992_pnoc_clk,
-	[RPM_SMD_PNOC_A_CLK] = &msm8992_pnoc_a_clk,
-	[RPM_SMD_OCMEMGX_CLK] = &msm8992_ocmemgx_clk,
-	[RPM_SMD_OCMEMGX_A_CLK] = &msm8992_ocmemgx_a_clk,
-	[RPM_SMD_BIMC_CLK] = &msm8992_bimc_clk,
-	[RPM_SMD_BIMC_A_CLK] = &msm8992_bimc_a_clk,
-	[RPM_SMD_CNOC_CLK] = &msm8992_cnoc_clk,
-	[RPM_SMD_CNOC_A_CLK] = &msm8992_cnoc_a_clk,
-	[RPM_SMD_GFX3D_CLK_SRC] = &msm8992_gfx3d_clk_src,
-	[RPM_SMD_GFX3D_A_CLK_SRC] = &msm8992_gfx3d_a_clk_src,
-	[RPM_SMD_SNOC_CLK] = &msm8992_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &msm8992_snoc_a_clk,
-	[RPM_SMD_BB_CLK1] = &msm8992_bb_clk1,
-	[RPM_SMD_BB_CLK1_A] = &msm8992_bb_clk1_a,
-	[RPM_SMD_BB_CLK1_PIN] = &msm8992_bb_clk1_pin,
-	[RPM_SMD_BB_CLK1_A_PIN] = &msm8992_bb_clk1_a_pin,
-	[RPM_SMD_BB_CLK2] = &msm8992_bb_clk2,
-	[RPM_SMD_BB_CLK2_A] = &msm8992_bb_clk2_a,
-	[RPM_SMD_BB_CLK2_PIN] = &msm8992_bb_clk2_pin,
-	[RPM_SMD_BB_CLK2_A_PIN] = &msm8992_bb_clk2_a_pin,
-	[RPM_SMD_DIV_CLK1] = &msm8992_div_clk1,
-	[RPM_SMD_DIV_A_CLK1] = &msm8992_div_clk1_a,
-	[RPM_SMD_DIV_CLK2] = &msm8992_div_clk2,
-	[RPM_SMD_DIV_A_CLK2] = &msm8992_div_clk2_a,
+	[RPM_SMD_PNOC_CLK] = &msm8916_pcnoc_clk,
+	[RPM_SMD_PNOC_A_CLK] = &msm8916_pcnoc_a_clk,
+	[RPM_SMD_OCMEMGX_CLK] = &msm8974_ocmemgx_clk,
+	[RPM_SMD_OCMEMGX_A_CLK] = &msm8974_ocmemgx_a_clk,
+	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
+	[RPM_SMD_CNOC_CLK] = &msm8974_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &msm8974_cnoc_a_clk,
+	[RPM_SMD_GFX3D_CLK_SRC] = &msm8974_gfx3d_clk_src,
+	[RPM_SMD_GFX3D_A_CLK_SRC] = &msm8974_gfx3d_a_clk_src,
+	[RPM_SMD_SNOC_CLK] = &msm8916_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &msm8916_snoc_a_clk,
+	[RPM_SMD_BB_CLK1] = &msm8916_bb_clk1,
+	[RPM_SMD_BB_CLK1_A] = &msm8916_bb_clk1_a,
+	[RPM_SMD_BB_CLK1_PIN] = &msm8916_bb_clk1_pin,
+	[RPM_SMD_BB_CLK1_A_PIN] = &msm8916_bb_clk1_a_pin,
+	[RPM_SMD_BB_CLK2] = &msm8916_bb_clk2,
+	[RPM_SMD_BB_CLK2_A] = &msm8916_bb_clk2_a,
+	[RPM_SMD_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
+	[RPM_SMD_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
+	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
+	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
+	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
+	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_a_clk2,
 	[RPM_SMD_DIV_CLK3] = &msm8992_div_clk3,
 	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
-	[RPM_SMD_IPA_CLK] = &msm8992_ipa_clk,
-	[RPM_SMD_IPA_A_CLK] = &msm8992_ipa_a_clk,
+	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
 	[RPM_SMD_LN_BB_CLK] = &msm8992_ln_bb_clk,
 	[RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
-	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8992_mmssnoc_ahb_clk,
-	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8992_mmssnoc_ahb_a_clk,
-	[RPM_SMD_QDSS_CLK] = &msm8992_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK] = &msm8992_qdss_a_clk,
-	[RPM_SMD_RF_CLK1] = &msm8992_rf_clk1,
-	[RPM_SMD_RF_CLK1_A] = &msm8992_rf_clk1_a,
-	[RPM_SMD_RF_CLK2] = &msm8992_rf_clk2,
-	[RPM_SMD_RF_CLK2_A] = &msm8992_rf_clk2_a,
-	[RPM_SMD_RF_CLK1_PIN] = &msm8992_rf_clk1_pin,
-	[RPM_SMD_RF_CLK1_A_PIN] = &msm8992_rf_clk1_a_pin,
-	[RPM_SMD_RF_CLK2_PIN] = &msm8992_rf_clk2_pin,
-	[RPM_SMD_RF_CLK2_A_PIN] = &msm8992_rf_clk2_a_pin,
+	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8974_mmssnoc_ahb_clk,
+	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8974_mmssnoc_ahb_a_clk,
+	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &msm8916_qdss_a_clk,
+	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
+	[RPM_SMD_RF_CLK2] = &msm8916_rf_clk2,
+	[RPM_SMD_RF_CLK2_A] = &msm8916_rf_clk2_a,
+	[RPM_SMD_RF_CLK1_PIN] = &msm8916_rf_clk1_pin,
+	[RPM_SMD_RF_CLK1_A_PIN] = &msm8916_rf_clk1_a_pin,
+	[RPM_SMD_RF_CLK2_PIN] = &msm8916_rf_clk2_pin,
+	[RPM_SMD_RF_CLK2_A_PIN] = &msm8916_rf_clk2_a_pin,
 	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
 	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
 	[RPM_SMD_CE2_CLK] = &msm8992_ce2_clk,
@@ -718,83 +663,55 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8992 = {
 	.num_clks = ARRAY_SIZE(msm8992_clks),
 };
 
-/* msm8994 */
-DEFINE_CLK_SMD_RPM(msm8994, pnoc_clk, pnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
-DEFINE_CLK_SMD_RPM(msm8994, ocmemgx_clk, ocmemgx_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
-DEFINE_CLK_SMD_RPM(msm8994, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
-DEFINE_CLK_SMD_RPM(msm8994, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
-DEFINE_CLK_SMD_RPM(msm8994, gfx3d_clk_src, gfx3d_a_clk_src, QCOM_SMD_RPM_MEM_CLK, 1);
-DEFINE_CLK_SMD_RPM(msm8994, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8994, bb_clk1, bb_clk1_a, 1);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8994, bb_clk1_pin, bb_clk1_a_pin, 1);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8994, bb_clk2, bb_clk2_a, 2);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8994, bb_clk2_pin, bb_clk2_a_pin, 2);
-
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8994, div_clk1, div_clk1_a, 11);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8994, div_clk2, div_clk2_a, 12);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8994, div_clk3, div_clk3_a, 13);
-DEFINE_CLK_SMD_RPM(msm8994, ipa_clk, ipa_a_clk, QCOM_SMD_RPM_IPA_CLK, 0);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8994, ln_bb_clk, ln_bb_a_clk, 8);
-DEFINE_CLK_SMD_RPM(msm8994, mmssnoc_ahb_clk, mmssnoc_ahb_a_clk,
-		   QCOM_SMD_RPM_BUS_CLK, 3);
-DEFINE_CLK_SMD_RPM_QDSS(msm8994, qdss_clk, qdss_a_clk,
-			QCOM_SMD_RPM_MISC_CLK, 1);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8994, rf_clk1, rf_clk1_a, 4);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8994, rf_clk2, rf_clk2_a, 5);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8994, rf_clk1_pin, rf_clk1_a_pin, 4);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8994, rf_clk2_pin, rf_clk2_a_pin, 5);
-
-DEFINE_CLK_SMD_RPM(msm8994, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
-DEFINE_CLK_SMD_RPM(msm8994, ce2_clk, ce2_a_clk, QCOM_SMD_RPM_CE_CLK, 1);
 DEFINE_CLK_SMD_RPM(msm8994, ce3_clk, ce3_a_clk, QCOM_SMD_RPM_CE_CLK, 2);
 
 static struct clk_smd_rpm *msm8994_clks[] = {
-	[RPM_SMD_PNOC_CLK] = &msm8994_pnoc_clk,
-	[RPM_SMD_PNOC_A_CLK] = &msm8994_pnoc_a_clk,
-	[RPM_SMD_OCMEMGX_CLK] = &msm8994_ocmemgx_clk,
-	[RPM_SMD_OCMEMGX_A_CLK] = &msm8994_ocmemgx_a_clk,
-	[RPM_SMD_BIMC_CLK] = &msm8994_bimc_clk,
-	[RPM_SMD_BIMC_A_CLK] = &msm8994_bimc_a_clk,
-	[RPM_SMD_CNOC_CLK] = &msm8994_cnoc_clk,
-	[RPM_SMD_CNOC_A_CLK] = &msm8994_cnoc_a_clk,
-	[RPM_SMD_GFX3D_CLK_SRC] = &msm8994_gfx3d_clk_src,
-	[RPM_SMD_GFX3D_A_CLK_SRC] = &msm8994_gfx3d_a_clk_src,
-	[RPM_SMD_SNOC_CLK] = &msm8994_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &msm8994_snoc_a_clk,
-	[RPM_SMD_BB_CLK1] = &msm8994_bb_clk1,
-	[RPM_SMD_BB_CLK1_A] = &msm8994_bb_clk1_a,
-	[RPM_SMD_BB_CLK1_PIN] = &msm8994_bb_clk1_pin,
-	[RPM_SMD_BB_CLK1_A_PIN] = &msm8994_bb_clk1_a_pin,
-	[RPM_SMD_BB_CLK2] = &msm8994_bb_clk2,
-	[RPM_SMD_BB_CLK2_A] = &msm8994_bb_clk2_a,
-	[RPM_SMD_BB_CLK2_PIN] = &msm8994_bb_clk2_pin,
-	[RPM_SMD_BB_CLK2_A_PIN] = &msm8994_bb_clk2_a_pin,
-	[RPM_SMD_DIV_CLK1] = &msm8994_div_clk1,
-	[RPM_SMD_DIV_A_CLK1] = &msm8994_div_clk1_a,
-	[RPM_SMD_DIV_CLK2] = &msm8994_div_clk2,
-	[RPM_SMD_DIV_A_CLK2] = &msm8994_div_clk2_a,
-	[RPM_SMD_DIV_CLK3] = &msm8994_div_clk3,
-	[RPM_SMD_DIV_A_CLK3] = &msm8994_div_clk3_a,
-	[RPM_SMD_IPA_CLK] = &msm8994_ipa_clk,
-	[RPM_SMD_IPA_A_CLK] = &msm8994_ipa_a_clk,
-	[RPM_SMD_LN_BB_CLK] = &msm8994_ln_bb_clk,
-	[RPM_SMD_LN_BB_A_CLK] = &msm8994_ln_bb_a_clk,
-	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8994_mmssnoc_ahb_clk,
-	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8994_mmssnoc_ahb_a_clk,
-	[RPM_SMD_QDSS_CLK] = &msm8994_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK] = &msm8994_qdss_a_clk,
-	[RPM_SMD_RF_CLK1] = &msm8994_rf_clk1,
-	[RPM_SMD_RF_CLK1_A] = &msm8994_rf_clk1_a,
-	[RPM_SMD_RF_CLK2] = &msm8994_rf_clk2,
-	[RPM_SMD_RF_CLK2_A] = &msm8994_rf_clk2_a,
-	[RPM_SMD_RF_CLK1_PIN] = &msm8994_rf_clk1_pin,
-	[RPM_SMD_RF_CLK1_A_PIN] = &msm8994_rf_clk1_a_pin,
-	[RPM_SMD_RF_CLK2_PIN] = &msm8994_rf_clk2_pin,
-	[RPM_SMD_RF_CLK2_A_PIN] = &msm8994_rf_clk2_a_pin,
-	[RPM_SMD_CE1_CLK] = &msm8994_ce1_clk,
-	[RPM_SMD_CE1_A_CLK] = &msm8994_ce1_a_clk,
-	[RPM_SMD_CE2_CLK] = &msm8994_ce2_clk,
-	[RPM_SMD_CE2_A_CLK] = &msm8994_ce2_a_clk,
+	[RPM_SMD_PNOC_CLK] = &msm8916_pcnoc_clk,
+	[RPM_SMD_PNOC_A_CLK] = &msm8916_pcnoc_a_clk,
+	[RPM_SMD_OCMEMGX_CLK] = &msm8974_ocmemgx_clk,
+	[RPM_SMD_OCMEMGX_A_CLK] = &msm8974_ocmemgx_a_clk,
+	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
+	[RPM_SMD_CNOC_CLK] = &msm8974_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &msm8974_cnoc_a_clk,
+	[RPM_SMD_GFX3D_CLK_SRC] = &msm8974_gfx3d_clk_src,
+	[RPM_SMD_GFX3D_A_CLK_SRC] = &msm8974_gfx3d_a_clk_src,
+	[RPM_SMD_SNOC_CLK] = &msm8916_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &msm8916_snoc_a_clk,
+	[RPM_SMD_BB_CLK1] = &msm8916_bb_clk1,
+	[RPM_SMD_BB_CLK1_A] = &msm8916_bb_clk1_a,
+	[RPM_SMD_BB_CLK1_PIN] = &msm8916_bb_clk1_pin,
+	[RPM_SMD_BB_CLK1_A_PIN] = &msm8916_bb_clk1_a_pin,
+	[RPM_SMD_BB_CLK2] = &msm8916_bb_clk2,
+	[RPM_SMD_BB_CLK2_A] = &msm8916_bb_clk2_a,
+	[RPM_SMD_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
+	[RPM_SMD_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
+	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
+	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
+	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
+	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_a_clk2,
+	[RPM_SMD_DIV_CLK3] = &msm8992_div_clk3,
+	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
+	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
+	[RPM_SMD_LN_BB_CLK] = &msm8992_ln_bb_clk,
+	[RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
+	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8974_mmssnoc_ahb_clk,
+	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8974_mmssnoc_ahb_a_clk,
+	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &msm8916_qdss_a_clk,
+	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
+	[RPM_SMD_RF_CLK2] = &msm8916_rf_clk2,
+	[RPM_SMD_RF_CLK2_A] = &msm8916_rf_clk2_a,
+	[RPM_SMD_RF_CLK1_PIN] = &msm8916_rf_clk1_pin,
+	[RPM_SMD_RF_CLK1_A_PIN] = &msm8916_rf_clk1_a_pin,
+	[RPM_SMD_RF_CLK2_PIN] = &msm8916_rf_clk2_pin,
+	[RPM_SMD_RF_CLK2_A_PIN] = &msm8916_rf_clk2_a_pin,
+	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
+	[RPM_SMD_CE2_CLK] = &msm8992_ce2_clk,
+	[RPM_SMD_CE2_A_CLK] = &msm8992_ce2_a_clk,
 	[RPM_SMD_CE3_CLK] = &msm8994_ce3_clk,
 	[RPM_SMD_CE3_A_CLK] = &msm8994_ce3_a_clk,
 };
@@ -804,79 +721,58 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8994 = {
 	.num_clks = ARRAY_SIZE(msm8994_clks),
 };
 
-/* msm8996 */
-DEFINE_CLK_SMD_RPM(msm8996, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
-DEFINE_CLK_SMD_RPM(msm8996, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
-DEFINE_CLK_SMD_RPM(msm8996, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
-DEFINE_CLK_SMD_RPM(msm8996, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
 DEFINE_CLK_SMD_RPM(msm8996, mmssnoc_axi_rpm_clk, mmssnoc_axi_rpm_a_clk,
 		   QCOM_SMD_RPM_MMAXI_CLK, 0);
-DEFINE_CLK_SMD_RPM(msm8996, ipa_clk, ipa_a_clk, QCOM_SMD_RPM_IPA_CLK, 0);
-DEFINE_CLK_SMD_RPM(msm8996, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
 DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre1_noc_clk, aggre1_noc_a_clk,
 			  QCOM_SMD_RPM_AGGR_CLK, 1, 1000);
 DEFINE_CLK_SMD_RPM_BRANCH(msm8996, aggre2_noc_clk, aggre2_noc_a_clk,
 			  QCOM_SMD_RPM_AGGR_CLK, 2, 1000);
-DEFINE_CLK_SMD_RPM_QDSS(msm8996, qdss_clk, qdss_a_clk,
-			QCOM_SMD_RPM_MISC_CLK, 1);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8996, bb_clk1, bb_clk1_a, 1);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8996, bb_clk2, bb_clk2_a, 2);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8996, rf_clk1, rf_clk1_a, 4);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8996, rf_clk2, rf_clk2_a, 5);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8996, ln_bb_clk, ln_bb_a_clk, 8);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8996, div_clk1, div_clk1_a, 0xb);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8996, div_clk2, div_clk2_a, 0xc);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8996, div_clk3, div_clk3_a, 0xd);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8996, bb_clk1_pin, bb_clk1_a_pin, 1);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8996, bb_clk2_pin, bb_clk2_a_pin, 2);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8996, rf_clk1_pin, rf_clk1_a_pin, 4);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8996, rf_clk2_pin, rf_clk2_a_pin, 5);
 
 static struct clk_smd_rpm *msm8996_clks[] = {
-	[RPM_SMD_PCNOC_CLK] = &msm8996_pcnoc_clk,
-	[RPM_SMD_PCNOC_A_CLK] = &msm8996_pcnoc_a_clk,
-	[RPM_SMD_SNOC_CLK] = &msm8996_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &msm8996_snoc_a_clk,
-	[RPM_SMD_CNOC_CLK] = &msm8996_cnoc_clk,
-	[RPM_SMD_CNOC_A_CLK] = &msm8996_cnoc_a_clk,
-	[RPM_SMD_BIMC_CLK] = &msm8996_bimc_clk,
-	[RPM_SMD_BIMC_A_CLK] = &msm8996_bimc_a_clk,
+	[RPM_SMD_PCNOC_CLK] = &msm8916_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK] = &msm8916_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK] = &msm8916_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &msm8916_snoc_a_clk,
+	[RPM_SMD_CNOC_CLK] = &msm8974_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &msm8974_cnoc_a_clk,
+	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
 	[RPM_SMD_MMAXI_CLK] = &msm8996_mmssnoc_axi_rpm_clk,
 	[RPM_SMD_MMAXI_A_CLK] = &msm8996_mmssnoc_axi_rpm_a_clk,
-	[RPM_SMD_IPA_CLK] = &msm8996_ipa_clk,
-	[RPM_SMD_IPA_A_CLK] = &msm8996_ipa_a_clk,
-	[RPM_SMD_CE1_CLK] = &msm8996_ce1_clk,
-	[RPM_SMD_CE1_A_CLK] = &msm8996_ce1_a_clk,
+	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
+	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
 	[RPM_SMD_AGGR1_NOC_CLK] = &msm8996_aggre1_noc_clk,
 	[RPM_SMD_AGGR1_NOC_A_CLK] = &msm8996_aggre1_noc_a_clk,
 	[RPM_SMD_AGGR2_NOC_CLK] = &msm8996_aggre2_noc_clk,
 	[RPM_SMD_AGGR2_NOC_A_CLK] = &msm8996_aggre2_noc_a_clk,
-	[RPM_SMD_QDSS_CLK] = &msm8996_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK] = &msm8996_qdss_a_clk,
-	[RPM_SMD_BB_CLK1] = &msm8996_bb_clk1,
-	[RPM_SMD_BB_CLK1_A] = &msm8996_bb_clk1_a,
-	[RPM_SMD_BB_CLK2] = &msm8996_bb_clk2,
-	[RPM_SMD_BB_CLK2_A] = &msm8996_bb_clk2_a,
-	[RPM_SMD_RF_CLK1] = &msm8996_rf_clk1,
-	[RPM_SMD_RF_CLK1_A] = &msm8996_rf_clk1_a,
-	[RPM_SMD_RF_CLK2] = &msm8996_rf_clk2,
-	[RPM_SMD_RF_CLK2_A] = &msm8996_rf_clk2_a,
-	[RPM_SMD_LN_BB_CLK] = &msm8996_ln_bb_clk,
-	[RPM_SMD_LN_BB_A_CLK] = &msm8996_ln_bb_a_clk,
-	[RPM_SMD_DIV_CLK1] = &msm8996_div_clk1,
-	[RPM_SMD_DIV_A_CLK1] = &msm8996_div_clk1_a,
-	[RPM_SMD_DIV_CLK2] = &msm8996_div_clk2,
-	[RPM_SMD_DIV_A_CLK2] = &msm8996_div_clk2_a,
-	[RPM_SMD_DIV_CLK3] = &msm8996_div_clk3,
-	[RPM_SMD_DIV_A_CLK3] = &msm8996_div_clk3_a,
-	[RPM_SMD_BB_CLK1_PIN] = &msm8996_bb_clk1_pin,
-	[RPM_SMD_BB_CLK1_A_PIN] = &msm8996_bb_clk1_a_pin,
-	[RPM_SMD_BB_CLK2_PIN] = &msm8996_bb_clk2_pin,
-	[RPM_SMD_BB_CLK2_A_PIN] = &msm8996_bb_clk2_a_pin,
-	[RPM_SMD_RF_CLK1_PIN] = &msm8996_rf_clk1_pin,
-	[RPM_SMD_RF_CLK1_A_PIN] = &msm8996_rf_clk1_a_pin,
-	[RPM_SMD_RF_CLK2_PIN] = &msm8996_rf_clk2_pin,
-	[RPM_SMD_RF_CLK2_A_PIN] = &msm8996_rf_clk2_a_pin,
+	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &msm8916_qdss_a_clk,
+	[RPM_SMD_BB_CLK1] = &msm8916_bb_clk1,
+	[RPM_SMD_BB_CLK1_A] = &msm8916_bb_clk1_a,
+	[RPM_SMD_BB_CLK2] = &msm8916_bb_clk2,
+	[RPM_SMD_BB_CLK2_A] = &msm8916_bb_clk2_a,
+	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
+	[RPM_SMD_RF_CLK2] = &msm8916_rf_clk2,
+	[RPM_SMD_RF_CLK2_A] = &msm8916_rf_clk2_a,
+	[RPM_SMD_LN_BB_CLK] = &msm8992_ln_bb_clk,
+	[RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
+	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
+	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
+	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
+	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_a_clk2,
+	[RPM_SMD_DIV_CLK3] = &msm8992_div_clk3,
+	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
+	[RPM_SMD_BB_CLK1_PIN] = &msm8916_bb_clk1_pin,
+	[RPM_SMD_BB_CLK1_A_PIN] = &msm8916_bb_clk1_a_pin,
+	[RPM_SMD_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
+	[RPM_SMD_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
+	[RPM_SMD_RF_CLK1_PIN] = &msm8916_rf_clk1_pin,
+	[RPM_SMD_RF_CLK1_A_PIN] = &msm8916_rf_clk1_a_pin,
+	[RPM_SMD_RF_CLK2_PIN] = &msm8916_rf_clk2_pin,
+	[RPM_SMD_RF_CLK2_A_PIN] = &msm8916_rf_clk2_a_pin,
 };
 
 static const struct rpm_smd_clk_desc rpm_clk_msm8996 = {
@@ -884,43 +780,29 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8996 = {
 	.num_clks = ARRAY_SIZE(msm8996_clks),
 };
 
-/* QCS404 */
-DEFINE_CLK_SMD_RPM_QDSS(qcs404, qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_CLK, 1);
-
-DEFINE_CLK_SMD_RPM(qcs404, pnoc_clk, pnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
-DEFINE_CLK_SMD_RPM(qcs404, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
-
-DEFINE_CLK_SMD_RPM(qcs404, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
 DEFINE_CLK_SMD_RPM(qcs404, bimc_gpu_clk, bimc_gpu_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
-
 DEFINE_CLK_SMD_RPM(qcs404, qpic_clk, qpic_a_clk, QCOM_SMD_RPM_QPIC_CLK, 0);
-DEFINE_CLK_SMD_RPM(qcs404, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
-
-DEFINE_CLK_SMD_RPM_XO_BUFFER(qcs404, rf_clk1, rf_clk1_a, 4);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, rf_clk1_pin, rf_clk1_a_pin, 4);
-
-DEFINE_CLK_SMD_RPM_XO_BUFFER(qcs404, ln_bb_clk, ln_bb_a_clk, 8);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk_pin, ln_bb_clk_a_pin, 8);
 
 static struct clk_smd_rpm *qcs404_clks[] = {
-	[RPM_SMD_QDSS_CLK] = &qcs404_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK] = &qcs404_qdss_a_clk,
-	[RPM_SMD_PNOC_CLK] = &qcs404_pnoc_clk,
-	[RPM_SMD_PNOC_A_CLK] = &qcs404_pnoc_a_clk,
-	[RPM_SMD_SNOC_CLK] = &qcs404_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &qcs404_snoc_a_clk,
-	[RPM_SMD_BIMC_CLK] = &qcs404_bimc_clk,
-	[RPM_SMD_BIMC_A_CLK] = &qcs404_bimc_a_clk,
+	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &msm8916_qdss_a_clk,
+	[RPM_SMD_PNOC_CLK] = &msm8916_pcnoc_clk,
+	[RPM_SMD_PNOC_A_CLK] = &msm8916_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK] = &msm8916_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &msm8916_snoc_a_clk,
+	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
 	[RPM_SMD_BIMC_GPU_CLK] = &qcs404_bimc_gpu_clk,
 	[RPM_SMD_BIMC_GPU_A_CLK] = &qcs404_bimc_gpu_a_clk,
 	[RPM_SMD_QPIC_CLK] = &qcs404_qpic_clk,
 	[RPM_SMD_QPIC_CLK_A] = &qcs404_qpic_a_clk,
-	[RPM_SMD_CE1_CLK] = &qcs404_ce1_clk,
-	[RPM_SMD_CE1_A_CLK] = &qcs404_ce1_a_clk,
-	[RPM_SMD_RF_CLK1] = &qcs404_rf_clk1,
-	[RPM_SMD_RF_CLK1_A] = &qcs404_rf_clk1_a,
-	[RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
-	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_a_clk,
+	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
+	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
+	[RPM_SMD_LN_BB_CLK] = &msm8992_ln_bb_clk,
+	[RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
 };
 
 static const struct rpm_smd_clk_desc rpm_clk_qcs404 = {
@@ -928,63 +810,47 @@ static const struct rpm_smd_clk_desc rpm_clk_qcs404 = {
 	.num_clks = ARRAY_SIZE(qcs404_clks),
 };
 
-/* msm8998 */
-DEFINE_CLK_SMD_RPM(msm8998, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
-DEFINE_CLK_SMD_RPM(msm8998, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
-DEFINE_CLK_SMD_RPM(msm8998, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
-DEFINE_CLK_SMD_RPM(msm8998, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
-DEFINE_CLK_SMD_RPM(msm8998, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, div_clk1, div_clk1_a, 0xb);
-DEFINE_CLK_SMD_RPM(msm8998, ipa_clk, ipa_a_clk, QCOM_SMD_RPM_IPA_CLK, 0);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, ln_bb_clk1, ln_bb_clk1_a, 1);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, ln_bb_clk2, ln_bb_clk2_a, 2);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk3_pin, ln_bb_clk3_a_pin,
 				     3);
-DEFINE_CLK_SMD_RPM(msm8998, mmssnoc_axi_rpm_clk, mmssnoc_axi_rpm_a_clk,
-		   QCOM_SMD_RPM_MMAXI_CLK, 0);
 DEFINE_CLK_SMD_RPM(msm8998, aggre1_noc_clk, aggre1_noc_a_clk,
 		   QCOM_SMD_RPM_AGGR_CLK, 1);
 DEFINE_CLK_SMD_RPM(msm8998, aggre2_noc_clk, aggre2_noc_a_clk,
 		   QCOM_SMD_RPM_AGGR_CLK, 2);
-DEFINE_CLK_SMD_RPM_QDSS(msm8998, qdss_clk, qdss_a_clk,
-			QCOM_SMD_RPM_MISC_CLK, 1);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, rf_clk1, rf_clk1_a, 4);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk2_pin, rf_clk2_a_pin, 5);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, rf_clk3, rf_clk3_a, 6);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk3_pin, rf_clk3_a_pin, 6);
 static struct clk_smd_rpm *msm8998_clks[] = {
-	[RPM_SMD_BIMC_CLK] = &msm8998_bimc_clk,
-	[RPM_SMD_BIMC_A_CLK] = &msm8998_bimc_a_clk,
-	[RPM_SMD_PCNOC_CLK] = &msm8998_pcnoc_clk,
-	[RPM_SMD_PCNOC_A_CLK] = &msm8998_pcnoc_a_clk,
-	[RPM_SMD_SNOC_CLK] = &msm8998_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &msm8998_snoc_a_clk,
-	[RPM_SMD_CNOC_CLK] = &msm8998_cnoc_clk,
-	[RPM_SMD_CNOC_A_CLK] = &msm8998_cnoc_a_clk,
-	[RPM_SMD_CE1_CLK] = &msm8998_ce1_clk,
-	[RPM_SMD_CE1_A_CLK] = &msm8998_ce1_a_clk,
-	[RPM_SMD_DIV_CLK1] = &msm8998_div_clk1,
-	[RPM_SMD_DIV_A_CLK1] = &msm8998_div_clk1_a,
-	[RPM_SMD_IPA_CLK] = &msm8998_ipa_clk,
-	[RPM_SMD_IPA_A_CLK] = &msm8998_ipa_a_clk,
-	[RPM_SMD_LN_BB_CLK1] = &msm8998_ln_bb_clk1,
-	[RPM_SMD_LN_BB_CLK1_A] = &msm8998_ln_bb_clk1_a,
-	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
-	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
+	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
+	[RPM_SMD_PCNOC_CLK] = &msm8916_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK] = &msm8916_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK] = &msm8916_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &msm8916_snoc_a_clk,
+	[RPM_SMD_CNOC_CLK] = &msm8974_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &msm8974_cnoc_a_clk,
+	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
+	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
+	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
+	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
+	[RPM_SMD_LN_BB_CLK1] = &msm8916_bb_clk1,
+	[RPM_SMD_LN_BB_CLK1_A] = &msm8916_bb_clk1_a,
+	[RPM_SMD_LN_BB_CLK2] = &msm8916_bb_clk2,
+	[RPM_SMD_LN_BB_CLK2_A] = &msm8916_bb_clk2_a,
 	[RPM_SMD_LN_BB_CLK3_PIN] = &msm8998_ln_bb_clk3_pin,
 	[RPM_SMD_LN_BB_CLK3_A_PIN] = &msm8998_ln_bb_clk3_a_pin,
-	[RPM_SMD_MMAXI_CLK] = &msm8998_mmssnoc_axi_rpm_clk,
-	[RPM_SMD_MMAXI_A_CLK] = &msm8998_mmssnoc_axi_rpm_a_clk,
+	[RPM_SMD_MMAXI_CLK] = &msm8996_mmssnoc_axi_rpm_clk,
+	[RPM_SMD_MMAXI_A_CLK] = &msm8996_mmssnoc_axi_rpm_a_clk,
 	[RPM_SMD_AGGR1_NOC_CLK] = &msm8998_aggre1_noc_clk,
 	[RPM_SMD_AGGR1_NOC_A_CLK] = &msm8998_aggre1_noc_a_clk,
 	[RPM_SMD_AGGR2_NOC_CLK] = &msm8998_aggre2_noc_clk,
 	[RPM_SMD_AGGR2_NOC_A_CLK] = &msm8998_aggre2_noc_a_clk,
-	[RPM_SMD_QDSS_CLK] = &msm8998_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK] = &msm8998_qdss_a_clk,
-	[RPM_SMD_RF_CLK1] = &msm8998_rf_clk1,
-	[RPM_SMD_RF_CLK1_A] = &msm8998_rf_clk1_a,
-	[RPM_SMD_RF_CLK2_PIN] = &msm8998_rf_clk2_pin,
-	[RPM_SMD_RF_CLK2_A_PIN] = &msm8998_rf_clk2_a_pin,
+	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &msm8916_qdss_a_clk,
+	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
+	[RPM_SMD_RF_CLK2_PIN] = &msm8916_rf_clk2_pin,
+	[RPM_SMD_RF_CLK2_A_PIN] = &msm8916_rf_clk2_a_pin,
 	[RPM_SMD_RF_CLK3] = &msm8998_rf_clk3,
 	[RPM_SMD_RF_CLK3_A] = &msm8998_rf_clk3_a,
 	[RPM_SMD_RF_CLK3_PIN] = &msm8998_rf_clk3_pin,
@@ -996,72 +862,48 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8998 = {
 	.num_clks = ARRAY_SIZE(msm8998_clks),
 };
 
-/* sdm660 */
 DEFINE_CLK_SMD_RPM_BRANCH(sdm660, bi_tcxo, bi_tcxo_a, QCOM_SMD_RPM_MISC_CLK, 0,
 								19200000);
-DEFINE_CLK_SMD_RPM(sdm660, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
-DEFINE_CLK_SMD_RPM(sdm660, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
-DEFINE_CLK_SMD_RPM(sdm660, cnoc_periph_clk, cnoc_periph_a_clk,
-						QCOM_SMD_RPM_BUS_CLK, 0);
-DEFINE_CLK_SMD_RPM(sdm660, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
-DEFINE_CLK_SMD_RPM(sdm660, mmssnoc_axi_clk, mmssnoc_axi_a_clk,
-						   QCOM_SMD_RPM_MMAXI_CLK, 0);
-DEFINE_CLK_SMD_RPM(sdm660, ipa_clk, ipa_a_clk, QCOM_SMD_RPM_IPA_CLK, 0);
-DEFINE_CLK_SMD_RPM(sdm660, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
-DEFINE_CLK_SMD_RPM(sdm660, aggre2_noc_clk, aggre2_noc_a_clk,
-						QCOM_SMD_RPM_AGGR_CLK, 2);
-DEFINE_CLK_SMD_RPM_QDSS(sdm660, qdss_clk, qdss_a_clk,
-						QCOM_SMD_RPM_MISC_CLK, 1);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(sdm660, rf_clk1, rf_clk1_a, 4);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(sdm660, div_clk1, div_clk1_a, 11);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(sdm660, ln_bb_clk1, ln_bb_clk1_a, 1);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(sdm660, ln_bb_clk2, ln_bb_clk2_a, 2);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(sdm660, ln_bb_clk3, ln_bb_clk3_a, 3);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(sdm660, ln_bb_clk3_pin, ln_bb_clk3_pin_a, 3);
 
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(sdm660, rf_clk1_pin, rf_clk1_a_pin, 4);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(sdm660, ln_bb_clk1_pin,
-							ln_bb_clk1_pin_a, 1);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(sdm660, ln_bb_clk2_pin,
-							ln_bb_clk2_pin_a, 2);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(sdm660, ln_bb_clk3_pin,
-							ln_bb_clk3_pin_a, 3);
 static struct clk_smd_rpm *sdm660_clks[] = {
 	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
 	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
-	[RPM_SMD_SNOC_CLK] = &sdm660_snoc_clk,
-	[RPM_SMD_SNOC_A_CLK] = &sdm660_snoc_a_clk,
-	[RPM_SMD_CNOC_CLK] = &sdm660_cnoc_clk,
-	[RPM_SMD_CNOC_A_CLK] = &sdm660_cnoc_a_clk,
-	[RPM_SMD_CNOC_PERIPH_CLK] = &sdm660_cnoc_periph_clk,
-	[RPM_SMD_CNOC_PERIPH_A_CLK] = &sdm660_cnoc_periph_a_clk,
-	[RPM_SMD_BIMC_CLK] = &sdm660_bimc_clk,
-	[RPM_SMD_BIMC_A_CLK] = &sdm660_bimc_a_clk,
-	[RPM_SMD_MMSSNOC_AXI_CLK] = &sdm660_mmssnoc_axi_clk,
-	[RPM_SMD_MMSSNOC_AXI_CLK_A] = &sdm660_mmssnoc_axi_a_clk,
-	[RPM_SMD_IPA_CLK] = &sdm660_ipa_clk,
-	[RPM_SMD_IPA_A_CLK] = &sdm660_ipa_a_clk,
-	[RPM_SMD_CE1_CLK] = &sdm660_ce1_clk,
-	[RPM_SMD_CE1_A_CLK] = &sdm660_ce1_a_clk,
-	[RPM_SMD_AGGR2_NOC_CLK] = &sdm660_aggre2_noc_clk,
-	[RPM_SMD_AGGR2_NOC_A_CLK] = &sdm660_aggre2_noc_a_clk,
-	[RPM_SMD_QDSS_CLK] = &sdm660_qdss_clk,
-	[RPM_SMD_QDSS_A_CLK] = &sdm660_qdss_a_clk,
-	[RPM_SMD_RF_CLK1] = &sdm660_rf_clk1,
-	[RPM_SMD_RF_CLK1_A] = &sdm660_rf_clk1_a,
-	[RPM_SMD_DIV_CLK1] = &sdm660_div_clk1,
-	[RPM_SMD_DIV_A_CLK1] = &sdm660_div_clk1_a,
-	[RPM_SMD_LN_BB_CLK] = &sdm660_ln_bb_clk1,
-	[RPM_SMD_LN_BB_A_CLK] = &sdm660_ln_bb_clk1_a,
-	[RPM_SMD_LN_BB_CLK2] = &sdm660_ln_bb_clk2,
-	[RPM_SMD_LN_BB_CLK2_A] = &sdm660_ln_bb_clk2_a,
+	[RPM_SMD_SNOC_CLK] = &msm8916_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &msm8916_snoc_a_clk,
+	[RPM_SMD_CNOC_CLK] = &msm8974_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &msm8974_cnoc_a_clk,
+	[RPM_SMD_CNOC_PERIPH_CLK] = &msm8916_pcnoc_clk,
+	[RPM_SMD_CNOC_PERIPH_A_CLK] = &msm8916_pcnoc_a_clk,
+	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
+	[RPM_SMD_MMSSNOC_AXI_CLK] = &msm8996_mmssnoc_axi_rpm_clk,
+	[RPM_SMD_MMSSNOC_AXI_CLK_A] = &msm8996_mmssnoc_axi_rpm_a_clk,
+	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
+	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
+	[RPM_SMD_AGGR2_NOC_CLK] = &msm8998_aggre2_noc_clk,
+	[RPM_SMD_AGGR2_NOC_A_CLK] = &msm8998_aggre2_noc_a_clk,
+	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &msm8916_qdss_a_clk,
+	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
+	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
+	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
+	[RPM_SMD_LN_BB_CLK] = &msm8916_bb_clk1,
+	[RPM_SMD_LN_BB_A_CLK] = &msm8916_bb_clk1_a,
+	[RPM_SMD_LN_BB_CLK2] = &msm8916_bb_clk2,
+	[RPM_SMD_LN_BB_CLK2_A] = &msm8916_bb_clk2_a,
 	[RPM_SMD_LN_BB_CLK3] = &sdm660_ln_bb_clk3,
 	[RPM_SMD_LN_BB_CLK3_A] = &sdm660_ln_bb_clk3_a,
-	[RPM_SMD_RF_CLK1_PIN] = &sdm660_rf_clk1_pin,
-	[RPM_SMD_RF_CLK1_A_PIN] = &sdm660_rf_clk1_a_pin,
-	[RPM_SMD_LN_BB_CLK1_PIN] = &sdm660_ln_bb_clk1_pin,
-	[RPM_SMD_LN_BB_CLK1_A_PIN] = &sdm660_ln_bb_clk1_pin_a,
-	[RPM_SMD_LN_BB_CLK2_PIN] = &sdm660_ln_bb_clk2_pin,
-	[RPM_SMD_LN_BB_CLK2_A_PIN] = &sdm660_ln_bb_clk2_pin_a,
+	[RPM_SMD_RF_CLK1_PIN] = &msm8916_rf_clk1_pin,
+	[RPM_SMD_RF_CLK1_A_PIN] = &msm8916_rf_clk1_a_pin,
+	[RPM_SMD_LN_BB_CLK1_PIN] = &msm8916_bb_clk1_pin,
+	[RPM_SMD_LN_BB_CLK1_A_PIN] = &msm8916_bb_clk1_a_pin,
+	[RPM_SMD_LN_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
+	[RPM_SMD_LN_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
 	[RPM_SMD_LN_BB_CLK3_PIN] = &sdm660_ln_bb_clk3_pin,
 	[RPM_SMD_LN_BB_CLK3_A_PIN] = &sdm660_ln_bb_clk3_pin_a,
 };
-- 
2.31.1

