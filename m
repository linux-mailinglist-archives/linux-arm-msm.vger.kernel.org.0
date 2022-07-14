Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83966574A08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 12:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237641AbiGNKEQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 06:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237878AbiGNKEC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 06:04:02 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BD39E0A1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 03:03:59 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id o7so1945655lfq.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 03:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iSjDY003YCEJCAL+QFpIk6XgpVGUGc1D7V9hV3sdds8=;
        b=oaKJTR9qMGTUFrv93sM3Up09q7/CKcNxyofNpoGaPGkSmp4EtVTp5IVfdwZaMIQT38
         XPzYHZyPvazmKC/t7fzVwj+BG5o3nA7LJRYC2m5VhtBNwYdzTiPepjkrZf1LlLsgCJmU
         68AdPk4IU8WEYaFntkDYx/Fm6tqG6//xUXA+JXRkfQHVQEKnDBiGdPVVSfMLkJ7DnEF4
         oi8lVTx8sdM4115m4mYPLmbbygLex75c/S3mJT73A+XFuf5fZSAdkb1RCsahZhvAqnlB
         KGFalhqEWWaXPuv7KJR18upfMshC2GYAg4Gr6cnDTin3gDwkkHLAPkRrPkya6XDuu3WE
         iEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iSjDY003YCEJCAL+QFpIk6XgpVGUGc1D7V9hV3sdds8=;
        b=bkAKdsqUZBbkOiZjxBWaoiEz5kM7fBPVxy4GzW5mdR543egYAW86iYDj6SNZnLbWDQ
         43x2LZ+BqJOrzryiEuYv6CI3kz1dr9K3WFgVFoUr0vjGlI7+KuPkqyVPFA87Q0aKygnU
         Ac14sjIZVUc4zxaog/SKV7LaqXnYua+qmjaLKkUj/DCng0r7LefxWXFxcl/vr45afsbb
         CuDJElc6OdGarBUnj3nbQqW+0FEUi3eJu+mJYlc757+v/vG3/ucxHSBwz2GVNN2ftuRJ
         YnC4AeC7CurHVfGZmDI8BUwfSju1ZE3k7d3ylRVisMKmqycBqVO9k9h6OlbGpoc5OFCa
         zEaA==
X-Gm-Message-State: AJIora8nRYkSKFx3KSy0twPGBDfu5w9OrncbVVJ9WBQ4v/vkomt5P9Br
        ZyMs9hbRXtnDK4tHIpZsS1fk9w==
X-Google-Smtp-Source: AGRyM1vns3Jat5Zluvzc1MJY1pz1ufsAxWFrQ6prhmCJo119bmbWhsaH88i+Ow0IrOG2G1oh12Xupw==
X-Received: by 2002:a05:6512:ba3:b0:489:ed8b:a172 with SMTP id b35-20020a0565120ba300b00489ed8ba172mr4621121lfv.584.1657793037760;
        Thu, 14 Jul 2022 03:03:57 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c9-20020a056512074900b00489c92779f8sm273355lfs.184.2022.07.14.03.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 03:03:57 -0700 (PDT)
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
Subject: [PATCH 6/6] clk: qcom: cpu-8996: use constant mask for pmux
Date:   Thu, 14 Jul 2022 13:03:51 +0300
Message-Id: <20220714100351.1834711-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714100351.1834711-1-dmitry.baryshkov@linaro.org>
References: <20220714100351.1834711-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Both pmux instances share the same width and shift. Specify the mask at
compile time to simplify functions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index 0a336adb02b5..ee76ef958d31 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -49,6 +49,7 @@
  * detect voltage droops.
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
@@ -76,6 +77,8 @@ enum _pmux_input {
 #define ALT_PLL_OFFSET	0x100
 #define SSSCTL_OFFSET 0x160
 
+#define PMUX_MASK	0x3
+
 static const u8 prim_pll_regs[PLL_OFF_MAX_REGS] = {
 	[PLL_OFF_L_VAL] = 0x04,
 	[PLL_OFF_ALPHA_VAL] = 0x08,
@@ -244,8 +247,6 @@ static struct clk_alpha_pll perfcl_alt_pll = {
 
 struct clk_cpu_8996_pmux {
 	u32	reg;
-	u8	shift;
-	u8	width;
 	struct notifier_block nb;
 	struct clk_regmap clkr;
 };
@@ -265,26 +266,22 @@ static u8 clk_cpu_8996_pmux_get_parent(struct clk_hw *hw)
 {
 	struct clk_regmap *clkr = to_clk_regmap(hw);
 	struct clk_cpu_8996_pmux *cpuclk = to_clk_cpu_8996_pmux_hw(hw);
-	u32 mask = GENMASK(cpuclk->width - 1, 0);
 	u32 val;
 
 	regmap_read(clkr->regmap, cpuclk->reg, &val);
-	val >>= cpuclk->shift;
 
-	return val & mask;
+	return FIELD_GET(PMUX_MASK, val);
 }
 
 static int clk_cpu_8996_pmux_set_parent(struct clk_hw *hw, u8 index)
 {
 	struct clk_regmap *clkr = to_clk_regmap(hw);
 	struct clk_cpu_8996_pmux *cpuclk = to_clk_cpu_8996_pmux_hw(hw);
-	u32 mask = GENMASK(cpuclk->width + cpuclk->shift - 1, cpuclk->shift);
 	u32 val;
 
-	val = index;
-	val <<= cpuclk->shift;
+	val = FIELD_PREP(PMUX_MASK, index);
 
-	return regmap_update_bits(clkr->regmap, cpuclk->reg, mask, val);
+	return regmap_update_bits(clkr->regmap, cpuclk->reg, PMUX_MASK, val);
 }
 
 static int clk_cpu_8996_pmux_determine_rate(struct clk_hw *hw,
@@ -366,8 +363,6 @@ static const struct clk_hw *perfcl_pmux_parents[] = {
 
 static struct clk_cpu_8996_pmux pwrcl_pmux = {
 	.reg = PWRCL_REG_OFFSET + MUX_OFFSET,
-	.shift = 0,
-	.width = 2,
 	.nb.notifier_call = cpu_clk_notifier_cb,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "pwrcl_pmux",
@@ -381,8 +376,6 @@ static struct clk_cpu_8996_pmux pwrcl_pmux = {
 
 static struct clk_cpu_8996_pmux perfcl_pmux = {
 	.reg = PERFCL_REG_OFFSET + MUX_OFFSET,
-	.shift = 0,
-	.width = 2,
 	.nb.notifier_call = cpu_clk_notifier_cb,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "perfcl_pmux",
-- 
2.35.1

