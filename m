Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20C6236BB7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Apr 2021 00:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232235AbhDZWNy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Apr 2021 18:13:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232062AbhDZWNy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Apr 2021 18:13:54 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05952C061760
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 15:13:12 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id n4-20020a05600c4f84b029013151278decso5785051wmq.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 15:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=byleSoR3uVivo8lWUxItN76uGnD6h4WkxkvPblf1pgs=;
        b=QNdRK6x1Vu5iyxHDPdpYUwhnDmIWWvcN9VR7TZg7xM1ZDisCReZJj3YfopGtBN1/cs
         rowkW+8SpGTpEyeWWWUQAa1NYKNDvOKPhO2p7YJVVSL9TEfJIAXapqYJLvYKhiQ+H5uq
         9x0TVH3ZsS30HWO81USMPJkuwuugeb1neFJc7d61h+CdjP/+yFBMewzUOL1BS7oYZW8G
         oBY8SZanKfMd10bDU2zIu0KOGTVMcXb/MnwcyTlTUUFFeuxXVfB7KoUxzcCP5BcQgdpc
         u2X7O00rV1j0YfVSE0AUYuQcreIiLqkZDsdJJQDc7hsl+4qywcDlkaseby/S9nll6xCj
         qEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=byleSoR3uVivo8lWUxItN76uGnD6h4WkxkvPblf1pgs=;
        b=UKgujUlc0SJS7k0e9cHaVpWB5vEbVM62QIrZgrHVRntFX4Y6wldkvMjFyYCftVaNhM
         qmbLbHcWN8Xn/bQHZ0z58Yz/uhfeZ3Jx4vFI/7Rob88uus6R6710GwbsfUM5jDkAPxiJ
         PU9Ynye5Ll5iTf9tY2IFMWWwqalCU6PlyvqbcXMGaa1Y5dQulh7z+C/2qnZH6/yZbORG
         uHpdoE4XwfXfIgkhEJFImJ6OnGMo3ep6c/WMmBOehDn56EDpVR21Zfv8BNi6Osx2YARP
         T1djMKkuhsvYXmof+UI2Wo74WZK7R7yimM1vNSb/V5QOBC/TKYEnOGm1hh+MZxkTLyZ0
         nBwg==
X-Gm-Message-State: AOAM533cpwF6704QcB+C2y1vCitraYgg2cO4ugVwB8ImdibtXzhx0GOe
        V/KrJXQEAAmd+c0qKJWEOWwEeg==
X-Google-Smtp-Source: ABdhPJy1dkv5xxjAEym0tOdVzG2x1GsRCPWb+vN+7eBoVgGw6bSbuYAsKf/2bCJNdEY62G3PbaMEQw==
X-Received: by 2002:a1c:740c:: with SMTP id p12mr3198068wmc.112.1619475190749;
        Mon, 26 Apr 2021 15:13:10 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x9sm1756042wrt.13.2021.04.26.15.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 15:13:10 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 1/2] regulator: Add a routine to set the current limit for QCOM PMIC VBUS
Date:   Mon, 26 Apr 2021 23:14:45 +0100
Message-Id: <20210426221446.1852572-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210426221446.1852572-1-bryan.odonoghue@linaro.org>
References: <20210426221446.1852572-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add hooks to regulator_get_current_limit_regmap() and
regulator_set_current_limit_regmap() with an accompanying map of amperages.

This lets us use the existing helper functions to map requested current
settings to register bit-map/indicies.

This change is required to elevate the default 2 Amps set by the bootloader
to 3 Amps or indeed to constrain the value lower as the system design may
dictate.

The valid range is 500 mA to 3 A in increments of 500 mA.

Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/regulator/qcom_usb_vbus-regulator.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regulator/qcom_usb_vbus-regulator.c
index 457788b505720..2e627c2b6c512 100644
--- a/drivers/regulator/qcom_usb_vbus-regulator.c
+++ b/drivers/regulator/qcom_usb_vbus-regulator.c
@@ -16,13 +16,21 @@
 
 #define CMD_OTG				0x40
 #define OTG_EN				BIT(0)
+#define OTG_CURRENT_LIMIT_CFG		0x52
+#define OTG_CURRENT_LIMIT_MASK		GENMASK(2, 0)
 #define OTG_CFG				0x53
 #define OTG_EN_SRC_CFG			BIT(1)
 
+static const unsigned int curr_table[] = {
+	500000, 1000000, 1500000, 2000000, 2500000, 3000000,
+};
+
 static const struct regulator_ops qcom_usb_vbus_reg_ops = {
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
 	.is_enabled = regulator_is_enabled_regmap,
+	.get_current_limit = regulator_get_current_limit_regmap,
+	.set_current_limit = regulator_set_current_limit_regmap,
 };
 
 static struct regulator_desc qcom_usb_vbus_rdesc = {
@@ -30,6 +38,8 @@ static struct regulator_desc qcom_usb_vbus_rdesc = {
 	.ops = &qcom_usb_vbus_reg_ops,
 	.owner = THIS_MODULE,
 	.type = REGULATOR_VOLTAGE,
+	.curr_table = curr_table,
+	.n_current_limits = ARRAY_SIZE(curr_table),
 };
 
 static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
@@ -61,6 +71,8 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
 
 	qcom_usb_vbus_rdesc.enable_reg = base + CMD_OTG;
 	qcom_usb_vbus_rdesc.enable_mask = OTG_EN;
+	qcom_usb_vbus_rdesc.csel_reg = base + OTG_CURRENT_LIMIT_CFG;
+	qcom_usb_vbus_rdesc.csel_mask = OTG_CURRENT_LIMIT_MASK;
 	config.dev = dev;
 	config.init_data = init_data;
 	config.of_node = dev->of_node;
-- 
2.30.1

