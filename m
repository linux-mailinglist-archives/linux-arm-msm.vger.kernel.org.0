Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9019C369699
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 18:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbhDWQGB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 12:06:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbhDWQGA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 12:06:00 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88470C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 09:05:23 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id q123-20020a1c43810000b029012c7d852459so6048798wma.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 09:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jDSQ/AePgWE1VFrLupg1/njN79SulFjy8ug2cVNAJSE=;
        b=aS7RUEu+pmlLTK+MwZD7dHNoC2e7hObcHYEG0uJKfNM+w9Rawurf3L15goposbPw4O
         cRXuC2u0w24mCM3N/LNjtp+RsRyzCCobDrH1yYLXcaDbzC8P1Jn4ycjQrGBzTIOc7T7+
         2YnCNworrIcnJ0mYr0GrWqO+BLwTUIzzXkURlPRAlt8lh621zDEutJgJSIxRrgfdVKcO
         j+EDVgxlTltYsrQ3NtVR2NRVh8VD0YrieQP7VLdY4K7/b/jRqcMl1wJ88fq/naVorFnD
         JeliI0MfeDHtVe4PeweNXTAyC6d45crmi3PUntakmaCFwY94InaX1f5ytO+YooUljrEX
         69NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jDSQ/AePgWE1VFrLupg1/njN79SulFjy8ug2cVNAJSE=;
        b=DubGI/vZThmx2dFMPxtRFrZo58sZzpS0GgDbecznOD/W3tIZBe0thgVn2RRMAggUNU
         lkeM3h3RM3vqoHw+b2oBBYOCsuSx9MbbNHKuZ92EqzsxN2GkrD+p1k7/nvdWrwaacx/r
         ouBKGPmPQANofJaT1phmPXnx39CXwAe1ykerVcOEi9/CraSw2RpjYiceuUBuBspZwH7b
         8peECX1+N263nsaM8g6G3/2QKIZnMob236l4c7S7ws7yWglIIu6NaWPzZLbrXDRHH1iI
         nRSBdxgfKvifGqjpRLuPHVY2gn7h64lfgO0IaX4i+T5tFkmDNjM+XaJ7FrfaxQJHsOG3
         XI1g==
X-Gm-Message-State: AOAM530sMH+BRJSmWp+5vfdSjiEl1SXBMiSHJUIAMS9nBEeVCAB1V0la
        Iug+P7sRgUka61y2wm7IP1hCcw==
X-Google-Smtp-Source: ABdhPJzpmPMFHFOlhDRoeBE9QsGCNgJEw15u0MF7xKN3H7fkXg4vCsx6eelUMXUzM40EmgOpyvmD/g==
X-Received: by 2002:a05:600c:4f07:: with SMTP id l7mr6195755wmq.53.1619193922191;
        Fri, 23 Apr 2021 09:05:22 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id z16sm9729711wrq.21.2021.04.23.09.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 09:05:21 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org
Cc:     wcheng@codeaurora.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH] regulator: Fix current limit for QCOM PMIC VBUS
Date:   Fri, 23 Apr 2021 17:06:58 +0100
Message-Id: <20210423160658.1542090-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VBUS current at +5 V on the pm8150b can be.

500 mA
1000 mA
1500 mA
2000 mA
2500 mA
3000 mA

Only 500 mA, 1 A, 1.5 A or 3 A is valid with respect to the standard.
Right now the first stage bootloader sets the value to 2 A. 2 A is just
fine until you connect a chunky enough type-c accessory.

Debugging a separate USB problem I noticed that a larger type-c dongle I
had was ramping VBUS up and then collapsing, never getting to +5 V.
Different dongles would get to +5 V and importantly downstream would
happily power the bigger dongle.

The root cause is failure to set the higher current limit to 3 A instead of
the defaulting 2 A from the bootloader.

Fixes: 4fe66d5a62fb ("regulator: Add support for QCOM PMIC VBUS booster")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/regulator/qcom_usb_vbus-regulator.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regulator/qcom_usb_vbus-regulator.c
index 457788b505720..2b19e0483fccd 100644
--- a/drivers/regulator/qcom_usb_vbus-regulator.c
+++ b/drivers/regulator/qcom_usb_vbus-regulator.c
@@ -16,6 +16,14 @@
 
 #define CMD_OTG				0x40
 #define OTG_EN				BIT(0)
+#define OTG_CURRENT_LIMIT_CFG		0x52
+#define OTG_CURRENT_LIMIT_500MA		0
+#define OTG_CURRENT_LIMIT_1000MA	BIT(0)
+#define OTG_CURRENT_LIMIT_1500MA	BIT(1)
+#define OTG_CURRENT_LIMIT_2000MA	(BIT(1) | BIT(0))
+#define OTG_CURRENT_LIMIT_2500MA	BIT(2)
+#define OTG_CURRENT_LIMIT_3000MA	(BIT(2) | BIT(0))
+#define OTG_CURRENT_LIMIT_MASK		(BIT(2) | BIT(0))
 #define OTG_CFG				0x53
 #define OTG_EN_SRC_CFG			BIT(1)
 
@@ -76,6 +84,10 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
 	/* Disable HW logic for VBUS enable */
 	regmap_update_bits(regmap, base + OTG_CFG, OTG_EN_SRC_CFG, 0);
 
+	/* Set OTG current limit to 3000mA up from bootloader set 2000mA */
+	regmap_update_bits(regmap, base + OTG_CURRENT_LIMIT_CFG,
+			   OTG_CURRENT_LIMIT_MASK, OTG_CURRENT_LIMIT_3000MA);
+
 	return 0;
 }
 
-- 
2.30.1

