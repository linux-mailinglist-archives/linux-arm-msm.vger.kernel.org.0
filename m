Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 812ED3DC0A8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jul 2021 00:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbhG3WCa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jul 2021 18:02:30 -0400
Received: from relay01.th.seeweb.it ([5.144.164.162]:55309 "EHLO
        relay01.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231300AbhG3WCa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jul 2021 18:02:30 -0400
Received: from TimeMachine.lan (bband-dyn19.178-41-181.t-com.sk [178.41.181.19])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 32C2A202E8;
        Sat, 31 Jul 2021 00:02:23 +0200 (CEST)
From:   Martin Botka <martin.botka@somainline.org>
To:     martin.botka1@gmail.com
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        paul.bouchara@somainline.org,
        Martin Botka <martin.botka@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V3 1/1] clk: qcom: smd: Add support for SM6125 rpm clocks
Date:   Fri, 30 Jul 2021 23:59:24 +0200
Message-Id: <20210730215924.733350-2-martin.botka@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210730215924.733350-1-martin.botka@somainline.org>
References: <20210730215924.733350-1-martin.botka@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add rpm smd clocks, PMIC and bus clocks which are required on SM6125
for clients to vote on.

Signed-off-by: Martin Botka <martin.botka@somainline.org>
---
 drivers/clk/qcom/clk-smd-rpm.c   | 56 ++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/smd-rpm.h |  1 +
 2 files changed, 57 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 800b2fef1887..c85cd0981543 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -913,6 +913,61 @@ static const struct rpm_smd_clk_desc rpm_clk_sdm660 = {
 	.num_clks = ARRAY_SIZE(sdm660_clks),
 };
 
+/* SM6125 */
+DEFINE_CLK_SMD_RPM(sm6125, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
+DEFINE_CLK_SMD_RPM(sm6125, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
+DEFINE_CLK_SMD_RPM_BRANCH(sm6125, qdss_clk, qdss_a_clk,
+					QCOM_SMD_RPM_MISC_CLK, 1, 19200000);
+DEFINE_CLK_SMD_RPM(sm6125, qup_clk, qup_a_clk, QCOM_SMD_RPM_QUP_CLK, 0);
+DEFINE_CLK_SMD_RPM(sm6125, mmnrt_clk, mmnrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 0);
+DEFINE_CLK_SMD_RPM(sm6125, mmrt_clk, mmrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 1);
+DEFINE_CLK_SMD_RPM(sm6125, snoc_periph_clk, snoc_periph_a_clk,
+						QCOM_SMD_RPM_BUS_CLK, 0);
+DEFINE_CLK_SMD_RPM(sm6125, snoc_lpass_clk, snoc_lpass_a_clk,
+						QCOM_SMD_RPM_BUS_CLK, 5);
+
+static struct clk_smd_rpm *sm6125_clks[] = {
+	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
+	[RPM_SMD_SNOC_CLK] = &sm6125_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &sm6125_snoc_a_clk,
+	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
+	[RPM_SMD_QDSS_CLK] = &sm6125_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &sm6125_qdss_a_clk,
+	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
+	[RPM_SMD_RF_CLK2] = &msm8916_rf_clk2,
+	[RPM_SMD_RF_CLK2_A] = &msm8916_rf_clk2_a,
+	[RPM_SMD_CNOC_CLK] = &sm6125_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &sm6125_cnoc_a_clk,
+	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
+	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
+	[RPM_SMD_LN_BB_CLK1] = &msm8916_bb_clk1,
+	[RPM_SMD_LN_BB_CLK1_A] = &msm8916_bb_clk1_a,
+	[RPM_SMD_LN_BB_CLK2] = &msm8916_bb_clk2,
+	[RPM_SMD_LN_BB_CLK2_A] = &msm8916_bb_clk2_a,
+	[RPM_SMD_LN_BB_CLK3] = &sdm660_ln_bb_clk3,
+	[RPM_SMD_LN_BB_CLK3_A] = &sdm660_ln_bb_clk3_a,
+	[RPM_SMD_QUP_CLK] = &sm6125_qup_clk,
+	[RPM_SMD_QUP_A_CLK] = &sm6125_qup_a_clk,
+	[RPM_SMD_MMRT_CLK] = &sm6125_mmrt_clk,
+	[RPM_SMD_MMRT_A_CLK] = &sm6125_mmrt_a_clk,
+	[RPM_SMD_MMNRT_CLK] = &sm6125_mmnrt_clk,
+	[RPM_SMD_MMNRT_A_CLK] = &sm6125_mmnrt_a_clk,
+	[RPM_SMD_SNOC_PERIPH_CLK] = &sm6125_snoc_periph_clk,
+	[RPM_SMD_SNOC_PERIPH_A_CLK] = &sm6125_snoc_periph_a_clk,
+	[RPM_SMD_SNOC_LPASS_CLK] = &sm6125_snoc_lpass_clk,
+	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6125_snoc_lpass_a_clk,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_sm6125 = {
+	.clks = sm6125_clks,
+	.num_clks = ARRAY_SIZE(sm6125_clks),
+};
+
 static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8226", .data = &rpm_clk_msm8974 },
 	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
@@ -925,6 +980,7 @@ static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8998", .data = &rpm_clk_msm8998 },
 	{ .compatible = "qcom,rpmcc-qcs404",  .data = &rpm_clk_qcs404  },
 	{ .compatible = "qcom,rpmcc-sdm660",  .data = &rpm_clk_sdm660  },
+	{ .compatible = "qcom,rpmcc-sm6125",  .data = &rpm_clk_sm6125  },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rpm_smd_clk_match_table);
diff --git a/include/linux/soc/qcom/smd-rpm.h b/include/linux/soc/qcom/smd-rpm.h
index f2645ec52520..c5b98dc2c7a9 100644
--- a/include/linux/soc/qcom/smd-rpm.h
+++ b/include/linux/soc/qcom/smd-rpm.h
@@ -29,6 +29,7 @@ struct qcom_smd_rpm;
 #define QCOM_SMD_RPM_NCPB	0x6270636E
 #define QCOM_SMD_RPM_OCMEM_PWR	0x706d636f
 #define QCOM_SMD_RPM_QPIC_CLK	0x63697071
+#define QCOM_SMD_RPM_QUP_CLK	0x707571
 #define QCOM_SMD_RPM_SMPA	0x61706d73
 #define QCOM_SMD_RPM_SMPB	0x62706d73
 #define QCOM_SMD_RPM_SPDM	0x63707362
-- 
2.32.0

