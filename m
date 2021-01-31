Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0409B3099BF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Jan 2021 02:41:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232547AbhAaBka (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 20:40:30 -0500
Received: from relay03.th.seeweb.it ([5.144.164.164]:47287 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232560AbhAaBk1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jan 2021 20:40:27 -0500
Received: from localhost.localdomain (abaf219.neoplus.adsl.tpnet.pl [83.6.169.219])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 098D31F6DE;
        Sun, 31 Jan 2021 02:39:28 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gustave Monce <gustave.monce@outlook.com>
Subject: [PATCH 05/18] arm64: dts: qcom: msm8992/4-lumia*: Create a common DTS
Date:   Sun, 31 Jan 2021 02:38:36 +0100
Message-Id: <20210131013853.55810-6-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210131013853.55810-1-konrad.dybcio@somainline.org>
References: <20210131013853.55810-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Gustave Monce <gustave.monce@outlook.com>

Lumia 950 and 950XL are both based on the Octagon board, sharing
the vast majority of components, configuration etc. Commonize it.

Signed-off-by: Gustave Monce <gustave.monce@outlook.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/Makefile             |  4 +-
 .../msm8992-msft-lumia-octagon-talkman.dts    | 15 +++++
 .../dts/qcom/msm8992-msft-lumia-talkman.dts   | 67 -------------------
 .../msm8994-msft-lumia-octagon-cityman.dts    | 15 +++++
 ...an.dts => msm8994-msft-lumia-octagon.dtsi} | 14 ++--
 5 files changed, 38 insertions(+), 77 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8992-msft-lumia-talkman.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dts
 rename arch/arm64/boot/dts/qcom/{msm8994-msft-lumia-cityman.dts => msm8994-msft-lumia-octagon.dtsi} (83%)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6e784c7b0621..ff47d8c365ad 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -10,10 +10,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a3u-eur.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a5u-eur.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-msft-lumia-talkman.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-msft-lumia-octagon-talkman.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-xiaomi-libra.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-angler-rev-101.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-msft-lumia-cityman.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-msft-lumia-octagon-cityman.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-sony-xperia-kitakami-ivy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-sony-xperia-kitakami-karin.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-sony-xperia-kitakami-satsuki.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dts b/arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dts
new file mode 100644
index 000000000000..ad8cf5bfa4e1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Konrad Dybcio <konrad.dybcio@somainline.org>
+ * Copyright (c) 2020, Gustave Monce <gustave.monce@outlook.com>
+ */
+
+/dts-v1/;
+
+#include "msm8992.dtsi"
+#include "msm8994-msft-lumia-octagon.dtsi"
+
+/ {
+	model = "Microsoft Lumia 950";
+	compatible = "microsoft,talkman", "qcom,msm8992";
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8992-msft-lumia-talkman.dts b/arch/arm64/boot/dts/qcom/msm8992-msft-lumia-talkman.dts
deleted file mode 100644
index c337a86a5c77..000000000000
--- a/arch/arm64/boot/dts/qcom/msm8992-msft-lumia-talkman.dts
+++ /dev/null
@@ -1,67 +0,0 @@
-// SPDX-License-Identifier: BSD-3-Clause
-/*
- * Copyright (c) 2020, Konrad Dybcio
- */
-
-/dts-v1/;
-
-#include "msm8992.dtsi"
-#include "pm8994.dtsi"
-#include "pmi8994.dtsi"
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/input/gpio-keys.h>
-
-/ {
-	model = "Microsoft Lumia 950";
-	compatible = "microsoft,talkman", "qcom,msm8992";
-
-	/* Most Lumia 950 users use GRUB to load their kernels,
-	 * hence there is no need for msm-id and friends.
-	 */
-
-	/* This enables graphical output via bootloader-enabled display.
-	 * acpi=no is required due to WP platforms having ACPI support, but
-	 * only for Windows-based OSes.
-	 */
-	chosen {
-		bootargs = "earlycon=efifb console=efifb acpi=no";
-
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-	};
-};
-
-&blsp_i2c1 {
-	status = "okay";
-
-	rmi4-i2c-dev@4b {
-		compatible = "syna,rmi4-i2c";
-		reg = <0x4b>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		interrupt-parent = <&tlmm>;
-		interrupts = <77 IRQ_TYPE_EDGE_FALLING>;
-
-		rmi4-f01@1 {
-			reg = <0x01>;
-			syna,nosleep-mode = <1>;
-		};
-
-		rmi4-f12@12 {
-			reg = <0x12>;
-			syna,sensor-type = <1>;
-			syna,clip-x-low = <0>;
-			syna,clip-x-high = <1440>;
-			syna,clip-y-low = <0>;
-			syna,clip-y-high = <2560>;
-		};
-	};
-};
-
-&sdhc_1 {
-	status = "okay";
-
-	mmc-hs200-1_8v;
-};
diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dts b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dts
new file mode 100644
index 000000000000..33eb46f88ce8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Konrad Dybcio <konrad.dybcio@somainline.org>
+ * Copyright (c) 2020, Gustave Monce <gustave.monce@outlook.com>
+ */
+
+/dts-v1/;
+
+#include "msm8994.dtsi"
+#include "msm8994-msft-lumia-octagon.dtsi"
+
+/ {
+	model = "Microsoft Lumia 950 XL";
+	compatible = "microsoft,cityman", "qcom,msm8994";
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-cityman.dts b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
similarity index 83%
rename from arch/arm64/boot/dts/qcom/msm8994-msft-lumia-cityman.dts
rename to arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
index 2d989a70e0b5..b9e3e7821cbc 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-cityman.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
@@ -1,20 +1,18 @@
 // SPDX-License-Identifier: BSD-3-Clause
 /*
+ * Common Board Device Tree for
+ * Microsoft Mobile MSM8994 Octagon Platforms
+ *
  * Copyright (c) 2020, Konrad Dybcio <konrad.dybcio@somainline.org>
+ * Copyright (c) 2020, Gustave Monce <gustave.monce@outlook.com>
  */
 
-/dts-v1/;
-
-#include "msm8994.dtsi"
 #include "pm8994.dtsi"
 #include "pmi8994.dtsi"
 
 / {
-	model = "Microsoft Lumia 950 XL";
-	compatible = "microsoft,cityman", "qcom,msm8994";
-
 	/*
-	 * Most Lumia 950XL users use GRUB to load their kernels,
+	 * Most Lumia 950/XL users use GRUB to load their kernels,
 	 * hence there is no need for msm-id and friends.
 	 */
 
@@ -55,7 +53,7 @@ rmi4-f12@12 {
 			syna,clip-x-low = <0>;
 			syna,clip-x-high = <1440>;
 			syna,clip-y-low = <0>;
-			syna,clip-y-high = <2660>;
+			syna,clip-y-high = <2560>;
 		};
 	};
 };
-- 
2.30.0

