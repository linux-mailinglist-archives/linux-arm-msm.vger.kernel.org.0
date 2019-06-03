Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7449C33B19
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2019 00:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbfFCWXZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jun 2019 18:23:25 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33853 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726691AbfFCWXZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jun 2019 18:23:25 -0400
Received: by mail-pf1-f194.google.com with SMTP id c85so2614744pfc.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jun 2019 15:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LNT+l1wAM3ExTzu8kAKF3OCBx9DgMUq0svFdafuGiNA=;
        b=RSBsA1sZKPZQGT93W+BOBhN5ctHJdvI/euEzW7VqiT83w1yWpIWw4F/wIqRqPuBPwS
         fKKXmI7hYcUhj2RyZNzKSmcpjmoEaL7XupXMPJuTkR2lVWLlisrIugg7hmQkbPvjMd11
         TI4j3rZ7FVM6Q1tbomdGo9f+hjO/SHPgwZHEc4+U8bGfygVQjH8fBTvna0n+vG7X7BZH
         fP7IlskzUXfs5JGj25rr8StP0H9MVGbAcfJ/7GqoHkA6x2b7dLsD0IWUu/viyPUyni1e
         Pf7Lqj0MYVvoMTGhuoBESr2O0GaOh9VC5kl77CtY6mKwGQOSU0OwIbluEKvLvB1gYuqt
         d8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LNT+l1wAM3ExTzu8kAKF3OCBx9DgMUq0svFdafuGiNA=;
        b=JQ1lD89+Gzgees4ODvIH/moMol/kYw+ZxroRW+JvVchCIB9VMA/qWKqzEHfS/XGlca
         BCpGhn8eblLLMa7a8fgxlPiYRtnUJj0rPSO7mIQOB3Zc03VmlKsWAtC0C/fUoEJGiCTu
         OEgq1Evw0YSIvno4xm3NQX8h0wOG9lTqfgUCcv0QFDyu6bl+r6KXHPN12hI10vss3kmN
         inhdWU2TSTg+k76Mi4GDVr4gUcfN+bb9X4ntPBDnBetEIZo+gJzf4dWJIUo0hiKs2vsU
         rvOtifMMAFb60iCqWXM05gS8rjO45uGNkKUHRWVxo4g1Pf9dh/9Sl1wIYkOwrtctQZOL
         O8JQ==
X-Gm-Message-State: APjAAAXq6s0snC3acsL/XlIgVOBjJdEjpgeUYHukgpibg3M+6rR4ekfe
        eWl2Qav7h2sOd+rsSJvPYSHPw8luszo=
X-Google-Smtp-Source: APXvYqyvzQyIVZPpUnCKtqlHVvAak9rWtp9S1Ze02w7DQsnHXT0RcsdjgSSK837eelbF8SsQY965ew==
X-Received: by 2002:a63:4c54:: with SMTP id m20mr31550310pgl.316.1559600604132;
        Mon, 03 Jun 2019 15:23:24 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id g8sm14320588pjp.17.2019.06.03.15.23.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 15:23:23 -0700 (PDT)
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
Subject: [PATCH 2/3 v2] reset: qcom-pon: Add support for gen2 pon
Date:   Mon,  3 Jun 2019 22:23:18 +0000
Message-Id: <20190603222319.62842-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190603222319.62842-1-john.stultz@linaro.org>
References: <20190603222319.62842-1-john.stultz@linaro.org>
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

