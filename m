Return-Path: <linux-arm-msm+bounces-26380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C4B933365
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 23:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54CA81C225F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 21:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370C61448C6;
	Tue, 16 Jul 2024 21:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iAhb3H5G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549D213AA41
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 21:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721164420; cv=none; b=glRrZq2bG4EtE69Wb+Rk+wvmLtKPTrSXYRcg7WFYZ2mvRPwMx0zx1CUDKOd8lCwVMMkS3GY8Ulm3YpDzDBS0nvF/uTCNukr9E9TEZCZ2WOV9qqSPaLaX81K5I3l3vx46rA2fSI6OJTc9Tui9BuyonfEgOfn4XYNYR1TbYzwCtYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721164420; c=relaxed/simple;
	bh=0oZriMWjaIgZV44vIPNg/3B6G2vFChnf0RcaSBhdoPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ny0X4pU8DInNyGQuvnG8gKUafFxCQzrdmXLWxCB25E3gE2XCdGZrzCePFRFth6TqcusdVI9gYSgjnzjGJoSO//k8GJH5WBrlyV0181L4tNHXxFXY+nU6zgMkaDqVEzG+S9U3Zu+WobK8x5q5oXZht6Y6msDHbB1eyMAiYIYNPP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iAhb3H5G; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2eabd22d3f4so70246901fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 14:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721164414; x=1721769214; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=btdg2pahFxHDBfTssnoQaEgbku7Du54rgW9uJOHy36k=;
        b=iAhb3H5GZfVgQcEhiXa4hM0BgWYgdB/Ds/Vkwvn4rKyk47aV2Y4YpRtuVAamcz+F4D
         +uQQLxpUG+Etle7XfnuwrbM6b5XyNdKsjFOfun3SNhPE0WlyNVSewsXu+hxpYn5Si9QU
         Esn10g2uzf2bzLd+7if5QYXEFxp0uIM2yCt+eftYf+7jOZEpsjVhJtrsCt6WCW6dmTCS
         WW44aCfkL+HCsDgKiLnrf2o8pZ19LlpeDifIYqAfByTpGN2CO8wEBuYbDOo4DedpQ0em
         6qpP18QfFkBp6+HqQ9wcUZ78v9PsZrOF3f1PoCyiZ8Lj9kfouqxV7nodPPsxA1lzQlNI
         EbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721164414; x=1721769214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=btdg2pahFxHDBfTssnoQaEgbku7Du54rgW9uJOHy36k=;
        b=bxVwqexP4ENZs5RLh0KLidGJo5z2Q2/mO+xX3lXJZCBl+O4VA/bUCSnk8FVTy99cMv
         QVSI4GgbQSa7W+QYivuRe+MrxBDfhGIU54Xl5eTKJ5ND0urbTfT6tvSSsTM4VLjQajFn
         bGT5urKMqHjWGxHYFpyX2RVqclsj7wDXSDMaMbSR+mtEJvxQQxRu+9y1O5asgnWw+qWI
         R4ZpFMHDP7ltQFVQMK94WE/hGIiuCGVaTInJm6wzGXiu9ruTwmEK+U4QS+bHHyXHLSB4
         l9L4KRNSJO0FlnsrhRRt6PqB1Qm2Z3O5R3J6IBlw63cvYssanWnjm0KZsbYKncILiN4n
         +iYg==
X-Gm-Message-State: AOJu0YwOyAO//Ne39hv7RQuXVrHD82uUqs0ZCh6bdyc9o3gpJBM6DETP
	tThmyC+Ts1bU23HtcvImWRhTSHY1ULm9u61Na3BzGOnzDIJkARVZGRHIvcBK9m0=
X-Google-Smtp-Source: AGHT+IGui4Qj32X1ZDxlvzEftTzU4vkiCpW3AQ0LW3zBCQZ2c1m6MezYZmlE5isrJkYFne68hceN1w==
X-Received: by 2002:a2e:7018:0:b0:2ec:55b5:ed45 with SMTP id 38308e7fff4ca-2eef4190c67mr22784351fa.24.1721164414246;
        Tue, 16 Jul 2024 14:13:34 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eee179e723sm12433871fa.24.2024.07.16.14.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 14:13:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jul 2024 00:13:30 +0300
Subject: [PATCH 3/7] clk: qcom: dispcc-sm8550: make struct clk_init_data
 const
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240717-dispcc-sm8550-fixes-v1-3-efb4d927dc9a@linaro.org>
References: <20240717-dispcc-sm8550-fixes-v1-0-efb4d927dc9a@linaro.org>
In-Reply-To: <20240717-dispcc-sm8550-fixes-v1-0-efb4d927dc9a@linaro.org>
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
 bh=0oZriMWjaIgZV44vIPNg/3B6G2vFChnf0RcaSBhdoPs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmluJ5VMKNyzKZTDeHqEgRN7Ik7cF7hF6ghabxc
 zekqK8lNO+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZpbieQAKCRCLPIo+Aiko
 1RJ2B/wJBR+xhcthA91ju6494K8+d72y4z2pxmvBoVss74Jd2veKLRU3tSu1Df2St4Lw0b6UTyt
 B/0E1v5k4jlJ/eZ/gEBJSolzNKW31Ob4v+AIuK9nnzxQh7ETY4xU1Y2yPHGtHaZIPr8lbwXQ/e/
 eXuTLQ6sbbF7krMixyGO19yIaXsB0RpaT2W83sGLXtSr258e0IchQTH+Z60TvFsER7UjkstwGk8
 v6qZ3ii3pk6u0D2HVRdxKcxEhPXx7UY/YnHatdWpRrAiTReqPdwD8OIg2U4dIWGsIOuCavsRo07
 e+XDU6ix0rMETdQpwcN3lH28X9gb8pePMFaazURYQZsq6aNq
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The clk_init_data instances are not changed at runtime. Mark them as
constant data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8550.c | 160 +++++++++++++++++++--------------------
 1 file changed, 80 insertions(+), 80 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
index 8ceeb17bbb37..6bda15bf09ce 100644
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
 				&disp_cc_mdss_dptx1_link_div_clk_src.clkr.hw,
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


