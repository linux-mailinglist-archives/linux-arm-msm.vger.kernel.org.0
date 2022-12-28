Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7E265770D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 14:33:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232978AbiL1Nd0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 08:33:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232972AbiL1Ncy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 08:32:54 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B5BFAED
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:32:53 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 1so23631660lfz.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ijMDoR4AdR4NsVCY72cZZHnUNmH0Cvvqw6DU7+bt38=;
        b=pCaBh0b1aFdQ/bPydctI6EILckDsFMQksLf/vXZZ6peEHJKLY3TBppMvQXkC3z7tE2
         PVzYczJSqJ3JVOTJh1TUsrqwCecaBU/xhOIw0EPNlTeqO6xXpAUYqfEPrLWcl6R4CBJU
         e5le/x7g0WLp8zHnoQ9ZTyuLJrOFOpYG9kuEOBlVsCoWEX469yi4Kuhn+7sLU54dqhP5
         EIGwiy4SThZmP89BrmE2TqRdGpH/BSk06rgBpZzOXMXleYPfdpaMxBvMivp5M/CmvKU9
         G15Y6Xc2xLAI0MgwErLeRgHtq2K7o99EyIeVL3FJ1v1FMUEK3ciIwZ4OqNpAgzrIjUPM
         N5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ijMDoR4AdR4NsVCY72cZZHnUNmH0Cvvqw6DU7+bt38=;
        b=Jt+gRJPN9hu+gpmpVvprmSWYd6T8JoxOK6jx9qNvkvzIl/CNz00nxeN22KZyKrUyQ7
         HYNGoTnGqca4UgoAkbafXRBlkieIbw+F86xWn1wmRszriM/DNe5i2v9S+goB3FvTS+uZ
         Y6BM6JJLR7Swna3ZHw97zhp3zeliXq6wAscmtC3DambAIJvTMWQRTDC6UYU852yrcP3q
         1uOGObIVgGr4izXByetFwAGXZrOl3VFPxprmFfu5l9xrMqLJBw2bmb4sMMcLcpY1xLcd
         hPsNx3oV9JkNY3OVI/XVZxrwHuoaoG+eIBCK/Bg2yGTQxkTNu/mj2QrU/ZTeQGcsKK/p
         wgGQ==
X-Gm-Message-State: AFqh2krjN20D0k8u8cukvs3aBkpLNtULdKN1avGMX3S/z6hG0h2eB+Qj
        rTP1tU1kywaQM5Dvpy9NYnHSSA==
X-Google-Smtp-Source: AMrXdXvIl6PsuVcVaJ8r4yPl1Pvd9+VXLBwN0Juia0Gq0Xmq4oRKcSH5/+ViWBpYppCuY1S/1SkNHQ==
X-Received: by 2002:a05:6512:acd:b0:4b5:a206:30ee with SMTP id n13-20020a0565120acd00b004b5a20630eemr9900805lfu.65.1672234372014;
        Wed, 28 Dec 2022 05:32:52 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id d7-20020ac241c7000000b004a47e7b91c4sm2613876lfi.195.2022.12.28.05.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 05:32:51 -0800 (PST)
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
Subject: [PATCH 08/16] clk: qcom: dispcc-qcm2290: get rid of test clock
Date:   Wed, 28 Dec 2022 15:32:35 +0200
Message-Id: <20221228133243.3052132-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
References: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
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

The test clock apparently it's not used by anyone upstream. Remove it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 96b149365912..2ebd9a02b895 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -71,7 +71,6 @@ static const struct parent_map disp_cc_parent_map_0[] = {
 static const struct clk_parent_data disp_cc_parent_data_0[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .fw_name = "dsi0_phy_pll_out_byteclk" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_1[] = {
@@ -80,7 +79,6 @@ static const struct parent_map disp_cc_parent_map_1[] = {
 
 static const struct clk_parent_data disp_cc_parent_data_1[] = {
 	{ .fw_name = "bi_tcxo" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_2[] = {
@@ -91,7 +89,6 @@ static const struct parent_map disp_cc_parent_map_2[] = {
 static const struct clk_parent_data disp_cc_parent_data_2[] = {
 	{ .fw_name = "bi_tcxo_ao" },
 	{ .fw_name = "gcc_disp_gpll0_div_clk_src" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_3[] = {
@@ -104,7 +101,6 @@ static const struct clk_parent_data disp_cc_parent_data_3[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .hw = &disp_cc_pll0.clkr.hw },
 	{ .fw_name = "gcc_disp_gpll0_clk_src" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_4[] = {
@@ -117,7 +113,6 @@ static const struct clk_parent_data disp_cc_parent_data_4[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .fw_name = "dsi0_phy_pll_out_dsiclk" },
 	{ .fw_name = "dsi1_phy_pll_out_dsiclk" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_5[] = {
@@ -126,7 +121,6 @@ static const struct parent_map disp_cc_parent_map_5[] = {
 
 static const struct clk_parent_data disp_cc_parent_data_5[] = {
 	{ .fw_name = "sleep_clk" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
-- 
2.35.1

