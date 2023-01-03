Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6676F65C27B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 15:57:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238081AbjACOzx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 09:55:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237608AbjACOza (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 09:55:30 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36D1612088
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 06:55:28 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id s22so32070204ljp.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 06:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2iBuH1bsRKdCCQIXMmGZGQU6qjb6dF4XdEJmrzuxXxE=;
        b=Db2zp7Pf6lJ48jaMdB5SZ072AEmPhIspWM6idV3REQAAm/bhGqNwctBGTtnj9qqtL+
         tZOrSA43bxJxvNwaYQHjvdhrEAE6K4EHs2GWPH2ujIPT9bswYPMzNaQ4RFc9cvgrmk/v
         ICGBlDjQV5GFs0lcYyvsIU2gRH522zIqYUKlOoL6Pbl0lJwWd9Jmy8wwIogotvUIFuJN
         5W3AbPyCD6llQHVkB333lptr/by9xevyeQmYPUEmpDoc+F+oZyh9P+6wqjaPtIHHtwyc
         ShBrfbMKWM7FgBTQEEnNz3DQYQ+ErogqYX7sQZ0+F4ljDaSm8ge9Fzg0MM8pvRG2AkB5
         NREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2iBuH1bsRKdCCQIXMmGZGQU6qjb6dF4XdEJmrzuxXxE=;
        b=jiK1ol+33LVkbn4xWOdxIBRNx75YnM4P15L52ip0gSg4957hlyQoKNI86Fefg5ViLo
         cqjPO5Z7pH517ZP2trekOb38qeIKAidk25S6Nr3a6IXwXUp0QvK51ON8UY3cDHPNX5+w
         fQSFUQautpkC2oAeYKj0U6neUysi1qJioN1S3zW5F3ebyfUSVDmVLOjQV0dDa64MU6CJ
         1piUNudip5A36DXQD0wWneuo1UhWeMfP5hb6G7zibNs54w+451bKdwru/pW0qR9meTYb
         aWbSnvGVXvWWlAQNdIyeI6E908xPSyWA6gaK/prioWPAwiP/+uv6JlXpzAH6DTvykinL
         KlRg==
X-Gm-Message-State: AFqh2kp/ZuxJBwKlINXsPeX5nBbxwRZon+gLvZ9QH2FgdQZo23/EZNb8
        tkbmzlxmV9u3PIbebISLUbQm6w==
X-Google-Smtp-Source: AMrXdXsNmSlVYBa5pxZWYHmKMXDi0yH/PEn/Dg3lZy9w/jEm1TTzGUgOhVyYxcCMoxPrVIypkZxqrQ==
X-Received: by 2002:a05:651c:1a14:b0:27f:976e:7126 with SMTP id by20-20020a05651c1a1400b0027f976e7126mr15150328ljb.33.1672757726508;
        Tue, 03 Jan 2023 06:55:26 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s24-20020a2eb638000000b00279cbcfd7dbsm3544015ljn.30.2023.01.03.06.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:55:25 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 10/21] clk: qcom: gcc-sdx65: switch to parent_hws
Date:   Tue,  3 Jan 2023 16:55:04 +0200
Message-Id: <20230103145515.1164020-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
References: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
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

Change several entries of parent_data to use parent_hws instead, which
results in slightly more ovbious code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sdx65.c | 109 +++++++++++++++++------------------
 1 file changed, 54 insertions(+), 55 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdx65.c b/drivers/clk/qcom/gcc-sdx65.c
