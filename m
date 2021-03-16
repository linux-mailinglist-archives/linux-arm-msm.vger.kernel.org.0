Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE2E33CABB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Mar 2021 02:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234259AbhCPBPe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 21:15:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234293AbhCPBPZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 21:15:25 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D669C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 18:15:25 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id u18so16146819plc.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 18:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FOfzDySgsacq8EWM3EuIBQkeQAY4lRnePxThhSToAH4=;
        b=WB0ZUD7oyFwn3I79YOyAovO5zWgfXo3Mw/i+uQ07ehqECD27kKYRCc8albCaMBc4ud
         E86bLNYBEh8hgxIPR/018CrHA3hSkiZ+Q9ZZGzCPX3Z9jhws4J/Ggoqo2idNt7lQYQbJ
         9smQfYf+5Y+QKMh+sfhhD44/uNiAU+YkfwbwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FOfzDySgsacq8EWM3EuIBQkeQAY4lRnePxThhSToAH4=;
        b=HAITMwfbEv9QaOvX3wRbXy17qYnEHW0MwFAV7yJviAZE2CR3ojtSwyWRD8CW1t1QDP
         iRVKbI9C8Z8rlO/g8JN1JHa6I2qpYauIJVoemQENT3vciTLO8Pb/DNp9RSqSynOz48IE
         lzR1/Z1vWjWPrCOSPds+eKTkOncoyCCuH6bPrTYWCAY6WiyTtQIPKAfr5L1QU//8wB+/
         dj/gXWPCmIe5sPJFhAIBsLgV1/xIyY4wVPKIY3ucIXbYStAh1MyPAbQrL+9bdck0UstG
         Hyvw5qsNaqwjFnZelK0jeoGvV+zhjDdt4WOJqc/SCfcF4hNpUpVRJTaSMAwuK5Wi728W
         WjQw==
X-Gm-Message-State: AOAM532IH4cMIP2hygMLw2WxgGgf7T1IPQV8J7/r0wrYcaMud7FZN7Me
        8iRiF8kLaRsJGza5w6Cd7KfPfw==
X-Google-Smtp-Source: ABdhPJxq7NnziG+PDvfNwy3oTY/vStLi6lcZzX5Vb1KA7JKMWZ8hlvyRjwY9PIwsfGVRhNEVpBciPQ==
X-Received: by 2002:a17:90a:e454:: with SMTP id jp20mr2082588pjb.129.1615857324593;
        Mon, 15 Mar 2021 18:15:24 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:9867:b969:5d4f:e017])
        by smtp.gmail.com with UTF8SMTPSA id a24sm15019992pff.18.2021.03.15.18.15.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 18:15:24 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v3 3/3] arm64: dts: qcom: sc7180: Add CoachZ rev3
Date:   Mon, 15 Mar 2021 18:15:15 -0700
Message-Id: <20210315181509.v3.3.I95b8a63103b77cab6a7cf9c150f0541db57fda98@changeid>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210316011516.1314686-1-mka@chromium.org>
References: <20210316011516.1314686-1-mka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

CoachZ rev3 uses a 100k NTC thermistor for the charger temperatures,
instead of the 47k NTC that is stuffed in earlier revisions. Add .dts
files for rev3.

The 47k NTC currently isn't supported by the PM6150 ADC driver.
Disable the charger thermal zone for rev1 and rev2 to avoid the use
of bogus temperature values.

This also gets rid of the explicit DT files for rev2 and handles
rev2 in the rev1 .dts instead. There was some back and forth
downstream involving the 'dmic_clk_en' pin, after that was sorted
out the DT for rev1 and rev2 is the same.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v3:
- get rid of separate .dts for rev2

Changes in v2:
- added CoachZ rev3
- updated subject and commit message

 arch/arm64/boot/dts/qcom/Makefile                   |  4 ++--
 .../boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dts  |  4 ++--
 .../boot/dts/qcom/sc7180-trogdor-coachz-r1.dts      | 13 +++++++++++--
 ...-r2-lte.dts => sc7180-trogdor-coachz-r3-lte.dts} |  6 +++---
 ...r-coachz-r2.dts => sc7180-trogdor-coachz-r3.dts} |  4 ++--
 5 files changed, 20 insertions(+), 11 deletions(-)
 rename arch/arm64/boot/dts/qcom/{sc7180-trogdor-coachz-r2-lte.dts => sc7180-trogdor-coachz-r3-lte.dts} (69%)
 rename arch/arm64/boot/dts/qcom/{sc7180-trogdor-coachz-r2.dts => sc7180-trogdor-coachz-r3.dts} (75%)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 11aa83ca798f..39db370cf1a4 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -33,8 +33,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1-lte.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r2.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r2-lte.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r3.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r3-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r0.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1-kb.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dts
index 533c048903ea..82dc00cc7fb9 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dts
@@ -9,8 +9,8 @@
 #include "sc7180-trogdor-lte-sku.dtsi"
 
 / {
-	model = "Google CoachZ (rev1) with LTE";
-	compatible = "google,coachz-rev1-sku0", "qcom,sc7180";
+	model = "Google CoachZ (rev1 - 2) with LTE";
+	compatible = "google,coachz-rev1-sku0", "google,coachz-rev2-sku0", "qcom,sc7180";
 };
 
 &cros_ec_proximity {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts
index 86619f6c1134..b9c252df9fa1 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts
@@ -10,8 +10,17 @@
 #include "sc7180-trogdor-coachz.dtsi"
 
 / {
-	model = "Google CoachZ (rev1)";
-	compatible = "google,coachz-rev1", "qcom,sc7180";
+	model = "Google CoachZ (rev1 - 2)";
+	compatible = "google,coachz-rev1", "google,coachz-rev2", "qcom,sc7180";
+};
+
+/*
+ * CoachZ rev1 is stuffed with a 47k NTC as charger thermistor which currently
+ * is not supported by the PM6150 ADC driver. Disable the charger thermal zone
+ * to avoid using bogus temperature values.
+ */
+&charger_thermal {
+	status = "disabled";
 };
 
 &tlmm {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dts
similarity index 69%
rename from arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2-lte.dts
rename to arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dts
index 6e7745801fae..d23409034e8c 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2-lte.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dts
@@ -2,14 +2,14 @@
 /*
  * Google CoachZ board device tree source
  *
- * Copyright 2020 Google LLC.
+ * Copyright 2021 Google LLC.
  */
 
-#include "sc7180-trogdor-coachz-r2.dts"
+#include "sc7180-trogdor-coachz-r3.dts"
 #include "sc7180-trogdor-lte-sku.dtsi"
 
 / {
-	model = "Google CoachZ (rev2+) with LTE";
+	model = "Google CoachZ (rev3+) with LTE";
 	compatible = "google,coachz-sku0", "qcom,sc7180";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dts
similarity index 75%
rename from arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2.dts
rename to arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dts
index 4f69b6ba299f..a02d2d57c78c 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dts
@@ -2,7 +2,7 @@
 /*
  * Google CoachZ board device tree source
  *
- * Copyright 2020 Google LLC.
+ * Copyright 2021 Google LLC.
  */
 
 /dts-v1/;
@@ -10,6 +10,6 @@
 #include "sc7180-trogdor-coachz.dtsi"
 
 / {
-	model = "Google CoachZ (rev2+)";
+	model = "Google CoachZ (rev3+)";
 	compatible = "google,coachz", "qcom,sc7180";
 };
-- 
2.31.0.rc2.261.g7f71774620-goog

