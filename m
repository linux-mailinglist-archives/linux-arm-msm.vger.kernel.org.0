Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B432A666397
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 20:20:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234740AbjAKTU3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 14:20:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232967AbjAKTUO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 14:20:14 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DEFC167C0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 11:20:13 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id s25so17073808lji.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 11:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgj0Y0zyXFwxRkV/6Hy2GDiojJliRCwujI01Gy8nXog=;
        b=l7E0FwuhXEHxPsz+ORE6IE3YjtYRU0nqWrBsePVaYLQg2VqulM9cFIbnhp2YXTXSSV
         FPpCaFs+nlwoDQlVOsl8PZyscv2WQwguJ8Q8D+An3Ffb0mtiHoOnpS1UHudgl8q7k6uI
         fe6YO7+6M9ShpIa50SzwenyEg5Ayp23NktDkMnjLV0pFf0PKNqq+QO32V0NrlPBoFUus
         qJrRxciMM0QDztF6FUjVomGSpdAGkOPN4tYcXA6DrLdN/OQf07/GIr4Oq5msRc6z8cog
         vAhZiKbOB/zPHZDqJA4TCOhAG4zYx3U6MqhzYCxTm6XB4Hg05annUP+PBL6qzZnxRwRJ
         XtXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mgj0Y0zyXFwxRkV/6Hy2GDiojJliRCwujI01Gy8nXog=;
        b=4rA0JF32JpvpqcU/LH9rKcyPU0QdU6HAjAR9ZcxuYX/T2GFU1IfNOmvN2O0wFGgxws
         CN0LlzcyJMGIV7yeg4ruzpaIfS9wxvqMPU07IVBE/OzimOOLYqHmqo3p3KS21wW8+uy3
         6WtiFDXUBjBILypWlLCSCUVFF0avY0CN8/9o7ilAqUHOXIpW7ZWfDsDGQPV9NnuinrAY
         1gZD9j3SLUTbytt0s8Uuoan8B8SrXrriI6TaeF3cy0kTy6Hh/UAdDrX2We+IP2v+nMd+
         BiRogiEmka/H70OoYVVuZ3YKfit0+stIJzF1N2I30kHrEchYBN5gWzo75GOS4snzEUwp
         0H3Q==
X-Gm-Message-State: AFqh2kqSwoXD3XhybTtTXEn71TfuA4RVEuFvNETYi3U54vMahzg5qvjM
        nCgWvcrgYJ9n6TVb02mXKhXukGzrkcsSIXS+
X-Google-Smtp-Source: AMrXdXthzFjTXBi02CMJ+tjev1aUBZS6KO1iO4sOsXNKcm6fBk6we9yEGQSjY10huiETacOY83FIpQ==
X-Received: by 2002:a2e:a5ca:0:b0:27f:d652:f38c with SMTP id n10-20020a2ea5ca000000b0027fd652f38cmr13733512ljp.19.1673464812839;
        Wed, 11 Jan 2023 11:20:12 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bj36-20020a2eaaa4000000b0027ff2fabcb5sm1807787ljb.104.2023.01.11.11.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 11:20:12 -0800 (PST)
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
Subject: [PATCH 08/13] clk: qcom: cpu-8996: move qcom_cpu_clk_msm8996_acd_init call
Date:   Wed, 11 Jan 2023 22:19:59 +0300
Message-Id: <20230111192004.2509750-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
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

