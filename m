Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6363365C27E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 15:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237994AbjACOza (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 09:55:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237959AbjACOzY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 09:55:24 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88F99FCFF
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 06:55:21 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id x11so7710059ljh.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 06:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0DjFD6DDlkSaasVsbgc1TjcDfNry7eGHUeNLPJPbUM=;
        b=YyYVp54OuKWulaf2bIsx+nPvNvRUZx6fJcqNDrOk9uJKgXPpnI5PbdoQY4s1oHbFBu
         oYg2wrRviLIsTmwmcqcHxGvZ373X7eAorrUe8qPPYLi+Ht+oOetHWaD4hUm4G614GNh2
         mNm6qbceV9KI3AD2M1CS+gUW8IfA/6mZMLv+aDieWSLbsGScDqAm5/bet0mk/OiyWWFW
         mi6II0h6Y0QNKAS6vRChQRdBXVoWETrs3BGnJUqxtF8kdzU7VMWFx/HiB6ccBLC4m97F
         mlTrkjeGPtnJ0TRDQWRjFpuyZnwFkzxaPpja3AK/1kW1nFpg2SoGUdEJ2slySq8g6mdY
         vP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0DjFD6DDlkSaasVsbgc1TjcDfNry7eGHUeNLPJPbUM=;
        b=MuYPpWbaHNEtx804U9lTvsHbqm0700R6PZAZer8xozVLpM4VAm37XnTr5KZTt5rOVS
         gIku/ADf1EXMk+mOofgRLjqQ81j67/KMid0XETYvVIg2JhBj6U/xzHiB7KpDYAjwInaw
         kEnmpJgJ4V6+ZvzGaMF49dDeExytkXybiTrfZO1IXISAKO1iU8kIvlWPHWrYhExmvpui
         aLdCZrSESQaYOROG1gk4jZ50ywy/HadcGlYoZwiFcTLhKqIXDOh8glyBPuE+dN6PpeTm
         eRN60/QgUQC8ufsSa1Q/6LM7AqyiTYiVsWoa3sWKB67KW5XhSnZXzcwWs1eJNzePt1Vu
         wZPA==
X-Gm-Message-State: AFqh2kobRuXYF05Z9gM4Ayf91USutFX09kZMq/ZZ/OSF8F4s2B6BG/dL
        KBCo85tNbz6ZD71z7ohE7FCilTy5bhswxZ8H
X-Google-Smtp-Source: AMrXdXuP6H+D7EKK9C8nnHhzELO84keufsCo+ulESlGWpox1cM4k86+v5DBY5p/wTBQiF5j9HINNwg==
X-Received: by 2002:a2e:b113:0:b0:27f:d432:e0f9 with SMTP id p19-20020a2eb113000000b0027fd432e0f9mr6141660ljl.41.1672757721008;
        Tue, 03 Jan 2023 06:55:21 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s24-20020a2eb638000000b00279cbcfd7dbsm3544015ljn.30.2023.01.03.06.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:55:20 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 04/21] clk: qcom: camcc-sc7280: switch to parent_hws
Date:   Tue,  3 Jan 2023 16:54:58 +0200
Message-Id: <20230103145515.1164020-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
References: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
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

Change several entries of parent_data to use parent_hws instead, which
results in slightly more ovbious code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/camcc-sc7280.c | 268 ++++++++++++++++----------------
 1 file changed, 134 insertions(+), 134 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sc7280.c b/drivers/clk/qcom/camcc-sc7280.c
