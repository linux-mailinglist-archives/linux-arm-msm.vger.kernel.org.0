Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 693123B7095
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 12:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233084AbhF2K1Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 06:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233048AbhF2K1N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 06:27:13 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8513DC0617A8;
        Tue, 29 Jun 2021 03:24:43 -0700 (PDT)
Received: from localhost.localdomain (bband-dyn27.178-40-203.t-com.sk [178.40.203.27])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 85F143EE1D;
        Tue, 29 Jun 2021 12:24:41 +0200 (CEST)
From:   Martin Botka <martin.botka@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        paul.bouchara@somainline.org,
        Martin Botka <martin.botka@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v2 3/3] rpmcc: Add support for SM6125
Date:   Tue, 29 Jun 2021 12:24:04 +0200
Message-Id: <20210629102405.192053-4-martin.botka@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629102405.192053-1-martin.botka@somainline.org>
References: <20210629102405.192053-1-martin.botka@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit adds support for RPM clocks found in SM6125 SoC

Signed-off-by: Martin Botka <martin.botka@somainline.org>
---
 drivers/clk/qcom/clk-smd-rpm.c   | 55 ++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/smd-rpm.h |  1 +
 2 files changed, 56 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 8200c26b968c..51458f740ba0 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -1059,6 +1059,61 @@ static const struct rpm_smd_clk_desc rpm_clk_sdm660 = {
 	.num_clks = ARRAY_SIZE(sdm660_clks),
 };
 
+/* SM6125 */
+DEFINE_CLK_SMD_RPM_BRANCH(sm6125, bi_tcxo, bi_tcxo_ao,
+					QCOM_SMD_RPM_MISC_CLK, 0, 19200000);
+DEFINE_CLK_SMD_RPM(sm6125, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
+DEFINE_CLK_SMD_RPM(sm6125, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
+DEFINE_CLK_SMD_RPM(sm6125, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
+DEFINE_CLK_SMD_RPM_BRANCH(sm6125, qdss_clk, qdss_a_clk,
+					QCOM_SMD_RPM_MISC_CLK, 1, 19200000);
+DEFINE_CLK_SMD_RPM(sm6125, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
+DEFINE_CLK_SMD_RPM(sm6125, ipa_clk, ipa_a_clk, QCOM_SMD_RPM_IPA_CLK, 0);
+DEFINE_CLK_SMD_RPM(sm6125, qup_clk, qup_a_clk, QCOM_SMD_RPM_QUP_CLK, 0);
+DEFINE_CLK_SMD_RPM(sm6125, mmnrt_clk, mmnrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 0);
+DEFINE_CLK_SMD_RPM(sm6125, mmrt_clk, mmrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 1);
+DEFINE_CLK_SMD_RPM(sm6125, snoc_periph_clk, snoc_periph_a_clk,
+						QCOM_SMD_RPM_BUS_CLK, 0);
+DEFINE_CLK_SMD_RPM(sm6125, snoc_lpass_clk, snoc_lpass_a_clk,
+						QCOM_SMD_RPM_BUS_CLK, 5);
+
+/* SMD_XO_BUFFER */
+DEFINE_CLK_SMD_RPM_XO_BUFFER(sm6125, ln_bb_clk1, ln_bb_clk1_a, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(sm6125, ln_bb_clk2, ln_bb_clk2_a, 2);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(sm6125, ln_bb_clk3, ln_bb_clk3_a, 3);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(sm6125, rf_clk1, rf_clk1_a, 4);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(sm6125, rf_clk2, rf_clk2_a, 5);
+
+static struct clk_smd_rpm *sm6125_clks[] = {
+	[RPM_SMD_XO_CLK_SRC] = &sm6125_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &sm6125_bi_tcxo_ao,
+	[RPM_SMD_SNOC_CLK] = &sm6125_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &sm6125_snoc_a_clk,
+	[RPM_SMD_BIMC_CLK] = &sm6125_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &sm6125_bimc_a_clk,
+	[RPM_SMD_QDSS_CLK] = &sm6125_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &sm6125_qdss_a_clk,
+	[RPM_SMD_RF_CLK1] = &sm6125_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &sm6125_rf_clk1_a,
+	[RPM_SMD_RF_CLK2] = &sm6125_rf_clk2,
+	[RPM_SMD_RF_CLK2_A] = &sm6125_rf_clk2_a,
+	[RPM_SMD_LN_BB_CLK1] = &sm6125_ln_bb_clk1,
+	[RPM_SMD_LN_BB_CLK1_A] = &sm6125_ln_bb_clk1_a,
+	[RPM_SMD_LN_BB_CLK2] = &sm6125_ln_bb_clk2,
+	[RPM_SMD_LN_BB_CLK2_A] = &sm6125_ln_bb_clk2_a,
+	[RPM_SMD_LN_BB_CLK3] = &sm6125_ln_bb_clk3,
+	[RPM_SMD_LN_BB_CLK3_A] = &sm6125_ln_bb_clk3_a,
+	[RPM_SMD_CNOC_CLK] = &sm6125_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &sm6125_cnoc_a_clk,
+	[RPM_SMD_CE1_CLK] = &sm6125_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &sm6125_ce1_a_clk,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_sm6125 = {
+	.clks = sm6125_clks,
+	.num_clks = ARRAY_SIZE(sm6125_clks),
+};
+
 static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
 	{ .compatible = "qcom,rpmcc-msm8936", .data = &rpm_clk_msm8936 },
diff --git a/include/linux/soc/qcom/smd-rpm.h b/include/linux/soc/qcom/smd-rpm.h
index f2645ec52520..b737d7e456e4 100644
--- a/include/linux/soc/qcom/smd-rpm.h
+++ b/include/linux/soc/qcom/smd-rpm.h
@@ -28,6 +28,7 @@ struct qcom_smd_rpm;
 #define QCOM_SMD_RPM_NCPA	0x6170636E
 #define QCOM_SMD_RPM_NCPB	0x6270636E
 #define QCOM_SMD_RPM_OCMEM_PWR	0x706d636f
+#define QCOM_SMD_RPM_QUP_CLK	0x00707571
 #define QCOM_SMD_RPM_QPIC_CLK	0x63697071
 #define QCOM_SMD_RPM_SMPA	0x61706d73
 #define QCOM_SMD_RPM_SMPB	0x62706d73
-- 
2.32.0

