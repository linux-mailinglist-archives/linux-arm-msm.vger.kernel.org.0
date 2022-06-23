Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E110A5579CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jun 2022 14:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231363AbiFWMEf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jun 2022 08:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231508AbiFWME3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jun 2022 08:04:29 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E07E49686
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 05:04:25 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id bn8so5696167ljb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 05:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yf/yx25JwN/CNAUtHPPwkTUDXLMD54uQut5mDpGElUM=;
        b=DfJ/5yZlOD8HGBZYKKssrvGhhIC+EvkQu4yYGkrlt3faubECHb8VtGnJ9eSbq7Is7L
         IXhVbb/GG1wlUXGKz81UieeCaJO01UWnRWz2YxIKhE0WFPCiacRW6SOAiCFKghBgV8uk
         zItfnLn+enXTrK4H3REUOQpn03YcGI+hiJNBTZTi8bOiXNRxPSZ890HM7GXBhSi2e3O/
         S+MkBgfuIbDL1hU22yCyAQFT/m+s29VfGBe7u27f6DBRt0E5VTEPn0NftCSZ7KWiBK1G
         lJbVSCDGBvjQViPOGuwcuIPLF9UsQ8kaN1DluuPOBB0P0sNKTlF2yg+YjJ++611udIwG
         qkng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yf/yx25JwN/CNAUtHPPwkTUDXLMD54uQut5mDpGElUM=;
        b=cuTChkHwlscWOcr0661sBF0l81IXh9lOtJNz2khs0jwY/KLuulmUsHHrAIsQR5VwGY
         TvY9+0pV48Jaxy/KuV6gO/0sGGQkl/BAqB4az00AKbpCVioflhUeScELN7xOFEK1o+C3
         2NM4t1pLftKT/PQTg6oEUflLdgYX6VrZQkk08yhikTuZFBPQ7MyiVTvOsorBlZ46G9QB
         4kZ8utT52pCxceGulcfYzztVhcXm8exNnFdy/1Mcigg5ifFpbmhcfTRxRK1259MwobSY
         O+i258tj2eYuDuZsQZlJZw3kfsHCEetcDYsBMweOkZisgCiLOdbXF9b+YWPOHRZEYE59
         8QwA==
X-Gm-Message-State: AJIora+PVS/FtRUyV16NZdCuUk4basRoZoZuGL5e1IEguzAzyKNthi9L
        sjbT+8y9sdZUYcEwHWmWTg1uIg==
X-Google-Smtp-Source: AGRyM1u/O0NgxYeKA0KNd1BMeM6hc9aHpLhdHM4kX7GmYDOksjx642511xiPmqQ2SrZCgjFJ1rvbTw==
X-Received: by 2002:a2e:918f:0:b0:25a:7164:f408 with SMTP id f15-20020a2e918f000000b0025a7164f408mr4497705ljg.523.1655985863591;
        Thu, 23 Jun 2022 05:04:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 18-20020ac25f52000000b0047f6b4a53cdsm1799888lfz.172.2022.06.23.05.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 05:04:23 -0700 (PDT)
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
Subject: [PATCH 05/15] clk: qcom: lcc-msm8960: use macros to implement mi2s clocks
Date:   Thu, 23 Jun 2022 15:04:08 +0300
Message-Id: <20220623120418.250589-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
References: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
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

Split and extend existing CLK_AIF_OSR_DIV macro to implement mi2s
clocks. This simplifies the driver and removes extra code duplication.

The clock mi2s_div_clk used .enable_reg/.enable_bit, however these
fields are not used with by the clk_regmap_div_ops, thus they are
silently dropped. Clock enablement is handled in the mi2s_bit_div_clk
clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/lcc-msm8960.c | 142 +++++++--------------------------
 1 file changed, 27 insertions(+), 115 deletions(-)

diff --git a/drivers/clk/qcom/lcc-msm8960.c b/drivers/clk/qcom/lcc-msm8960.c
index 84817cf2b6bd..99a3d2d486b4 100644
--- a/drivers/clk/qcom/lcc-msm8960.c
+++ b/drivers/clk/qcom/lcc-msm8960.c
@@ -86,112 +86,7 @@ static struct freq_tbl clk_tbl_aif_osr_393[] = {
 	{ }
 };
 
