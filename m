Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A4306696B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 13:14:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbjAMMO3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 07:14:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241131AbjAMMMt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 07:12:49 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D0D18063B
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 04:07:16 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id bq39so32879585lfb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 04:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OWtr3DFJJQf72yrPQBzeCk1JOA6Sdo54gcc/AJ5i2xI=;
        b=wNCH57Vpt+VmsKwMJVSCoVfxPB2PDmHFoSocF7TPJXm+IZIKsAvlF1Z+9UYhaFSH3W
         zYC2wcAiWzU09RCNZHVVLepcwjOO1c6a3tJkaUIWBiaic/YlShJOc3daO8G4yEYh4Qcu
         2YKfNw5gHest9GRIqMGI+00BchO0o07jQ5BNStQESSXARRqsCWgntMEPloahpMnyWMrq
         bSNG87qZHtNjXuY8tiVFs8T7cUA8kjq8NXQxaxcyCnfV945ogU5vXGlM2Av3mbHkHCCk
         kmFP4Lqp1fL/9vU21gk52+jbofSx5cGqrXl6p+u/9EBBafnOnVX8kp1MzRlNMn9ccBWM
         FSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OWtr3DFJJQf72yrPQBzeCk1JOA6Sdo54gcc/AJ5i2xI=;
        b=yYG7yYGb17q4I739vjhTRaXi5ydgpO+a3IGHP2kCzJ8UZOZ4ZDPfpmxzW09r027Ai2
         15qM15kYkF68ek3nHgjR2IeeGD62cVfiUXkJDFzPfA7/STgMGvI7YC2Qp8E3LraNptFs
         hKt7awPqVeu/cfkREnoN57yR41Fdx27lN1TbBUGIiH1F3drpNg9j86hU1uJrpxbjMBUs
         YcJpCnMMj41lWMvl+P3Gyg7ChrQJAh89zTybZA8DOUng7BVxR4d9iH/tKB3CmijbdoEu
         96gEorK4EbnCiouFbDBP97ECrPQZ6dc6IUqmoIlzz8Ifef8un32qZQZKFiYbqkpK1yaC
         wY6A==
X-Gm-Message-State: AFqh2krcoiwtUB7mzYmigxXQuo98PPhsimGZzllH15PHPHLhSHVRGIU/
        UvhioktKTo8Rmm9BlU98ENy5jw==
X-Google-Smtp-Source: AMrXdXtScgOx3kkDaM3ITnGgRWVDsxCcYVL+GeOnvCsPpYeyVcnoUraqid+4g3meWGSAx4Zq7dY9vQ==
X-Received: by 2002:a05:6512:3c97:b0:4a5:42ba:d827 with SMTP id h23-20020a0565123c9700b004a542bad827mr24756052lfv.14.1673611634707;
        Fri, 13 Jan 2023 04:07:14 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.170.82.205])
        by smtp.gmail.com with ESMTPSA id i7-20020ac25227000000b004ac6a444b26sm3806290lfl.141.2023.01.13.04.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 04:07:14 -0800 (PST)
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
Subject: [PATCH v3 09/14] clk: qcom: cpu-8996: move qcom_cpu_clk_msm8996_acd_init call
Date:   Fri, 13 Jan 2023 14:05:39 +0200
Message-Id: <20230113120544.59320-10-dmitry.baryshkov@linaro.org>
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

Initialize ACD configuration from qcom_cpu_clk_msm8996_register_clks(),
before registering all clocks. This way we can be sure that the clock is
fully configured before letting CCF touch it.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
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
2.39.0

