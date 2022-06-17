Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98C1A54F997
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 16:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382891AbiFQOr0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 10:47:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382900AbiFQOrY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 10:47:24 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C608F563AB
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 07:47:20 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id l20so5018165lji.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 07:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dLGyqt9A52BIk82Ab86JnhHI0DIQyfejnv9pYPdMtg0=;
        b=HZD3bBEIm2Cxe497ajJehRu5neRn8YCFUBmVP/zVOS1FWDS/w9rUU9tcPGNNtRos4n
         RnYLnsRGlVJuSSHYavKgeK+vqCJ4KHyyUYmLZ0Lwrs9VlJv76ZvoRD991Xcgk7GIGyM/
         QPxXhmxwLwPPegMWcEuR9HePEfAqIefualhGHDIucdng/1qLOQQ8QjlgIhf8eve8AYVj
         0hngo2fH5fZFHrwmeVGudrexvbK58a/F8tU6l3trHwS2CA9fYz96sxOXq2uL33h4MfFt
         Kt7WUMqozxkCG6eWBexVrKSMh2Ra+6gtpIQiAuTiBzOg40fkIHLOz9gaFxVg/qR9jJ3h
         2h5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dLGyqt9A52BIk82Ab86JnhHI0DIQyfejnv9pYPdMtg0=;
        b=TpcDDE2z/C5QyyeXluDm/euL89Utq471GF8jyZ4SGcMv68may8vs8ByWmw0O8WYBZ7
         XoFntbWFFEmV9Ll63drmDo8AxE2U79LgnGHTqYZGhRM6bqHqejLqb2KauHMGsCCd+c9a
         H6Vw6rPxJz3H4KpAej6E82vb0/KJEVTWtpp+rJ85OCxVzBaxcst6sd6fFOT1mC1X71DI
         Vjt73DygayvOIyIMv/nh2nX2h+/IBu4m7U3CtUW3ywKhxSOrB100WSDHiClz/CjG9kmJ
         J3BP5lQi5pkSW8IbO8KieSVrXU6AEWmkTcrXnQxH6poutP1RCuC7gj1uEgTIBFOHy4qz
         nDbA==
X-Gm-Message-State: AJIora/b0PpEBGRwSFKHKNeGAwMoA/HOa3wmMcKhjblxbR+26NwmC1Nm
        QqK5UBy1QSHkxLjPzg0VkXRbiw==
X-Google-Smtp-Source: AGRyM1u88YgFwIfOS09Uw0+3UOVE73AClaF7mlKrqgvBIMIH5bQQl6Clk0d6/Fj3SAUOF+bj+7IuGw==
X-Received: by 2002:a2e:bf12:0:b0:25a:45d7:4b95 with SMTP id c18-20020a2ebf12000000b0025a45d74b95mr5173960ljr.394.1655477238977;
        Fri, 17 Jun 2022 07:47:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a5-20020a2eb165000000b002553ab60e17sm571867ljm.122.2022.06.17.07.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 07:47:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 3/7] clk: qcom: gcc-msm8916: use ARRAY_SIZE instead of specifying num_parents