-static struct clk_rcg mi2s_osr_src = {
-	.ns_reg = 0x48,
-	.md_reg = 0x4c,
-	.mn = {
-		.mnctr_en_bit = 8,
-		.mnctr_reset_bit = 7,
-		.mnctr_mode_shift = 5,
-		.n_val_shift = 24,
-		.m_val_shift = 8,
-		.width = 8,
-	},
-	.p = {
-		.pre_div_shift = 3,
-		.pre_div_width = 2,
-	},
-	.s = {
-		.src_sel_shift = 0,
-		.parent_map = lcc_pxo_pll4_map,
-	},
-	.freq_tbl = clk_tbl_aif_osr_393,
-	.clkr = {
-		.enable_reg = 0x48,
-		.enable_mask = BIT(9),
-		.hw.init = &(struct clk_init_data){
-			.name = "mi2s_osr_src",
-			.parent_names = lcc_pxo_pll4,
-			.num_parents = 2,
-			.ops = &clk_rcg_ops,
-			.flags = CLK_SET_RATE_GATE,
-		},
-	},
-};
-
-static const char * const lcc_mi2s_parents[] = {
-	"mi2s_osr_src",
-};
-
-static struct clk_branch mi2s_osr_clk = {
-	.halt_reg = 0x50,
-	.halt_bit = 1,
-	.halt_check = BRANCH_HALT_ENABLE,
-	.clkr = {
-		.enable_reg = 0x48,
-		.enable_mask = BIT(17),
-		.hw.init = &(struct clk_init_data){
-			.name = "mi2s_osr_clk",
-			.parent_names = lcc_mi2s_parents,
-			.num_parents = 1,
-			.ops = &clk_branch_ops,
-			.flags = CLK_SET_RATE_PARENT,
-		},
-	},
-};
-
-static struct clk_regmap_div mi2s_div_clk = {
-	.reg = 0x48,
-	.shift = 10,
-	.width = 4,
-	.clkr = {
-		.enable_reg = 0x48,
-		.enable_mask = BIT(15),
-		.hw.init = &(struct clk_init_data){
-			.name = "mi2s_div_clk",
-			.parent_names = lcc_mi2s_parents,
-			.num_parents = 1,
-			.ops = &clk_regmap_div_ops,
-		},
-	},
-};
-
-static struct clk_branch mi2s_bit_div_clk = {
-	.halt_reg = 0x50,
-	.halt_bit = 0,
-	.halt_check = BRANCH_HALT_ENABLE,
-	.clkr = {
-		.enable_reg = 0x48,
-		.enable_mask = BIT(15),
-		.hw.init = &(struct clk_init_data){
-			.name = "mi2s_bit_div_clk",
-			.parent_names = (const char *[]){ "mi2s_div_clk" },
-			.num_parents = 1,
-			.ops = &clk_branch_ops,
-			.flags = CLK_SET_RATE_PARENT,
-		},
-	},
-};
-
-static struct clk_regmap_mux mi2s_bit_clk = {
-	.reg = 0x48,
-	.shift = 14,
-	.width = 1,
-	.clkr = {
-		.hw.init = &(struct clk_init_data){
-			.name = "mi2s_bit_clk",
-			.parent_names = (const char *[]){
-				"mi2s_bit_div_clk",
-				"mi2s_codec_clk",
-			},
-			.num_parents = 2,
-			.ops = &clk_regmap_mux_closest_ops,
-			.flags = CLK_SET_RATE_PARENT,
-		},
-	},
-};
-
-#define CLK_AIF_OSR_DIV(prefix, _ns, _md, hr)			\
+#define CLK_AIF_OSR_SRC(prefix, _ns, _md)			\
 static struct clk_rcg prefix##_osr_src = {			\
 	.ns_reg = _ns,						\
 	.md_reg = _md,						\
@@ -228,14 +123,15 @@ static struct clk_rcg prefix##_osr_src = {			\
 static const char * const lcc_##prefix##_parents[] = {		\
 	#prefix "_osr_src",					\
 };								\
