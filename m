Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1E5E666471
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 21:05:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239582AbjAKUFg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 15:05:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238344AbjAKUFJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 15:05:09 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCBB443E7E
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 12:01:37 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id bu8so25187930lfb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 12:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZ2p731vN2U20cHBeIyCq9fuCWOHPzhzPfBzUh6W44Y=;
        b=BzwdXy4C9+bn81/EMPx5hzqqsRMLi0MPIGDUeJh7FCpmLthigreTIKQXXFbAtktRj/
         gkoJA5UFMcbFWRI98EPgN1eYwJXhS84nT7aNE+6zFpdlSee4DxE8VLa9lo518CfyGT8Z
         oDCKBYB4lEHTpfvailV+UfJNXTCh146iU4TY4dzxueU/p5CB5WmHTe7YKbUs/UsBIxI/
         ecpxs/ft4ACZGM0uLcl+ob3HccwUVSv5NnJL8M+d6j5bTzp6PLOxJ71Gm/z2Q99Ls9lK
         zijUtOpatBZWB95eTVaA9GUIMDz3HtEX9bbh8mSs7/iV/cGdX0DSU7iBbULf4EJzOn2o
         FqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZ2p731vN2U20cHBeIyCq9fuCWOHPzhzPfBzUh6W44Y=;
        b=2pyv+HCEo2XiEb3Bs5fsqog6LkcWvCmoweIFo7GyTytRFUdmyjuLIb3/ZUiifM98LS
         3sB0G2zRifdxGTz4vZnHJIQOHP0ZCI5GQzIpN/7YIyQ2x4I8IQpB5t/G8T4h7NWXOu3X
         zIqMiMSLUJ3S5unQCcJJ0XOUPCHffii5upKcKwVceIrO3V2YCee6hPb2YpwZ00ZiQMy1
         O1dyn/NxTr6no44H6iiEb5DARkveAlwL/HCjUACI6Iw9grCXloMt/MmxHMq82jumqRPr
         +g4AE2YdV6T+w98LGsOxp6ZzzcfH/ajEleWBpEXPO0gXhTRkWY+tVXR9A/7+HfnXAnuM
         IhvQ==
X-Gm-Message-State: AFqh2koswiwnZ+qiwHIo/yR9i4lkYhL0ULMKD73XwKT7Op5+Sd5EJsfo
        oQD3vXSMZY9HZ7va75OGeS6gGg==
X-Google-Smtp-Source: AMrXdXtmdILMytzI+t7hWZ5YNBsJKVeYJhVtY7573QiGBxYXcEk2jq/CeA1tcJbg7MTriIqD+/xnSA==
X-Received: by 2002:a05:6512:3b2a:b0:4b5:5efb:7d26 with SMTP id f42-20020a0565123b2a00b004b55efb7d26mr25667474lfv.37.1673467296024;
        Wed, 11 Jan 2023 12:01:36 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v20-20020a05651203b400b004b4e6dab30esm2881437lfp.222.2023.01.11.12.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 12:01:35 -0800 (PST)
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
Subject: [PATCH v2 10/14] clk: qcom: cpu-8996: fix PLL configuration sequence
Date:   Wed, 11 Jan 2023 23:01:24 +0300
Message-Id: <20230111200128.2593359-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111200128.2593359-1-dmitry.baryshkov@linaro.org>
References: <20230111200128.2593359-1-dmitry.baryshkov@linaro.org>
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

Switch both power and performance clocks to the GPLL0/2 (sys_apcs_aux)
before PLL configuration. Switch them to the ACD afterwards.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index 571ed52b3026..47c58bb5f21a 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -432,13 +432,27 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
 {
 	int i, ret;
 
+	/* Select GPLL0 for 300MHz for the both clusters */
+	regmap_write(regmap, PERFCL_REG_OFFSET + MUX_OFFSET, 0xc);
+	regmap_write(regmap, PWRCL_REG_OFFSET + MUX_OFFSET, 0xc);
+
+	/* Ensure write goes through before PLLs are reconfigured */
+	udelay(5);
+
 	clk_alpha_pll_configure(&pwrcl_pll, regmap, &hfpll_config);
 	clk_alpha_pll_configure(&perfcl_pll, regmap, &hfpll_config);
 	clk_alpha_pll_configure(&pwrcl_alt_pll, regmap, &altpll_config);
 	clk_alpha_pll_configure(&perfcl_alt_pll, regmap, &altpll_config);
 
+	/* Wait for PLL(s) to lock */
+        udelay(50);
+
 	qcom_cpu_clk_msm8996_acd_init(regmap);
 
+	/* Switch clusters to use the ACD leg */
+	regmap_write(regmap, PWRCL_REG_OFFSET + MUX_OFFSET, 0x2);
+	regmap_write(regmap, PERFCL_REG_OFFSET + MUX_OFFSET, 0x2);
+
 	for (i = 0; i < ARRAY_SIZE(cpu_msm8996_hw_clks); i++) {
 		ret = devm_clk_hw_register(dev, cpu_msm8996_hw_clks[i]);
 		if (ret)
-- 
2.30.2

