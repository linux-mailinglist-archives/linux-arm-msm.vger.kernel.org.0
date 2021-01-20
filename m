Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E90F02FC9BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jan 2021 05:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728573AbhATEHP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jan 2021 23:07:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbhATEG5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jan 2021 23:06:57 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AB43C061575
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jan 2021 20:06:17 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id p18so14319302pgm.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jan 2021 20:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CnLd7ItGMU8LY469u9EdntF0s7qLHCCRpOBmPDM2gU4=;
        b=AwK1rWs7ogPh3YYQofuBMqK9+wAPD3cor2UkWIsCAtIYM4llO7ge94Iz9Wo8kt8YcN
         8XRa75Nn67lQ49SaSJz0JtKMS82QT4p0L2Mo3biJoOBbAArSqm3JF1s6OVf8mwIToznR
         FzrPVBg1EtsnylzVDm5ULbENj9ix9pEBE3wDnxoMsjg5LLyyvAX5pCpOpO1SFIpxFWl0
         68gCLBnC8qvkgajXIrEvlxt1O4/0LH1MoEKUXuVP/97xReAFYQPsCloMBj2Bu/lgZgoe
         j+4UYQnFrsPIXFz8vPySKeMmi3KFRExUKxVyoEETp6bLk5SWD/yNvG6zUTFLXMC7uP3M
         EKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CnLd7ItGMU8LY469u9EdntF0s7qLHCCRpOBmPDM2gU4=;
        b=VYRG2fo4fchaALsgcOPIxxk8mVJjr5JF0LIvXT4qgO/QoREuMlEWF9UbrMqEQigplt
         VHAXmH4uW8HKL9yePxkGitlcT1jYMYiwJ8sTR5p8om5wLqGB3BSHy0hBqN1rR48cd1lw
         Envqjs5EaufrwrPLjFOADi+H/JbF+u5TmyaXeN3QSpI0UIGkfcGfSwsAEtzOtkni3swl
         L4f6vqO9gFoXOD4IqloX2ZjeopX/hlxZNKfHO+ncQtuHLA3B82dsmGRdZURu4AaB7txx
         94UZxVCG1SDd5z8uq2P7VFMYdV9p5HnF/oy0ncOa4zDF7IfAoqvwTD5jOp/8z6OH82qc
         fEkw==
X-Gm-Message-State: AOAM532Sd8xTiQjnOr5tul29cNuDzPmBx8ly8yPgmnGNaTcmcvrH+HPm
        Sezkdzrx9tvbW1VqArJs9/BoyA==
X-Google-Smtp-Source: ABdhPJye2w08TVmZg6dEPhWh/wgkLPXETXATdkz4ISyeXzIovfVcAlfEt1P84KwoakQ3wdP4Htr55g==
X-Received: by 2002:a63:d917:: with SMTP id r23mr7659582pgg.126.1611115576601;
        Tue, 19 Jan 2021 20:06:16 -0800 (PST)
Received: from localhost.localdomain (li519-153.members.linode.com. [66.175.222.153])
        by smtp.gmail.com with ESMTPSA id a19sm541348pfi.130.2021.01.19.20.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 20:06:15 -0800 (PST)
From:   Jun Nie <jun.nie@linaro.org>
To:     john.stultz@linaro.org, bjorn.andersson@linaro.org
Cc:     agross@kernel.org, david.brown@linaro.org, amit.pundir@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, sre@kernel.org,
        linux-arm-msm@vger.kernel.org, Jun Nie <jun.nie@linaro.org>
Subject: [PATCH] power: reset: qcom-pon: Add power on/off reason info
Date:   Wed, 20 Jan 2021 12:06:02 +0800
Message-Id: <20210120040602.3966608-1-jun.nie@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add power on/off reason message for debug.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/power/reset/qcom-pon.c | 124 ++++++++++++++++++++++++++++++++-
 1 file changed, 123 insertions(+), 1 deletion(-)

diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index 4a688741a88a..012b87f5ab1d 100644
--- a/drivers/power/reset/qcom-pon.c
+++ b/drivers/power/reset/qcom-pon.c
@@ -12,6 +12,11 @@
 #include <linux/reboot-mode.h>
 #include <linux/regmap.h>
 
+#define PON_REASON1			0x08
+#define PON_WARM_RESET_REASON1		0x0a
+#define PON_WARM_RESET_REASON2		0x0b
+#define PON_WARM_RESET_TFT		BIT(4)
+#define POFF_REASON1			0x0c
 #define PON_SOFT_RB_SPARE		0x8f
 
 #define GEN1_REASON_SHIFT		2
