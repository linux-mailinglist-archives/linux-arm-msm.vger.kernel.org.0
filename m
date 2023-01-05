Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C14365ED77
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jan 2023 14:42:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233371AbjAENls (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Jan 2023 08:41:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232763AbjAENlp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Jan 2023 08:41:45 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA16CDE83
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jan 2023 05:41:42 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id bq39so47262907lfb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jan 2023 05:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Yy+eMAvWavBfxfek1Yv32EJTJXddeULEG32lfUcRIs=;
        b=rDo1MmrMgp7QElHg3UhnJSMeqfhdOZs2d5AGk7PPi8lg4zvP6DmYELCfvljO52J8Mq
         Efj4WoV8qsQjXOwXKcQ9EDOu7mEIDkidvGD/8OBEThhNqzHczoVi4kgzj6RKIbJkz43F
         cTTjj7YIAdIZ5nd4BLoxc8pALormndTjTElOwDhG1AjNTX6bwA45phdDVgdn3nZizHH5
         KiM8NxjqDo2ZhGNml/nnpDxP1s3ABgmgsGKkxWphRvqrMPOtk3ngin049lReUl4nsZjx
         kM+/ktXW6TuuQxvXWJWh+N/6F97d5ex77zyqh+yqD3J8BiplTEqI8FuvDu5YW9mE6Jta
         9tWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Yy+eMAvWavBfxfek1Yv32EJTJXddeULEG32lfUcRIs=;
        b=nqeY65sDxt9vJW+R5dCZHokSWLKdD5KPn47vZOIBsFoxlsTHtuaeH9Hv/+7JhickNv
         5aVllDk627+RtMw+QcHVqvJvxrrjTwC8989uRI99qfuI4mcDD9ZiWWM5mTvjHGZZnJTI
         BhVDZv2Fle5eMVrs2NWnVa7lQuca7uXOWTKY6OxP4/mgWyf+dJAc1lmobomwfYjTCHbo
         Env3/xohkpn/hOA617dErE1wcbkNnjXgYjGloXYC7PYIpV+fmd6J8Gi0dIgcMLJ3uV5x
         RTAhNkUHtxnBV+kw6aMx4Io1qy6jWvwjdL0ehQvM7jH19HkVuahfpjK+ZuVjWyraGe5l
         fHJw==
X-Gm-Message-State: AFqh2krlS3sCMhs3bG8Sq/xLZgVfvkOEV5rObrSL+T8RJAL3XhqUZ5Xs
        bEXAUfp9UMw2bLbRmSQo9DNt4Ef6LRCoPJT9
X-Google-Smtp-Source: AMrXdXtNt96E9AKQjjUkIeCI/SvM1pQsyF/QUyjHg5H5BuMdqAqCcOHzNtUE7Sx2D8gUT9kUeYwu6g==
X-Received: by 2002:a05:6512:10d1:b0:4a4:68b8:f4da with SMTP id k17-20020a05651210d100b004a468b8f4damr16360968lfg.32.1672926101333;
        Thu, 05 Jan 2023 05:41:41 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id bq25-20020a056512151900b004b592043413sm5461315lfb.12.2023.01.05.05.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 05:41:40 -0800 (PST)
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
Subject: [PATCH v2 09/12] clk: qcom: mmcc-apq8084: move clock parent tables down
Date:   Thu,  5 Jan 2023 15:41:30 +0200
Message-Id: <20230105134133.1550618-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105134133.1550618-1-dmitry.baryshkov@linaro.org>
References: <20230105134133.1550618-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
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
2.39.0

