Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8956D46CB5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jun 2019 01:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbfFNXO7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jun 2019 19:14:59 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41848 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbfFNXO6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jun 2019 19:14:58 -0400
Received: by mail-pf1-f193.google.com with SMTP id m30so2261076pff.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2019 16:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LNT+l1wAM3ExTzu8kAKF3OCBx9DgMUq0svFdafuGiNA=;
        b=wYFDcfZ8k1FgZfZP+uKORVWTSenE7XCVBZUbUaLM0tiQX93fBu7dfK0YQEg9UDLF6C
         qqK11P3GuYr7IOpkAdCgbHvbL2OGheySKIFN/6ntMsqCBuZ5dxFwaDsyUCVoWU/NjEPQ
         Tkn0v2JwZnrnOMOkdiIddAlvO62weHSLlJLhMaPnQTuyUeFVAnhgiNt8T/mqkKgjHE2L
         3Sv9ZBZEWg5RTjpR7kWLg+crbIAo+mXxXNYXve0d3c6zXOm9eWklgcY/mSC9UEthVb/X
         d5E3dQ1y55M5fav9SUthGLm6b5eyL8GEnNmx17/qhPRjwjCarY6MsW56KZf4B6kP8aha
         2dmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LNT+l1wAM3ExTzu8kAKF3OCBx9DgMUq0svFdafuGiNA=;
        b=PJIM9I/vf/qBVz8AS2YUC5vQm8RVgLwG1zj5Wgipk1fnRXUSPGiuJKKVQTZp9rAUhC
         jzhtCxBKLFyr/oDzvr83R67ioYVHFd0Ei8WaKcEgfozFGQr3wvY9gCr6wKkvrKvGwD88
         HT6p/+fcNCohJKC48/W45jWBLexc2fRG32x6Z9VgPFfanx0qgI0NooYwx8q/n2+KZjBl
         IK3nDUFIDuJ9Q7KJ2ZFF9MjQLKSWvxPJtYspGbOd/wm+p8q9EuP+7NJEQxnnfbdxWGeX
         1G3uiRi32lfX+txhnVS5CD5thBoZBgLKEXVGRH6rzj+0luUdosXmGX0tkh3f48eTX1ZY
         DKNw==
X-Gm-Message-State: APjAAAVJ0AIpbi7ACwaC2h92wXB2nFfnlmQIh5c0bq4k8KMzpKK6q7CF
        BIkeFnCIXBb6OxI3vOMAN/rHtg==
X-Google-Smtp-Source: APXvYqxOD8GTJnH35iTniIMOV5Lz2lveQxN9ZM+F4ldKe83xY1Gf3nvXifB6teZ/Q/hiULACCOiVnw==
X-Received: by 2002:a65:65c9:: with SMTP id y9mr38227850pgv.76.1560554098017;
        Fri, 14 Jun 2019 16:14:58 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id w187sm4486445pfb.4.2019.06.14.16.14.56
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 16:14:57 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 2/3] reset: qcom-pon: Add support for gen2 pon
Date:   Fri, 14 Jun 2019 23:14:50 +0000
Message-Id: <20190614231451.45998-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190614231451.45998-1-john.stultz@linaro.org>
References: <20190614231451.45998-1-john.stultz@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for gen2 pon register so "reboot bootloader" can
work on pixel3 and db845.

Cc: Andy Gross <agross@kernel.org>
Cc: David Brown <david.brown@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Amit Pundir <amit.pundir@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>

v2:
* Split out dts changes into separate path
* Minor cleanups and remove unused variables
---
 drivers/power/reset/qcom-pon.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index 3fa1642d4c543..22a743a0bf28c 100644
--- a/drivers/power/reset/qcom-pon.c
+++ b/drivers/power/reset/qcom-pon.c
@@ -14,11 +14,15 @@
 
 #define PON_SOFT_RB_SPARE		0x8f
 
+#define GEN1_REASON_SHIFT		2
+#define GEN2_REASON_SHIFT		1
+
 struct pm8916_pon {
 	struct device *dev;
 	struct regmap *regmap;
 	u32 baseaddr;
 	struct reboot_mode_driver reboot_mode;
+	long reason_shift;
 };
 
 static int pm8916_reboot_mode_write(struct reboot_mode_driver *reboot,
@@ -30,7 +34,7 @@ static int pm8916_reboot_mode_write(struct reboot_mode_driver *reboot,
 
 	ret = regmap_update_bits(pon->regmap,
 				 pon->baseaddr + PON_SOFT_RB_SPARE,
-				 0xfc, magic << 2);
+				 0xfc, magic << pon->reason_shift);
 	if (ret < 0)
 		dev_err(pon->dev, "update reboot mode bits failed\n");
 
@@ -60,6 +64,7 @@ static int pm8916_pon_probe(struct platform_device *pdev)
 		return error;
 
 	pon->reboot_mode.dev = &pdev->dev;
+	pon->reason_shift = (long)of_device_get_match_data(&pdev->dev);
 	pon->reboot_mode.write = pm8916_reboot_mode_write;
 	error = devm_reboot_mode_register(&pdev->dev, &pon->reboot_mode);
 	if (error) {
@@ -73,8 +78,9 @@ static int pm8916_pon_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id pm8916_pon_id_table[] = {
-	{ .compatible = "qcom,pm8916-pon" },
-	{ .compatible = "qcom,pms405-pon" },
+	{ .compatible = "qcom,pm8916-pon", .data = (void *)GEN1_REASON_SHIFT },
+	{ .compatible = "qcom,pms405-pon", .data = (void *)GEN1_REASON_SHIFT },
+	{ .compatible = "qcom,pm8998-pon", .data = (void *)GEN2_REASON_SHIFT },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pm8916_pon_id_table);
-- 
2.17.1

