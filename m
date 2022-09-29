Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9EF65EF1C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 11:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235025AbiI2JV4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 05:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235374AbiI2JVy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 05:21:54 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AFB812FF13
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 02:21:51 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id k10so1341251lfm.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 02:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=VP/AAyYjw0Rr7hmFWioIleiT2CT56Mt2aJdhU6I1hPs=;
        b=xaC4VlDuMAgLGsoAUFws1IDuR5OD9DgKg6z25mzdnTYccnSckmwZKRHLJWrx8/XyKX
         JDoKcNftwBhf+tXjAIKSEbAFWx5ZC3qP21kNfakZ0QajJNZBKuRf+cBJWXAEb7kMyZ09
         Wy1Kqi4abXzn5DwLaY3UZLn7zE3YR04lidPe27BFdBA2WGbLKIn0gFqAcPbtatln+WX/
         U3aLiCh4onkZbS38aIpV7AiaGKEd5qTxuwE9JlEEy3uq2ea1F51VretXAHZow7hLYL3o
         j9HgLerAA/kGepgQOI9SDRbuEsO/zMwJpd9lkBHV8GitJuK9AyLRsWLVuwNe34xCzwoQ
         +aOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=VP/AAyYjw0Rr7hmFWioIleiT2CT56Mt2aJdhU6I1hPs=;
        b=VkZUB/KdVnCxVuKGQlGD8nnzQGoSxHSXw5+JQsscqq483QxAI6jqS0gc17jDHqCHp8
         MtxrjdHs6hpQUTdO+bn0qkR7e4lIVylkaATzPZzr122EKIVVAgey25ERgP7yoDx2a/E+
         8oyZpAu0KCnx5T15EZBz6piGYtrcyYi1gNfNi+OkPcIe66q8c1BqPwluOwqcOu7rzL/Y
         I1+enBIoKOzrZ+GV+0w9AR0gEfL4yTLxiQkZJgE6xZ+O+Fa+JqGTITAJUe9rVYh9tZtG
         zwJWy5DaRFxWIqBqwTZy3KC3HfCDfs6lK67kM5iYNpRGSa9njZ2dHfSrgj16FdHRy9Wg
         Ae5Q==
X-Gm-Message-State: ACrzQf3DO5bK1dE5bXSBlf4sZvKqGbp9URc0ikFDyUzTub1Us+ONJX02
        pV1yun1WL0xXjvCFcITVzE2BVA==
X-Google-Smtp-Source: AMsMyM72aiDawkkjydWi+UOdzFILB2Rwy9vjTkyr4O/Pq7hFWekkuP9LYBHopUrm3JHMS9/vabt+eA==
X-Received: by 2002:a05:6512:1522:b0:4a0:2dd4:bab3 with SMTP id bq34-20020a056512152200b004a02dd4bab3mr1035528lfb.130.1664443311355;
        Thu, 29 Sep 2022 02:21:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c22-20020a2e9496000000b0026c687f9f7bsm633271ljh.107.2022.09.29.02.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 02:21:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 07/11] clk: qcom: mmcc-msm8974: move clock parent tables down
Date:   Thu, 29 Sep 2022 12:21:41 +0300
Message-Id: <20220929092145.473009-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220929092145.473009-1-dmitry.baryshkov@linaro.org>
References: <20220929092145.473009-1-dmitry.baryshkov@linaro.org>
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

Move clock parent tables down, after the PLL declarataions, so that we
can use pll hw clock fields in the next commit.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/mmcc-msm8974.c | 170 ++++++++++++++++----------------
 1 file changed, 85 insertions(+), 85 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
index 9008df2305df..57f1a351c8f6 100644
--- a/drivers/clk/qcom/mmcc-msm8974.c
+++ b/drivers/clk/qcom/mmcc-msm8974.c
@@ -42,6 +42,91 @@ enum {
 	P_DSI1PLL_BYTE,
 };
 
