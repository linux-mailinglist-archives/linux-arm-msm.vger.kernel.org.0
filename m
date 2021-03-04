Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E602D32D93A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 19:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233145AbhCDSGE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 13:06:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232903AbhCDSFm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 13:05:42 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E269EC061765
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Mar 2021 10:04:26 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id p21so19384119pgl.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Mar 2021 10:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i6KaN9zbLzNpUQuVveUaLqGIfMdvHfJjzSPxZEmeLTs=;
        b=FvZ28nglfwSySTl0qfHNPTPX3XWeh7RvzwMdKpMVNglbCiuiu3yZQK6aUB+s31c9uP
         lEMdeiYHvcxN1iinwlWRgmie/nqKOxeiX7Gqe51m9czFv8mWFvH3aAivgNoF/ON/u/Nn
         Ahmgxxe3VHbZB08d+1v+zSqBC/BQfUlC5aS9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i6KaN9zbLzNpUQuVveUaLqGIfMdvHfJjzSPxZEmeLTs=;
        b=KNZZqEFJstsdfL3l42FhcVB0RfIJpSUCjvkOn97hPsgzsI4+x/8wnWLLL0Efw8/50x
         mwpSy8nHYC28C6eaL/ajwo2sIdL4o23OTdWPsr1vVrA3SxzsSWJSFomprkHRVv0J3tJ5
         N/zvyVDcj+mv+8rLxnsBNvTvB0cqmqBsY2C7YSaj1Mt57TkYtye1F82xXIooKZIrl2Qe
         gUJ5GshSd3x1mpd9ksrqUNZzcgQeGFGg91RVAEkPEES3TnhtNjzyWpTpUmrVjOHOjHFQ
         37SlFXkk/UH/bTjhY0UD3Q9nC1FrPw+OWF53fJid2gu0Li3r+JL2ItCqYIBeEa5F1z1P
         8b1A==
X-Gm-Message-State: AOAM533iDpITBQse7J5F92fKssJJCJkgfPEbyOy7N+kutVf58CeInHTZ
        yVwtLFGqYUckl81VGtFzZhL9wA==
X-Google-Smtp-Source: ABdhPJzbyIQnz9X8WG1yUzbD+tZZn9lIS9S0KdW44tucV9eijEWYAr84bAdQ3OJrUH6+L+kwv8KbXA==
X-Received: by 2002:a63:1d45:: with SMTP id d5mr4645310pgm.52.1614881066476;
        Thu, 04 Mar 2021 10:04:26 -0800 (PST)
Received: from localhost ([2620:15c:202:1:69fe:a9f8:ca53:af2b])
        by smtp.gmail.com with UTF8SMTPSA id d6sm71426pfq.109.2021.03.04.10.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 10:04:26 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH 2/4] arm64: dts: qcom: sc7180: Add pompom rev3
Date:   Thu,  4 Mar 2021 10:04:13 -0800
Message-Id: <20210304100341.2.I7fef1a0e82bd2f3c1bc35501f8652e027aae4fcc@changeid>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210304180415.1531430-1-mka@chromium.org>
References: <20210304180415.1531430-1-mka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The only kernel visible change with respect to rev2 is that pompom
rev3 changed the charger thermistor from a 47k to a 100k NTC to use
a thermistor which is supported by the PM6150 ADC driver.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 .../dts/qcom/sc7180-trogdor-pompom-r2-lte.dts |  4 +-
 .../dts/qcom/sc7180-trogdor-pompom-r2.dts     |  4 +-
 .../dts/qcom/sc7180-trogdor-pompom-r3-lte.dts | 14 ++++++
 .../dts/qcom/sc7180-trogdor-pompom-r3.dts     | 46 +++++++++++++++++++
 4 files changed, 64 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dts

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
index 984d7337da78..2b2bd906321d 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dts
@@ -10,8 +10,8 @@
 #include "sc7180-trogdor-pompom.dtsi"
 
 / {
-	model = "Google Pompom (rev2+)";
-	compatible = "google,pompom", "qcom,sc7180";
+	model = "Google Pompom (rev2)";
+	compatible = "google,pompom-rev2", "qcom,sc7180";
 };
 
 &keyboard_controller {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dts
new file mode 100644
index 000000000000..067cb75a011e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Pompom board device tree source
+ *
+ * Copyright 2020 Google LLC.
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
index 000000000000..12d2d1e8e9e1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dts
@@ -0,0 +1,46 @@
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
+
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
-- 
2.30.1.766.gb4fecdf3b7-goog

