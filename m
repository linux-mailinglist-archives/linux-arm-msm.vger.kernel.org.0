Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6123664F623
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 01:24:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbiLQAYG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Dec 2022 19:24:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230194AbiLQAXL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Dec 2022 19:23:11 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4755D7CFF1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:17:38 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id q6so5856399lfm.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejXopAhmRRfTQDrdbh16bauZClOndTKd32RJWFyXEFU=;
        b=dYtsxszz6l5UcPVkjExiam2/97xRQisgIa0UB/Il4mVIiT2P252UlZw6bgMIWUFAgQ
         E1DVglMosZw037HOHu/bbpXq1nwUZ7Vplv2VAuO5gfgVqSgbUcmNY5IaJ1XufncEuv6p
         lZpuqODDXyyOceDDjEsNg0k5LoxQ9yxH9tntsg06i4SGCSmvy3avIF0UbZFNPwFsxR3I
         F80PDpxtbv79y0hsNxbX5Y60fAW0/AXxihbRuXS4Ui1L2Jgol8ojckIMJL+sGi7cVKQJ
         fhosyd63VGRs32hF9ksOqZqHebhKR+g3FuRx6dGcIxaH/zGaPPiepPlRH9iXs81wO7tY
         0o+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejXopAhmRRfTQDrdbh16bauZClOndTKd32RJWFyXEFU=;
        b=GEweP6wI/CXs7Q73dobF5lqOjPFdwi7SKwa86uDoBxnP3PtWy7XrNANASP3YyqXuiR
         R41HKGurtPShUDZSYccYuX3D5A3b+qot07Hv1btUo1AocdE8ACjZ0S8NVnfpUYMfe59M
         0FZz66kqVxaOT2i27S4CPovSQbsDqwQHNy57tYACZgVm1xL7eEeeXOKOUSyv6VIP3HgD
         Eg/mnbPA+i+Wl8WVyYXxL/FiYMrKEWSBUVP2zKdlX5hz/eh5STK27AiV3FO1zzoIJpB1
         Mv3w86dmS6q99TqakBrMerIjFUdnP6lMLJC1RjGLjjKa/F20ty2xI3C9LcNvle/F2mdR
         mKzw==
X-Gm-Message-State: ANoB5pmlAIVmAlpYjj1uQteAR80uKdeluBDcHfT9UkCb+7zSa1Eruba0
        Ur1OB7FolRPwOY3eTYy48iOEzw==
X-Google-Smtp-Source: AA0mqf50aFXRjcQx+lhAftVnc/V/OyvpBQagzqCn1VULHTJ2/UKawruwu48xa0lzZ1KO1+1z24ZiPA==
X-Received: by 2002:a05:6512:128e:b0:4a4:68b8:f4e5 with SMTP id u14-20020a056512128e00b004a468b8f4e5mr12619645lfs.43.1671236257843;
        Fri, 16 Dec 2022 16:17:37 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512325300b004b5adb59ed5sm341228lfr.297.2022.12.16.16.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 16:17:37 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH 08/15] clk: qcom: gcc-qcs404: get rid of the test clock
