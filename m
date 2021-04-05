Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69E333548F4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 00:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242894AbhDEWsS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 18:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242902AbhDEWsR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 18:48:17 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A720C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Apr 2021 15:48:10 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id d13so19659421lfg.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Apr 2021 15:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vmaKkLKPN1iRBNCnuQ3dk0LVm7NbYxzOePKvFkg4CsY=;
        b=j7R3pdWxUhPit6Qe4Ec3x9PSMoDtfMQyVPH6h3+XuiHtxZpceTZSeiMmPjrhoQ8H03
         tZ83J/S8/KGtUgqPaIo998Mdm/+7t1DuWzwxPnstmhZR0u9oNy6jDI8r0uAw1+vygZVp
         dzyGQoZeUv8Q+Om+38WVt50EF1tLuEF24JcJ8NJKNegkWoGcSi9n5u23q4tCuToxHn2Z
         wLPaqEICL323MIV4GrQclnOiJUwydjMW4CZ7gQt6JL4+l01/CjSQdAOs5yJrSbVz1h7l
         AjEugz5+cy865GL2teVWzO8KTLtgYMdmZlk4i6sEKg0m28LuPPcZIfCb4LRvBmlEfelI
         SDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vmaKkLKPN1iRBNCnuQ3dk0LVm7NbYxzOePKvFkg4CsY=;
        b=E3OPmUEI+HWK1ijo4D07lKHJLYRQJWEOcq8aED62O5ctyje51I0ju6gY1XnGVOyEc5
         ygPNe+Q8WUEi3Bab7ukF7B/sVTNShoYtLMxhX7tIa7G38ECC+AFejaLdcfYxtNDWB3wt
         6GZ50+F3MtyNpM5Z8K3M5TrfWRWv14NQlAuRLK+J2RV75tXnYlgMWNT5uAKYA/U9Da1i
         PkHa3KBvTx0kOfpw76mliUE/QWgLOCeZI8Tm0cb8UMLECZMCxLDJ+6rwZHSWb3xVn99S
         gm+hXdCdfPLrQMN3US0xcGWyu9gIx5aYhq2cXj7JZXFE60TJY1GqDcqIpKG/9tJJaMLI
         bKSg==
X-Gm-Message-State: AOAM531a8ResHFyE/l8U2U7TgvM0OkhvyVVhd5Hcoldbfa1NtNK/vfR0
        +H/0c3Be4Mmdx2fKSBqhtIbmWg==
X-Google-Smtp-Source: ABdhPJxkzsHA4etradZGee5vYAU4VwTvNjykUebCC+uxPGQHnvDUrk+k9UhcMYqr8ZRkyKqTF9BU3A==
X-Received: by 2002:a05:6512:207:: with SMTP id a7mr18823033lfo.393.1617662888861;
        Mon, 05 Apr 2021 15:48:08 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:48:08 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 33/33] clk: qcom: gcc-sm8350: use ARRAY_SIZE instead of specifying num_parents
Date:   Tue,  6 Apr 2021 01:47:43 +0300
Message-Id: <20210405224743.590029-34-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
adding/removing entries to/from parent_data easy and errorproof.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sm8350.c | 108 +++++++++++++++++-----------------
 1 file changed, 54 insertions(+), 54 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8350.c b/drivers/clk/qcom/gcc-sm8350.c
index 10364398407d..6d0a9e2d5104 100644
--- a/drivers/clk/qcom/gcc-sm8350.c
+++ b/drivers/clk/qcom/gcc-sm8350.c
@@ -297,7 +297,7 @@ static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_pipe_clk_src",
 			.parent_data = gcc_parent_data_4,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_parent_data_4),
 			.ops = &clk_regmap_mux_closest_ops,
 		},
 	},
@@ -312,7 +312,7 @@ static struct clk_regmap_mux gcc_pcie_1_pipe_clk_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_pipe_clk_src",
 			.parent_data = gcc_parent_data_5,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_parent_data_5),
 			.ops = &clk_regmap_mux_closest_ops,
 		},
 	},
@@ -327,7 +327,7 @@ static struct clk_regmap_mux gcc_ufs_card_rx_symbol_0_clk_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_card_rx_symbol_0_clk_src",
 			.parent_data = gcc_parent_data_7,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_parent_data_7),
 			.ops = &clk_regmap_mux_closest_ops,
 		},
 	},
@@ -342,7 +342,7 @@ static struct clk_regmap_mux gcc_ufs_card_rx_symbol_1_clk_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_card_rx_symbol_1_clk_src",
 			.parent_data = gcc_parent_data_8,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_parent_data_8),
 			.ops = &clk_regmap_mux_closest_ops,
 		},
 	},
