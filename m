Return-Path: <linux-arm-msm+bounces-16797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB9289BE4C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 13:47:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2C561C21334
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 11:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C846A02D;
	Mon,  8 Apr 2024 11:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S/G4QX02"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4D569DFE
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Apr 2024 11:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712576835; cv=none; b=K5sa18xkgWzZQGvgrjArCskMzTkeIEQr0tAngBdgKrO52LUl8/QynNL5QMwyzfrOpUiC9CuIX4rUz1fWD4E3bmtGNoz0EcEyMXAJI4qsMyAZPJr/OkG4VVxf82ucRkfIFPanmsTHDTiwMIvoAjKdgHvoeU434ab/hce8u+AQ/r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712576835; c=relaxed/simple;
	bh=JEEcZ7GT4m842B7HDSa1gs6t5sncwlWhVy9ppSIiaIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UmP95oJOvC1XWFVxdUMPjasTadc7lgsstwuw48hA7WWw9Lvo6tWdmZYEyKwWTbeC9sqIH+A7pvqmApn86vtTvtqboJr5vAJitOCowAuVPwA36/BucvBfAMZcEkTi203b44m8Y7nsVLNCO0JE20/f1fRUt8z/WhbLQd+PvYMmSZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S/G4QX02; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-516d04fc04bso6367331e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Apr 2024 04:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712576831; x=1713181631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=64cuR2i1dQD0IH225310OR1c+tox9VMCKmc6hrJvTAA=;
        b=S/G4QX02wZnjOpjv8gK6fehWyj6iTtzWtOJzh0M5jCGnfQkGPp9gUsnwEUpkSY0xer
         trtjfnxtVVoj4DXI0mdRCEouOjY2tyJeR4NPg1If9orQ8e5YunJWUqlpfnmklyn1iX+/
         TrZYnKg/hpX4j38oH6zTWG3dhPEY4sZKeq416M3/C0uXhqqcXqIn8xwCmgtO8ahcPFni
         0t/2uXd+WeQM/ig8H+jN5Vy+4AS8iT1ByA54fsR/F/dxNHntjQ4UQ4obnr7Sus0N8xT+
         K9fPKaTOj7UdJKSjNkXn6FqnCQKFCZOUNeaZ71sF018IeNjwlrM0qkuz+hdqqokdsnrO
         N/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712576831; x=1713181631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64cuR2i1dQD0IH225310OR1c+tox9VMCKmc6hrJvTAA=;
        b=EPHQyhOBFZH7tZIv0eIwW1hFm0JqMwd/XvLH2CTCXdxEuSgunctSVioGiLuDkU7C4K
         z1VfHGvlx3VrP5Fkoj4o0DKp031QX/R0CjmoRXHzsjoBE5yjGY7LKHoLzTeTkObpIV+Q
         rboDHrHho6lyE32wqI+EsID+P4YR4JIveYQNfSi53/044c8+WefmiVe/gJeF7M3eBxfw
         pUTSof3Mt7KEacMiynpjfoZYpEUn2X6Qgsgfb+mJOw6fdYPoQJPR9PI7qmt97UaPTv7V
         rWZQgatxtl2fDPEuMnM81ZmnvsYOPMqHK7f2fc4sIonmp+W/qzHl6TJqruptwg5BAnto
         QDDQ==
X-Gm-Message-State: AOJu0Yyw7BOAwwQRBiIEMMSG7KSkJPAsXTqvlalZCyh6pI7TU3hhUmjp
	C1MA/p/P8o9ETXmDpxY/aeccKK0kgkJMEIH+wsH4CxT6a0GNeXHWOEy0fWJaWks=
X-Google-Smtp-Source: AGHT+IE1RRgf0MEyF18A0T8NT3YmtSCMr0fSfeTqjN58nIVz22Wj9SjCxFiRSSb3akCmh1cUTwTUHg==
X-Received: by 2002:a19:6446:0:b0:513:7e83:b3f2 with SMTP id b6-20020a196446000000b005137e83b3f2mr7832191lfj.45.1712576831520;
        Mon, 08 Apr 2024 04:47:11 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g17-20020a19e051000000b005158ddab172sm1175549lfj.19.2024.04.08.04.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 04:47:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 08 Apr 2024 14:47:04 +0300
