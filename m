Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 715BD666485
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 21:06:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235353AbjAKUFq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 15:05:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239472AbjAKUFJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 15:05:09 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBC7043E44
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 12:01:36 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id g13so25209735lfv.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 12:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17wjvx5lquWSTLgeARc3IuOmIGOx1V/FnBLjjyvZvM8=;
        b=DbZwMyQ27Eogql3jQ4L49eOWRTjCGDTpAqps0JKHt88Xpg5MYaEzyHp5I/Ds7woKjd
         P7nZCV8CHSWHWJ+fZWmwjYes3fqEed25WyN6SpbzwK3WoAR/M4e+reXlDMZHBNelBD52
         FC+SYz4SaADz5+Fki1mwAEh0QIDRmHw+yuIiA++XX/8y44K1iK7ur3uqI4nBl5nlYgXx
         FgCdHq8RXIvDGpB5w8ZruDhZRC9ZXmhbwAicZESIAAJTEQc+52yzh6Eq1X2O+ZXi7hc+
         qy3XA4BxW3ByssVsNHq6l+miRXjnfyEDdYsGh/GY+KnvFL0WtU2K4Y07l6J3VjTM1AcO
         FnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=17wjvx5lquWSTLgeARc3IuOmIGOx1V/FnBLjjyvZvM8=;
        b=BM7y1p59XFcDUwvfbg9aSPMda6UACQt2WzC6R9ZloCwXFjHdqWVQ71CanOvKa3ht99
         k8vQ0uhopSl49b5UY2m8gv7aspWe+KnEka1UYbuZX5fE4gbfHgY0QWcwcOc028U7cEUT
         Uv9Az7rqthnkjC2vzY+rmmX9bjt96H1lvkOPpQZnjOGfMdhs2LIZQTH59UQYfwnlsx8r
         l/XsYavSgtMHgMoK4BEZJyyDxAhNhgEmqJPsoTAavQLuXVoucDnEqC67ielgZ9Vd2V0D
         wGND8bnhL3b2yqj7XL8WLTWB33sVYSE4cZeiBlJ+scH9rS0lfq+zsvkd5PyYO8Axqayn
         7eCA==
X-Gm-Message-State: AFqh2kqQa1XJ/3tVusRyzcynedbJicpgRYqH909sW+3xWRYSxVyZsdux
        dYyKOaGLb30lXSRaL+vadkMqJQ==
X-Google-Smtp-Source: AMrXdXtN6EcXCqOF5g4ntVf3Az1f9pdGM1V3VJUP2OiYzhjVkk1vpEktm5e2OAPgm7zmk786AL55wQ==
X-Received: by 2002:ac2:59c9:0:b0:4c4:6a8e:24 with SMTP id x9-20020ac259c9000000b004c46a8e0024mr19680315lfn.5.1673467294631;
        Wed, 11 Jan 2023 12:01:34 -0800 (PST)
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
Subject: [PATCH v2 08/14] clk: qcom: cpu-8996: setup PLLs before registering clocks
Date:   Wed, 11 Jan 2023 23:01:22 +0300
Message-Id: <20230111200128.2593359-9-dmitry.baryshkov@linaro.org>
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

