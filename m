Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE8BA550D29
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jun 2022 23:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237272AbiFSV0B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Jun 2022 17:26:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235329AbiFSVZ7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Jun 2022 17:25:59 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55938A47F
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jun 2022 14:25:58 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id v8so9942535ljj.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jun 2022 14:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jBMiZ5n8BJY+cCNJKWjEq/LIN5KyB8obYQ76cG0oR6M=;
        b=v7NMQqejamGgvPZNiT6U7aLP6t5ZtEO6EYAfaNLJGGaecPpploS7PsJ4LT7E9PvUqz
         WYkqSd+vl89Z5Vj4ztIkAHfQSlCfCG3zuxIDKeWXLt1AlrrGH4HvowevqClCGxO1p74a
         H7MwQ30LIwDXyHU1Ew0KRe5NMDLwoPiceMG2RHUK5Ga7j+YFDlYnry0p2gpOTeEaRYz8
         RS3O/FmF796IG0DDx9lBguzIC+wxWBvLFvWP4WJRgdq6+M+2UzU+y7J5LiEYS2yJkpIE
         c1VaQx13KLmftaEu5NI7SPBb1Am+EA8pyJ1d955ewfvZ3i1/d53gdELMqLo8RvhvKr8R
         wZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jBMiZ5n8BJY+cCNJKWjEq/LIN5KyB8obYQ76cG0oR6M=;
        b=6mYiNRCYyf9uVOeS1ZfYJyBy+cnoBW/KAMHZ1Ippter8Fhd/cvO2RG11uQcgSXAJvX
         VpOqWeVPqRDk9IVlcWzD4CXu//MIqS0fbsCNjDEgwZvbKywYdI+DLtDKoaYtoMWHr+5j
         Mi4r12PmSbd3QBUBqRpGiX6Y+72pWgpQXCt8ghbg8A6Zf8Sb4IgTX1S588EeEDkOThuq
         Fl8uwqX84A7BX+rzpvH7xUatHb1DV9JHXdtF1irjPjAwKoMGa2tsv0T5W+N03iq+M1CF
         PZT+GU6BQ/hxpyZRebr772IPgqOx+tNoL9CErvHOdWTrjXT5tFUwUWhhO/MVQLc4Pa10
         wikQ==
X-Gm-Message-State: AJIora+o3VW1HQgCWElmklnWTyWpQg0ZDy2zg/MJmsEwBAs4lFGtYp61
        YpOI0dqtDP185lGJk2gb1+cODw==
X-Google-Smtp-Source: AGRyM1ug13XzfxGZltW+yAhl7e/nx6k5T1F+NxtfI9zi5wkdez4utlS7rWwcIlqBDN+f164GruT9UA==
X-Received: by 2002:a2e:3a16:0:b0:255:7811:2827 with SMTP id h22-20020a2e3a16000000b0025578112827mr10270316lja.130.1655673956697;
        Sun, 19 Jun 2022 14:25:56 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u3-20020ac258c3000000b00478de10cf5esm626866lfo.247.2022.06.19.14.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 14:25:56 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v2 5/7] clk: qcom: gcc-msm8916: move gcc_mss_q6_bimc_axi_clk down
Date:   Mon, 20 Jun 2022 00:25:47 +0300
Message-Id: <20220619212549.1240891-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220619212549.1240891-1-dmitry.baryshkov@linaro.org>
References: <20220619212549.1240891-1-dmitry.baryshkov@linaro.org>
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

The gcc_mss_q6_bimc_axi_clk clock depends on the bimc_ddr_clk_src clock.
Move it down in the file to come after the source clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index 7962edbdbcf6..4d726ca4b0da 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -2594,23 +2594,6 @@ static struct clk_branch gcc_mss_cfg_ahb_clk = {
 	},
 };
 
-static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
-	.halt_reg = 0x49004,
-	.clkr = {
-		.enable_reg = 0x49004,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_mss_q6_bimc_axi_clk",
-			.parent_names = (const char *[]){
-				"bimc_ddr_clk_src",
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_oxili_ahb_clk = {
 	.halt_reg = 0x59028,
 	.clkr = {
@@ -2860,6 +2843,23 @@ static struct clk_branch gcc_bimc_gpu_clk = {
 	},
 };
 
+static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
+	.halt_reg = 0x49004,
+	.clkr = {
+		.enable_reg = 0x49004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mss_q6_bimc_axi_clk",
+			.parent_names = (const char *[]){
+				"bimc_ddr_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_jpeg_tbu_clk = {
 	.halt_reg = 0x12034,
 	.clkr = {
-- 
2.35.1

