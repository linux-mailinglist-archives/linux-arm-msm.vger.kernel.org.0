Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D02D2647176
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Dec 2022 15:19:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbiLHOTU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Dec 2022 09:19:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbiLHOTT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Dec 2022 09:19:19 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D741A83E9B
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Dec 2022 06:19:16 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 1so2264364lfz.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Dec 2022 06:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ulFqK8V316aETE4Ne37fO3IN4UHXQqpRxVPaabpLF6E=;
        b=BSvurBtwjIzjcJNqyaS7g6Cxh2qEG1NwcW05TihXUHKtSXRamKuWF1vwhSDzEsimnh
         NNKPAQGHV1N4tGrQ8a7QRorTVsIAqSKuunlhfHKsyb5h58E1H/Vs533MTg3f+zJeSETU
         +NsyX+GKuHmed2Ovyx3q4S/HSNjQbhhoflPKUPZaN75vn/0cG9Ze4UiFssRFb6xSWP0A
         KoCMXn9Bu8TVpe6oPEd4VqeJH8oOwlqztLe0Bhz9lvYXfTfYilfY4W4pF/dHL+KWQEib
         bw/jrWZUBHVk4TsiCvR79G+kN0Tm1AZ6djvd2ZYYu2BqFJrU2t3bAYBN6YrXwhWjRnZB
         GyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ulFqK8V316aETE4Ne37fO3IN4UHXQqpRxVPaabpLF6E=;
        b=BgTlo/+P0bsxh6OB5O3n77vC1U4rXquonuiZSv96J69xyCOupp/62T4Cs5+xKV74QI
         F3Z0UHaAkhXljAvL3DbWoRc5PG7LIRqp1Kk+m5yrLU1N1MlIIuJa9ss96TBj4lNokfNc
         XMLzz9b3oIkvRKXm/nT11HR37VUxSjOcNKmz/XMRbY7MO4poaNiGbCP5JLkH4zHYwgbX
         kRSxLl3uJyoiXh2BfsS6QhFHA/TizS4IH2ngZxfFaKRW7FYsQ9v9tX4LQtKQdrmRYvFT
         euE6z71c8px6GZBiOd63LDdts4uBSkeRPVYnPh5wOlH3yWujw1GLOvVhczm6wjES4MXd
         +pAQ==
X-Gm-Message-State: ANoB5plyKw+U+H433EAgD+JXfmgoO7tX/+D2A/1UD7SwUjIRtL074vnJ
        vYHs/gxlchwpkAFEyhOmiIuWBw==
X-Google-Smtp-Source: AA0mqf5SZMh9V2bV3ltqX4P0jg79/x38K1zR08WMSV117ZSxjpzlw6h83/kNPjJVYKHzAX+U7Vetyw==
X-Received: by 2002:a19:6559:0:b0:4b5:6e66:7bbc with SMTP id c25-20020a196559000000b004b56e667bbcmr6198345lfj.487.1670509155119;
        Thu, 08 Dec 2022 06:19:15 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id s17-20020a056512203100b004b578e52d81sm1514692lfs.176.2022.12.08.06.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 06:19:14 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 3/3] clk: qcom: gcc-sm6375: use parent_hws where possible
Date:   Thu,  8 Dec 2022 17:19:12 +0300
Message-Id: <20221208141912.47262-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221208141912.47262-1-dmitry.baryshkov@linaro.org>
References: <20221208141912.47262-1-dmitry.baryshkov@linaro.org>
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

Change several parent_data entries with only .hw entries to parent_hws
instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sm6375.c | 252 +++++++++++++++++-----------------
 1 file changed, 126 insertions(+), 126 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm6375.c b/drivers/clk/qcom/gcc-sm6375.c
