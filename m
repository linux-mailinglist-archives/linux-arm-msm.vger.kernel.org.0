Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B9DE26DCCD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 15:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbgIQN3o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Sep 2020 09:29:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726964AbgIQN3k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Sep 2020 09:29:40 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C78FC061226
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 06:29:02 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id a17so2078406wrn.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 06:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VXnokbFwaIT7VX7ySLaYW+p97LOfw5oIrujXpIr02w0=;
        b=YhtNwsS5EvW9wWdW0ET2SOg7FW6/fm0TOPmHQKipPLCr3EfGF1dYktxktoMauq3MyG
         Gtc3F4EdJm7Skmycwfiti1rvHXn5w5Y+pIYmtfz13lf8DovTFs5+WjrgOttK2mGIVDr4
         zO2h4zetldL4/9owZvYijsqtb4D3ppFAcTZ8rJdchatZnRbckqS4T9VAkUO4YrAN0DGt
         u8B+VB+3oyqvl6kYwKaYfrnVUEEf0fzPGxl+jWb/LCHto6aXmR1hOeWB0luqBgcw3Rlq
         P877I2RYE/VhlaQzsra3l3wYNn9/ADDUZ3Cn//OBjx9/4s+8gFiAtN+nA3kkLgls4TXp
         K1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VXnokbFwaIT7VX7ySLaYW+p97LOfw5oIrujXpIr02w0=;
        b=Nz5rKcoH3UUUkFprOQfSBPrS8X74u8udyIFL263P8JZB1vH2SnvJx+GIYsnJKoUfwe
         M0yK1JV0rn35ljR4fW3CAB/JkMebUI/HpcapWBZWqXa0EfXIxde34mCw8etNk9YIm/sw
         +NotU06NEg2Ie5SyIBU7V0MR8GyMzuAtEQO5XlfrBFQ4632XmTtz8HM7UO5PiPzqfrLl
         xctV8EVOwwexgZmPMMHfoVz2cssezgw8ALQXnUKjN6cMN17d1T6wEy3Gbc8F6X7vDtq6
         ceKid0HW4SDX3EI3+EYug9VFhnrI09PEY3Ud4Qoj5XVRcHYUeiV298sjJrYunmNM4nLA
         dkTw==
X-Gm-Message-State: AOAM533lTsZTRr9R7ZqXCUQP09tWxAlVpDaqJvUAf+tByWFKXv5UrYOH
        VvPlnrQq8HhEf1EaERQxuzA3hA==
X-Google-Smtp-Source: ABdhPJxwtR7oBdq4afBifC7Rg+K/286K5d8bHf/oiQjz59hxtnrtlu7e7eCW1oFzS8JgGdVTD3B3GA==
X-Received: by 2002:adf:e304:: with SMTP id b4mr31131498wrj.141.1600349341564;
        Thu, 17 Sep 2020 06:29:01 -0700 (PDT)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id n10sm11486910wmk.7.2020.09.17.06.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 06:29:00 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 4/4] clk: qcom: Add support to LPASS AON_CC Glitch Free Mux clocks
Date:   Thu, 17 Sep 2020 14:28:50 +0100
Message-Id: <20200917132850.7730-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200917132850.7730-1-srinivas.kandagatla@linaro.org>
References: <20200917132850.7730-1-srinivas.kandagatla@linaro.org>
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
 drivers/clk/qcom/lpass-gfm-sm8250.c | 61 +++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/clk/qcom/lpass-gfm-sm8250.c b/drivers/clk/qcom/lpass-gfm-sm8250.c
index 2d5c41ae4969..6b11bea912bf 100644
--- a/drivers/clk/qcom/lpass-gfm-sm8250.c
+++ b/drivers/clk/qcom/lpass-gfm-sm8250.c
@@ -12,6 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/of_device.h>
 #include <dt-bindings/clock/qcom,sm8250-lpass-audiocc.h>
+#include <dt-bindings/clock/qcom,sm8250-lpass-aoncc.h>
 
 struct lpass_gfm {
 	struct device *dev;
@@ -61,6 +62,44 @@ static const struct clk_ops clk_gfm_ops = {
 	.determine_rate = __clk_mux_determine_rate,
 };
 
+static struct clk_gfm lpass_gfm_va_mclk = {
+	.mux_reg = 0x20000,
+	.mux_mask = BIT(0),
+	.hw.init = &(struct clk_init_data) {
+		.name = "VA_MCLK",
+		.ops = &clk_gfm_ops,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.parent_names = (const char *[]) {
+			"LPASS_CLK_ID_TX_CORE_MCLK",
+			"LPASS_CLK_ID_VA_CORE_MCLK",
+		},
+		.num_parents = 2,
+		.parent_data = (const struct clk_parent_data[]){
+				{ .index = 0 },
+				{ .index = 1 },
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
+		.parent_names = (const char *[]){
+			"LPASS_CLK_ID_TX_CORE_NPL_MCLK",
+			"LPASS_CLK_ID_VA_CORE_2X_MCLK",
+		},
+		.parent_data = (const struct clk_parent_data[]){
+				{ .index = 0 },
+				{ .index = 1 },
+		},
+		.num_parents = 2,
+	},
+};
+
 static struct clk_gfm lpass_gfm_wsa_mclk = {
 	.mux_reg = 0x220d8,
 	.mux_mask = BIT(0),
@@ -137,6 +176,19 @@ static struct clk_gfm lpass_gfm_rx_npl = {
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
@@ -164,6 +216,11 @@ static struct lpass_gfm_data audiocc_data = {
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
@@ -218,6 +275,10 @@ static int lpass_gfm_clk_driver_probe(struct platform_device *pdev)
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

