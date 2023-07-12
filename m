Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC8A7507B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jul 2023 14:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232777AbjGLML5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 08:11:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232894AbjGLML4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 08:11:56 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DBE2100
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 05:11:53 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fb73ba3b5dso11230669e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 05:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689163912; x=1691755912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qyV0+Npg+ldHLypErOjheTdkIjwUmedLsHu5ro4khZQ=;
        b=iZTvWyXwKefrs/gWaxeLjsB4SJQv8/chLBK7Fc5SaKXKLwbv4i8Ee1mQD0U9kVXTHW
         pQJur6LkLZdBuEzXWkMOTjWbYM5idIEgaJseVMzyarZl43QDcb20QzGU91/fWo2c2J6z
         rbCdyVZ5HXDnW5auNyD0G9V0Oba3qSSs2GWGzNOa/4E9DYLSojKTqyJRv2Qut5Itdl6r
         9XwA7n/u7a5DSg3E5JAuCirniI5AY4Oc9HMH+bQyA+xiJRpSqR9g5WQULhcYVjwweHFY
         zr9OyK6XTsl6o72yMjzDyNJ5brnLzxGoGmWiQxkmVyqcg1pQxvhSDzt1q4Vb2MaZL761
         CBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689163912; x=1691755912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qyV0+Npg+ldHLypErOjheTdkIjwUmedLsHu5ro4khZQ=;
        b=Um02L8eddAF8R2dfpDtjYkFdjT9tGVNw0z9RuHTSLMy181/ttZINrwj46w/K6o3qid
         tJdYFt++Wub3WRGQ/2/6DqPHjQFoJkbZyDfZZDNUZGlTumZZGqwhGf7I2HY039H+tLxi
         WW/d72rnkOS9CPzRECyhfsVgwfFz/aaRie9RigtzAdCdLOAyiovpJXkGNV7me/1PKTqk
         wGjxFayb1fYm4Na0l48E8fUYPs7SAsGjmj95bUKYZGKqhOzKXNnH/DQpABdx412Mdcts
         UBhrydaufMh2pskSUgijr4t2YcDc1g5qmpleurUwGhE0T5h0FjItT5gIapcnQ09D2efU
         xoJQ==
X-Gm-Message-State: ABy/qLarY234aua9TNmjUrL1FlD8EMm/YIz02lyTpPoBzIkd2vp15ONW
        jozx/axL9V/um8csszJsSEP8tg==
X-Google-Smtp-Source: APBJJlGzhlyvuLzBg2q+ajIwIRjr/XqGv3G33g9PA25vT4v9H0mvGKAEXyPAFCbIlwlu5/81kKrXWA==
X-Received: by 2002:a2e:9959:0:b0:2b6:d495:9467 with SMTP id r25-20020a2e9959000000b002b6d4959467mr15212771ljj.6.1689163912093;
        Wed, 12 Jul 2023 05:11:52 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id p14-20020a2ea40e000000b002b6c8cf48bfsm913135ljn.104.2023.07.12.05.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 05:11:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 7/8] drm/msm/mdss: Handle the reg bus ICC path
Date:   Wed, 12 Jul 2023 15:11:44 +0300
Message-Id: <20230712121145.1994830-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
References: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
another path that needs to be handled to ensure MDSS functions properly,
namely the "reg bus", a.k.a the CPU-MDSS interconnect.

Gating that path may have a variety of effects, from none to otherwise
inexplicable DSI timeouts.

Provide a way for MDSS driver to vote on this bus.

A note regarding vote values. Newer platforms have corresponding
bandwidth values in the vendor DT files. For the older platforms there
was a static vote in the mdss_mdp and rotator drivers. I choose to be
conservative here and choose this value as a default.

Co-developed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 51 +++++++++++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index b7765e63d549..ee31a9ab88d4 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -26,6 +26,8 @@
 
 #define MIN_IB_BW	400000000UL /* Min ib vote 400MB */
 
+#define DEFAULT_REG_BW	153600000UL /* Used in mdss fbdev driver */
+
 struct msm_mdss_data {
 	u32 ubwc_version;
 	/* can be read from register 0x58 */
@@ -34,6 +36,8 @@ struct msm_mdss_data {
 	u32 ubwc_static;
 	u32 highest_bank_bit;
 	u32 macrotile_mode;
+
+	unsigned long reg_bus_bw;
 };
 
 struct msm_mdss {
@@ -50,6 +54,7 @@ struct msm_mdss {
 	const struct msm_mdss_data *mdss_data;
 	struct icc_path *mdp_path[2];
 	u32 num_mdp_paths;
+	struct icc_path *reg_bus_path;
 };
 
 static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
@@ -57,6 +62,7 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 {
 	struct icc_path *path0;
 	struct icc_path *path1;
+	struct icc_path *reg_bus_path;
 
 	path0 = devm_of_icc_get(dev, "mdp0-mem");
 	if (IS_ERR_OR_NULL(path0))
@@ -71,6 +77,10 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 		msm_mdss->num_mdp_paths++;
 	}
 
+	reg_bus_path = of_icc_get(dev, "cpu-cfg");
+	if (!IS_ERR_OR_NULL(reg_bus_path))
+		msm_mdss->reg_bus_path = reg_bus_path;
+
 	return 0;
 }
 
@@ -231,6 +241,13 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
 		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(MIN_IB_BW));
 
