Return-Path: <linux-arm-msm+bounces-18376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B722A8AFDF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 03:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7317B24C05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 01:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B53D81401F;
	Wed, 24 Apr 2024 01:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s2HpVrkR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37116FDC
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 01:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713922776; cv=none; b=tR023LoIaIyl5h5QH+TF/THMlAsA2GUD3lS4y9uZfLyg2BjlRXoL0Z6MKXxuhYMRwQfDEStKMaKydEobX7N8muNRdP60nNJKmxeqQh+/kgAU3L6JOAi6XxN6UVMJU9H8S+gIU4bNdHgySK73SJwWexlf61/oKTgO5Lx2w8S0/8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713922776; c=relaxed/simple;
	bh=+wcSE0jQUAsuubsPo5heuUnwmIQFYUlds9F5s8pvyXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PSUNVO9VMKo8U2lOuk2LWpCRpMDPeP0DA2rqzC/n2752D+OapHgpqduW0JnbKzAO27F6AnvEFbnzllFHvNJAA+lNAtLJ4qqxH/AHF3+ydHVddtdzrF9Xlm9U9gDcaFS4a/FQrpcAoOW+cpGgwK82tjw9Yn7qowIRK6mz6nACE7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s2HpVrkR; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-516d2600569so8019777e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 18:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713922773; x=1714527573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eRE2xz+4SCVpjxieYxKZULbd5N+a3QgwBKnW385TBno=;
        b=s2HpVrkR3rh4lGn/Y7xWbBV76P9taQcLwqyICQM4B6vwPSeVYF2y8VhSHfV4rDAlTj
         7CU/sVTZDVjU2QmoL//D1k8lakNYFijsZCWjHaTSO0SmOn6zQuonZgMmZ5XdQLqr8/rr
         lxZS4rUN/lUlV4qjt1HSkgG5XB2cQs8Yc1nOjFM65khsChPIzbgC6cNjRTZgWtVNw9YC
         VVVOaypBDzvOIybFQHadI+O2zVxPr5n2WDTH3odtZ7mpO2Ijgv5qRBfd7AWtlsEMxpj9
         bTOUbeNC2C2fs/EYEUUjavWhXKzUAB+cp4+RHX5eu0mmkXTyaikQaHJErFflFHkMsvrS
         xKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713922773; x=1714527573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eRE2xz+4SCVpjxieYxKZULbd5N+a3QgwBKnW385TBno=;
        b=XT0R+Gn9rejUpe9+6tLmOKn7bGG43g6Cf3q7fwrROvIOOSdicwSmYKQmxTkjZA0eNr
         bX6iUEl539Tb7FvGju7aEkHECfRRtopNVsM2iafqaSI24Gu8trLw3kL9/hi8VC4MlOzA
         UHiygW/J68DAjn/1SMPt5QELPHO3Zda2fxiILGu/CCzUcxUsI4JCbKUTRZ3pXGYJVYoF
         gbHgjklPtrxoXhttIZtAnVviA9PAuSB9tQkMoMUwbhrsKOJmtd+NY8/h7ucWA7kRPgyf
         B4CwWklWB63fpgujYmuE0qbSEAIv5AtoZipQ/uBEt09/SNzQKqn7ckeG2sEY83hk3Gtv
         hARQ==
X-Gm-Message-State: AOJu0Yz0gpEtzlS/S3h0AI/4iU4ej6Utn3sPXX9m4mD1gFALTbiqx5p5
	5KgYO6zJTHz2dh0WC1TDE2azE7Ekru0J5s6oS6qRLKFSWD/hQ0Z3lhtiufH68rk=
X-Google-Smtp-Source: AGHT+IGRzIXPdB9QF4OcOMf2yjGCh2HxaDOEJZ98eApb/jKsXg56E91CsY8Sx1A75w1ipLAosxB77g==
X-Received: by 2002:ac2:4291:0:b0:51b:c6b:f87d with SMTP id m17-20020ac24291000000b0051b0c6bf87dmr619750lfh.35.1713922772952;
        Tue, 23 Apr 2024 18:39:32 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g12-20020a19ac0c000000b0051bb40c7ee7sm308220lfc.185.2024.04.23.18.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 18:39:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Apr 2024 04:39:31 +0300
Subject: [PATCH v2 3/4] clk: qcom: dispcc-sm8550: fix DisplayPort clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-dispcc-dp-clocks-v2-3-b44038f3fa96@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3479;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+wcSE0jQUAsuubsPo5heuUnwmIQFYUlds9F5s8pvyXk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmKGLRAV1KakRYNoWd1kjF4UdOERvn9SJVGwnvq
 +D2bkvZkBaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZihi0QAKCRCLPIo+Aiko
 1eDqB/9GiAaLEiNaC0CA0LKXCOKa0vb1gQFjUGjV0J7jQic7zzkC9qm2Kf14APNhbxr78ncwJTm
 /PLVVLaBoXvillojCGnbGovLWdAu39k2HAl4sreiOucjHLbSkd01eZXRcN6+QH72INXBSH6k0gT
 IFOiPYj1a38mNooF32jqZP6BzlEiM1HEufZGY+s+ZcMgRc2fFPWnpKqBFf9VzQegcHlktH1YR8Z
 +s5FpX3XoE5UyvHaZ6ebA0o5FJrXnWGtE0Zo/A1BPEKky67YpnRUL+z8GXx5ypiB5jJQMADMMqF
 PYfmDxvz1RX3xRnLvQ1G7K29TWuMftKQR1In5Mk3l543D6/d
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On SM8550 DisplayPort link clocks use frequency tables inherited from
the vendor kernel, it is not applicable in the upstream kernel. Drop
frequency tables and use clk_byte2_ops for those clocks.

This fixes frequency selection in the OPP core (which otherwise attempts
to use invalid 810 KHz as DP link rate), also fixing the following
message:
msm-dp-display ae90000.displayport-controller: _opp_config_clk_single: failed to set clock rate: -22

Fixes: 90114ca11476 ("clk: qcom: add SM8550 DISPCC driver")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8550.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
index 3672c73ac11c..38ecea805503 100644
--- a/drivers/clk/qcom/dispcc-sm8550.c
+++ b/drivers/clk/qcom/dispcc-sm8550.c
@@ -345,26 +345,17 @@ static struct clk_rcg2 disp_cc_mdss_dptx0_aux_clk_src = {
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
 	.cmd_rcgr = 0x8170,
 	.mnd_width = 0,
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_7,
-	.freq_tbl = ftbl_disp_cc_mdss_dptx0_link_clk_src,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx0_link_clk_src",
 		.parent_data = disp_cc_parent_data_7,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_7),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_byte2_ops,
 	},
 };
 
@@ -418,13 +409,12 @@ static struct clk_rcg2 disp_cc_mdss_dptx1_link_clk_src = {
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
 
@@ -478,13 +468,12 @@ static struct clk_rcg2 disp_cc_mdss_dptx2_link_clk_src = {
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
 
@@ -538,13 +527,12 @@ static struct clk_rcg2 disp_cc_mdss_dptx3_link_clk_src = {
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


