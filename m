Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB0D031868
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jun 2019 01:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbfEaXru (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 May 2019 19:47:50 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45254 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbfEaXro (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 May 2019 19:47:44 -0400
Received: by mail-pg1-f194.google.com with SMTP id w34so4846143pga.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2019 16:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Xt6/4+wEKiWtFL2dtOEhVMVadBdWF2iE7jN+ABlj+7w=;
        b=LV3JljYIRpW8saWBIJ4KRfsILfhBVVqe7dSepvgV6YpX/7rp9RwVGYJpXloE2liJsQ
         n5ozpVzBBaStN1xvWSn1tNxVMYwgiSoaOGdjrgW3eLlk3dlAQZTd0ciSEGHGIciz9HSz
         TLx1B4gCB8OWQDvQvlTQPsfr12gf+4vO2S9s9BXqftNWcSTcVO/qrIGVjCqreLoApKiq
         MW6czC6dBVBytHaHNbzmnSfeuQZQxC58GNvJaku92zkd3ve1lAWpoliB9zytXJ9SiKS2
         BvQpbNaM9IYEpsfMcZt4x2MRtPG5oo77wi0OS46154SJWojVuHc2O2V8noz4yhZdx/2s
         8kwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Xt6/4+wEKiWtFL2dtOEhVMVadBdWF2iE7jN+ABlj+7w=;
        b=ilS24lk1dgtcG1lo+vcBaiiOMQzgDvB7S+yguiN0GwpzXM3sjeBDlu+CGA86TKIKQK
         +hO+CDHelXoOZpfBJAaHRfyONsJ9dr19r19SB1sbKxCe6MJdcvRvwF/oexnQDNcRAwAD
         2NQZS5bSw79lv7lLDBZpEQUF3D9uG8r+x+I/YW56HtQ35Pha9UP9UNwN+R5xzGz3ypQ+
         FwtdOQIcT40QbMv/IMOFQQQJPqqCRPpA7jjl6f4oTFz2qWJExTdig3VOROvnfdDPWt40
         EHcewfH+LMba6jnvaC30c7h6d5RYAjcs06Cout6B3Jraq/mOYU8dgBcwb2sEJSN6aIlF
         7JnA==
X-Gm-Message-State: APjAAAWktiOFOv1z8VVT/hzlvpkWYhJxLAMizrfP6J9jTZpRe4AI38ev
        mCkvyQYx7++Uum0JNz1rpcBoDQ==
X-Google-Smtp-Source: APXvYqzr+AoHprjP8ts3wc4y0LIgd/T0gtnPdfKjniQJ+Grqlo/2X9FmKDtLb0saCt3OnKkgzRJbsA==
X-Received: by 2002:a17:90a:fa15:: with SMTP id cm21mr12525364pjb.122.1559346463481;
        Fri, 31 May 2019 16:47:43 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id y191sm7056843pfb.179.2019.05.31.16.47.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 16:47:42 -0700 (PDT)
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
Subject: [RFC][PATCH 2/2] reset: qcom-pon: Add support for gen2 pon
Date:   Fri, 31 May 2019 23:47:34 +0000
Message-Id: <20190531234734.102842-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190531234734.102842-1-john.stultz@linaro.org>
References: <20190531234734.102842-1-john.stultz@linaro.org>
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
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8998.dtsi |  2 +-
 drivers/power/reset/qcom-pon.c       | 15 ++++++++++++---
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8998.dtsi b/arch/arm64/boot/dts/qcom/pm8998.dtsi
index d3ca35a940fb..051a52df80f9 100644
--- a/arch/arm64/boot/dts/qcom/pm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8998.dtsi
@@ -39,7 +39,7 @@
 		#size-cells = <0>;
 
 		pm8998_pon: pon@800 {
-			compatible = "qcom,pm8916-pon";
+			compatible = "qcom,pm8998-pon";
 
 			reg = <0x800>;
 			mode-bootloader = <0x2>;
diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index 3fa1642d4c54..d0336a1612a4 100644
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
@@ -30,15 +34,18 @@ static int pm8916_reboot_mode_write(struct reboot_mode_driver *reboot,
 
 	ret = regmap_update_bits(pon->regmap,
 				 pon->baseaddr + PON_SOFT_RB_SPARE,
-				 0xfc, magic << 2);
+				 0xfc, magic << pon->reason_shift);
 	if (ret < 0)
 		dev_err(pon->dev, "update reboot mode bits failed\n");
 
 	return ret;
 }
 
+static const struct of_device_id pm8916_pon_id_table[];
+
 static int pm8916_pon_probe(struct platform_device *pdev)
 {
+	const struct of_device_id *match;
 	struct pm8916_pon *pon;
 	int error;
 
@@ -60,6 +67,7 @@ static int pm8916_pon_probe(struct platform_device *pdev)
 		return error;
 
 	pon->reboot_mode.dev = &pdev->dev;
+	pon->reason_shift = of_device_get_match_data(&pdev->dev);
 	pon->reboot_mode.write = pm8916_reboot_mode_write;
 	error = devm_reboot_mode_register(&pdev->dev, &pon->reboot_mode);
 	if (error) {
@@ -73,8 +81,9 @@ static int pm8916_pon_probe(struct platform_device *pdev)
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

