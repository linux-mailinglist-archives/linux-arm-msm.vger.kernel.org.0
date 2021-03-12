Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41F8B33969A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 19:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233206AbhCLScy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 13:32:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233332AbhCLScl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 13:32:41 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89B7AC061762
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 10:32:41 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id 16so2443824pfn.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 10:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z2TTCoOhZzFdstrm7VNhW1YKvUWRLgRQRz4VAEJQzBw=;
        b=bVZnEJ6G9IW9OjusVy3YU5V0eruhaSbCs1jAhafSoyawT1TPddl5w46bZ6EDVBBqXh
         DgpXGBbAtwbsTatuHRH4iwQgorVxKdvsbcsIXm/9qXKY2F249psn9ug2vU7Q4KyH3zgX
         jkHO4v9KqYl52xVx8NqaK9LZB9gku9A5/79iY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z2TTCoOhZzFdstrm7VNhW1YKvUWRLgRQRz4VAEJQzBw=;
        b=nl6pMs6v3NU0aGAu63znnpbtBttTx9EeZa3QKaktosDbdOuW1z+j26jrKPHyuVcYoL
         6E4rV6pNJoMw/V/wcRaofYWZm/N92a2dHKspI2RYcVStlk7f24cCNxvuy6l6ScxZXX7d
         mcCLKx/5XT31gt2dBmxdugQXQr29VakkzrNEClUNJ+j/lBe1PNr7Nl1BujId9onHXPgs
         b1BA6Y6EHZL+2pB1S2nV39rI/Q/PrwGzGuCKRRyJhDCIhtNTbqtk4dnzWM0Aw7eNWTbn
         CvbXW4tyOV9EZ7MVVgPwBDF1B1Ol5idtTHiZ9rp0ze5dHNOvifayN9XuzLL1Xcj48XdP
         /srg==
X-Gm-Message-State: AOAM532ZXs3hf72SyiA7AoorRKqHA9Q6+kW+yQ3S9GYr0XXVZzPXgUdk
        0lEvCSHCVti1eJjysFxEf+izDQ==
X-Google-Smtp-Source: ABdhPJw34BfMs+5BruK0ScfiRqtdfgMIFitx83z8fk/1cj2x9DkWqbJlbDJkxLPx5DInEwDsRacusw==
X-Received: by 2002:a63:904b:: with SMTP id a72mr12812786pge.77.1615573961098;
        Fri, 12 Mar 2021 10:32:41 -0800 (PST)
Received: from localhost ([2620:15c:202:1:914f:6483:1dc:1bba])
        by smtp.gmail.com with UTF8SMTPSA id b23sm5750326pfo.164.2021.03.12.10.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Mar 2021 10:32:40 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2 2/3] arm64: dts: qcom: sc7180: Add pompom rev3
Date:   Fri, 12 Mar 2021 10:32:27 -0800
Message-Id: <20210312103211.v2.2.I4138c3edee23d1efa637eef51e841d9d2e266659@changeid>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210312183228.550779-1-mka@chromium.org>
References: <20210312183228.550779-1-mka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The only kernel visible change with respect to rev2 is that pompom
rev3 changed the charger thermistor from a 47k to a 100k NTC to use
a thermistor which is supported by the PM6150 ADC driver.

Disable the charger thermal zone for pompom rev1 and rev2 to avoid
the use of bogus temperature values from the unsupported thermistor.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v2:
- moved keyboard definition to sc7180-trogdor-pompom.dtsi instead
  of duplicating it, use cros-ec keyboard for rev1
- squashed with 'arm64: dts: qcom: sc7180: pompom: Disable charger
  thermal zone for rev1 and rev2'

 arch/arm64/boot/dts/qcom/Makefile             |  2 +
 .../dts/qcom/sc7180-trogdor-pompom-r1.dts     | 12 ++++++
 .../dts/qcom/sc7180-trogdor-pompom-r2-lte.dts |  4 +-
 .../dts/qcom/sc7180-trogdor-pompom-r2.dts     | 38 +++++--------------
 .../dts/qcom/sc7180-trogdor-pompom-r3-lte.dts | 14 +++++++
 .../dts/qcom/sc7180-trogdor-pompom-r3.dts     | 15 ++++++++
 .../boot/dts/qcom/sc7180-trogdor-pompom.dtsi  | 31 +++++++++++++++
 7 files changed, 85 insertions(+), 31 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index a81966d59cf7..11aa83ca798f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -49,6 +49,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-pompom-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-pompom-r1-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-pompom-r2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-pompom-r2-lte.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-pompom-r3.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-pompom-r3-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-r1-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-ganges-kirin.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dts
index e720e7bd0d70..7f87877408c5 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dts
@@ -9,11 +9,23 @@
 
 #include "sc7180-trogdor-pompom.dtsi"
 
+/delete-node/ keyboard_controller;
+#include <arm/cros-ec-keyboard.dtsi>
+
 / {
 	model = "Google Pompom (rev1)";
 	compatible = "google,pompom-rev1", "qcom,sc7180";
 };
 