Subject: [PATCH 1/4] clk: qcom: dispcc-sm8450: fix DisplayPort clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240408-dispcc-dp-clocks-v1-1-f9e44902c28d@linaro.org>
References: <20240408-dispcc-dp-clocks-v1-0-f9e44902c28d@linaro.org>
In-Reply-To: <20240408-dispcc-dp-clocks-v1-0-f9e44902c28d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3066;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=JEEcZ7GT4m842B7HDSa1gs6t5sncwlWhVy9ppSIiaIw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmE9k9tcMAUMKUHJNNPHZnqDs/qTZ3VWTBd0n2i
 fafY7QDhhqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhPZPQAKCRCLPIo+Aiko
 1XIfB/4kyD9Ash8QTxO2U1slDgEC6Zst91dV2SrsOfjSQfodYgvtIi0DIYikJyMoNSEf2j5pH7z
 AmsrZuna+oYnHu93FXhbYBeXGE19J5BKrhKgfy2eKUsZo1sA2c15HXrdGOOeIGAi9o/rE26LwWj
 Ifg9g5154EOEPVsUxx59wgDYCOQ+0+S9PXHGtGoDRq33Da1IHOGfIuSjlu78mnvqDHyldV/xDL6
 omC7299WD21kaB5nEQ5x+CDKGs3MoHZ2W+a6JmxPWu4nppLjb+WEjM0yU7sDTbPz0HwGj/yJ0Pq
 ZdBgwj+64oxGAVrQfKSD6ujPWp4QZNv8K5sP0ieS4/P0vOkL
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On SM8450 DisplayPort link clocks use frequency tables inherited from
the vendor kernel, it is not applicable in the upstream kernel. Drop
frequency tables and use clk_byte2_ops for those clocks.

Fixes: 16fb89f92ec4 ("clk: qcom: Add support for Display Clock Controller on SM8450")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8450.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
index 92e9c4e7b13d..49bb4f58c391 100644
--- a/drivers/clk/qcom/dispcc-sm8450.c
+++ b/drivers/clk/qcom/dispcc-sm8450.c
@@ -309,26 +309,17 @@ static struct clk_rcg2 disp_cc_mdss_dptx0_aux_clk_src = {
 	},
 };
 
-static const struct freq_tbl ftbl_disp_cc_mdss_dptx0_link_clk_src[] = {
-	F(162000, P_DP0_PHY_PLL_LINK_CLK, 1, 0, 0),
-	F(270000, P_DP0_PHY_PLL_LINK_CLK, 1, 0, 0),
-	F(540000, P_DP0_PHY_PLL_LINK_CLK, 1, 0, 0),
-	F(810000, P_DP0_PHY_PLL_LINK_CLK, 1, 0, 0),
-	{ }
-};
-
 static struct clk_rcg2 disp_cc_mdss_dptx0_link_clk_src = {
 	.cmd_rcgr = 0x819c,
 	.mnd_width = 0,
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_3,
-	.freq_tbl = ftbl_disp_cc_mdss_dptx0_link_clk_src,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx0_link_clk_src",
 		.parent_data = disp_cc_parent_data_3,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_byte2_ops,
 	},
 };
 
@@ -382,13 +373,12 @@ static struct clk_rcg2 disp_cc_mdss_dptx1_link_clk_src = {
 	.mnd_width = 0,
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_3,
-	.freq_tbl = ftbl_disp_cc_mdss_dptx0_link_clk_src,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx1_link_clk_src",
 		.parent_data = disp_cc_parent_data_3,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_byte2_ops,
 	},
 };
 
@@ -442,13 +432,12 @@ static struct clk_rcg2 disp_cc_mdss_dptx2_link_clk_src = {
 	.mnd_width = 0,
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_3,
-	.freq_tbl = ftbl_disp_cc_mdss_dptx0_link_clk_src,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx2_link_clk_src",
 		.parent_data = disp_cc_parent_data_3,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_byte2_ops,
 	},
 };
 
@@ -502,13 +491,12 @@ static struct clk_rcg2 disp_cc_mdss_dptx3_link_clk_src = {
 	.mnd_width = 0,
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_3,
-	.freq_tbl = ftbl_disp_cc_mdss_dptx0_link_clk_src,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx3_link_clk_src",
 		.parent_data = disp_cc_parent_data_3,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_byte2_ops,
 	},
 };
 

-- 
2.39.2


