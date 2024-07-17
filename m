Return-Path: <linux-arm-msm+bounces-26441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F10933ABA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 12:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 806A7281766
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 10:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAAF017FAC3;
	Wed, 17 Jul 2024 10:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x1P/PIBH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEAC17F367
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 10:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721210679; cv=none; b=Ja79j1wZGeCedUHbghAP501hlMHv4O07DG6XazRQlg2kQcp+vDELShH63hKZgyJHsdXtEdgWzf/cqsJ+M1cX1UIUYf4hjpRlw2eWUu75UJelz1nMzMVJkg5KuTmLhm0i70zZ98SmZb5DJYeP3fArtLZi8L8dhrJ186TIAGr2ZNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721210679; c=relaxed/simple;
	bh=3U0IaWBEIqRdtwZA2UUJCobD4x7BHpMF9Uj+RLs3W+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XKNxWD6gY9rvEhEz96WEvekiI4J5bifZDu9ghzH1a2gQWJpaqOfRPfyLn8cl9BKuenMtIRMg+MOkY8NihXIb3e1MU0olEoVsne5+pAh3lmSvMyuG50RHHhq8jzHueWIXkAhYMdjkL47Bz2jwL/q07w87eHhP1GTSdES98+5KfIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x1P/PIBH; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52ea5dc3c66so10776697e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 03:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721210674; x=1721815474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awqb3JOTt8PsRGQ1L/nboLrQRLc9456c08ZbXsCn2uk=;
        b=x1P/PIBHWZabwv/IwgIDG5SbUIJtVzmi5FPWzQMVljouWcyI4wTBOXB9QXy81rzo49
         pTiCKn1/nR3f3T8LevzJCRNlVram/z8RiuYqrpDlwGja3KmhOqfrF1WxI4apKVc0t8xd
         y01paHAgoQtc2+Fz63hvYuqC/M27AAhcgQ4gd4pR4oQ65W0aR7j8oRbscCIzAP7rSXSC
         s2Hdk683crkg07b9rKWz1Vy0vk6xcnbAmaSw9fKTjlbLzWIGlqmDrXSlhEkQhGoQMfPg
         gW0i8GrddktPG5w8YOtS6hYKbjn3KkywlGEsNWD/CLWI5UjznMORAmGjgEeRhNXK8Ge3
         IodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721210674; x=1721815474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=awqb3JOTt8PsRGQ1L/nboLrQRLc9456c08ZbXsCn2uk=;
        b=ZY2d8MUbLf3UiG8bEn0TOuN5S92ImzMOrqWdc502E/SlvubxNT8PozGgr4jMXilsFk
         9YvP8giKLvRKswttIESzTMpoTBDsxkhxQ+XKoaoOzB3J7QOBuwxReOyK5BbDe4MvTktQ
         BraiFBQ0nPJnNFYYRk07TKcgovnE3GFUmnGWtgYgVH51APxDuCV7Y580aA1LVuWHHucQ
         TZl5L98RwJCsiy8GVeFA85huQutcuX990xrRVEYWY8XMSFchA/l9DxLPQlM/qIbJdn3h
         htDispaXmYkGuBIKPZTxDZYkUjVaf/pO+Zfb4E4QMlwDozUlVpePiSOHIY5zLRCILiz7
         jilQ==
X-Gm-Message-State: AOJu0YxVj9DJsM0w5DVithapl1E3ZkV3y+EOiOzJuDo7Vo4QMy4zeRje
	32IG438Gz2qY2N+89YgIfZaqb88SqegVzruDrZYBPh7ubYsFF4uh5+lRRqhCD0c=
X-Google-Smtp-Source: AGHT+IGd8TBtOt2tbHXWoXqGKsdjnSYIXONmXlUqHgC5nIpomGJgnVFQgb0YeAIvpqq4KfQzSDJ3Rg==
X-Received: by 2002:a05:6512:3194:b0:52c:db76:2a7a with SMTP id 2adb3069b0e04-52ee53d7e1bmr1047139e87.34.1721210674146;
        Wed, 17 Jul 2024 03:04:34 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed253924asm1425391e87.262.2024.07.17.03.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 03:04:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jul 2024 13:04:30 +0300
