Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 133D44761DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 20:37:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232180AbhLOThS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 14:37:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbhLOThR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 14:37:17 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CEC1C06173E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:37:17 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id l22so45122821lfg.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c4Ky7tHx2zIHVWiNDmhkHmIR+stkmxS3ohKXFXnHWt8=;
        b=Kemse6JKetxeNBfyOabDGVg3pRrsrNXW8YkZY8wry7tep2/JoutR5298bN4Qpd7AGe
         G7drIRLwdjQ3wf5/H4IXhqE4YxmNfLn26zfMBoibKME22eYFbZ+qZFOqQk/gFFh86BAP
         Ub9vW78uxVAL+90d8fdL6e4OeX4DHt5Ja9AXRWMVQGW2WjQM2pdzi7rpF6P6c1NuCOFq
         LMlMkyu8gI2Pv7VbLqnqwNhx/vPLsMolpwIRylV6lF85rZCV2n2ZkyOtozZh3hOrCFAn
         sWNBpIJiTlPDrpMUUfprEzGWKiuc2EsD2IUP/1h/CcObxJR8k1oHtrx0J6F4ubpHJBdR
         +vJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c4Ky7tHx2zIHVWiNDmhkHmIR+stkmxS3ohKXFXnHWt8=;
        b=sM3YOSaEjh/zuonmNtpbyhGbKqFJRX14fC3GMZRSpWk2YZRrOHq8Mvx77j96EVhGhR
         JedUQ85VB0hiVKCDhSg5OeXGn0O+3Yl6yz83VgOTk6o1/TTwv9+ci0Egb1VOBkAtSOae
         Uo9a6nGOXPJIlcwIatwgFbWTUzG47Tb73rjOgd8GxXVynT4YWQ5ccEcUbUlCRPyxulxe
         ZinjxnTQWj4t1kBIKSSxpNQ3zVEwt9TGyvvbm+efKMkHqSKWb6z5XfFJNjMAkwrSaJXk
         If/P/yraDJakfjWPEWKskcKV5leSVDM5wZ2NLIrX+/G1y1YLd9rvc2Kvj/p+qCzYTMyJ
         yY/g==
X-Gm-Message-State: AOAM533dCCpg/1h3hmqybWo9hktnr/IJs1LA9pzPpfla04K2/jWRx2gB
        HIqK6z7goqCJsFWrs3cT8CGB0w==
X-Google-Smtp-Source: ABdhPJwASj4t7OEkclCzaLczWemPIrOTmFADo2o7Y7oSOt0ANeAcWKbMeyT4JR2MAO40AbhF/LU04A==
X-Received: by 2002:a05:6512:16a1:: with SMTP id bu33mr11533738lfb.129.1639597035718;
        Wed, 15 Dec 2021 11:37:15 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id a7sm460592lfi.149.2021.12.15.11.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 11:37:15 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v3 03/16] clk: qcom: gpucc-sdm660: use parent_hws instead of parent_data
Date:   Wed, 15 Dec 2021 22:36:51 +0300
Message-Id: <20211215193704.2821775-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org>
References: <20211215193704.2821775-1-dmitry.baryshkov@linaro.org>
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
index 8271696d21b4..d6b38a0b063d 100644
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

