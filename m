Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 704A8641D04
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Dec 2022 13:45:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbiLDMpT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Dec 2022 07:45:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230012AbiLDMpS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Dec 2022 07:45:18 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FD2315A28
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Dec 2022 04:45:16 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id n1so10580265ljg.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Dec 2022 04:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASx2rKH0Lvpvw/1Gr9cL8dsMIr6BcQh/OZ7/AxUrNkI=;
        b=ccQrSok290wrdAPZ0obkXfWmUX64SHZzOyt9YBjvE7SOZnvXWPJYHkhWtQ3o1m2Mwm
         bYZBZ+BytV++boGbkJxRscUuGxEG85zQHR0pWOalY/2TE+VPFIOXi6dHrkQYZLQnNCtX
         YHtCYfbvdatu8cs6uKoV2fnpBXuxSFl5m4FAEtMCpuHesglnN9U2291z6/qPooR8Ej63
         DiHPemB6eGCk/PeEYd9sdF8rS/xDLE5vp8gvAHF4KBco964lkvvXEXp4kbPjFPz8qz5v
         GDUVPGYpjxsiFsbImrn0Kdvj4XHdOzB2Vb/HY/mEGhDkry0pO04+tuqVGbD13MD20+gf
         E9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ASx2rKH0Lvpvw/1Gr9cL8dsMIr6BcQh/OZ7/AxUrNkI=;
        b=S/L2Ye/N+MlsiWQZpwabkUlDOeZZPxQOPCOJDqM9ireswKLOZI0B2zyRX3PeQfia2p
         3o/BiR8MANGtwIzMOJOZKbX61fr+y2CCMGHwV0DprMP7hzK2Vx0BD6rwYLOm0YGhwhCH
         22Qbeq6LW4vVxWE7ads1CkAysVkzjmQcFhj2cyw2pQoy+paohDxudx1tGQu10IcPc2jS
         jOKhlOMjS+NGviO8GJEbqZjq6ERpGykFQk8PbjEiQ/0+SZm7evS6Y21h2pG3ItsQER9X
         Em0QHPu6WOjxxHg9yoT0ZuL+Ky5+JUAzmIOUayOGWwEthbxnyNU/oAnRjf8zaBfBdXqY
         j3bg==
X-Gm-Message-State: ANoB5pmFXIlinPw+A9Xg4aOuTfcuy06uMlTwIlSci+WGKnQhnCeF54+F
        qwKsAKIAzDzHFej/PwxUDV2qygisWND431jz
