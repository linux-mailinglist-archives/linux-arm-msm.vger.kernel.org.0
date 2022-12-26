Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C88D4655FC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Dec 2022 05:22:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231654AbiLZEWL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Dec 2022 23:22:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231600AbiLZEWC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Dec 2022 23:22:02 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7C272BE4
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 20:22:00 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id cf42so14703325lfb.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 20:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEK1xO+akKYSL/Q1yvebOP0P6T2vWjAhKb2drYFp8lQ=;
        b=hi9frgQI9uQ8+XmyeRHVKc/adCVnQzmqKtBIU39Rl6UCvWqU0tfHYSpKASVlMBd8yK
         /5iDOMxBo0LhPeBabCAxKPKkwV9MRYhRV+i8f18fSueCq8a1N88ld8ZMWr8Dtm6tZAc3
         tdxMwRmlq/P1HvaEi9vCktL2bkzUaBd3YmA24zF8lK9LwrGT34JudKnT7DsED5uRVYwH
         1lefuoNKoQ8bHIv/bLSWtgtTv3NuK29Rs2w/2b3lfiM1ifKekOK/AJjPwbtED4GabByo
         2d4lIhoLfmq2a/FG657/kGAocRwNoeip7nPGit3zE5FPVTR8HWBmzlAKqqN/7Q9inuns
         jmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TEK1xO+akKYSL/Q1yvebOP0P6T2vWjAhKb2drYFp8lQ=;
        b=1ee5Eo6/IWVPEyVxF5sbep/+NJG5UOhVJHNDq1HRbn54keY4gBGKUGVvJuXBSiFsMU
         t+Jpiqa96SPsvSWKxdf0/9fjgYusapm+J8IScelzGofK0F802n7794aEnJ8jXWaojPO2
         /3d7U9Q1zQUQdekt02YWhxkxE/T939oXzAkbQVl54ncgL+x5UmEKWg9yU1/FN/1AsUPT
         rGzyOUx2JJqhNpp38/tmpa/dtz+gQMg8o0r8C1J+lJWBHdxhMgZfudN3hjW9tO0FmVet
         e0uwqScvoo47e+a8m1LqX+pCXBVe4PHUYKLjr7mUMBbxMNilYvyOOeI5U10jDqrz4+EI
         BSNg==
X-Gm-Message-State: AFqh2koDuVMIzrbY4ekmnIX332B1ZxNbrpMTAOvV4wFQqca3cfpJz7XL
        O3w507Jf7tok9cqgmCqmVNAD8w==
X-Google-Smtp-Source: AMrXdXsye+FlQh3Q9ZtXo5HMPKdsjjzZdETxgGk7Nu7MRlpsmED0uTdvfUxl/FJcMtSJWLi2IqKqZA==
X-Received: by 2002:a05:6512:340d:b0:4b5:69f1:61b1 with SMTP id i13-20020a056512340d00b004b569f161b1mr4474472lfr.42.1672028519134;
        Sun, 25 Dec 2022 20:21:59 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o9-20020ac25e29000000b004b4b5da5f80sm1641129lfg.219.2022.12.25.20.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 20:21:58 -0800 (PST)
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
Subject: [PATCH v2 05/16] clk: qcom: gcc-qcs404: disable gpll[04]_out_aux parents
Date:   Mon, 26 Dec 2022 06:21:43 +0200
Message-Id: <20221226042154.2666748-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
References: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
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
possible to use them as parents. Remove entries for these clocks.

Note: backporting this patch to earlier kernels would also require a
previous patch which switches the gcc driver to use ARRAY_SIZE for
parent data arrays.

Fixes: 652f1813c113 ("clk: qcom: gcc: Add global clock controller driver for QCS404")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index f60a0ab42da1..507c42d7f753 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -25,11 +25,9 @@ enum {
 	P_CORE_BI_PLL_TEST_SE,
 	P_DSI0_PHY_PLL_OUT_BYTECLK,
 	P_DSI0_PHY_PLL_OUT_DSICLK,
-	P_GPLL0_OUT_AUX,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL1_OUT_MAIN,
 	P_GPLL3_OUT_MAIN,
-	P_GPLL4_OUT_AUX,
 	P_GPLL4_OUT_MAIN,
 	P_GPLL6_OUT_AUX,
 	P_HDMI_PHY_PLL_CLK,
@@ -109,28 +107,24 @@ static const char * const gcc_parent_names_4[] = {
 static const struct parent_map gcc_parent_map_5[] = {
 	{ P_XO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 1 },
-	{ P_GPLL0_OUT_AUX, 2 },
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_5[] = {
 	"cxo",
 	"dsi0pll_byteclk_src",
-	"gpll0_out_aux",
 	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_6[] = {
 	{ P_XO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 2 },
-	{ P_GPLL0_OUT_AUX, 3 },
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_6[] = {
 	"cxo",
 	"dsi0_phy_pll_out_byteclk",
-	"gpll0_out_aux",
 	"core_bi_pll_test_se",
 };
 
@@ -139,7 +133,6 @@ static const struct parent_map gcc_parent_map_7[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_GPLL3_OUT_MAIN, 2 },
 	{ P_GPLL6_OUT_AUX, 3 },
-	{ P_GPLL4_OUT_AUX, 4 },
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
@@ -148,7 +141,6 @@ static const char * const gcc_parent_names_7[] = {
 	"gpll0_out_main",
 	"gpll3_out_main",
 	"gpll6_out_aux",
-	"gpll4_out_aux",
 	"core_bi_pll_test_se",
 };
 
@@ -207,14 +199,12 @@ static const char * const gcc_parent_names_11[] = {
 static const struct parent_map gcc_parent_map_12[] = {
 	{ P_XO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
-	{ P_GPLL0_OUT_AUX, 2 },
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_12[] = {
 	"cxo",
 	"dsi0pll_pclk_src",
-	"gpll0_out_aux",
 	"core_bi_pll_test_se",
 };
 
@@ -237,40 +227,34 @@ static const char * const gcc_parent_names_13[] = {
 static const struct parent_map gcc_parent_map_14[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
-	{ P_GPLL4_OUT_AUX, 2 },
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_14[] = {
 	"cxo",
 	"gpll0_out_main",
-	"gpll4_out_aux",
 	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_15[] = {
 	{ P_XO, 0 },
-	{ P_GPLL0_OUT_AUX, 2 },
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_15[] = {
 	"cxo",
-	"gpll0_out_aux",
 	"core_bi_pll_test_se",
 };
 
 static const struct parent_map gcc_parent_map_16[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
-	{ P_GPLL0_OUT_AUX, 2 },
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const gcc_parent_names_16[] = {
 	"cxo",
 	"gpll0_out_main",
-	"gpll0_out_aux",
 	"core_bi_pll_test_se",
 };
 
-- 
2.35.1