index 748ac15b5ed8..b0c17043551d 100644
--- a/drivers/clk/qcom/gcc-sdx65.c
+++ b/drivers/clk/qcom/gcc-sdx65.c
@@ -634,8 +634,8 @@ static struct clk_regmap_div gcc_cpuss_ahb_postdiv_clk_src = {
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "gcc_cpuss_ahb_postdiv_clk_src",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &gcc_cpuss_ahb_clk_src.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&gcc_cpuss_ahb_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -649,8 +649,8 @@ static struct clk_regmap_div gcc_usb30_mock_utmi_postdiv_clk_src = {
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "gcc_usb30_mock_utmi_postdiv_clk_src",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &gcc_usb30_mock_utmi_clk_src.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&gcc_usb30_mock_utmi_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -692,8 +692,8 @@ static struct clk_branch gcc_blsp1_qup1_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup1_i2c_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_blsp1_qup1_i2c_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_blsp1_qup1_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -710,8 +710,8 @@ static struct clk_branch gcc_blsp1_qup1_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup1_spi_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_blsp1_qup1_spi_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_blsp1_qup1_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -728,8 +728,8 @@ static struct clk_branch gcc_blsp1_qup2_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup2_i2c_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_blsp1_qup2_i2c_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_blsp1_qup2_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -746,8 +746,8 @@ static struct clk_branch gcc_blsp1_qup2_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup2_spi_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_blsp1_qup2_spi_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_blsp1_qup2_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -764,8 +764,8 @@ static struct clk_branch gcc_blsp1_qup3_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup3_i2c_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_blsp1_qup3_i2c_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_blsp1_qup3_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -782,8 +782,8 @@ static struct clk_branch gcc_blsp1_qup3_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup3_spi_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_blsp1_qup3_spi_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_blsp1_qup3_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -800,8 +800,8 @@ static struct clk_branch gcc_blsp1_qup4_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup4_i2c_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_blsp1_qup4_i2c_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_blsp1_qup4_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -818,8 +818,8 @@ static struct clk_branch gcc_blsp1_qup4_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup4_spi_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_blsp1_qup4_spi_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_blsp1_qup4_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -849,8 +849,8 @@ static struct clk_branch gcc_blsp1_uart1_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart1_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_blsp1_uart1_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_blsp1_uart1_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -867,8 +867,8 @@ static struct clk_branch gcc_blsp1_uart2_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart2_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_blsp1_uart2_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_blsp1_uart2_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -885,8 +885,8 @@ static struct clk_branch gcc_blsp1_uart3_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart3_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_blsp1_uart3_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_blsp1_uart3_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -903,8 +903,8 @@ static struct clk_branch gcc_blsp1_uart4_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart4_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_blsp1_uart4_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_blsp1_uart4_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -936,8 +936,8 @@ static struct clk_branch gcc_gp1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_gp1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_gp1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -954,8 +954,8 @@ static struct clk_branch gcc_gp2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_gp2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_gp2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -972,8 +972,8 @@ static struct clk_branch gcc_gp3_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp3_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_gp3_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_gp3_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1017,8 +1017,8 @@ static struct clk_branch gcc_pcie_aux_clk = {
 		.enable_mask = BIT(3),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_aux_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_pcie_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1073,8 +1073,8 @@ static struct clk_branch gcc_pcie_pipe_clk = {
 		.enable_mask = BIT(4),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_pipe_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_pcie_pipe_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_pipe_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1093,8 +1093,8 @@ static struct clk_branch gcc_pcie_rchng_phy_clk = {
 		.enable_mask = BIT(7),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_rchng_phy_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_pcie_rchng_phy_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_rchng_phy_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1113,8 +1113,8 @@ static struct clk_branch gcc_pcie_sleep_clk = {
 		.enable_mask = BIT(6),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_sleep_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_pcie_aux_phy_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_aux_phy_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1161,8 +1161,8 @@ static struct clk_branch gcc_pdm2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pdm2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_pdm2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pdm2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1233,8 +1233,8 @@ static struct clk_branch gcc_sdcc1_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc1_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_sdcc1_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_sdcc1_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1251,8 +1251,8 @@ static struct clk_branch gcc_usb30_master_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_master_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb30_master_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb30_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1269,9 +1269,8 @@ static struct clk_branch gcc_usb30_mock_utmi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_mock_utmi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw =
-					&gcc_usb30_mock_utmi_postdiv_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb30_mock_utmi_postdiv_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1327,8 +1326,8 @@ static struct clk_branch gcc_usb3_phy_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb3_phy_aux_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb3_phy_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb3_phy_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1369,8 +1368,8 @@ static struct clk_branch gcc_usb3_phy_pipe_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb3_phy_pipe_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb3_phy_pipe_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb3_phy_pipe_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.39.0

