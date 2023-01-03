Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B10BE65C288
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 15:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238007AbjACOzb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 09:55:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237921AbjACOz2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 09:55:28 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 030DE10B7F
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 06:55:23 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id p2so16488986ljn.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 06:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPcXoGncLfsBSHWpzws4VEpw6t6P3C7Conan6TtJuk8=;
        b=Il5FGo6KF8DsWZECHNngFTo7bBwzv5EE/SGXUmdtwnrdKSQYwVz1TF4zrgdsR1Bxn7
         38WJnDNX5VdC7EUWd37C7sizTQaOKLLUco/9RvSFpy3zBUIrKGmyciB2fNiMF2Fn8ox6
         J3o4SeDppdc0HeVpbI6QPo07GstY53VhqKUm3i6i/WfIt7UMYhh6si2kxhGk1w4h9pIS
         bZiaSGiScLnV2Bmzj1wIqz1gyRYXRFKsKZc341X9Ku/fo3qOBQMRY3Yo0YcgEzDrUjau
         E5zGOel7Z+IakM+LuB2VOxOTGsInEnB2y+A7H/gLvzmxDpNJN8cRHufVAd2EScrK4J3x
         U8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPcXoGncLfsBSHWpzws4VEpw6t6P3C7Conan6TtJuk8=;
        b=Ne6cRN1kkfZk5kOMrX70GRG/afl6hyRLX8kLoLO5OrnEsIyPcrG6NqLfHFKvmTZU5V
         FZBCCXRviGc6ZbNawstTXLU3dzgnVD2qMvhlpiq4Ggc8VH3rQhtP6vFyTrgAgoPX3QNu
         f7ifk1UROCDMVCbWX0FTSXoOaOmESpReHi2xkqbOI+wlnx5N5V094PS1gydwwx85UHpZ
         pviz54a75JWACDDS/DlGQSKiYkHJF51/R9SATQE9vqZ9poieD6aoxXsERuPYYephmJQW
         zojup9NIBbemNOson7xWm3swYJs24aH11uui8DhwGDTkX2qXPrqjlSFiHlBVF2j82gwQ
         1bxg==
X-Gm-Message-State: AFqh2kqe3B0tsSZABIEYJpOxQQ7oqHASpGAxhYhezX+4UG++IHA1o2y1
        7Ybsb6f1OdlHZq+xPBzunt4Z0A==
X-Google-Smtp-Source: AMrXdXvnVc0tFSs1QnUTVG9xG7XCDAwOWPk0P4r8SVfwBDMv5p7C+6y4GPsXtgmR/aS49se/peRDyQ==
X-Received: by 2002:a2e:2282:0:b0:27f:ea39:9cc6 with SMTP id i124-20020a2e2282000000b0027fea399cc6mr2605116lji.12.1672757722563;
        Tue, 03 Jan 2023 06:55:22 -0800 (PST)
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
Subject: [PATCH 06/21] clk: qcom: gcc-msm8939: switch to parent_hws
Date:   Tue,  3 Jan 2023 16:55:00 +0200
Message-Id: <20230103145515.1164020-7-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/gcc-msm8939.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 712073f9dc69..7f8969a77974 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -73,8 +73,8 @@ static struct clk_regmap gpll0_vote = {
 	.enable_mask = BIT(0),
 	.hw.init = &(struct clk_init_data){
 		.name = "gpll0_vote",
-		.parent_data = &(const struct clk_parent_data) {
-			.hw = &gpll0.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll0.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
@@ -104,8 +104,8 @@ static struct clk_regmap gpll1_vote = {
 	.enable_mask = BIT(1),
 	.hw.init = &(struct clk_init_data){
 		.name = "gpll1_vote",
-		.parent_data = &(const struct clk_parent_data) {
-			.hw = &gpll1.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll1.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
@@ -135,8 +135,8 @@ static struct clk_regmap gpll2_vote = {
 	.enable_mask = BIT(2),
 	.hw.init = &(struct clk_init_data){
 		.name = "gpll2_vote",
-		.parent_data = &(const struct clk_parent_data) {
-			.hw = &gpll2.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll2.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
@@ -166,8 +166,8 @@ static struct clk_regmap bimc_pll_vote = {
 	.enable_mask = BIT(3),
 	.hw.init = &(struct clk_init_data){
 		.name = "bimc_pll_vote",
-		.parent_data = &(const struct clk_parent_data) {
-			.hw = &bimc_pll.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&bimc_pll.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
@@ -197,8 +197,8 @@ static struct clk_regmap gpll3_vote = {
 	.enable_mask = BIT(4),
 	.hw.init = &(struct clk_init_data){
 		.name = "gpll3_vote",
-		.parent_data = &(const struct clk_parent_data) {
-			.hw = &gpll3.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll3.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
@@ -244,8 +244,8 @@ static struct clk_regmap gpll4_vote = {
 	.enable_mask = BIT(5),
 	.hw.init = &(struct clk_init_data){
 		.name = "gpll4_vote",
-		.parent_data = &(const struct clk_parent_data) {
-			.hw = &gpll4.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll4.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
@@ -290,8 +290,8 @@ static struct clk_regmap gpll5_vote = {
 	.enable_mask = BIT(6),
 	.hw.init = &(struct clk_init_data){
 		.name = "gpll5_vote",
-		.parent_data = &(const struct clk_parent_data) {
-			.hw = &gpll5.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll5.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
@@ -321,8 +321,8 @@ static struct clk_regmap gpll6_vote = {
 	.enable_mask = BIT(7),
 	.hw.init = &(struct clk_init_data){
 		.name = "gpll6_vote",
-		.parent_data = &(const struct clk_parent_data) {
-			.hw = &gpll6.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll6.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
-- 
2.39.0

