Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F078440766D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Sep 2021 14:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235773AbhIKMPN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Sep 2021 08:15:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235757AbhIKMPL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Sep 2021 08:15:11 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 289C6C061756;
        Sat, 11 Sep 2021 05:13:58 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 1F2723F370;
        Sat, 11 Sep 2021 14:13:56 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] clk: qcom: gcc-msm8998: Move parent names and mapping below GPLLs
Date:   Sat, 11 Sep 2021 14:13:33 +0200
Message-Id: <20210911121340.261920-2-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911121340.261920-1-marijn.suijten@somainline.org>
References: <20210911121340.261920-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Prepare for a future patch where we use .hw pointers to these GPLL
clocks in the parent mapping instead of name references.  This requires
the GPLL clocks to be decared before parent_data arrays.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/clk/qcom/gcc-msm8998.c | 184 ++++++++++++++++-----------------
 1 file changed, 92 insertions(+), 92 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index 050c91af888e..a67fb9af9e0b 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -25,98 +25,6 @@
 #include "reset.h"
 #include "gdsc.h"
 
-enum {
-	P_AUD_REF_CLK,
-	P_CORE_BI_PLL_TEST_SE,
-	P_GPLL0_OUT_MAIN,
-	P_GPLL4_OUT_MAIN,
-	P_PLL0_EARLY_DIV_CLK_SRC,
-	P_SLEEP_CLK,
-	P_XO,
-};
-
-static const struct parent_map gcc_parent_map_0[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0_OUT_MAIN, 1 },
-	{ P_PLL0_EARLY_DIV_CLK_SRC, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
-};
-
-static const char * const gcc_parent_names_0[] = {
-	"xo",
-	"gpll0_out_main",
-	"gpll0_out_main",
-	"core_bi_pll_test_se",
-};
-
-static const struct parent_map gcc_parent_map_1[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0_OUT_MAIN, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
-};
-
-static const char * const gcc_parent_names_1[] = {
-	"xo",
-	"gpll0_out_main",
-	"core_bi_pll_test_se",
-};
-
-static const struct parent_map gcc_parent_map_2[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0_OUT_MAIN, 1 },
-	{ P_SLEEP_CLK, 5 },
-	{ P_PLL0_EARLY_DIV_CLK_SRC, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
-};
-
-static const char * const gcc_parent_names_2[] = {
-	"xo",
-	"gpll0_out_main",
-	"core_pi_sleep_clk",
-	"gpll0_out_main",
-	"core_bi_pll_test_se",
-};
-
-static const struct parent_map gcc_parent_map_3[] = {
-	{ P_XO, 0 },
-	{ P_SLEEP_CLK, 5 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
-};
-
-static const char * const gcc_parent_names_3[] = {
-	"xo",
-	"core_pi_sleep_clk",
-	"core_bi_pll_test_se",
-};
-
-static const struct parent_map gcc_parent_map_4[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0_OUT_MAIN, 1 },
-	{ P_GPLL4_OUT_MAIN, 5 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
-};
-
-static const char * const gcc_parent_names_4[] = {
-	"xo",
-	"gpll0_out_main",
-	"gpll4_out_main",
-	"core_bi_pll_test_se",
-};
-
-static const struct parent_map gcc_parent_map_5[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0_OUT_MAIN, 1 },
-	{ P_AUD_REF_CLK, 2 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
-};
-
-static const char * const gcc_parent_names_5[] = {
-	"xo",
-	"gpll0_out_main",
-	"aud_ref_clk",
-	"core_bi_pll_test_se",
-};
-
 static struct clk_fixed_factor xo = {
 	.mult = 1,
 	.div = 1,
@@ -438,6 +346,98 @@ static struct clk_alpha_pll_postdiv gpll4_out_test = {
 	},
 };
 
+enum {
+	P_AUD_REF_CLK,
+	P_CORE_BI_PLL_TEST_SE,
+	P_GPLL0_OUT_MAIN,
+	P_GPLL4_OUT_MAIN,
+	P_PLL0_EARLY_DIV_CLK_SRC,
+	P_SLEEP_CLK,
+	P_XO,
+};
+
+static const struct parent_map gcc_parent_map_0[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_PLL0_EARLY_DIV_CLK_SRC, 6 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const char * const gcc_parent_names_0[] = {
+	"xo",
+	"gpll0_out_main",
+	"gpll0_out_main",
+	"core_bi_pll_test_se",
+};
+
+static const struct parent_map gcc_parent_map_1[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const char * const gcc_parent_names_1[] = {
+	"xo",
+	"gpll0_out_main",
+	"core_bi_pll_test_se",
+};
+
+static const struct parent_map gcc_parent_map_2[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_SLEEP_CLK, 5 },
+	{ P_PLL0_EARLY_DIV_CLK_SRC, 6 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const char * const gcc_parent_names_2[] = {
+	"xo",
+	"gpll0_out_main",
+	"core_pi_sleep_clk",
+	"gpll0_out_main",
+	"core_bi_pll_test_se",
+};
+
+static const struct parent_map gcc_parent_map_3[] = {
+	{ P_XO, 0 },
+	{ P_SLEEP_CLK, 5 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const char * const gcc_parent_names_3[] = {
+	"xo",
+	"core_pi_sleep_clk",
+	"core_bi_pll_test_se",
+};
+
+static const struct parent_map gcc_parent_map_4[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GPLL4_OUT_MAIN, 5 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const char * const gcc_parent_names_4[] = {
+	"xo",
+	"gpll0_out_main",
+	"gpll4_out_main",
+	"core_bi_pll_test_se",
+};
+
+static const struct parent_map gcc_parent_map_5[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_AUD_REF_CLK, 2 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const char * const gcc_parent_names_5[] = {
+	"xo",
+	"gpll0_out_main",
+	"aud_ref_clk",
+	"core_bi_pll_test_se",
+};
+
 static const struct freq_tbl ftbl_blsp1_qup1_i2c_apps_clk_src[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(50000000, P_GPLL0_OUT_MAIN, 12, 0, 0),
-- 
2.33.0

