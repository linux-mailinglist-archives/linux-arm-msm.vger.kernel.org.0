Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96F8A658607
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 19:53:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233385AbiL1SxB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 13:53:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233469AbiL1Swy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 13:52:54 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64E53167F0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 10:52:52 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id n1so17302484ljg.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 10:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIBNc8xLgI3Amr1jbIBMHXVwPDchMfs+28Qj/CExQlQ=;
        b=g2i58dkd6kkZRakwlA/mKuDa3vBv0TQpuKciq562Cm97H7MMfcsg23jS2N4dJuDpPm
         5snEfXH/krBq7b/3Rj0O9gG/A3fNiRHWVtRzR2L7SgJ+ghuVkE+KZcXTDjisX/aAK2rX
         8dr5BwgsLogv2zoireOuw+CZvLKb68ZZvawFi1gl7nsDtXT1Sz5b1mJubcvhT7Pjpf5u
         WwZjhjN5lNCn3o5AaxyUGgabe+Vtk6vYQhmrFHZwIhsF5fugWh+7PNvCjCEV1ADZ2UPO
         ddakXAm2AH+P3mZjz3MsQgIAF0TzoaJ8Krwjz2ytL4Uq8m01jtuCdeb/3l83IHjl8loT
         8qBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oIBNc8xLgI3Amr1jbIBMHXVwPDchMfs+28Qj/CExQlQ=;
        b=YWwYdANkmyLLZwVjRcOVzqlI2yxeZ4DLSJoUUBrp/l/DQ8XxBRt98XGuB5LY31WMd5
         oBKNKL4sav81oNIdtLZP0EZR8y5wyd8hZY5EOmy7NStQN2nEUZ/IFmwPLwqElUgXoJ8M
         GVNc7jUP+NcSkBG9r+9WtA5WSs73J7PV4YGpQEB3CJKvpc/qCR72v9qf96NAXgdPn+j1
         VbJFhtMnGn3mPaSECe1y7US0EqWGF8vgtDc5G5r7pZxv2bWI6KgzDhFsoQ0CJPnUZ3Ff
         h7N7ilWsi34LadNLVE0wmF6a5h6oWsLO3/XP94dsjgSOpFn/DHCjrj67oQ/g5+Q+V2tn
         apvw==
X-Gm-Message-State: AFqh2koyXdcVdOAadyGzHr/rB88n9EaW7SzSBe0c09w/Z8kTCKpUspf9
        n7wBUrw2/hRKDrlfo2vywNPbWg==
X-Google-Smtp-Source: AMrXdXsyQq5T53v8A0zTCKfZhGdSlqjK2kkvvlG16bRiON2b6RtwVK0fp08FUuXe0psv5zNhrSCKsQ==
X-Received: by 2002:a2e:93c6:0:b0:27f:958a:9277 with SMTP id p6-20020a2e93c6000000b0027f958a9277mr9723337ljh.12.1672253571951;
        Wed, 28 Dec 2022 10:52:51 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s7-20020a2e83c7000000b00279d206a43bsm2031893ljh.34.2022.12.28.10.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 10:52:50 -0800 (PST)
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
Subject: [PATCH v2 13/16] clk: qcom: gcc-sm8150: get rid of test clock
Date:   Wed, 28 Dec 2022 20:52:34 +0200
Message-Id: <20221228185237.3111988-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
References: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
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

The test clock apparently it's not used by anyone upstream. Remove it.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sm8150.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
index 09cf827addab..70b067f3618c 100644
--- a/drivers/clk/qcom/gcc-sm8150.c
+++ b/drivers/clk/qcom/gcc-sm8150.c
@@ -26,7 +26,6 @@
 enum {
 	P_BI_TCXO,
 	P_AUD_REF_CLK,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_EVEN,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL7_OUT_MAIN,
@@ -117,14 +116,12 @@ static const struct parent_map gcc_parent_map_0[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parents_0[] = {
 	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_1[] = {
@@ -132,7 +129,6 @@ static const struct parent_map gcc_parent_map_1[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_SLEEP_CLK, 5 },
 	{ P_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parents_1[] = {
@@ -140,41 +136,34 @@ static const struct clk_parent_data gcc_parents_1[] = {
 	{ .hw = &gpll0.clkr.hw },
 	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
 	{ .hw = &gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_2[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_SLEEP_CLK, 5 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parents_2[] = {
 	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
 	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_3[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parents_3[] = {
 	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
 	{ .hw = &gpll0.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se"},
 };
 
 static const struct parent_map gcc_parent_map_4[] = {
 	{ P_BI_TCXO, 0 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parents_4[] = {
 	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_5[] = {
@@ -182,7 +171,6 @@ static const struct parent_map gcc_parent_map_5[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_GPLL7_OUT_MAIN, 3 },
 	{ P_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parents_5[] = {
@@ -190,7 +178,6 @@ static const struct clk_parent_data gcc_parents_5[] = {
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll7.clkr.hw },
 	{ .hw = &gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_6[] = {
@@ -198,7 +185,6 @@ static const struct parent_map gcc_parent_map_6[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_GPLL9_OUT_MAIN, 2 },
 	{ P_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parents_6[] = {
@@ -206,7 +192,6 @@ static const struct clk_parent_data gcc_parents_6[] = {
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll9.clkr.hw },
 	{ .hw = &gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_7[] = {
@@ -214,7 +199,6 @@ static const struct parent_map gcc_parent_map_7[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_AUD_REF_CLK, 2 },
 	{ P_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parents_7[] = {
@@ -222,7 +206,6 @@ static const struct clk_parent_data gcc_parents_7[] = {
 	{ .hw = &gpll0.clkr.hw },
 	{ .fw_name = "aud_ref_clk", .name = "aud_ref_clk" },
 	{ .hw = &gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct freq_tbl ftbl_gcc_cpuss_ahb_clk_src[] = {
-- 
2.39.0

