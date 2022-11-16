Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C590E62BA86
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 12:00:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237885AbiKPLAA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 06:00:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233205AbiKPK7X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 05:59:23 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EA6D429A1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:47:50 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id d9so24519090wrm.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNW/Ja3/47L5Q6fjd4PGfYDK3b2eBGCySrTuDZ3fEGg=;
        b=g4kj6djy7NMvEN/v/5WER99YaZ8lBUBq5E5hIZRyGiJ1rya+5uQbWJODAMblSkd1L8
         W/oTb3zxOf3Cfl7AGHtrl95wpDQrs6kDU7OY5vdi1nIvP52/hHfBqijyTleQaAfGuH1f
         0//ZQn6Y/FBI3Il9SStlx0WXZXTVulSxHonZ3KrfQmUPPs8FRVuFwwjsgjGVvKBDe7lf
         o2AxoAEVZF3ZmSq01xkcJnbcHTtZPOVluUUPGpP+6gZ8EvrEgNsxLxbil+2ykgs2j2vu
         2/UYd5dUK7jfKi08Z5NuvwVFnQUK/r4iPl0N7UWezWyhdo3f5INBzxxbxn6bsAkVFcAX
         Zhgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNW/Ja3/47L5Q6fjd4PGfYDK3b2eBGCySrTuDZ3fEGg=;
        b=qBBNY4JCnDdDW4I9VFO8X24Zsfw9NszUpSSujy9Dwls8ZPLY75Pex1jI/2OyowIpJa
         n08kWezTpuBAEIMIGZva57SmsxE7jk/877nqtMwVdalvxLk0Ax5KxFJCQ4rKdbIOiYW2
         ymH4NpNpKCLg4OvMN7Hl7+k7zKSDAZLThXbKyRLHN9nwluj4h6AbX2V0V+A1tR9xyFTz
         zVmLR0GjGgzi+RMMv+jTELRW6/cLI9kcA0X3wg62mVwu9h7jmw/SMsigOp4rTp+JB7r0
         iE0UPcXsP9sUEtRzV8hslzzTWNdzy1VnanNF0yWTy0gwsgP4tRKdOc9fnhwcQX7QDlxv
         7HYg==
X-Gm-Message-State: ANoB5pkIykDtQVB+Q2IPdh1njv+R8PrgxEd+kvuJOyH8UMS0yAdSb1Xe
        L8pYpc9fQybC3nOkC1CYjvKt/A==
X-Google-Smtp-Source: AA0mqf5DPwHle12bDp7CJWEGQtzmW+z5NcBGbxTf9oJX9lozvjtjqJRV7UEQQKEIBYxWPG3UCj3HgA==
X-Received: by 2002:a5d:56cb:0:b0:236:d611:84e1 with SMTP id m11-20020a5d56cb000000b00236d61184e1mr13553865wrw.328.1668595668803;
        Wed, 16 Nov 2022 02:47:48 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id b3-20020adff903000000b002366fb99cdasm14674206wrr.50.2022.11.16.02.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:47:48 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 7/9] clk: qcom: rpmh: Add support for SM8550 rpmh clocks
Date:   Wed, 16 Nov 2022 12:47:14 +0200
Message-Id: <20221116104716.2583320-8-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116104716.2583320-1-abel.vesa@linaro.org>
References: <20221116104716.2583320-1-abel.vesa@linaro.org>
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

Adds the RPMH clocks present in SM8550 SoC.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 110 +++++++++++++++++++++++++++++-------
 1 file changed, 90 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 1da45a6e2f29..63975490ab54 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -579,6 +579,73 @@ static const struct clk_rpmh_desc clk_rpmh_sm8450 = {
 	.num_clks = ARRAY_SIZE(sm8450_rpmh_clocks),
 };
 
