Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E01A1C4168
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2019 21:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbfJAT5b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 15:57:31 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:57724 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbfJAT5a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 15:57:30 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 48A89611C5; Tue,  1 Oct 2019 19:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569959849;
        bh=+ZJ/mSmeVsMDaMkt+foa0DQlJjtEHl62xCEB0w0PsNA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QebufrxukOO7aQPDO3jyxUd8MTqMnoqPXAXrp0xicuO/m9K5nWLVNCP8yQeLK3K/N
         77V432aN18OCTEM15VTsI0FDeQwhcVjGfZt8Av5L7T4PyCj6UsxYCZsV08hHtZCY3R
         mBfy8iRuqwGXEvmkg89idWvF6xLB8XJsLzN3q2mg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jhugo-perf-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DAF8C60A4E;
        Tue,  1 Oct 2019 19:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569959838;
        bh=+ZJ/mSmeVsMDaMkt+foa0DQlJjtEHl62xCEB0w0PsNA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VuJuSh1MXil7vmIQzb5wVmZRAKLAXG5oGN11VobRTWfhpbI4em/3HkQFzXoUelODd
         /XVt1Lp3jJ0IZFUzsIWZvTZ/maO9mpl/SNMySmIe2ujq/8r01xwqVwup5cKkTeq/EP
         v1Znkn/AxLTRcu8IP0ck4NC9infDwiW7LFwMDMi0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DAF8C60A4E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     sboyd@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, mturquette@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v6 3/6] clk: qcom: smd: Add XO clock for MSM8998
Date:   Tue,  1 Oct 2019 13:57:08 -0600
Message-Id: <1569959828-8357-1-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1569959656-5202-1-git-send-email-jhugo@codeaurora.org>
References: <1569959656-5202-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The XO clock generally feeds into other clock controllers as the parent
for a lot of clock generators.

Drop the "fake" XO clock in GCC now that it is redundant can will cause a
namespace conflict.  Also enumerate the RPMCC dependency of GCC in Kconfig.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/Kconfig       |  1 +
 drivers/clk/qcom/clk-smd-rpm.c | 24 ++++++++++++++++++++----
 drivers/clk/qcom/gcc-msm8998.c | 29 ++++++++++++-----------------
 3 files changed, 33 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 32dbb4f09492..9675cd067cf7 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -215,6 +215,7 @@ config MSM_MMCC_8996
 config MSM_GCC_8998
 	tristate "MSM8998 Global Clock Controller"
 	select QCOM_GDSC
+	select QCOM_CLK_SMD_RPM
 	help
 	  Support for the global clock controller on msm8998 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index fef5e8157061..919849848056 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -60,7 +60,7 @@
 	}
 
 #define __DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, r_id,    \
-				    stat_id, r, key)			      \
+				    stat_id, r, key, ignore_unused)			      \
 	static struct clk_smd_rpm _platform##_##_active;		      \
 	static struct clk_smd_rpm _platform##_##_name = {		      \
 		.rpm_res_type = (type),					      \
@@ -75,6 +75,7 @@
 			.name = #_name,					      \
 			.parent_names = (const char *[]){ "xo_board" },	      \
 			.num_parents = 1,				      \
+			.flags = (ignore_unused) ? CLK_IGNORE_UNUSED : 0,     \
 		},							      \
 	};								      \
 	static struct clk_smd_rpm _platform##_##_active = {		      \
@@ -91,6 +92,7 @@
 			.name = #_active,				      \
 			.parent_names = (const char *[]){ "xo_board" },	      \
 			.num_parents = 1,				      \
+			.flags = (ignore_unused) ? CLK_IGNORE_UNUSED : 0,     \
 		},							      \
 	}
 
@@ -100,7 +102,17 @@
 
 #define DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, r_id, r)   \
 		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type,  \
-		r_id, 0, r, QCOM_RPM_SMD_KEY_ENABLE)
+		r_id, 0, r, QCOM_RPM_SMD_KEY_ENABLE, false)
+
+/*
+ * Intended for XO clock where we don't want it turned off during late init
+ * if we don't have a consumer by then, but can turn it off later for deep
+ * sleep
+ */
+#define DEFINE_CLK_SMD_RPM_BRANCH_SKIP_UNUSED(_platform, _name, _active, type,\
+					      r_id, r)			      \
+		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type,  \
+		r_id, 0, r, QCOM_RPM_SMD_KEY_ENABLE, true)
 
 #define DEFINE_CLK_SMD_RPM_QDSS(_platform, _name, _active, type, r_id)	      \
 		__DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id,   \
