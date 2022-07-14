Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA489574A06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 12:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237030AbiGNKEP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 06:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237856AbiGNKEA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 06:04:00 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A92FDB49C
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 03:03:58 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id w17so1566703ljh.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 03:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6sI+cun9sqvSMZVYqB1PbbtuHQ6v+tt2HHn2LrmcZhI=;
        b=BagQF/DTiIOVdYDZI5Z/Jk+XUpDAtmhS+vV3ZZQdULIk9UvwM6vvhyrWpmS3Jbbwfw
         WxWlp/bWu6i8I0JKaQGosdxYr++oGMIkkhuWup1JEQ4p95rbEzNW0gULFmuvyo/rUeh+
         rNaQJ6j7GvuuvaTLxjWMtKlP0/QQIGVF8cckDxNBZTeNUSpHPtNXQeYFqKNzDmQdx94M
         gSirvluErr8LUYAiBDNdfXRNKm4FZ52BEvmGrJ+KfaDwNldTpCGt2ckrzTKhC7EcpL0q
         4/pN12w9Gx0tWt94x41AxL5VlT7/IV6XyQsoj//nW0zFdDwvD0IQVuqjiv6Ih9e/Yie9
         +CBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6sI+cun9sqvSMZVYqB1PbbtuHQ6v+tt2HHn2LrmcZhI=;
        b=lOgmbHBGHM8SzfBntqY34YNBl9LLKcN9xdOYMYX36EuTzuUcSqkQbkfpJ4brpm/PoN
         PaJSf17wgEYryvZ2W6sIDZPd0CmZR7uyOqkbieB36crn/blxUCABQX18sZ9vuj0NzdoJ
         VGKn1jU4O+aP9NmnXm6W+IbSbGplvwtE3nEWndgbd8OTB1GfIc5tLxTOudmxHVjpOFz0
         9u9fb9l5hzRYoiwYfiGYE+ZjPzbFWT4qUJmsbUeDwfDHMAu2RPvYKPedEoemNPw00au/
         zkKb862/WZksyLIti5pnCalCME9LTQjQe2O7fykzBx1pn+INjV01buFK5aTifrzXPhp/
         /Yxw==
X-Gm-Message-State: AJIora/wyrNMD+WUUWtR2HqFcM2ruRtp8FMbZUH8Saa8QDU6/XmocS9T
        ld7ZDFayVbQGAkR1GjOP38HuupROzu9GWw==
X-Google-Smtp-Source: AGRyM1uv4wkJ0EJPbrqRDeIOSoEQVjhxZTEn5xWzjWdOG/EatAuIuJz3tpKbbCGvVF59RzBWrkftwQ==
X-Received: by 2002:a05:651c:b13:b0:25d:8342:e11 with SMTP id b19-20020a05651c0b1300b0025d83420e11mr3928646ljr.266.1657793037064;
        Thu, 14 Jul 2022 03:03:57 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c9-20020a056512074900b00489c92779f8sm273355lfs.184.2022.07.14.03.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 03:03:56 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: [PATCH 5/6] clk: qcom: cpu-8996: don't store parents in clk_cpu_8996_pmux
Date:   Thu, 14 Jul 2022 13:03:50 +0300
Message-Id: <20220714100351.1834711-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714100351.1834711-1-dmitry.baryshkov@linaro.org>
References: <20220714100351.1834711-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Don't store pointers to parents in struct clk_cpu_8996_pmux. Instead use
clk_hw_get_parent_by_index to fetch them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index 5c5adcb533ce..0a336adb02b5 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -247,8 +247,6 @@ struct clk_cpu_8996_pmux {
 	u8	shift;
 	u8	width;
 	struct notifier_block nb;
-	struct clk_hw	*pll;
-	struct clk_hw	*pll_div_2;
 	struct clk_regmap clkr;
 };
 
@@ -292,15 +290,17 @@ static int clk_cpu_8996_pmux_set_parent(struct clk_hw *hw, u8 index)
 static int clk_cpu_8996_pmux_determine_rate(struct clk_hw *hw,
 					   struct clk_rate_request *req)
 {
-	struct clk_cpu_8996_pmux *cpuclk = to_clk_cpu_8996_pmux_hw(hw);
-	struct clk_hw *parent = cpuclk->pll;
+	struct clk_hw *parent;
 
-	if (cpuclk->pll_div_2 && req->rate < DIV_2_THRESHOLD) {
-		if (req->rate < (DIV_2_THRESHOLD / 2))
-			return -EINVAL;
+	if (req->rate < (DIV_2_THRESHOLD / 2))
+		return -EINVAL;
 
-		parent = cpuclk->pll_div_2;
-	}
+	if (req->rate < DIV_2_THRESHOLD)
+		parent = clk_hw_get_parent_by_index(hw, SMUX_INDEX);
+	else
+		parent = clk_hw_get_parent_by_index(hw, ACD_INDEX);
+	if (!parent)
+		return -EINVAL;
 
 	req->best_parent_rate = clk_hw_round_rate(parent, req->rate);
 	req->best_parent_hw = parent;
@@ -368,8 +368,6 @@ static struct clk_cpu_8996_pmux pwrcl_pmux = {
 	.reg = PWRCL_REG_OFFSET + MUX_OFFSET,
 	.shift = 0,
 	.width = 2,
-	.pll = &pwrcl_pll_acd.clkr.hw,
-	.pll_div_2 = &pwrcl_smux.clkr.hw,
 	.nb.notifier_call = cpu_clk_notifier_cb,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "pwrcl_pmux",
@@ -385,8 +383,6 @@ static struct clk_cpu_8996_pmux perfcl_pmux = {
 	.reg = PERFCL_REG_OFFSET + MUX_OFFSET,
 	.shift = 0,
 	.width = 2,
-	.pll = &perfcl_pll_acd.clkr.hw,
-	.pll_div_2 = &perfcl_smux.clkr.hw,
 	.nb.notifier_call = cpu_clk_notifier_cb,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "perfcl_pmux",
-- 
2.35.1

