Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECCA45579DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jun 2022 14:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231420AbiFWMEj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jun 2022 08:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231617AbiFWMEf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jun 2022 08:04:35 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 473E7496B6
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 05:04:28 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id s14so16298202ljs.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 05:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bIQD0JLz3hwfzeywuJjz4RFSXqLmEyBqYNGSe42ZS8o=;
        b=e682+5BxHtsPh62hwY6pVO3CHBpdSjURVWAaC6F2eh6wxnCIgQcG2RWhXu0/n12hk9
         +0smeNhje0RFu8+4lWjGaCK9/3bPxx27S8q89YxpYtzlfLBpvTVywxoExNR29r/Gwc7X
         kl/py0CEnTSwIcxQmuJYJU46xhB/Ts3sK68RQlUhOXStq9UcM1HLAxjUsN92vrJrRpg6
         D0e2+5raCuzw+fTCj22gCvxS7mUq/wFd1OjseIpL7kAsebtMJ/tuUKml9sy/MzHxQ426
         7nJq9RxbuqV8lQBtp0HGXYFAhiXA7rSUmT1C0bc7X4FJ9evvO+T5RbQ07zPRgbXHabHh
         K4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bIQD0JLz3hwfzeywuJjz4RFSXqLmEyBqYNGSe42ZS8o=;
        b=4UbPwDuOBqmwzfUvPqAXGU3IME192HqISERHBQqAlL++fxjDuH0QobmkuxS7g8+qVg
         wZslWWNTGiW4W5MCiP+zwr2yOCyS3nVRHMmC2yj5OETFBdMboi3Pf8KZT/uvDDq2sW40
         kncs7gARPXmFIcKTAukLAc7itOY8FYvt71ip8LmPgX9xdop2ZKmiQlgVlnjX33gapotk
         g0gsTTrQWSQvXXW+LvaYiq96T5su2pEQzBsfmPR+05JvIV7QnEl3CKWHHKu/flCafPCy
         XRop0mf/+6zXa0BJKZWC+VSu8fBi0lA60pdPoa1MqW3ZDPAPchkwD3WSmBkFi8zqQ8e7
         gMDQ==
X-Gm-Message-State: AJIora9zIRec9AiGaSx2kBLL5GN3LJVt4SS7rWFpWneJ0thQtG5uV98A
        uHZZbiWmPStJ66j48JSt1mACsQ==
X-Google-Smtp-Source: AGRyM1tvi4J5mES8sTS2kkvUsYmYy1IvJelxL4zehStAIPVZVbt3iDuhCkxnvWSyJ7plCStgAMc57g==
X-Received: by 2002:a2e:a90d:0:b0:25a:7edb:4034 with SMTP id j13-20020a2ea90d000000b0025a7edb4034mr4550229ljq.129.1655985865110;
        Thu, 23 Jun 2022 05:04:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 18-20020ac25f52000000b0047f6b4a53cdsm1799888lfz.172.2022.06.23.05.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 05:04:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 07/15] clk: qcom: mmcc-msm8960: use ARRAY_SIZE instead of specifying num_parents
Date:   Thu, 23 Jun 2022 15:04:10 +0300
Message-Id: <20220623120418.250589-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
References: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
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

Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
adding/removing entries to/from parent_data easy and errorproof.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/mmcc-msm8960.c | 84 ++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 42 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-msm8960.c b/drivers/clk/qcom/mmcc-msm8960.c
index aaaad65b6458..d5c989a71e13 100644
--- a/drivers/clk/qcom/mmcc-msm8960.c
+++ b/drivers/clk/qcom/mmcc-msm8960.c
@@ -193,7 +193,7 @@ static struct clk_rcg camclk0_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "camclk0_src",
 			.parent_names = mmcc_pxo_pll8_pll2,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_rcg_ops,
 		},
 	},
@@ -242,7 +242,7 @@ static struct clk_rcg camclk1_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "camclk1_src",
 			.parent_names = mmcc_pxo_pll8_pll2,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_rcg_ops,
 		},
 	},
