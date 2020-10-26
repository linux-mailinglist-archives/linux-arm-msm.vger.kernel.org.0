Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09B45298C9F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Oct 2020 13:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1774689AbgJZMCk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Oct 2020 08:02:40 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38644 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1774675AbgJZMCe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Oct 2020 08:02:34 -0400
Received: by mail-wr1-f66.google.com with SMTP id n18so12137073wrs.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2020 05:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=csBLm3ebHLvfnJwPW+GEPGSRmaYpvOkO16WRyubpNjA=;
        b=CQIAGolIi3P6jCUGq3bE7yNJUS8cGXQlkYbPeWnfSZI2Re9PMP2NGmoKpRJgos+56C
         6XC5SlNv9I601RC7hw5EpUkYn/cbaXdMjzoFRbclzk4KqyBWe5jOPcIA/rr64wL8/llG
         UtRhwTIXV9CQlqacrc0AblA4tObwYY6JtGNS7WPLPjH11QK4dqr9MqRXmYV+N3j0Vesn
         9KXLbO5i5dL9c+My0IdBW3/HPanw8gG1BJOJrZtM1UK/OEPKY3ZFKpJsNC8arZm1P7nY
         R3rucSgFx+N7KaWss5CcLr0/ygXTYWuADBACQXm2uPNUL92mR1P07GSXVFTZoug1ujHL
         Ggng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=csBLm3ebHLvfnJwPW+GEPGSRmaYpvOkO16WRyubpNjA=;
        b=FCIpebKNjxRALIZC+VuSxObs/i2Y9pppzVbQrPC2RKHQ/Mhj7w4UlSfTQINZSYsNzr
         ND34oWUSsVguqI6euy7NMOZbDhkMAKZbqARbzl0TWcAuGSAwR/mC6HkHgZ993j3xBZFT
         uGbe0j9bUMrY/lsry3yY42wedsHjqj5IE3jaaM3B3PpA7R9Aiex+ilL6zmKwWBJiIFZP
         8+CZ3zJgO4Nx/W4Og0+I3XRXQytkndRElHFs15gaLTDlhHP2IScO+i8B6D8+wAjxa9GA
         Xl1oQ12KwNZYWaWftJUdGGUIGw4rpcl9y43CJSx5BRfVIYLEI1HyTTt49PRiINv6ItIx
         zyuQ==
X-Gm-Message-State: AOAM531mne29mbZurQWRB9N9WnE3H+UCtkXCarPoB3af/i6bM+eN8OsT
        EGKY9ii+ba5uxv0WtR7bu4ay1g==
X-Google-Smtp-Source: ABdhPJzvTiSwyyzXUeBSenhdhpVq0hdbhCKuhAOzN/jtLyXmbp+scZip35ykfHF+Y8xfNaFN4XkHgA==
X-Received: by 2002:a5d:4282:: with SMTP id k2mr16794414wrq.270.1603713750422;
        Mon, 26 Oct 2020 05:02:30 -0700 (PDT)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id i33sm23659337wri.79.2020.10.26.05.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 05:02:29 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RESEND PATCH v3 4/4] clk: qcom: Add support to LPASS AON_CC Glitch Free Mux clocks
Date:   Mon, 26 Oct 2020 12:02:21 +0000
Message-Id: <20201026120221.18984-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201026120221.18984-1-srinivas.kandagatla@linaro.org>
References: <20201026120221.18984-1-srinivas.kandagatla@linaro.org>
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
index 48a73dd97d0d..d366c7c2abc7 100644
--- a/drivers/clk/qcom/lpass-gfm-sm8250.c
+++ b/drivers/clk/qcom/lpass-gfm-sm8250.c
@@ -18,6 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/of_device.h>
 #include <dt-bindings/clock/qcom,sm8250-lpass-audiocc.h>
+#include <dt-bindings/clock/qcom,sm8250-lpass-aoncc.h>
 
 struct lpass_gfm {
 	struct device *dev;
@@ -65,6 +66,46 @@ static const struct clk_ops clk_gfm_ops = {
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
+				.fw_name = "LPASS_CLK_ID_TX_CORE_MCLK",
+			}, {
+				.index = 1,
+				.fw_name = "LPASS_CLK_ID_VA_CORE_MCLK",
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
+				.fw_name = "LPASS_CLK_ID_TX_CORE_NPL_MCLK",
+			}, {
+				.index = 1,
+				.fw_name = "LPASS_CLK_ID_VA_CORE_2X_MCLK",
+			},
+		},
+		.num_parents = 2,
+	},
+};
+
 static struct clk_gfm lpass_gfm_wsa_mclk = {
 	.mux_reg = 0x220d8,
 	.mux_mask = BIT(0),
@@ -145,6 +186,19 @@ static struct clk_gfm lpass_gfm_rx_npl = {
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
@@ -172,6 +226,11 @@ static struct lpass_gfm_data audiocc_data = {
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
@@ -233,6 +292,10 @@ static int lpass_gfm_clk_driver_probe(struct platform_device *pdev)
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

