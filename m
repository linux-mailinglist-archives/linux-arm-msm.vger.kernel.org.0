Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 410C7278525
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Sep 2020 12:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727402AbgIYKbo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Sep 2020 06:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728159AbgIYKbk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Sep 2020 06:31:40 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AFF1C0613CE
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2020 03:31:40 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id e2so2726912wme.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2020 03:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GSNf91BNoP+VEJBm3varO7K3q1jYUmCrDeGvzncP4RA=;
        b=QacEp1OaZsy3mDOo+7h0uVB2aukX9mC0D3Zj7Bb+cE58joZM/wxHBbkjHDuLhJfeEr
         mqNncXMX/bDcerwQkg5Mag7L6n56ei6w+C57kwYWPCl/rZG8AG6AZCgEko8VAslvG7Or
         PC3L3uOrKeQCeXvyUg60qCheQy3eb3b2WInGIyVgypcnW73TJ1El+XOD7tZXDJ0NLMJE
         WKVgXx7xkt/giLgTDLVPw8YNl1dfnZcIEhyUWm84J6bkHp/jq8u5fC97YACJc8USBUOl
         jCpZQdegv6nSKMKwbnQRtzm7H6G+kRda2XdftN5lUENPQk/C1s/0M+hruwkZDBLtpP9/
         I/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GSNf91BNoP+VEJBm3varO7K3q1jYUmCrDeGvzncP4RA=;
        b=cmFPNAm/HuXjSPOQE+Ta9DOidOeY8NG8V91skkstKJ5PZqiHcmssT8M/0QKEgArfz5
         GHUgPZCphyPLDGm5ILTZyTAAXTDPckolwWjLI5t1LvOgBYqPlgLtwV8Rbzp+5tuwDznA
         niRRI+aZJyIIj5acDOO0qtoH8ihR6j1UsDpDJK9CKYKWvCpNfMyGEiwo8f+lb3BRCTun
         mRiaTHYTUUROHzx7C+FY/6t8/K9G0Ip0FMX7UKPLENJWrrzOAkUM9MuMUsKO6zEq9UKQ
         Db5Z70G/vtHWYejqAnDm+QD2FOhHToabk8hUQ6KHLkWuqz6bxeDnaKlCyS+8JSvZjJuF
         iWcA==
X-Gm-Message-State: AOAM530dRkLw+eV37DdzatTfg5RVw64mBCh7ErhYIvbF+TbC5dYU5+zV
        a26wiTXEoDexrACeqHfmzErmHQ==
X-Google-Smtp-Source: ABdhPJz/GbRRFBqPk2DEY7OZXpKv5qvcB8Fhp/LMNbQbXFjHr6HeA+Vgjc2KSL6Iu2ua/FyY1oPIUw==
X-Received: by 2002:a1c:8187:: with SMTP id c129mr2521448wmd.82.1601029898317;
        Fri, 25 Sep 2020 03:31:38 -0700 (PDT)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id 11sm2354907wmi.14.2020.09.25.03.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 03:31:37 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 4/4] clk: qcom: Add support to LPASS AON_CC Glitch Free Mux clocks
Date:   Fri, 25 Sep 2020 11:31:15 +0100
Message-Id: <20200925103115.15191-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200925103115.15191-1-srinivas.kandagatla@linaro.org>
References: <20200925103115.15191-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

LPASS Always ON Clock controller has one GFM mux to control VA
and TX clocks to codec macro on LPASS.
This patch adds support to this mux.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/clk/qcom/lpass-gfm-sm8250.c | 63 +++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/clk/qcom/lpass-gfm-sm8250.c b/drivers/clk/qcom/lpass-gfm-sm8250.c
index c79854e1494d..61a89347885e 100644
--- a/drivers/clk/qcom/lpass-gfm-sm8250.c
+++ b/drivers/clk/qcom/lpass-gfm-sm8250.c
@@ -19,6 +19,7 @@
 #include <linux/platform_device.h>
 #include <linux/of_device.h>
 #include <dt-bindings/clock/qcom,sm8250-lpass-audiocc.h>
