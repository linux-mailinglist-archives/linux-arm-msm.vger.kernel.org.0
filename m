Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7097344C22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Mar 2021 17:47:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231653AbhCVQrX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Mar 2021 12:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230517AbhCVQqo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Mar 2021 12:46:44 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CDE3C061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 09:46:44 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id y200so11329579pfb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 09:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DPjq/0NtZ0n5oT1z0hmB2WepBIN0/OB5zpkHxePIg3Q=;
        b=Rfah5n8LPuqKriSSoEfDrezForVXVRpF5CMjvKYWrkGv4rvEImWNASlyRVaE5B7xql
         p6ZQhtaKmSCX2Iv7/p3L1Kir5xty6ExHsuuPK7D9EHdOmxZ0VmvyuXmh/apYaG+aWXNN
         MhNAz3zab9E6uvZimRpp7i9l08cjLL2Y02yfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DPjq/0NtZ0n5oT1z0hmB2WepBIN0/OB5zpkHxePIg3Q=;
        b=I3DoshS4H7YvPMIAmrWZ6lAhiepErae/bU/PaEK6PrJk8hr4KfSCOEY7KT2ADJUtCh
         rGRGSiKsxOIyIQ6tww0OggmKCl3lEFhWh0qks2oXqIYcjPw9Gq80AsFVWPPNRskwwnWW
         QOBhW2ZR9v5JSYuaZZZNy3pHD5LmNIpUEG3WHtyGKaIO9yW2dZ2N5ap93ouAzjxhiseX
         DgTMbKIo7rxCR/zb1RPGxFDv0W3ah9xZZ7nC9x1tfo+I71A/clVE6N9XOzP8pwu4J/FH
         3ThrpkukdKdnOEwGsiYKufng+QExO3/LjcoZAoumIi4ciYAccNkSN84LY4OuwzaB7llb
         ADRQ==
X-Gm-Message-State: AOAM532mIe+/JJWLXFxneQnCu+YA5pmZX8qLZJTSzeVo6CzToW//o/+e
        9Ha/InVrUspm0egadKca7PRE+g==
X-Google-Smtp-Source: ABdhPJzqufTX4RKPaoAUzPSdg2OADsNmo9KuweNBNkbvO6pmJmOUVf7Y91P49+1R4HhFW4h9udB5fg==
X-Received: by 2002:aa7:808d:0:b029:1ed:993c:3922 with SMTP id v13-20020aa7808d0000b02901ed993c3922mr727670pff.75.1616431603609;
        Mon, 22 Mar 2021 09:46:43 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:90a9:b908:f93a:2f78])
        by smtp.gmail.com with UTF8SMTPSA id s200sm14247088pfs.53.2021.03.22.09.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Mar 2021 09:46:43 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v4 2/3] arm64: dts: qcom: sc7180: Add pompom rev3
Date:   Mon, 22 Mar 2021 09:46:34 -0700
Message-Id: <20210322094628.v4.2.I4138c3edee23d1efa637eef51e841d9d2e266659@changeid>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210322164635.273729-1-mka@chromium.org>
References: <20210322164635.273729-1-mka@chromium.org>
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
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- added missing '&' to phandle in rev1
- added Reviewed-by tag from Doug

Changes in v3:
- don't add LOCK key

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
 .../boot/dts/qcom/sc7180-trogdor-pompom.dtsi  | 29 ++++++++++++++
 7 files changed, 83 insertions(+), 31 deletions(-)
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
index e720e7bd0d70..e122a6b481ff 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dts
@@ -9,11 +9,23 @@
 
 #include "sc7180-trogdor-pompom.dtsi"
 
+/delete-node/ &keyboard_controller;
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
index d253a08f6fc8..5e7621bdab00 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
@@ -107,6 +107,35 @@ ap_ts: touchscreen@10 {
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
+		CROS_STD_MAIN_KEYMAP
+	>;
+};
+
 &panel {
 	compatible = "kingdisplay,kd116n21-30nv-a010";
 };
-- 
2.31.0.rc2.261.g7f71774620-goog

