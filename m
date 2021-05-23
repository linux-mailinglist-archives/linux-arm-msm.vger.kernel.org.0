Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0771638DD26
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 May 2021 23:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231980AbhEWVRf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 May 2021 17:17:35 -0400
Received: from m-r1.th.seeweb.it ([5.144.164.170]:37317 "EHLO
        m-r1.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232001AbhEWVRf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 May 2021 17:17:35 -0400
Received: from TimeMachine.localdomain (bband-dyn255.178-41-232.t-com.sk [178.41.232.255])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id DABB520084;
        Sun, 23 May 2021 23:16:06 +0200 (CEST)
From:   Martin Botka <martin.botka@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Martin Botka <martin.botka@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH V2 5/5] rpmcc: Add support for SM6125
Date:   Sun, 23 May 2021 23:15:56 +0200
Message-Id: <20210523211556.731976-5-martin.botka@somainline.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210523211556.731976-1-martin.botka@somainline.org>
References: <20210523211556.731976-1-martin.botka@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit adds support for RPM clocks found in SM6125 SoC

Signed-off-by: Martin Botka <martin.botka@somainline.org>
---
Changes in V2:
None
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
2.31.1

