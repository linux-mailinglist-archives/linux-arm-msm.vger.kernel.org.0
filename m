Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8A45253A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 May 2022 19:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357052AbiELR3U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 13:29:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356880AbiELR3P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 13:29:15 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AC3126ADBA
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 10:29:14 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id h29so10351917lfj.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 10:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2jCKstw6O6JN6tdNTv46Z8Av6Mr/NZOEPPL/FaKDcl0=;
        b=RhgcadIdRxrXtqjplYDZWRp1cfNyFxfMz61GkwnLWeUfjQpxp/wxAfZkar+r4sXOwx
         AhSdsCFXW2zuCsnidjbGcqH+U49Y1Aw630ecwzS6OR9wNxI8W1WsYb/ru7U+SdfRZvqA
         Z3/d9zh2benF5UROzodgsZg2pMC6RrNl7E1PI6X5Ognq/L9g3fAThTJb5DQQq0acMW3e
         GgvnvImzVLoX6SWpdabxZMGsW52yGEjOtz4sFaqUm6RMKcbmA9FEcsAr5I9j00PYN0Go
         aaFB/bceHCllP+/VtRyVsLdD/j/caq61sl4dzRFKOa8fEjC/+V3gVM7sY5sJB0YnViIA
         0sXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2jCKstw6O6JN6tdNTv46Z8Av6Mr/NZOEPPL/FaKDcl0=;
        b=ulBUtsiacOpOGDBJiosRZTS4x5nfft2tIlyijc1o72099HeTPQQPnl3oaw0XGdolF4
         UoYA0q5binyh/nt33FZbpVVUbPh67fj940EE+NikrOu5oIzr/o05hnpfdHxiztVVHKCL
         NyfvWkpiQQ0cuNZGzSV1mgFVtdNfx1WQabkFugSMPtE/jVmcnblM4yB2eEPUe5WgO65C
         SqWLkQwww57/xJavTmXbHntvPpTJxb8ocFXTh1zJr/9EgjUbWOE/htWnJZGkzWGSpwz3
         EuT775shAlGPl2CIfg4UTR7yz16R1gmufjR4F6uf77dHRqbUP15skaMsgmHfyH03gQXz
         80QA==
X-Gm-Message-State: AOAM530kqpY5lnC+nW/3nR7ybccoBZ4aO/LMN04ArxW5+Cc9f/Y3M7LJ
        mY4p4TcX+7RoHqoZuiXbm1nk5g==
X-Google-Smtp-Source: ABdhPJwf7Q7o9r4yCqsX7FhUN5hQnL3JIV+AtJWBfTV73i2BOPry3207jkRaTHaxRusGwSmycfM3og==
X-Received: by 2002:a05:6512:1516:b0:448:39b8:d603 with SMTP id bq22-20020a056512151600b0044839b8d603mr559402lfb.599.1652376552713;
        Thu, 12 May 2022 10:29:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y10-20020a2e95ca000000b0024f3d1dae9asm11520ljh.34.2022.05.12.10.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 10:29:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Prasad Malisetty <pmaliset@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v5 3/5] clk: qcom: gcc-sm8450: use new clk_regmap_pipe_src_ops for PCIe pipe clocks
Date:   Thu, 12 May 2022 20:29:07 +0300
Message-Id: <20220512172909.2436302-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512172909.2436302-1-dmitry.baryshkov@linaro.org>
References: <20220512172909.2436302-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use newly defined clk_regmap_pipe_src_ops for PCIe pipe clocks to let
the clock framework automatically park the clock when the clock is
switched off and restore the parent when the clock is switched on.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sm8450.c | 51 +++++++++++++----------------------
 1 file changed, 19 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index 593a195467ff..bbe4cc1957da 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -17,6 +17,7 @@
 #include "clk-regmap.h"
 #include "clk-regmap-divider.h"
 #include "clk-regmap-mux.h"
