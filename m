Return-Path: <linux-arm-msm+bounces-18374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 517038AFDEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 03:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68CACB24D0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 01:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B8B6C138;
	Wed, 24 Apr 2024 01:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IlilE/EJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534C879E5
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 01:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713922775; cv=none; b=QHkBqvwlaSua5Gc29SogQjzXttuTMKe5MgFRVEabN75Rn63xNPVV3JrxUy1moJ4roLHrU9jBoAy+416xCkOvVXpjltybumtzKE1wtyjYJaGLSKGwlQIpMOxnkmST6x39UEy+Pv11Yx+1V1CbJfZWyV/AVDyHGkmIgFo9X2gaVZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713922775; c=relaxed/simple;
	bh=1TNV+A/4m11S1W9ZXAXoZL1N6Y2XAKcktMUgBdQ0cZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YdkaijmqXEvoOjJQ9W+qLTjoNj6Q2tOWDgf1c/dXNcYAQtjidLlmhOZDUT1j6ptOWWN8TfpQcvZlT2SsrEuM0iz4R1FBOiiHErlVj4LAn2tKsBIOCENQ/gmijwRtrKo+X+CUQVJTtvAhpgUZJOwq3ojpkufPpk6wPC6tIn0rmXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IlilE/EJ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5196fe87775so7127763e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 18:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713922771; x=1714527571; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cJoCACejTvVNTMumrx7VXm4ppUqFHLWNFQf8H6dvfNY=;
        b=IlilE/EJHk/AvfgZ4zz5v2FBZY4pq/DJRURuzBRlg6XqGnHC2pkO5I6dNEWJtGc+p4
         XPo3Iu8xhvyTPKtR/kcmHd6tn0LcNxAGYfPCg6zT5EXxHqUMUgLtjf2e+6WyguEjfzYn
         KQy2Z6S+ZjovnvKUObdpQLkYh8oBVd2Uj03g1dAyzfG6BTRVAf5P+QtZd40dstO9TDuS
         M1EVsLVpGf7Feov8LTsJMI4NJYwzph8cSy2v0saDguRawtc6blw25s8cy7FP0euJGn9v
         JRbAGhgFlZzyvehySg0ht5+z7UxQ8xZ0vImjL5HwiNz7AgABDI7InCbOYEamyPmNiY/q
         aoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713922771; x=1714527571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJoCACejTvVNTMumrx7VXm4ppUqFHLWNFQf8H6dvfNY=;
        b=ufi4b0GE+pifOFKNPGj4Qip5LSVS5QT3ftaQeOhAs2v6dlXlkxon6PhY7BNA1Scj4Z
         Tc6uVdMZWARErNtFdgAWAzANOysTxgxVp9QJWW23iYkN+4ZAuUDO0fGGEWaH5n7+gRR2
         sk4TvXlzaxPO+XUb6jAfdfT2E2jfhyvfwaMH7IwqV9oN7NdexlRuZLCdi0deVSNsiLng
         hNcoYCQOLBeB3CiMiWwWJ0z/KfSIgXeC9OWQrEYdmkfXa8kizHfx7Q1BbdUvtSsPcuqH
         yvqiLlh/7myltplQNjF7oHwzQVMA2c5cpSbEBiv53o8scq12Z6ueV4FBQveokch2A2vr
         Z6OQ==
X-Gm-Message-State: AOJu0Yxd0badQoAhi7R6yre4zOa5skZDuT4SAUyRZwY3LrHp8IsW1IA1
	JlK3yDp9W1ytR5LazdyDB5zX2kF3tRsDV6dmdTr8wbSt7t4q8mbsStM4cUd81Zs=
X-Google-Smtp-Source: AGHT+IF0nuieByWCSPjCg4bT7Q5vlhyC/Y+uie80JuHPiUTEuNF6g/GKIm4bUsSHVV9O2yHEazwrPA==
X-Received: by 2002:a19:a405:0:b0:51b:ebe0:a91a with SMTP id q5-20020a19a405000000b0051bebe0a91amr135919lfc.36.1713922771490;
        Tue, 23 Apr 2024 18:39:31 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g12-20020a19ac0c000000b0051bb40c7ee7sm308220lfc.185.2024.04.23.18.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 18:39:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Apr 2024 04:39:29 +0300
Subject: [PATCH v2 1/4] clk: qcom: dispcc-sm8450: fix DisplayPort clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-dispcc-dp-clocks-v2-1-b44038f3fa96@linaro.org>
References: <20240424-dispcc-dp-clocks-v2-0-b44038f3fa96@linaro.org>
In-Reply-To: <20240424-dispcc-dp-clocks-v2-0-b44038f3fa96@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3434;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=1TNV+A/4m11S1W9ZXAXoZL1N6Y2XAKcktMUgBdQ0cZU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmKGLR1RppQVh11o6eHfRn4+pGpEJL2EBItT12m
 E743opng3iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZihi0QAKCRCLPIo+Aiko
 1ZgmCACnupbT6UvuvpjZfG+ihUUa7OqyePSSQ/fKiiYfTvwYTFDztFxlnBIQOcxB2BThNbxs3vN
 LKFDpx1U/x1OKzGCKyhJZCdZ8t9u61z3VIzmpk6pGiv/OTY84PEzI2DvFmjHG3imD3ib2Bz3MGs
 hA///9L+BYj7udt3gc8aMRTfJE0JjTSkjiGB9CFV9teQQTCixHkuMOb4D4s+n1c6t3TOZ2H/ZkM
 QrPIImvd7HgKbSiNJl6pKEr8yJ4X09d64ABEitRCZWvCKOtWUKdQktmB4zDjT6I+1438hjhzT1i
 RitpADWgEm8OJhjkD99y85L/ri/YcaDg3xYsQNwzUIRiUARB
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On SM8450 DisplayPort link clocks use frequency tables inherited from
the vendor kernel, it is not applicable in the upstream kernel. Drop
frequency tables and use clk_byte2_ops for those clocks.

This fixes frequency selection in the OPP core (which otherwise attempts
to use invalid 810 KHz as DP link rate), also fixing the following
message:
msm-dp-display ae90000.displayport-controller: _opp_config_clk_single: failed to set clock rate: -22

Fixes: 16fb89f92ec4 ("clk: qcom: Add support for Display Clock Controller on SM8450")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
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


