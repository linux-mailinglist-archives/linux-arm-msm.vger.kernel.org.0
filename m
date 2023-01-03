Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9631C65C273
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 15:57:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238060AbjACOzt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 09:55:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237793AbjACOzf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 09:55:35 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 814F6FD21
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 06:55:30 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id p2so16489422ljn.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 06:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ugru/NgRrGbHHL1HPbf4CsrVe6AxrGrK4kc9Ar6MUsM=;
        b=MeDUzurfSjrC3B4ed8PhAAe8+rB5pa71ulaKXV+rtiD5yrJNCzkZ2vMmwI3/7bfwZW
         uZzV0y77mYw743seSqWJVaLM867MEQF+xlxUZ9Ju/wBJq1SBWRCCx5i/w5bBjJfEyr1I
         PLgKXcyOUy3pNXnhSEpNV3spFQj5nHW5sv/kHHdaXwwfrqt7EfyIELZh7i0aqFvkFdj6
         mBNiJfFZIIwefjAb9ZE9bRTibtuHrf52ba3R5PODCRjHZcp9pUyywpstwHIWUsE/TNBF
         gAF0V9f424fpwMAMJ6KAOUIWfjKWajZZvT0EuEZujx6cSvQ0C+Eceyl9Zbj9yMXfuItY
         4zsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ugru/NgRrGbHHL1HPbf4CsrVe6AxrGrK4kc9Ar6MUsM=;
        b=ovRREDvYbYLNIfrk/8GXR8kR/P5Wf+Db3akk6TD1V4clg3P4071l+fe9tGUZAyxWhb
         WJzQ8mT2sYDwNuh152zR9nXND10FyPK3W2Gu2vYXx8eXUiTFTQLXT6sslNG52wN8oy0t
         Bp903pH8XfnPBvyR4Yby2IE+4GWGpI9HnQlLY9pbt6vE6zbTcGkImQWnxHyIeU4CQAND
         q/5Io6JYSpxIT7JlVAydQZfObF92LzvbAaBbIlQKXP2h3XNAcktaOGkNztwEsGEYIfqv
         bsnmRn6mkmPHZz3buthTHKbi30JjiMkO+QR8IfzKkPRNf0IPVdcg0X8D2rHKEwmbjpH2
         yZAw==
X-Gm-Message-State: AFqh2kqNRxf0PK8q3f7VtMHc2dPcSrHN+v1itE0xau+R0xcHlgYi8YJ6
        LHILgpdsTo/q8nBFiO6uBFY6cg==
X-Google-Smtp-Source: AMrXdXt1BwkTE7toKZ1XNuy1xCQMQJI5erOMI+qN7thFl8Y0jGA+z+Cr5Slgw8swRcLLKpfwGlKZ6g==
X-Received: by 2002:a2e:a374:0:b0:277:2201:3047 with SMTP id i20-20020a2ea374000000b0027722013047mr12537962ljn.2.1672757729996;
        Tue, 03 Jan 2023 06:55:29 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s24-20020a2eb638000000b00279cbcfd7dbsm3544015ljn.30.2023.01.03.06.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:55:29 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 13/21] clk: qcom: gcc-sm8450: switch to parent_hws
Date:   Tue,  3 Jan 2023 16:55:07 +0200
Message-Id: <20230103145515.1164020-14-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/gcc-sm8450.c | 236 +++++++++++++++++-----------------
 1 file changed, 118 insertions(+), 118 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index 666efa5ff978..84764cc3db4f 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -66,8 +66,8 @@ static struct clk_alpha_pll_postdiv gcc_gpll0_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gpll0_out_even",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &gcc_gpll0.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&gcc_gpll0.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_lucid_evo_ops,
