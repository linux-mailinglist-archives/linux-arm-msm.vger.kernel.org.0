Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3EA4FE8CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 21:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358901AbiDLTlP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 15:41:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350952AbiDLTlE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 15:41:04 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EF68326E8
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 12:38:45 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id m8so7910299ljc.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 12:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3m7sD5DReLGuXAEizIRitWnlXHp9Kn3L0qq2hxmokpc=;
        b=yyW+dOnPrRJyXxXjq0M/Pf0vDwHy1Hp3MjxkLBE3/zl+eZQDNhpNvK5B/o0zFUifq0
         uHfnWzeBLZ2IrveN8Dpnm2Vg9+ppSfVUav65BoQvzKfipdEEkqIyiwGEWPuVHwkCjTP+
         8C8B7ZF5PUnDWFSkNsX0yIM6Pzi9tJX2Y0Fa0lDHILYHwUaVxSE+YwchGrQjoggIhIgE
         UR1J9shENZT2jhWqeeEAYi2/ZSvroaTMs/yJBUAmsXE2CZd3Me+kDmYL+mQPl1pNv1v4
         Pi9MAc0i1LTj95Y4zGwrLlrjPQ2MOV9HRqyGi74XrU429HxKB3vbF6+ea3p2QLYD3ecj
         Q5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3m7sD5DReLGuXAEizIRitWnlXHp9Kn3L0qq2hxmokpc=;
        b=bFGGj/txRvDHtcA/nWD9bkiV2iZhiLtuK4zXJneS/HKB+q7yngtEKtc+RIo49uNqWT
         W56kQz+4Kgy9QfheyBSEvl7MdWme/fDSti6qitpnsswYTOCUlFwHQ1v/Mn+ENYtaRvgU
         8sBf3SsBNwEtysXFfFmbNxAuXfPMgB6OiNe1JqksIkLTSQBPHOP2EI525IaI+K9WD5OJ
         tGh+T0CDiL4gcswYedIzI3pGTccYFzHHQYZOillmoaQni0em9cUUw2ROSSbuXPr2ZVtK
         MLIHvynx5Hb0DQl2mzU/LCwfmpTKdtgh0u7/MAmUVf4jKrnXKThmpERCbuo/HK1RHZcS
         TMJg==
X-Gm-Message-State: AOAM533oqTqef/Y4ThBWGeuhVmRIWBhL4bOThLwATQ+iNL7oOD/ibUEq
        tWAE4DZd/JVT9B75ssOyjeglMgpG7ysTPg==
X-Google-Smtp-Source: ABdhPJxk41WXmv7SEUBUYZPOMe0q5NwIRxJxzIsCkRozc97NDnkVkiPeCo75AI7qkodLAclNiGyDbQ==
X-Received: by 2002:a2e:a783:0:b0:24b:6927:7460 with SMTP id c3-20020a2ea783000000b0024b69277460mr5167989ljf.104.1649792323315;
        Tue, 12 Apr 2022 12:38:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m4-20020a0565120a8400b00450abeb42b3sm2731641lfu.235.2022.04.12.12.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 12:38:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Prasad Malisetty <quic_pmaliset@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: [PATCH v2 2/5] clk: qcom: gcc-sm8450: use new clk_regmap_mux_safe_ops for PCIe pipe clocks
Date:   Tue, 12 Apr 2022 22:38:36 +0300
Message-Id: <20220412193839.2545814-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412193839.2545814-1-dmitry.baryshkov@linaro.org>
References: <20220412193839.2545814-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use newly defined clk_regmap_mux_safe_ops for PCIe pipe clocks to let
the clock framework automatically park the clock when the clock is
switched off and restore the parent when the clock is switched on.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sm8450.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index 593a195467ff..fb6decd3df49 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -243,13 +243,14 @@ static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src = {
 	.reg = 0x7b060,
 	.shift = 0,
 	.width = 2,
+	.safe_src_parent = P_BI_TCXO,
 	.parent_map = gcc_parent_map_4,
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_pipe_clk_src",
 			.parent_data = gcc_parent_data_4,
 			.num_parents = ARRAY_SIZE(gcc_parent_data_4),
-			.ops = &clk_regmap_mux_closest_ops,
+			.ops = &clk_regmap_mux_safe_ops,
 		},
 	},
 };
@@ -273,13 +274,14 @@ static struct clk_regmap_mux gcc_pcie_1_pipe_clk_src = {
 	.reg = 0x9d064,
 	.shift = 0,
 	.width = 2,
+	.safe_src_parent = P_BI_TCXO,
 	.parent_map = gcc_parent_map_6,
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_pipe_clk_src",
 			.parent_data = gcc_parent_data_6,
 			.num_parents = ARRAY_SIZE(gcc_parent_data_6),
-			.ops = &clk_regmap_mux_closest_ops,
+			.ops = &clk_regmap_mux_safe_ops,
 		},
 	},
 };
-- 
2.35.1