index 6d75f735a7a6..ad3c4833990d 100644
--- a/drivers/clk/qcom/gcc-sm6375.c
+++ b/drivers/clk/qcom/gcc-sm6375.c
@@ -1766,8 +1766,8 @@ static struct clk_branch gcc_camss_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_camss_axi_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_camss_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1784,8 +1784,8 @@ static struct clk_branch gcc_camss_cci_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_cci_0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_camss_cci_0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_camss_cci_0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1802,8 +1802,8 @@ static struct clk_branch gcc_camss_cci_1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_cci_1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_camss_cci_1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_camss_cci_1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1820,8 +1820,8 @@ static struct clk_branch gcc_camss_cphy_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_cphy_0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_camss_tfe_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_camss_tfe_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1838,8 +1838,8 @@ static struct clk_branch gcc_camss_cphy_1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_cphy_1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_camss_tfe_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_camss_tfe_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1856,8 +1856,8 @@ static struct clk_branch gcc_camss_cphy_2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_cphy_2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_camss_tfe_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_camss_tfe_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1874,8 +1874,8 @@ static struct clk_branch gcc_camss_cphy_3_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_cphy_3_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_camss_tfe_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_camss_tfe_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1892,8 +1892,8 @@ static struct clk_branch gcc_camss_csi0phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi0phytimer_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_camss_csi0phytimer_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_camss_csi0phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1910,8 +1910,8 @@ static struct clk_branch gcc_camss_csi1phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi1phytimer_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_camss_csi1phytimer_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_camss_csi1phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1928,8 +1928,8 @@ static struct clk_branch gcc_camss_csi2phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi2phytimer_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_camss_csi2phytimer_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_camss_csi2phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1946,8 +1946,8 @@ static struct clk_branch gcc_camss_csi3phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi3phytimer_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_camss_csi3phytimer_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_camss_csi3phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1964,8 +1964,8 @@ static struct clk_branch gcc_camss_mclk0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_mclk0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_camss_mclk0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_camss_mclk0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1982,8 +1982,8 @@ static struct clk_branch gcc_camss_mclk1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_mclk1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_camss_mclk1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_camss_mclk1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2000,8 +2000,8 @@ static struct clk_branch gcc_camss_mclk2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_mclk2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_camss_mclk2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_camss_mclk2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2018,8 +2018,8 @@ static struct clk_branch gcc_camss_mclk3_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_mclk3_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_camss_mclk3_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_camss_mclk3_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2036,8 +2036,8 @@ static struct clk_branch gcc_camss_mclk4_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_mclk4_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_camss_mclk4_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_camss_mclk4_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2067,8 +2067,8 @@ static struct clk_branch gcc_camss_ope_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_ope_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_camss_ope_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_camss_ope_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2085,8 +2085,8 @@ static struct clk_branch gcc_camss_ope_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_ope_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_camss_ope_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_camss_ope_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2116,8 +2116,8 @@ static struct clk_branch gcc_camss_tfe_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_tfe_0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_camss_tfe_0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_camss_tfe_0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2134,8 +2134,8 @@ static struct clk_branch gcc_camss_tfe_0_cphy_rx_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_tfe_0_cphy_rx_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_camss_tfe_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_camss_tfe_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2152,8 +2152,8 @@ static struct clk_branch gcc_camss_tfe_0_csid_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_tfe_0_csid_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_camss_tfe_0_csid_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_camss_tfe_0_csid_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2170,8 +2170,8 @@ static struct clk_branch gcc_camss_tfe_1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_tfe_1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_camss_tfe_1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_camss_tfe_1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2188,8 +2188,8 @@ static struct clk_branch gcc_camss_tfe_1_cphy_rx_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_tfe_1_cphy_rx_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_camss_tfe_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_camss_tfe_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2206,8 +2206,8 @@ static struct clk_branch gcc_camss_tfe_1_csid_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_tfe_1_csid_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_camss_tfe_1_csid_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_camss_tfe_1_csid_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2224,8 +2224,8 @@ static struct clk_branch gcc_camss_tfe_2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_tfe_2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_camss_tfe_2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_camss_tfe_2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2242,8 +2242,8 @@ static struct clk_branch gcc_camss_tfe_2_cphy_rx_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_tfe_2_cphy_rx_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_camss_tfe_cphy_rx_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_camss_tfe_cphy_rx_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2260,8 +2260,8 @@ static struct clk_branch gcc_camss_tfe_2_csid_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_tfe_2_csid_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_camss_tfe_2_csid_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_camss_tfe_2_csid_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2278,8 +2278,8 @@ static struct clk_branch gcc_camss_top_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_top_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_camss_top_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_camss_top_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2298,8 +2298,8 @@ static struct clk_branch gcc_cfg_noc_usb3_prim_axi_clk = {
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
@@ -2345,8 +2345,8 @@ static struct clk_branch gcc_disp_gpll0_div_clk_src = {
 		.enable_mask = BIT(20),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_disp_gpll0_div_clk_src",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_disp_gpll0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_disp_gpll0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2408,8 +2408,8 @@ static struct clk_branch gcc_gp1_clk = {
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
@@ -2426,8 +2426,8 @@ static struct clk_branch gcc_gp2_clk = {
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
@@ -2444,8 +2444,8 @@ static struct clk_branch gcc_gp3_clk = {
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
@@ -2477,8 +2477,8 @@ static struct clk_branch gcc_gpu_gpll0_clk_src = {
 		.enable_mask = BIT(15),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gpu_gpll0_clk_src",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gpll0.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpll0.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2494,8 +2494,8 @@ static struct clk_branch gcc_gpu_gpll0_div_clk_src = {
 		.enable_mask = BIT(16),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gpu_gpll0_div_clk_src",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gpll0_out_even.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpll0_out_even.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2555,8 +2555,8 @@ static struct clk_branch gcc_pdm2_clk = {
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
@@ -2717,8 +2717,8 @@ static struct clk_branch gcc_qupv3_wrap0_s0_clk = {
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
@@ -2735,8 +2735,8 @@ static struct clk_branch gcc_qupv3_wrap0_s1_clk = {
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
@@ -2753,8 +2753,8 @@ static struct clk_branch gcc_qupv3_wrap0_s2_clk = {
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
@@ -2771,8 +2771,8 @@ static struct clk_branch gcc_qupv3_wrap0_s3_clk = {
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
@@ -2789,8 +2789,8 @@ static struct clk_branch gcc_qupv3_wrap0_s4_clk = {
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
@@ -2807,8 +2807,8 @@ static struct clk_branch gcc_qupv3_wrap0_s5_clk = {
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
@@ -2851,8 +2851,8 @@ static struct clk_branch gcc_qupv3_wrap1_s0_clk = {
 		.enable_mask = BIT(21),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap1_s0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap1_s0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap1_s0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2869,8 +2869,8 @@ static struct clk_branch gcc_qupv3_wrap1_s1_clk = {
 		.enable_mask = BIT(22),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap1_s1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap1_s1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap1_s1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2887,8 +2887,8 @@ static struct clk_branch gcc_qupv3_wrap1_s2_clk = {
 		.enable_mask = BIT(23),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap1_s2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap1_s2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap1_s2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2905,8 +2905,8 @@ static struct clk_branch gcc_qupv3_wrap1_s3_clk = {
 		.enable_mask = BIT(24),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap1_s3_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap1_s3_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap1_s3_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2923,8 +2923,8 @@ static struct clk_branch gcc_qupv3_wrap1_s4_clk = {
 		.enable_mask = BIT(25),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap1_s4_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap1_s4_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap1_s4_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2941,8 +2941,8 @@ static struct clk_branch gcc_qupv3_wrap1_s5_clk = {
 		.enable_mask = BIT(26),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap1_s5_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap1_s5_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap1_s5_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3032,8 +3032,8 @@ static struct clk_branch gcc_sdcc1_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc1_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_sdcc1_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_sdcc1_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3052,8 +3052,8 @@ static struct clk_branch gcc_sdcc1_ice_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc1_ice_core_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_sdcc1_ice_core_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_sdcc1_ice_core_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3083,8 +3083,8 @@ static struct clk_branch gcc_sdcc2_apps_clk = {
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
@@ -3103,8 +3103,8 @@ static struct clk_branch gcc_sys_noc_cpuss_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sys_noc_cpuss_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_cpuss_ahb_postdiv_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_cpuss_ahb_postdiv_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
@@ -3121,8 +3121,8 @@ static struct clk_branch gcc_sys_noc_ufs_phy_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sys_noc_ufs_phy_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_phy_axi_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_ufs_phy_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3141,8 +3141,8 @@ static struct clk_branch gcc_sys_noc_usb3_prim_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sys_noc_usb3_prim_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb30_prim_master_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb30_prim_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3176,8 +3176,8 @@ static struct clk_branch gcc_ufs_phy_axi_clk = {
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
@@ -3196,8 +3196,8 @@ static struct clk_branch gcc_ufs_phy_ice_core_clk = {
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
@@ -3216,8 +3216,8 @@ static struct clk_branch gcc_ufs_phy_phy_aux_clk = {
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
@@ -3262,8 +3262,8 @@ static struct clk_branch gcc_ufs_phy_unipro_core_clk = {
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
@@ -3280,8 +3280,8 @@ static struct clk_branch gcc_usb30_prim_master_clk = {
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
@@ -3298,8 +3298,8 @@ static struct clk_branch gcc_usb30_prim_mock_utmi_clk = {
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
@@ -3368,8 +3368,8 @@ static struct clk_branch gcc_usb3_prim_phy_com_aux_clk = {
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
@@ -3488,8 +3488,8 @@ static struct clk_branch gcc_video_vcodec0_sys_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_video_vcodec0_sys_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_video_venus_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_video_venus_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3506,8 +3506,8 @@ static struct clk_branch gcc_video_venus_ctl_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_video_venus_ctl_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_video_venus_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_video_venus_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.30.2