+#define DEFINE_CLK_RPMH_FIXED(_platform, _name, _name_active,	\
+				  _parent_name, _name_active_parent,	\
+				  _div)					\
+	static struct clk_fixed_factor _platform##_##_name = {		\
+		.mult = 1,						\
+		.div = _div,						\
+		.hw.init = &(struct clk_init_data){			\
+			.ops = &clk_fixed_factor_ops,			\
+			.name = #_name,					\
+			.parent_data =  &(const struct clk_parent_data){ \
+					.fw_name = #_parent_name,	\
+					.name = #_parent_name,		\
+			},						\
+			.num_parents = 1,				\
+		},							\
+	};								\
+	static struct clk_fixed_factor _platform##_##_name_active = {	\
+		.mult = 1,						\
+		.div = _div,						\
+		.hw.init = &(struct clk_init_data){			\
+			.ops = &clk_fixed_factor_ops,			\
+			.name = #_name_active,				\
+			.parent_data =  &(const struct clk_parent_data){ \
+					.fw_name = #_name_active_parent,\
+					.name = #_name_active_parent,	\
+			},						\
+			.num_parents = 1,				\
+		},							\
+	}
+
+DEFINE_CLK_RPMH_ARC(sm8550, xo_pad, xo_pad_ao, "xo.lvl", 0x03, 2);
+DEFINE_CLK_RPMH_FIXED(sm8550, bi_tcxo, bi_tcxo_ao, xo_pad, xo_pad_ao, 2);
+DEFINE_CLK_RPMH_VRM(sm8550, rf_clk1, rf_clk1_ao, "clka1", 1);
+DEFINE_CLK_RPMH_VRM(sm8550, rf_clk2, rf_clk2_ao, "clka2", 1);
+DEFINE_CLK_RPMH_VRM(sm8550, rf_clk3, rf_clk3_ao, "clka3", 1);
+DEFINE_CLK_RPMH_VRM(sm8550, rf_clk4, rf_clk4_ao, "clka4", 1);
+DEFINE_CLK_RPMH_VRM(sm8550, ln_bb_clk1, ln_bb_clk1_ao, "clka6", 2);
+DEFINE_CLK_RPMH_VRM(sm8550, ln_bb_clk2, ln_bb_clk2_ao, "clka7", 2);
+DEFINE_CLK_RPMH_VRM(sm8550, ln_bb_clk3, ln_bb_clk3_ao, "clka8", 2);
+
+static struct clk_hw *sm8550_rpmh_clocks[] = {
+	[RPMH_CXO_PAD_CLK]      = &sm8550_xo_pad.hw,
+	[RPMH_CXO_PAD_CLK_A]    = &sm8550_xo_pad_ao.hw,
+	[RPMH_CXO_CLK]		= &sm8550_bi_tcxo.hw,
+	[RPMH_CXO_CLK_A]	= &sm8550_bi_tcxo_ao.hw,
+	[RPMH_LN_BB_CLK1]	= &sm8550_ln_bb_clk1.hw,
+	[RPMH_LN_BB_CLK1_A]	= &sm8550_ln_bb_clk1_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &sm8550_ln_bb_clk2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &sm8550_ln_bb_clk2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &sm8550_ln_bb_clk3.hw,
+	[RPMH_LN_BB_CLK3_A]	= &sm8550_ln_bb_clk3_ao.hw,
+	[RPMH_RF_CLK1]		= &sm8550_rf_clk1.hw,
+	[RPMH_RF_CLK1_A]	= &sm8550_rf_clk1_ao.hw,
+	[RPMH_RF_CLK2]		= &sm8550_rf_clk2.hw,
+	[RPMH_RF_CLK2_A]	= &sm8550_rf_clk2_ao.hw,
+	[RPMH_RF_CLK3]		= &sm8550_rf_clk3.hw,
+	[RPMH_RF_CLK3_A]	= &sm8550_rf_clk3_ao.hw,
+	[RPMH_RF_CLK4]		= &sm8550_rf_clk4.hw,
+	[RPMH_RF_CLK4_A]	= &sm8550_rf_clk4_ao.hw,
+	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_sm8550 = {
+	.clks = sm8550_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(sm8550_rpmh_clocks),
+};
+
 static struct clk_hw *sc7280_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]      = &sc7280_bi_tcxo.hw,
 	[RPMH_CXO_CLK_A]    = &sc7280_bi_tcxo_ao.hw,
@@ -694,29 +761,31 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 
 		name = hw_clks[i]->init->name;
 
-		rpmh_clk = to_clk_rpmh(hw_clks[i]);
-		res_addr = cmd_db_read_addr(rpmh_clk->res_name);
-		if (!res_addr) {
-			dev_err(&pdev->dev, "missing RPMh resource address for %s\n",
-				rpmh_clk->res_name);
-			return -ENODEV;
-		}
+		if (hw_clks[i]->init->ops != &clk_fixed_factor_ops) {
+			rpmh_clk = to_clk_rpmh(hw_clks[i]);
+			res_addr = cmd_db_read_addr(rpmh_clk->res_name);
+			if (!res_addr) {
+				dev_err(&pdev->dev, "missing RPMh resource address for %s\n",
+					rpmh_clk->res_name);
+				return -ENODEV;
+			}
 
-		data = cmd_db_read_aux_data(rpmh_clk->res_name, &aux_data_len);
-		if (IS_ERR(data)) {
-			ret = PTR_ERR(data);
-			dev_err(&pdev->dev,
-				"error reading RPMh aux data for %s (%d)\n",
-				rpmh_clk->res_name, ret);
-			return ret;
-		}
+			data = cmd_db_read_aux_data(rpmh_clk->res_name, &aux_data_len);
+			if (IS_ERR(data)) {
+				ret = PTR_ERR(data);
+				dev_err(&pdev->dev,
+					"error reading RPMh aux data for %s (%d)\n",
+					rpmh_clk->res_name, ret);
+				return ret;
+			}
 
-		/* Convert unit from Khz to Hz */
-		if (aux_data_len == sizeof(*data))
-			rpmh_clk->unit = le32_to_cpu(data->unit) * 1000ULL;
+			/* Convert unit from Khz to Hz */
+			if (aux_data_len == sizeof(*data))
+				rpmh_clk->unit = le32_to_cpu(data->unit) * 1000ULL;
 
-		rpmh_clk->res_addr += res_addr;
-		rpmh_clk->dev = &pdev->dev;
+			rpmh_clk->res_addr += res_addr;
+			rpmh_clk->dev = &pdev->dev;
+		}
 
 		ret = devm_clk_hw_register(&pdev->dev, hw_clks[i]);
 		if (ret) {
@@ -752,6 +821,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sm8250-rpmh-clk", .data = &clk_rpmh_sm8250},
 	{ .compatible = "qcom,sm8350-rpmh-clk", .data = &clk_rpmh_sm8350},
 	{ .compatible = "qcom,sm8450-rpmh-clk", .data = &clk_rpmh_sm8450},
+	{ .compatible = "qcom,sm8550-rpmh-clk", .data = &clk_rpmh_sm8550},
 	{ .compatible = "qcom,sc7280-rpmh-clk", .data = &clk_rpmh_sc7280},
 	{ }
 };
-- 
2.34.1

