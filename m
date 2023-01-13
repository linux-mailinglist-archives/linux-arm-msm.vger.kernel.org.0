Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B81F66696AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 13:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233011AbjAMMNv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 07:13:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240570AbjAMMNA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 07:13:00 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 953D2809AE
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 04:07:23 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bp15so32815960lfb.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 04:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CN2PzcM58W6wCGs0BEmJi5Hn2KBihcYIZ9Wr9XB+HPc=;
        b=ldvyTHH9Mo/tG/nreLsDP83Fwr4FbLJidBMUNtEp1UIW7zuvQjbhGOQY91b4mlDSCN
         ROGGpGqIdTh5Nzo6y2fSlACcmXS15m9fPAer5M0EVvCEIGB9A/yh53+fUnbGluh+QvZZ
         lX7b1WOsRk5m6c0UM4Y6P1ugxgf97ClAyplEh15nTY+50STytIn703Kd2UHkByinaWrB
         CkonhBLKfrdTDXIXLPb3NVRQmuwn5GIGrb58o3gNIAYS65h92Gg0zAJ4YbCvS2MyIZ/I
         VSAiSdw3paT/ZmPq7H9qsaJXgXdPSKFgOfcYZZ5PZ2swSG0Oi1M0ydr+Cogp/49EIekD
         1clA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CN2PzcM58W6wCGs0BEmJi5Hn2KBihcYIZ9Wr9XB+HPc=;
        b=g6ViZb1cP1bNOHyipG9ReoOHt1fBudNY6/IvUDkrwz0Z5AZ9nxEJ9u4iLpZPAYBvKi
         GNaJ8gnftTkfcFXvuKVt+H7YsE4FZYbJrUDARVZ2a5UhQzw5mLLfIOlgwUOs2lMEu0Uq
         9a4PxSJ85IS0HUDGIJPWRJMip0zOG/rgZg/QVTJk6R4nddHr4ND4gEKbdynlDU3xlWQ3
         +jYrp4Qh2LcGvvbMERPPBRSG3X/XcbCii5A4FTHHKvhwnUkzltm0ggdyuX666oESNmu7
         8Opqk+Ry8iceQQ5K6Kq0EMBXYiqyD4ejq9RHni7nq43ctiS5xRHntp3FJ7aU8N3+qw5M
         li4Q==
X-Gm-Message-State: AFqh2koxndy+7D9PG/0mu4/ytuENHGd0ncuT6DQ6oPz6HDc0lMtJ1pp+
        h7XksgvjiQgBzXfhFQgvKHNMlg==
X-Google-Smtp-Source: AMrXdXvJq5Lqoxh3IuY5LMBRtdSnfiQl6gneYQISPhacDhBqP0MVIay3QR1t910x+MwIjGnuctTfnQ==
X-Received: by 2002:a05:6512:1049:b0:4b6:edce:a192 with SMTP id c9-20020a056512104900b004b6edcea192mr26227516lfb.4.1673611643171;
        Fri, 13 Jan 2023 04:07:23 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.170.82.205])
        by smtp.gmail.com with ESMTPSA id i7-20020ac25227000000b004ac6a444b26sm3806290lfl.141.2023.01.13.04.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 04:07:22 -0800 (PST)
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
Subject: [PATCH v3 13/14] clk: qcom: cpu-8996: change setup sequence to follow vendor kernel
Date:   Fri, 13 Jan 2023 14:05:43 +0200
Message-Id: <20230113120544.59320-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
References: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
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

Add missing register writes to CPU clocks setup procedure. This makes it
follow the setup procedure used in msm-3.18 kernel.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index b99a47aca478..2253e11770b9 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -76,10 +76,16 @@ enum _pmux_input {
 #define PWRCL_REG_OFFSET 0x0
 #define PERFCL_REG_OFFSET 0x80000
 #define MUX_OFFSET	0x40
+#define CLK_CTL_OFFSET 0x44
+#define CLK_CTL_AUTO_CLK_SEL BIT(8)
 #define ALT_PLL_OFFSET	0x100
 #define SSSCTL_OFFSET 0x160
+#define PSCTL_OFFSET 0x164
 
 #define PMUX_MASK	0x3
+#define MUX_AUTO_CLK_SEL_ALWAYS_ON_MASK GENMASK(5, 4)
+#define MUX_AUTO_CLK_SEL_ALWAYS_ON_GPLL0_SEL \
+	FIELD_PREP(MUX_AUTO_CLK_SEL_ALWAYS_ON_MASK, 0x03)
 
 static const u8 prim_pll_regs[PLL_OFF_MAX_REGS] = {
 	[PLL_OFF_L_VAL] = 0x04,
@@ -439,6 +445,14 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
 	/* Ensure write goes through before PLLs are reconfigured */
 	udelay(5);
 
+	/* Set the auto clock sel always-on source to GPLL0/2 (300MHz) */
+	regmap_update_bits(regmap, PWRCL_REG_OFFSET + MUX_OFFSET,
+			   MUX_AUTO_CLK_SEL_ALWAYS_ON_MASK,
+			   MUX_AUTO_CLK_SEL_ALWAYS_ON_GPLL0_SEL);
+	regmap_update_bits(regmap, PERFCL_REG_OFFSET + MUX_OFFSET,
+			   MUX_AUTO_CLK_SEL_ALWAYS_ON_MASK,
+			   MUX_AUTO_CLK_SEL_ALWAYS_ON_GPLL0_SEL);
+
 	clk_alpha_pll_configure(&pwrcl_pll, regmap, &hfpll_config);
 	clk_alpha_pll_configure(&perfcl_pll, regmap, &hfpll_config);
 	clk_alpha_pll_configure(&pwrcl_alt_pll, regmap, &altpll_config);
@@ -447,11 +461,24 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
 	/* Wait for PLL(s) to lock */
 	udelay(50);
 
+	/* Enable auto clock selection for both clusters */
+	regmap_update_bits(regmap, PWRCL_REG_OFFSET + CLK_CTL_OFFSET,
+			   CLK_CTL_AUTO_CLK_SEL, CLK_CTL_AUTO_CLK_SEL);
+	regmap_update_bits(regmap, PERFCL_REG_OFFSET + CLK_CTL_OFFSET,
+			   CLK_CTL_AUTO_CLK_SEL, CLK_CTL_AUTO_CLK_SEL);
+
+	/* Ensure write goes through before muxes are switched */
+	udelay(5);
+
 	qcom_cpu_clk_msm8996_acd_init(regmap);
 
+	/* Pulse swallower and soft-start settings */
+	regmap_write(regmap, PWRCL_REG_OFFSET + PSCTL_OFFSET, 0x00030005);
+	regmap_write(regmap, PERFCL_REG_OFFSET + PSCTL_OFFSET, 0x00030005);
+
 	/* Switch clusters to use the ACD leg */
-	regmap_write(regmap, PWRCL_REG_OFFSET + MUX_OFFSET, 0x2);
-	regmap_write(regmap, PERFCL_REG_OFFSET + MUX_OFFSET, 0x2);
+	regmap_write(regmap, PWRCL_REG_OFFSET + MUX_OFFSET, 0x32);
+	regmap_write(regmap, PERFCL_REG_OFFSET + MUX_OFFSET, 0x32);
 
 	for (i = 0; i < ARRAY_SIZE(cpu_msm8996_hw_clks); i++) {
 		ret = devm_clk_hw_register(dev, cpu_msm8996_hw_clks[i]);
-- 
2.39.0

