Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2F4B3548EE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 00:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242900AbhDEWsQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 18:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242895AbhDEWsO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 18:48:14 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45A70C0617A9
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Apr 2021 15:48:07 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id v140so1868724lfa.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Apr 2021 15:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IUJBIwp09aLJcStVkX+1ZO2G/Tm5lRF7iyPr7fFCB+E=;
        b=LgzZZbEUULJs6QCWvJEOPU+nMnDGYsMhf0vZFgatImqg9YMKnMnpQZcV7Da/5oM2gH
         bAKWforFXUBvrla7fR9by5P3ZYoubJLWtDKslmJ8e3DYXefRmgy3T9jXKdpRki+bYhmY
         i+sJrRIBEF6pJBK8RR3ze58sSUb4YdxFT8rVcJWNUWs3LZHvmRdOT79bJSoSjTvFm/Fk
         9qIhZlIgv5H8e3dOIep4TUEUJQHllUFrkJ9GzgMX0+2p7xr+Kg7amZ4xwMUgJv9BpOt0
         xqzt2Byoo8P5fqdI54DPvA17eSfJxcCC73hyqqdv6pwZdozckKoplh/Q5ycoZ+ipywm9
         3pNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IUJBIwp09aLJcStVkX+1ZO2G/Tm5lRF7iyPr7fFCB+E=;
        b=TKPKOxxW+4IRlVY2Vh2kuDlDrVJdCCmX/wlM5LYGuqxmLJMxsnzDI2hBxVeqxo9OxR
         lg95mQ959OvGaKO0WvXtzOu/tURLnx+Xz0SW3Vur2FOS7kN1oP2XJnhh/sdYucoB2F7I
         fhnK+WEUpsXhOCK7bqMXHFKxCNnOMtOm3TAwbgO8UsX2lMQrXnSB4hKNF6lFY2Pogyqd
         bwgc5xeY7Wcbt5uWP77UTlEnmrV6GnsmQvMXoQ/8JkUXhNWjbPwNHo1J57uKLPWsKro/
         yYEHeD2nr8fsP+WruAQV9iDs6SPedQa2PZHi2krIx4Oo/LAmJOzbgZLQqFxTeVMdjXar
         fwOg==
X-Gm-Message-State: AOAM533WJdrFH7eWVrPq/RYEGxGF/Ixpmub1/6qEsBIrNv/6WsoIPL4T
        AqJ1GQP3YHAF1/kWHC1y5D96sg==
X-Google-Smtp-Source: ABdhPJz6KFzyPYGHhRjWNLavcD82M6JyY77C64g4PGC1ttVkaIwkghPbjMcCmpULY8slRaQ278GdTw==
X-Received: by 2002:a05:6512:2356:: with SMTP id p22mr18542090lfu.347.1617662885826;
        Mon, 05 Apr 2021 15:48:05 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:48:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 29/33] clk: qcom: gcc-sc7180: use ARRAY_SIZE instead of specifying num_parents
Date:   Tue,  6 Apr 2021 01:47:39 +0300
Message-Id: <20210405224743.590029-30-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
adding/removing entries to/from parent_data easy and errorproof.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sc7180.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
index 4c2f3445e037..cbc520da67f3 100644
--- a/drivers/clk/qcom/gcc-sc7180.c
+++ b/drivers/clk/qcom/gcc-sc7180.c
@@ -285,7 +285,7 @@ static struct clk_rcg2 gcc_cpuss_ahb_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_cpuss_ahb_clk_src",
 		.parent_data = gcc_parent_data_0_ao,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0_ao),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 		},
@@ -309,7 +309,7 @@ static struct clk_rcg2 gcc_gp1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gp1_clk_src",
 		.parent_data = gcc_parent_data_4,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_4),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -323,7 +323,7 @@ static struct clk_rcg2 gcc_gp2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gp2_clk_src",
 		.parent_data = gcc_parent_data_4,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_4),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -337,7 +337,7 @@ static struct clk_rcg2 gcc_gp3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gp3_clk_src",
 		.parent_data = gcc_parent_data_4,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_4),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -357,7 +357,7 @@ static struct clk_rcg2 gcc_pdm2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pdm2_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -378,7 +378,7 @@ static struct clk_rcg2 gcc_qspi_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_qspi_core_clk_src",
 		.parent_data = gcc_parent_data_2,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -619,7 +619,7 @@ static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_sdcc1_apps_clk_src",
 		.parent_data = gcc_parent_data_1,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -641,7 +641,7 @@ static struct clk_rcg2 gcc_sdcc1_ice_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_sdcc1_ice_core_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
@@ -666,7 +666,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_sdcc2_apps_clk_src",
 		.parent_data = gcc_parent_data_5,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_5),
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
@@ -689,7 +689,7 @@ static struct clk_rcg2 gcc_ufs_phy_axi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_phy_axi_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -711,7 +711,7 @@ static struct clk_rcg2 gcc_ufs_phy_ice_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_phy_ice_core_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -731,7 +731,7 @@ static struct clk_rcg2 gcc_ufs_phy_phy_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_phy_phy_aux_clk_src",
 		.parent_data = gcc_parent_data_3,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -752,7 +752,7 @@ static struct clk_rcg2 gcc_ufs_phy_unipro_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_phy_unipro_core_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -774,7 +774,7 @@ static struct clk_rcg2 gcc_usb30_prim_master_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb30_prim_master_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -794,7 +794,7 @@ static struct clk_rcg2 gcc_usb30_prim_mock_utmi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb30_prim_mock_utmi_clk_src",
 		.parent_data = gcc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -813,7 +813,7 @@ static struct clk_rcg2 gcc_usb3_prim_phy_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb3_prim_phy_aux_clk_src",
 		.parent_data = gcc_parent_data_6,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_6),
 		.ops = &clk_rcg2_ops,
 	},
 };
-- 
2.30.2