+	if (msm_mdss->mdss_data && msm_mdss->mdss_data->reg_bus_bw)
+		icc_set_bw(msm_mdss->reg_bus_path, 0,
+			   Bps_to_icc(msm_mdss->mdss_data->reg_bus_bw));
+	else
+		icc_set_bw(msm_mdss->reg_bus_path, 0,
+			   Bps_to_icc(DEFAULT_REG_BW));
+
 	ret = clk_bulk_prepare_enable(msm_mdss->num_clocks, msm_mdss->clocks);
 	if (ret) {
 		dev_err(msm_mdss->dev, "clock enable failed, ret:%d\n", ret);
@@ -288,6 +305,9 @@ static int msm_mdss_disable(struct msm_mdss *msm_mdss)
 	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
 		icc_set_bw(msm_mdss->mdp_path[i], 0, 0);
 
+	if (msm_mdss->reg_bus_path)
+		icc_set_bw(msm_mdss->reg_bus_path, 0, 0);
+
 	return 0;
 }
 
@@ -374,6 +394,8 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
 	if (!msm_mdss)
 		return ERR_PTR(-ENOMEM);
 
+	msm_mdss->mdss_data = of_device_get_match_data(&pdev->dev);
+
 	msm_mdss->mmio = devm_platform_ioremap_resource_byname(pdev, is_mdp5 ? "mdss_phys" : "mdss");
 	if (IS_ERR(msm_mdss->mmio))
 		return ERR_CAST(msm_mdss->mmio);
@@ -464,8 +486,6 @@ static int mdss_probe(struct platform_device *pdev)
 	if (IS_ERR(mdss))
 		return PTR_ERR(mdss);
 
-	mdss->mdss_data = of_device_get_match_data(&pdev->dev);
-
 	platform_set_drvdata(pdev, mdss);
 
 	/*
@@ -499,11 +519,13 @@ static const struct msm_mdss_data msm8998_data = {
 	.ubwc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
 	.highest_bank_bit = 1,
+	.reg_bus_bw = 76800 * 1000,
 };
 
 static const struct msm_mdss_data qcm2290_data = {
 	/* no UBWC */
 	.highest_bank_bit = 0x2,
+	.reg_bus_bw = 76800 * 1000,
 };
 
 static const struct msm_mdss_data sc7180_data = {
@@ -511,6 +533,7 @@ static const struct msm_mdss_data sc7180_data = {
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_static = 0x1e,
 	.highest_bank_bit = 0x3,
+	.reg_bus_bw = 76800 * 1000,
 };
 
 static const struct msm_mdss_data sc7280_data = {
@@ -520,6 +543,7 @@ static const struct msm_mdss_data sc7280_data = {
 	.ubwc_static = 1,
 	.highest_bank_bit = 1,
 	.macrotile_mode = 1,
+	.reg_bus_bw = 74000 * 1000,
 };
 
 static const struct msm_mdss_data sc8180x_data = {
@@ -527,6 +551,7 @@ static const struct msm_mdss_data sc8180x_data = {
 	.ubwc_dec_version = UBWC_3_0,
 	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
+	.reg_bus_bw = 76800 * 1000,
 };
 
 static const struct msm_mdss_data sc8280xp_data = {
@@ -536,12 +561,14 @@ static const struct msm_mdss_data sc8280xp_data = {
 	.ubwc_static = 1,
 	.highest_bank_bit = 2,
 	.macrotile_mode = 1,
+	.reg_bus_bw = 76800 * 1000,
 };
 
 static const struct msm_mdss_data sdm845_data = {
 	.ubwc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.highest_bank_bit = 2,
+	.reg_bus_bw = 76800 * 1000,
 };
 
 static const struct msm_mdss_data sm6350_data = {
@@ -550,12 +577,14 @@ static const struct msm_mdss_data sm6350_data = {
 	.ubwc_swizzle = 6,
 	.ubwc_static = 0x1e,
 	.highest_bank_bit = 1,
+	.reg_bus_bw = 76800 * 1000,
 };
 
 static const struct msm_mdss_data sm8150_data = {
 	.ubwc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
 	.highest_bank_bit = 2,
+	.reg_bus_bw = 76800 * 1000,
 };
 
 static const struct msm_mdss_data sm6115_data = {
@@ -564,6 +593,7 @@ static const struct msm_mdss_data sm6115_data = {
 	.ubwc_swizzle = 7,
 	.ubwc_static = 0x11f,
 	.highest_bank_bit = 0x1,
+	.reg_bus_bw = 76800 * 1000,
 };
 
 static const struct msm_mdss_data sm8250_data = {
@@ -574,6 +604,18 @@ static const struct msm_mdss_data sm8250_data = {
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
+	.reg_bus_bw = 76800 * 1000,
+};
+
+static const struct msm_mdss_data sm8350_data = {
+	.ubwc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_0,
+	.ubwc_swizzle = 6,
+	.ubwc_static = 1,
+	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+	.highest_bank_bit = 3,
+	.macrotile_mode = 1,
+	.reg_bus_bw = 74000 * 1000,
 };
 
 static const struct msm_mdss_data sm8550_data = {
@@ -584,6 +626,7 @@ static const struct msm_mdss_data sm8550_data = {
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
+	.reg_bus_bw = 57000 * 1000,
 };
 
 static const struct of_device_id mdss_dt_match[] = {
@@ -600,8 +643,8 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm6375-mdss", .data = &sm6350_data },
 	{ .compatible = "qcom,sm8150-mdss", .data = &sm8150_data },
 	{ .compatible = "qcom,sm8250-mdss", .data = &sm8250_data },
-	{ .compatible = "qcom,sm8350-mdss", .data = &sm8250_data },
-	{ .compatible = "qcom,sm8450-mdss", .data = &sm8250_data },
+	{ .compatible = "qcom,sm8350-mdss", .data = &sm8350_data },
+	{ .compatible = "qcom,sm8450-mdss", .data = &sm8350_data },
 	{ .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
 	{}
 };
-- 
2.40.1

