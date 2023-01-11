Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A94166646F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 21:05:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236081AbjAKUF3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 15:05:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238942AbjAKUFE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 15:05:04 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB84F43DAC
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 12:01:33 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id j17so25226397lfr.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 12:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCHat37cJtM2Qvwrjq9+VD2WQIcOHoBDwG3chmbNUpY=;
        b=YvhlSLlldXA1ktk13wJ/O4Gp1RC+o6+9JqJAspbyguImj2C138rOw33Rn6+RfNQiEG
         BB/hZkVvjEzo/2yafBAhi8TIOek1sw2+aggntqRUlChQfN8q+b37+vU62S+CahLI8vNl
         1J2mDFiS7DSGkUdjtRXBIEUZ2cp6dCZCMKfSqXYXxUq+S6wvgWxpC6+AF1Obm3orLg60
         LvSUVXMlf05x/qVUUCWD1HdDSE6Tx3daWo2XpgGAl2ODOZ2t7LBy5No1NAZaq7ag7fjk
         YsIlgJpnNerVEOAqAddzxbqGMXrWRR05w/U2BKKs8NxIA88ESUkzDACOkKK5BeaFnW0b
         4tnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rCHat37cJtM2Qvwrjq9+VD2WQIcOHoBDwG3chmbNUpY=;
        b=6R1V6rhRIYW/PQbBs4hpJi6u0an9eaudN5nP0VZlI0gMaxQHEo8Qz5b+Tit8IX7b8S
         9dkYaG7GP1icCXbJPHQ7+z+bZ9YFWJs8aTh0+gamnzVX4oei1sHpujSk7L33GzWtn/rP
         hIs4ukqK/Cv73XxOt8LuqtOlRuKtuRqdV3gF8zRkd0Hx0YAL4q+pBsoP2/SYEU8Q5sNA
         ah6b2v8URWWq4t+dJxjw1bv3XTFlk4JbpDwWLuQncTdr7YUYA2ny+hNlY0FHc3Wwj8Da
         O/ijUQ98WHPkhcXv+rPhkTTiW66mM0NpuGtwD61im7pa2XG8NhxyHGBhgiD4x8TpzJEw
         KWZg==
X-Gm-Message-State: AFqh2kqIwHSKm7nSW47xo1Mmc5jSHJuWJpexkJTVv/rWKVIbJjv7hKq5
        Xn7CbtDCBVYQbRzXX2v85hQfgw==
X-Google-Smtp-Source: AMrXdXu58ILgQPiKFsmXUedyxiC7SkBuhOkzFHpC7cly8MPvCBn2S8/B6TUEQ9MaLjuaaNWbZGsSGQ==
X-Received: by 2002:ac2:4bd1:0:b0:4a4:6af4:43b7 with SMTP id o17-20020ac24bd1000000b004a46af443b7mr20048900lfq.69.1673467292658;
        Wed, 11 Jan 2023 12:01:32 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v20-20020a05651203b400b004b4e6dab30esm2881437lfp.222.2023.01.11.12.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 12:01:32 -0800 (PST)
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
Subject: [PATCH v2 05/14] clk: qcom: cpu-8996: support using GPLL0 as SMUX input
Date:   Wed, 11 Jan 2023 23:01:19 +0300
Message-Id: <20230111200128.2593359-6-dmitry.baryshkov@linaro.org>
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

In some cases the driver might need using GPLL0 to drive CPU clocks.
Bring it in through the sys_apcs_aux clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index d51965fda56d..0e0c00d44c6f 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -12,6 +12,8 @@
  *                              +-------+
  *               XO             |       |
  *           +------------------>0      |
+ *               SYS_APCS_AUX   |       |
+ *           +------------------>3      |
  *                              |       |
  *                    PLL/2     | SMUX  +----+
  *                      +------->1      |    |
@@ -310,20 +312,29 @@ static const struct clk_ops clk_cpu_8996_pmux_ops = {
 	.determine_rate = clk_cpu_8996_pmux_determine_rate,
 };
 
+static const struct parent_map smux_parent_map[] = {
+	{ .cfg = 0, }, /* xo */
+	{ .cfg = 1, }, /* pll */
+	{ .cfg = 3, }, /* sys_apcs_aux */
+};
+
 static const struct clk_parent_data pwrcl_smux_parents[] = {
 	{ .fw_name = "xo" },
 	{ .hw = &pwrcl_pll_postdiv.hw },
+	{ .fw_name = "sys_apcs_aux" },
 };
 
 static const struct clk_parent_data perfcl_smux_parents[] = {
 	{ .fw_name = "xo" },
 	{ .hw = &perfcl_pll_postdiv.hw },
+	{ .fw_name = "sys_apcs_aux" },
 };
 
 static struct clk_regmap_mux pwrcl_smux = {
 	.reg = PWRCL_REG_OFFSET + MUX_OFFSET,
 	.shift = 2,
 	.width = 2,
+	.parent_map = smux_parent_map,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "pwrcl_smux",
 		.parent_data = pwrcl_smux_parents,
@@ -337,6 +348,7 @@ static struct clk_regmap_mux perfcl_smux = {
 	.reg = PERFCL_REG_OFFSET + MUX_OFFSET,
 	.shift = 2,
 	.width = 2,
+	.parent_map = smux_parent_map,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "perfcl_smux",
 		.parent_data = perfcl_smux_parents,
-- 
2.30.2

