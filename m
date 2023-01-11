Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE2B166638D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 20:20:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238964AbjAKTUY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 14:20:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235088AbjAKTUO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 14:20:14 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0403F2BDB
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 11:20:12 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id e13so17107332ljn.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 11:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17wjvx5lquWSTLgeARc3IuOmIGOx1V/FnBLjjyvZvM8=;
        b=UOV2Bo294HuUslwpdN+qr/rgem4f407kzGTIWhZQCJRuBdayFZerxKTc+VZ65iLi3b
         B+Qm+UnIdob1evdSQ8DdStdzVdKL0dkQgwMmrs7gjYj+QSseUv2CZRREnUgL9v2UxkF/
         vxx3sgiiCA6MfMJI1GtRTKFxDJjy0IkHy/Js7M9mUMIYQ4McBhrCbI4pJRCmHDyB0oe1
         ObRkex0lQ9x4O/oTwDA/JZdgvAPHHvi+BJu0wW96fM5GArWbo4soJ3J3lAEdv9VXYwH/
         UHdehI8mfy1M1w78y9naj51AI0qm4vIwJrbP6FecFPqIIV1rmCL+XNCCFNuB0XK2O76D
         wA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=17wjvx5lquWSTLgeARc3IuOmIGOx1V/FnBLjjyvZvM8=;
        b=j1081SIADZR1j8595JYd9hYpbQJULuwA6GWdwk24Bh2giMILp1DPDFP6BC1IP3TBKd
         vx5e0lnlbDfsZ7Y3quSBYAzm6TZ1dq2HfbV/y3xLr2qEolQ81khWc4XWloWRD/AgbJ2+
         SZcOkIgGsc6cSW7SIl/aGH7lFmUSOUxvgEXll9SD4QCi+rdOL4Qwwtm4K9kJu1gQ5vD9
         bUaBNuXN0tP1FPub3dRQ80kZ+FQY/4c0DSiL41PUYDGF1ubxsM/vtEC6wGkdtMxB19g1
         vQREYREy7ZfWOACf3PJfYWnx6d+cNJM+l9QX9jytCKfcDLIxVwTpLeW4qq6jPAVCU+JV
         BRpQ==
X-Gm-Message-State: AFqh2kppjNUix9FfA6t5R7vyx/qTnuxOCOZsSwRGGg2AyIlqL7r+YBp/
        IcISOGCMjMoA04ExNSqx0RFc4Q==
X-Google-Smtp-Source: AMrXdXvoKJGLXP6oHTTfsvcENYN8kBLk8k/zQkatI8aWBHs2hLaxeU/qSbuPldAH0j6bPmO+6YGX8g==
X-Received: by 2002:a2e:9f17:0:b0:27f:db9e:3eb6 with SMTP id u23-20020a2e9f17000000b0027fdb9e3eb6mr11564053ljk.14.1673464812209;
        Wed, 11 Jan 2023 11:20:12 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bj36-20020a2eaaa4000000b0027ff2fabcb5sm1807787ljb.104.2023.01.11.11.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 11:20:11 -0800 (PST)
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
Subject: [PATCH 07/13] clk: qcom: cpu-8996: setup PLLs before registering clocks
Date:   Wed, 11 Jan 2023 22:19:58 +0300
Message-Id: <20230111192004.2509750-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
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

Setup all PLLs before registering clocks in the common clock framework.
This ensures that the clocks are not accessed before being setup in the
known way and that the CCF is in sync with the actual HW programming.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index ee7e18b37832..e390f4aadff1 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -430,6 +430,11 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
 {
 	int i, ret;
 
+	clk_alpha_pll_configure(&pwrcl_pll, regmap, &hfpll_config);
+	clk_alpha_pll_configure(&perfcl_pll, regmap, &hfpll_config);
+	clk_alpha_pll_configure(&pwrcl_alt_pll, regmap, &altpll_config);
+	clk_alpha_pll_configure(&perfcl_alt_pll, regmap, &altpll_config);
+
 	for (i = 0; i < ARRAY_SIZE(cpu_msm8996_hw_clks); i++) {
 		ret = devm_clk_hw_register(dev, cpu_msm8996_hw_clks[i]);
 		if (ret)
@@ -442,11 +447,6 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
 			return ret;
 	}
 
-	clk_alpha_pll_configure(&pwrcl_pll, regmap, &hfpll_config);
-	clk_alpha_pll_configure(&perfcl_pll, regmap, &hfpll_config);
-	clk_alpha_pll_configure(&pwrcl_alt_pll, regmap, &altpll_config);
-	clk_alpha_pll_configure(&perfcl_alt_pll, regmap, &altpll_config);
-
 	/* Enable alt PLLs */
 	clk_prepare_enable(pwrcl_alt_pll.clkr.hw.clk);
 	clk_prepare_enable(perfcl_alt_pll.clkr.hw.clk);
-- 
2.30.2

