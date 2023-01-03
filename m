Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A014E65C26E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 15:57:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238035AbjACOzq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 09:55:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237977AbjACOz3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 09:55:29 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AF9210FE8
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 06:55:23 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id n1so32076849ljg.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 06:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFeQcvuQIcGxBdcGrP70bjEsZBcCu5S9O1uVPA8Troo=;
        b=xxn/KyuC78Gvp88TW6KaMntNEIGM5sjbqznonbTjQZfpBdLLWi3Fwuv9BqEevv9WE8
         ePrlmoRGRrCDXJKW6OrFGQsZRYkYlkhwurZy1Gb1HTI13mbZRJaQ0GXAJy+D4lRf6vrM
         FdKHiXjzUoAQUxlmeLgr36dvdrtWQKAUQkez4vZcUbPAR/7VdWwr3FcKGrExdusnB8bb
         AwMFFErfmpJKMeU9+p3TSmlDirdwvbeph7EzPJ+LGLLJO4GPdMnCt4Av92QQHjfKvm3B
         GDVg9VLHyn/NK9/YeCZ/hIfsVYQQjcpVbANmf5zRmEN6S0X5/Fca2BFmdgHXdhLkfAoH
         eM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFeQcvuQIcGxBdcGrP70bjEsZBcCu5S9O1uVPA8Troo=;
        b=UbpT0BiXD047F8TD5IF5K7TPdlSf4f99Gp5siipHgIpHc+zPNxXazxOD7+1klcDASl
         Ih8zCpbbc5HRYVXTZb0q8QbxBUCLbHCdU835D6htmk9Bz98IwuRGcRUvx2/5Ry5TsW3b
         k0FnrRxgpIw125SdnoFMJa224sT0odQHzZotOPwV0gF2tLnaAxzBZU/KERjuQdeAJ9Vc
         Ua1b8mZuZgSq9Bz1p0KE0ZweV7EqJYnm33hlMYnAdH43YRNnIYx7/nkmnip0YGSfhYLm
         hCkcZtKeusQE8ihSypXt2lk/0ap4+b/3m/AETXcybgFlYSvmx2tOzXTTM7OBLWc3yO8d
         LeZg==
X-Gm-Message-State: AFqh2kqxJpqZ4FewYOrWpoCqxMZRUxcjY1V6TZolJkpg83uOsdbzKW3l
        5xuuvtYcVHJhPUW/GFIkb00KGQ==
X-Google-Smtp-Source: AMrXdXvipXWotEw8xE5BuhiuSmXwXcOrqKc8E/eDcU3ojnT3kDQP7R+oxL+wyPhe3qY6Unx9NjOnOw==
X-Received: by 2002:a2e:b895:0:b0:279:ee72:6ab1 with SMTP id r21-20020a2eb895000000b00279ee726ab1mr15112635ljp.42.1672757721674;
        Tue, 03 Jan 2023 06:55:21 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s24-20020a2eb638000000b00279cbcfd7dbsm3544015ljn.30.2023.01.03.06.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:55:21 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 05/21] clk: qcom: camcc-sm8450: switch to parent_hws
Date:   Tue,  3 Jan 2023 16:54:59 +0200
Message-Id: <20230103145515.1164020-6-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/camcc-sm8450.c | 324 ++++++++++++++++----------------
 1 file changed, 162 insertions(+), 162 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sm8450.c b/drivers/clk/qcom/camcc-sm8450.c
index e3c09471dadf..51338a2884d2 100644
--- a/drivers/clk/qcom/camcc-sm8450.c
+++ b/drivers/clk/qcom/camcc-sm8450.c
@@ -95,8 +95,8 @@ static struct clk_alpha_pll_postdiv cam_cc_pll0_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
 	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "cam_cc_pll0_out_even",
