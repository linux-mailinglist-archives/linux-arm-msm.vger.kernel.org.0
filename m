Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D64E5EDF50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 16:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234310AbiI1O4k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 10:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234053AbiI1O4c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 10:56:32 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDF0A9C7C0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 07:56:15 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id i26so20748571lfp.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 07:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=39GIEk5AE4HmOhWZX4Z3h7uD8mWM1bB9ps8aO73UD6Q=;
        b=Mde86Z3lMxkk3JtvHNV5r8YW7RPMOd3MXIFWwqBE+Kh//ySTPB1JU8IzX6RdaIiX9W
         ppKNMrzXP2r9xL+qmPb6a6xvroLSZSev9wI3CGBw9E0NF8R4uFCx7c2WTlwpBMndPsHu
         3pH/hgKOcq+mkVpnIXLrZFkPYcSQ4w299IlnClKsTIs/5KdQTk5SW/XHgbY48fwTbWeI
         +h1+QjW77Na/QbWQpaHIrHrSLrpNKSwiwiurIsNPTioDiEcxigfpwYHk0qqS+rCYC4hg
         Ol78Q6Lgt8PjIpHb58Rg7ZC4PjiE7FNYUuHqw9jJSjJOTzbDAcKoarCLpTSnV52omDQ5
         XevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=39GIEk5AE4HmOhWZX4Z3h7uD8mWM1bB9ps8aO73UD6Q=;
        b=C9Qss8tzgauLt6Ejx31mKolhm/tmlWj8y5tG2TzvHAqGpsVF9lWj1nCoklvEauuxXB
         JHM1Rs+r8M6xy5tdb31Iu8ifVDOW1LbgAJNcBGd0V6dUHsVJdgFI8gjuEETlYfJYW4t3
         8eyE6VvaoLsbxqLyjr2vTB6pISu3J2MxYY6Zpb3prHzbXuwYv+Z/9v68YZmgQBKsKkU/
         HI14NaHYcInu7F0cLtW5fxYVqPmYXsbrcb2cijLoN9HBgwQ8HGHCzf2tLp5H7tj5E6vx
         DXBX4MPfAnqcvGiRDEDffQw5ZMrMpUW5+7xVeU7lJSq1sxS6VAaSK9D0EuxA8qMFm5M1
         gbog==
X-Gm-Message-State: ACrzQf1ppZwvDQs0n0bL+gU76Yo0jijdE6ZSElViWr5Igfv9sbXUNDwh
        eEEF0MsXX0OgczrQEr9UztXPOA==
X-Google-Smtp-Source: AMsMyM5tNHqPVyEOKXJMuvbSDirCLIpL8soK1PwG5tH3BSni7rcCMvEO+o7CASBvPfljaHWVauXIOw==
X-Received: by 2002:a05:6512:3f1c:b0:4a1:d76f:ff4 with SMTP id y28-20020a0565123f1c00b004a1d76f0ff4mr6565453lfa.292.1664376973107;
        Wed, 28 Sep 2022 07:56:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o6-20020a05651238a600b0048b256bb005sm498094lft.49.2022.09.28.07.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 07:56:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Subject: [PATCH 3/3] clk: qcom: gcc-msm8939: use ARRAY_SIZE instead of specifying num_parents
Date:   Wed, 28 Sep 2022 17:56:09 +0300
Message-Id: <20220928145609.375860-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928145609.375860-1-dmitry.baryshkov@linaro.org>
References: <20220928145609.375860-1-dmitry.baryshkov@linaro.org>
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

Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
adding/removing entries to/from parent_data easy and errorproof.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8939.c | 120 ++++++++++++++++-----------------
 1 file changed, 60 insertions(+), 60 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 9d4f35716990..af608f165896 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -614,7 +614,7 @@ static struct clk_rcg2 pcnoc_bfdcd_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pcnoc_bfdcd_clk_src",
 		.parent_data = gcc_xo_gpll0_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -626,7 +626,7 @@ static struct clk_rcg2 system_noc_bfdcd_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "system_noc_bfdcd_clk_src",
 		.parent_data = gcc_xo_gpll0_gpll6a_parent_data,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll6a_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -638,7 +638,7 @@ static struct clk_rcg2 bimc_ddr_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "bimc_ddr_clk_src",
 		.parent_data = gcc_xo_gpll0_bimc_parent_data,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_bimc_parent_data),
 		.ops = &clk_rcg2_ops,
 		.flags = CLK_GET_RATE_NOCACHE,
 	},
