Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C052969E6A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Feb 2023 19:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231203AbjBUSAe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Feb 2023 13:00:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbjBUSAd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Feb 2023 13:00:33 -0500
X-Greylist: delayed 604 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 21 Feb 2023 10:00:30 PST
Received: from srv01.abscue.de (abscue.de [IPv6:2a03:4000:63:bf5:4817:8eff:feeb:8ac7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EAD52ED78;
        Tue, 21 Feb 2023 10:00:30 -0800 (PST)
Received: from srv01.abscue.de (localhost [127.0.0.1])
        by spamfilter.srv.local (Postfix) with ESMTP id D95D21C0070;
        Tue, 21 Feb 2023 18:50:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
Received: from fluffy-mammal.fritz.box (dslb-092-072-008-248.092.072.pools.vodafone-ip.de [92.72.8.248])
        by srv01.abscue.de (Postfix) with ESMTPSA id 707DE1C006F;
        Tue, 21 Feb 2023 18:50:26 +0100 (CET)
From:   =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Subject: [PATCH 4/4] clk: qcom: smd-rpm: Add clocks for MSM8917
Date:   Tue, 21 Feb 2023 18:49:09 +0100
Message-Id: <20230221174909.164029-5-otto.pflueger@abscue.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221174909.164029-1-otto.pflueger@abscue.de>
References: <20230221174909.164029-1-otto.pflueger@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8917 has mostly the same rpm clocks as MSM8953, but lacks RF_CLK3 and
additionally has the BIMC_GPU clock.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 drivers/clk/qcom/clk-smd-rpm.c | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index fea505876855..616f3a1bcad8 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -850,6 +850,40 @@ static const struct rpm_smd_clk_desc rpm_clk_qcs404 = {
 	.num_clks = ARRAY_SIZE(qcs404_clks),
 };
 
+static struct clk_smd_rpm *msm8917_clks[] = {
+	[RPM_SMD_XO_CLK_SRC]		= &sdm660_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC]		= &sdm660_bi_tcxo_a,
+	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK]		= &msm8916_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK]		= &msm8916_snoc_a_clk,
+	[RPM_SMD_BIMC_CLK]		= &msm8916_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK]		= &msm8916_bimc_a_clk,
+	[RPM_SMD_BIMC_GPU_CLK]		= &qcs404_bimc_gpu_clk,
+	[RPM_SMD_BIMC_GPU_A_CLK]	= &qcs404_bimc_gpu_a_clk,
+	[RPM_SMD_SYSMMNOC_CLK]		= &msm8936_sysmmnoc_clk,
+	[RPM_SMD_SYSMMNOC_A_CLK]	= &msm8936_sysmmnoc_a_clk,
+	[RPM_SMD_QDSS_CLK]		= &msm8916_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK]		= &msm8916_qdss_a_clk,
+	[RPM_SMD_BB_CLK1]		= &msm8916_bb_clk1,
+	[RPM_SMD_BB_CLK1_A]		= &msm8916_bb_clk1_a,
+	[RPM_SMD_BB_CLK2]		= &msm8916_bb_clk2,
+	[RPM_SMD_BB_CLK2_A]		= &msm8916_bb_clk2_a,
+	[RPM_SMD_RF_CLK2]		= &msm8916_rf_clk2,
+	[RPM_SMD_RF_CLK2_A]		= &msm8916_rf_clk2_a,
+	[RPM_SMD_DIV_CLK2]		= &msm8974_div_clk2,
+	[RPM_SMD_DIV_A_CLK2]		= &msm8974_div_a_clk2,
+	[RPM_SMD_BB_CLK1_PIN]		= &msm8916_bb_clk1_pin,
+	[RPM_SMD_BB_CLK1_A_PIN]		= &msm8916_bb_clk1_a_pin,
+	[RPM_SMD_BB_CLK2_PIN]		= &msm8916_bb_clk2_pin,
+	[RPM_SMD_BB_CLK2_A_PIN]		= &msm8916_bb_clk2_a_pin,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_msm8917 = {
+	.clks = msm8917_clks,
+	.num_clks = ARRAY_SIZE(msm8917_clks),
+};
+
 DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, ln_bb_clk3, ln_bb_clk3_a, 3, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk3_pin, ln_bb_clk3_a_pin, 3, 19200000);
 DEFINE_CLK_SMD_RPM(msm8998, aggre1_noc_clk, aggre1_noc_a_clk,
@@ -1223,6 +1257,7 @@ static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8226", .data = &rpm_clk_msm8974 },
 	{ .compatible = "qcom,rpmcc-msm8909", .data = &rpm_clk_msm8909 },
 	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
+	{ .compatible = "qcom,rpmcc-msm8917", .data = &rpm_clk_msm8917 },
 	{ .compatible = "qcom,rpmcc-msm8936", .data = &rpm_clk_msm8936 },
 	{ .compatible = "qcom,rpmcc-msm8953", .data = &rpm_clk_msm8953 },
 	{ .compatible = "qcom,rpmcc-msm8974", .data = &rpm_clk_msm8974 },
-- 
2.39.1