+#include "clk-regmap-pipe-src.h"
 #include "gdsc.h"
 #include "reset.h"
 
@@ -26,9 +27,7 @@ enum {
 	P_GCC_GPLL0_OUT_MAIN,
 	P_GCC_GPLL4_OUT_MAIN,
 	P_GCC_GPLL9_OUT_MAIN,
-	P_PCIE_0_PIPE_CLK,
 	P_PCIE_1_PHY_AUX_CLK,
-	P_PCIE_1_PIPE_CLK,
 	P_SLEEP_CLK,
 	P_UFS_PHY_RX_SYMBOL_0_CLK,
 	P_UFS_PHY_RX_SYMBOL_1_CLK,
@@ -153,16 +152,6 @@ static const struct clk_parent_data gcc_parent_data_3[] = {
 	{ .fw_name = "bi_tcxo" },
 };
 
-static const struct parent_map gcc_parent_map_4[] = {
-	{ P_PCIE_0_PIPE_CLK, 0 },
-	{ P_BI_TCXO, 2 },
-};
-
-static const struct clk_parent_data gcc_parent_data_4[] = {
-	{ .fw_name = "pcie_0_pipe_clk", },
-	{ .fw_name = "bi_tcxo", },
-};
-
 static const struct parent_map gcc_parent_map_5[] = {
 	{ P_PCIE_1_PHY_AUX_CLK, 0 },
 	{ P_BI_TCXO, 2 },
@@ -173,16 +162,6 @@ static const struct clk_parent_data gcc_parent_data_5[] = {
 	{ .fw_name = "bi_tcxo" },
 };
 
-static const struct parent_map gcc_parent_map_6[] = {
-	{ P_PCIE_1_PIPE_CLK, 0 },
-	{ P_BI_TCXO, 2 },
-};
-
-static const struct clk_parent_data gcc_parent_data_6[] = {
-	{ .fw_name = "pcie_1_pipe_clk" },
-	{ .fw_name = "bi_tcxo" },
-};
-
 static const struct parent_map gcc_parent_map_7[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_GCC_GPLL0_OUT_MAIN, 1 },
@@ -239,17 +218,21 @@ static const struct clk_parent_data gcc_parent_data_11[] = {
 	{ .fw_name = "bi_tcxo" },
 };
 
-static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src = {
+static struct clk_regmap_pipe_src gcc_pcie_0_pipe_clk_src = {
 	.reg = 0x7b060,
 	.shift = 0,
 	.width = 2,
-	.parent_map = gcc_parent_map_4,
+	.working_val = 0, /* pipe_clk */
+	.park_val = 2, /* bi_tcxo */
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_pipe_clk_src",
-			.parent_data = gcc_parent_data_4,
-			.num_parents = ARRAY_SIZE(gcc_parent_data_4),
-			.ops = &clk_regmap_mux_closest_ops,
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "pcie_0_pipe_clk",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_regmap_pipe_src_ops,
 		},
 	},
 };
@@ -269,17 +252,21 @@ static struct clk_regmap_mux gcc_pcie_1_phy_aux_clk_src = {
 	},
 };
 
-static struct clk_regmap_mux gcc_pcie_1_pipe_clk_src = {
+static struct clk_regmap_pipe_src gcc_pcie_1_pipe_clk_src = {
 	.reg = 0x9d064,
 	.shift = 0,
 	.width = 2,
-	.parent_map = gcc_parent_map_6,
+	.working_val = 0, /* pipe_clk */
+	.park_val = 2, /* bi_tcxo */
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_pipe_clk_src",
-			.parent_data = gcc_parent_data_6,
-			.num_parents = ARRAY_SIZE(gcc_parent_data_6),
-			.ops = &clk_regmap_mux_closest_ops,
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "pcie_1_pipe_clk",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_regmap_pipe_src_ops,
 		},
 	},
 };
-- 
2.35.1

