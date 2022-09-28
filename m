Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD1D5EDF52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 16:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233825AbiI1O4l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 10:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234489AbiI1O4c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 10:56:32 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A1A9C2CE
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 07:56:14 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id z4so2968692lft.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 07:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=wMjD4QgXqbm6ud/FjIMa+eCSP1BFLdj8IWHHS1ORAfQ=;
        b=mrL4sBRppY3XsWo4fGnByTGyvYtWM6cYNoJgWiVUH2UWrw/8ar/ggcJ/Rrz5t3X2pv
         EyAZDLseHRdJFCA398+CewwdlWFvsNC3xXEofh7FtwqGIPaCW7lc288DJpWqDLQHHDxR
         dwnvkKNzga6KoizygtYlus0EayYBZSNS4IBNWUlRwbL/P+Gf4dzpaw6VzPNkRBABC62+
         iguTLMp7f0K4KdauVD1fS/EGieHdyBvgECmgrSJ1VOU9YbEcGRnUmPYGTd5szN8wIsIo
         B7KJ+0YBRMxbTlc4TYs5O1IN+3yZVBfE7appC/1z10CYlzKixfC2yXI50gQmBC9sFCAo
         i+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=wMjD4QgXqbm6ud/FjIMa+eCSP1BFLdj8IWHHS1ORAfQ=;
        b=xDa2EJyrggt1xxu8Oise5yo5dWPvrfkCJKTZiwt1RMYtcuBNUNu1RnN71S+MeRjKva
         UXuWodhpRJMFnc/JuC9oBIg6hgTBpgSgke7u3TV1vUzA08WztkQc9oTDqGSUCZ/hlwJL
         6q751PLEqtHnNbEaom+6FvVVfgp0gv1dV8F/NPtY0Yypj8Pc9vPBIytGNCHUMDgZzwYd
         jmZkowxq+jyIPCJgsyN6vmC8YdC2Gb2j410M5L5FQMEfoYLWpPTde8vkY9uDfHLHIrfk
         Ph6RWpcAMfBr6Ps/q5sWMpUMIHftyS4b/0hxnphNH6LxZEEW81fbE/JSQISwCcIwaZXh
         pNxQ==
X-Gm-Message-State: ACrzQf2ErQlBLVpfAGqkgnplU197AMeXl0odAnAv0L6vKndkXqlqyz5R
        jNohc3Tp9rrpcGKGUyLj1wSlFg==
X-Google-Smtp-Source: AMsMyM5bVOJgcM6ZuVrC1U3V/BIwcPZy6fvWMIiR/T2qDQZoV19ljlzyTdPomWPXb1GWmA6/S6H+SQ==
X-Received: by 2002:a05:6512:3409:b0:499:f8f1:8322 with SMTP id i9-20020a056512340900b00499f8f18322mr13826108lfr.459.1664376972390;
        Wed, 28 Sep 2022 07:56:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o6-20020a05651238a600b0048b256bb005sm498094lft.49.2022.09.28.07.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 07:56:11 -0700 (PDT)
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
Subject: [PATCH 2/3] clk: qcom: gcc-msm8939: use parent_hws where possible
Date:   Wed, 28 Sep 2022 17:56:08 +0300
Message-Id: <20220928145609.375860-3-dmitry.baryshkov@linaro.org>
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