Date:   Fri, 17 Jun 2022 17:47:10 +0300
Message-Id: <20220617144714.817765-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617144714.817765-1-dmitry.baryshkov@linaro.org>
References: <20220617144714.817765-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
adding/removing entries to/from parent_data easy and errorproof.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c | 108 ++++++++++++++++-----------------
 1 file changed, 54 insertions(+), 54 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index 17e4a5a2a9fd..40c27ba6286f 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -371,7 +371,7 @@ static struct clk_rcg2 pcnoc_bfdcd_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pcnoc_bfdcd_clk_src",
 		.parent_names = gcc_xo_gpll0_bimc,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_bimc),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -383,7 +383,7 @@ static struct clk_rcg2 system_noc_bfdcd_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "system_noc_bfdcd_clk_src",
 		.parent_names = gcc_xo_gpll0_bimc,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_bimc),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -403,7 +403,7 @@ static struct clk_rcg2 camss_ahb_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camss_ahb_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -424,7 +424,7 @@ static struct clk_rcg2 apss_ahb_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "apss_ahb_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -443,7 +443,7 @@ static struct clk_rcg2 csi0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi0_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -456,7 +456,7 @@ static struct clk_rcg2 csi1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi1_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -484,7 +484,7 @@ static struct clk_rcg2 gfx3d_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gfx3d_clk_src",
 		.parent_names = gcc_xo_gpll0a_gpll1_gpll2a,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a_gpll1_gpll2a),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -511,7 +511,7 @@ static struct clk_rcg2 vfe0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vfe0_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll2,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll2),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -530,7 +530,7 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -559,7 +559,7 @@ static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -572,7 +572,7 @@ static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -586,7 +586,7 @@ static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -599,7 +599,7 @@ static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -613,7 +613,7 @@ static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -626,7 +626,7 @@ static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -640,7 +640,7 @@ static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -653,7 +653,7 @@ static struct clk_rcg2 blsp1_qup5_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup5_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -667,7 +667,7 @@ static struct clk_rcg2 blsp1_qup5_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup5_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -680,7 +680,7 @@ static struct clk_rcg2 blsp1_qup6_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup6_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -694,7 +694,7 @@ static struct clk_rcg2 blsp1_qup6_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup6_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -727,7 +727,7 @@ static struct clk_rcg2 blsp1_uart1_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart1_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -741,7 +741,7 @@ static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart2_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -760,7 +760,7 @@ static struct clk_rcg2 cci_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cci_clk_src",
 		.parent_names = gcc_xo_gpll0a,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -780,7 +780,7 @@ static struct clk_rcg2 camss_gp0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camss_gp0_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -794,7 +794,7 @@ static struct clk_rcg2 camss_gp1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camss_gp1_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -814,7 +814,7 @@ static struct clk_rcg2 jpeg0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "jpeg0_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -835,7 +835,7 @@ static struct clk_rcg2 mclk0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk0_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -849,7 +849,7 @@ static struct clk_rcg2 mclk1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk1_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -868,7 +868,7 @@ static struct clk_rcg2 csi0phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi0phytimer_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll1a,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -881,7 +881,7 @@ static struct clk_rcg2 csi1phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi1phytimer_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll1a,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -901,7 +901,7 @@ static struct clk_rcg2 cpp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cpp_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll2,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll2),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -922,7 +922,7 @@ static struct clk_rcg2 crypto_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "crypto_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -941,7 +941,7 @@ static struct clk_rcg2 gp1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp1_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -955,7 +955,7 @@ static struct clk_rcg2 gp2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp2_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -969,7 +969,7 @@ static struct clk_rcg2 gp3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp3_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -981,7 +981,7 @@ static struct clk_rcg2 byte0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "byte0_clk_src",
 		.parent_names = gcc_xo_gpll0a_dsibyte,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a_dsibyte),
 		.ops = &clk_byte2_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1000,7 +1000,7 @@ static struct clk_rcg2 esc0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "esc0_clk_src",
 		.parent_names = gcc_xo_dsibyte,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_dsibyte),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1025,7 +1025,7 @@ static struct clk_rcg2 mdp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mdp_clk_src",
 		.parent_names = gcc_xo_gpll0_dsiphy,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_dsiphy),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1038,7 +1038,7 @@ static struct clk_rcg2 pclk0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pclk0_clk_src",
 		.parent_names = gcc_xo_gpll0a_dsiphy,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a_dsiphy),
 		.ops = &clk_pixel_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1057,7 +1057,7 @@ static struct clk_rcg2 vsync_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vsync_clk_src",
 		.parent_names = gcc_xo_gpll0a,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1075,7 +1075,7 @@ static struct clk_rcg2 pdm2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pdm2_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1100,7 +1100,7 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc1_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
@@ -1125,7 +1125,7 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc2_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
@@ -1145,7 +1145,7 @@ static struct clk_rcg2 apss_tcu_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "apss_tcu_clk_src",
 		.parent_names = gcc_xo_gpll0a_gpll1_gpll2,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a_gpll1_gpll2),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1168,7 +1168,7 @@ static struct clk_rcg2 bimc_gpu_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "bimc_gpu_clk_src",
 		.parent_names = gcc_xo_gpll0_bimc,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_bimc),
 		.flags = CLK_GET_RATE_NOCACHE,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1187,7 +1187,7 @@ static struct clk_rcg2 usb_hs_system_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb_hs_system_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1213,7 +1213,7 @@ static struct clk_rcg2 ultaudio_ahbfabric_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ultaudio_ahbfabric_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll1_sleep,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1292,7 +1292,7 @@ static struct clk_rcg2 ultaudio_lpaif_pri_i2s_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ultaudio_lpaif_pri_i2s_clk_src",
 		.parent_names = gcc_xo_gpll1_epi2s_emclk_sleep,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll1_epi2s_emclk_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1323,7 +1323,7 @@ static struct clk_rcg2 ultaudio_lpaif_sec_i2s_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ultaudio_lpaif_sec_i2s_clk_src",
 		.parent_names = gcc_xo_gpll1_esi2s_emclk_sleep,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll1_esi2s_emclk_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1354,7 +1354,7 @@ static struct clk_rcg2 ultaudio_lpaif_aux_i2s_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ultaudio_lpaif_aux_i2s_clk_src",
 		.parent_names = gcc_xo_gpll1_esi2s_emclk_sleep,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll1_esi2s_emclk_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1389,7 +1389,7 @@ static struct clk_rcg2 ultaudio_xo_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ultaudio_xo_clk_src",
 		.parent_names = gcc_xo_sleep,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1445,7 +1445,7 @@ static struct clk_rcg2 codec_digcodec_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "codec_digcodec_clk_src",
 		.parent_names = gcc_xo_gpll1_emclk_sleep,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll1_emclk_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1515,7 +1515,7 @@ static struct clk_rcg2 vcodec0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vcodec0_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -2771,7 +2771,7 @@ static struct clk_rcg2 bimc_ddr_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "bimc_ddr_clk_src",
 		.parent_names = gcc_xo_gpll0_bimc,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_bimc),
 		.ops = &clk_rcg2_ops,
 		.flags = CLK_GET_RATE_NOCACHE,
 	},
-- 
2.35.1

