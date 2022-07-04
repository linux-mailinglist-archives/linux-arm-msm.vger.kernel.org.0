Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9493B565CE9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 19:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233821AbiGDRZD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 13:25:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233637AbiGDRZB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 13:25:01 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03FC3101E4
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 10:24:57 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id z13so16733129lfj.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 10:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I+J2tA+JzsTKBpv3ODZGIZ8KeqwF/Ias/ZwnpRMy82k=;
        b=TgkFFny4IOTWTPIykYxfNBUKnuj3BzhQDojxEBnHpREmKVkXcDfw0oHmHRE0sxDxBW
         4/8oMFUzjfynS50u2JFdQUK4NJpf2UNOWjCkGvY2h99NqEY2scKt/6lTUEgpHSjFYQhh
         skDN2VSVbW/m4we4ZiggrAU5KJPd1KCSyqW7XqFy/HhbMjvaCBSS8KLTj9TVnhylXs9V
         8KL7i66Ao7dHtgXoOMSw2lmX7EwA+8oVtvVicmIfjLHjjTbwXGCA1/0rj1g5UdWMpEl0
         EqC3GMHhayvHqZm9D3WErCH2LJe/4tvs7aEqZMgLn9q0Au9CvABMYJp/SgcXIpBCJo7X
         LUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I+J2tA+JzsTKBpv3ODZGIZ8KeqwF/Ias/ZwnpRMy82k=;
        b=C3/jJPD2Xm34f3QEFXCje+iozeP0r4rjA3pr/K1YiLSPThvWHRvzgaNVtNOQ/sm2xs
         GGm8m0Rj7Z56Hw9pK0LFtNZl1ZL0ZLM0g7Cw3CXyOx/xJbQL+mbaG+PfW43i2mJCz+59
         kMg3QsOQCESMbfgfgSUL4DES31Kr3x0lPPjHgkmGm6LINVzfF98LqYB31dbMLB5S++i3
         YYpBWaawDPqxjYMTfk3ifA6l9fGv5mWsmjlRtFRDg+tXwieVd86YdtdL9qB+GICpa8Ax
         BAOGzuBIgExB21nqjYuwyX4UnIEeG1BthI/y2c+C5ZFiYhKq+MzQzvnUqPRa8tUhvYaT
         gtRA==
X-Gm-Message-State: AJIora+cbtDlSWODOLkfnorUXA5gXGwtuCdRdQb4KaEiMklYqaDt8nEH
        sU7j+OIMbj81XC4Yfs3sQW9o9g==
X-Google-Smtp-Source: AGRyM1vPVB1Rj5v0OEzKsS47/wa2dvNMkAa7n4Wn/YjjThRN2ycMyPYyrCoFhJdqr5aNhBqjIWHe2A==
X-Received: by 2002:a05:6512:a8b:b0:47f:9e2b:9f28 with SMTP id m11-20020a0565120a8b00b0047f9e2b9f28mr20048727lfu.596.1656955497382;
        Mon, 04 Jul 2022 10:24:57 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u15-20020ac2518f000000b0048152c51812sm2339596lfi.154.2022.07.04.10.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 10:24:56 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Georgi Djakov <djakov@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 3/7] clk: qcom: gcc-msm8916: use ARRAY_SIZE instead of specifying num_parents
Date:   Mon,  4 Jul 2022 20:24:49 +0300
Message-Id: <20220704172453.838303-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220704172453.838303-1-dmitry.baryshkov@linaro.org>
References: <20220704172453.838303-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
adding/removing entries to/from parent_data easy and errorproof.

This conversion fixes an issue present since the first version of this
driver. For the gp1_clk_src, gp2_clk_src and gp3_clk_src it was
impossible to select sleep_clk as a prent of the clock, since
num_parents was limited to 3 rather than 4. Switching to use num_parents
automatically makes sleep_clk available for selection.