@@ -651,7 +651,7 @@ static struct clk_rcg2 system_mm_noc_bfdcd_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "system_mm_noc_bfdcd_clk_src",
 		.parent_data = gcc_xo_gpll0_gpll6a_parent_data,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll6a_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -671,7 +671,7 @@ static struct clk_rcg2 camss_ahb_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camss_ahb_clk_src",
 		.parent_data = gcc_xo_gpll0_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -692,7 +692,7 @@ static struct clk_rcg2 apss_ahb_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "apss_ahb_clk_src",
 		.parent_data = gcc_xo_gpll0_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -711,7 +711,7 @@ static struct clk_rcg2 csi0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi0_clk_src",
 		.parent_data = gcc_xo_gpll0_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -724,7 +724,7 @@ static struct clk_rcg2 csi1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi1_clk_src",
 		.parent_data = gcc_xo_gpll0_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -753,7 +753,7 @@ static struct clk_rcg2 gfx3d_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gfx3d_clk_src",
 		.parent_data = gcc_xo_gpll0_gpll2a_gpll3_gpll6a_parent_data,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll2a_gpll3_gpll6a_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -782,7 +782,7 @@ static struct clk_rcg2 vfe0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vfe0_clk_src",
 		.parent_data = gcc_xo_gpll0_gpll2_gpll4_parent_data,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll2_gpll4_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -801,7 +801,7 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_i2c_apps_clk_src",
 		.parent_data = gcc_xo_gpll0_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -826,7 +826,7 @@ static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -839,7 +839,7 @@ static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_i2c_apps_clk_src",
 		.parent_data = gcc_xo_gpll0_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -853,7 +853,7 @@ static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -866,7 +866,7 @@ static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_i2c_apps_clk_src",
 		.parent_data = gcc_xo_gpll0_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -880,7 +880,7 @@ static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -893,7 +893,7 @@ static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_i2c_apps_clk_src",
 		.parent_data = gcc_xo_gpll0_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -907,7 +907,7 @@ static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -920,7 +920,7 @@ static struct clk_rcg2 blsp1_qup5_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup5_i2c_apps_clk_src",
 		.parent_data = gcc_xo_gpll0_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -934,7 +934,7 @@ static struct clk_rcg2 blsp1_qup5_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup5_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -947,7 +947,7 @@ static struct clk_rcg2 blsp1_qup6_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup6_i2c_apps_clk_src",
 		.parent_data = gcc_xo_gpll0_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -961,7 +961,7 @@ static struct clk_rcg2 blsp1_qup6_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup6_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -994,7 +994,7 @@ static struct clk_rcg2 blsp1_uart1_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart1_apps_clk_src",
 		.parent_data = gcc_xo_gpll0_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1008,7 +1008,7 @@ static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart2_apps_clk_src",
 		.parent_data = gcc_xo_gpll0_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1028,7 +1028,7 @@ static struct clk_rcg2 cci_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cci_clk_src",
 		.parent_data = gcc_xo_gpll0a_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1048,7 +1048,7 @@ static struct clk_rcg2 camss_gp0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camss_gp0_clk_src",
 		.parent_data = gcc_xo_gpll0_gpll1a_sleep_parent_data,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1062,7 +1062,7 @@ static struct clk_rcg2 camss_gp1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camss_gp1_clk_src",
 		.parent_data = gcc_xo_gpll0_gpll1a_sleep_parent_data,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1082,7 +1082,7 @@ static struct clk_rcg2 jpeg0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "jpeg0_clk_src",
 		.parent_data = gcc_xo_gpll0_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1102,7 +1102,7 @@ static struct clk_rcg2 mclk0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk0_clk_src",
 		.parent_data = gcc_xo_gpll0_gpll1a_gpll6_sleep_parent_data,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_gpll6_sleep_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1116,7 +1116,7 @@ static struct clk_rcg2 mclk1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk1_clk_src",
 		.parent_data = gcc_xo_gpll0_gpll1a_gpll6_sleep_parent_data,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_gpll6_sleep_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1135,7 +1135,7 @@ static struct clk_rcg2 csi0phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi0phytimer_clk_src",
 		.parent_data = gcc_xo_gpll0_gpll1a_parent_data,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1148,7 +1148,7 @@ static struct clk_rcg2 csi1phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi1phytimer_clk_src",
 		.parent_data = gcc_xo_gpll0_gpll1a_parent_data,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1171,7 +1171,7 @@ static struct clk_rcg2 cpp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cpp_clk_src",
 		.parent_data = gcc_xo_gpll0_gpll2_parent_data,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll2_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1193,7 +1193,7 @@ static struct clk_rcg2 crypto_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "crypto_clk_src",
 		.parent_data = gcc_xo_gpll0_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1212,7 +1212,7 @@ static struct clk_rcg2 gp1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp1_clk_src",
 		.parent_data = gcc_xo_gpll0_gpll1a_sleep_parent_data,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1226,7 +1226,7 @@ static struct clk_rcg2 gp2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp2_clk_src",
 		.parent_data = gcc_xo_gpll0_gpll1a_sleep_parent_data,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1240,7 +1240,7 @@ static struct clk_rcg2 gp3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp3_clk_src",
 		.parent_data = gcc_xo_gpll0_gpll1a_sleep_parent_data,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1252,7 +1252,7 @@ static struct clk_rcg2 byte0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "byte0_clk_src",
 		.parent_data = gcc_xo_gpll0a_dsibyte_parent_data,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a_dsibyte_parent_data),
 		.ops = &clk_byte2_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1265,7 +1265,7 @@ static struct clk_rcg2 byte1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "byte1_clk_src",
 		.parent_data = gcc_xo_gpll0a_dsibyte_parent_data,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a_dsibyte_parent_data),
 		.ops = &clk_byte2_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1284,7 +1284,7 @@ static struct clk_rcg2 esc0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "esc0_clk_src",
 		.parent_data = gcc_xo_dsibyte_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_dsibyte_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1297,7 +1297,7 @@ static struct clk_rcg2 esc1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "esc1_clk_src",
 		.parent_data = gcc_xo_dsibyte_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_dsibyte_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1325,7 +1325,7 @@ static struct clk_rcg2 mdp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mdp_clk_src",
 		.parent_data = gcc_xo_gpll1_dsiphy_gpll6_gpll3a_gpll0a_parent_data,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll1_dsiphy_gpll6_gpll3a_gpll0a_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1338,7 +1338,7 @@ static struct clk_rcg2 pclk0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pclk0_clk_src",
 		.parent_data = gcc_xo_gpll0a_dsiphy_parent_data,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a_dsiphy_parent_data),
 		.ops = &clk_pixel_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1352,7 +1352,7 @@ static struct clk_rcg2 pclk1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pclk1_clk_src",
 		.parent_data = gcc_xo_gpll0a_dsiphy_parent_data,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a_dsiphy_parent_data),
 		.ops = &clk_pixel_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1371,7 +1371,7 @@ static struct clk_rcg2 vsync_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vsync_clk_src",
 		.parent_data = gcc_xo_gpll0a_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1390,7 +1390,7 @@ static struct clk_rcg2 pdm2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pdm2_clk_src",
 		.parent_data = gcc_xo_gpll0_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1416,7 +1416,7 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc1_apps_clk_src",
 		.parent_data = gcc_xo_gpll0_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_parent_data),
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
@@ -1430,7 +1430,7 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc2_apps_clk_src",
 		.parent_data = gcc_xo_gpll0_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_parent_data),
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
@@ -1450,7 +1450,7 @@ static struct clk_rcg2 apss_tcu_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "apss_tcu_clk_src",
 		.parent_data = gcc_xo_gpll0_gpll5a_gpll6_bimc_parent_data,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll5a_gpll6_bimc_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1473,7 +1473,7 @@ static struct clk_rcg2 bimc_gpu_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "bimc_gpu_clk_src",
 		.parent_data = gcc_xo_gpll0_gpll5a_gpll6_bimc_parent_data,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll5a_gpll6_bimc_parent_data),
 		.flags = CLK_GET_RATE_NOCACHE,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1494,7 +1494,7 @@ static struct clk_rcg2 usb_hs_system_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb_hs_system_clk_src",
 		.parent_data = gcc_xo_gpll0_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1512,7 +1512,7 @@ static struct clk_rcg2 usb_fs_system_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb_fs_system_clk_src",
 		.parent_data = gcc_xo_gpll6_gpll0_parent_data,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll6_gpll0_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1530,7 +1530,7 @@ static struct clk_rcg2 usb_fs_ic_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb_fs_ic_clk_src",
 		.parent_data = gcc_xo_gpll6_gpll0a_parent_data,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll6_gpll0a_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1556,7 +1556,7 @@ static struct clk_rcg2 ultaudio_ahbfabric_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ultaudio_ahbfabric_clk_src",
 		.parent_data = gcc_xo_gpll0_gpll1_sleep_parent_data,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1_sleep_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1635,7 +1635,7 @@ static struct clk_rcg2 ultaudio_lpaif_pri_i2s_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ultaudio_lpaif_pri_i2s_clk_src",
 		.parent_data = gcc_xo_gpll1_epi2s_emclk_sleep_parent_data,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll1_epi2s_emclk_sleep_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1666,7 +1666,7 @@ static struct clk_rcg2 ultaudio_lpaif_sec_i2s_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ultaudio_lpaif_sec_i2s_clk_src",
 		.parent_data = gcc_xo_gpll1_esi2s_emclk_sleep_parent_data,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll1_esi2s_emclk_sleep_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1697,7 +1697,7 @@ static struct clk_rcg2 ultaudio_lpaif_aux_i2s_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ultaudio_lpaif_aux_i2s_clk_src",
 		.parent_data = gcc_xo_gpll1_esi2s_emclk_sleep_parent_data,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll1_esi2s_emclk_sleep_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1732,7 +1732,7 @@ static struct clk_rcg2 ultaudio_xo_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ultaudio_xo_clk_src",
 		.parent_data = gcc_xo_sleep_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_sleep_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1788,7 +1788,7 @@ static struct clk_rcg2 codec_digcodec_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "codec_digcodec_clk_src",
 		.parent_data = gcc_xo_gpll1_emclk_sleep_parent_data,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll1_emclk_sleep_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1858,7 +1858,7 @@ static struct clk_rcg2 vcodec0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vcodec0_clk_src",
 		.parent_data = gcc_xo_gpll0_parent_data,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_parent_data),
 		.ops = &clk_rcg2_ops,
 	},
 };
-- 
2.35.1