Subject: [PATCH v2 3/7] clk: qcom: dispcc-sm8550: make struct clk_init_data
 const
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240717-dispcc-sm8550-fixes-v2-3-5c4a3128c40b@linaro.org>
References: <20240717-dispcc-sm8550-fixes-v2-0-5c4a3128c40b@linaro.org>
In-Reply-To: <20240717-dispcc-sm8550-fixes-v2-0-5c4a3128c40b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=31255;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3U0IaWBEIqRdtwZA2UUJCobD4x7BHpMF9Uj+RLs3W+o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBml5cuDq9oKuONko/iUueOTRUZbWeworrOnubHQ
 u6D2ipRJ3aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZpeXLgAKCRCLPIo+Aiko
 1cnPB/4tUkYVw0nNxCGLXejYy2ulCyBY90PmXqqrKglGc4NHzAKUIQEy7J96WUQ11oLfiJ9NAcY
 0ucVRaWwkW+6qwnuqzVt6SrlpHZYEIisStpmwiv/HNsF2OvjwzWIZB476InIubZklB3lCZkJ7iN
 iShE5Zz15j9f5AVKKY0RWYJkCyTMxIivBvdseIFJk+Gdo2/dV3PuMI3fPe9ABg8LON6BP2T5v2h
 xFS4mQrWZSQqh+6pUEseLgSuCT2iGxzUdAohhM35Mx85fog8btxIMAJyJGJHgpxtteUqdYaBJzn
 2N9BjeTa2JBxErDe2ciZK/HerIzUyWWB7M4NI5Hu/ZcuQZG5
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The clk_init_data instances are not changed at runtime. Mark them as
constant data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8550.c | 160 +++++++++++++++++++--------------------
 1 file changed, 80 insertions(+), 80 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
