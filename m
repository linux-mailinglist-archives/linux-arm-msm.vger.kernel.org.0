Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBBD043CAEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Oct 2021 15:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242243AbhJ0Nov (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Oct 2021 09:44:51 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:18970 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242249AbhJ0Nos (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Oct 2021 09:44:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635342143; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=J3EW1Zq2am1RTaPdOiCGqfwjRwDl6DkV6HGUmMii8GM=; b=rS93HTxNqQNEqWiIQBsf/J9tecgor3OBPSEX8GIxfRXs9/dagZt5XkQkOA8tGAgXEWbR3Sgw
 /3yi4lHfQ2LHNUPExCbTc+1D+PSQjnmhbeEw08cIt0woinNmkV35bVFZ5WtpwZ7IeETGFexY
 pZzC9TE1IRiO6Wk73cy+FtA2OEE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 617957342e144ac4d3edb16e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 Oct 2021 13:42:12
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3FC5EC4360C; Wed, 27 Oct 2021 13:42:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9ECC8C4360C;
        Wed, 27 Oct 2021 13:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 9ECC8C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Venkata Prasad Potturu <potturu@codeaurora.org>
Subject: [PATCH v2 3/3] pinctrl: qcom: Add SC7280 lpass pin configuration
Date:   Wed, 27 Oct 2021 19:11:37 +0530
Message-Id: <1635342097-2726-4-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635342097-2726-1-git-send-email-srivasam@codeaurora.org>
References: <1635342097-2726-1-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update pin control support for SC7280 LPASS LPI.

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 0bd0c16..17a05a6 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -122,6 +122,7 @@ static const struct pinctrl_pin_desc lpass_lpi_pins[] = {
 	PINCTRL_PIN(11, "gpio11"),
 	PINCTRL_PIN(12, "gpio12"),
 	PINCTRL_PIN(13, "gpio13"),
+	PINCTRL_PIN(14, "gpio14"),
 };
 
 enum lpass_lpi_functions {
@@ -136,6 +137,7 @@ enum lpass_lpi_functions {
 	LPI_MUX_i2s1_ws,
 	LPI_MUX_i2s2_clk,
 	LPI_MUX_i2s2_data,
+	LPI_MUX_sc7280_i2s2_data,
 	LPI_MUX_i2s2_ws,
 	LPI_MUX_qua_mi2s_data,
 	LPI_MUX_qua_mi2s_sclk,
@@ -144,6 +146,7 @@ enum lpass_lpi_functions {
 	LPI_MUX_swr_rx_data,
 	LPI_MUX_swr_tx_clk,
 	LPI_MUX_swr_tx_data,
+	LPI_MUX_sc7280_swr_tx_data,
 	LPI_MUX_wsa_swr_clk,
 	LPI_MUX_wsa_swr_data,
 	LPI_MUX_gpio,
@@ -164,8 +167,11 @@ static const unsigned int gpio10_pins[] = { 10 };
 static const unsigned int gpio11_pins[] = { 11 };
 static const unsigned int gpio12_pins[] = { 12 };
 static const unsigned int gpio13_pins[] = { 13 };
+static const unsigned int gpio14_pins[] = { 14 };
+
 static const char * const swr_tx_clk_groups[] = { "gpio0" };
 static const char * const swr_tx_data_groups[] = { "gpio1", "gpio2", "gpio5" };
+static const char * const sc7280_swr_tx_data_groups[] = { "gpio1", "gpio2", "gpio14" };
 static const char * const swr_rx_clk_groups[] = { "gpio3" };
 static const char * const swr_rx_data_groups[] = { "gpio4", "gpio5" };
 static const char * const dmic1_clk_groups[] = { "gpio6" };
@@ -185,6 +191,7 @@ static const char * const i2s1_data_groups[] = { "gpio8", "gpio9" };
 static const char * const wsa_swr_clk_groups[] = { "gpio10" };
 static const char * const wsa_swr_data_groups[] = { "gpio11" };
 static const char * const i2s2_data_groups[] = { "gpio12", "gpio12" };
+static const char * const sc7280_i2s2_data_groups[] = { "gpio12", "gpio13" };
 
 static const struct lpi_pingroup sm8250_groups[] = {
 	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
@@ -203,6 +210,24 @@ static const struct lpi_pingroup sm8250_groups[] = {
 	LPI_PINGROUP(13, NO_SLEW, dmic3_data, i2s2_data, _, _),
 };
 
+static const struct lpi_pingroup sc7280_groups[] = {
+	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
+	LPI_PINGROUP(1, 2, swr_tx_data, qua_mi2s_ws, _, _),
+	LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
+	LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
+	LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
+	LPI_PINGROUP(5, 12, swr_rx_data, _, _, _),
+	LPI_PINGROUP(6, NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
+	LPI_PINGROUP(7, NO_SLEW, dmic1_data, i2s1_ws, _, _),
+	LPI_PINGROUP(8, NO_SLEW, dmic2_clk, i2s1_data, _, _),
+	LPI_PINGROUP(9, NO_SLEW, dmic2_data, i2s1_data, _, _),
+	LPI_PINGROUP(10, 16, i2s2_clk, wsa_swr_clk, _, _),
+	LPI_PINGROUP(11, 18, i2s2_ws, wsa_swr_data, _, _),
+	LPI_PINGROUP(12, NO_SLEW, dmic3_clk, sc7280_i2s2_data, _, _),
+	LPI_PINGROUP(13, NO_SLEW, dmic3_data, sc7280_i2s2_data, _, _),
+	LPI_PINGROUP(14, 6, sc7280_swr_tx_data, _, _, _),
+};
+
 static const struct lpi_function lpass_functions[] = {
 	LPI_FUNCTION(dmic1_clk),
 	LPI_FUNCTION(dmic1_data),
@@ -215,6 +240,7 @@ static const struct lpi_function lpass_functions[] = {
 	LPI_FUNCTION(i2s1_ws),
 	LPI_FUNCTION(i2s2_clk),
 	LPI_FUNCTION(i2s2_data),
+	LPI_FUNCTION(sc7280_i2s2_data),
 	LPI_FUNCTION(i2s2_ws),
 	LPI_FUNCTION(qua_mi2s_data),
 	LPI_FUNCTION(qua_mi2s_sclk),
@@ -223,6 +249,7 @@ static const struct lpi_function lpass_functions[] = {
 	LPI_FUNCTION(swr_rx_data),
 	LPI_FUNCTION(swr_tx_clk),
 	LPI_FUNCTION(swr_tx_data),
+	LPI_FUNCTION(sc7280_swr_tx_data),
 	LPI_FUNCTION(wsa_swr_clk),
 	LPI_FUNCTION(wsa_swr_data),
 };
@@ -236,6 +263,15 @@ static struct lpi_pinctrl_variant_data sm8250_lpi_data = {
 	.nfunctions = ARRAY_SIZE(lpass_functions),
 };
 
+static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
+	.pins = lpass_lpi_pins,
+	.npins = ARRAY_SIZE(lpass_lpi_pins),
+	.groups = sc7280_groups,
+	.ngroups = ARRAY_SIZE(sc7280_groups),
+	.functions = lpass_functions,
+	.nfunctions = ARRAY_SIZE(lpass_functions),
+};
+
 static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
 			 unsigned int addr)
 {
@@ -677,6 +713,10 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 	       .compatible = "qcom,sm8250-lpass-lpi-pinctrl",
 	       .data = &sm8250_lpi_data,
 	},
+	{
+	       .compatible = "qcom,sc7280-lpass-lpi-pinctrl",
+	       .data = &sc7280_lpi_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

