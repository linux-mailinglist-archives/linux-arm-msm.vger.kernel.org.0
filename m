Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 107125B1B5E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 13:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231225AbiIHL0V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 07:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231236AbiIHL0T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 07:26:19 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9492BF56D0
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 04:26:02 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id e20so25478397wri.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 04:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=j2BR3h16Mhy5gM4KsP6TulbAM/2F99pvBCc7QlwzcZ4=;
        b=uXljko84xfgZ+EbWTYKt+EYyPNAn2VCe1GJ+ETRhy7sJdtRxGnwvZOum0FJuZHL2VU
         IoeKUEB1eJ7UfdasgqTG3JkOddRqmhCSxKk2QVh7KBD45mNSCRuWZS8sFHmJpV+0n3tP
         vZlxfYJ6wg6cMZSgs6NtQD+gWvLmVptb7GZ9ydpNpiDnVg79gUUb6heLomAGq9+Rtc3n
         hcr9zM8Gkba+NlaeHR/DVmijLFMlvGu9IaB5ZMqJp9CE6jyHMjiyAlpQYQqgeMvXbHoz
         +UBnGjRjju/4Esqao3NKDjhL64Pk+eG4JESKsPA/vG6B5ByCTN1aH5SLEDnfYNlhafLM
         Radw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=j2BR3h16Mhy5gM4KsP6TulbAM/2F99pvBCc7QlwzcZ4=;
        b=7arpTx7DpnVtVw4rWSzcWRerFEz0pVq9uyFkKZ1il5yTXejx0s/v0qTSgsws/RCp9B
         NsHgYBUYqszTnPpssph6tCZ4+Qv8FVdi3iE9Kw6KOTKwNFtK31ehQipOvtF2RXW8xN5+
         TWtMp/Yk4HsAGWUzr04CKgge4UwuRCXF/b6iZxpk7Co7sD8qBP3sbGxAO019nte1wV1O
         Oqd8xMrIWVWjiFF9sIZFvAHGUcTGe9p/EAlUsNH4unKU6fbn1/J+oo+GU/+Ec7vEbZ1C
         J4lIOxIki7JskRBMCSDvG+X/gr04rcvJkiw4j3JEkAf2TAMtunjjJAWiAnoH0NL4S5M1
         qw4g==
X-Gm-Message-State: ACgBeo3c2hi6BmlroG3hYOYjiVEU1fF1pFsaPv1eI9RSyKfPrNouJe/m
        CqLxZc5CroExlsmMhu6igsvWGw==
X-Google-Smtp-Source: AA6agR57oyHKdotUmWefM1G8UI42vl/MzGn78mUd6ti+t+FghYyFCFPVXHGvm9GSes3OXkJLgot2zg==
X-Received: by 2002:a05:6000:1146:b0:228:d61c:2c83 with SMTP id d6-20020a056000114600b00228d61c2c83mr4888181wrx.332.1662636361097;
        Thu, 08 Sep 2022 04:26:01 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id w10-20020a05600c474a00b003a608d69a64sm2582382wmo.21.2022.09.08.04.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 04:26:00 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, myungjoo.ham@samsung.com,
        cw00.choi@samsung.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gurus@codeaurora.org,
        marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH v4 2/2 RESEND] extcon: qcom-spmi: Switch to platform_get_irq_byname_optional
Date:   Thu,  8 Sep 2022 12:25:56 +0100
Message-Id: <20220908112556.860343-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220908112556.860343-1-bryan.odonoghue@linaro.org>
References: <20220908112556.860343-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
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

