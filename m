Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 660CA2C4F82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 08:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729762AbgKZH3o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 02:29:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729535AbgKZH3o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 02:29:44 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B485C061A04
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 23:29:44 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id s63so974752pgc.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 23:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R1hYq6kEbx0/AP4j3UyJLMHKTGWiCK0VeyCBcdhowVA=;
        b=ygt7+G4kKglFCliP8ZfpW5V8hH1v0sFnfQm/pVy1b6Dl2V1HTgIo4/wE4oBcxfCoWM
         NtELOWGzcjMJur/yKSByfTPVQ/H/lBBwA88sw0WQd1cbrDlTiBVDakDszLBEYWU2kybU
         lk9/L0OqzHSY+8lbT3lG8Rc+3snhGu5hgDyqGoU/J3m8jBKuaWBk8raGpq6BuuJ69toH
         TS9Kbi5WCtUfrixsYIUlFwNO1neKwqWXe4aghGiSYwdXCXMrcXrtHajghaxIJTSiyhqs
         aq02sCJhWBOpND9vNzVF+kvvpXe1SMxqufZCFXMNPVgWv8dKSw6YzY+bJEdtwZHRqf2s
         hvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R1hYq6kEbx0/AP4j3UyJLMHKTGWiCK0VeyCBcdhowVA=;
        b=pifpxUwsOv09KTxcDyobHPtJHMb6CYaPUM05c4zFEN6sz9OUTbRDN0haDbTOPJIbiR
         lKALC+vQd0vXZI2kAuV/e0/lq5E6MOUn6KdX2hVL5j1o0fPwk6Jh2lycA7AqUkOHucB+
         Jid6NnlJkrCxNsULKkLsta1ReVsMuMqTAlLCF37lejuWykmeunCJtChLjxkZBDxYI/Jj
         2gkeYhFknbiNXiYyyis7JMEkcrDqOx4Bz9JWdrJG+IwYs1mvwNWmD6bylOXZ0RV5uEq0
         Cq2xx7i7oY4PnmD9H0ikH7YYN+lRI3frSF9BmGHDEJexmGWCWkWEC5jT2aO52IIJgEBG
         v3FA==
X-Gm-Message-State: AOAM530yeHmBju+ELoeqJL+ornm24/QpXjhvMoBSjXfkAbr+m+UHfCC/
        derXjv2TzKpX5KTshKRDPgVW
X-Google-Smtp-Source: ABdhPJw7r17cbxf4R8SKlh3cZAC8gWBb7QWKC8JFDeaznAWmjaizv+IJ9LKmnlcXuaBeMpnIvG2R4g==
X-Received: by 2002:a17:90a:d307:: with SMTP id p7mr2229138pju.196.1606375783771;
        Wed, 25 Nov 2020 23:29:43 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6e95:f2a:3996:9d7f:e389:7f7d])
        by smtp.gmail.com with ESMTPSA id t9sm5508097pjq.46.2020.11.25.23.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 23:29:43 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [RESEND PATCH v4 4/6] clk: qcom: Add support for SDX55 RPMh clocks
Date:   Thu, 26 Nov 2020 12:58:42 +0530
Message-Id: <20201126072844.35370-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126072844.35370-1-manivannan.sadhasivam@linaro.org>
References: <20201126072844.35370-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for following clocks maintained by RPMh in SDX55 SoCs.

* BI TCXO
* RF_CLK1
* RF_CLK1_AO
* RF_CLK2
* RF_CLK2_AO
* QPIC (Qualcomm Technologies, Inc. Parallel Interface Controller)

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index e2c669b08aff..fb72db957721 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -432,6 +432,25 @@ static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
 	.num_clks = ARRAY_SIZE(sm8250_rpmh_clocks),
 };
 
+DEFINE_CLK_RPMH_VRM(sdx55, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
+DEFINE_CLK_RPMH_VRM(sdx55, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
+DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
+
+static struct clk_hw *sdx55_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
+	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
+	[RPMH_RF_CLK1]		= &sdx55_rf_clk1.hw,
+	[RPMH_RF_CLK1_A]	= &sdx55_rf_clk1_ao.hw,
+	[RPMH_RF_CLK2]		= &sdx55_rf_clk2.hw,
+	[RPMH_RF_CLK2_A]	= &sdx55_rf_clk2_ao.hw,
+	[RPMH_QPIC_CLK]		= &sdx55_qpic_clk.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
+	.clks = sdx55_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(sdx55_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -517,6 +536,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sc7180-rpmh-clk", .data = &clk_rpmh_sc7180},
 	{ .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
+	{ .compatible = "qcom,sdx55-rpmh-clk",  .data = &clk_rpmh_sdx55},
 	{ .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
 	{ .compatible = "qcom,sm8250-rpmh-clk", .data = &clk_rpmh_sm8250},
 	{ }
-- 
2.25.1

