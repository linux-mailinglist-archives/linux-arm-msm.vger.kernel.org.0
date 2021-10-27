Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF0E43CAE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Oct 2021 15:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242234AbhJ0Noh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Oct 2021 09:44:37 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:44392 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242220AbhJ0Noh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Oct 2021 09:44:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635342131; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=K2DRyS681vLFCxmR35OqxQBrOsZsWzlgiMZF/HzcXZM=; b=kqd0a8CD2cn6YoYTxU7l75UIBa4GjC5+Txu+gqWMduPpq8v96s5of1eIc2GfpXp8yvFA8T5K
 ES7HFTVI6k/bNds17Iq82ekmaSjKswXPZRLa0VGooHE7XMDaosM4GlZ2phnbTLdqOhancDtq
 QwcQKN05oanWpLGksU5EvHX1DVY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 61795728900d71ea1e818df6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 Oct 2021 13:42:00
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F18CBC43616; Wed, 27 Oct 2021 13:41:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4829CC43618;
        Wed, 27 Oct 2021 13:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 4829CC43618
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
Subject: [PATCH v2 1/3] pinctrl: qcom: Update lpass variant independent functions as generic
Date:   Wed, 27 Oct 2021 19:11:35 +0530
Message-Id: <1635342097-2726-2-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635342097-2726-1-git-send-email-srivasam@codeaurora.org>
References: <1635342097-2726-1-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update pin control variable names to make common for all lpass varients.
Update bulk clock voting to optional voting as ADSP bypass platform doesn't
need macro and decodec clocks, these are maintained as power domains and
operated from lpass audio core cc.

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 2f19ab4..0bd0c16 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -107,7 +107,7 @@ struct lpi_pinctrl {
 };
 
 /* sm8250 variant specific data */
-static const struct pinctrl_pin_desc sm8250_lpi_pins[] = {
+static const struct pinctrl_pin_desc lpass_lpi_pins[] = {
 	PINCTRL_PIN(0, "gpio0"),
 	PINCTRL_PIN(1, "gpio1"),
 	PINCTRL_PIN(2, "gpio2"),
@@ -124,7 +124,7 @@ static const struct pinctrl_pin_desc sm8250_lpi_pins[] = {
 	PINCTRL_PIN(13, "gpio13"),
 };
 
-enum sm8250_lpi_functions {
+enum lpass_lpi_functions {
 	LPI_MUX_dmic1_clk,
 	LPI_MUX_dmic1_data,
 	LPI_MUX_dmic2_clk,
@@ -203,7 +203,7 @@ static const struct lpi_pingroup sm8250_groups[] = {
 	LPI_PINGROUP(13, NO_SLEW, dmic3_data, i2s2_data, _, _),
 };
 
-static const struct lpi_function sm8250_functions[] = {
+static const struct lpi_function lpass_functions[] = {
 	LPI_FUNCTION(dmic1_clk),
 	LPI_FUNCTION(dmic1_data),
 	LPI_FUNCTION(dmic2_clk),
@@ -228,12 +228,12 @@ static const struct lpi_function sm8250_functions[] = {
 };
 
 static struct lpi_pinctrl_variant_data sm8250_lpi_data = {
-	.pins = sm8250_lpi_pins,
-	.npins = ARRAY_SIZE(sm8250_lpi_pins),
+	.pins = lpass_lpi_pins,
+	.npins = ARRAY_SIZE(lpass_lpi_pins),
 	.groups = sm8250_groups,
 	.ngroups = ARRAY_SIZE(sm8250_groups),
-	.functions = sm8250_functions,
-	.nfunctions = ARRAY_SIZE(sm8250_functions),
+	.functions = lpass_functions,
+	.nfunctions = ARRAY_SIZE(lpass_functions),
 };
 
 static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
@@ -615,7 +615,7 @@ static int lpi_pinctrl_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(pctrl->slew_base),
 				     "Slew resource not provided\n");
 
-	ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
+	ret = devm_clk_bulk_get_optional(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
 	if (ret)
 		return dev_err_probe(dev, ret, "Can't get clocks\n");
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