@@ -291,7 +291,7 @@ static struct clk_rcg camclk2_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "camclk2_src",
 			.parent_names = mmcc_pxo_pll8_pll2,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_rcg_ops,
 		},
 	},
@@ -346,7 +346,7 @@ static struct clk_rcg csi0_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "csi0_src",
 			.parent_names = mmcc_pxo_pll8_pll2,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_rcg_ops,
 		},
 	},
@@ -410,7 +410,7 @@ static struct clk_rcg csi1_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "csi1_src",
 			.parent_names = mmcc_pxo_pll8_pll2,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_rcg_ops,
 		},
 	},
@@ -474,7 +474,7 @@ static struct clk_rcg csi2_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "csi2_src",
 			.parent_names = mmcc_pxo_pll8_pll2,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_rcg_ops,
 		},
 	},
@@ -619,7 +619,7 @@ static struct clk_pix_rdi csi_pix_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "csi_pix_clk",
 			.parent_names = pix_rdi_parents,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(pix_rdi_parents),
 			.ops = &clk_ops_pix_rdi,
 		},
 	},
@@ -636,7 +636,7 @@ static struct clk_pix_rdi csi_pix1_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "csi_pix1_clk",
 			.parent_names = pix_rdi_parents,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(pix_rdi_parents),
 			.ops = &clk_ops_pix_rdi,
 		},
 	},
@@ -653,7 +653,7 @@ static struct clk_pix_rdi csi_rdi_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "csi_rdi_clk",
 			.parent_names = pix_rdi_parents,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(pix_rdi_parents),
 			.ops = &clk_ops_pix_rdi,
 		},
 	},
@@ -670,7 +670,7 @@ static struct clk_pix_rdi csi_rdi1_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "csi_rdi1_clk",
 			.parent_names = pix_rdi_parents,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(pix_rdi_parents),
 			.ops = &clk_ops_pix_rdi,
 		},
 	},
@@ -687,7 +687,7 @@ static struct clk_pix_rdi csi_rdi2_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "csi_rdi2_clk",
 			.parent_names = pix_rdi_parents,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(pix_rdi_parents),
 			.ops = &clk_ops_pix_rdi,
 		},
 	},
@@ -726,7 +726,7 @@ static struct clk_rcg csiphytimer_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "csiphytimer_src",
 			.parent_names = mmcc_pxo_pll8_pll2,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_rcg_ops,
 		},
 	},
@@ -742,7 +742,7 @@ static struct clk_branch csiphy0_timer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.parent_names = csixphy_timer_src,
-			.num_parents = 1,
+			.num_parents = ARRAY_SIZE(csixphy_timer_src),
 			.name = "csiphy0_timer_clk",
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -758,7 +758,7 @@ static struct clk_branch csiphy1_timer_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.parent_names = csixphy_timer_src,
-			.num_parents = 1,
+			.num_parents = ARRAY_SIZE(csixphy_timer_src),
 			.name = "csiphy1_timer_clk",
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -774,7 +774,7 @@ static struct clk_branch csiphy2_timer_clk = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.parent_names = csixphy_timer_src,
-			.num_parents = 1,
+			.num_parents = ARRAY_SIZE(csixphy_timer_src),
 			.name = "csiphy2_timer_clk",
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -836,7 +836,7 @@ static struct clk_dyn_rcg gfx2d0_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gfx2d0_src",
 			.parent_names = mmcc_pxo_pll8_pll2,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_dyn_rcg_ops,
 		},
 	},
@@ -896,7 +896,7 @@ static struct clk_dyn_rcg gfx2d1_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gfx2d1_src",
 			.parent_names = mmcc_pxo_pll8_pll2,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_dyn_rcg_ops,
 		},
 	},
@@ -997,7 +997,7 @@ static struct clk_dyn_rcg gfx3d_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gfx3d_src",
 			.parent_names = mmcc_pxo_pll8_pll2_pll3,
