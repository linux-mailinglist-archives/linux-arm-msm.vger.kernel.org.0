Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C12BB64F618
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 01:24:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231307AbiLQAYE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Dec 2022 19:24:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbiLQAXK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Dec 2022 19:23:10 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AD6B7E290
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:17:37 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id cf42so5926853lfb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLCQS/qyadMYzhZe+WKwfd/qeqY2NB2bw2gUTzVHsiQ=;
        b=QX2FeG8BeCiqCtwIDLu55mL1M+frzyUA0axYrr9KmN65jxE9IYkeGq8bpG4tOYJfw3
         uJ9rcNUeByW81vRO15l5slE2bnO6NdMXEjNkPsYHjKsNXFqJewOIYvTsLYfhUbw7hN1N
         AaemDDgiRIHG/pXn/gsCpprD1at+1nNWstafAm1jNwo1z6GZdGr66XT1eMF5e74Is/1g
         uQKekWKCnn2ysdp57mYt1LdKRcJXq6yViFwTAIyjVUWLle+atg0S1yiu/1sTsljN5bDC
         LYUj2j3WGdofQXk1g0vhJBcWllfVsyzH6//408p6LLHan2OHsRoGUwOFgkbQEiPyMjb4
         FB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xLCQS/qyadMYzhZe+WKwfd/qeqY2NB2bw2gUTzVHsiQ=;
        b=InoiM9l4npK/QRZzFEpuqU5Hx3rnt2DCp5AC9ZoLeqAnWik3fjmmbx0KbDdfISeYky
         LjNxNSPCBUe8/uSY5/WZD4b3MwAu1jm/zGhp16A73YAY5yXCDnR67A4Y7piJKnv9Uufr
         +U0i8DlQIbqm3dq0xW0GiU3TLqQ3WgreGFxusov+eTK7uVffEaIXLogCKobbWMr3nqVK
         wYK+gLW0Seig5tkzWeczDii/DBqDGj9t9sSIZ1jUMXAeK5HdL34mvtU1l4vHRai5gE7F
         rtnE7TZR+tqdX7avOeQfeot1KWIwzv7DZLwdUBEvVInxBhg53XA+AyU/lhgOonDbY+bm
         rFBw==
X-Gm-Message-State: ANoB5plEMIY1hkIRlqX5dvnqxh4wBCMMzP+DkHlfw2RFVIprm7AwHM/l
        mSIWa0ZV7I6Bi5ujaI4ykA/VUA==
X-Google-Smtp-Source: AA0mqf7sa4XimbTgeL+8mE5buOGeTVE1zuqMf1oaozBa6trF7N2S29zZTYSgJyGo0f8utIBkJOOaPA==
X-Received: by 2002:a05:6512:790:b0:4b5:9b8f:cc82 with SMTP id x16-20020a056512079000b004b59b8fcc82mr8396473lfr.0.1671236255382;
        Fri, 16 Dec 2022 16:17:35 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512325300b004b5adb59ed5sm341228lfr.297.2022.12.16.16.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 16:17:35 -0800 (PST)
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
        devicetree@vger.kernel.org
Subject: [PATCH 05/15] clk: qcom: gcc-qcs404: disable gpll[04]_out_aux parents
Date:   Sat, 17 Dec 2022 02:17:20 +0200
Message-Id: <20221217001730.540502-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On the QCS404 platform the driver for the Global Clock Controller
doens't define gpll0_out_aux and gpll4_out_aux clocks, so it's not
possible to use them as parents. Comment out entries for these clocks.

Note: backporting this patch to earlier kernels would also require a
previous patch which switches the gcc driver to use ARRAY_SIZE for
parent data arrays.

