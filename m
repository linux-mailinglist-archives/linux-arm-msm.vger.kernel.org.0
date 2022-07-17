Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1317577627
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Jul 2022 14:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbiGQMdS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Jul 2022 08:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232136AbiGQMdR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Jul 2022 08:33:17 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9077614D29
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jul 2022 05:33:16 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id bk26so13239518wrb.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jul 2022 05:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j2BR3h16Mhy5gM4KsP6TulbAM/2F99pvBCc7QlwzcZ4=;
        b=ZbBiwnWJNKIr+NR37XpR7bSyqYBFbDrUDPWbNlxfXdnHWQXDVq5CxgdOJ2DGKUn/oa
         WYxvBFZWZC6ja2EyLW2VpjNJpx2FOVobl0NvrD2nX1gDIHmmqOTzJ8PVgtyVOVWXjAxi
         pJ/M+i1IomOyh8qmq7hHDgUE8pf2nJGcHJJPt38ZjFtRQSte4lfn7rkFXWLOgkC3Og5I
         sPg612k6g8V0OAbkMGdlaXT7+h3MXpSCrmsdFILk1d7hzJV80OBdZ0AYlH+TkObC1i2O
         1WAEWsI9AyVq3lIgQasMJ6eAjXIevem2cUa7OOlcspp57I+10sr/TbQD6SMcSXKmdlIG
         Ghig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j2BR3h16Mhy5gM4KsP6TulbAM/2F99pvBCc7QlwzcZ4=;
        b=IzVE6OSrcFunU5ZzRYy9S/bsV1dwQsBPJaxKwIk4CWRiUBb4V+VvSakHcbchg+LEu9
         p/FZIaI4bHGm1eSnWO6yiswepB0qyWjm6koaizkQSJeIgv8WKkh4dLlp/Eus/pGnSBwW
         0oYfZDJOqIwVJ6Xgx4p/tY+5ZZCM9diqkjMOlon7DBwG9KcLORfBthJW9kdujdsoXS/l
         i2kRlC14VppykpPTvPd2TyGqIcrOlZpGCz6UuDZbyz5D80Y3BybPZkRXetDX1qydxogU
         R6UWlpHoad1RMVBu/C9R/yl+Hmi+KV29vXimB4t+nnAC5MaOoOKlConF0A6yeQuATh6E
         yESA==
X-Gm-Message-State: AJIora8tL+0vwf2XjVq0SeakpmDwhi+p7NAq5YaXZmRB94BR7f/yMCxs
        6mCM8xrx1wLpMXHM+iJMzAohdw==
X-Google-Smtp-Source: AGRyM1tK90tcONCCmwdcbnUBnjLYo/lZl+KlirKq1g/sxB3t+rAkHO/ZgXor1/8R6Ulss4TnZXfVUg==
X-Received: by 2002:a05:6000:250:b0:21d:b3b5:3438 with SMTP id m16-20020a056000025000b0021db3b53438mr18010565wrz.203.1658061195148;
        Sun, 17 Jul 2022 05:33:15 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m9-20020adfe949000000b0021d4694fcaesm8146790wrn.107.2022.07.17.05.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 05:33:14 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, myungjoo.ham@samsung.com,
        cw00.choi@samsung.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        marijn.suijten@somainline.org, bryan.odonoghue@linaro.org
Subject: [PATCH v4 2/2] extcon: qcom-spmi: Switch to platform_get_irq_byname_optional
Date:   Sun, 17 Jul 2022 13:33:04 +0100
Message-Id: <20220717123304.938259-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220717123304.938259-1-bryan.odonoghue@linaro.org>
References: <20220717123304.938259-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Valid configurations for the extcon interrupt declarations are

- usb_id
- usb_vbus
- (usb_id | usb_vbus)

In the case of a standalone usb_id or usb_vbus failure to find one of the
interrupts shouldn't generate a warning message. A warning is already in
place if both IRQs are missing.

Switch to using platform_get_irq_byname_optional() in order to facilitate
this behaviour.

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/extcon/extcon-qcom-spmi-misc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/extcon/extcon-qcom-spmi-misc.c b/drivers/extcon/extcon-qcom-spmi-misc.c
index eb02cb962b5e1..f72e90ceca53d 100644
--- a/drivers/extcon/extcon-qcom-spmi-misc.c
+++ b/drivers/extcon/extcon-qcom-spmi-misc.c
@@ -123,7 +123,7 @@ static int qcom_usb_extcon_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	info->id_irq = platform_get_irq_byname(pdev, "usb_id");
+	info->id_irq = platform_get_irq_byname_optional(pdev, "usb_id");
 	if (info->id_irq > 0) {
 		ret = devm_request_threaded_irq(dev, info->id_irq, NULL,
 					qcom_usb_irq_handler,
@@ -136,7 +136,7 @@ static int qcom_usb_extcon_probe(struct platform_device *pdev)
 		}
 	}
 
-	info->vbus_irq = platform_get_irq_byname(pdev, "usb_vbus");
+	info->vbus_irq = platform_get_irq_byname_optional(pdev, "usb_vbus");
 	if (info->vbus_irq > 0) {
 		ret = devm_request_threaded_irq(dev, info->vbus_irq, NULL,
 					qcom_usb_irq_handler,
-- 
2.36.1