@@ -1070,8 +1070,8 @@ static struct clk_regmap_div gcc_usb30_prim_mock_utmi_postdiv_clk_src = {
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "gcc_usb30_prim_mock_utmi_postdiv_clk_src",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &gcc_usb30_prim_mock_utmi_clk_src.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&gcc_usb30_prim_mock_utmi_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1119,8 +1119,8 @@ static struct clk_branch gcc_aggre_ufs_phy_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_aggre_ufs_phy_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_phy_axi_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_ufs_phy_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1139,8 +1139,8 @@ static struct clk_branch gcc_aggre_ufs_phy_axi_hw_ctl_clk = {
 		.enable_mask = BIT(1),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_aggre_ufs_phy_axi_hw_ctl_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_phy_axi_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_ufs_phy_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1159,8 +1159,8 @@ static struct clk_branch gcc_aggre_usb3_prim_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_aggre_usb3_prim_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb30_prim_master_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb30_prim_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1239,8 +1239,8 @@ static struct clk_branch gcc_cfg_noc_usb3_prim_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_cfg_noc_usb3_prim_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb30_prim_master_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb30_prim_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1330,8 +1330,8 @@ static struct clk_branch gcc_gp1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_gp1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_gp1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1348,8 +1348,8 @@ static struct clk_branch gcc_gp2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_gp2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_gp2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1366,8 +1366,8 @@ static struct clk_branch gcc_gp3_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp3_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_gp3_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_gp3_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1383,8 +1383,8 @@ static struct clk_branch gcc_gpu_gpll0_clk_src = {
 		.enable_mask = BIT(15),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gpu_gpll0_clk_src",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_gpll0.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_gpll0.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1400,8 +1400,8 @@ static struct clk_branch gcc_gpu_gpll0_div_clk_src = {
 		.enable_mask = BIT(16),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gpu_gpll0_div_clk_src",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_gpll0_out_even.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_gpll0_out_even.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1446,8 +1446,8 @@ static struct clk_branch gcc_pcie_0_aux_clk = {
 		.enable_mask = BIT(3),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_aux_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_pcie_0_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_0_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1505,8 +1505,8 @@ static struct clk_branch gcc_pcie_0_phy_rchng_clk = {
 		.enable_mask = BIT(22),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_phy_rchng_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_pcie_0_phy_rchng_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_0_phy_rchng_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1523,8 +1523,8 @@ static struct clk_branch gcc_pcie_0_pipe_clk = {
 		.enable_mask = BIT(4),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_pipe_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_pcie_0_pipe_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_0_pipe_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1569,8 +1569,8 @@ static struct clk_branch gcc_pcie_1_aux_clk = {
 		.enable_mask = BIT(29),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_aux_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_pcie_1_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_1_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1628,8 +1628,8 @@ static struct clk_branch gcc_pcie_1_phy_aux_clk = {
 		.enable_mask = BIT(24),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_phy_aux_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_pcie_1_phy_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_1_phy_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1646,8 +1646,8 @@ static struct clk_branch gcc_pcie_1_phy_rchng_clk = {
 		.enable_mask = BIT(23),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_phy_rchng_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_pcie_1_phy_rchng_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_1_phy_rchng_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1664,8 +1664,8 @@ static struct clk_branch gcc_pcie_1_pipe_clk = {
 		.enable_mask = BIT(30),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_pipe_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_pcie_1_pipe_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_1_pipe_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1710,8 +1710,8 @@ static struct clk_branch gcc_pdm2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pdm2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_pdm2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pdm2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1917,8 +1917,8 @@ static struct clk_branch gcc_qupv3_wrap0_s0_clk = {
 		.enable_mask = BIT(10),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap0_s0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap0_s0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap0_s0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1935,8 +1935,8 @@ static struct clk_branch gcc_qupv3_wrap0_s1_clk = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap0_s1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap0_s1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap0_s1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1953,8 +1953,8 @@ static struct clk_branch gcc_qupv3_wrap0_s2_clk = {
 		.enable_mask = BIT(12),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap0_s2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap0_s2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap0_s2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1971,8 +1971,8 @@ static struct clk_branch gcc_qupv3_wrap0_s3_clk = {
 		.enable_mask = BIT(13),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap0_s3_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap0_s3_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap0_s3_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1989,8 +1989,8 @@ static struct clk_branch gcc_qupv3_wrap0_s4_clk = {
 		.enable_mask = BIT(14),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap0_s4_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap0_s4_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap0_s4_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2007,8 +2007,8 @@ static struct clk_branch gcc_qupv3_wrap0_s5_clk = {
 		.enable_mask = BIT(15),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap0_s5_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap0_s5_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap0_s5_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2025,8 +2025,8 @@ static struct clk_branch gcc_qupv3_wrap0_s6_clk = {
 		.enable_mask = BIT(16),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap0_s6_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap0_s6_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap0_s6_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2043,8 +2043,8 @@ static struct clk_branch gcc_qupv3_wrap0_s7_clk = {
 		.enable_mask = BIT(17),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap0_s7_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap0_s7_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap0_s7_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2087,8 +2087,8 @@ static struct clk_branch gcc_qupv3_wrap1_s0_clk = {
 		.enable_mask = BIT(22),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap1_s0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap1_s0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap1_s0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2105,8 +2105,8 @@ static struct clk_branch gcc_qupv3_wrap1_s1_clk = {
 		.enable_mask = BIT(23),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap1_s1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap1_s1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap1_s1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2123,8 +2123,8 @@ static struct clk_branch gcc_qupv3_wrap1_s2_clk = {
 		.enable_mask = BIT(24),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap1_s2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap1_s2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap1_s2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2141,8 +2141,8 @@ static struct clk_branch gcc_qupv3_wrap1_s3_clk = {
 		.enable_mask = BIT(25),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap1_s3_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap1_s3_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap1_s3_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2159,8 +2159,8 @@ static struct clk_branch gcc_qupv3_wrap1_s4_clk = {
 		.enable_mask = BIT(26),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap1_s4_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap1_s4_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap1_s4_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2177,8 +2177,8 @@ static struct clk_branch gcc_qupv3_wrap1_s5_clk = {
 		.enable_mask = BIT(27),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap1_s5_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap1_s5_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap1_s5_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2195,8 +2195,8 @@ static struct clk_branch gcc_qupv3_wrap1_s6_clk = {
 		.enable_mask = BIT(28),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap1_s6_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap1_s6_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap1_s6_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2239,8 +2239,8 @@ static struct clk_branch gcc_qupv3_wrap2_s0_clk = {
 		.enable_mask = BIT(4),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap2_s0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap2_s0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap2_s0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2257,8 +2257,8 @@ static struct clk_branch gcc_qupv3_wrap2_s1_clk = {
 		.enable_mask = BIT(5),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap2_s1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap2_s1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap2_s1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2275,8 +2275,8 @@ static struct clk_branch gcc_qupv3_wrap2_s2_clk = {
 		.enable_mask = BIT(6),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap2_s2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap2_s2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap2_s2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2293,8 +2293,8 @@ static struct clk_branch gcc_qupv3_wrap2_s3_clk = {
 		.enable_mask = BIT(7),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap2_s3_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap2_s3_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap2_s3_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2311,8 +2311,8 @@ static struct clk_branch gcc_qupv3_wrap2_s4_clk = {
 		.enable_mask = BIT(8),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap2_s4_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap2_s4_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap2_s4_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2329,8 +2329,8 @@ static struct clk_branch gcc_qupv3_wrap2_s5_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap2_s5_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap2_s5_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap2_s5_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2347,8 +2347,8 @@ static struct clk_branch gcc_qupv3_wrap2_s6_clk = {
 		.enable_mask = BIT(10),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap2_s6_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap2_s6_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap2_s6_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2468,8 +2468,8 @@ static struct clk_branch gcc_sdcc2_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc2_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_sdcc2_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_sdcc2_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2514,8 +2514,8 @@ static struct clk_branch gcc_sdcc4_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc4_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_sdcc4_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_sdcc4_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2577,8 +2577,8 @@ static struct clk_branch gcc_ufs_phy_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_phy_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_phy_axi_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_ufs_phy_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2597,8 +2597,8 @@ static struct clk_branch gcc_ufs_phy_axi_hw_ctl_clk = {
 		.enable_mask = BIT(1),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_phy_axi_hw_ctl_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_phy_axi_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_ufs_phy_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2617,8 +2617,8 @@ static struct clk_branch gcc_ufs_phy_ice_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_phy_ice_core_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_phy_ice_core_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_ufs_phy_ice_core_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2637,8 +2637,8 @@ static struct clk_branch gcc_ufs_phy_ice_core_hw_ctl_clk = {
 		.enable_mask = BIT(1),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_phy_ice_core_hw_ctl_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_phy_ice_core_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_ufs_phy_ice_core_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2657,8 +2657,8 @@ static struct clk_branch gcc_ufs_phy_phy_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_phy_phy_aux_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_phy_phy_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_ufs_phy_phy_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2677,8 +2677,8 @@ static struct clk_branch gcc_ufs_phy_phy_aux_hw_ctl_clk = {
 		.enable_mask = BIT(1),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_phy_phy_aux_hw_ctl_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_phy_phy_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_ufs_phy_phy_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2695,8 +2695,8 @@ static struct clk_branch gcc_ufs_phy_rx_symbol_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_phy_rx_symbol_0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_phy_rx_symbol_0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_ufs_phy_rx_symbol_0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2713,8 +2713,8 @@ static struct clk_branch gcc_ufs_phy_rx_symbol_1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_phy_rx_symbol_1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_phy_rx_symbol_1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_ufs_phy_rx_symbol_1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2731,8 +2731,8 @@ static struct clk_branch gcc_ufs_phy_tx_symbol_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_phy_tx_symbol_0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_phy_tx_symbol_0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_ufs_phy_tx_symbol_0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2751,8 +2751,8 @@ static struct clk_branch gcc_ufs_phy_unipro_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_phy_unipro_core_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_phy_unipro_core_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_ufs_phy_unipro_core_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2771,8 +2771,8 @@ static struct clk_branch gcc_ufs_phy_unipro_core_hw_ctl_clk = {
 		.enable_mask = BIT(1),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_phy_unipro_core_hw_ctl_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_phy_unipro_core_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_ufs_phy_unipro_core_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2789,8 +2789,8 @@ static struct clk_branch gcc_usb30_prim_master_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_prim_master_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb30_prim_master_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb30_prim_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2807,8 +2807,8 @@ static struct clk_branch gcc_usb30_prim_mock_utmi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_prim_mock_utmi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb30_prim_mock_utmi_postdiv_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb30_prim_mock_utmi_postdiv_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2851,8 +2851,8 @@ static struct clk_branch gcc_usb3_prim_phy_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb3_prim_phy_aux_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb3_prim_phy_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb3_prim_phy_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2869,8 +2869,8 @@ static struct clk_branch gcc_usb3_prim_phy_com_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb3_prim_phy_com_aux_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb3_prim_phy_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb3_prim_phy_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2889,8 +2889,8 @@ static struct clk_branch gcc_usb3_prim_phy_pipe_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb3_prim_phy_pipe_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb3_prim_phy_pipe_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb3_prim_phy_pipe_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.39.0