Fixes: 652f1813c113 ("clk: qcom: gcc: Add global clock controller driver for QCS404")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index f60a0ab42da1..c48326da1bb3 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -25,11 +25,11 @@ enum {
 	P_CORE_BI_PLL_TEST_SE,
 	P_DSI0_PHY_PLL_OUT_BYTECLK,
 	P_DSI0_PHY_PLL_OUT_DSICLK,
-	P_GPLL0_OUT_AUX,
+	/* P_GPLL0_OUT_AUX, */
 	P_GPLL0_OUT_MAIN,
 	P_GPLL1_OUT_MAIN,
 	P_GPLL3_OUT_MAIN,
-	P_GPLL4_OUT_AUX,
+	/* P_GPLL4_OUT_AUX, */
 	P_GPLL4_OUT_MAIN,
 	P_GPLL6_OUT_AUX,
 	P_HDMI_PHY_PLL_CLK,
@@ -109,28 +109,28 @@ static const char * const gcc_parent_names_4[] = {
 static const struct parent_map gcc_parent_map_5[] = {
 	{ P_XO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 1 },
-	{ P_GPLL0_OUT_AUX, 2 },
+	/* { P_GPLL0_OUT_AUX, 2 }, */
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_5[] = {
 	"cxo",
 	"dsi0pll_byteclk_src",
-	"gpll0_out_aux",
+	/* "gpll0_out_aux", */
 	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_6[] = {
 	{ P_XO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 2 },
-	{ P_GPLL0_OUT_AUX, 3 },
+	/* { P_GPLL0_OUT_AUX, 3 }, */
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_6[] = {
 	"cxo",
 	"dsi0_phy_pll_out_byteclk",
-	"gpll0_out_aux",
+	/* "gpll0_out_aux", */
 	"core_bi_pll_test_se",
 };
 
@@ -139,7 +139,7 @@ static const struct parent_map gcc_parent_map_7[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_GPLL3_OUT_MAIN, 2 },
 	{ P_GPLL6_OUT_AUX, 3 },
-	{ P_GPLL4_OUT_AUX, 4 },
+	/* { P_GPLL4_OUT_AUX, 4 }, */
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
@@ -148,7 +148,7 @@ static const char * const gcc_parent_names_7[] = {
 	"gpll0_out_main",
 	"gpll3_out_main",
 	"gpll6_out_aux",
-	"gpll4_out_aux",
+	/* "gpll4_out_aux", */
 	"core_bi_pll_test_se",
 };
 
@@ -207,14 +207,14 @@ static const char * const gcc_parent_names_11[] = {
 static const struct parent_map gcc_parent_map_12[] = {
 	{ P_XO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
-	{ P_GPLL0_OUT_AUX, 2 },
+	/* { P_GPLL0_OUT_AUX, 2 }, */
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_12[] = {
 	"cxo",
 	"dsi0pll_pclk_src",
-	"gpll0_out_aux",
+	/* "gpll0_out_aux", */
 	"core_bi_pll_test_se",
 };
 
@@ -237,40 +237,40 @@ static const char * const gcc_parent_names_13[] = {
 static const struct parent_map gcc_parent_map_14[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
-	{ P_GPLL4_OUT_AUX, 2 },
+	/* { P_GPLL4_OUT_AUX, 2 }, */
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_14[] = {
 	"cxo",
 	"gpll0_out_main",
-	"gpll4_out_aux",
+	/* "gpll4_out_aux", */
 	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_15[] = {
 	{ P_XO, 0 },
-	{ P_GPLL0_OUT_AUX, 2 },
+	/* { P_GPLL0_OUT_AUX, 2 }, */
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_15[] = {
 	"cxo",
-	"gpll0_out_aux",
+	/* "gpll0_out_aux", */
 	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_16[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
-	{ P_GPLL0_OUT_AUX, 2 },
+	/* { P_GPLL0_OUT_AUX, 2 }, */
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_16[] = {
 	"cxo",
 	"gpll0_out_main",
-	"gpll0_out_aux",
+	/* "gpll0_out_aux", */
 	"core_bi_pll_test_se",
 };
 
-- 
2.35.1