-								\
+
+#define CLK_AIF_OSR_CLK(prefix, _ns, hr, en_bit)		\
 static struct clk_branch prefix##_osr_clk = {			\
 	.halt_reg = hr,						\
 	.halt_bit = 1,						\
 	.halt_check = BRANCH_HALT_ENABLE,			\
 	.clkr = {						\
 		.enable_reg = _ns,				\
-		.enable_mask = BIT(21),				\
+		.enable_mask = BIT(en_bit),			\
 		.hw.init = &(struct clk_init_data){		\
 			.name = #prefix "_osr_clk",		\
 			.parent_names = lcc_##prefix##_parents,	\
@@ -245,11 +141,12 @@ static struct clk_branch prefix##_osr_clk = {			\
 		},						\
 	},							\
 };								\
-								\
+
+#define CLK_AIF_OSR_DIV_CLK(prefix, _ns, _width)		\
 static struct clk_regmap_div prefix##_div_clk = {		\
 	.reg = _ns,						\
 	.shift = 10,						\
-	.width = 8,						\
+	.width = _width,					\
 	.clkr = {						\
 		.hw.init = &(struct clk_init_data){		\
 			.name = #prefix "_div_clk",		\
@@ -259,14 +156,15 @@ static struct clk_regmap_div prefix##_div_clk = {		\
 		},						\
 	},							\
 };								\
-								\
+
+#define CLK_AIF_OSR_BIT_DIV_CLK(prefix, _ns, hr, en_bit)	\
 static struct clk_branch prefix##_bit_div_clk = {		\
 	.halt_reg = hr,						\
 	.halt_bit = 0,						\
 	.halt_check = BRANCH_HALT_ENABLE,			\
 	.clkr = {						\
 		.enable_reg = _ns,				\
-		.enable_mask = BIT(19),				\
+		.enable_mask = BIT(en_bit),			\
 		.hw.init = &(struct clk_init_data){		\
 			.name = #prefix "_bit_div_clk",		\
 			.parent_names = (const char *[]){	\
@@ -278,10 +176,11 @@ static struct clk_branch prefix##_bit_div_clk = {		\
 		},						\
 	},							\
 };								\
-								\
+
+#define CLK_AIF_OSR_BIT_CLK(prefix, _ns, _shift)		\
 static struct clk_regmap_mux prefix##_bit_clk = {		\
 	.reg = _ns,						\
-	.shift = 18,						\
+	.shift = _shift,					\
 	.width = 1,						\
 	.clkr = {						\
 		.hw.init = &(struct clk_init_data){		\
@@ -295,7 +194,20 @@ static struct clk_regmap_mux prefix##_bit_clk = {		\
 			.flags = CLK_SET_RATE_PARENT,		\
 		},						\
 	},							\
-}
+};
+
+CLK_AIF_OSR_SRC(mi2s, 0x48, 0x4c)
+CLK_AIF_OSR_CLK(mi2s, 0x48, 0x50, 17)
+CLK_AIF_OSR_DIV_CLK(mi2s, 0x48, 4)
+CLK_AIF_OSR_BIT_DIV_CLK(mi2s, 0x48, 0x50, 15)
+CLK_AIF_OSR_BIT_CLK(mi2s, 0x48, 14)
+
+#define CLK_AIF_OSR_DIV(prefix, _ns, _md, hr)			\
+	CLK_AIF_OSR_SRC(prefix, _ns, _md)			\
+	CLK_AIF_OSR_CLK(prefix, _ns, hr, 21)			\
+	CLK_AIF_OSR_DIV_CLK(prefix, _ns, 8)			\
+	CLK_AIF_OSR_BIT_DIV_CLK(prefix, _ns, hr, 19)		\
+	CLK_AIF_OSR_BIT_CLK(prefix, _ns, 18)
 
 CLK_AIF_OSR_DIV(codec_i2s_mic, 0x60, 0x64, 0x68);
 CLK_AIF_OSR_DIV(spare_i2s_mic, 0x78, 0x7c, 0x80);
-- 
2.35.1

