Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9172C2B8C5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Nov 2020 08:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgKSH1t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Nov 2020 02:27:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbgKSH1s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Nov 2020 02:27:48 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA495C0613D4
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2020 23:27:48 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id m9so3445015pgb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2020 23:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=u5W6INqg2Zpl99fZRNl1fAgbWBqyZfbuE4X8ZoNAf8o=;
        b=i07saqU5+eNp08WFeDZuxfBIwgK2EE/UqyJVMmRevU8OXoD+b6rUppmRHE4GnszIjP
         HXsPokwsXJ8+8J0PuajCtM+FbRlDdwuy6E4HFtRsBCCu1QzuaUe6m0tysKscJToq7Y5C
         Hw2cwkMC1l4VmEaqvptS0dAOti4+EMYdGybSlsI8h+48AEickIPKzme69Ym7VdQps/uq
         Kw0abvemofIVstOfMxHHgbS9NNFK2LJfvWvz9xZH6Oy15GcGQRcp3tZmHb/Chagn30Uo
         Tmu0nFgu/hEPG6AcRc/ORXn6n5YB15Tf7OQeCSn4KVhT1+fi20o7g2eO18MLg6gn3qob
         YI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=u5W6INqg2Zpl99fZRNl1fAgbWBqyZfbuE4X8ZoNAf8o=;
        b=bu+t002sWvZpA7wmIe/PaIhm6zQlu6k/VHGDJoteKaSZ58QhU8o7oCNzn61gHWyI5m
         0ZXRXIPnTLCOeq+qFtjFiEenxQsOC1cpgZnGGi2/Ckg6tZkj6nzsltaNHVAVVw4ZF6tj
         Q45k+SqXuugKPR+JfwZaSBr2FQRAyuY82jB/HgoiRUWUir+FPEOlzOilwicEWbTeQcVR
         bNlAYnRoRqXWt23CMPwes61BZUHAxJzzlBTm8Za5QPwwdx1GQ8lg8g05ae3AjroIqp+D
         /DZ5U2ntyMgPxGyaGMRPJQuHsjfYHc5CgIHtgibB7LhQo6EkNwUhhyapJbIP07bNZpac
         m5yA==
X-Gm-Message-State: AOAM531WJLek9aRaj+XRWee+sO3acfwyu+75t9yC0rPIM82LWnlFkdz2
        0DNj/X91p+S647dFNgnUIQXH
X-Google-Smtp-Source: ABdhPJxRM9PQHBXXdV5DkxBGYt5j2yngr3PZYdVthkQadxzerS6KDef4fkH7pUHSRCfTzqoz/pMDkg==
X-Received: by 2002:a17:90a:de0c:: with SMTP id m12mr2362619pjv.224.1605770868240;
        Wed, 18 Nov 2020 23:27:48 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id a8sm26802923pfa.132.2020.11.18.23.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 23:27:47 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 4/4] clk: qcom: Add support for SDX55 RPMh clocks
Date:   Thu, 19 Nov 2020 12:57:14 +0530
Message-Id: <20201119072714.14460-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119072714.14460-1-manivannan.sadhasivam@linaro.org>
References: <20201119072714.14460-1-manivannan.sadhasivam@linaro.org>
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
2.17.1

