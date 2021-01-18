Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD2D92FA5DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 17:17:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406422AbhARQQ7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 11:16:59 -0500
Received: from m-r1.th.seeweb.it ([5.144.164.170]:48895 "EHLO
        m-r1.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406578AbhARQQC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 11:16:02 -0500
Received: from localhost.localdomain (abaf224.neoplus.adsl.tpnet.pl [83.6.169.224])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id E1BC41F524;
        Mon, 18 Jan 2021 17:15:02 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] clk: qcom: smd: Add missing RPM clocks for msm8992/4
Date:   Mon, 18 Jan 2021 17:14:41 +0100
Message-Id: <20210118161442.104660-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This was omitted when first adding the clocks for these SoCs.

Fixes: b4297844995 ("clk: qcom: smd: Add support for MSM8992/4 rpm clocks")
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/clk/qcom/clk-smd-rpm.c         | 16 ++++++++++++++++
 include/dt-bindings/clock/qcom,rpmcc.h |  2 ++
 include/linux/soc/qcom/smd-rpm.h       |  1 +
 3 files changed, 19 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 0e1dfa89489e..91d610042a5d 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -624,6 +624,8 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8976 = {
 };
 
 /* msm8992 */
+DEFINE_CLK_SMD_RPM_BRANCH(msm8992, bi_tcxo, bi_tcxo_a, QCOM_SMD_RPM_MISC_CLK, 0,
+								19200000);
 DEFINE_CLK_SMD_RPM(msm8992, pnoc_clk, pnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
 DEFINE_CLK_SMD_RPM(msm8992, ocmemgx_clk, ocmemgx_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
 DEFINE_CLK_SMD_RPM(msm8992, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
@@ -642,6 +644,8 @@ DEFINE_CLK_SMD_RPM(msm8992, ipa_clk, ipa_a_clk, QCOM_SMD_RPM_IPA_CLK, 0);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, ln_bb_clk, ln_bb_a_clk, 8);
 DEFINE_CLK_SMD_RPM(msm8992, mmssnoc_ahb_clk, mmssnoc_ahb_a_clk,
 		   QCOM_SMD_RPM_BUS_CLK, 3);
+DEFINE_CLK_SMD_RPM_BRANCH(msm8992, mss_cfg_ahb_clk, mss_cfg_ahb_a_clk,
+			QCOM_SMD_RPM_MFFG_CLK, 0, 19200000);
 DEFINE_CLK_SMD_RPM_QDSS(msm8992, qdss_clk, qdss_a_clk,
 			QCOM_SMD_RPM_MISC_CLK, 1);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, rf_clk1, rf_clk1_a, 4);
@@ -653,6 +657,8 @@ DEFINE_CLK_SMD_RPM(msm8992, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
 DEFINE_CLK_SMD_RPM(msm8992, ce2_clk, ce2_a_clk, QCOM_SMD_RPM_CE_CLK, 1);
 
 static struct clk_smd_rpm *msm8992_clks[] = {
+	[RPM_SMD_XO_CLK_SRC] = &msm8992_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &msm8992_bi_tcxo_a,
 	[RPM_SMD_PNOC_CLK] = &msm8992_pnoc_clk,
 	[RPM_SMD_PNOC_A_CLK] = &msm8992_pnoc_a_clk,
 	[RPM_SMD_OCMEMGX_CLK] = &msm8992_ocmemgx_clk,
@@ -685,6 +691,8 @@ static struct clk_smd_rpm *msm8992_clks[] = {
 	[RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
 	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8992_mmssnoc_ahb_clk,
 	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8992_mmssnoc_ahb_a_clk,
+	[RPM_SMD_MSS_CFG_AHB_CLK] = &msm8992_mss_cfg_ahb_clk,
+	[RPM_SMD_MSS_CFG_AHB_A_CLK] = &msm8992_mss_cfg_ahb_a_clk,
 	[RPM_SMD_QDSS_CLK] = &msm8992_qdss_clk,
 	[RPM_SMD_QDSS_A_CLK] = &msm8992_qdss_a_clk,
 	[RPM_SMD_RF_CLK1] = &msm8992_rf_clk1,
@@ -707,6 +715,8 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8992 = {
 };
 
 /* msm8994 */
+DEFINE_CLK_SMD_RPM_BRANCH(msm8994, bi_tcxo, bi_tcxo_a, QCOM_SMD_RPM_MISC_CLK, 0,
+								19200000);
 DEFINE_CLK_SMD_RPM(msm8994, pnoc_clk, pnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
 DEFINE_CLK_SMD_RPM(msm8994, ocmemgx_clk, ocmemgx_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
 DEFINE_CLK_SMD_RPM(msm8994, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
@@ -725,6 +735,8 @@ DEFINE_CLK_SMD_RPM(msm8994, ipa_clk, ipa_a_clk, QCOM_SMD_RPM_IPA_CLK, 0);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8994, ln_bb_clk, ln_bb_a_clk, 8);
 DEFINE_CLK_SMD_RPM(msm8994, mmssnoc_ahb_clk, mmssnoc_ahb_a_clk,
 		   QCOM_SMD_RPM_BUS_CLK, 3);
+DEFINE_CLK_SMD_RPM_BRANCH(msm8994, mss_cfg_ahb_clk, mss_cfg_ahb_a_clk,
+			QCOM_SMD_RPM_MFFG_CLK, 0, 19200000);
 DEFINE_CLK_SMD_RPM_QDSS(msm8994, qdss_clk, qdss_a_clk,
 			QCOM_SMD_RPM_MISC_CLK, 1);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8994, rf_clk1, rf_clk1_a, 4);
@@ -737,6 +749,8 @@ DEFINE_CLK_SMD_RPM(msm8994, ce2_clk, ce2_a_clk, QCOM_SMD_RPM_CE_CLK, 1);
 DEFINE_CLK_SMD_RPM(msm8994, ce3_clk, ce3_a_clk, QCOM_SMD_RPM_CE_CLK, 2);
 
 static struct clk_smd_rpm *msm8994_clks[] = {
+	[RPM_SMD_XO_CLK_SRC] = &msm8994_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &msm8994_bi_tcxo_a,
 	[RPM_SMD_PNOC_CLK] = &msm8994_pnoc_clk,
 	[RPM_SMD_PNOC_A_CLK] = &msm8994_pnoc_a_clk,
 	[RPM_SMD_OCMEMGX_CLK] = &msm8994_ocmemgx_clk,
@@ -769,6 +783,8 @@ static struct clk_smd_rpm *msm8994_clks[] = {
 	[RPM_SMD_LN_BB_A_CLK] = &msm8994_ln_bb_a_clk,
 	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8994_mmssnoc_ahb_clk,
 	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8994_mmssnoc_ahb_a_clk,
+	[RPM_SMD_MSS_CFG_AHB_CLK] = &msm8994_mss_cfg_ahb_clk,
+	[RPM_SMD_MSS_CFG_AHB_A_CLK] = &msm8994_mss_cfg_ahb_a_clk,
 	[RPM_SMD_QDSS_CLK] = &msm8994_qdss_clk,
 	[RPM_SMD_QDSS_A_CLK] = &msm8994_qdss_a_clk,
 	[RPM_SMD_RF_CLK1] = &msm8994_rf_clk1,
diff --git a/include/dt-bindings/clock/qcom,rpmcc.h b/include/dt-bindings/clock/qcom,rpmcc.h
index 8aaba7cd9589..e8e256dbcc8a 100644
--- a/include/dt-bindings/clock/qcom,rpmcc.h
+++ b/include/dt-bindings/clock/qcom,rpmcc.h
@@ -149,5 +149,7 @@
 #define RPM_SMD_CE2_A_CLK			103
 #define RPM_SMD_CE3_CLK				104
 #define RPM_SMD_CE3_A_CLK			105
+#define RPM_SMD_MSS_CFG_AHB_CLK			106
+#define RPM_SMD_MSS_CFG_AHB_A_CLK		107
 
 #endif
diff --git a/include/linux/soc/qcom/smd-rpm.h b/include/linux/soc/qcom/smd-rpm.h
index f2645ec52520..ce51b18f7128 100644
--- a/include/linux/soc/qcom/smd-rpm.h
+++ b/include/linux/soc/qcom/smd-rpm.h
@@ -37,6 +37,7 @@ struct qcom_smd_rpm;
 #define QCOM_SMD_RPM_IPA_CLK	0x617069
 #define QCOM_SMD_RPM_CE_CLK	0x6563
 #define QCOM_SMD_RPM_AGGR_CLK	0x72676761
+#define QCOM_SMD_RPM_MFFG_CLK	0x6766636d
 
 int qcom_rpm_smd_write(struct qcom_smd_rpm *rpm,
 		       int state,
-- 
2.29.2