@@ -357,7 +357,7 @@ static struct clk_regmap_mux gcc_ufs_card_tx_symbol_0_clk_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_card_tx_symbol_0_clk_src",
 			.parent_data = gcc_parent_data_9,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_parent_data_9),
 			.ops = &clk_regmap_mux_closest_ops,
 		},
 	},
@@ -372,7 +372,7 @@ static struct clk_regmap_mux gcc_ufs_phy_rx_symbol_0_clk_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_phy_rx_symbol_0_clk_src",
 			.parent_data = gcc_parent_data_10,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_parent_data_10),
 			.ops = &clk_regmap_mux_closest_ops,
 		},
 	},
@@ -387,7 +387,7 @@ static struct clk_regmap_mux gcc_ufs_phy_rx_symbol_1_clk_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_phy_rx_symbol_1_clk_src",
 			.parent_data = gcc_parent_data_11,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_parent_data_11),
 			.ops = &clk_regmap_mux_closest_ops,
 		},
 	},
@@ -402,7 +402,7 @@ static struct clk_regmap_mux gcc_ufs_phy_tx_symbol_0_clk_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_phy_tx_symbol_0_clk_src",
 			.parent_data = gcc_parent_data_12,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(gcc_parent_data_12),
 			.ops = &clk_regmap_mux_closest_ops,
 		},
 	},
@@ -417,7 +417,7 @@ static struct clk_regmap_mux gcc_usb3_prim_phy_pipe_clk_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb3_prim_phy_pipe_clk_src",
 			.parent_data = gcc_parent_data_13,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(gcc_parent_data_13),
 			.ops = &clk_regmap_mux_closest_ops,
 		},
 	},
@@ -432,7 +432,7 @@ static struct clk_regmap_mux gcc_usb3_sec_phy_pipe_clk_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb3_sec_phy_pipe_clk_src",
 			.parent_data = gcc_parent_data_14,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(gcc_parent_data_14),
 			.ops = &clk_regmap_mux_closest_ops,
 		},
 	},
@@ -454,7 +454,7 @@ static struct clk_rcg2 gcc_gp1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gp1_clk_src",
 		.parent_data = gcc_parent_data_1,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -469,7 +469,7 @@ static struct clk_rcg2 gcc_gp2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gp2_clk_src",
 		.parent_data = gcc_parent_data_1,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -484,7 +484,7 @@ static struct clk_rcg2 gcc_gp3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gp3_clk_src",
 		.parent_data = gcc_parent_data_1,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -505,7 +505,7 @@ static struct clk_rcg2 gcc_pcie_0_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pcie_0_aux_clk_src",
 		.parent_data = gcc_parent_data_2,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -526,7 +526,7 @@ static struct clk_rcg2 gcc_pcie_0_phy_rchng_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pcie_0_phy_rchng_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -541,7 +541,7 @@ static struct clk_rcg2 gcc_pcie_1_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pcie_1_aux_clk_src",
 		.parent_data = gcc_parent_data_2,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -556,7 +556,7 @@ static struct clk_rcg2 gcc_pcie_1_phy_rchng_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pcie_1_phy_rchng_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -576,7 +576,7 @@ static struct clk_rcg2 gcc_pdm2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pdm2_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -600,7 +600,7 @@ static const struct freq_tbl ftbl_gcc_qupv3_wrap0_s0_clk_src[] = {
 static struct clk_init_data gcc_qupv3_wrap0_s0_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s0_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
 	.ops = &clk_rcg2_ops,
 };
@@ -617,7 +617,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s0_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap0_s1_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s1_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
 	.ops = &clk_rcg2_ops,
 };
@@ -634,7 +634,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s1_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap0_s2_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s2_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
 	.ops = &clk_rcg2_ops,
 };
@@ -651,7 +651,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s2_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap0_s3_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s3_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
 	.ops = &clk_rcg2_ops,
 };
@@ -668,7 +668,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s3_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap0_s4_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s4_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
 	.ops = &clk_rcg2_ops,
 };
@@ -685,7 +685,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s4_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap0_s5_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s5_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
 	.ops = &clk_rcg2_ops,
 };
@@ -702,7 +702,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s5_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap0_s6_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s6_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
 	.ops = &clk_rcg2_ops,
 };
@@ -719,7 +719,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s6_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap0_s7_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s7_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
 	.ops = &clk_rcg2_ops,
 };
