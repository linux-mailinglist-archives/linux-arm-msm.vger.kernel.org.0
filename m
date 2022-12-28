Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BCDA658606
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 19:53:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233461AbiL1SxA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 13:53:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233385AbiL1Swx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 13:52:53 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B049164BC
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 10:52:52 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id s22so17286523ljp.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 10:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kdQAMnh63PaWD5/+7s5BV5ovGeilMdJHKHyFR79zsiM=;
        b=KkHsajX8RQNmnhv+eGR6qR60UpMmG7LkZYmx/h6yHfcTliHu+jYrQ+JCmHI6MDaCof
         Md+U8Od0lPGyS5FWBuPvPETxEDoqEfhbz3TUb/dof7tjNc6SOwSfbnXpXQHTC99NwGyg
         lcoxQ7E4pWtEmzPsQgg/eyL6XS6vG4Ffu1cr+LdIb9XhCfYIVD4OvQqgTjkAw5aasjMu
         fJaIlrIy9mr6VyxbMI6Uj6kw2vMEkTcZqkY8XXXhnITdgJxVGaLClS+Ty8dPlZ+FLlBu
         bSdeCdOnsdLzVogtdVsF63E9OZU/3WDxs3/rkwoyZa/Ugi4tvGnuGNQA7cfmk4BVaBfu
         0sNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kdQAMnh63PaWD5/+7s5BV5ovGeilMdJHKHyFR79zsiM=;
        b=aOjRZrGrTNF596mKuwQGs0o6pXLVXEVk/3LztBm561V3/I2Wom9TypdumpMyv4XRbt
         fOfHAAyoC3SVfePic/Q1rWaRke5gTMdrxwLT1wT175MR7e/JwnQjMZnb5/69ZdM/xZv8
         aFRC889v4VSX3eLY5ELRccIyCbsDfwkL6BThrQd2sW04FLiLQeYUeNo78sA6grHrMEmK
         Doutm99IRJJ05rl1h5zFMzrTIyu8/CwaZhHQ2iOjv60fzO5EBQenJZOxdhmSe8j/k2V2
         /Fg4tzp0Wl8V/+775oKO32vi94IQkYMIglSAHoiUNt88Tg+2x0T1dIIYj0YtAUvUJd9R
         Kh3w==
X-Gm-Message-State: AFqh2kpG4ZkmpGlARUAilevbwJLdMv9CpxJNga0uLwtOYQKLctKtL3Sg
        9U/85YVZvsMZxVLFG9WFYpPqmA==
X-Google-Smtp-Source: AMrXdXu9vSa2shUdNPmLG1puC4czJuUEpTi1c+BaaQOyCp5JQGOl/yEtitNMb7NmNsRxRq/pWRDqIA==
X-Received: by 2002:a2e:9f0c:0:b0:27f:c18f:f864 with SMTP id u12-20020a2e9f0c000000b0027fc18ff864mr2409521ljk.18.1672253570490;
        Wed, 28 Dec 2022 10:52:50 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s7-20020a2e83c7000000b00279d206a43bsm2031893ljh.34.2022.12.28.10.52.49
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
Subject: [PATCH v2 12/16] clk: qcom: gcc-sdx55: get rid of test clock
Date:   Wed, 28 Dec 2022 20:52:33 +0200
Message-Id: <20221228185237.3111988-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
References: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
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

The test clock apparently it's not used by anyone upstream. Remove it.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sdx55.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdx55.c b/drivers/clk/qcom/gcc-sdx55.c
index 758b295e1bfa..d5e17122698c 100644
--- a/drivers/clk/qcom/gcc-sdx55.c
+++ b/drivers/clk/qcom/gcc-sdx55.c
@@ -22,7 +22,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_EVEN,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL4_OUT_EVEN,
@@ -137,21 +136,18 @@ static const struct parent_map gcc_parent_map_0[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parents_0[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct clk_parent_data gcc_parents_0_ao[] = {
 	{ .fw_name = "bi_tcxo_ao" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_2[] = {
@@ -160,7 +156,6 @@ static const struct parent_map gcc_parent_map_2[] = {
 	{ P_GPLL4_OUT_EVEN, 2 },
 	{ P_GPLL5_OUT_MAIN, 5 },
 	{ P_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parents_2[] = {
@@ -169,7 +164,6 @@ static const struct clk_parent_data gcc_parents_2[] = {
 	{ .hw = &gpll4_out_even.clkr.hw },
 	{ .hw = &gpll5.clkr.hw },
 	{ .hw = &gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_3[] = {
@@ -177,7 +171,6 @@ static const struct parent_map gcc_parent_map_3[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_SLEEP_CLK, 5 },
 	{ P_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parents_3[] = {
@@ -185,19 +178,16 @@ static const struct clk_parent_data gcc_parents_3[] = {
 	{ .hw = &gpll0.clkr.hw },
 	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
 	{ .hw = &gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_4[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_SLEEP_CLK, 5 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parents_4[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_5[] = {
@@ -205,7 +195,6 @@ static const struct parent_map gcc_parent_map_5[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 	{ P_GPLL4_OUT_EVEN, 2 },
 	{ P_GPLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gcc_parents_5[] = {
@@ -213,7 +202,6 @@ static const struct clk_parent_data gcc_parents_5[] = {
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll4_out_even.clkr.hw },
 	{ .hw = &gpll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct freq_tbl ftbl_gcc_blsp1_qup1_i2c_apps_clk_src[] = {
-- 
2.39.0