Date:   Sat, 17 Dec 2022 02:17:23 +0200
Message-Id: <20221217001730.540502-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The test clock isn't in the bindings and apparently it's not used by
anyone upstream.  Remove it.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 34 ----------------------------------
 1 file changed, 34 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index 5636c6524d0f..fb94c57a00af 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -22,7 +22,6 @@
 #include "reset.h"
 
 enum {
-	P_CORE_BI_PLL_TEST_SE,
 	P_DSI0_PHY_PLL_OUT_BYTECLK,
 	P_DSI0_PHY_PLL_OUT_DSICLK,
 	/* P_GPLL0_OUT_AUX, */
@@ -41,29 +40,24 @@ enum {
 static const struct parent_map gcc_parent_map_0[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_0[] = {
 	"cxo",
 	"gpll0_out_main",
-	"core_bi_pll_test_se",
 };
 
 static const char * const gcc_parent_names_ao_0[] = {
 	"cxo",
 	"gpll0_ao_out_main",
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_1[] = {
 	{ P_XO, 0 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_1[] = {
 	"cxo",
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_2[] = {
@@ -84,54 +78,46 @@ static const struct parent_map gcc_parent_map_3[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_GPLL6_OUT_AUX, 2 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_3[] = {
 	"cxo",
 	"gpll0_out_main",
 	"gpll6_out_aux",
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_4[] = {
 	{ P_XO, 0 },
 	{ P_GPLL1_OUT_MAIN, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_4[] = {
 	"cxo",
 	"gpll1_out_main",
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_5[] = {
 	{ P_XO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 1 },
 	/* { P_GPLL0_OUT_AUX, 2 }, */
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_5[] = {
 	"cxo",
 	"dsi0pllbyte",
 	/* "gpll0_out_aux", */
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_6[] = {
 	{ P_XO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 2 },
 	/* { P_GPLL0_OUT_AUX, 3 }, */
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_6[] = {
 	"cxo",
 	"dsi0pllbyte",
 	/* "gpll0_out_aux", */
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_7[] = {
@@ -140,7 +126,6 @@ static const struct parent_map gcc_parent_map_7[] = {
 	{ P_GPLL3_OUT_MAIN, 2 },
 	{ P_GPLL6_OUT_AUX, 3 },
 	/* { P_GPLL4_OUT_AUX, 4 }, */
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_7[] = {
@@ -149,19 +134,16 @@ static const char * const gcc_parent_names_7[] = {
 	"gpll3_out_main",
 	"gpll6_out_aux",
 	/* "gpll4_out_aux", */
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_8[] = {
 	{ P_XO, 0 },
 	{ P_HDMI_PHY_PLL_CLK, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_8[] = {
 	"cxo",
 	"hdmi_pll",
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_9[] = {
@@ -169,7 +151,6 @@ static const struct parent_map gcc_parent_map_9[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_DSI0_PHY_PLL_OUT_DSICLK, 2 },
 	{ P_GPLL6_OUT_AUX, 3 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_9[] = {
@@ -177,45 +158,38 @@ static const char * const gcc_parent_names_9[] = {
 	"gpll0_out_main",
 	"dsi0pll",
 	"gpll6_out_aux",
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_10[] = {
 	{ P_XO, 0 },
 	{ P_SLEEP_CLK, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_10[] = {
 	"cxo",
 	"sleep_clk",
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_11[] = {
 	{ P_XO, 0 },
 	{ P_PCIE_0_PIPE_CLK, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_11[] = {
 	"cxo",
 	"pcie_0_pipe_clk",
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_12[] = {
 	{ P_XO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
 	/* { P_GPLL0_OUT_AUX, 2 }, */
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_12[] = {
 	"cxo",
 	"dsi0pll",
 	/* "gpll0_out_aux", */
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_13[] = {
@@ -223,7 +197,6 @@ static const struct parent_map gcc_parent_map_13[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_GPLL4_OUT_MAIN, 2 },
 	{ P_GPLL6_OUT_AUX, 3 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_13[] = {
@@ -231,47 +204,40 @@ static const char * const gcc_parent_names_13[] = {
 	"gpll0_out_main",
 	"gpll4_out_main",
 	"gpll6_out_aux",
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_14[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
 	/* { P_GPLL4_OUT_AUX, 2 }, */
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_14[] = {
 	"cxo",
 	"gpll0_out_main",
 	/* "gpll4_out_aux", */
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_15[] = {
 	{ P_XO, 0 },
 	/* { P_GPLL0_OUT_AUX, 2 }, */
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_15[] = {
 	"cxo",
 	/* "gpll0_out_aux", */
-	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_16[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
 	/* { P_GPLL0_OUT_AUX, 2 }, */
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_16[] = {
 	"cxo",
 	"gpll0_out_main",
 	/* "gpll0_out_aux", */
-	"core_bi_pll_test_se",
 };
 
 static struct clk_fixed_factor cxo = {
-- 
2.35.1

