Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE483099A2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Jan 2021 02:31:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232139AbhAaBbM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 20:31:12 -0500
Received: from m-r2.th.seeweb.it ([5.144.164.171]:56191 "EHLO
        m-r2.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbhAaBbM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jan 2021 20:31:12 -0500
Received: from localhost.localdomain (abaf219.neoplus.adsl.tpnet.pl [83.6.169.219])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 139BD3F284;
        Sun, 31 Jan 2021 02:30:14 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: smd-rpm: Add mdm9607 clocks
Date:   Sun, 31 Jan 2021 02:30:09 +0100
Message-Id: <20210131013009.54177-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for RPM-managed clocks on the MDM9607 platform.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../devicetree/bindings/clock/qcom,rpmcc.txt  |  1 +
 drivers/clk/qcom/clk-smd-rpm.c                | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
index b44a0622fb3a..5ac207d4b8ab 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -10,6 +10,7 @@ Required properties :
 - compatible : shall contain only one of the following. The generic
                compatible "qcom,rpmcc" should be also included.
 
+			"qcom,rpmcc-mdm9607", "qcom,rpmcc"
 			"qcom,rpmcc-msm8660", "qcom,rpmcc"
 			"qcom,rpmcc-apq8060", "qcom,rpmcc"
 			"qcom,rpmcc-msm8916", "qcom,rpmcc"
diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 0e1dfa89489e..ceea50bae8f8 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -406,6 +406,37 @@ static const struct clk_ops clk_smd_rpm_branch_ops = {
 	.unprepare	= clk_smd_rpm_unprepare,
 };
 
+/* mdm9607 */
+DEFINE_CLK_SMD_RPM_BRANCH(mdm9607, xo_clk_src, xo_a_clk_src, QCOM_SMD_RPM_MISC_CLK, 0,
+								19200000);
+DEFINE_CLK_SMD_RPM(mdm9607, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
+DEFINE_CLK_SMD_RPM(mdm9607, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
+DEFINE_CLK_SMD_RPM(mdm9607, qpic_clk, qpic_a_clk, QCOM_SMD_RPM_QPIC_CLK, 0);
+DEFINE_CLK_SMD_RPM_QDSS(mdm9607, qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_CLK, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(mdm9607, bb_clk1, bb_clk1_a, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(mdm9607, bb_clk1_pin, bb_clk1_a_pin, 1);
+static struct clk_smd_rpm *mdm9607_clks[] = {
+	[RPM_SMD_XO_CLK_SRC]	= &mdm9607_xo_clk_src,
+	[RPM_SMD_XO_A_CLK_SRC]	= &mdm9607_xo_a_clk_src,
+	[RPM_SMD_PCNOC_CLK]		= &mdm9607_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK]		= &mdm9607_pcnoc_a_clk,
+	[RPM_SMD_BIMC_CLK]		= &mdm9607_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK]		= &mdm9607_bimc_a_clk,
+	[RPM_SMD_QPIC_CLK]		= &mdm9607_qpic_clk,
+	[RPM_SMD_QPIC_CLK_A]		= &mdm9607_qpic_a_clk,
+	[RPM_SMD_QDSS_CLK]		= &mdm9607_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK]		= &mdm9607_qdss_a_clk,
+	[RPM_SMD_BB_CLK1]		= &mdm9607_bb_clk1,
+	[RPM_SMD_BB_CLK1_A]		= &mdm9607_bb_clk1_a,
+	[RPM_SMD_BB_CLK1_PIN]		= &mdm9607_bb_clk1_pin,
+	[RPM_SMD_BB_CLK1_A_PIN]		= &mdm9607_bb_clk1_a_pin,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_mdm9607 = {
+	.clks = mdm9607_clks,
+	.num_clks = ARRAY_SIZE(mdm9607_clks),
+};
+
 /* msm8916 */
 DEFINE_CLK_SMD_RPM(msm8916, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
 DEFINE_CLK_SMD_RPM(msm8916, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
@@ -1060,6 +1091,7 @@ static const struct rpm_smd_clk_desc rpm_clk_sdm660 = {
 };
 
 static const struct of_device_id rpm_smd_clk_match_table[] = {
+	{ .compatible = "qcom,rpmcc-mdm9607", .data = &rpm_clk_mdm9607 },
 	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
 	{ .compatible = "qcom,rpmcc-msm8936", .data = &rpm_clk_msm8936 },
 	{ .compatible = "qcom,rpmcc-msm8974", .data = &rpm_clk_msm8974 },
-- 
2.30.0