Fixes: 3966fab8b6ab ("clk: qcom: Add MSM8916 Global Clock Controller support")
Cc: Georgi Djakov <djakov@kernel.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c | 108 ++++++++++++++++-----------------
 1 file changed, 54 insertions(+), 54 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index 9a46794f6eb8..265df21e24af 100644
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
@@ -793,7 +793,7 @@ static struct clk_rcg2 camss_gp0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camss_gp0_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -807,7 +807,7 @@ static struct clk_rcg2 camss_gp1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camss_gp1_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -827,7 +827,7 @@ static struct clk_rcg2 jpeg0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "jpeg0_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -848,7 +848,7 @@ static struct clk_rcg2 mclk0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk0_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -862,7 +862,7 @@ static struct clk_rcg2 mclk1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk1_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -881,7 +881,7 @@ static struct clk_rcg2 csi0phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi0phytimer_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll1a,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -894,7 +894,7 @@ static struct clk_rcg2 csi1phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi1phytimer_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll1a,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -914,7 +914,7 @@ static struct clk_rcg2 cpp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cpp_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll2,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll2),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -935,7 +935,7 @@ static struct clk_rcg2 crypto_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "crypto_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -976,7 +976,7 @@ static struct clk_rcg2 gp1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp1_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -990,7 +990,7 @@ static struct clk_rcg2 gp2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp2_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1004,7 +1004,7 @@ static struct clk_rcg2 gp3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp3_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1016,7 +1016,7 @@ static struct clk_rcg2 byte0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "byte0_clk_src",
 		.parent_names = gcc_xo_gpll0a_dsibyte,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a_dsibyte),
 		.ops = &clk_byte2_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1035,7 +1035,7 @@ static struct clk_rcg2 esc0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "esc0_clk_src",
 		.parent_names = gcc_xo_dsibyte,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_dsibyte),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1060,7 +1060,7 @@ static struct clk_rcg2 mdp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mdp_clk_src",
 		.parent_names = gcc_xo_gpll0_dsiphy,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_dsiphy),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1073,7 +1073,7 @@ static struct clk_rcg2 pclk0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pclk0_clk_src",
 		.parent_names = gcc_xo_gpll0a_dsiphy,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a_dsiphy),
 		.ops = &clk_pixel_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1092,7 +1092,7 @@ static struct clk_rcg2 vsync_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vsync_clk_src",
 		.parent_names = gcc_xo_gpll0a,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1110,7 +1110,7 @@ static struct clk_rcg2 pdm2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pdm2_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1135,7 +1135,7 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc1_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
@@ -1160,7 +1160,7 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc2_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
@@ -1180,7 +1180,7 @@ static struct clk_rcg2 apss_tcu_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "apss_tcu_clk_src",
 		.parent_names = gcc_xo_gpll0a_gpll1_gpll2,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a_gpll1_gpll2),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1203,7 +1203,7 @@ static struct clk_rcg2 bimc_gpu_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "bimc_gpu_clk_src",
 		.parent_names = gcc_xo_gpll0_bimc,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_bimc),
 		.flags = CLK_GET_RATE_NOCACHE,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1222,7 +1222,7 @@ static struct clk_rcg2 usb_hs_system_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb_hs_system_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1248,7 +1248,7 @@ static struct clk_rcg2 ultaudio_ahbfabric_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ultaudio_ahbfabric_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll1_sleep,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1327,7 +1327,7 @@ static struct clk_rcg2 ultaudio_lpaif_pri_i2s_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ultaudio_lpaif_pri_i2s_clk_src",
 		.parent_names = gcc_xo_gpll1_epi2s_emclk_sleep,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll1_epi2s_emclk_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1358,7 +1358,7 @@ static struct clk_rcg2 ultaudio_lpaif_sec_i2s_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ultaudio_lpaif_sec_i2s_clk_src",
 		.parent_names = gcc_xo_gpll1_esi2s_emclk_sleep,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll1_esi2s_emclk_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1389,7 +1389,7 @@ static struct clk_rcg2 ultaudio_lpaif_aux_i2s_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ultaudio_lpaif_aux_i2s_clk_src",
 		.parent_names = gcc_xo_gpll1_esi2s_emclk_sleep,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll1_esi2s_emclk_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1424,7 +1424,7 @@ static struct clk_rcg2 ultaudio_xo_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ultaudio_xo_clk_src",
 		.parent_names = gcc_xo_sleep,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1480,7 +1480,7 @@ static struct clk_rcg2 codec_digcodec_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "codec_digcodec_clk_src",
 		.parent_names = gcc_xo_gpll1_emclk_sleep,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll1_emclk_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1550,7 +1550,7 @@ static struct clk_rcg2 vcodec0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vcodec0_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -2806,7 +2806,7 @@ static struct clk_rcg2 bimc_ddr_clk_src = {
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