X-Google-Smtp-Source: AA0mqf7iZ6Jo6FDYrWet+jdnC+ceC3/0bW4ThRxlCMUp3KE0Y80E3yIr0nAOl3W61UpvRXS6c5uivQ==
X-Received: by 2002:a05:651c:11c1:b0:279:7b1c:9add with SMTP id z1-20020a05651c11c100b002797b1c9addmr17403009ljo.151.1670157914837;
        Sun, 04 Dec 2022 04:45:14 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k18-20020a05651239d200b0049771081b10sm1763006lfu.31.2022.12.04.04.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 04:45:14 -0800 (PST)
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
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v4 06/11] clk: qcom: mmcc-msm8974: use ARRAY_SIZE instead of specifying num_parents
Date:   Sun,  4 Dec 2022 14:45:03 +0200
Message-Id: <20221204124508.1415713-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221204124508.1415713-1-dmitry.baryshkov@linaro.org>
References: <20221204124508.1415713-1-dmitry.baryshkov@linaro.org>
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

Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
adding/removing entries to/from parent_data easy and errorproof.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/mmcc-msm8974.c | 74 ++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
index f74662925a58..9008df2305df 100644
--- a/drivers/clk/qcom/mmcc-msm8974.c
+++ b/drivers/clk/qcom/mmcc-msm8974.c
@@ -252,7 +252,7 @@ static struct clk_rcg2 mmss_ahb_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmss_ahb_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -289,7 +289,7 @@ static struct clk_rcg2 mmss_axi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmss_axi_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -313,7 +313,7 @@ static struct clk_rcg2 ocmemnoc_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ocmemnoc_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -332,7 +332,7 @@ static struct clk_rcg2 csi0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi0_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -345,7 +345,7 @@ static struct clk_rcg2 csi1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi1_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -358,7 +358,7 @@ static struct clk_rcg2 csi2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi2_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -371,7 +371,7 @@ static struct clk_rcg2 csi3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi3_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -418,7 +418,7 @@ static struct clk_rcg2 vfe0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vfe0_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -431,7 +431,7 @@ static struct clk_rcg2 vfe1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vfe1_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -472,7 +472,7 @@ static struct clk_rcg2 mdp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mdp_clk_src",
 		.parent_names = mmcc_xo_mmpll0_dsi_hdmi_gpll0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_dsi_hdmi_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -495,7 +495,7 @@ static struct clk_rcg2 jpeg0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "jpeg0_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -508,7 +508,7 @@ static struct clk_rcg2 jpeg1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "jpeg1_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -521,7 +521,7 @@ static struct clk_rcg2 jpeg2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "jpeg2_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -534,7 +534,7 @@ static struct clk_rcg2 pclk0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pclk0_clk_src",
 		.parent_names = mmcc_xo_dsi_hdmi_edp_gpll0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp_gpll0),
 		.ops = &clk_pixel_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -548,7 +548,7 @@ static struct clk_rcg2 pclk1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pclk1_clk_src",
 		.parent_names = mmcc_xo_dsi_hdmi_edp_gpll0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp_gpll0),
 		.ops = &clk_pixel_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -581,7 +581,7 @@ static struct clk_rcg2 vcodec0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vcodec0_clk_src",
 		.parent_names = mmcc_xo_mmpll0_1_3_gpll0,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_3_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -599,7 +599,7 @@ static struct clk_rcg2 cci_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cci_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -623,7 +623,7 @@ static struct clk_rcg2 camss_gp0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camss_gp0_clk_src",
 		.parent_names = mmcc_xo_mmpll0_1_gpll1_0,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_gpll1_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -637,7 +637,7 @@ static struct clk_rcg2 camss_gp1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camss_gp1_clk_src",
 		.parent_names = mmcc_xo_mmpll0_1_gpll1_0,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_gpll1_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -672,7 +672,7 @@ static struct clk_rcg2 mclk0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk0_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -685,7 +685,7 @@ static struct clk_rcg2 mclk1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk1_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -698,7 +698,7 @@ static struct clk_rcg2 mclk2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk2_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -711,7 +711,7 @@ static struct clk_rcg2 mclk3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk3_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -730,7 +730,7 @@ static struct clk_rcg2 csi0phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi0phytimer_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -743,7 +743,7 @@ static struct clk_rcg2 csi1phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi1phytimer_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -756,7 +756,7 @@ static struct clk_rcg2 csi2phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi2phytimer_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -787,7 +787,7 @@ static struct clk_rcg2 cpp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cpp_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -805,7 +805,7 @@ static struct clk_rcg2 byte0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "byte0_clk_src",
 		.parent_names = mmcc_xo_dsibyte_hdmi_edp_gpll0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmcc_xo_dsibyte_hdmi_edp_gpll0),
 		.ops = &clk_byte2_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -819,7 +819,7 @@ static struct clk_rcg2 byte1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "byte1_clk_src",
 		.parent_names = mmcc_xo_dsibyte_hdmi_edp_gpll0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmcc_xo_dsibyte_hdmi_edp_gpll0),
 		.ops = &clk_byte2_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -838,7 +838,7 @@ static struct clk_rcg2 edpaux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "edpaux_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -857,7 +857,7 @@ static struct clk_rcg2 edplink_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "edplink_clk_src",
 		.parent_names = mmcc_xo_dsi_hdmi_edp_gpll0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp_gpll0),
 		.ops = &clk_rcg2_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -877,7 +877,7 @@ static struct clk_rcg2 edppixel_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "edppixel_clk_src",
 		.parent_names = mmcc_xo_dsi_hdmi_edp,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp),
 		.ops = &clk_edp_pixel_ops,
 	},
 };
@@ -895,7 +895,7 @@ static struct clk_rcg2 esc0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "esc0_clk_src",
 		.parent_names = mmcc_xo_dsibyte_hdmi_edp_gpll0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmcc_xo_dsibyte_hdmi_edp_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -908,7 +908,7 @@ static struct clk_rcg2 esc1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "esc1_clk_src",
 		.parent_names = mmcc_xo_dsibyte_hdmi_edp_gpll0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmcc_xo_dsibyte_hdmi_edp_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -926,7 +926,7 @@ static struct clk_rcg2 extpclk_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "extpclk_clk_src",
 		.parent_names = mmcc_xo_dsi_hdmi_edp_gpll0,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp_gpll0),
 		.ops = &clk_byte_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -945,7 +945,7 @@ static struct clk_rcg2 hdmi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "hdmi_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -963,7 +963,7 @@ static struct clk_rcg2 vsync_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vsync_clk_src",
 		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
-- 
2.35.1

