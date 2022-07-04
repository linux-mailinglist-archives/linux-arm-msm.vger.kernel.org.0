Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1B35565762
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 15:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234964AbiGDNdA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 09:33:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234918AbiGDNcZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 09:32:25 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A43D112AC2;
        Mon,  4 Jul 2022 06:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=JAH+8uIyGXaoyytv44HR9oezm9e5Wx1rOVY/LK5cjIk=; b=LkXgyh05OjnzRAO38Lde+9E5IH
        ajV21EtMP3XVOuq5qyYmklRSaaKpDTBAZgQuESNI0ujkz7KE+QHzOgP9AvnTSAVPbpsMSmcXqo7gL
        PMS+HxFTI58eoXO68eOlaoAN11AXsEj1F+Uh0CjHU1eS0BYIVfDhW87lg0rSwnMUTq9VdLo1qk7ue
        LQYgZ1pCL48kLTg5OXtAOrnWmA8CkLKgovabNsadiFd5X4kLnobpcrj23pd9+Y+5hWoOfbElZRGif
        4FpntrYqIS8QFGxkvK+uaf4zYmfvBAjkaS8sDHCbJYcjHIEi35yudooTrWR+kueSw3l64dfIvGES5
        hcot6S/w==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1o8M9m-0074oF-Nv; Mon, 04 Jul 2022 15:30:30 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH 6/6] clk: qcom: smd-rpm: Add clocks for MSM8909
Date:   Mon,  4 Jul 2022 15:30:00 +0200
Message-Id: <20220704133000.2768380-7-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220704133000.2768380-1-stephan.gerhold@kernkonzept.com>
References: <20220704133000.2768380-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8909 has mostly the same as clocks in RPM as MSM8916,
but additionally the QPIC clock for the NAND flash controller.

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
 drivers/clk/qcom/clk-smd-rpm.c | 37 +++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 10b4e6d8d10f..56096123081c 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -417,6 +417,7 @@ DEFINE_CLK_SMD_RPM_BRANCH(sdm660, bi_tcxo, bi_tcxo_a, QCOM_SMD_RPM_MISC_CLK, 0,
 DEFINE_CLK_SMD_RPM(msm8916, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
 DEFINE_CLK_SMD_RPM(msm8916, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
 DEFINE_CLK_SMD_RPM(msm8916, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
+DEFINE_CLK_SMD_RPM(qcs404, qpic_clk, qpic_a_clk, QCOM_SMD_RPM_QPIC_CLK, 0);
 DEFINE_CLK_SMD_RPM_QDSS(msm8916, qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_CLK, 1);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8916, bb_clk1, bb_clk1_a, 1, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8916, bb_clk2, bb_clk2_a, 2, 19200000);
@@ -427,6 +428,40 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk2_pin, bb_clk2_a_pin, 2, 192
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk1_pin, rf_clk1_a_pin, 4, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk2_pin, rf_clk2_a_pin, 5, 19200000);
 
+static struct clk_smd_rpm *msm8909_clks[] = {
+	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK]		= &msm8916_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK]		= &msm8916_snoc_a_clk,
+	[RPM_SMD_BIMC_CLK]		= &msm8916_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK]		= &msm8916_bimc_a_clk,
+	[RPM_SMD_QPIC_CLK]		= &qcs404_qpic_clk,
+	[RPM_SMD_QPIC_CLK_A]		= &qcs404_qpic_a_clk,
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
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_msm8909 = {
+	.clks = msm8909_clks,
+	.num_clks = ARRAY_SIZE(msm8909_clks),
+};
+
 static struct clk_smd_rpm *msm8916_clks[] = {
 	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
 	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
@@ -787,7 +822,6 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8996 = {
 };
 
 DEFINE_CLK_SMD_RPM(qcs404, bimc_gpu_clk, bimc_gpu_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
-DEFINE_CLK_SMD_RPM(qcs404, qpic_clk, qpic_a_clk, QCOM_SMD_RPM_QPIC_CLK, 0);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk_pin, ln_bb_clk_a_pin, 8, 19200000);
 
 static struct clk_smd_rpm *qcs404_clks[] = {
@@ -1146,6 +1180,7 @@ static const struct rpm_smd_clk_desc rpm_clk_qcm2290 = {
 static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-mdm9607", .data = &rpm_clk_mdm9607 },
 	{ .compatible = "qcom,rpmcc-msm8226", .data = &rpm_clk_msm8974 },
+	{ .compatible = "qcom,rpmcc-msm8909", .data = &rpm_clk_msm8909 },
 	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
 	{ .compatible = "qcom,rpmcc-msm8936", .data = &rpm_clk_msm8936 },
 	{ .compatible = "qcom,rpmcc-msm8953", .data = &rpm_clk_msm8953 },
-- 
2.30.2

