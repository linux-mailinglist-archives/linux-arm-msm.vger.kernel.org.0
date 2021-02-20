Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D672320307
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Feb 2021 03:12:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbhBTCLp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Feb 2021 21:11:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbhBTCLo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Feb 2021 21:11:44 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E7D8C061786
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Feb 2021 18:11:04 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id u11so4345354plg.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Feb 2021 18:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kz6IopIPbcKegxk7pxHBFBiJ3hU9UnYL+1DPCwmH8Mo=;
        b=P3lSmLt8HngZ+3yjCcpnAzz/RG8YFWspzGksrlG90QAm7M33mLzMsmWeDZXIDWfksW
         l5TNk85AlIHMaglnxvq3H/J6VV43wPQWa5/IV1j+Cktev2xcqaYbTKJhUrirIHTv/iD7
         2BU7PrasYSnkOTz4gSt09oUjUjiWoAvIFgdJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kz6IopIPbcKegxk7pxHBFBiJ3hU9UnYL+1DPCwmH8Mo=;
        b=O/8QyeAJsvYRqHLY1fUi5F+W8RV1Tc+UaKHR7vvlgNdmoKQ3I1plccktHvo6WXZQWJ
         g2L8yDTGQaHurGcJIIOSREiTejD5qmtOLbTn8nvDhg9gYNJleK5qRX+NlrNznxrLf6Qo
         3W1W4kykZciV1DNusvaaTolJgakDIz/1UXLU+nORfMeaKux5D8f6ZAMbN+wUD5SXftTx
         Q55vW364733AgjEDSht9N6pYNIKpedj3wiJfFJYMMb+C6bvcwsberEDK9mxR7WP6ID39
         HmGHejvhDniiscPzl3jJk6Wco7r6srX7rQgpiRSo1CwGlZObZRVrRgkQtV7sXtLtJwiC
         HEag==
X-Gm-Message-State: AOAM531nMu45E3b2C/rXbqXc4WqHnvbuLL0FPEDnuAbVY8UCJYWgJhyk
        ApP0FshfpSQA4DTF/+CrGKHozQ==
X-Google-Smtp-Source: ABdhPJy2kKitraZ83bpPHSUsF7kCyeLVjEnR71pgsqs7ZE9I7c4PK+mr2ngxgbttJMS7Q7wwczwTwQ==
X-Received: by 2002:a17:90a:3d47:: with SMTP id o7mr11866073pjf.149.1613787063887;
        Fri, 19 Feb 2021 18:11:03 -0800 (PST)
Received: from localhost ([2620:15c:202:1:bdfd:8eaf:bd48:f73e])
        by smtp.gmail.com with UTF8SMTPSA id 203sm4608708pfy.105.2021.02.19.18.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Feb 2021 18:11:03 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH 1/3] arm64: dts: qcom: sc7180: Add lazor rev4
Date:   Fri, 19 Feb 2021 18:10:57 -0800
Message-Id: <20210219181032.1.I23e12818c4a841ba9c37c60b3ba8cfeeb048285f@changeid>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Lazor rev3 and older are stuffed with a 47k NTC thermistor for the
charger temperature which currently isn't supported by the PM6150 ADC
driver. A supported thermistor is used in rev4 and later revisions.
Add rev4 .dts files to be able to account for this.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 arch/arm64/boot/dts/qcom/Makefile             |  3 ++
 .../dts/qcom/sc7180-trogdor-lazor-r3-kb.dts   |  4 +--
 .../dts/qcom/sc7180-trogdor-lazor-r3-lte.dts  |  4 +--
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3.dts |  4 +--
 .../dts/qcom/sc7180-trogdor-lazor-r4-kb.dts   | 20 +++++++++++++
 .../dts/qcom/sc7180-trogdor-lazor-r4-lte.dts  | 28 +++++++++++++++++++
 .../boot/dts/qcom/sc7180-trogdor-lazor-r4.dts | 16 +++++++++++
 7 files changed, 73 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r4-kb.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r4-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r4.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 549a7a2151d4..8a8ebca07b25 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -38,6 +38,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r3-kb.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r3-lte.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r4.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r4-kb.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r4-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-r1-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-ganges-kirin.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts
index 6985beb97e53..a578326ffbad 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts
@@ -8,8 +8,8 @@
 #include "sc7180-trogdor-lazor-r3.dts"
 
 / {
-	model = "Google Lazor (rev3+) with KB Backlight";
-	compatible = "google,lazor-sku2", "qcom,sc7180";
+	model = "Google Lazor (rev3) with KB Backlight";
+	compatible = "google,lazor-rev3-sku2", "qcom,sc7180";
 };
 
 &keyboard_backlight {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts
index 0881f8dd02c9..40169b4a48a3 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts
@@ -9,8 +9,8 @@
 #include "sc7180-trogdor-lte-sku.dtsi"
 
 / {
-	model = "Google Lazor (rev3+) with LTE";
-	compatible = "google,lazor-sku0", "qcom,sc7180";
+	model = "Google Lazor (rev3) with LTE";
+	compatible = "google,lazor-rev3-sku0", "qcom,sc7180";
 };
 
 &ap_sar_sensor {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts
index 1b9d2f46359e..240c3e067fac 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts
@@ -10,6 +10,6 @@
 #include "sc7180-trogdor-lazor.dtsi"
 
 / {
-	model = "Google Lazor (rev3+)";
-	compatible = "google,lazor", "qcom,sc7180";
+	model = "Google Lazor (rev3)";
+	compatible = "google,lazor-rev3", "qcom,sc7180";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r4-kb.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r4-kb.dts
new file mode 100644
index 000000000000..e8c6d3745fed
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r4-kb.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Lazor board device tree source
+ *
+ * Copyright 2021 Google LLC.
+ */
+
+/dts-v1/;
+
+#include "sc7180-trogdor-lazor.dtsi"
+#include "sc7180-lite.dtsi"
+
+/ {
+	model = "Google Lazor (rev4+) with KB Backlight";
+	compatible = "google,lazor-sku2", "qcom,sc7180";
+};
+
+&keyboard_backlight {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r4-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r4-lte.dts
new file mode 100644
index 000000000000..b260bcf85d4c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r4-lte.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Lazor board device tree source
+ *
+ * Copyright 2021 Google LLC.
+ */
+
+/dts-v1/;
+
+#include "sc7180-trogdor-lazor.dtsi"
+#include "sc7180-trogdor-lte-sku.dtsi"
+
+/ {
+	model = "Google Lazor (rev4+) with LTE";
+	compatible = "google,lazor-sku0", "qcom,sc7180";
+};
+
+&ap_sar_sensor {
+	status = "okay";
+};
+
+&ap_sar_sensor_i2c {
+	status = "okay";
+};
+
+&keyboard_backlight {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r4.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r4.dts
new file mode 100644
index 000000000000..e6f4e030763e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r4.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Lazor board device tree source
+ *
+ * Copyright 2021 Google LLC.
+ */
+
+/dts-v1/;
+
+#include "sc7180-trogdor-lazor.dtsi"
+#include "sc7180-lite.dtsi"
+
+/ {
+	model = "Google Lazor (rev4+)";
+	compatible = "google,lazor", "qcom,sc7180";
+};
-- 
2.30.0.617.g56c4b15f3c-goog

