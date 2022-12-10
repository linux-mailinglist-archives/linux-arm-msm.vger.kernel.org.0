Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDE16649053
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Dec 2022 20:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbiLJTHU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Dec 2022 14:07:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbiLJTHT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Dec 2022 14:07:19 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBF3310FC1
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 11:07:16 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id f16so8377962ljc.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 11:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHyRf+ash7/xkj5WE6zXt7EOlwfG/3qmsrtBGIReNkQ=;
        b=blDEUu7cmOp3oZKMZmy6xezYckKB+2sSAbctzBZ5iZkUlGu4BVfTyiSnn+aGn5qmZm
         h/MEQzt5hOKOg8qVxdG5ULlNTa3ubBuzAUWJzjCepF3vriVlMiXZIXcUWpu8z8GNf0cW
         Qv8lW9dwdmAQD7Y9iHK9JlXnZzk2RyMqlEBwlaxXxBEzbRMAO8qZ19OQ4HX7gufEHV0l
         IjR8dwAsfkPnnFDmHrwexX/Aw9p+qut9992MTw0BNEA76R8s9nneBVbKA/8gEIS6DUoj
         KoMwizm5/nQMryWIhBKuS66Bxgs4/YUCZAD7tOTgkT4F2Mpi76rRx05EzvmW/a8WsMKJ
         hdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HHyRf+ash7/xkj5WE6zXt7EOlwfG/3qmsrtBGIReNkQ=;
        b=xjog5p4jDSAyXOZDMsIqmAUO/R8zy0wtOpu/3agA9eaSDfaiPw6E8InZS3qqfazYrb
         BBxESRIMWskIrln0U/NzbhOL6uUeXMgEeS+9uuUsS5NAxxnxPZvxN2n4QlAVAD+jJcl0
         JSI1A3A9hfoKzjB7+JSZg2e2ESCDHSHvYEnVBTKZr0BTifLQ10mq52ZnIhXrBcwBGGFY
         hMuXJp7c4jeGtryWXGXClIf2wKCX+3jHjA25J9NltOs9pEdPsay0GrVKHY1on0HIe7H0
         qlNdiWSelxsL/cp447hnDr/GVclCJNUHOejHThvPC9+GMv2Xf7T+hXflWg15MPniRXdy
         J5vQ==
X-Gm-Message-State: ANoB5pmRZwHHVdrQ98ApJvjShfsl3N861IMI5ldOx9iXB8++0usldAOo
        N+khn4wFbZRP+8rIra2jqVVcaw==
X-Google-Smtp-Source: AA0mqf7MDRYiwJrK1Zcar4d8mr+mEjNaIEGGlE7g9YYStsgJRmmj3nCVmr90S8tG/mCwRTrQH/f97g==
X-Received: by 2002:a2e:730b:0:b0:279:fdf2:65a0 with SMTP id o11-20020a2e730b000000b00279fdf265a0mr2556678ljc.12.1670699235051;
        Sat, 10 Dec 2022 11:07:15 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v14-20020a2e7a0e000000b00279e93c9c25sm701622ljc.29.2022.12.10.11.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Dec 2022 11:07:14 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 3/3] clk: qcom: gcc-sm6375: use parent_hws where possible
Date:   Sat, 10 Dec 2022 22:07:12 +0300
Message-Id: <20221210190712.451247-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221210190712.451247-1-dmitry.baryshkov@linaro.org>
References: <20221210190712.451247-1-dmitry.baryshkov@linaro.org>
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
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
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