-			.num_parents = 4,
+			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2_pll3),
 			.ops = &clk_dyn_rcg_ops,
 		},
 	},
@@ -1006,7 +1006,7 @@ static struct clk_dyn_rcg gfx3d_src = {
 static const struct clk_init_data gfx3d_8064_init = {
 	.name = "gfx3d_src",
 	.parent_names = mmcc_pxo_pll8_pll2_pll15,
-	.num_parents = 4,
+	.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2_pll15),
 	.ops = &clk_dyn_rcg_ops,
 };
 
@@ -1075,7 +1075,7 @@ static struct clk_dyn_rcg vcap_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "vcap_src",
 			.parent_names = mmcc_pxo_pll8_pll2,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_dyn_rcg_ops,
 		},
 	},
@@ -1154,7 +1154,7 @@ static struct clk_rcg ijpeg_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "ijpeg_src",
 			.parent_names = mmcc_pxo_pll8_pll2,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_rcg_ops,
 		},
 	},
@@ -1202,7 +1202,7 @@ static struct clk_rcg jpegd_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "jpegd_src",
 			.parent_names = mmcc_pxo_pll8_pll2,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_rcg_ops,
 		},
 	},
@@ -1282,7 +1282,7 @@ static struct clk_dyn_rcg mdp_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "mdp_src",
 			.parent_names = mmcc_pxo_pll8_pll2,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_dyn_rcg_ops,
 		},
 	},
@@ -1381,7 +1381,7 @@ static struct clk_dyn_rcg rot_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "rot_src",
 			.parent_names = mmcc_pxo_pll8_pll2,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_dyn_rcg_ops,
 		},
 	},
@@ -1444,7 +1444,7 @@ static struct clk_rcg tv_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "tv_src",
 			.parent_names = mmcc_pxo_hdmi,
-			.num_parents = 2,
+			.num_parents = ARRAY_SIZE(mmcc_pxo_hdmi),
 			.ops = &clk_rcg_bypass_ops,
 			.flags = CLK_SET_RATE_PARENT,
 		},