+/*
+ * Pompom rev1 is stuffed with a 47k NTC as charger thermistor which currently
+ * is not supported by the PM6150 ADC driver. Disable the charger thermal zone
+ * to avoid using bogus temperature values.
+ */
+&charger_thermal {
+	status = "disabled";
+};
+
 &pp3300_hub {
 	/* pp3300_l7c is used to power the USB hub */
 	/delete-property/regulator-always-on;
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dts
index 791d496ad046..00e187c08eb9 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dts
@@ -9,6 +9,6 @@
 #include "sc7180-trogdor-lte-sku.dtsi"
 
 / {
-	model = "Google Pompom (rev2+) with LTE";
-	compatible = "google,pompom-sku0", "qcom,sc7180";
+	model = "Google Pompom (rev2) with LTE";
+	compatible = "google,pompom-rev2-sku0", "qcom,sc7180";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dts
index 984d7337da78..4f32e6733f4c 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dts
@@ -10,35 +10,15 @@
 #include "sc7180-trogdor-pompom.dtsi"
 
 / {
-	model = "Google Pompom (rev2+)";
-	compatible = "google,pompom", "qcom,sc7180";
+	model = "Google Pompom (rev2)";
+	compatible = "google,pompom-rev2", "qcom,sc7180";
 };
 
-&keyboard_controller {
-	function-row-physmap = <
-		MATRIX_KEY(0x00, 0x02, 0)	/* T1 */
-		MATRIX_KEY(0x03, 0x02, 0)	/* T2 */
-		MATRIX_KEY(0x02, 0x02, 0)	/* T3 */
-		MATRIX_KEY(0x01, 0x02, 0)	/* T4 */
-		MATRIX_KEY(0x03, 0x04, 0)	/* T5 */
-		MATRIX_KEY(0x02, 0x04, 0)	/* T6 */
-		MATRIX_KEY(0x01, 0x04, 0)	/* T7 */
-		MATRIX_KEY(0x02, 0x09, 0)	/* T8 */
-		MATRIX_KEY(0x01, 0x09, 0)	/* T9 */
-		MATRIX_KEY(0x00, 0x04, 0)	/* T10 */
-	>;
-	linux,keymap = <
-		MATRIX_KEY(0x00, 0x02, KEY_BACK)
-		MATRIX_KEY(0x03, 0x02, KEY_REFRESH)
-		MATRIX_KEY(0x02, 0x02, KEY_ZOOM)
-		MATRIX_KEY(0x01, 0x02, KEY_SCALE)
-		MATRIX_KEY(0x03, 0x04, KEY_SYSRQ)
-		MATRIX_KEY(0x02, 0x04, KEY_BRIGHTNESSDOWN)
-		MATRIX_KEY(0x01, 0x04, KEY_BRIGHTNESSUP)
-		MATRIX_KEY(0x02, 0x09, KEY_MUTE)
-		MATRIX_KEY(0x01, 0x09, KEY_VOLUMEDOWN)
-		MATRIX_KEY(0x00, 0x04, KEY_VOLUMEUP)
-
-		CROS_STD_MAIN_KEYMAP
-	>;
+/*
+ * Pompom rev2 is stuffed with a 47k NTC as charger thermistor which currently
+ * is not supported by the PM6150 ADC driver. Disable the charger thermal zone
+ * to avoid using bogus temperature values.
+ */
+&charger_thermal {
+	status = "disabled";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dts
new file mode 100644
index 000000000000..e90b73c353bb
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Pompom board device tree source
+ *
+ * Copyright 2021 Google LLC.
+ */
+
+#include "sc7180-trogdor-pompom-r3.dts"
+#include "sc7180-trogdor-lte-sku.dtsi"
+
+/ {
+	model = "Google Pompom (rev3+) with LTE";
+	compatible = "google,pompom-sku0", "qcom,sc7180";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dts
new file mode 100644
index 000000000000..f8aac63a53ef
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Pompom board device tree source
+ *
+ * Copyright 2021 Google LLC.
+ */
+
+/dts-v1/;
+
+#include "sc7180-trogdor-pompom.dtsi"
+
+/ {
+	model = "Google Pompom (rev3+)";
+	compatible = "google,pompom", "qcom,sc7180";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
index d253a08f6fc8..1a51ebfe8fb4 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
@@ -107,6 +107,37 @@ ap_ts: touchscreen@10 {
 	};
 };
 
+&keyboard_controller {
+	function-row-physmap = <
+		MATRIX_KEY(0x00, 0x02, 0)	/* T1 */
+		MATRIX_KEY(0x03, 0x02, 0)	/* T2 */
+		MATRIX_KEY(0x02, 0x02, 0)	/* T3 */
+		MATRIX_KEY(0x01, 0x02, 0)	/* T4 */
+		MATRIX_KEY(0x03, 0x04, 0)	/* T5 */
+		MATRIX_KEY(0x02, 0x04, 0)	/* T6 */
+		MATRIX_KEY(0x01, 0x04, 0)	/* T7 */
+		MATRIX_KEY(0x02, 0x09, 0)	/* T8 */
+		MATRIX_KEY(0x01, 0x09, 0)	/* T9 */
+		MATRIX_KEY(0x00, 0x04, 0)	/* T10 */
+	>;
+	linux,keymap = <
+		MATRIX_KEY(0x00, 0x02, KEY_BACK)
+		MATRIX_KEY(0x03, 0x02, KEY_REFRESH)
+		MATRIX_KEY(0x02, 0x02, KEY_ZOOM)
+		MATRIX_KEY(0x01, 0x02, KEY_SCALE)
+		MATRIX_KEY(0x03, 0x04, KEY_SYSRQ)
+		MATRIX_KEY(0x02, 0x04, KEY_BRIGHTNESSDOWN)
+		MATRIX_KEY(0x01, 0x04, KEY_BRIGHTNESSUP)
+		MATRIX_KEY(0x02, 0x09, KEY_MUTE)
+		MATRIX_KEY(0x01, 0x09, KEY_VOLUMEDOWN)
+		MATRIX_KEY(0x00, 0x04, KEY_VOLUMEUP)
+
+		MATRIX_KEY(0x03, 0x09, KEY_SLEEP)	/* LOCK key */
+
+		CROS_STD_MAIN_KEYMAP
+	>;
+};
+
 &panel {
 	compatible = "kingdisplay,kd116n21-30nv-a010";
 };
-- 
2.31.0.rc2.261.g7f71774620-goog