index ec163ea769f5..4396fddba7a6 100644
--- a/drivers/clk/qcom/camcc-sc7280.c
+++ b/drivers/clk/qcom/camcc-sc7280.c
@@ -88,8 +88,8 @@ static struct clk_alpha_pll_postdiv cam_cc_pll0_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_pll0_out_even",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &cam_cc_pll0.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll0.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -111,8 +111,8 @@ static struct clk_alpha_pll_postdiv cam_cc_pll0_out_odd = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_pll0_out_odd",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &cam_cc_pll0.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll0.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -163,8 +163,8 @@ static struct clk_alpha_pll_postdiv cam_cc_pll1_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_pll1_out_even",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &cam_cc_pll1.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll1.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -213,8 +213,8 @@ static struct clk_alpha_pll_postdiv cam_cc_pll2_out_aux = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_ZONDA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_pll2_out_aux",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &cam_cc_pll2.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll2.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -236,8 +236,8 @@ static struct clk_alpha_pll_postdiv cam_cc_pll2_out_aux2 = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_ZONDA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_pll2_out_aux2",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &cam_cc_pll2.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll2.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -288,8 +288,8 @@ static struct clk_alpha_pll_postdiv cam_cc_pll3_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_pll3_out_even",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &cam_cc_pll3.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll3.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -340,8 +340,8 @@ static struct clk_alpha_pll_postdiv cam_cc_pll4_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_pll4_out_even",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &cam_cc_pll4.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll4.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -392,8 +392,8 @@ static struct clk_alpha_pll_postdiv cam_cc_pll5_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_pll5_out_even",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &cam_cc_pll5.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll5.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -444,8 +444,8 @@ static struct clk_alpha_pll_postdiv cam_cc_pll6_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_pll6_out_even",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &cam_cc_pll6.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll6.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -467,8 +467,8 @@ static struct clk_alpha_pll_postdiv cam_cc_pll6_out_odd = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_pll6_out_odd",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &cam_cc_pll6.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll6.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1227,8 +1227,8 @@ static struct clk_branch cam_cc_bps_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_bps_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_slow_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1245,8 +1245,8 @@ static struct clk_branch cam_cc_bps_areg_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_bps_areg_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_fast_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1263,8 +1263,8 @@ static struct clk_branch cam_cc_bps_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_bps_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_camnoc_axi_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_camnoc_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1281,8 +1281,8 @@ static struct clk_branch cam_cc_bps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_bps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_bps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_bps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1299,8 +1299,8 @@ static struct clk_branch cam_cc_camnoc_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_camnoc_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_camnoc_axi_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_camnoc_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1317,8 +1317,8 @@ static struct clk_branch cam_cc_camnoc_dcd_xo_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_camnoc_dcd_xo_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_xo_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_xo_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1335,8 +1335,8 @@ static struct clk_branch cam_cc_cci_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_cci_0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_cci_0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cci_0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1353,8 +1353,8 @@ static struct clk_branch cam_cc_cci_1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_cci_1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_cci_1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cci_1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1371,8 +1371,8 @@ static struct clk_branch cam_cc_core_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_core_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_slow_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1389,8 +1389,8 @@ static struct clk_branch cam_cc_cpas_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_cpas_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_slow_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1407,8 +1407,8 @@ static struct clk_branch cam_cc_csi0phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csi0phytimer_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_csi0phytimer_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi0phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1425,8 +1425,8 @@ static struct clk_branch cam_cc_csi1phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csi1phytimer_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_csi1phytimer_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi1phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1443,8 +1443,8 @@ static struct clk_branch cam_cc_csi2phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csi2phytimer_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_csi2phytimer_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi2phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1461,8 +1461,8 @@ static struct clk_branch cam_cc_csi3phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csi3phytimer_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_csi3phytimer_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi3phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1479,8 +1479,8 @@ static struct clk_branch cam_cc_csi4phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csi4phytimer_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_csi4phytimer_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi4phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1497,8 +1497,8 @@ static struct clk_branch cam_cc_csiphy0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csiphy0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1515,8 +1515,8 @@ static struct clk_branch cam_cc_csiphy1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csiphy1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1533,8 +1533,8 @@ static struct clk_branch cam_cc_csiphy2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csiphy2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1551,8 +1551,8 @@ static struct clk_branch cam_cc_csiphy3_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csiphy3_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1569,8 +1569,8 @@ static struct clk_branch cam_cc_csiphy4_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_csiphy4_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1587,8 +1587,8 @@ static struct clk_branch cam_cc_gdsc_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_gdsc_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_xo_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_xo_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
@@ -1605,8 +1605,8 @@ static struct clk_branch cam_cc_icp_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_icp_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_slow_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1623,8 +1623,8 @@ static struct clk_branch cam_cc_icp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_icp_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_icp_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_icp_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1641,8 +1641,8 @@ static struct clk_branch cam_cc_ife_0_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_0_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_camnoc_axi_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_camnoc_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1659,8 +1659,8 @@ static struct clk_branch cam_cc_ife_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_ife_0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1677,8 +1677,8 @@ static struct clk_branch cam_cc_ife_0_cphy_rx_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_0_cphy_rx_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1695,8 +1695,8 @@ static struct clk_branch cam_cc_ife_0_csid_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_0_csid_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_ife_0_csid_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_0_csid_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1713,8 +1713,8 @@ static struct clk_branch cam_cc_ife_0_dsp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_0_dsp_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_ife_0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1731,8 +1731,8 @@ static struct clk_branch cam_cc_ife_1_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_1_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_camnoc_axi_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_camnoc_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1749,8 +1749,8 @@ static struct clk_branch cam_cc_ife_1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_ife_1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1767,8 +1767,8 @@ static struct clk_branch cam_cc_ife_1_cphy_rx_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_1_cphy_rx_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1785,8 +1785,8 @@ static struct clk_branch cam_cc_ife_1_csid_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_1_csid_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_ife_1_csid_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_1_csid_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1803,8 +1803,8 @@ static struct clk_branch cam_cc_ife_1_dsp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_1_dsp_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_ife_1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1821,8 +1821,8 @@ static struct clk_branch cam_cc_ife_2_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_2_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_camnoc_axi_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_camnoc_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1839,8 +1839,8 @@ static struct clk_branch cam_cc_ife_2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_ife_2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1857,8 +1857,8 @@ static struct clk_branch cam_cc_ife_2_cphy_rx_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_2_cphy_rx_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1875,8 +1875,8 @@ static struct clk_branch cam_cc_ife_2_csid_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_2_csid_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_ife_2_csid_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_2_csid_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1893,8 +1893,8 @@ static struct clk_branch cam_cc_ife_2_dsp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_2_dsp_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_ife_2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1911,8 +1911,8 @@ static struct clk_branch cam_cc_ife_lite_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_lite_0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_ife_lite_0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_lite_0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1929,8 +1929,8 @@ static struct clk_branch cam_cc_ife_lite_0_cphy_rx_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_lite_0_cphy_rx_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1947,8 +1947,8 @@ static struct clk_branch cam_cc_ife_lite_0_csid_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_lite_0_csid_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_ife_lite_0_csid_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_lite_0_csid_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1965,8 +1965,8 @@ static struct clk_branch cam_cc_ife_lite_1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_lite_1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_ife_lite_1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_lite_1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1983,8 +1983,8 @@ static struct clk_branch cam_cc_ife_lite_1_cphy_rx_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_lite_1_cphy_rx_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2001,8 +2001,8 @@ static struct clk_branch cam_cc_ife_lite_1_csid_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ife_lite_1_csid_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_ife_lite_1_csid_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_lite_1_csid_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2019,8 +2019,8 @@ static struct clk_branch cam_cc_ipe_0_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ipe_0_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_slow_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2037,8 +2037,8 @@ static struct clk_branch cam_cc_ipe_0_areg_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ipe_0_areg_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_fast_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2055,8 +2055,8 @@ static struct clk_branch cam_cc_ipe_0_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ipe_0_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_camnoc_axi_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_camnoc_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2073,8 +2073,8 @@ static struct clk_branch cam_cc_ipe_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_ipe_0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_ipe_0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ipe_0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2091,8 +2091,8 @@ static struct clk_branch cam_cc_jpeg_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_jpeg_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_jpeg_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_jpeg_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2109,8 +2109,8 @@ static struct clk_branch cam_cc_lrme_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_lrme_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_lrme_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_lrme_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2127,8 +2127,8 @@ static struct clk_branch cam_cc_mclk0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_mclk0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_mclk0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_mclk0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2145,8 +2145,8 @@ static struct clk_branch cam_cc_mclk1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_mclk1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_mclk1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_mclk1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2163,8 +2163,8 @@ static struct clk_branch cam_cc_mclk2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_mclk2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_mclk2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_mclk2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2181,8 +2181,8 @@ static struct clk_branch cam_cc_mclk3_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_mclk3_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_mclk3_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_mclk3_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2199,8 +2199,8 @@ static struct clk_branch cam_cc_mclk4_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_mclk4_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_mclk4_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_mclk4_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2217,8 +2217,8 @@ static struct clk_branch cam_cc_mclk5_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_mclk5_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_mclk5_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_mclk5_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2235,8 +2235,8 @@ static struct clk_branch cam_cc_sleep_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "cam_cc_sleep_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cam_cc_sleep_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_sleep_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.39.0

