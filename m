Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 046E8656683
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Dec 2022 02:32:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232618AbiL0Bck (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Dec 2022 20:32:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232556AbiL0Bcg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Dec 2022 20:32:36 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 034BB5FB3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Dec 2022 17:32:33 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id g14so12453937ljh.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Dec 2022 17:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=adCyStuSpLrYDf/A/Jp9XZnHD9UXchIew8mJ4YhZhYU=;
        b=SCppH06qesBBJ0arKeBUwd+nU3E7YlINO4TlVZz/Pj5Fyk+FoCMHl0RWC2ibsJ9mDg
         hBDiIq8dOias2Aj7B2AL9XDVn9WzC43mXdfg7W5UolvlQ0hz+Pnpk8o6Uy2Tu1g+Ne8s
         QYvAXv77wOIoafJ1WBcOQ1AO0zRzOclSpPtdZjcuFgM6GhJtB9dq4JzEMjHHI5zI1Mso
         Br3XhAiJLrJ/ycKhuF8T2R2bWmf0l3vrN2kldiniy58/tE2s6QxYDcDPHeuUj1GQvPHN
         tbXCqLNSl1Z19hOx+0GNKEgmdkAr7iKfMK7yHVMjRQnBCszsTAP/KyY1Pyc24udm3yAI
         t6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=adCyStuSpLrYDf/A/Jp9XZnHD9UXchIew8mJ4YhZhYU=;
        b=AntKihmnhzUV3kbHxcQUVbIBKkPiAL/fXCUTMkvUMyshe9aNfwQAgBOSB6CBxbzWEE
         82xzw7RkM6yJ8hqEp3dhm5MlRSFoRtYz2nsgEJkXaeWP5tNa84yMMpX6CNjQNuGQgExT
         0OV/rHchrzERJ/s3ICaC9QOcstEpe9w+OY6uHWfrEDBPkogzFcCcVLIdw0BCWcZUABbf
         dCbva1Ow0lH4c/jGjqA8RJoZuP0ZZOSbEd9EYZ+lsHdSjR/f54uPEZbfVHhS15I8J70d
         XNKEmq/MPgdz0juf1fsbvO8t+Amzg8JsVJU5qnsI1qBRayy6uRrWweHXSffPhw/vYKFC
         SyHA==
X-Gm-Message-State: AFqh2krDTaFgVuqgtdCLADVpFt+a72U1u/Q5CALf8WSCZLCSL6z0BGon
        /yP2z0CrlBx8DVVj6NnBt1m2BQ==
X-Google-Smtp-Source: AMrXdXuglmsg0eFYdtOiSGURTbFMyoHzfSdZf5fyurjB8+EiCNaTA2jcTEh0KE1UepNK2v7kqevGfA==
X-Received: by 2002:a2e:9d0c:0:b0:279:ea3b:46d5 with SMTP id t12-20020a2e9d0c000000b00279ea3b46d5mr5178992lji.22.1672104753488;
        Mon, 26 Dec 2022 17:32:33 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v6-20020a2e87c6000000b0027fbb12aa53sm674752ljj.20.2022.12.26.17.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 17:32:32 -0800 (PST)
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
Subject: [RFC PATCH 09/12] clk: qcom: mmcc-apq8084: move clock parent tables down
Date:   Tue, 27 Dec 2022 03:32:22 +0200
Message-Id: <20221227013225.2847382-10-dmitry.baryshkov@linaro.org>
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

Move clock parent tables down, after the PLL declrataions, so that we
can use pll hw clock fields in the next commit.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/mmcc-apq8084.c | 200 ++++++++++++++++----------------
 1 file changed, 100 insertions(+), 100 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-apq8084.c b/drivers/clk/qcom/mmcc-apq8084.c
index 4acbcb43927f..fee7c767132d 100644
--- a/drivers/clk/qcom/mmcc-apq8084.c
+++ b/drivers/clk/qcom/mmcc-apq8084.c
@@ -40,6 +40,106 @@ enum {
 	P_MMSLEEP,
 };
 
+static struct clk_pll mmpll0 = {
+	.l_reg = 0x0004,
+	.m_reg = 0x0008,
+	.n_reg = 0x000c,
+	.config_reg = 0x0014,
+	.mode_reg = 0x0000,
+	.status_reg = 0x001c,
+	.status_bit = 17,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "mmpll0",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
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
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "mmpll1",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
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
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "mmpll2",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
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
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "mmpll3",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_pll mmpll4 = {
+	.l_reg = 0x00a4,
+	.m_reg = 0x00a8,
+	.n_reg = 0x00ac,
+	.config_reg = 0x00b0,
+	.mode_reg = 0x0080,
+	.status_reg = 0x00bc,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "mmpll4",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
 static const struct parent_map mmcc_xo_mmpll0_mmpll1_gpll0_map[] = {
 	{ P_XO, 0 },
 	{ P_MMPLL0, 1 },
@@ -212,106 +312,6 @@ static const char * const mmcc_xo_mmpll0_1_4_gpll1_0_sleep[] = {
 	"sleep_clk_src",
 };
 
-static struct clk_pll mmpll0 = {
-	.l_reg = 0x0004,
-	.m_reg = 0x0008,
-	.n_reg = 0x000c,
-	.config_reg = 0x0014,
-	.mode_reg = 0x0000,
-	.status_reg = 0x001c,
-	.status_bit = 17,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "mmpll0",
-		.parent_names = (const char *[]){ "xo" },
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
-	},
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
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "mmpll1",
-		.parent_names = (const char *[]){ "xo" },
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
-	},
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
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "mmpll2",
-		.parent_names = (const char *[]){ "xo" },
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
-	},
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
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "mmpll3",
-		.parent_names = (const char *[]){ "xo" },
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
-	},
-};
-
-static struct clk_pll mmpll4 = {
-	.l_reg = 0x00a4,
-	.m_reg = 0x00a8,
-	.n_reg = 0x00ac,
-	.config_reg = 0x00b0,
-	.mode_reg = 0x0080,
-	.status_reg = 0x00bc,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "mmpll4",
-		.parent_names = (const char *[]){ "xo" },
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
-	},
-};
-
 static struct clk_rcg2 mmss_ahb_clk_src = {
 	.cmd_rcgr = 0x5000,
 	.hid_width = 5,
-- 
2.35.1

