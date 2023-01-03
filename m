Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E809265C25C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 15:55:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237942AbjACOzW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 09:55:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233469AbjACOzV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 09:55:21 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DD03FD19
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 06:55:18 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id q2so32080480ljp.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 06:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODLUcKWtGVPY0H0badPB9+Orh7eSmaLydbWr9o63dx8=;
        b=ZSQCAsZTPLtMl8PTduc9aXMVBKAyZgigjAzC1BoS2Ep2vzJpP7MGcDhWMb/+DezLDu
         +liaDsgKA2GnEESaESAX/17uPc34uS9UmeCbM6Te19IzjsbfkFbZkujE65sU0daYo8Ej
         cK1RxOUdn9dUpUCOY7j1YpIGe5S8Nn8dyLyNQL6/Y6yzkZZzvAFw6OCHyyaPhnpbhOIM
         y3JkMZshUd6gv1Is+94EJKWmt8Nf+XLBHPMkvRW0BQ9QXFCZ87IWhb7+u1WrwkRfQ3XA
         HJcvdVyaBPDors5m1ispGRMOEcT3nPGW9c3TigUkDux7lNuqqac+gB2Nvpc/7EHI1ePS
         NbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ODLUcKWtGVPY0H0badPB9+Orh7eSmaLydbWr9o63dx8=;
        b=wdAfwnTKfjMDgMRSGpHajUxA1W/rC2s7XGsEOQLTdN2cz1MlpmjltamDqCAic+BxTj
         +5rrnqqR2pqcMyAyuhKytHkRxvIDP51iN7FxXOR7bov84IOkjXMQIIES2wuylL6Ud1xJ
         yQQi6rOIwJEb6SiK8FyO/1cglQDZ+MiiCmccWupZoJpXKD3fg5Wnnpf49mTAoRpIexcq
         riQBvewlUvyRRamEcHkSB+8VqpF4+ldjMmDKLO4f1g5gbP6+Nr1wa0j73Zw83+XBkLur
         7ZqfRnt+tgh7kO/TjIQeq39aRnHyasPU6x+9iWMiYrnNzT2qTclMLeGxkou7PJUAlGW2
         Cg8w==
X-Gm-Message-State: AFqh2kpkcFfDA5/duPsHjJ/qN6dSD/2PyXPzf8yi3vJhFUvOKfEsAL1o
        BfmQpPH/KQoeuijtbcjZqrXJf9iAIdBhC8L/
X-Google-Smtp-Source: AMrXdXs7jkEa2Mq1dPab3N05zxbrkDkrXp8O6wBtj89qwLorsHLoA+gvlTqpjnF1NtVG4rKVPHke+Q==
X-Received: by 2002:a2e:b549:0:b0:27f:ca4c:390c with SMTP id a9-20020a2eb549000000b0027fca4c390cmr6575821ljn.37.1672757717289;
        Tue, 03 Jan 2023 06:55:17 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s24-20020a2eb638000000b00279cbcfd7dbsm3544015ljn.30.2023.01.03.06.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:55:16 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 01/21] clk: qcom: dispcc-sm8450: switch to parent_hws
Date:   Tue,  3 Jan 2023 16:54:55 +0200
Message-Id: <20230103145515.1164020-2-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/dispcc-sm8450.c | 212 +++++++++++++++----------------
 1 file changed, 106 insertions(+), 106 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
