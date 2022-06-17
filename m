Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87E7F54F790
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 14:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382143AbiFQM3d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 08:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382197AbiFQM3b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 08:29:31 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63E221F2E1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 05:29:27 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id a2so6719817lfg.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 05:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4lY8TmlMdiI19GEEbNZqGwZAPQ+cU0i2GG/AjKTtwJ4=;
        b=yyAz2Oel3oJGDsC2PDr53ywWgqrlR4JSetTCcnAAiIv2maxPIn4ESyHIGPRQcBLroq
         Gq66P3y5PgvhuH+toh9PvydsaLgQVHLuJ9iAOxDg7sloY6fmveQ32nzoVNAJUEipuVfM
         g121p0xAo2Ri57TWhCdlCpCH73bRkULuzruyTms/ccKCA0mQFFlDu5bh3YdEhN2mV5j4
         hoqNn3Vn8UCTEqD5HIC8sZ9QG3QsLeL8yRSOGzfI/zWHLrG4f+n13SmzWB96+tSq3qO3
         5Z7HdVqVIBddlcA/fDPqEC/yQ8IHWvijh/D2Yd4H7lMslgv/PXGmILpPxzhrEcijTGbL
         ONlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4lY8TmlMdiI19GEEbNZqGwZAPQ+cU0i2GG/AjKTtwJ4=;
        b=Uv6FxSV3HPeob5/GyBI+fCxallYGlzBGj4SCk8UiQT7en3hM1QFTClQzvkkARm2LYH
         o+74njajMAasNVXbzomEVw0sVnZCKcOaAoxuCPFmpb/xSoDMGoKtkQRt/kmkSj0BGeRX
         UWo254PVoKCdJxA+P7RC03eR9q9X3jo1DBQ0RX5NBx6IdlIpLKcVF5y1mUM+9zaFdSpr
         c2EUdDsyWHLB899VvxDLOqhErLrECz7OTuBMoP3Pxqdm6rWGNgNm+Oor169KoUNJcXSN
         lX9J8ap84QXtJnxoPtA1P8A4dCTuI8g02uKiWhJPS3x1QO7Xl4oqJs7NTWlPGeBSWlBT
         ZynQ==
X-Gm-Message-State: AJIora/kd34GzEzddMEgFMsr+Dw3CE4mD53kJsaAmzLuVS0yJGHz0402
        ZrdMcdQHmU9lLEA8Gd2eyOrQ2A==
X-Google-Smtp-Source: AGRyM1tmx2u7XTXrjlSUbweCigq1jdIAKHa+g4FOaJIQAlqQ64GbEvklCmGj7DcBpIX8wAwKcMZGrg==
X-Received: by 2002:a05:6512:12c9:b0:479:7621:e32 with SMTP id p9-20020a05651212c900b0047976210e32mr5447123lfg.306.1655468965714;
        Fri, 17 Jun 2022 05:29:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b8-20020a2e8948000000b0025568a2a018sm539471ljk.129.2022.06.17.05.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 05:29:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 3/6] clk: qcom: mmcc-msm8996: use ARRAY_SIZE instead of specifying num_parents
Date:   Fri, 17 Jun 2022 15:29:19 +0300
Message-Id: <20220617122922.769562-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617122922.769562-1-dmitry.baryshkov@linaro.org>
References: <20220617122922.769562-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/mmcc-msm8996.c | 88 ++++++++++++++++-----------------
 1 file changed, 44 insertions(+), 44 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index 24843e4f2599..bf0f8eb78989 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -486,7 +486,7 @@ static struct clk_rcg2 ahb_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ahb_clk_src",
 		.parent_names = mmss_xo_mmpll0_gpll0_gpll0_div,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -510,7 +510,7 @@ static struct clk_rcg2 axi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "axi_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -523,7 +523,7 @@ static struct clk_rcg2 maxi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "maxi_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -536,7 +536,7 @@ static struct clk_rcg2_gfx3d gfx3d_clk_src = {
 		.clkr.hw.init = &(struct clk_init_data){
 			.name = "gfx3d_clk_src",
 			.parent_names = mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0,
-			.num_parents = 6,
+			.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0),
 			.ops = &clk_gfx3d_ops,
 			.flags = CLK_SET_RATE_PARENT,
 		},