+#include <dt-bindings/clock/qcom,sm8250-lpass-aoncc.h>
 
 struct lpass_gfm {
 	struct device *dev;
@@ -66,6 +67,46 @@ static const struct clk_ops clk_gfm_ops = {
 	.determine_rate = __clk_mux_determine_rate,
 };
 
+static struct clk_gfm lpass_gfm_va_mclk = {
+	.mux_reg = 0x20000,
+	.mux_mask = BIT(0),
+	.hw.init = &(struct clk_init_data) {
+		.name = "VA_MCLK",
+		.ops = &clk_gfm_ops,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.num_parents = 2,
+		.parent_data = (const struct clk_parent_data[]){
+			{
+				.index = 0,
+				.name = "LPASS_CLK_ID_TX_CORE_MCLK",
+			}, {
+				.index = 1,
+				.name = "LPASS_CLK_ID_VA_CORE_MCLK",
+			},
+		},
+	},
+};
+
+static struct clk_gfm lpass_gfm_tx_npl = {
+	.mux_reg = 0x20000,
+	.mux_mask = BIT(0),
+	.hw.init = &(struct clk_init_data) {
+		.name = "TX_NPL",
+		.ops = &clk_gfm_ops,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.parent_data = (const struct clk_parent_data[]){
+			{
+				.index = 0,
+				.name = "LPASS_CLK_ID_TX_CORE_NPL_MCLK",
+			}, {
+				.index = 1,
+				.name = "LPASS_CLK_ID_VA_CORE_2X_MCLK",
+			},
+		},
+		.num_parents = 2,
+	},
+};
+
 static struct clk_gfm lpass_gfm_wsa_mclk = {
 	.mux_reg = 0x220d8,
 	.mux_mask = BIT(0),
@@ -146,6 +187,19 @@ static struct clk_gfm lpass_gfm_rx_npl = {
 	},
 };
 
+static struct clk_gfm *aoncc_gfm_clks[] = {
+	[LPASS_CDC_VA_MCLK]		= &lpass_gfm_va_mclk,
+	[LPASS_CDC_TX_NPL]		= &lpass_gfm_tx_npl,
+};
+
+static struct clk_hw_onecell_data aoncc_hw_onecell_data = {
+	.hws = {
+		[LPASS_CDC_VA_MCLK]	= &lpass_gfm_va_mclk.hw,
+		[LPASS_CDC_TX_NPL]	= &lpass_gfm_tx_npl.hw,
+	},
+	.num = ARRAY_SIZE(aoncc_gfm_clks),
+};
+
 static struct clk_gfm *audiocc_gfm_clks[] = {
 	[LPASS_CDC_WSA_NPL]		= &lpass_gfm_wsa_npl,
 	[LPASS_CDC_WSA_MCLK]		= &lpass_gfm_wsa_mclk,
@@ -173,6 +227,11 @@ static struct lpass_gfm_data audiocc_data = {
 	.gfm_clks = audiocc_gfm_clks,
 };
 
+static struct lpass_gfm_data aoncc_data = {
+	.onecell_data = &aoncc_hw_onecell_data,
+	.gfm_clks = aoncc_gfm_clks,
+};
+
 static int lpass_gfm_clk_driver_probe(struct platform_device *pdev)
 {
 	const struct lpass_gfm_data *data;
@@ -236,6 +295,10 @@ static int lpass_gfm_clk_driver_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id lpass_gfm_clk_match_table[] = {
+	{
+		.compatible = "qcom,sm8250-lpass-aoncc",
+		.data = &aoncc_data,
+	},
 	{
 		.compatible = "qcom,sm8250-lpass-audiocc",
 		.data = &audiocc_data,
-- 
2.21.0

