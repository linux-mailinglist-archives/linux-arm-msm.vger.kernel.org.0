Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B69F0656679
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Dec 2022 02:32:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232622AbiL0Bcf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Dec 2022 20:32:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232601AbiL0Bcd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Dec 2022 20:32:33 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 157052AFD
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Dec 2022 17:32:31 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id x11so12474272ljh.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Dec 2022 17:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xncIQ2riEidK/3ski9MfO0y/fig7h/LnCHD/DxS5j+I=;
        b=Y4txyfI79w49+osyNLbbk8xbN8b7DyhPrvioTrrFtljeOSXurq94aFuTtnik098AW3
         zhLxDRm6AVgG/44ZBwYPFVPQR4PCkX2ZPqvDn7eh/88mTi7CoJhZkoJ0tjIwE480raFT
         PvZ4O8eWSjGm87MkSp/knAcoN4yevmGpmXiyk+JCcoeSdI7A8hCZrkVsV5gafq0tpMoH
         g0JiosjqCptYvclOfpsb6Y+wE3qCGLOAKsSOUi9G35hp+8aXw2iElizwFu2DGpmGGSn9
         Iikxt6tB2scwo6/Q3TTc7Krm4Ao64hb9Eo66Vbd7l1f65y4JElIyGSIPIqeykrQccnPY
         4+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xncIQ2riEidK/3ski9MfO0y/fig7h/LnCHD/DxS5j+I=;
        b=yQRxfwC8qmI1+fIdzaKTms1UAXIx0S4wym41Fkcu8Ht4OlllFz22QUYA5szX468qI3
         uqlDGtW/kKFKcUXg4xzIAa+K0OC2Ktr5jhoD7fwJJAhAZb6vhrSUHwTgd7m5A7vLEk/p
         YLrzm1RXYgZfx+yadJN3S5R3fDuup9cqq4JB/JcsXUbN1Fa58dYKZq/dP21z7evOQYIU
         DZs0+Cq0/oulQnPKa0viIMlzMkSlxKSkYpj2FbqGvX9vjowtlRe8T1DnABiPNA/NEweJ
         XmjycOPThCCGXC613gPYNJFopQL87A39V9l9ZNUMb5DVCl4PqVIs95CgAOIVgW3dsryK
         2fOw==
X-Gm-Message-State: AFqh2ko1jUU92YmLSKvb9OHIKLd88ZeYmYZ17tvIFsWPUPtBTxKAkKKI
        Qn/tQaCeGdC2xMmRoR1B3LfCfg==
X-Google-Smtp-Source: AMrXdXu2ml7TXRWbgSljVu/exshrIe9iRtVXNrKH4pyRf70VQCqginTBv/m2tklylwIuso1VSYAxnA==
X-Received: by 2002:a2e:7e05:0:b0:27f:bf18:23ca with SMTP id z5-20020a2e7e05000000b0027fbf1823camr2883812ljc.22.1672104749315;
        Mon, 26 Dec 2022 17:32:29 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v6-20020a2e87c6000000b0027fbb12aa53sm674752ljj.20.2022.12.26.17.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 17:32:28 -0800 (PST)
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
Subject: [RFC PATCH 04/12] clk: qcom: gcc-apq8084: use ARRAY_SIZE instead of specifying num_parents
Date:   Tue, 27 Dec 2022 03:32:17 +0200
Message-Id: <20221227013225.2847382-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
References: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
adding/removing entries to/from parent_data easy and errorproof.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-apq8084.c | 136 ++++++++++++++++-----------------
 1 file changed, 68 insertions(+), 68 deletions(-)