@@ -109,12 +121,12 @@
 #define DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, _active, r_id)	      \
 		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active,	      \
 		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, 1000,			      \
-		QCOM_RPM_KEY_SOFTWARE_ENABLE)
+		QCOM_RPM_KEY_SOFTWARE_ENABLE, false)
 
 #define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_platform, _name, _active, r_id) \
 		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active,	      \
 		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, 1000,			      \
-		QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY)
+		QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY, false)
 
 #define to_clk_smd_rpm(_hw) container_of(_hw, struct clk_smd_rpm, hw)
 
@@ -648,6 +660,8 @@ static const struct rpm_smd_clk_desc rpm_clk_qcs404 = {
 };
 
 /* msm8998 */
+DEFINE_CLK_SMD_RPM_BRANCH_SKIP_UNUSED(msm8998, xo, xo_a, QCOM_SMD_RPM_MISC_CLK,
+				      0, 19200000);
 DEFINE_CLK_SMD_RPM(msm8998, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
 DEFINE_CLK_SMD_RPM(msm8998, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
 DEFINE_CLK_SMD_RPM(msm8998, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
@@ -670,6 +684,8 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk2_pin, rf_clk2_a_pin, 5);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, rf_clk3, rf_clk3_a, 6);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk3_pin, rf_clk3_a_pin, 6);
 static struct clk_smd_rpm *msm8998_clks[] = {
+	[RPM_SMD_XO_CLK_SRC] = &msm8998_xo,
+	[RPM_SMD_XO_A_CLK_SRC] = &msm8998_xo_a,
 	[RPM_SMD_SNOC_CLK] = &msm8998_snoc_clk,
 	[RPM_SMD_SNOC_A_CLK] = &msm8998_snoc_a_clk,
 	[RPM_SMD_CNOC_CLK] = &msm8998_cnoc_clk,
diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index 091acd59c1d6..1651a2f47ab8 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -11,6 +11,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/clk-provider.h>
+#include <linux/clk.h>
 #include <linux/regmap.h>
 #include <linux/reset-controller.h>
 
@@ -117,17 +118,6 @@ static const char * const gcc_parent_names_5[] = {
 	"core_bi_pll_test_se",
 };
 
-static struct clk_fixed_factor xo = {
-	.mult = 1,
-	.div = 1,
-	.hw.init = &(struct clk_init_data){
-		.name = "xo",
-		.parent_names = (const char *[]){ "xo_board" },
-		.num_parents = 1,
-		.ops = &clk_fixed_factor_ops,
-	},
-};
-
 static struct pll_vco fabia_vco[] = {
 	{ 250000000, 2000000000, 0 },
 	{ 125000000, 1000000000, 1 },
@@ -2959,10 +2949,6 @@ static const struct regmap_config gcc_msm8998_regmap_config = {
 	.fast_io	= true,
 };
 
-static struct clk_hw *gcc_msm8998_hws[] = {
-	&xo.hw,
-};
-
 static const struct qcom_cc_desc gcc_msm8998_desc = {
 	.config = &gcc_msm8998_regmap_config,
 	.clks = gcc_msm8998_clocks,
@@ -2971,14 +2957,23 @@ static const struct qcom_cc_desc gcc_msm8998_desc = {
 	.num_resets = ARRAY_SIZE(gcc_msm8998_resets),
 	.gdscs = gcc_msm8998_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_msm8998_gdscs),
-	.clk_hws = gcc_msm8998_hws,
-	.num_clk_hws = ARRAY_SIZE(gcc_msm8998_hws),
 };
 
 static int gcc_msm8998_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
 	int ret;
+	struct clk *xo;
+
+	/*
+	 * We must have a valid XO to continue, otherwise having a missing
+	 * parent on a system critical clock like the uart core clock can
+	 * result in strange bugs.  We know XO will be provided by rpmcc,
+	 * but it might not be specified in DT like it should.
+	 */
+	xo = __clk_lookup("xo");
+	if (!xo)
+		return -EPROBE_DEFER;
 
 	regmap = qcom_cc_map(pdev, &gcc_msm8998_desc);
 	if (IS_ERR(regmap))
-- 
2.17.1

