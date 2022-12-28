Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 075B565771B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 14:33:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232824AbiL1Nd2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 08:33:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232511AbiL1Nc4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 08:32:56 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBD78FCCB
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:32:54 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id f34so23610802lfv.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUOmX7coVXLJoaAd4oSQN0bx59ZXsCtdGj+wbjJ5yyI=;
        b=Njk0h5k1shNPE6P/6YF/7ZEF2zziqsdZNjfsC9vSPiilJwMSfG96vf3bXnqOw4vSZY
         gaAyNq3QM7krX4Ui/A58eeLOjPSxGB44biROqZLP2GaAKe/NQWTDyx8eJT84bpRu3OSy
         i82TvhKoOfM7xafQ4mWL/GMZHIJ9v1H46oowcfyWClD1g/gAtnh2GK9Y9bY+vbxmb6dJ
         r7rNNJMAmxdCfwThhEuOXX4EoyTT1OKLpItQuaNtFKspilhVwaHsg21n1tyzU18lKsdj
         jzLQ5PqCLpomYQvIywJoJP7VcSTGe+91OjYdvWMmw70rMtCLOv6a4N1fCVB9LyF2My5Q
         jBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vUOmX7coVXLJoaAd4oSQN0bx59ZXsCtdGj+wbjJ5yyI=;
        b=bnUmrP/Q45MSw2rkZO41ePKbhHdLaZ0y0SeVHNMgeT+YbpmHG/Toa5RoJ7kk750lTg
         r3O26Fc7jADYcpGybQtOXi13YI7QOKN+AF/3Bqnf/Vey6dkGeKOoVYKt7SFZSwwWem7D
         3myp0iBxckD9ZkbeWlPQi/pN/s6osKZvFqrE2dmHe0xevwtmY3sMsp9RC0YnwsZnxUmS
         I2dhxr55Ne7+mRfTpDkHp64MPBVrDYvMnfQsagIzOGwVgnvJpTabFbT53cCO2Mpcr4mg
         fux6FtcbJVFJKTenorjGLUih84PgA6o2rmWhhCtF8dRO5GPKm+xc97K3gTMKpwPikc0f
         av+Q==
X-Gm-Message-State: AFqh2koCGSm01GSllLhA7NXtoxS76v8gwKYQfxp3GEzsizjIpvO+7nqp
        Zd9F9hnPUeYt6sl8UsgqqjjJYw==
X-Google-Smtp-Source: AMrXdXs+4K+VxGoyFfPMd48O172qspxjIRcRpdnKPlrdpmqy2ENqp/0gGRI7I43LyeqKoR+Txom79g==
X-Received: by 2002:ac2:5982:0:b0:4b5:5b36:28b8 with SMTP id w2-20020ac25982000000b004b55b3628b8mr6752029lfn.1.1672234374373;
        Wed, 28 Dec 2022 05:32:54 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id d7-20020ac241c7000000b004a47e7b91c4sm2613876lfi.195.2022.12.28.05.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 05:32:53 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 11/16] clk: qcom: gcc-sdx55: use ARRAY_SIZE instead of specifying num_parents
Date:   Wed, 28 Dec 2022 15:32:38 +0200
Message-Id: <20221228133243.3052132-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
References: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
adding/removing entries to/from parent_data/names/hws easy and errorproof.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sdx55.c | 52 ++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdx55.c b/drivers/clk/qcom/gcc-sdx55.c
index 4fca19006a77..758b295e1bfa 100644
--- a/drivers/clk/qcom/gcc-sdx55.c
+++ b/drivers/clk/qcom/gcc-sdx55.c
@@ -232,7 +232,7 @@ static struct clk_rcg2 gcc_blsp1_qup1_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_blsp1_qup1_i2c_apps_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -258,7 +258,7 @@ static struct clk_rcg2 gcc_blsp1_qup1_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_blsp1_qup1_spi_apps_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -272,7 +272,7 @@ static struct clk_rcg2 gcc_blsp1_qup2_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_blsp1_qup2_i2c_apps_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -286,7 +286,7 @@ static struct clk_rcg2 gcc_blsp1_qup2_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_blsp1_qup2_spi_apps_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -300,7 +300,7 @@ static struct clk_rcg2 gcc_blsp1_qup3_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_blsp1_qup3_i2c_apps_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -314,7 +314,7 @@ static struct clk_rcg2 gcc_blsp1_qup3_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_blsp1_qup3_spi_apps_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -328,7 +328,7 @@ static struct clk_rcg2 gcc_blsp1_qup4_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_blsp1_qup4_i2c_apps_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -342,7 +342,7 @@ static struct clk_rcg2 gcc_blsp1_qup4_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_blsp1_qup4_spi_apps_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -386,7 +386,7 @@ static struct clk_rcg2 gcc_blsp1_uart1_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_blsp1_uart1_apps_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -400,7 +400,7 @@ static struct clk_rcg2 gcc_blsp1_uart2_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_blsp1_uart2_apps_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -414,7 +414,7 @@ static struct clk_rcg2 gcc_blsp1_uart3_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_blsp1_uart3_apps_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -428,7 +428,7 @@ static struct clk_rcg2 gcc_blsp1_uart4_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_blsp1_uart4_apps_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -450,7 +450,7 @@ static struct clk_rcg2 gcc_cpuss_ahb_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_cpuss_ahb_clk_src",
 		.parent_data = gcc_parents_0_ao,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0_ao),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -469,7 +469,7 @@ static struct clk_rcg2 gcc_cpuss_rbcpr_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_cpuss_rbcpr_clk_src",
 		.parent_data = gcc_parents_0_ao,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0_ao),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -493,7 +493,7 @@ static struct clk_rcg2 gcc_emac_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_emac_clk_src",
 		.parent_data = gcc_parents_5,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_parents_5),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -514,7 +514,7 @@ static struct clk_rcg2 gcc_emac_ptp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_emac_ptp_clk_src",
 		.parent_data = gcc_parents_2,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(gcc_parents_2),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -537,7 +537,7 @@ static struct clk_rcg2 gcc_gp1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gp1_clk_src",
 		.parent_data = gcc_parents_3,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_parents_3),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -551,7 +551,7 @@ static struct clk_rcg2 gcc_gp2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gp2_clk_src",
 		.parent_data = gcc_parents_3,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_parents_3),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -565,7 +565,7 @@ static struct clk_rcg2 gcc_gp3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gp3_clk_src",
 		.parent_data = gcc_parents_3,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_parents_3),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -579,7 +579,7 @@ static struct clk_rcg2 gcc_pcie_aux_phy_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pcie_aux_phy_clk_src",
 		.parent_data = gcc_parents_4,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_4),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -598,7 +598,7 @@ static struct clk_rcg2 gcc_pcie_rchng_phy_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pcie_rchng_phy_clk_src",
 		.parent_data = gcc_parents_3,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(gcc_parents_3),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -619,7 +619,7 @@ static struct clk_rcg2 gcc_pdm2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pdm2_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -633,7 +633,7 @@ static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_sdcc1_apps_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -652,7 +652,7 @@ static struct clk_rcg2 gcc_usb30_master_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb30_master_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -671,7 +671,7 @@ static struct clk_rcg2 gcc_usb30_mock_utmi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb30_mock_utmi_clk_src",
 		.parent_data = gcc_parents_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gcc_parents_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -691,7 +691,7 @@ static struct clk_rcg2 gcc_usb3_phy_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb3_phy_aux_clk_src",
 		.parent_data = gcc_parents_4,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_parents_4),
 		.ops = &clk_rcg2_ops,
 	},
 };
-- 
2.35.1

