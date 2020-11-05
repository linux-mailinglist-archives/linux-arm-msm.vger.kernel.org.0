Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 100292A7C2E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 11:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730133AbgKEKsq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Nov 2020 05:48:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730015AbgKEKsp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Nov 2020 05:48:45 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44714C0613D4
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2020 02:48:45 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id g7so894027pfc.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2020 02:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7xzfNtr8zKEQZfWNHzcQs/QsPT8QqrsuV/2rOop0v6k=;
        b=wQgCAtJ6Q49Q+La3x2z2UBeraTneHOAXQAE/VXhC4pQsD12ZdJlsDiJCJ+AG+GFBqZ
         5TOdRmCvecQ9SsYRy/q4hQARGEficCt0wj/zpxBH9vRHNRhEtHER3qxiUgAx0VmLZAOQ
         DnwewfuS4JYU0KbGGzeU4sVfqyFFSow/t+RIndwBm5ARnXj5g6e+r3Mhkcx032Nys0LF
         F9UYynewR1f7oUL5IxBUbF18onqzgxIyzmszOYKN9nBam6UIqJtQiCGKEQYMS5fflfOf
         bkcM3KTC2RpO+D0yYLjTPmQaZ1ZunvzahPo6cItmSULdjdTEdGZ2LxInb9+WQxXu+VmA
         7zsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7xzfNtr8zKEQZfWNHzcQs/QsPT8QqrsuV/2rOop0v6k=;
        b=HLAXjW0rzaCKZvAl7gKmXXQks8H2DIDOTUK/dQfRanc1lEDobC573a2gcjf+D0vxBd
         sUjdzXGLL1jm2wJDNVIeWC4OlkWKipqttFzSY0x65u+hMClEN/T8fBRHz/0RscwGBW6n
         uACPkqk0JlcHTMhU6Bm64aTb30qGGFC4k68CC3UnxcKbvMnQiDrFzMaEh/U4JsV5uhmi
         IMeEsoGvPtedZPMjo+6pkgYBAUfyhBfuOcQVDMyI6v1/IkRzQwO+JGVSZ6wBhSTrJGvN
         EvTniwb7d+H5L8xqlHuL/7FW4Ik4UYSs18du+vSaU0f8YSblMYUiH7wml0nDV8EChW+a
         n0zQ==
X-Gm-Message-State: AOAM531LzpRXH1dtq3/hSltETM+nc25wUXgd+75kq7offUYvpu5ySxlI
        E5rqmL9T8lOah1um3Z8sWGez
X-Google-Smtp-Source: ABdhPJx7Qx4kh0Toh5x92fRdTSbRuCWL47WKUW9nN5k2iziqtsRg/FpiqrUEDpopUCzaScF8NBEhCw==
X-Received: by 2002:a05:6a00:88d:b029:164:5a00:29b8 with SMTP id q13-20020a056a00088db02901645a0029b8mr2154062pfj.10.1604573324779;
        Thu, 05 Nov 2020 02:48:44 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id a84sm2131234pfa.53.2020.11.05.02.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 02:48:44 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 4/4] clk: qcom: Add support for SDX55 RPMh clocks
Date:   Thu,  5 Nov 2020 16:18:17 +0530
Message-Id: <20201105104817.15715-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201105104817.15715-1-manivannan.sadhasivam@linaro.org>
References: <20201105104817.15715-1-manivannan.sadhasivam@linaro.org>
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

