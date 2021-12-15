Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC64474F99
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 01:54:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238674AbhLOAyv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 19:54:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235240AbhLOAyv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 19:54:51 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF75C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 16:54:50 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bi37so40093411lfb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 16:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SKTQi2EJrKx0JbO96uoXGThEUfmCNmO0OSGslUkg3+8=;
        b=K5FGKst7dMMN9k3UnVPyFWAjwF+MGr7RrxFOqBUeyuQUvyQ20/vcsp6s8HtfsD1fPn
         R7BYzukh4qzVylXoglKBQzBBYG6FT9Vk0FAA6Cim+UBQygBK0ewabEH7LmrAC6XGKD3D
         qMJi1kyPP11OBsg8rHtxbl2ucwgPenLtLiTtMz/VIaIpV5TmpWt/cYJ66t6Sf/iufRnj
         D2MBQzj2/MgAgJ2a7DfZP/E6W4x14A/JPwEv2fV/BTPyvMOJmbFaTy05HPaqCRMgu1Gw
         JyR613gPi6VDATsMFao7XMh7qm7AXJCAyPeTKhtbhHB+Xdp+SVnYCR/d5WWj+BW1o3Mi
         xzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SKTQi2EJrKx0JbO96uoXGThEUfmCNmO0OSGslUkg3+8=;
        b=e99U+dFcmv2KSbOwBbDChwPQvGwn5zClXlpo7MaLvXxOWGCc+7ggs/HjloAetIHTVb
         34Vf+d5lhffcOXvoVm5E8B8UfTQIvNrtY3M7Kntv8ZZwAVRUYjKmAGhgvnb+HB1To7Jn
         G/n7K6ZW1c23ZO59lOfSQQzvVjCPMu6iKpE6zfIsPcJwmJnhvtZT9BnGPOOnUzdplRdk
         EiobJVw2FHBzv/kOA4ON70Xf/umYCPiYyWKFv4E9iQkaHPsABxEHFfro7EpBFpsG+RkG
         7sXnaB/0XEVe1rRx2Xaa9LAL42x87foZL6C+2OxuKaE1Z3KLaPtMqWFFvQs+tmwrsj3q
         sdew==
X-Gm-Message-State: AOAM533GEeBmXpWcgiNBaZAk7MFFHF+2N2O/t1BLor9LBIrYxdimdBaW
        +c/3EAmqUOizUipfVKnlsJ0JOg==
X-Google-Smtp-Source: ABdhPJwKnBx7GnKjM0XHrWQqG4sNKQCHPc53Zycg8vjofIYcVAqKBGlDwFV6JA99UBuFas3ex1KP2w==
X-Received: by 2002:a05:6512:114a:: with SMTP id m10mr7550783lfg.54.1639529688931;
        Tue, 14 Dec 2021 16:54:48 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id b12sm53022lfb.146.2021.12.14.16.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 16:54:48 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 03/15] clk: qcom: gpucc-sdm660: use parent_hws instead of parent_data
Date:   Wed, 15 Dec 2021 03:54:11 +0300
Message-Id: <20211215005423.2114261-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
References: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If all parents are specified as clk_hw, we can use parent_hws instead of
parent_data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/qcom/gpucc-sdm660.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sdm660.c b/drivers/clk/qcom/gpucc-sdm660.c
index 71a1ee05e822..dfb3902186e1 100644
--- a/drivers/clk/qcom/gpucc-sdm660.c
+++ b/drivers/clk/qcom/gpucc-sdm660.c
@@ -65,8 +65,8 @@ static struct clk_alpha_pll gpu_pll0_pll_out_main = {
 	.num_vco = ARRAY_SIZE(gpu_vco),
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpu_pll0_pll_out_main",
-		.parent_data =  &(const struct clk_parent_data){
-			.hw = &gpucc_cxo_clk.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]){
+			&gpucc_cxo_clk.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_ops,
@@ -80,8 +80,8 @@ static struct clk_alpha_pll gpu_pll1_pll_out_main = {
 	.num_vco = ARRAY_SIZE(gpu_vco),
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpu_pll1_pll_out_main",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &gpucc_cxo_clk.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]){
+			&gpucc_cxo_clk.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_ops,
@@ -134,8 +134,8 @@ static struct clk_branch gpucc_gfx3d_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpucc_gfx3d_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gfx3d_clk_src.rcg.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gfx3d_clk_src.rcg.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
-- 
2.33.0

