Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDEAE6696A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 13:13:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239755AbjAMMNc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 07:13:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240584AbjAMMMp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 07:12:45 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F24E880610
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 04:07:14 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id bf43so32841966lfb.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 04:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XICYznfZYxXiiAhtbbMF4a9r4ilj5DIXP6v6rzvSdU0=;
        b=zYBTbgr1b7V79zdj/rCoawMIWNLaVnGzAPxjzIm/SpT82IKBOKyQfxVANitULnp3w7
         7tyBTwdL2W36fUa6GXBMN8oM8Vp/AbyjNO1VzTj53vJqQCknsafToKq9mCKmS5kb9qgA
         YYDEoO2MHWScNkYu+adCj7L0dxsbI3c22ZaOpNHs1X1QQJMGHzzrk+o3q9GjZjXi2s9U
         QbNlTrbtTTyXHaWU+99SrcTuWjjgz2lzngJEHZOZDTymOSliOrcR1dFeINwaFXhSgxVk
         HbdQw9+POcC2lPMQEnHS8SMacWvAyq1hbIw8j7c/Vk/lt4l6tV9uHjdU6+m1C4xhXgQX
         YMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XICYznfZYxXiiAhtbbMF4a9r4ilj5DIXP6v6rzvSdU0=;
        b=EDtMYhXr6DuYBAIBPgyhrHHhbe1DV1tvyNzHcZ5lrf/Fnp/BT5JCTDifo2jgTfqXP9
         FXwfkCBCr0+Po6qb3KYsBVITD/DaQ6PzubHxdNr6KLzhWv+O/pwqvjFZsZZCbwsOPZMq
         8RPPIMVnRFsZznNZ1B86olVx0J0KaN98m1ARoI6PITck5PznBQ2Owvm/84O3BLaCHKn4
         sudOuB0ibEEH/OX2DNkAluyKE0LEJSeL/1e0fhC69q2LeWWXAXn5gEgS2tgwNA2iyCKR
         /64qQ+PCfH/zUdq0DHgCzpdRuZ6OS0tlSwZd6qWoVgneFosKLuIjKqJB8wEwLadEuvKS
         rJdw==
X-Gm-Message-State: AFqh2kqvQiVPPqhkvEJOnUXdMEawXnuny4zlpE5uhpp69chr/NJDJVu+
        y9rKHrS6aWoqWt5AT+zrf8dX8Q==
X-Google-Smtp-Source: AMrXdXsrTZC03Rk0/BNnWvhU3wTUb68QUs+BvJd0oC6hGKrmErSiI7mxwZ61cGkgMCxMXL8rdjjv+g==
X-Received: by 2002:ac2:4c4a:0:b0:4cc:a19c:1856 with SMTP id o10-20020ac24c4a000000b004cca19c1856mr2097911lfk.61.1673611633286;
        Fri, 13 Jan 2023 04:07:13 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.170.82.205])
        by smtp.gmail.com with ESMTPSA id i7-20020ac25227000000b004ac6a444b26sm3806290lfl.141.2023.01.13.04.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 04:07:12 -0800 (PST)
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
Subject: [PATCH v3 08/14] clk: qcom: cpu-8996: setup PLLs before registering clocks
Date:   Fri, 13 Jan 2023 14:05:38 +0200
Message-Id: <20230113120544.59320-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
References: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
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
2.39.0