index a98230540782..1604a6a4acdc 100644
--- a/drivers/clk/qcom/dispcc-sm8550.c
+++ b/drivers/clk/qcom/dispcc-sm8550.c
@@ -95,7 +95,7 @@ static struct clk_alpha_pll disp_cc_pll0 = {
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
 	.clkr = {
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_pll0",
 			.parent_data = &(const struct clk_parent_data) {
 				.index = DT_BI_TCXO,
@@ -126,7 +126,7 @@ static struct clk_alpha_pll disp_cc_pll1 = {
 	.num_vco = ARRAY_SIZE(lucid_ole_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
 	.clkr = {
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_pll1",
 			.parent_data = &(const struct clk_parent_data) {
 				.index = DT_BI_TCXO,
@@ -286,7 +286,7 @@ static struct clk_rcg2 disp_cc_mdss_ahb_clk_src = {
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_6,
 	.freq_tbl = ftbl_disp_cc_mdss_ahb_clk_src,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_ahb_clk_src",
 		.parent_data = disp_cc_parent_data_6,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
@@ -306,7 +306,7 @@ static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_2,
 	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_byte0_clk_src",
 		.parent_data = disp_cc_parent_data_2,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
@@ -321,7 +321,7 @@ static struct clk_rcg2 disp_cc_mdss_byte1_clk_src = {
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_2,
 	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_byte1_clk_src",
 		.parent_data = disp_cc_parent_data_2,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
@@ -336,7 +336,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx0_aux_clk_src = {
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_0,
 	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx0_aux_clk_src",
 		.parent_data = disp_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
@@ -350,7 +350,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx0_link_clk_src = {
 	.mnd_width = 0,
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_7,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx0_link_clk_src",
 		.parent_data = disp_cc_parent_data_7,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_7),
@@ -365,7 +365,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx0_pixel0_clk_src = {
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_4,
 	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx0_pixel0_clk_src",
 		.parent_data = disp_cc_parent_data_4,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
@@ -380,7 +380,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx0_pixel1_clk_src = {
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_4,
 	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx0_pixel1_clk_src",
 		.parent_data = disp_cc_parent_data_4,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
@@ -395,7 +395,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx1_aux_clk_src = {
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_0,
 	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx1_aux_clk_src",
 		.parent_data = disp_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
@@ -409,7 +409,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx1_link_clk_src = {
 	.mnd_width = 0,
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_3,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx1_link_clk_src",
 		.parent_data = disp_cc_parent_data_3,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
@@ -424,7 +424,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx1_pixel0_clk_src = {
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_1,
 	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx1_pixel0_clk_src",
 		.parent_data = disp_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
@@ -439,7 +439,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx1_pixel1_clk_src = {
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_1,
 	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx1_pixel1_clk_src",
 		.parent_data = disp_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
@@ -454,7 +454,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx2_aux_clk_src = {
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_0,
 	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx2_aux_clk_src",
 		.parent_data = disp_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
@@ -468,7 +468,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx2_link_clk_src = {
 	.mnd_width = 0,
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_3,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx2_link_clk_src",
 		.parent_data = disp_cc_parent_data_3,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
@@ -483,7 +483,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx2_pixel0_clk_src = {
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_1,
 	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx2_pixel0_clk_src",
 		.parent_data = disp_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
@@ -498,7 +498,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx2_pixel1_clk_src = {
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_1,
 	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx2_pixel1_clk_src",
 		.parent_data = disp_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
@@ -513,7 +513,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx3_aux_clk_src = {
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_0,
 	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx3_aux_clk_src",
 		.parent_data = disp_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
@@ -527,7 +527,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx3_link_clk_src = {
 	.mnd_width = 0,
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_3,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx3_link_clk_src",
 		.parent_data = disp_cc_parent_data_3,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
@@ -542,7 +542,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx3_pixel0_clk_src = {
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_1,
 	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx3_pixel0_clk_src",
 		.parent_data = disp_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
@@ -557,7 +557,7 @@ static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_5,
 	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_esc0_clk_src",
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
@@ -572,7 +572,7 @@ static struct clk_rcg2 disp_cc_mdss_esc1_clk_src = {
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_5,
 	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_esc1_clk_src",
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
@@ -600,7 +600,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_8,
 	.freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_mdp_clk_src",
 		.parent_data = disp_cc_parent_data_8,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_8),
@@ -615,7 +615,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_2,
 	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_pclk0_clk_src",
 		.parent_data = disp_cc_parent_data_2,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
@@ -630,7 +630,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk1_clk_src = {
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_2,
 	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_pclk1_clk_src",
 		.parent_data = disp_cc_parent_data_2,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
@@ -645,7 +645,7 @@ static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_0,
 	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_vsync_clk_src",
 		.parent_data = disp_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
@@ -665,7 +665,7 @@ static struct clk_rcg2 disp_cc_sleep_clk_src = {
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_9,
 	.freq_tbl = ftbl_disp_cc_sleep_clk_src,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_sleep_clk_src",
 		.parent_data = disp_cc_parent_data_9,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_9),
@@ -680,7 +680,7 @@ static struct clk_rcg2 disp_cc_xo_clk_src = {
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_0,
 	.freq_tbl = ftbl_disp_cc_mdss_byte0_clk_src,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_xo_clk_src",
 		.parent_data = disp_cc_parent_data_0_ao,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0_ao),
@@ -693,7 +693,7 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
 	.reg = 0x8120,
 	.shift = 0,
 	.width = 4,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_byte0_div_clk_src",
 		.parent_hws = (const struct clk_hw*[]) {
 			&disp_cc_mdss_byte0_clk_src.clkr.hw,
@@ -707,7 +707,7 @@ static struct clk_regmap_div disp_cc_mdss_byte1_div_clk_src = {
 	.reg = 0x813c,
 	.shift = 0,
 	.width = 4,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_byte1_div_clk_src",
 		.parent_hws = (const struct clk_hw*[]) {
 			&disp_cc_mdss_byte1_clk_src.clkr.hw,
@@ -721,7 +721,7 @@ static struct clk_regmap_div disp_cc_mdss_dptx0_link_div_clk_src = {
 	.reg = 0x8188,
 	.shift = 0,
 	.width = 4,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx0_link_div_clk_src",
 		.parent_hws = (const struct clk_hw*[]) {
 			&disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
@@ -736,7 +736,7 @@ static struct clk_regmap_div disp_cc_mdss_dptx1_link_div_clk_src = {
 	.reg = 0x821c,
 	.shift = 0,
 	.width = 4,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx1_link_div_clk_src",
 		.parent_hws = (const struct clk_hw*[]) {
 			&disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
@@ -751,7 +751,7 @@ static struct clk_regmap_div disp_cc_mdss_dptx2_link_div_clk_src = {
 	.reg = 0x8250,
 	.shift = 0,
 	.width = 4,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx2_link_div_clk_src",
 		.parent_hws = (const struct clk_hw*[]) {
 			&disp_cc_mdss_dptx2_link_clk_src.clkr.hw,
@@ -766,7 +766,7 @@ static struct clk_regmap_div disp_cc_mdss_dptx3_link_div_clk_src = {
 	.reg = 0x82cc,
 	.shift = 0,
 	.width = 4,
-	.clkr.hw.init = &(struct clk_init_data) {
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx3_link_div_clk_src",
 		.parent_hws = (const struct clk_hw*[]) {
 			&disp_cc_mdss_dptx3_link_clk_src.clkr.hw,
@@ -783,7 +783,7 @@ static struct clk_branch disp_cc_mdss_accu_clk = {
 	.clkr = {
 		.enable_reg = 0xe058,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_accu_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_xo_clk_src.clkr.hw,
@@ -801,7 +801,7 @@ static struct clk_branch disp_cc_mdss_ahb1_clk = {
 	.clkr = {
 		.enable_reg = 0xa020,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_ahb1_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_ahb_clk_src.clkr.hw,
@@ -819,7 +819,7 @@ static struct clk_branch disp_cc_mdss_ahb_clk = {
 	.clkr = {
 		.enable_reg = 0x80a4,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_ahb_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_ahb_clk_src.clkr.hw,
@@ -837,7 +837,7 @@ static struct clk_branch disp_cc_mdss_byte0_clk = {
 	.clkr = {
 		.enable_reg = 0x8028,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_byte0_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_byte0_clk_src.clkr.hw,
@@ -855,7 +855,7 @@ static struct clk_branch disp_cc_mdss_byte0_intf_clk = {
 	.clkr = {
 		.enable_reg = 0x802c,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_byte0_intf_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_byte0_div_clk_src.clkr.hw,
@@ -873,7 +873,7 @@ static struct clk_branch disp_cc_mdss_byte1_clk = {
 	.clkr = {
 		.enable_reg = 0x8030,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_byte1_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_byte1_clk_src.clkr.hw,
@@ -891,7 +891,7 @@ static struct clk_branch disp_cc_mdss_byte1_intf_clk = {
 	.clkr = {
 		.enable_reg = 0x8034,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_byte1_intf_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_byte1_div_clk_src.clkr.hw,
@@ -909,7 +909,7 @@ static struct clk_branch disp_cc_mdss_dptx0_aux_clk = {
 	.clkr = {
 		.enable_reg = 0x8058,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx0_aux_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_dptx0_aux_clk_src.clkr.hw,
@@ -927,7 +927,7 @@ static struct clk_branch disp_cc_mdss_dptx0_crypto_clk = {
 	.clkr = {
 		.enable_reg = 0x804c,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx0_crypto_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
@@ -945,7 +945,7 @@ static struct clk_branch disp_cc_mdss_dptx0_link_clk = {
 	.clkr = {
 		.enable_reg = 0x8040,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx0_link_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
@@ -963,7 +963,7 @@ static struct clk_branch disp_cc_mdss_dptx0_link_intf_clk = {
 	.clkr = {
 		.enable_reg = 0x8048,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx0_link_intf_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_dptx0_link_div_clk_src.clkr.hw,
@@ -981,7 +981,7 @@ static struct clk_branch disp_cc_mdss_dptx0_pixel0_clk = {
 	.clkr = {
 		.enable_reg = 0x8050,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx0_pixel0_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_dptx0_pixel0_clk_src.clkr.hw,
@@ -999,7 +999,7 @@ static struct clk_branch disp_cc_mdss_dptx0_pixel1_clk = {
 	.clkr = {
 		.enable_reg = 0x8054,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx0_pixel1_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_dptx0_pixel1_clk_src.clkr.hw,
@@ -1017,7 +1017,7 @@ static struct clk_branch disp_cc_mdss_dptx0_usb_router_link_intf_clk = {
 	.clkr = {
 		.enable_reg = 0x8044,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx0_usb_router_link_intf_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_dptx0_link_div_clk_src.clkr.hw,
@@ -1035,7 +1035,7 @@ static struct clk_branch disp_cc_mdss_dptx1_aux_clk = {
 	.clkr = {
 		.enable_reg = 0x8074,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx1_aux_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_dptx1_aux_clk_src.clkr.hw,
@@ -1053,7 +1053,7 @@ static struct clk_branch disp_cc_mdss_dptx1_crypto_clk = {
 	.clkr = {
 		.enable_reg = 0x8070,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx1_crypto_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
@@ -1071,7 +1071,7 @@ static struct clk_branch disp_cc_mdss_dptx1_link_clk = {
 	.clkr = {
 		.enable_reg = 0x8064,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx1_link_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
@@ -1089,7 +1089,7 @@ static struct clk_branch disp_cc_mdss_dptx1_link_intf_clk = {
 	.clkr = {
 		.enable_reg = 0x806c,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx1_link_intf_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_dptx1_link_div_clk_src.clkr.hw,
@@ -1107,7 +1107,7 @@ static struct clk_branch disp_cc_mdss_dptx1_pixel0_clk = {
 	.clkr = {
 		.enable_reg = 0x805c,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx1_pixel0_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_dptx1_pixel0_clk_src.clkr.hw,
@@ -1125,7 +1125,7 @@ static struct clk_branch disp_cc_mdss_dptx1_pixel1_clk = {
 	.clkr = {
 		.enable_reg = 0x8060,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx1_pixel1_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_dptx1_pixel1_clk_src.clkr.hw,
@@ -1143,7 +1143,7 @@ static struct clk_branch disp_cc_mdss_dptx1_usb_router_link_intf_clk = {
 	.clkr = {
 		.enable_reg = 0x8068,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx1_usb_router_link_intf_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_dptx0_link_div_clk_src.clkr.hw,
@@ -1161,7 +1161,7 @@ static struct clk_branch disp_cc_mdss_dptx2_aux_clk = {
 	.clkr = {
 		.enable_reg = 0x808c,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx2_aux_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_dptx2_aux_clk_src.clkr.hw,
@@ -1179,7 +1179,7 @@ static struct clk_branch disp_cc_mdss_dptx2_crypto_clk = {
 	.clkr = {
 		.enable_reg = 0x8088,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx2_crypto_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_dptx2_link_clk_src.clkr.hw,
@@ -1197,7 +1197,7 @@ static struct clk_branch disp_cc_mdss_dptx2_link_clk = {
 	.clkr = {
 		.enable_reg = 0x8080,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx2_link_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_dptx2_link_clk_src.clkr.hw,
@@ -1215,7 +1215,7 @@ static struct clk_branch disp_cc_mdss_dptx2_link_intf_clk = {
 	.clkr = {
 		.enable_reg = 0x8084,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx2_link_intf_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_dptx2_link_div_clk_src.clkr.hw,
@@ -1233,7 +1233,7 @@ static struct clk_branch disp_cc_mdss_dptx2_pixel0_clk = {
 	.clkr = {
 		.enable_reg = 0x8078,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx2_pixel0_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_dptx2_pixel0_clk_src.clkr.hw,
@@ -1251,7 +1251,7 @@ static struct clk_branch disp_cc_mdss_dptx2_pixel1_clk = {
 	.clkr = {
 		.enable_reg = 0x807c,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx2_pixel1_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_dptx2_pixel1_clk_src.clkr.hw,
@@ -1269,7 +1269,7 @@ static struct clk_branch disp_cc_mdss_dptx3_aux_clk = {
 	.clkr = {
 		.enable_reg = 0x809c,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx3_aux_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_dptx3_aux_clk_src.clkr.hw,
@@ -1287,7 +1287,7 @@ static struct clk_branch disp_cc_mdss_dptx3_crypto_clk = {
 	.clkr = {
 		.enable_reg = 0x80a0,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx3_crypto_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_dptx3_link_clk_src.clkr.hw,
@@ -1305,7 +1305,7 @@ static struct clk_branch disp_cc_mdss_dptx3_link_clk = {
 	.clkr = {
 		.enable_reg = 0x8094,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx3_link_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_dptx3_link_clk_src.clkr.hw,
@@ -1323,7 +1323,7 @@ static struct clk_branch disp_cc_mdss_dptx3_link_intf_clk = {
 	.clkr = {
 		.enable_reg = 0x8098,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx3_link_intf_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_dptx3_link_div_clk_src.clkr.hw,
@@ -1341,7 +1341,7 @@ static struct clk_branch disp_cc_mdss_dptx3_pixel0_clk = {
 	.clkr = {
 		.enable_reg = 0x8090,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx3_pixel0_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_dptx3_pixel0_clk_src.clkr.hw,
@@ -1359,7 +1359,7 @@ static struct clk_branch disp_cc_mdss_esc0_clk = {
 	.clkr = {
 		.enable_reg = 0x8038,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_esc0_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_esc0_clk_src.clkr.hw,
@@ -1377,7 +1377,7 @@ static struct clk_branch disp_cc_mdss_esc1_clk = {
 	.clkr = {
 		.enable_reg = 0x803c,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_esc1_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_esc1_clk_src.clkr.hw,
@@ -1395,7 +1395,7 @@ static struct clk_branch disp_cc_mdss_mdp1_clk = {
 	.clkr = {
 		.enable_reg = 0xa004,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_mdp1_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_mdp_clk_src.clkr.hw,
@@ -1413,7 +1413,7 @@ static struct clk_branch disp_cc_mdss_mdp_clk = {
 	.clkr = {
 		.enable_reg = 0x800c,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_mdp_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_mdp_clk_src.clkr.hw,
@@ -1431,7 +1431,7 @@ static struct clk_branch disp_cc_mdss_mdp_lut1_clk = {
 	.clkr = {
 		.enable_reg = 0xa010,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_mdp_lut1_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_mdp_clk_src.clkr.hw,
@@ -1449,7 +1449,7 @@ static struct clk_branch disp_cc_mdss_mdp_lut_clk = {
 	.clkr = {
 		.enable_reg = 0x8018,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_mdp_lut_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_mdp_clk_src.clkr.hw,
@@ -1467,7 +1467,7 @@ static struct clk_branch disp_cc_mdss_non_gdsc_ahb_clk = {
 	.clkr = {
 		.enable_reg = 0xc004,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_non_gdsc_ahb_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_ahb_clk_src.clkr.hw,
@@ -1485,7 +1485,7 @@ static struct clk_branch disp_cc_mdss_pclk0_clk = {
 	.clkr = {
 		.enable_reg = 0x8004,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_pclk0_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_pclk0_clk_src.clkr.hw,
@@ -1503,7 +1503,7 @@ static struct clk_branch disp_cc_mdss_pclk1_clk = {
 	.clkr = {
 		.enable_reg = 0x8008,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_pclk1_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_pclk1_clk_src.clkr.hw,
@@ -1521,7 +1521,7 @@ static struct clk_branch disp_cc_mdss_rscc_ahb_clk = {
 	.clkr = {
 		.enable_reg = 0xc00c,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_rscc_ahb_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_ahb_clk_src.clkr.hw,
@@ -1539,7 +1539,7 @@ static struct clk_branch disp_cc_mdss_rscc_vsync_clk = {
 	.clkr = {
 		.enable_reg = 0xc008,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_rscc_vsync_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_vsync_clk_src.clkr.hw,
@@ -1557,7 +1557,7 @@ static struct clk_branch disp_cc_mdss_vsync1_clk = {
 	.clkr = {
 		.enable_reg = 0xa01c,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_vsync1_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_vsync_clk_src.clkr.hw,
@@ -1575,7 +1575,7 @@ static struct clk_branch disp_cc_mdss_vsync_clk = {
 	.clkr = {
 		.enable_reg = 0x8024,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_mdss_vsync_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_mdss_vsync_clk_src.clkr.hw,
@@ -1593,7 +1593,7 @@ static struct clk_branch disp_cc_sleep_clk = {
 	.clkr = {
 		.enable_reg = 0xe074,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
+		.hw.init = &(const struct clk_init_data) {
 			.name = "disp_cc_sleep_clk",
 			.parent_hws = (const struct clk_hw*[]) {
 				&disp_cc_sleep_clk_src.clkr.hw,

-- 
2.39.2