@@ -755,7 +755,7 @@ static const struct freq_tbl ftbl_gcc_qupv3_wrap1_s0_clk_src[] = {
 static struct clk_init_data gcc_qupv3_wrap1_s0_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s0_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
 	.ops = &clk_rcg2_ops,
 };
@@ -772,7 +772,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s0_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap1_s1_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s1_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
 	.ops = &clk_rcg2_ops,
 };
@@ -789,7 +789,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s1_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap1_s2_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s2_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
 	.ops = &clk_rcg2_ops,
 };
@@ -806,7 +806,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s2_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap1_s3_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s3_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
 	.ops = &clk_rcg2_ops,
 };
@@ -823,7 +823,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s3_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap1_s4_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s4_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
 	.ops = &clk_rcg2_ops,
 };
@@ -840,7 +840,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s4_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap1_s5_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s5_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
 	.ops = &clk_rcg2_ops,
 };
@@ -857,7 +857,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s5_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap2_s0_clk_src_init = {
 	.name = "gcc_qupv3_wrap2_s0_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
 	.ops = &clk_rcg2_ops,
 };
@@ -874,7 +874,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s0_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap2_s1_clk_src_init = {
 	.name = "gcc_qupv3_wrap2_s1_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
 	.ops = &clk_rcg2_ops,
 };
@@ -891,7 +891,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s1_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap2_s2_clk_src_init = {
 	.name = "gcc_qupv3_wrap2_s2_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
 	.ops = &clk_rcg2_ops,
 };
@@ -908,7 +908,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s2_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap2_s3_clk_src_init = {
 	.name = "gcc_qupv3_wrap2_s3_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
 	.ops = &clk_rcg2_ops,
 };
@@ -925,7 +925,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s3_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap2_s4_clk_src_init = {
 	.name = "gcc_qupv3_wrap2_s4_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
 	.ops = &clk_rcg2_ops,
 };
@@ -942,7 +942,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s4_clk_src = {
 static struct clk_init_data gcc_qupv3_wrap2_s5_clk_src_init = {
 	.name = "gcc_qupv3_wrap2_s5_clk_src",
 	.parent_data = gcc_parent_data_0,
-	.num_parents = 4,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
 	.ops = &clk_rcg2_ops,
 };
@@ -974,7 +974,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_sdcc2_apps_clk_src",
 		.parent_data = gcc_parent_data_6,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_6),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_floor_ops,
 	},
@@ -996,7 +996,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_sdcc4_apps_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_floor_ops,
 	},
@@ -1019,7 +1019,7 @@ static struct clk_rcg2 gcc_ufs_card_axi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_card_axi_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1041,7 +1041,7 @@ static struct clk_rcg2 gcc_ufs_card_ice_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_card_ice_core_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1061,7 +1061,7 @@ static struct clk_rcg2 gcc_ufs_card_phy_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_card_phy_aux_clk_src",
 		.parent_data = gcc_parent_data_3,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1076,7 +1076,7 @@ static struct clk_rcg2 gcc_ufs_card_unipro_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_card_unipro_core_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1091,7 +1091,7 @@ static struct clk_rcg2 gcc_ufs_phy_axi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_phy_axi_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1106,7 +1106,7 @@ static struct clk_rcg2 gcc_ufs_phy_ice_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_phy_ice_core_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1121,7 +1121,7 @@ static struct clk_rcg2 gcc_ufs_phy_phy_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_phy_phy_aux_clk_src",
 		.parent_data = gcc_parent_data_3,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1136,7 +1136,7 @@ static struct clk_rcg2 gcc_ufs_phy_unipro_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_phy_unipro_core_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1159,7 +1159,7 @@ static struct clk_rcg2 gcc_usb30_prim_master_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb30_prim_master_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1174,7 +1174,7 @@ static struct clk_rcg2 gcc_usb30_prim_mock_utmi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb30_prim_mock_utmi_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1189,7 +1189,7 @@ static struct clk_rcg2 gcc_usb30_sec_master_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb30_sec_master_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1204,7 +1204,7 @@ static struct clk_rcg2 gcc_usb30_sec_mock_utmi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb30_sec_mock_utmi_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1219,7 +1219,7 @@ static struct clk_rcg2 gcc_usb3_prim_phy_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb3_prim_phy_aux_clk_src",
 		.parent_data = gcc_parent_data_2,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -1234,7 +1234,7 @@ static struct clk_rcg2 gcc_usb3_sec_phy_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb3_sec_phy_aux_clk_src",
 		.parent_data = gcc_parent_data_2,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
-- 
2.30.2