@@ -561,7 +561,7 @@ static struct clk_rcg2 rbbmtimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "rbbmtimer_clk_src",
 		.parent_names = mmss_xo_mmpll0_gpll0_gpll0_div,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -573,7 +573,7 @@ static struct clk_rcg2 isense_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "isense_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -592,7 +592,7 @@ static struct clk_rcg2 rbcpr_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "rbcpr_clk_src",
 		.parent_names = mmss_xo_mmpll0_gpll0_gpll0_div,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -614,7 +614,7 @@ static struct clk_rcg2 video_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "video_core_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll3_gpll0_gpll0_div,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -628,7 +628,7 @@ static struct clk_rcg2 video_subcore0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "video_subcore0_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll3_gpll0_gpll0_div,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -642,7 +642,7 @@ static struct clk_rcg2 video_subcore1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "video_subcore1_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll3_gpll0_gpll0_div,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -655,7 +655,7 @@ static struct clk_rcg2 pclk0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pclk0_clk_src",
 		.parent_names = mmss_xo_dsi0pll_dsi1pll,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(mmss_xo_dsi0pll_dsi1pll),
 		.ops = &clk_pixel_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -669,7 +669,7 @@ static struct clk_rcg2 pclk1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pclk1_clk_src",
 		.parent_names = mmss_xo_dsi0pll_dsi1pll,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(mmss_xo_dsi0pll_dsi1pll),
 		.ops = &clk_pixel_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -696,7 +696,7 @@ static struct clk_rcg2 mdp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mdp_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -714,7 +714,7 @@ static struct clk_rcg2 extpclk_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "extpclk_clk_src",
 		.parent_names = mmss_xo_hdmi,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(mmss_xo_hdmi),
 		.ops = &clk_byte_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -733,7 +733,7 @@ static struct clk_rcg2 vsync_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vsync_clk_src",
 		.parent_names = mmss_xo_gpll0_gpll0_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(mmss_xo_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -751,7 +751,7 @@ static struct clk_rcg2 hdmi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "hdmi_clk_src",
 		.parent_names = mmss_xo_gpll0_gpll0_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(mmss_xo_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -763,7 +763,7 @@ static struct clk_rcg2 byte0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "byte0_clk_src",
 		.parent_names = mmss_xo_dsibyte,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(mmss_xo_dsibyte),
 		.ops = &clk_byte2_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -776,7 +776,7 @@ static struct clk_rcg2 byte1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "byte1_clk_src",
 		.parent_names = mmss_xo_dsibyte,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(mmss_xo_dsibyte),
 		.ops = &clk_byte2_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -795,7 +795,7 @@ static struct clk_rcg2 esc0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "esc0_clk_src",
 		.parent_names = mmss_xo_dsibyte,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(mmss_xo_dsibyte),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -808,7 +808,7 @@ static struct clk_rcg2 esc1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "esc1_clk_src",
 		.parent_names = mmss_xo_dsibyte,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(mmss_xo_dsibyte),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -832,7 +832,7 @@ static struct clk_rcg2 camss_gp0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camss_gp0_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -846,7 +846,7 @@ static struct clk_rcg2 camss_gp1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camss_gp1_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -874,7 +874,7 @@ static struct clk_rcg2 mclk0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk0_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -888,7 +888,7 @@ static struct clk_rcg2 mclk1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk1_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -902,7 +902,7 @@ static struct clk_rcg2 mclk2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk2_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -916,7 +916,7 @@ static struct clk_rcg2 mclk3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk3_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -938,7 +938,7 @@ static struct clk_rcg2 cci_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cci_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -958,7 +958,7 @@ static struct clk_rcg2 csi0phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi0phytimer_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -971,7 +971,7 @@ static struct clk_rcg2 csi1phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi1phytimer_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -984,7 +984,7 @@ static struct clk_rcg2 csi2phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi2phytimer_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1005,7 +1005,7 @@ static struct clk_rcg2 csiphy0_3p_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csiphy0_3p_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1018,7 +1018,7 @@ static struct clk_rcg2 csiphy1_3p_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csiphy1_3p_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1031,7 +1031,7 @@ static struct clk_rcg2 csiphy2_3p_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csiphy2_3p_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1054,7 +1054,7 @@ static struct clk_rcg2 jpeg0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "jpeg0_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1076,7 +1076,7 @@ static struct clk_rcg2 jpeg2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "jpeg2_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1089,7 +1089,7 @@ static struct clk_rcg2 jpeg_dma_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "jpeg_dma_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1112,7 +1112,7 @@ static struct clk_rcg2 vfe0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vfe0_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1125,7 +1125,7 @@ static struct clk_rcg2 vfe1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vfe1_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1147,7 +1147,7 @@ static struct clk_rcg2 cpp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cpp_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1169,7 +1169,7 @@ static struct clk_rcg2 csi0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi0_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1182,7 +1182,7 @@ static struct clk_rcg2 csi1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi1_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1195,7 +1195,7 @@ static struct clk_rcg2 csi2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi2_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1208,7 +1208,7 @@ static struct clk_rcg2 csi3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi3_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1228,7 +1228,7 @@ static struct clk_rcg2 fd_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "fd_core_clk_src",
 		.parent_names = mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
-- 
2.35.1

