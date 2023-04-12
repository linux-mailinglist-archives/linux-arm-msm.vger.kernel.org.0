Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCE356DF7A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Apr 2023 15:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbjDLNsf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Apr 2023 09:48:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231134AbjDLNsd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Apr 2023 09:48:33 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BEFA10CA
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 06:48:32 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id a23so15316195lfk.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 06:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681307310; x=1683899310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jNb3jf5do6Pf7/ddJtHqf5nErsfSQQLAXRfF2LVEfMU=;
        b=Bk82oYg9WhaRQ2eOeibpHMzLxPlEF07a809UIg434bDvvp2LHNNcCjnBXD3gthuyCm
         eC+1wlNxbfTMwGMU0GppjB187Cs0aPWNkWEVWF2Nr7viGqgVHqc34OkIchOQxfN6GLqa
         /dy0sd+nx8EX5CK7ySieHqBpIHDeIZsfKxDIF7w713KmoEk13KNhTd1fXUre1IqeKp0m
         viZBQQzKAXoxyNpp7ZYHcqznuNcOxbl8pefHqBKwfP0IF/X0Tp1XxgGiZsZz4lSd8vlp
         qWaTeqjTRj2e8qNo7nXiiNfk/xMSOSBdENfAIEd7/M5y/d4wq03pqwEYY45e+OcBhy1a
         ZRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681307310; x=1683899310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jNb3jf5do6Pf7/ddJtHqf5nErsfSQQLAXRfF2LVEfMU=;
        b=0cddgazNq9H4e8NUimCv/4moP8F5mZ/7zH/MWasoQ4Vu88KD16y8dchjW45/34hJEf
         kOvJ20YB8nZTrkZOgs19p+6zIur/PdEy+B1sg6yS7GG522m8ag95Diabx0eFAzbTjA7v
         2QxqWZzD2rBH8ezO6RrFZiYG+8+waYXq1B7X5b71tfr/VD5tef6wmx0n1LN5wcrj07WU
         oLH7rLauB5Sp/WOL4N8xZ4g6kRrfOR0YcKFhPTzftQRMTNhFZOl9SQpKCgxZnXcRvMHC
         4Sj82wwo0LOik4Zvx1vle0dkbrYveXN5wt/DGQVJhH6AcFXDJOJvQHZHtgBri3FxH4IU
         uk1g==
X-Gm-Message-State: AAQBX9d3MVodRpR2PteZoTuTdRQZUWxQzPNl6jaGpelO12eD4kibKM4C
        aBx2hLQM2630HXgTDVy7tSjGrw==
X-Google-Smtp-Source: AKy350Z22vjrT34MpRi/BpIiXZ7TRt4U48aULgVikXbth1LsmOTouq/OLzD+uIYq9N/a6du3imzkCw==
X-Received: by 2002:ac2:5390:0:b0:4cd:afbf:c206 with SMTP id g16-20020ac25390000000b004cdafbfc206mr5435813lfh.22.1681307310301;
        Wed, 12 Apr 2023 06:48:30 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id z18-20020ac25df2000000b004e8497a5604sm3010490lfq.108.2023.04.12.06.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 06:48:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-sm8350: fix PCIe PIPE clocks handling
Date:   Wed, 12 Apr 2023 16:48:29 +0300
Message-Id: <20230412134829.3686467-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On SM8350 platform the PCIe PIPE clocks require additional handling to
function correclty. They are to be switched to the tcxo source before
turning PCIe GDSCs off and should be switched to PHY PIPE source once
they are working. Swithc PCIe PHY clocks to use clk_regmap_phy_mux_ops,
which provide support for this dance.

Fixes: 44c20c9ed37f ("clk: qcom: gcc: Add clock driver for SM8350")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sm8350.c | 47 ++++++++++-------------------------
 1 file changed, 13 insertions(+), 34 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8350.c b/drivers/clk/qcom/gcc-sm8350.c
index af4a1ea28421..1385a98eb3bb 100644
--- a/drivers/clk/qcom/gcc-sm8350.c
+++ b/drivers/clk/qcom/gcc-sm8350.c
@@ -17,6 +17,7 @@
 #include "clk-regmap.h"
 #include "clk-regmap-divider.h"
 #include "clk-regmap-mux.h"
+#include "clk-regmap-phy-mux.h"
 #include "gdsc.h"
 #include "reset.h"
 
@@ -158,26 +159,6 @@ static const struct clk_parent_data gcc_parent_data_3[] = {
 	{ .fw_name = "bi_tcxo" },
 };
 
-static const struct parent_map gcc_parent_map_4[] = {
-	{ P_PCIE_0_PIPE_CLK, 0 },
-	{ P_BI_TCXO, 2 },
-};
-
-static const struct clk_parent_data gcc_parent_data_4[] = {
-	{ .fw_name = "pcie_0_pipe_clk", },
-	{ .fw_name = "bi_tcxo" },
-};
-
-static const struct parent_map gcc_parent_map_5[] = {
-	{ P_PCIE_1_PIPE_CLK, 0 },
-	{ P_BI_TCXO, 2 },
-};
-
-static const struct clk_parent_data gcc_parent_data_5[] = {
-	{ .fw_name = "pcie_1_pipe_clk" },
-	{ .fw_name = "bi_tcxo" },
-};
-
 static const struct parent_map gcc_parent_map_6[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_GCC_GPLL0_OUT_MAIN, 1 },
@@ -274,32 +255,30 @@ static const struct clk_parent_data gcc_parent_data_14[] = {
 	{ .fw_name = "bi_tcxo" },
 };
 
-static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src = {
+static struct clk_regmap_phy_mux gcc_pcie_0_pipe_clk_src = {
 	.reg = 0x6b054,
-	.shift = 0,
-	.width = 2,
-	.parent_map = gcc_parent_map_4,
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
+			.ops = &clk_regmap_phy_mux_ops,
 		},
 	},
 };
 
-static struct clk_regmap_mux gcc_pcie_1_pipe_clk_src = {
+static struct clk_regmap_phy_mux gcc_pcie_1_pipe_clk_src = {
 	.reg = 0x8d054,
-	.shift = 0,
-	.width = 2,
-	.parent_map = gcc_parent_map_5,
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_pipe_clk_src",
-			.parent_data = gcc_parent_data_5,
-			.num_parents = ARRAY_SIZE(gcc_parent_data_5),
-			.ops = &clk_regmap_mux_closest_ops,
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "pcie_1_pipe_clk",
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
 		},
 	},
 };
-- 
2.39.2

