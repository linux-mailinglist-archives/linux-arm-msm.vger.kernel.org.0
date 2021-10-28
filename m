Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3F543F26A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 00:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbhJ1WOF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 18:14:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230404AbhJ1WOE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 18:14:04 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0901CC061570
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 15:11:37 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id na16-20020a17090b4c1000b0019f5bb661f9so5934340pjb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 15:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UZj3b8Afg4wI2y9OOOyhVnIFOkHFKcC6yN7HfoxBTfI=;
        b=O99U3iLkxtGJ4+4HwJlEu8KYSwSUU+vpLQpWposQgf6qXtrAPzVexbnRN+x1f9SKui
         wt1yKBq/FPcJb5NBLZ+uH64fyDGKDW2krfpL+LiCgSm20JLAQsLxlChIcVk7v2RoSLDi
         KyEKijiMxsIyD0EEZFxEJEFZ2gJGjElUmOahs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UZj3b8Afg4wI2y9OOOyhVnIFOkHFKcC6yN7HfoxBTfI=;
        b=zySb9hzJ5VR4/s1y50K2p8WM8YW7epYelJu44I1nzfEAXMgcxHBZgQhamAS41rpm4r
         uwDcfUtey9y1EeNldjTqO4i9JHyDTsC0b7jaJhzPp4XO9KySHh3CkLjZk2eN7N8Prrmz
         1vTrp3Yj7e+BHH1pLz4TtDff94+MXG6kRFYve+/9s7+Byca7lBrvOtZxgsjofLRkSFxD
         jp8ldiHxsZY4nh//cH8ACHNr37xys1w1MR+uVC7jMumPcu5P+6Xdz1l9pMiq5r9EhTcJ
         zVqHWG+96Slf4w8zyPqTJL+My2Sq6BS0MhTvnRf+Z9000qn4grCEFtztXXwvQyJQ7eiB
         RQWA==
X-Gm-Message-State: AOAM531cnDBmGcFWAWAJKQT+41T2LZ8eUfcva7A7TOTQjXPAR0hU6H+2
        NhtHIbYp+1P84zouZmfKG9x4DoHJfaA08w==
X-Google-Smtp-Source: ABdhPJzbtiI2SAzLa2LuvSAnbcR+R1VH2BPgaxlySTW4UGZJTDZalih3okfDeeU8ln4uufa5zXjzeA==
X-Received: by 2002:a17:902:b94a:b0:141:8454:d665 with SMTP id h10-20020a170902b94a00b001418454d665mr6160634pls.88.1635459096468;
        Thu, 28 Oct 2021 15:11:36 -0700 (PDT)
Received: from philipchen.mtv.corp.google.com ([2620:15c:202:201:9954:4c46:483e:f139])
        by smtp.gmail.com with ESMTPSA id b8sm4634367pfv.56.2021.10.28.15.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 15:11:36 -0700 (PDT)
From:   Philip Chen <philipchen@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org, swboyd@chromium.org,
        Philip Chen <philipchen@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: sc7180: Support Lazor/Limozeen rev9
Date:   Thu, 28 Oct 2021 15:11:31 -0700
Message-Id: <20211028151022.1.Ie56f55924f5c7706fe3194e710bbef6fdb8b5bc6@changeid>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Support Lazor/Limozeen rev9 board where Parade ps8640 is added as the
second source edp bridge.

Signed-off-by: Philip Chen <philipchen@chromium.org>
---

 arch/arm64/boot/dts/qcom/Makefile             |  9 +++-
 .../sc7180-trogdor-lazor-limozeen-nots-r4.dts |  2 +-
 .../sc7180-trogdor-lazor-limozeen-nots-r5.dts | 31 +++++++++++++
 ...sc7180-trogdor-lazor-limozeen-nots-r9.dts} |  6 ++-
 .../qcom/sc7180-trogdor-lazor-limozeen-r4.dts | 46 +++++++++++++++++++
 ...s => sc7180-trogdor-lazor-limozeen-r9.dts} |  6 ++-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts |  2 +
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts |  2 +
 .../dts/qcom/sc7180-trogdor-lazor-r3-kb.dts   |  9 +++-
 .../dts/qcom/sc7180-trogdor-lazor-r3-lte.dts  |  9 +++-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3.dts |  8 +++-
 .../dts/qcom/sc7180-trogdor-lazor-r9-kb.dts   | 26 +++++++++++
 .../dts/qcom/sc7180-trogdor-lazor-r9-lte.dts  | 34 ++++++++++++++
 .../boot/dts/qcom/sc7180-trogdor-lazor-r9.dts | 22 +++++++++
 .../boot/dts/qcom/sc7180-trogdor-lazor.dtsi   |  3 --
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |  1 +
 16 files changed, 200 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dts
 rename arch/arm64/boot/dts/qcom/{sc7180-trogdor-lazor-limozeen-nots.dts => sc7180-trogdor-lazor-limozeen-nots-r9.dts} (71%)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dts
 rename arch/arm64/boot/dts/qcom/{sc7180-trogdor-lazor-limozeen.dts => sc7180-trogdor-lazor-limozeen-r9.dts} (82%)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6b816eb33309..f637c4d3729f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -64,9 +64,14 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r3-kb.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r3-lte.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-limozeen.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-limozeen-nots.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r9.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r9-kb.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r9-lte.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-limozeen-r4.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-limozeen-r9.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-limozeen-nots-r4.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-limozeen-nots-r5.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-limozeen-nots-r9.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-pompom-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-pompom-r1-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-pompom-r2.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts
