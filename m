Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0093548EB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 00:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242890AbhDEWsQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 18:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242893AbhDEWsO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 18:48:14 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C43BC0617A7
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Apr 2021 15:48:06 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id o126so19731910lfa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Apr 2021 15:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2GUMc9wPOUv+tfg455GAVwvWHenU8m+juwsP+KD2CJI=;
        b=HBkpckv6AmpuafrqLmYJkeadbYqaoEBLcN/4Dpxl6nks3U6rKCbyTOBWwNnfA9aQ0Q
         4g5QV0LqisFiKCjMR1Epi7kTAhFjCSXN9ZHl3eW8lSyZyVwbo/qQ3wn8p+qq4fG3g1yf
         nJMird5z+DeyF4n/scmNcaTvugLQIVLDl+yhDdfXpT3smo2wOphHfQD/BtUYtZI09uvg
         1g86DFvX49EMmI+bYJYThrUhpWx6r4dKbPBhnmImwb5uAmZwl9BGY13nujWGvCfS3+Hx
         l0LO6sEulHXOlqexKtdu5723Xbo0hbSJRdkcExPAaXr09GCKmv1aKVwMbPUnunmWDk16
         hOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2GUMc9wPOUv+tfg455GAVwvWHenU8m+juwsP+KD2CJI=;
        b=Ke1W78miSk+ajdDC4sjehs88IWGHFFGao1VQCVYwNDLX9THIPWxPxQePbnxJSnIIvz
         OAcskNmp6RCGh3IXut7UFAIn3XfeT+oDmlRJ9ZQ6jKYPAkMT1QQR3SYD9M1HvNyV9kFb
         rDPpYb57u0hS4RNOKQvnI7t2nDfzUYfCkEy5+uieSXOAW2aqgAd0mMCcjG/VPcxlkFLU
         7Hvg8dT7TW3W7gsyRVi/qkrAxNSpxImIcL5YjZyBj9qIk4DPea6Dwdy6UK8sfTr/KhH6
         T7ZHxCKrAxI2baaXClbXQGXK3jpirGZKQ9qm+CpGM6gbJAbwE5+IXMu2XlvPJAOgEeVV
         KOKw==
X-Gm-Message-State: AOAM532oKtxdCnzlEMbwvmvFxTTO2dldPWUsTGv54eW0yPAWcmdkpfnu
        wO5cBfeUoUh+djLwjUZi8gQxhQ==
X-Google-Smtp-Source: ABdhPJzEsGCRkPWk/sRJkvG2qCf3Nbj9bsd9MrpaKiVhJG0jUL61WZBCm3fI9vQVCbXG0J3WWg8v2A==
X-Received: by 2002:a05:6512:a95:: with SMTP id m21mr19006619lfu.59.1617662885185;
        Mon, 05 Apr 2021 15:48:05 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:48:04 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 28/33] clk: qcom: videocc-sm8250: use parent_hws where possible
Date:   Tue,  6 Apr 2021 01:47:38 +0300
Message-Id: <20210405224743.590029-29-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Switch to using parent_hws instead of parent_data when parents are
defined in this driver and so accessible using clk_hw.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/videocc-sm8250.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index 06a8a2c98deb..7b435a1c2c4b 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -158,8 +158,8 @@ static struct clk_regmap_div video_cc_mvs0c_div2_div_clk_src = {
 	.width = 2,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "video_cc_mvs0c_div2_div_clk_src",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &video_cc_mvs0_clk_src.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]){
+			&video_cc_mvs0_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -173,8 +173,8 @@ static struct clk_regmap_div video_cc_mvs0_div_clk_src = {
 	.width = 2,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "video_cc_mvs0_div_clk_src",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &video_cc_mvs0_clk_src.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]){
+			&video_cc_mvs0_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -188,8 +188,8 @@ static struct clk_regmap_div video_cc_mvs1c_div2_div_clk_src = {
 	.width = 2,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "video_cc_mvs1c_div2_div_clk_src",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &video_cc_mvs1_clk_src.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]){
+			&video_cc_mvs1_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -205,8 +205,8 @@ static struct clk_branch video_cc_mvs0c_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_mvs0c_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &video_cc_mvs0c_div2_div_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&video_cc_mvs0c_div2_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -223,8 +223,8 @@ static struct clk_branch video_cc_mvs0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_mvs0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &video_cc_mvs0_div_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&video_cc_mvs0_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -241,8 +241,8 @@ static struct clk_branch video_cc_mvs1_div2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_mvs1_div2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &video_cc_mvs1c_div2_div_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&video_cc_mvs1c_div2_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -259,8 +259,8 @@ static struct clk_branch video_cc_mvs1c_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_mvs1c_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &video_cc_mvs1c_div2_div_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&video_cc_mvs1c_div2_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.30.2

