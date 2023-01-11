Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07D6366647A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 21:05:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238657AbjAKUFl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 15:05:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239504AbjAKUFL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 15:05:11 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBA5243DBF
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 12:01:36 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bp15so25177961lfb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 12:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgj0Y0zyXFwxRkV/6Hy2GDiojJliRCwujI01Gy8nXog=;
        b=HPWNFQ/rUjMNTJS80QxTyWlEQ2lp/W6uiT4eHLTqToNAo7yu6sCZ3LN0Uirv1Qzn8D
         ii3+uSeu3P6UVuRtzeOfX8b0hQaFwBaj28bftwrfSjibR+RuE9TrBH1DciL6fo/CCFoE
         uZGS85RVwIDcUV3wnHO4Z5WcnZQYes5ORWj+Jllk4KeJ0VjoJfjaQB8Ik3YDpTtOVPMX
         t+b0SlCcYRHulL1ln1aXC0z8MrpCCVYYrR75N8UjbWO3f248OADbcsNfC1H/N1oN0zq/
         iTNDcb9WYF7nSv/YPB98NFM/ACATQ3YxpNQr4OMbbP2TZkjmzbNpneGshobkQztD20lb
         v/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mgj0Y0zyXFwxRkV/6Hy2GDiojJliRCwujI01Gy8nXog=;
        b=ufXgZMOqEAbJC28/Qr21EMfR1C9frN+i4vnATz+5mVUGxSqeJSyLGLiU8/m8XlZVgY
         x5LsehjRQlaRcysG9TWdhrd74P3GcdwywX6zPIC+JEP8e+AqgfM71qQu7U5MaNINMgkQ
         Eowb9gBloOUItnljLgcJxQuifoR0fI+KOIiUMOmkcm0A5lx3mA1D81s+X0O/OxtHuwbb
         47B5V0AeWzn+T83sIZaP69O88ZwAwvG7cL8hWJHXPZW90ppcQba0CXLGjsb9BM27UALt
         hsaUNdRFueeZUVJ0GKLOIwA9qsRKaMD4D/2dxmForNiIyIo4fUn93EkGYvXUkbZ52VIg
         eVeA==
X-Gm-Message-State: AFqh2krnUWiBLo0O+RqxN2weG8UvNznqI2SxqAnJamMH8i6+cu3haEOs
        blTVE3ETdvfODHWxa+6A8RCqTg==
X-Google-Smtp-Source: AMrXdXto6yuzAqiVpxMSLy5LppR5sqcC57QdrTTjp8I/cXJ0AuRLok3WczQnLFTHMjt3JYK9a7SdRA==
X-Received: by 2002:a05:6512:340d:b0:4b5:69f1:61b1 with SMTP id i13-20020a056512340d00b004b569f161b1mr20884604lfr.42.1673467295246;
        Wed, 11 Jan 2023 12:01:35 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v20-20020a05651203b400b004b4e6dab30esm2881437lfp.222.2023.01.11.12.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 12:01:34 -0800 (PST)
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
Subject: [PATCH v2 09/14] clk: qcom: cpu-8996: move qcom_cpu_clk_msm8996_acd_init call
Date:   Wed, 11 Jan 2023 23:01:23 +0300
Message-Id: <20230111200128.2593359-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111200128.2593359-1-dmitry.baryshkov@linaro.org>
References: <20230111200128.2593359-1-dmitry.baryshkov@linaro.org>
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

Initialize ACD configuration from qcom_cpu_clk_msm8996_register_clks(),
before registering all clocks. This way we can be sure that the clock is
fully configured before letting CCF touch it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index e390f4aadff1..571ed52b3026 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -425,6 +425,8 @@ static struct clk_regmap *cpu_msm8996_clks[] = {
 	&perfcl_pmux.clkr,
 };
 
+static void qcom_cpu_clk_msm8996_acd_init(struct regmap *regmap);
+
 static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
 					      struct regmap *regmap)
 {
@@ -435,6 +437,8 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
 	clk_alpha_pll_configure(&pwrcl_alt_pll, regmap, &altpll_config);
 	clk_alpha_pll_configure(&perfcl_alt_pll, regmap, &altpll_config);
 
+	qcom_cpu_clk_msm8996_acd_init(regmap);
+
 	for (i = 0; i < ARRAY_SIZE(cpu_msm8996_hw_clks); i++) {
 		ret = devm_clk_hw_register(dev, cpu_msm8996_hw_clks[i]);
 		if (ret)
@@ -467,9 +471,8 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
 #define L2ACDSSCR_REG 0x589ULL
 
 static DEFINE_SPINLOCK(qcom_clk_acd_lock);
-static void __iomem *base;
 
-static void qcom_cpu_clk_msm8996_acd_init(void __iomem *base)
+static void qcom_cpu_clk_msm8996_acd_init(struct regmap *regmap)
 {
 	u64 hwid;
 	u32 val;
@@ -488,13 +491,13 @@ static void qcom_cpu_clk_msm8996_acd_init(void __iomem *base)
 	kryo_l2_set_indirect_reg(L2ACDSSCR_REG, 0x00000601);
 
 	if (PWRCL_CPU_REG_MASK == (hwid | PWRCL_CPU_REG_MASK)) {
-		writel(0xf, base + PWRCL_REG_OFFSET + SSSCTL_OFFSET);
+		regmap_write(regmap, PWRCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
 		kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
 	}
 
 	if (PERFCL_CPU_REG_MASK == (hwid | PERFCL_CPU_REG_MASK)) {
 		kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
-		writel(0xf, base + PERFCL_REG_OFFSET + SSSCTL_OFFSET);
+		regmap_write(regmap, PERFCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
 	}
 
 out:
@@ -509,7 +512,7 @@ static int cpu_clk_notifier_cb(struct notifier_block *nb, unsigned long event,
 
 	switch (event) {
 	case PRE_RATE_CHANGE:
-		qcom_cpu_clk_msm8996_acd_init(base);
+		qcom_cpu_clk_msm8996_acd_init(cpuclk->clkr.regmap);
 
 		/*
 		 * Avoid overvolting. clk_core_set_rate_nolock() walks from top
@@ -538,6 +541,7 @@ static int cpu_clk_notifier_cb(struct notifier_block *nb, unsigned long event,
 
 static int qcom_cpu_clk_msm8996_driver_probe(struct platform_device *pdev)
 {
+	static void __iomem *base;
 	struct regmap *regmap;
 	struct clk_hw_onecell_data *data;
 	struct device *dev = &pdev->dev;
@@ -559,8 +563,6 @@ static int qcom_cpu_clk_msm8996_driver_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	qcom_cpu_clk_msm8996_acd_init(base);
-
 	data->hws[0] = &pwrcl_pmux.clkr.hw;
 	data->hws[1] = &perfcl_pmux.clkr.hw;
 	data->num = 2;
-- 
2.30.2