index 6ebde0828550..850776c5323d 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts
@@ -5,7 +5,7 @@
  * Copyright 2020 Google LLC.
  */
 
-#include "sc7180-trogdor-lazor-limozeen-nots.dts"
+#include "sc7180-trogdor-lazor-limozeen-nots-r5.dts"
 
 / {
 	model = "Google Lazor Limozeen without Touchscreen (rev4)";
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dts
new file mode 100644
index 000000000000..a2a6e2515ee6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Lazor Limozeen board device tree source
+ *
+ * Copyright 2021 Google LLC.
+ */
+
+/dts-v1/;
+
+#include "sc7180.dtsi"
+#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
+#include "sc7180-trogdor-lazor.dtsi"
+#include "sc7180-trogdor-lte-sku.dtsi"
+
+/ {
+	model = "Google Lazor Limozeen without Touchscreen (rev5 - rev8)";
+	/* No sku5 post-rev5 */
+	compatible = "google,lazor-rev5-sku6", "google,lazor-rev6-sku6",
+		"google,lazor-rev7-sku6", "google,lazor-rev8-sku6",
+		"google,rev5-sku5", "qcom,sc7180";
+};
+
+/delete-node/&ap_ts;
+
+&panel {
+	compatible = "innolux,n116bca-ea1", "innolux,n116bge";
+};
+
+&sdhc_2 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dts
similarity index 71%
rename from arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots.dts
rename to arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dts
index 0456c7e05d00..9460659fe63c 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dts
@@ -2,16 +2,18 @@
 /*
  * Google Lazor Limozeen board device tree source
  *
- * Copyright 2020 Google LLC.
+ * Copyright 2021 Google LLC.
  */
 
 /dts-v1/;
 
+#include "sc7180.dtsi"
+#include "sc7180-trogdor-parade-ps8640.dtsi"
 #include "sc7180-trogdor-lazor.dtsi"
 #include "sc7180-trogdor-lte-sku.dtsi"
 
 / {
-	model = "Google Lazor Limozeen without Touchscreen";
+	model = "Google Lazor Limozeen without Touchscreen (rev9+)";
 	compatible = "google,lazor-sku6", "google,lazor-sku5", "qcom,sc7180";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dts
new file mode 100644
index 000000000000..10f48f4b429a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dts
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Lazor Limozeen board device tree source
+ *
+ * Copyright 2021 Google LLC.
+ */
+
+/dts-v1/;
+
+#include "sc7180.dtsi"
+#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
+#include "sc7180-trogdor-lazor.dtsi"
+#include "sc7180-trogdor-lte-sku.dtsi"
+
+/ {
+	model = "Google Lazor Limozeen (rev4 - rev8)";
+	compatible = "google,lazor-rev4-sku4", "google,lazor-rev5-sku4",
+		"google,lazor-rev6-sku4", "google,lazor-rev6-sku4",
+		"google,lazor-rev8-sku4", "qcom,sc7180";
+};
+
+/delete-node/&ap_ts;
+
+&ap_ts_pen_1v8 {
+	ap_ts: touchscreen@10 {
+		compatible = "elan,ekth3500";
+		reg = <0x10>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_l>, <&ts_reset_l>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+
+		vcc33-supply = <&pp3300_ts>;
+
+		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&panel {
+	compatible = "auo,b116xa01";
+};
+
+&sdhc_2 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dts
similarity index 82%
rename from arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen.dts
rename to arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dts
index e6ad6dae4e60..dc47842bc662 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dts
@@ -2,16 +2,18 @@
 /*
  * Google Lazor Limozeen board device tree source
  *
- * Copyright 2020 Google LLC.
+ * Copyright 2021 Google LLC.
  */
 
 /dts-v1/;
 
+#include "sc7180.dtsi"
+#include "sc7180-trogdor-parade-ps8640.dtsi"
 #include "sc7180-trogdor-lazor.dtsi"
 #include "sc7180-trogdor-lte-sku.dtsi"
 
 / {
-	model = "Google Lazor Limozeen";
+	model = "Google Lazor Limozeen (rev9+)";
 	compatible = "google,lazor-sku4", "qcom,sc7180";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
index 30e3e769d2b4..b142006478ea 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
@@ -7,6 +7,8 @@
 
 /dts-v1/;
 
+#include "sc7180.dtsi"
+#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
 #include "sc7180-trogdor-lazor.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
index c2ef06367baf..59740799fa3a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
@@ -7,6 +7,8 @@
 
 /dts-v1/;
 
+#include "sc7180.dtsi"
+#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
 #include "sc7180-trogdor-lazor.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts
index dcb41afdc82a..18ef9da71998 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts
@@ -7,12 +7,17 @@
 
 /dts-v1/;
 
+#include "sc7180.dtsi"
+#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
 #include "sc7180-trogdor-lazor.dtsi"
 #include "sc7180-lite.dtsi"
 
 / {
-	model = "Google Lazor (rev3+) with KB Backlight";
-	compatible = "google,lazor-sku2", "qcom,sc7180";
+	model = "Google Lazor (rev3 - 8) with KB Backlight";
+	compatible = "google,lazor-rev3-sku2", "google,lazor-rev4-sku2",
+		"google,lazor-rev5-sku2", "google,lazor-rev6-sku2",
+		"google,lazor-rev7-sku2", "google,lazor-rev8-sku2",
+		"qcom,sc7180";
 };
 
 &keyboard_backlight {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts
index be44900602d7..c5c9feff41b8 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts
@@ -7,12 +7,17 @@
 
 /dts-v1/;
 
+#include "sc7180.dtsi"
+#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
 #include "sc7180-trogdor-lazor.dtsi"
 #include "sc7180-trogdor-lte-sku.dtsi"
 
 / {
-	model = "Google Lazor (rev3+) with LTE";
-	compatible = "google,lazor-sku0", "qcom,sc7180";
+	model = "Google Lazor (rev3 - 8) with LTE";
+	compatible = "google,lazor-rev3-sku0", "google,lazor-rev4-sku0",
+		"google,lazor-rev5-sku0", "google,lazor-rev6-sku0",
+		"google,lazor-rev7-sku0", "google,lazor-rev8-sku0",
+		"qcom,sc7180";
 };
 
 &ap_sar_sensor {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts
index b474df47cd70..7adcedbf080d 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts
@@ -7,10 +7,14 @@
 
 /dts-v1/;
 
+#include "sc7180.dtsi"
+#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
 #include "sc7180-trogdor-lazor.dtsi"
 #include "sc7180-lite.dtsi"
 
 / {
-	model = "Google Lazor (rev3+)";
-	compatible = "google,lazor", "qcom,sc7180";
+	model = "Google Lazor (rev3 - 8)";
+	compatible = "google,lazor-rev3", "google,lazor-rev4",
+		"google,lazor-rev5", "google,lazor-rev6", "google,lazor-rev7",
+		"google,lazor-rev8", "qcom,sc7180";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts
new file mode 100644
index 000000000000..326ba9f88394
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Lazor board device tree source
+ *
+ * Copyright 2020 Google LLC.
+ */
+
+/dts-v1/;
+
+#include "sc7180.dtsi"
+#include "sc7180-trogdor-parade-ps8640.dtsi"
+#include "sc7180-trogdor-lazor.dtsi"
+#include "sc7180-lite.dtsi"
+
+/ {
+	model = "Google Lazor (rev9+) with KB Backlight";
+	compatible = "google,lazor-sku2", "qcom,sc7180";
+};
+
+&keyboard_backlight {
+	status = "okay";
+};
+
+&panel {
+	compatible = "boe,nv133fhm-n62";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts
new file mode 100644
index 000000000000..a705c956f62b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Lazor board device tree source
+ *
+ * Copyright 2021 Google LLC.
+ */
+
+/dts-v1/;
+
+#include "sc7180.dtsi"
+#include "sc7180-trogdor-parade-ps8640.dtsi"
+#include "sc7180-trogdor-lazor.dtsi"
+#include "sc7180-trogdor-lte-sku.dtsi"
+
+/ {
+	model = "Google Lazor (rev9+) with LTE";
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
+
+&panel {
+	compatible = "boe,nv133fhm-n62";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dts
new file mode 100644
index 000000000000..13ff9a851613
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Lazor board device tree source
+ *
+ * Copyright 2021 Google LLC.
+ */
+
+/dts-v1/;
+
+#include "sc7180.dtsi"
+#include "sc7180-trogdor-parade-ps8640.dtsi"
+#include "sc7180-trogdor-lazor.dtsi"
+#include "sc7180-lite.dtsi"
+
+/ {
+	model = "Google Lazor (rev9+)";
+	compatible = "google,lazor", "qcom,sc7180";
+};
+
+&panel {
+	compatible = "boe,nv133fhm-n62";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
index 8b79fbb75756..69666f92176a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
@@ -5,13 +5,10 @@
  * Copyright 2020 Google LLC.
  */
 
-#include "sc7180.dtsi"
-
 ap_ec_spi: &spi6 {};
 ap_h1_spi: &spi0 {};
 
 #include "sc7180-trogdor.dtsi"
-#include "sc7180-trogdor-ti-sn65dsi86.dtsi"
 
 &ap_sar_sensor {
 	semtech,cs0-ground;
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index faf8b807d0ff..286d3594b6ae 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,lpasscorecc-sc7180.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,videocc-sc7180.h>
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sc7180.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.33.0.1079.g6e70778dc9-goog

