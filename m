Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 393A536C6AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Apr 2021 15:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236241AbhD0NGW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Apr 2021 09:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235795AbhD0NGV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Apr 2021 09:06:21 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B721CC06175F
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Apr 2021 06:05:36 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id q9so5232309wrs.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Apr 2021 06:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=byleSoR3uVivo8lWUxItN76uGnD6h4WkxkvPblf1pgs=;
        b=Vm62xYFJD6sXJffoKQwrG3Qm/9tpvPEPak3PAkkh+WJTaHtNBM6qd/5cvg9RxyEjz1
         TgnkkMuGSip/FDy1c8of7lDfWBrJFVCihuOriM3Wkdas73I1WHrMiRCEyg8GrZwTtg+t
         sQNbKZ5tqzSRvcriiTrtzmn192RpuIJmHFQOOlOMeHS3xaR2pJCBcFz7+Ebc7r8RfTTA
         EPVVLlIiG7jJYP5vdeCjUsnRVNUPFzTCbBQDZa96wNHed+NSGq1AF/cEPLeBFJ/3Vd+Y
         qyVL/SRoCSDU7IXJID4bya/uiwb+6zcFKKhUSibsl7K8+bt22CwwNrgSG+Z14j1tNUzq
         9DKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=byleSoR3uVivo8lWUxItN76uGnD6h4WkxkvPblf1pgs=;
        b=CmwaWmMgWnl0So57Pxd35hJLJa/o8HGi6YnPSOjOiw084pA0vING1m6/aWp+WIV+zM
         a5yF06W5CncwtP3/zlFMju7k3XCKhV3TUP/wwSOMum0a7z3xVdCppjZ3xXFA+f7S00+D
         Fb56zGP2WF1cSQr3BniYLQ8fNtBaTfElBzBXjr21NRBprJ5mJMGBpr1RryhxH+VBm52d
         1lz15GqXmOFPDCe+yYa2IXwKkraxGSsFKnoNkekyDN+i9Sn5rEhNKbODcCWFB+aA7zNq
         WblIXqKjTnHkJa3TD6Muchnal06z2u7Ah9eurB3ktsKT0s6e2vHdvpeD3sX7O/MuNPxU
         2aYA==
X-Gm-Message-State: AOAM530TpyZB8FYjPM4HUw+06jyj7IrwnrhWVXLQSpjk6hKXdmvb+Qv+
        +5z79wrGYMVwqCQ8ttl5DJbF0g==
X-Google-Smtp-Source: ABdhPJwvqnAUP+plOV3sNDJDRqdEc2y3nYQfJGdjh0rvTer9whOfCxjB9ykZHZbhCrhBGcvnt18FYw==
X-Received: by 2002:adf:f6c8:: with SMTP id y8mr8991884wrp.325.1619528735458;
        Tue, 27 Apr 2021 06:05:35 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y19sm2488118wmj.28.2021.04.27.06.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 06:05:34 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 1/2] regulator: Add a routine to set the current limit for QCOM PMIC VBUS
Date:   Tue, 27 Apr 2021 14:07:11 +0100
Message-Id: <20210427130712.2005456-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210427130712.2005456-1-bryan.odonoghue@linaro.org>
References: <20210427130712.2005456-1-bryan.odonoghue@linaro.org>
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

