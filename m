Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE955574A00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 12:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237903AbiGNKEC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 06:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237612AbiGNKD7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 06:03:59 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E5B1BC8B
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 03:03:57 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id x10so1102004ljj.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 03:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4+ZXhanq0yeTnNAKNTjduoC20FlvSPFcgOLSol78gzo=;
        b=IN6kbsCNGAOFbD1Rtu5j0AY/OxDKSFTPYEFKSxnHgREsFXjjcUVec8ewD0KfnY4TOG
         +hJeGFMRnbCerIHwMQ60ysHvWEsPFVQwikzlGWk116cthricZGpynfR+YnMemQeibAE2
         msWvEC0PR56jSxpvbcj/UxozKiUaRVD8oKV31MN0bkFbnc9vM10FM3D/HUBX/oZdm61v
         +tXvVIuGPYKXrb9hmdqIjsPkVtjZUnOffdI15qcDiaWk0/AhGhp1sSYOpGodOisSVJl+
         g+PJEERAHBwV56CocR1g5JXhXDNdheebOxh4gAHyigO5pNLzrCMrDicvE+UhK2Wirv6F
         j4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4+ZXhanq0yeTnNAKNTjduoC20FlvSPFcgOLSol78gzo=;
        b=lz7C4kHTHE110u1Mt5WW++dB93FpJc7sa/VppCZ3v1YdnE4jIyFd3NOp4PeBFGkDiB
         umDXsK5XCiDKASKyUxq+2THoRP3QQrMjzV6CrNlrjebMeC1IRwlPTrf7Ko50Ft/mR/p1
         phO5wvutg3KzIfBlIMFnfcc2LhWF+rC6k6WNsoYdsP0QwAHsAsn8kuJyiovWp8IeIHTe
         pBle68BqxBfd/3QING0nLoDLi/OciV4TWxyiU+s0QAAtnBGKI2to2/ffE+tTc1OWNIHE
         8E3ZF4dHqFmuA+3wSZE+HSJfQ8do98b6LGnc2kNQ4wqTJiEoJvSmz4qyjPwUY/LXEkkm
         R3Ew==
X-Gm-Message-State: AJIora8AVwTP1Cf/dbYsiNwb7VqtAJ/QJ8adxLsQiHTzrdDqjfx4UaEI
        PuXTgeFINLowKNLl1qDaQQru3w==
X-Google-Smtp-Source: AGRyM1uIitr7ZeSJL1fQkE+RMwrBHC2Lspr+3bc8UHiopY1PbSKeRcs/Woz7En+4X/w4LCyqksSyrw==
X-Received: by 2002:a2e:2a41:0:b0:25d:832d:2af9 with SMTP id q62-20020a2e2a41000000b0025d832d2af9mr3983587ljq.429.1657793035621;
        Thu, 14 Jul 2022 03:03:55 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c9-20020a056512074900b00489c92779f8sm273355lfs.184.2022.07.14.03.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 03:03:55 -0700 (PDT)
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
Subject: [PATCH 3/6] clk: qcom: cpu-8996: declare ACD clocks
Date:   Thu, 14 Jul 2022 13:03:48 +0300
Message-Id: <20220714100351.1834711-4-dmitry.baryshkov@linaro.org>
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

To simplify the code, define 1:1 fixed factor clocks to represent the
ACD pmux parent.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 53 +++++++++++++++++++++++++--------
 1 file changed, 41 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index ff90cd5b4fba..3dd6efdef82d 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -168,6 +168,34 @@ static struct clk_fixed_factor perfcl_pll_postdiv = {
 	},
 };
 
+static struct clk_fixed_factor perfcl_pll_acd = {
+	.mult = 1,
+	.div = 1,
+	.hw.init = &(struct clk_init_data){
+		.name = "perfcl_pll_acd",
+		.parent_data = &(const struct clk_parent_data){
+			.hw = &perfcl_pll.clkr.hw
+		},
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_fixed_factor pwrcl_pll_acd = {
+	.mult = 1,
+	.div = 1,
+	.hw.init = &(struct clk_init_data){
+		.name = "pwrcl_pll_acd",
+		.parent_data = &(const struct clk_parent_data){
+			.hw = &pwrcl_pll.clkr.hw
+		},
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 static const struct pll_vco alt_pll_vco_modes[] = {
 	VCO(3,  250000000,  500000000),
 	VCO(2,  500000000,  750000000),
@@ -328,14 +356,14 @@ static struct clk_regmap_mux perfcl_smux = {
 static const struct clk_hw *pwrcl_pmux_parents[] = {
 	[SMUX_INDEX] = &pwrcl_smux.clkr.hw,
 	[PLL_INDEX] = &pwrcl_pll.clkr.hw,
-	[ACD_INDEX] = &pwrcl_pll.clkr.hw,
+	[ACD_INDEX] = &pwrcl_pll_acd.hw,
 	[ALT_INDEX] = &pwrcl_alt_pll.clkr.hw,
 };
 
 static const struct clk_hw *perfcl_pmux_parents[] = {
 	[SMUX_INDEX] = &perfcl_smux.clkr.hw,
 	[PLL_INDEX] = &perfcl_pll.clkr.hw,
-	[ACD_INDEX] = &perfcl_pll.clkr.hw,
+	[ACD_INDEX] = &perfcl_pll_acd.hw,
 	[ALT_INDEX] = &perfcl_alt_pll.clkr.hw,
 };
 
@@ -382,6 +410,13 @@ static const struct regmap_config cpu_msm8996_regmap_config = {
 	.val_format_endian	= REGMAP_ENDIAN_LITTLE,
 };
 
+static struct clk_hw *cpu_msm8996_hw_clks[] = {
+	&pwrcl_pll_postdiv.hw,
+	&perfcl_pll_postdiv.hw,
+	&pwrcl_pll_acd.hw,
+	&perfcl_pll_acd.hw,
+};
+
 static struct clk_regmap *cpu_msm8996_clks[] = {
 	&pwrcl_pll.clkr,
 	&perfcl_pll.clkr,
@@ -398,16 +433,10 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
 {
 	int i, ret;
 
-	ret = devm_clk_hw_register(dev, &pwrcl_pll_postdiv.hw);
-	if (ret) {
-		dev_err(dev, "Failed to register pwrcl_pll_postdiv: %d", ret);
-		return ret;
-	}
-
-	ret = devm_clk_hw_register(dev, &perfcl_pll_postdiv.hw);
-	if (ret) {
-		dev_err(dev, "Failed to register perfcl_pll_postdiv: %d", ret);
-		return ret;
+	for (i = 0; i < ARRAY_SIZE(cpu_msm8996_hw_clks); i++) {
+		ret = devm_clk_hw_register(dev, cpu_msm8996_hw_clks[i]);
+		if (ret)
+			return ret;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(cpu_msm8996_clks); i++) {
-- 
2.35.1