Use parent_hws instead of hanving parent_data with just a single .hw
entry to speed up and simplify parent lookups.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8939.c | 432 ++++++++++++++++-----------------
 1 file changed, 216 insertions(+), 216 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 8e2d9fb98ad5..9d4f35716990 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -1568,8 +1568,8 @@ static struct clk_branch gcc_ultaudio_ahbfabric_ixfabric_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ultaudio_ahbfabric_ixfabric_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &ultaudio_ahbfabric_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&ultaudio_ahbfabric_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1585,8 +1585,8 @@ static struct clk_branch gcc_ultaudio_ahbfabric_ixfabric_lpm_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ultaudio_ahbfabric_ixfabric_lpm_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &ultaudio_ahbfabric_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&ultaudio_ahbfabric_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1647,8 +1647,8 @@ static struct clk_branch gcc_ultaudio_lpaif_pri_i2s_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ultaudio_lpaif_pri_i2s_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &ultaudio_lpaif_pri_i2s_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&ultaudio_lpaif_pri_i2s_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1678,8 +1678,8 @@ static struct clk_branch gcc_ultaudio_lpaif_sec_i2s_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ultaudio_lpaif_sec_i2s_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &ultaudio_lpaif_sec_i2s_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&ultaudio_lpaif_sec_i2s_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1709,8 +1709,8 @@ static struct clk_branch gcc_ultaudio_lpaif_aux_i2s_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ultaudio_lpaif_aux_i2s_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &ultaudio_lpaif_aux_i2s_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&ultaudio_lpaif_aux_i2s_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1744,8 +1744,8 @@ static struct clk_branch gcc_ultaudio_avsync_xo_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ultaudio_avsync_xo_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &ultaudio_xo_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&ultaudio_xo_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1761,8 +1761,8 @@ static struct clk_branch gcc_ultaudio_stc_xo_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ultaudio_stc_xo_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &ultaudio_xo_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&ultaudio_xo_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1800,8 +1800,8 @@ static struct clk_branch gcc_codec_digcodec_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ultaudio_codec_digcodec_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &codec_digcodec_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&codec_digcodec_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1817,8 +1817,8 @@ static struct clk_branch gcc_ultaudio_pcnoc_mport_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ultaudio_pcnoc_mport_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &pcnoc_bfdcd_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1833,8 +1833,8 @@ static struct clk_branch gcc_ultaudio_pcnoc_sway_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ultaudio_pcnoc_sway_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &pcnoc_bfdcd_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1871,8 +1871,8 @@ static struct clk_branch gcc_blsp1_ahb_clk = {
 		.enable_mask = BIT(10),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &pcnoc_bfdcd_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1899,8 +1899,8 @@ static struct clk_branch gcc_blsp1_qup1_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup1_i2c_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &blsp1_qup1_i2c_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup1_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1916,8 +1916,8 @@ static struct clk_branch gcc_blsp1_qup1_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup1_spi_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &blsp1_qup1_spi_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup1_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1933,8 +1933,8 @@ static struct clk_branch gcc_blsp1_qup2_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup2_i2c_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &blsp1_qup2_i2c_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup2_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1950,8 +1950,8 @@ static struct clk_branch gcc_blsp1_qup2_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup2_spi_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &blsp1_qup2_spi_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup2_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1967,8 +1967,8 @@ static struct clk_branch gcc_blsp1_qup3_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup3_i2c_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &blsp1_qup3_i2c_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup3_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1984,8 +1984,8 @@ static struct clk_branch gcc_blsp1_qup3_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup3_spi_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &blsp1_qup3_spi_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup3_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2001,8 +2001,8 @@ static struct clk_branch gcc_blsp1_qup4_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup4_i2c_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &blsp1_qup4_i2c_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup4_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2018,8 +2018,8 @@ static struct clk_branch gcc_blsp1_qup4_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup4_spi_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &blsp1_qup4_spi_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup4_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2035,8 +2035,8 @@ static struct clk_branch gcc_blsp1_qup5_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup5_i2c_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &blsp1_qup5_i2c_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup5_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2052,8 +2052,8 @@ static struct clk_branch gcc_blsp1_qup5_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup5_spi_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &blsp1_qup5_spi_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup5_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2069,8 +2069,8 @@ static struct clk_branch gcc_blsp1_qup6_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup6_i2c_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &blsp1_qup6_i2c_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup6_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2086,8 +2086,8 @@ static struct clk_branch gcc_blsp1_qup6_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup6_spi_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &blsp1_qup6_spi_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup6_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2103,8 +2103,8 @@ static struct clk_branch gcc_blsp1_uart1_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart1_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &blsp1_uart1_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_uart1_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2120,8 +2120,8 @@ static struct clk_branch gcc_blsp1_uart2_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart2_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &blsp1_uart2_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_uart2_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2138,8 +2138,8 @@ static struct clk_branch gcc_boot_rom_ahb_clk = {
 		.enable_mask = BIT(7),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_boot_rom_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &pcnoc_bfdcd_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2154,8 +2154,8 @@ static struct clk_branch gcc_camss_cci_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_cci_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &camss_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&camss_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2171,8 +2171,8 @@ static struct clk_branch gcc_camss_cci_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_cci_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cci_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cci_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2188,8 +2188,8 @@ static struct clk_branch gcc_camss_csi0_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi0_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &camss_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&camss_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2205,8 +2205,8 @@ static struct clk_branch gcc_camss_csi0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &csi0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&csi0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2222,8 +2222,8 @@ static struct clk_branch gcc_camss_csi0phy_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi0phy_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &csi0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&csi0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2239,8 +2239,8 @@ static struct clk_branch gcc_camss_csi0pix_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi0pix_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &csi0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&csi0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2256,8 +2256,8 @@ static struct clk_branch gcc_camss_csi0rdi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi0rdi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &csi0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&csi0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2273,8 +2273,8 @@ static struct clk_branch gcc_camss_csi1_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi1_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &camss_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&camss_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2290,8 +2290,8 @@ static struct clk_branch gcc_camss_csi1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &csi1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&csi1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2307,8 +2307,8 @@ static struct clk_branch gcc_camss_csi1phy_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi1phy_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &csi1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&csi1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2324,8 +2324,8 @@ static struct clk_branch gcc_camss_csi1pix_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi1pix_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &csi1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&csi1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2341,8 +2341,8 @@ static struct clk_branch gcc_camss_csi1rdi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi1rdi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &csi1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&csi1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2358,8 +2358,8 @@ static struct clk_branch gcc_camss_csi_vfe0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi_vfe0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &vfe0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&vfe0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2375,8 +2375,8 @@ static struct clk_branch gcc_camss_gp0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_gp0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &camss_gp0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&camss_gp0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2392,8 +2392,8 @@ static struct clk_branch gcc_camss_gp1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_gp1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &camss_gp1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&camss_gp1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2409,8 +2409,8 @@ static struct clk_branch gcc_camss_ispif_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_ispif_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &camss_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&camss_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2426,8 +2426,8 @@ static struct clk_branch gcc_camss_jpeg0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_jpeg0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &jpeg0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&jpeg0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2443,8 +2443,8 @@ static struct clk_branch gcc_camss_jpeg_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_jpeg_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &camss_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&camss_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2460,8 +2460,8 @@ static struct clk_branch gcc_camss_jpeg_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_jpeg_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &system_mm_noc_bfdcd_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&system_mm_noc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2477,8 +2477,8 @@ static struct clk_branch gcc_camss_mclk0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_mclk0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &mclk0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&mclk0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2494,8 +2494,8 @@ static struct clk_branch gcc_camss_mclk1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_mclk1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &mclk1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&mclk1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2511,8 +2511,8 @@ static struct clk_branch gcc_camss_micro_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_micro_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &camss_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&camss_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2528,8 +2528,8 @@ static struct clk_branch gcc_camss_csi0phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi0phytimer_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &csi0phytimer_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&csi0phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2545,8 +2545,8 @@ static struct clk_branch gcc_camss_csi1phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi1phytimer_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &csi1phytimer_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&csi1phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2562,8 +2562,8 @@ static struct clk_branch gcc_camss_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &camss_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&camss_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2579,8 +2579,8 @@ static struct clk_branch gcc_camss_top_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_top_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &pcnoc_bfdcd_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2596,8 +2596,8 @@ static struct clk_branch gcc_camss_cpp_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_cpp_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &camss_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&camss_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2613,8 +2613,8 @@ static struct clk_branch gcc_camss_cpp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_cpp_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &cpp_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&cpp_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2630,8 +2630,8 @@ static struct clk_branch gcc_camss_vfe0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_vfe0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &vfe0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&vfe0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2647,8 +2647,8 @@ static struct clk_branch gcc_camss_vfe_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_vfe_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &camss_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&camss_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2664,8 +2664,8 @@ static struct clk_branch gcc_camss_vfe_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_vfe_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &system_mm_noc_bfdcd_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&system_mm_noc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2682,8 +2682,8 @@ static struct clk_branch gcc_crypto_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_crypto_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &pcnoc_bfdcd_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2700,8 +2700,8 @@ static struct clk_branch gcc_crypto_axi_clk = {
 		.enable_mask = BIT(1),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_crypto_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &pcnoc_bfdcd_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2718,8 +2718,8 @@ static struct clk_branch gcc_crypto_clk = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_crypto_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &crypto_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&crypto_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2735,8 +2735,8 @@ static struct clk_branch gcc_oxili_gmem_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_oxili_gmem_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gfx3d_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gfx3d_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2752,8 +2752,8 @@ static struct clk_branch gcc_gp1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gp1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gp1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2769,8 +2769,8 @@ static struct clk_branch gcc_gp2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gp2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gp2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2786,8 +2786,8 @@ static struct clk_branch gcc_gp3_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp3_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gp3_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gp3_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2803,8 +2803,8 @@ static struct clk_branch gcc_mdss_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mdss_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &pcnoc_bfdcd_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2820,8 +2820,8 @@ static struct clk_branch gcc_mdss_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mdss_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &system_mm_noc_bfdcd_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&system_mm_noc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2837,8 +2837,8 @@ static struct clk_branch gcc_mdss_byte0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mdss_byte0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &byte0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&byte0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2854,8 +2854,8 @@ static struct clk_branch gcc_mdss_byte1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mdss_byte1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &byte1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&byte1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2871,8 +2871,8 @@ static struct clk_branch gcc_mdss_esc0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mdss_esc0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &esc0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&esc0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2888,8 +2888,8 @@ static struct clk_branch gcc_mdss_esc1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mdss_esc1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &esc1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&esc1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2905,8 +2905,8 @@ static struct clk_branch gcc_mdss_mdp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mdss_mdp_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &mdp_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&mdp_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2922,8 +2922,8 @@ static struct clk_branch gcc_mdss_pclk0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mdss_pclk0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &pclk0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&pclk0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2939,8 +2939,8 @@ static struct clk_branch gcc_mdss_pclk1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mdss_pclk1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &pclk1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&pclk1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2956,8 +2956,8 @@ static struct clk_branch gcc_mdss_vsync_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mdss_vsync_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &vsync_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&vsync_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2973,8 +2973,8 @@ static struct clk_branch gcc_mss_cfg_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mss_cfg_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &pcnoc_bfdcd_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2990,8 +2990,8 @@ static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mss_q6_bimc_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &bimc_ddr_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&bimc_ddr_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3007,8 +3007,8 @@ static struct clk_branch gcc_oxili_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_oxili_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &pcnoc_bfdcd_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3024,8 +3024,8 @@ static struct clk_branch gcc_oxili_gfx3d_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_oxili_gfx3d_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gfx3d_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gfx3d_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3041,8 +3041,8 @@ static struct clk_branch gcc_pdm2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pdm2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &pdm2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&pdm2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3058,8 +3058,8 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pdm_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &pcnoc_bfdcd_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3076,8 +3076,8 @@ static struct clk_branch gcc_prng_ahb_clk = {
 		.enable_mask = BIT(8),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_prng_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &pcnoc_bfdcd_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -3092,8 +3092,8 @@ static struct clk_branch gcc_sdcc1_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc1_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &pcnoc_bfdcd_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3109,8 +3109,8 @@ static struct clk_branch gcc_sdcc1_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc1_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &sdcc1_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&sdcc1_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3126,8 +3126,8 @@ static struct clk_branch gcc_sdcc2_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc2_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &pcnoc_bfdcd_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3143,8 +3143,8 @@ static struct clk_branch gcc_sdcc2_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc2_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &sdcc2_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&sdcc2_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3161,8 +3161,8 @@ static struct clk_branch gcc_apss_tcu_clk = {
 		.enable_mask = BIT(1),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_apss_tcu_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &bimc_ddr_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&bimc_ddr_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -3178,8 +3178,8 @@ static struct clk_branch gcc_gfx_tcu_clk = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gfx_tcu_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &bimc_ddr_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&bimc_ddr_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -3195,8 +3195,8 @@ static struct clk_branch gcc_gfx_tbu_clk = {
 		.enable_mask = BIT(3),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gfx_tbu_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &bimc_ddr_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&bimc_ddr_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -3212,8 +3212,8 @@ static struct clk_branch gcc_mdp_tbu_clk = {
 		.enable_mask = BIT(4),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mdp_tbu_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &system_mm_noc_bfdcd_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&system_mm_noc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3230,8 +3230,8 @@ static struct clk_branch gcc_venus_tbu_clk = {
 		.enable_mask = BIT(5),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_venus_tbu_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &system_mm_noc_bfdcd_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&system_mm_noc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3248,8 +3248,8 @@ static struct clk_branch gcc_vfe_tbu_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_vfe_tbu_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &system_mm_noc_bfdcd_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&system_mm_noc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3266,8 +3266,8 @@ static struct clk_branch gcc_jpeg_tbu_clk = {
 		.enable_mask = BIT(10),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_jpeg_tbu_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &system_mm_noc_bfdcd_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&system_mm_noc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3284,8 +3284,8 @@ static struct clk_branch gcc_smmu_cfg_clk = {
 		.enable_mask = BIT(12),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_smmu_cfg_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &pcnoc_bfdcd_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3302,8 +3302,8 @@ static struct clk_branch gcc_gtcu_ahb_clk = {
 		.enable_mask = BIT(13),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gtcu_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &pcnoc_bfdcd_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3320,8 +3320,8 @@ static struct clk_branch gcc_cpp_tbu_clk = {
 		.enable_mask = BIT(14),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_cpp_tbu_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &pcnoc_bfdcd_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3338,8 +3338,8 @@ static struct clk_branch gcc_mdp_rt_tbu_clk = {
 		.enable_mask = BIT(15),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mdp_rt_tbu_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &pcnoc_bfdcd_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3355,8 +3355,8 @@ static struct clk_branch gcc_bimc_gfx_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_bimc_gfx_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &bimc_gpu_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&bimc_gpu_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3372,8 +3372,8 @@ static struct clk_branch gcc_bimc_gpu_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_bimc_gpu_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &bimc_gpu_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&bimc_gpu_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3401,8 +3401,8 @@ static struct clk_branch gcc_usb_fs_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_fs_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &pcnoc_bfdcd_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3418,8 +3418,8 @@ static struct clk_branch gcc_usb_fs_ic_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_fs_ic_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &usb_fs_ic_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&usb_fs_ic_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3435,8 +3435,8 @@ static struct clk_branch gcc_usb_fs_system_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_fs_system_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &usb_fs_system_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&usb_fs_system_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3452,8 +3452,8 @@ static struct clk_branch gcc_usb_hs_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_hs_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &pcnoc_bfdcd_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3469,8 +3469,8 @@ static struct clk_branch gcc_usb_hs_system_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_hs_system_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &usb_hs_system_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&usb_hs_system_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3486,8 +3486,8 @@ static struct clk_branch gcc_venus0_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_venus0_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &pcnoc_bfdcd_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3503,8 +3503,8 @@ static struct clk_branch gcc_venus0_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_venus0_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &system_mm_noc_bfdcd_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&system_mm_noc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3520,8 +3520,8 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_venus0_vcodec0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &vcodec0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&vcodec0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3537,8 +3537,8 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_venus0_core0_vcodec0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &vcodec0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&vcodec0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3554,8 +3554,8 @@ static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_venus0_core1_vcodec0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &vcodec0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&vcodec0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.35.1