@@ -23,6 +28,41 @@ struct pm8916_pon {
 	u32 baseaddr;
 	struct reboot_mode_driver reboot_mode;
 	long reason_shift;
+	int pon_trigger_reason;
+	int pon_power_off_reason;
+	unsigned int warm_reset_reason1;
+	unsigned int warm_reset_reason2;
+};
+
+static const char * const pm8916_pon_reason[] = {
+	[0] = "Triggered from Hard Reset",
+	[1] = "Triggered from SMPL (sudden momentary power loss)",
+	[2] = "Triggered from RTC (RTC alarm expiry)",
+	[3] = "Triggered from DC (DC charger insertion)",
+	[4] = "Triggered from USB (USB charger insertion)",
+	[5] = "Triggered from PON1 (secondary PMIC)",
+	[6] = "Triggered from CBL (external power supply)",
+	[7] = "Triggered from KPD (power key press)",
+};
+
+static const char * const pm8916_poff_reason[] = {
+	[0] = "Triggered from SOFT (Software)",
+	[1] = "Triggered from PS_HOLD (PS_HOLD/MSM controlled shutdown)",
+	[2] = "Triggered from PMIC_WD (PMIC watchdog)",
+	[3] = "Triggered from GP1 (Keypad_Reset1)",
+	[4] = "Triggered from GP2 (Keypad_Reset2)",
+	[5] = "Triggered from KPDPWR_AND_RESIN"
+		"(Simultaneous power key and reset line)",
+	[6] = "Triggered from RESIN_N (Reset line/Volume Down Key)",
+	[7] = "Triggered from KPDPWR_N (Long Power Key hold)",
+	[8] = "N/A",
+	[9] = "N/A",
+	[10] = "N/A",
+	[11] = "Triggered from CHARGER (Charger ENUM_TIMER, BOOT_DONE)",
+	[12] = "Triggered from TFT (Thermal Fault Tolerance)",
+	[13] = "Triggered from UVLO (Under Voltage Lock Out)",
+	[14] = "Triggered from OTST3 (Overtemp)",
+	[15] = "Triggered from STAGE3 (Stage 3 reset)",
 };
 
 static int pm8916_reboot_mode_write(struct reboot_mode_driver *reboot,
@@ -42,10 +82,49 @@ static int pm8916_reboot_mode_write(struct reboot_mode_driver *reboot,
 	return ret;
 }
 
+/*
+ * This function stores the PMIC warm reset reason register values. It also
+ * clears these registers if the qcom,clear-warm-reset device tree property
+ * is specified.
+ */
+static int pm8916_pon_store_and_clear_warm_reset(struct pm8916_pon *pon)
+{
+	int rc;
+
+	rc = regmap_read(pon->regmap,
+			 pon->baseaddr + PON_WARM_RESET_REASON1,
+			 &pon->warm_reset_reason1);
+	if (rc) {
+		dev_err(pon->dev,
+			"Unable to read addr=%x, rc(%d)\n",
+			PON_WARM_RESET_REASON1, rc);
+		return rc;
+	}
+
+	rc = regmap_read(pon->regmap,
+			 pon->baseaddr + PON_WARM_RESET_REASON2,
+			 &pon->warm_reset_reason2);
+	if (rc) {
+		dev_err(pon->dev,
+			"Unable to read addr=%x, rc(%d)\n",
+			PON_WARM_RESET_REASON2, rc);
+		return rc;
+	}
+
+	/* keeps the register in good state */
+	regmap_update_bits(pon->regmap,
+			   pon->baseaddr + PON_WARM_RESET_REASON1,
+			   ~0, 0);
+	return 0;
+}
+
 static int pm8916_pon_probe(struct platform_device *pdev)
 {
 	struct pm8916_pon *pon;
-	int error;
+	int error, index;
+	unsigned int val, cold_boot;
+	u16 poff_sts = 0;
+	u8 buf[2];
 
 	pon = devm_kzalloc(&pdev->dev, sizeof(*pon), GFP_KERNEL);
 	if (!pon)
@@ -75,6 +154,49 @@ static int pm8916_pon_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pon);
 
+	error = pm8916_pon_store_and_clear_warm_reset(pon);
+	if (error)
+		dev_err(pon->dev,
+			"Unable to store/clear WARM_RESET_REASONx registers\n");
+
+	/* PON reason */
+	error = regmap_read(pon->regmap, pon->baseaddr + PON_REASON1, &val);
+	if (error < 0)
+		dev_err(pon->dev, "read power on reason register failed\n");
+
+	index = ffs(val) - 1;
+	cold_boot = !(pon->warm_reset_reason1
+		      || (pon->warm_reset_reason2 & PON_WARM_RESET_TFT));
+	if (index >= ARRAY_SIZE(pm8916_pon_reason) || index < 0) {
+		dev_info(pon->dev,
+			 "PMIC Power-on reason: Unknown and '%s' boot\n",
+			 cold_boot ? "cold" : "warm");
+	} else {
+		pon->pon_trigger_reason = index;
+		dev_info(pon->dev,
+			 "PMIC Power-on reason: %s and '%s' boot\n",
+			 pm8916_pon_reason[index],
+			 cold_boot ? "cold" : "warm");
+	}
+
+	/* POFF reason */
+	error = regmap_bulk_read(pon->regmap,
+				 pon->baseaddr + POFF_REASON1,
+				 &buf[0], 2);
+	if (error) {
+		dev_err(pon->dev, "Unable to read POFF_RESASON regs\n");
+		return error;
+	}
+	poff_sts = buf[0] | (buf[1] << 8);
+	index = ffs(poff_sts) - 1;
+	if (index >= ARRAY_SIZE(pm8916_poff_reason) || index < 0) {
+		dev_info(pon->dev, "PMIC: Unknown power-off reason\n");
+	} else {
+		pon->pon_power_off_reason = index;
+		dev_info(pon->dev, "PMIC: Power-off reason: %s\n",
+			 pm8916_poff_reason[index]);
+	}
+
 	return devm_of_platform_populate(&pdev->dev);
 }
 
-- 
2.25.1