+static struct clk_pll mmpll0 = {
+	.l_reg = 0x0004,
+	.m_reg = 0x0008,
+	.n_reg = 0x000c,
+	.config_reg = 0x0014,
+	.mode_reg = 0x0000,
+	.status_reg = 0x001c,
+	.status_bit = 17,
+        .clkr.hw.init = &(struct clk_init_data){
+                .name = "mmpll0",
+                .parent_names = (const char *[]){ "xo" },
+                .num_parents = 1,
+                .ops = &clk_pll_ops,
+        },
+};
+
+static struct clk_regmap mmpll0_vote = {
+	.enable_reg = 0x0100,
+	.enable_mask = BIT(0),
+	.hw.init = &(struct clk_init_data){
+		.name = "mmpll0_vote",
+		.parent_names = (const char *[]){ "mmpll0" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
+static struct clk_pll mmpll1 = {
+	.l_reg = 0x0044,
+	.m_reg = 0x0048,
+	.n_reg = 0x004c,
+	.config_reg = 0x0050,
+	.mode_reg = 0x0040,
+	.status_reg = 0x005c,
+	.status_bit = 17,
+        .clkr.hw.init = &(struct clk_init_data){
+                .name = "mmpll1",
+                .parent_names = (const char *[]){ "xo" },
+                .num_parents = 1,
+                .ops = &clk_pll_ops,
+        },
+};
+
+static struct clk_regmap mmpll1_vote = {
+	.enable_reg = 0x0100,
+	.enable_mask = BIT(1),
+	.hw.init = &(struct clk_init_data){
+		.name = "mmpll1_vote",
+		.parent_names = (const char *[]){ "mmpll1" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
+static struct clk_pll mmpll2 = {
+	.l_reg = 0x4104,
+	.m_reg = 0x4108,
+	.n_reg = 0x410c,
+	.config_reg = 0x4110,
+	.mode_reg = 0x4100,
+	.status_reg = 0x411c,
+        .clkr.hw.init = &(struct clk_init_data){
+                .name = "mmpll2",
+                .parent_names = (const char *[]){ "xo" },
+                .num_parents = 1,
+                .ops = &clk_pll_ops,
+        },
+};
+
+static struct clk_pll mmpll3 = {
+	.l_reg = 0x0084,
+	.m_reg = 0x0088,
+	.n_reg = 0x008c,
+	.config_reg = 0x0090,
+	.mode_reg = 0x0080,
+	.status_reg = 0x009c,
+	.status_bit = 17,
+        .clkr.hw.init = &(struct clk_init_data){
+                .name = "mmpll3",
+                .parent_names = (const char *[]){ "xo" },
+                .num_parents = 1,
+                .ops = &clk_pll_ops,
+        },
+};
+
 static const struct parent_map mmcc_xo_mmpll0_mmpll1_gpll0_map[] = {
 	{ P_XO, 0 },
 	{ P_MMPLL0, 1 },
@@ -160,91 +245,6 @@ static const char * const mmcc_xo_dsibyte_hdmi_edp_gpll0[] = {
 	"dsi1pllbyte",
 };
 
-static struct clk_pll mmpll0 = {
-	.l_reg = 0x0004,
-	.m_reg = 0x0008,
-	.n_reg = 0x000c,
-	.config_reg = 0x0014,
-	.mode_reg = 0x0000,
-	.status_reg = 0x001c,
-	.status_bit = 17,
-        .clkr.hw.init = &(struct clk_init_data){
-                .name = "mmpll0",
-                .parent_names = (const char *[]){ "xo" },
-                .num_parents = 1,
-                .ops = &clk_pll_ops,
-        },
-};
-
-static struct clk_regmap mmpll0_vote = {
-	.enable_reg = 0x0100,
-	.enable_mask = BIT(0),
-	.hw.init = &(struct clk_init_data){
-		.name = "mmpll0_vote",
-		.parent_names = (const char *[]){ "mmpll0" },
-		.num_parents = 1,
-		.ops = &clk_pll_vote_ops,
-	},
-};
-
-static struct clk_pll mmpll1 = {
-	.l_reg = 0x0044,
-	.m_reg = 0x0048,
-	.n_reg = 0x004c,
-	.config_reg = 0x0050,
-	.mode_reg = 0x0040,
-	.status_reg = 0x005c,
-	.status_bit = 17,
-        .clkr.hw.init = &(struct clk_init_data){
-                .name = "mmpll1",
-                .parent_names = (const char *[]){ "xo" },
-                .num_parents = 1,
-                .ops = &clk_pll_ops,
-        },
-};
-
-static struct clk_regmap mmpll1_vote = {
-	.enable_reg = 0x0100,
-	.enable_mask = BIT(1),
-	.hw.init = &(struct clk_init_data){
-		.name = "mmpll1_vote",
-		.parent_names = (const char *[]){ "mmpll1" },
-		.num_parents = 1,
-		.ops = &clk_pll_vote_ops,
-	},
-};
-
-static struct clk_pll mmpll2 = {
-	.l_reg = 0x4104,
-	.m_reg = 0x4108,
-	.n_reg = 0x410c,
-	.config_reg = 0x4110,
-	.mode_reg = 0x4100,
-	.status_reg = 0x411c,
-        .clkr.hw.init = &(struct clk_init_data){
-                .name = "mmpll2",
-                .parent_names = (const char *[]){ "xo" },
-                .num_parents = 1,
-                .ops = &clk_pll_ops,
-        },
-};
-
-static struct clk_pll mmpll3 = {
-	.l_reg = 0x0084,
-	.m_reg = 0x0088,
-	.n_reg = 0x008c,
-	.config_reg = 0x0090,
-	.mode_reg = 0x0080,
-	.status_reg = 0x009c,
-	.status_bit = 17,
-        .clkr.hw.init = &(struct clk_init_data){
-                .name = "mmpll3",
-                .parent_names = (const char *[]){ "xo" },
-                .num_parents = 1,
-                .ops = &clk_pll_ops,
-        },
-};
-
 static struct clk_rcg2 mmss_ahb_clk_src = {
 	.cmd_rcgr = 0x5000,
 	.hid_width = 5,
-- 
2.35.1