diff --git a/drivers/clk/qcom/gcc-apq8084.c b/drivers/clk/qcom/gcc-apq8084.c
index ab088d702d7c..b41f55b289ae 100644
--- a/drivers/clk/qcom/gcc-apq8084.c
+++ b/drivers/clk/qcom/gcc-apq8084.c
@@ -132,7 +132,7 @@ static struct clk_rcg2 config_noc_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "config_noc_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -144,7 +144,7 @@ static struct clk_rcg2 periph_noc_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "periph_noc_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -156,7 +156,7 @@ static struct clk_rcg2 system_noc_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "system_noc_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -231,7 +231,7 @@ static struct clk_rcg2 ufs_axi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ufs_axi_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -250,7 +250,7 @@ static struct clk_rcg2 usb30_master_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb30_master_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -269,7 +269,7 @@ static struct clk_rcg2 usb30_sec_master_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb30_sec_master_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -322,7 +322,7 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -347,7 +347,7 @@ static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -360,7 +360,7 @@ static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -374,7 +374,7 @@ static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -387,7 +387,7 @@ static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -401,7 +401,7 @@ static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -414,7 +414,7 @@ static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -428,7 +428,7 @@ static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -441,7 +441,7 @@ static struct clk_rcg2 blsp1_qup5_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup5_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -455,7 +455,7 @@ static struct clk_rcg2 blsp1_qup5_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup5_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -468,7 +468,7 @@ static struct clk_rcg2 blsp1_qup6_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup6_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -482,7 +482,7 @@ static struct clk_rcg2 blsp1_qup6_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup6_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -515,7 +515,7 @@ static struct clk_rcg2 blsp1_uart1_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart1_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -529,7 +529,7 @@ static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart2_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -543,7 +543,7 @@ static struct clk_rcg2 blsp1_uart3_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart3_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -557,7 +557,7 @@ static struct clk_rcg2 blsp1_uart4_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart4_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -571,7 +571,7 @@ static struct clk_rcg2 blsp1_uart5_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart5_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -585,7 +585,7 @@ static struct clk_rcg2 blsp1_uart6_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart6_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -598,7 +598,7 @@ static struct clk_rcg2 blsp2_qup1_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup1_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -612,7 +612,7 @@ static struct clk_rcg2 blsp2_qup1_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup1_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -625,7 +625,7 @@ static struct clk_rcg2 blsp2_qup2_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup2_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -639,7 +639,7 @@ static struct clk_rcg2 blsp2_qup2_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup2_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -652,7 +652,7 @@ static struct clk_rcg2 blsp2_qup3_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup3_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -666,7 +666,7 @@ static struct clk_rcg2 blsp2_qup3_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup3_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -679,7 +679,7 @@ static struct clk_rcg2 blsp2_qup4_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup4_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -693,7 +693,7 @@ static struct clk_rcg2 blsp2_qup4_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup4_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -706,7 +706,7 @@ static struct clk_rcg2 blsp2_qup5_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup5_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -720,7 +720,7 @@ static struct clk_rcg2 blsp2_qup5_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup5_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -733,7 +733,7 @@ static struct clk_rcg2 blsp2_qup6_i2c_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup6_i2c_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -747,7 +747,7 @@ static struct clk_rcg2 blsp2_qup6_spi_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup6_spi_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -761,7 +761,7 @@ static struct clk_rcg2 blsp2_uart1_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart1_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -775,7 +775,7 @@ static struct clk_rcg2 blsp2_uart2_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart2_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -789,7 +789,7 @@ static struct clk_rcg2 blsp2_uart3_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart3_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -803,7 +803,7 @@ static struct clk_rcg2 blsp2_uart4_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart4_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -817,7 +817,7 @@ static struct clk_rcg2 blsp2_uart5_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart5_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -831,7 +831,7 @@ static struct clk_rcg2 blsp2_uart6_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart6_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -852,7 +852,7 @@ static struct clk_rcg2 ce1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ce1_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -873,7 +873,7 @@ static struct clk_rcg2 ce2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ce2_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -894,7 +894,7 @@ static struct clk_rcg2 ce3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ce3_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -915,7 +915,7 @@ static struct clk_rcg2 gp1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp1_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -929,7 +929,7 @@ static struct clk_rcg2 gp2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp2_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -943,7 +943,7 @@ static struct clk_rcg2 gp3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp3_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -962,7 +962,7 @@ static struct clk_rcg2 pcie_0_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pcie_0_aux_clk_src",
 		.parent_names = gcc_xo_pcie_sleep,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_pcie_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -976,7 +976,7 @@ static struct clk_rcg2 pcie_1_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pcie_1_aux_clk_src",
 		.parent_names = gcc_xo_pcie_sleep,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_pcie_sleep),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -995,7 +995,7 @@ static struct clk_rcg2 pcie_0_pipe_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pcie_0_pipe_clk_src",
 		.parent_names = gcc_xo_pcie,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_pcie),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1008,7 +1008,7 @@ static struct clk_rcg2 pcie_1_pipe_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pcie_1_pipe_clk_src",
 		.parent_names = gcc_xo_pcie,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_pcie),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1026,7 +1026,7 @@ static struct clk_rcg2 pdm2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pdm2_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1046,7 +1046,7 @@ static struct clk_rcg2 sata_asic0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sata_asic0_clk_src",
 		.parent_names = gcc_xo_sata_asic0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_sata_asic0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1066,7 +1066,7 @@ static struct clk_rcg2 sata_pmalive_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sata_pmalive_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1086,7 +1086,7 @@ static struct clk_rcg2 sata_rx_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sata_rx_clk_src",
 		.parent_names = gcc_xo_sata_rx,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_sata_rx),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1104,7 +1104,7 @@ static struct clk_rcg2 sata_rx_oob_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sata_rx_oob_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1131,7 +1131,7 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc1_apps_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll4,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll4),
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
@@ -1145,7 +1145,7 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc2_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
@@ -1159,7 +1159,7 @@ static struct clk_rcg2 sdcc3_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc3_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
@@ -1173,7 +1173,7 @@ static struct clk_rcg2 sdcc4_apps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc4_apps_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
@@ -1192,7 +1192,7 @@ static struct clk_rcg2 tsif_ref_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "tsif_ref_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1210,7 +1210,7 @@ static struct clk_rcg2 usb30_mock_utmi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb30_mock_utmi_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1228,7 +1228,7 @@ static struct clk_rcg2 usb30_sec_mock_utmi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb30_sec_mock_utmi_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1246,7 +1246,7 @@ static struct clk_rcg2 usb_hs_system_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb_hs_system_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1312,7 +1312,7 @@ static struct clk_rcg2 usb_hsic_io_cal_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb_hsic_io_cal_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 1,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1347,7 +1347,7 @@ static struct clk_rcg2 usb_hsic_mock_utmi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb_hsic_mock_utmi_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 1,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1365,7 +1365,7 @@ static struct clk_rcg2 usb_hsic_system_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb_hsic_system_clk_src",
 		.parent_names = gcc_xo_gpll0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
-- 
2.35.1