-		.parent_data = &(const struct clk_parent_data) {
-			.hw = &cam_cc_pll0.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll0.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -118,8 +118,8 @@ static struct clk_alpha_pll_postdiv cam_cc_pll0_out_odd = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
 	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "cam_cc_pll0_out_odd",
-		.parent_data = &(const struct clk_parent_data) {
-			.hw = &cam_cc_pll0.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll0.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -166,8 +166,8 @@ static struct clk_alpha_pll_postdiv cam_cc_pll1_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
 	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "cam_cc_pll1_out_even",
-		.parent_data = &(const struct clk_parent_data) {
-			.hw = &cam_cc_pll1.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll1.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -237,8 +237,8 @@ static struct clk_alpha_pll_postdiv cam_cc_pll3_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
 	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "cam_cc_pll3_out_even",
-		.parent_data = &(const struct clk_parent_data) {
-			.hw = &cam_cc_pll3.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll3.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -285,8 +285,8 @@ static struct clk_alpha_pll_postdiv cam_cc_pll4_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
 	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "cam_cc_pll4_out_even",
-		.parent_data = &(const struct clk_parent_data) {
-			.hw = &cam_cc_pll4.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll4.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -333,8 +333,8 @@ static struct clk_alpha_pll_postdiv cam_cc_pll5_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
 	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "cam_cc_pll5_out_even",
-		.parent_data = &(const struct clk_parent_data) {
-			.hw = &cam_cc_pll5.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll5.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -381,8 +381,8 @@ static struct clk_alpha_pll_postdiv cam_cc_pll6_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
 	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "cam_cc_pll6_out_even",
-		.parent_data = &(const struct clk_parent_data) {
-			.hw = &cam_cc_pll6.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll6.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -429,8 +429,8 @@ static struct clk_alpha_pll_postdiv cam_cc_pll7_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
 	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "cam_cc_pll7_out_even",
-		.parent_data = &(const struct clk_parent_data) {
-			.hw = &cam_cc_pll7.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll7.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -477,8 +477,8 @@ static struct clk_alpha_pll_postdiv cam_cc_pll8_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
 	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "cam_cc_pll8_out_even",
-		.parent_data = &(const struct clk_parent_data) {
-			.hw = &cam_cc_pll8.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll8.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1268,8 +1268,8 @@ static struct clk_branch cam_cc_gdsc_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_gdsc_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_xo_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_xo_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
@@ -1286,8 +1286,8 @@ static struct clk_branch cam_cc_bps_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_bps_ahb_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_slow_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1304,8 +1304,8 @@ static struct clk_branch cam_cc_bps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_bps_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_bps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_bps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1322,8 +1322,8 @@ static struct clk_branch cam_cc_bps_fast_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_bps_fast_ahb_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_fast_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1340,8 +1340,8 @@ static struct clk_branch cam_cc_camnoc_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_camnoc_axi_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_camnoc_axi_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_camnoc_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1358,8 +1358,8 @@ static struct clk_branch cam_cc_camnoc_dcd_xo_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_camnoc_dcd_xo_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_xo_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_xo_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1376,8 +1376,8 @@ static struct clk_branch cam_cc_cci_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_cci_0_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_cci_0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cci_0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1394,8 +1394,8 @@ static struct clk_branch cam_cc_cci_1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_cci_1_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_cci_1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cci_1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1412,8 +1412,8 @@ static struct clk_branch cam_cc_core_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_core_ahb_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_slow_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1430,8 +1430,8 @@ static struct clk_branch cam_cc_cpas_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_cpas_ahb_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_slow_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1448,8 +1448,8 @@ static struct clk_branch cam_cc_cpas_bps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_cpas_bps_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_bps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_bps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1466,8 +1466,8 @@ static struct clk_branch cam_cc_cpas_fast_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_cpas_fast_ahb_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_fast_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1484,8 +1484,8 @@ static struct clk_branch cam_cc_cpas_ife_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_cpas_ife_0_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_ife_0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1502,8 +1502,8 @@ static struct clk_branch cam_cc_cpas_ife_1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_cpas_ife_1_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_ife_1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1520,8 +1520,8 @@ static struct clk_branch cam_cc_cpas_ife_2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_cpas_ife_2_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_ife_2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1538,8 +1538,8 @@ static struct clk_branch cam_cc_cpas_ife_lite_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_cpas_ife_lite_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_ife_lite_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_lite_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1556,8 +1556,8 @@ static struct clk_branch cam_cc_cpas_ipe_nps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_cpas_ipe_nps_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_ipe_nps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ipe_nps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1574,8 +1574,8 @@ static struct clk_branch cam_cc_cpas_sbi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_cpas_sbi_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_ife_0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1592,8 +1592,8 @@ static struct clk_branch cam_cc_cpas_sfe_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_cpas_sfe_0_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_sfe_0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_sfe_0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1610,8 +1610,8 @@ static struct clk_branch cam_cc_cpas_sfe_1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_cpas_sfe_1_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_sfe_1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_sfe_1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1628,8 +1628,8 @@ static struct clk_branch cam_cc_csi0phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_csi0phytimer_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_csi0phytimer_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi0phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1646,8 +1646,8 @@ static struct clk_branch cam_cc_csi1phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_csi1phytimer_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_csi1phytimer_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi1phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1664,8 +1664,8 @@ static struct clk_branch cam_cc_csi2phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_csi2phytimer_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_csi2phytimer_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi2phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1682,8 +1682,8 @@ static struct clk_branch cam_cc_csi3phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_csi3phytimer_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_csi3phytimer_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi3phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1700,8 +1700,8 @@ static struct clk_branch cam_cc_csi4phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_csi4phytimer_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_csi4phytimer_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi4phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1718,8 +1718,8 @@ static struct clk_branch cam_cc_csi5phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_csi5phytimer_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_csi5phytimer_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi5phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1736,8 +1736,8 @@ static struct clk_branch cam_cc_csid_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_csid_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_csid_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csid_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1754,8 +1754,8 @@ static struct clk_branch cam_cc_csid_csiphy_rx_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_csid_csiphy_rx_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1772,8 +1772,8 @@ static struct clk_branch cam_cc_csiphy0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_csiphy0_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1790,8 +1790,8 @@ static struct clk_branch cam_cc_csiphy1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_csiphy1_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1808,8 +1808,8 @@ static struct clk_branch cam_cc_csiphy2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_csiphy2_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1826,8 +1826,8 @@ static struct clk_branch cam_cc_csiphy3_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_csiphy3_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1844,8 +1844,8 @@ static struct clk_branch cam_cc_csiphy4_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_csiphy4_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1862,8 +1862,8 @@ static struct clk_branch cam_cc_csiphy5_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_csiphy5_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1880,8 +1880,8 @@ static struct clk_branch cam_cc_icp_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_icp_ahb_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_slow_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1898,8 +1898,8 @@ static struct clk_branch cam_cc_icp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_icp_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_icp_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_icp_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1916,8 +1916,8 @@ static struct clk_branch cam_cc_ife_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_ife_0_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_ife_0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1934,8 +1934,8 @@ static struct clk_branch cam_cc_ife_0_dsp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_ife_0_dsp_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_ife_0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1952,8 +1952,8 @@ static struct clk_branch cam_cc_ife_0_fast_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_ife_0_fast_ahb_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_fast_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1970,8 +1970,8 @@ static struct clk_branch cam_cc_ife_1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_ife_1_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_ife_1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1988,8 +1988,8 @@ static struct clk_branch cam_cc_ife_1_dsp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_ife_1_dsp_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_ife_1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2006,8 +2006,8 @@ static struct clk_branch cam_cc_ife_1_fast_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_ife_1_fast_ahb_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_fast_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2024,8 +2024,8 @@ static struct clk_branch cam_cc_ife_2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_ife_2_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_ife_2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2042,8 +2042,8 @@ static struct clk_branch cam_cc_ife_2_dsp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_ife_2_dsp_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_ife_2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2060,8 +2060,8 @@ static struct clk_branch cam_cc_ife_2_fast_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_ife_2_fast_ahb_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_fast_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2078,8 +2078,8 @@ static struct clk_branch cam_cc_ife_lite_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_ife_lite_ahb_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_slow_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2096,8 +2096,8 @@ static struct clk_branch cam_cc_ife_lite_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_ife_lite_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_ife_lite_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_lite_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2114,8 +2114,8 @@ static struct clk_branch cam_cc_ife_lite_cphy_rx_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_ife_lite_cphy_rx_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2132,8 +2132,8 @@ static struct clk_branch cam_cc_ife_lite_csid_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_ife_lite_csid_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_ife_lite_csid_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_lite_csid_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2150,8 +2150,8 @@ static struct clk_branch cam_cc_ipe_nps_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_ipe_nps_ahb_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_slow_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2168,8 +2168,8 @@ static struct clk_branch cam_cc_ipe_nps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_ipe_nps_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_ipe_nps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ipe_nps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2186,8 +2186,8 @@ static struct clk_branch cam_cc_ipe_nps_fast_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_ipe_nps_fast_ahb_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_fast_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2204,8 +2204,8 @@ static struct clk_branch cam_cc_ipe_pps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_ipe_pps_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_ipe_nps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ipe_nps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2222,8 +2222,8 @@ static struct clk_branch cam_cc_ipe_pps_fast_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_ipe_pps_fast_ahb_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_fast_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2240,8 +2240,8 @@ static struct clk_branch cam_cc_jpeg_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_jpeg_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_jpeg_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_jpeg_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2258,8 +2258,8 @@ static struct clk_branch cam_cc_mclk0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_mclk0_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_mclk0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_mclk0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2276,8 +2276,8 @@ static struct clk_branch cam_cc_mclk1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_mclk1_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_mclk1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_mclk1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2294,8 +2294,8 @@ static struct clk_branch cam_cc_mclk2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_mclk2_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_mclk2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_mclk2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2312,8 +2312,8 @@ static struct clk_branch cam_cc_mclk3_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_mclk3_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_mclk3_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_mclk3_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2330,8 +2330,8 @@ static struct clk_branch cam_cc_mclk4_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_mclk4_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_mclk4_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_mclk4_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2348,8 +2348,8 @@ static struct clk_branch cam_cc_mclk5_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_mclk5_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_mclk5_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_mclk5_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2366,8 +2366,8 @@ static struct clk_branch cam_cc_mclk6_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_mclk6_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_mclk6_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_mclk6_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2384,8 +2384,8 @@ static struct clk_branch cam_cc_mclk7_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_mclk7_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_mclk7_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_mclk7_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2402,8 +2402,8 @@ static struct clk_branch cam_cc_qdss_debug_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_qdss_debug_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_qdss_debug_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_qdss_debug_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2420,8 +2420,8 @@ static struct clk_branch cam_cc_qdss_debug_xo_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_qdss_debug_xo_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_xo_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_xo_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2438,8 +2438,8 @@ static struct clk_branch cam_cc_sbi_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_sbi_ahb_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_slow_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2456,8 +2456,8 @@ static struct clk_branch cam_cc_sbi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_sbi_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_ife_0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2474,8 +2474,8 @@ static struct clk_branch cam_cc_sfe_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_sfe_0_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_sfe_0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_sfe_0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2492,8 +2492,8 @@ static struct clk_branch cam_cc_sfe_0_fast_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_sfe_0_fast_ahb_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_fast_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2510,8 +2510,8 @@ static struct clk_branch cam_cc_sfe_1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_sfe_1_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_sfe_1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_sfe_1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2528,8 +2528,8 @@ static struct clk_branch cam_cc_sfe_1_fast_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_sfe_1_fast_ahb_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_fast_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2546,8 +2546,8 @@ static struct clk_branch cam_cc_sleep_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "cam_cc_sleep_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cam_cc_sleep_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_sleep_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.39.0