index 0cd7ebe90301..40efa4682bed 100644
--- a/drivers/clk/qcom/dispcc-sm8450.c
+++ b/drivers/clk/qcom/dispcc-sm8450.c
@@ -694,8 +694,8 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "disp_cc_mdss_byte0_div_clk_src",
-		.parent_data = &(const struct clk_parent_data) {
-			.hw = &disp_cc_mdss_byte0_clk_src.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_byte0_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_regmap_div_ops,
@@ -708,8 +708,8 @@ static struct clk_regmap_div disp_cc_mdss_byte1_div_clk_src = {
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "disp_cc_mdss_byte1_div_clk_src",
-		.parent_data = &(const struct clk_parent_data) {
-			.hw = &disp_cc_mdss_byte1_clk_src.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_byte1_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_regmap_div_ops,
@@ -722,8 +722,8 @@ static struct clk_regmap_div disp_cc_mdss_dptx0_link_div_clk_src = {
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx0_link_div_clk_src",
-		.parent_data = &(const struct clk_parent_data) {
-			.hw = &disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -737,8 +737,8 @@ static struct clk_regmap_div disp_cc_mdss_dptx1_link_div_clk_src = {
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx1_link_div_clk_src",
-		.parent_data = &(const struct clk_parent_data) {
-			.hw = &disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -752,8 +752,8 @@ static struct clk_regmap_div disp_cc_mdss_dptx2_link_div_clk_src = {
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx2_link_div_clk_src",
-		.parent_data = &(const struct clk_parent_data) {
-			.hw = &disp_cc_mdss_dptx2_link_clk_src.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_dptx2_link_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -767,8 +767,8 @@ static struct clk_regmap_div disp_cc_mdss_dptx3_link_div_clk_src = {
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "disp_cc_mdss_dptx3_link_div_clk_src",
-		.parent_data = &(const struct clk_parent_data) {
-			.hw = &disp_cc_mdss_dptx3_link_clk_src.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_dptx3_link_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -784,8 +784,8 @@ static struct clk_branch disp_cc_mdss_ahb1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_ahb1_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -802,8 +802,8 @@ static struct clk_branch disp_cc_mdss_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_ahb_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -820,8 +820,8 @@ static struct clk_branch disp_cc_mdss_byte0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_byte0_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_byte0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_byte0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -838,8 +838,8 @@ static struct clk_branch disp_cc_mdss_byte0_intf_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_byte0_intf_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_byte0_div_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_byte0_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -856,8 +856,8 @@ static struct clk_branch disp_cc_mdss_byte1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_byte1_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_byte1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_byte1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -874,8 +874,8 @@ static struct clk_branch disp_cc_mdss_byte1_intf_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_byte1_intf_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_byte1_div_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_byte1_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -892,8 +892,8 @@ static struct clk_branch disp_cc_mdss_dptx0_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx0_aux_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_dptx0_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx0_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -910,8 +910,8 @@ static struct clk_branch disp_cc_mdss_dptx0_crypto_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx0_crypto_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -928,8 +928,8 @@ static struct clk_branch disp_cc_mdss_dptx0_link_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx0_link_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx0_link_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -946,8 +946,8 @@ static struct clk_branch disp_cc_mdss_dptx0_link_intf_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx0_link_intf_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_dptx0_link_div_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx0_link_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -964,8 +964,8 @@ static struct clk_branch disp_cc_mdss_dptx0_pixel0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx0_pixel0_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_dptx0_pixel0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx0_pixel0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -982,8 +982,8 @@ static struct clk_branch disp_cc_mdss_dptx0_pixel1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx0_pixel1_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_dptx0_pixel1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx0_pixel1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1000,8 +1000,8 @@ static struct clk_branch disp_cc_mdss_dptx0_usb_router_link_intf_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx0_usb_router_link_intf_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_dptx0_link_div_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx0_link_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1018,8 +1018,8 @@ static struct clk_branch disp_cc_mdss_dptx1_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx1_aux_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_dptx1_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx1_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1036,8 +1036,8 @@ static struct clk_branch disp_cc_mdss_dptx1_crypto_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx1_crypto_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1054,8 +1054,8 @@ static struct clk_branch disp_cc_mdss_dptx1_link_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx1_link_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx1_link_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1072,8 +1072,8 @@ static struct clk_branch disp_cc_mdss_dptx1_link_intf_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx1_link_intf_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_dptx1_link_div_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx1_link_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1090,8 +1090,8 @@ static struct clk_branch disp_cc_mdss_dptx1_pixel0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx1_pixel0_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_dptx1_pixel0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx1_pixel0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1108,8 +1108,8 @@ static struct clk_branch disp_cc_mdss_dptx1_pixel1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx1_pixel1_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_dptx1_pixel1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx1_pixel1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1126,8 +1126,8 @@ static struct clk_branch disp_cc_mdss_dptx1_usb_router_link_intf_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx1_usb_router_link_intf_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_dptx0_link_div_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx0_link_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1144,8 +1144,8 @@ static struct clk_branch disp_cc_mdss_dptx2_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx2_aux_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_dptx2_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx2_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1162,8 +1162,8 @@ static struct clk_branch disp_cc_mdss_dptx2_crypto_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx2_crypto_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_dptx2_link_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx2_link_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1180,8 +1180,8 @@ static struct clk_branch disp_cc_mdss_dptx2_link_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx2_link_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_dptx2_link_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx2_link_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1198,8 +1198,8 @@ static struct clk_branch disp_cc_mdss_dptx2_link_intf_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx2_link_intf_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_dptx2_link_div_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx2_link_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1216,8 +1216,8 @@ static struct clk_branch disp_cc_mdss_dptx2_pixel0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx2_pixel0_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_dptx2_pixel0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx2_pixel0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1234,8 +1234,8 @@ static struct clk_branch disp_cc_mdss_dptx2_pixel1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx2_pixel1_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_dptx2_pixel1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx2_pixel1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1252,8 +1252,8 @@ static struct clk_branch disp_cc_mdss_dptx3_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx3_aux_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_dptx3_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx3_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1270,8 +1270,8 @@ static struct clk_branch disp_cc_mdss_dptx3_crypto_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx3_crypto_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_dptx3_link_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx3_link_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1288,8 +1288,8 @@ static struct clk_branch disp_cc_mdss_dptx3_link_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx3_link_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_dptx3_link_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx3_link_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1306,8 +1306,8 @@ static struct clk_branch disp_cc_mdss_dptx3_link_intf_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx3_link_intf_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_dptx3_link_div_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx3_link_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1324,8 +1324,8 @@ static struct clk_branch disp_cc_mdss_dptx3_pixel0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_dptx3_pixel0_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_dptx3_pixel0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_dptx3_pixel0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1342,8 +1342,8 @@ static struct clk_branch disp_cc_mdss_esc0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_esc0_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_esc0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_esc0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1360,8 +1360,8 @@ static struct clk_branch disp_cc_mdss_esc1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_esc1_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_esc1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_esc1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1378,8 +1378,8 @@ static struct clk_branch disp_cc_mdss_mdp1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_mdp1_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_mdp_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_mdp_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1396,8 +1396,8 @@ static struct clk_branch disp_cc_mdss_mdp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_mdp_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_mdp_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_mdp_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1414,8 +1414,8 @@ static struct clk_branch disp_cc_mdss_mdp_lut1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_mdp_lut1_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_mdp_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_mdp_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1432,8 +1432,8 @@ static struct clk_branch disp_cc_mdss_mdp_lut_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_mdp_lut_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_mdp_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_mdp_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1450,8 +1450,8 @@ static struct clk_branch disp_cc_mdss_non_gdsc_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_non_gdsc_ahb_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1468,8 +1468,8 @@ static struct clk_branch disp_cc_mdss_pclk0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_pclk0_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_pclk0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_pclk0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1486,8 +1486,8 @@ static struct clk_branch disp_cc_mdss_pclk1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_pclk1_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_pclk1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_pclk1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1504,8 +1504,8 @@ static struct clk_branch disp_cc_mdss_rot1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_rot1_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_rot_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_rot_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1522,8 +1522,8 @@ static struct clk_branch disp_cc_mdss_rot_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_rot_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_rot_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_rot_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1540,8 +1540,8 @@ static struct clk_branch disp_cc_mdss_rscc_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_rscc_ahb_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_ahb_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1558,8 +1558,8 @@ static struct clk_branch disp_cc_mdss_rscc_vsync_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_rscc_vsync_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_vsync_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_vsync_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1576,8 +1576,8 @@ static struct clk_branch disp_cc_mdss_vsync1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_vsync1_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_vsync_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_vsync_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1594,8 +1594,8 @@ static struct clk_branch disp_cc_mdss_vsync_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_mdss_vsync_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_mdss_vsync_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_mdss_vsync_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1612,8 +1612,8 @@ static struct clk_branch disp_cc_sleep_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "disp_cc_sleep_clk",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &disp_cc_sleep_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&disp_cc_sleep_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.39.0