@@ -1461,7 +1461,7 @@ static struct clk_branch tv_enc_clk = {
 		.enable_mask = BIT(8),
 		.hw.init = &(struct clk_init_data){
 			.parent_names = tv_src_name,
-			.num_parents = 1,
+			.num_parents = ARRAY_SIZE(tv_src_name),
 			.name = "tv_enc_clk",
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1477,7 +1477,7 @@ static struct clk_branch tv_dac_clk = {
 		.enable_mask = BIT(10),
 		.hw.init = &(struct clk_init_data){
 			.parent_names = tv_src_name,
-			.num_parents = 1,
+			.num_parents = ARRAY_SIZE(tv_src_name),
 			.name = "tv_dac_clk",
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1493,7 +1493,7 @@ static struct clk_branch mdp_tv_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.parent_names = tv_src_name,
-			.num_parents = 1,
+			.num_parents = ARRAY_SIZE(tv_src_name),
 			.name = "mdp_tv_clk",
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1509,7 +1509,7 @@ static struct clk_branch hdmi_tv_clk = {
 		.enable_mask = BIT(12),
 		.hw.init = &(struct clk_init_data){
 			.parent_names = tv_src_name,
-			.num_parents = 1,
+			.num_parents = ARRAY_SIZE(tv_src_name),
 			.name = "hdmi_tv_clk",
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1525,7 +1525,7 @@ static struct clk_branch rgb_tv_clk = {
 		.enable_mask = BIT(14),
 		.hw.init = &(struct clk_init_data){
 			.parent_names = tv_src_name,
-			.num_parents = 1,
+			.num_parents = ARRAY_SIZE(tv_src_name),
 			.name = "rgb_tv_clk",
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1541,7 +1541,7 @@ static struct clk_branch npl_tv_clk = {
 		.enable_mask = BIT(16),
 		.hw.init = &(struct clk_init_data){
 			.parent_names = tv_src_name,
-			.num_parents = 1,
+			.num_parents = ARRAY_SIZE(tv_src_name),
 			.name = "npl_tv_clk",
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1615,7 +1615,7 @@ static struct clk_dyn_rcg vcodec_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "vcodec_src",
 			.parent_names = mmcc_pxo_pll8_pll2,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_dyn_rcg_ops,
 		},
 	},
@@ -1666,7 +1666,7 @@ static struct clk_rcg vpe_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "vpe_src",
 			.parent_names = mmcc_pxo_pll8_pll2,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_rcg_ops,
 		},
 	},
@@ -1734,7 +1734,7 @@ static struct clk_rcg vfe_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "vfe_src",
 			.parent_names = mmcc_pxo_pll8_pll2,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(mmcc_pxo_pll8_pll2),
 			.ops = &clk_rcg_ops,
 		},
 	},
@@ -2068,7 +2068,7 @@ static struct clk_rcg dsi1_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "dsi1_src",
 			.parent_names = mmcc_pxo_dsi2_dsi1,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(mmcc_pxo_dsi2_dsi1),
 			.ops = &clk_rcg_bypass2_ops,
 			.flags = CLK_SET_RATE_PARENT,
 		},
@@ -2116,7 +2116,7 @@ static struct clk_rcg dsi2_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "dsi2_src",
 			.parent_names = mmcc_pxo_dsi2_dsi1,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(mmcc_pxo_dsi2_dsi1),
 			.ops = &clk_rcg_bypass2_ops,
 			.flags = CLK_SET_RATE_PARENT,
 		},
@@ -2155,7 +2155,7 @@ static struct clk_rcg dsi1_byte_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "dsi1_byte_src",
 			.parent_names = mmcc_pxo_dsi1_dsi2_byte,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(mmcc_pxo_dsi1_dsi2_byte),
 			.ops = &clk_rcg_bypass2_ops,
 			.flags = CLK_SET_RATE_PARENT,
 		},
@@ -2194,7 +2194,7 @@ static struct clk_rcg dsi2_byte_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "dsi2_byte_src",
 			.parent_names = mmcc_pxo_dsi1_dsi2_byte,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(mmcc_pxo_dsi1_dsi2_byte),
 			.ops = &clk_rcg_bypass2_ops,
 			.flags = CLK_SET_RATE_PARENT,
 		},
@@ -2233,7 +2233,7 @@ static struct clk_rcg dsi1_esc_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "dsi1_esc_src",
 			.parent_names = mmcc_pxo_dsi1_dsi2_byte,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(mmcc_pxo_dsi1_dsi2_byte),
 			.ops = &clk_rcg_esc_ops,
 		},
 	},
@@ -2271,7 +2271,7 @@ static struct clk_rcg dsi2_esc_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "dsi2_esc_src",
 			.parent_names = mmcc_pxo_dsi1_dsi2_byte,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(mmcc_pxo_dsi1_dsi2_byte),
 			.ops = &clk_rcg_esc_ops,
 		},
 	},
@@ -2318,7 +2318,7 @@ static struct clk_rcg dsi1_pixel_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "dsi1_pixel_src",
 			.parent_names = mmcc_pxo_dsi2_dsi1,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(mmcc_pxo_dsi2_dsi1),
 			.ops = &clk_rcg_pixel_ops,
 		},
 	},
@@ -2365,7 +2365,7 @@ static struct clk_rcg dsi2_pixel_src = {
 		.hw.init = &(struct clk_init_data){
 			.name = "dsi2_pixel_src",
 			.parent_names = mmcc_pxo_dsi2_dsi1,
-			.num_parents = 3,
+			.num_parents = ARRAY_SIZE(mmcc_pxo_dsi2_dsi1),
 			.ops = &clk_rcg_pixel_ops,
 		},
 	},
-- 
2.35.1

