Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED641F8187
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2020 09:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbgFMH2N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Jun 2020 03:28:13 -0400
Received: from relay-1.mailobj.net ([213.182.54.6]:41347 "EHLO
        relay-1.mailobj.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgFMH2N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Jun 2020 03:28:13 -0400
Received: from v-1.localdomain (v-1.in.mailobj.net [192.168.90.191])
        by relay-1.mailobj.net (Postfix) with SMTP id D8B441313;
        Sat, 13 Jun 2020 09:28:10 +0200 (CEST)
Received: by ip-25.net-c.com [213.182.54.25] with ESMTP
        Sat, 13 Jun 2020 09:29:06 +0200 (CEST)
X-EA-Auth: GFlNqPOnryBWWPR9yRGa9FR7SvNUqCx0XlDq0JoL5wztFgxm55OQ3G6WRVfQPTMXVwU7+Mvd5eDbRteJooM3b1T4GWggjMrvImGSxNsn8aM=
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     sboyd@kernel.org
Cc:     konradybcio@gmail.com, Vincent Knecht <vincent.knecht@mailoo.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/4] clk: qcom: smd: Add support for MSM8936 rpm clocks
Date:   Sat, 13 Jun 2020 09:27:42 +0200
Message-Id: <20200613072745.1249003-2-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200613072745.1249003-1-vincent.knecht@mailoo.org>
References: <20200613072745.1249003-1-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add missing definition of rpm clk for msm8936 soc (also used by msm8939)

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 drivers/clk/qcom/clk-smd-rpm.c         | 50 ++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,rpmcc.h |  2 ++
 2 files changed, 52 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 52f63ad787ba..de42f012af57 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -452,6 +452,55 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8916 = {
 	.num_clks = ARRAY_SIZE(msm8916_clks),
 };
 
+/* msm8936 */
+DEFINE_CLK_SMD_RPM(msm8936, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
+DEFINE_CLK_SMD_RPM(msm8936, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
+DEFINE_CLK_SMD_RPM(msm8936, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
+DEFINE_CLK_SMD_RPM(msm8936, sysmmnoc_clk, sysmmnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
+DEFINE_CLK_SMD_RPM_QDSS(msm8936, qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_CLK, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8936, bb_clk1, bb_clk1_a, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8936, bb_clk2, bb_clk2_a, 2);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8936, rf_clk1, rf_clk1_a, 4);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8936, rf_clk2, rf_clk2_a, 5);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8936, bb_clk1_pin, bb_clk1_a_pin, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8936, bb_clk2_pin, bb_clk2_a_pin, 2);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8936, rf_clk1_pin, rf_clk1_a_pin, 4);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8936, rf_clk2_pin, rf_clk2_a_pin, 5);
+
+static struct clk_smd_rpm *msm8936_clks[] = {
+	[RPM_SMD_PCNOC_CLK]		= &msm8936_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK]		= &msm8936_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK]		= &msm8936_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK]		= &msm8936_snoc_a_clk,
+	[RPM_SMD_BIMC_CLK]		= &msm8936_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK]		= &msm8936_bimc_a_clk,
+	[RPM_SMD_SYSMMNOC_CLK]		= &msm8936_sysmmnoc_clk,
+	[RPM_SMD_SYSMMNOC_A_CLK]	= &msm8936_sysmmnoc_a_clk,
+	[RPM_SMD_QDSS_CLK]		= &msm8936_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK]		= &msm8936_qdss_a_clk,
+	[RPM_SMD_BB_CLK1]		= &msm8936_bb_clk1,
+	[RPM_SMD_BB_CLK1_A]		= &msm8936_bb_clk1_a,
+	[RPM_SMD_BB_CLK2]		= &msm8936_bb_clk2,
+	[RPM_SMD_BB_CLK2_A]		= &msm8936_bb_clk2_a,
+	[RPM_SMD_RF_CLK1]		= &msm8936_rf_clk1,
+	[RPM_SMD_RF_CLK1_A]		= &msm8936_rf_clk1_a,
+	[RPM_SMD_RF_CLK2]		= &msm8936_rf_clk2,
+	[RPM_SMD_RF_CLK2_A]		= &msm8936_rf_clk2_a,
+	[RPM_SMD_BB_CLK1_PIN]		= &msm8936_bb_clk1_pin,
+	[RPM_SMD_BB_CLK1_A_PIN]		= &msm8936_bb_clk1_a_pin,
+	[RPM_SMD_BB_CLK2_PIN]		= &msm8936_bb_clk2_pin,
+	[RPM_SMD_BB_CLK2_A_PIN]		= &msm8936_bb_clk2_a_pin,
+	[RPM_SMD_RF_CLK1_PIN]		= &msm8936_rf_clk1_pin,
+	[RPM_SMD_RF_CLK1_A_PIN]		= &msm8936_rf_clk1_a_pin,
+	[RPM_SMD_RF_CLK2_PIN]		= &msm8936_rf_clk2_pin,
+	[RPM_SMD_RF_CLK2_A_PIN]		= &msm8936_rf_clk2_a_pin,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_msm8936 = {
+		.clks = msm8936_clks,
+		.num_clks = ARRAY_SIZE(msm8936_clks),
+};
+
 /* msm8974 */
 DEFINE_CLK_SMD_RPM(msm8974, pnoc_clk, pnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
 DEFINE_CLK_SMD_RPM(msm8974, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
@@ -768,6 +817,7 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8998 = {
 
 static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
+	{ .compatible = "qcom,rpmcc-msm8936", .data = &rpm_clk_msm8936 },
 	{ .compatible = "qcom,rpmcc-msm8974", .data = &rpm_clk_msm8974 },
 	{ .compatible = "qcom,rpmcc-msm8976", .data = &rpm_clk_msm8976 },
 	{ .compatible = "qcom,rpmcc-msm8996", .data = &rpm_clk_msm8996 },
diff --git a/include/dt-bindings/clock/qcom,rpmcc.h b/include/dt-bindings/clock/qcom,rpmcc.h
index ae74c43c485d..4a0238ccf9f2 100644
--- a/include/dt-bindings/clock/qcom,rpmcc.h
+++ b/include/dt-bindings/clock/qcom,rpmcc.h
@@ -133,5 +133,7 @@
 #define RPM_SMD_RF_CLK3_A			87
 #define RPM_SMD_RF_CLK3_PIN			88
 #define RPM_SMD_RF_CLK3_A_PIN			89
+#define RPM_SMD_SYSMMNOC_CLK			90
+#define RPM_SMD_SYSMMNOC_A_CLK			91
 
 #endif
-- 
2.25.4


