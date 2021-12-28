Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D19F48060B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Dec 2021 05:54:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231518AbhL1EyX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Dec 2021 23:54:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231750AbhL1EyW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Dec 2021 23:54:22 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 139B3C061401
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Dec 2021 20:54:22 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id i31so38857477lfv.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Dec 2021 20:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K8lm9Q0GRWnWMijAzcODdIs5YJUTjRP+kYj8CVw2ljI=;
        b=kBqrprRLsC8BN1l/e5x0OnuaFDslTfvy9BV6nQ3QUdDHL8riptBCIMhzmyH2q4wH2f
         /UloJUB6vrIUdNPHLTr/fHFcmZOa3fwPQ5hUpeb35NpL5ncPJtrVtV+wrfHdSwi6/Bep
         uqcBP1+oRCdwCSOnIQRUs+vax1Niz75ZLjughQZJAFnpoYtjEWi+nBkdubATiYuhH/xJ
         oJ/feztEzIBSSaZHkiBTHtC0MJyKFZRTCdXwL3gqXiBi7W0QOXe9+qZsKjQELA+e/NDV
         KkecPXxd07amXYc6uZEdeOvaHNls3uLCXSji6cyE5DkvrvAQh1MeTNDGF4ld1zQQXZAv
         YS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K8lm9Q0GRWnWMijAzcODdIs5YJUTjRP+kYj8CVw2ljI=;
        b=SVDr8vW9ySAs5NS1Xkx/20tUoisQXK1CHftA23ehjLG37D+wVGclWJS+o2SOvONcI5
         FKtN5RsB6/Hva+Ejky4mZXJAjWgpn9LicOPxQH/bpvKdPx6eA19DpvwX5WmcXS1W4Csp
         hBmky8iOVrWC/wFRnYjq3rtL86BLtYOBDbDn32jyCFD77jOLT/Lfl0zZ5H1XOZvWqIzC
         XMF0jJprll4Kg+NyzHE66TgHEzsFwhD3WO4eZ33gpoAnwECgIXHylbinscucuWrk719L
         uqPEogkOVIojI387Xi49jeam+vL/0jZwaHvGkphsLHkeJnEd7oMjPxfSehe6N4uvp0i1
         h6KQ==
X-Gm-Message-State: AOAM531q7OThm11oZ6vnBfW7eH2PWMwAXxDcDnrhhj6USyDA4Di++GUv
        XdCQa0JfxeWzzfIxLXEzOtLv+A==
X-Google-Smtp-Source: ABdhPJwT+zXbI3nHzphaMtQ7R3wwdstqNL5dLTtx+H4ZOXDTJ0PX6wt7vpIZad9hN8O58ny3+iMZ1A==
X-Received: by 2002:a05:6512:3c93:: with SMTP id h19mr18310109lfv.350.1640667260349;
        Mon, 27 Dec 2021 20:54:20 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id cf3sm1822685lfb.22.2021.12.27.20.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 20:54:19 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v4 03/16] clk: qcom: gpucc-sdm660: use parent_hws instead of parent_data
Date:   Tue, 28 Dec 2021 07:54:02 +0300
Message-Id: <20211228045415.20543-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
References: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
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
2.34.1

