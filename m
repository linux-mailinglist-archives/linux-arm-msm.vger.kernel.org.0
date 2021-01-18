Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12D0E2FA613
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 17:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406605AbhARQ0I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 11:26:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406679AbhARQZu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 11:25:50 -0500
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02C2FC061573
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jan 2021 08:24:54 -0800 (PST)
Received: from localhost.localdomain (abaf224.neoplus.adsl.tpnet.pl [83.6.169.224])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 1D41C1FAD3;
        Mon, 18 Jan 2021 17:24:53 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] arm64: dts: qcom: Add support for remaining Sony Kitakami boards
Date:   Mon, 18 Jan 2021 17:24:21 +0100
Message-Id: <20210118162432.107275-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds support for the following Xperias:

* Z3+ [aka Z4 in some regions] (Ivy)
* Z4 Tablet (Karin)
* Z4 Tablet Wi-Fi (Karin_windy) [APQ8094]
* Z5 Compact (Suzuran)
* Z5 Premium (Satsuki)

These devices are very similar in terms of hardware, with main
differences being display panels.

While at it, update comments describing hardware used:
SMB charger seems to not be used after all, PMI8994 charger
is in use instead.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/Makefile             |  5 +++++
 ...q8094-sony-xperia-kitakami-karin_windy.dts | 20 ++++++++++++++++++
 .../qcom/msm8994-sony-xperia-kitakami-ivy.dts | 13 ++++++++++++
 .../msm8994-sony-xperia-kitakami-karin.dts    | 21 +++++++++++++++++++
 .../msm8994-sony-xperia-kitakami-satsuki.dts  | 13 ++++++++++++
 .../msm8994-sony-xperia-kitakami-suzuran.dts  | 13 ++++++++++++
 .../qcom/msm8994-sony-xperia-kitakami.dtsi    | 15 ++++++++++---
 7 files changed, 97 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5113fac80b7a..6e784c7b0621 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
@@ -13,7 +14,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-msft-lumia-talkman.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-xiaomi-libra.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-angler-rev-101.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-msft-lumia-cityman.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-sony-xperia-kitakami-ivy.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-sony-xperia-kitakami-karin.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-sony-xperia-kitakami-satsuki.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-sony-xperia-kitakami-sumire.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-sony-xperia-kitakami-suzuran.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-asus-novago-tp370ql.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-hp-envy-x2.dtb
diff --git a/arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dts b/arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dts
new file mode 100644
index 000000000000..60497457a555
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Konrad Dybcio <konrad.dybcio@somainline.org>
+ */
+
+/dts-v1/;
+
+/* As the names may imply, there is quite a bunch of duplication there. */
+#include "msm8994-sony-xperia-kitakami-karin.dts"
+
+/ {
+	model = "Sony Xperia Z4 Tablet (Wi-Fi)";
+	compatible = "sony,karin_windy", "qcom,apq8094";
+
+	/*
+	 * This model uses the APQ variant of MSM8994 (APQ8094).
+	 * The v1/v2/v2.1 story (from kitakami.dtsi) also applies here.
+	 */
+	qcom,msm-id = <253 0x20000>, <253 0x20001>;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dts b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dts
new file mode 100644
index 000000000000..4c7a90987f08
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Konrad Dybcio <konrad.dybcio@somainline.org>
+ */
+
+/dts-v1/;
+
+#include "msm8994-sony-xperia-kitakami.dtsi"
+
+/ {
+	model = "Sony Xperia Z3+/Z4";
+	compatible = "sony,ivy-row", "qcom,msm8994";
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts
new file mode 100644
index 000000000000..7e657861387b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Konrad Dybcio <konrad.dybcio@somainline.org>
+ */
+
+/dts-v1/;
+
+#include "msm8994-sony-xperia-kitakami.dtsi"
+
+/ {
+	model = "Sony Xperia Z4 Tablet (LTE)";
+	compatible = "sony,karin-row", "qcom,msm8994";
+};
+
+&blsp_i2c5 {
+	/*
+	 * TI LP8557 backlight driver @ 2c
+	 * AD AD7146 touch controller @ 2f
+	 * sii8620 HDMI/MHL bridge @ 72 (kitakami-common)
+	 */
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dts b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dts
new file mode 100644
index 000000000000..1081fe6a4d67
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Konrad Dybcio <konrad.dybcio@somainline.org>
+ */
+
+/dts-v1/;
+
+#include "msm8994-sony-xperia-kitakami.dtsi"
+
+/ {
+	model = "Sony Xperia Z5 Premium";
+	compatible = "sony,satsuki-row", "qcom,msm8994";
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dts b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dts
new file mode 100644
index 000000000000..2c670ab28613
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Konrad Dybcio <konrad.dybcio@somainline.org>
+ */
+
+/dts-v1/;
+
+#include "msm8994-sony-xperia-kitakami.dtsi"
+
+/ {
+	model = "Sony Xperia Z5 Compact";
+	compatible = "sony,suzuran-row", "qcom,msm8994";
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
index 791f254ac3f8..71d7187eb090 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
@@ -11,8 +11,17 @@
 
 / {
 	/* required for bootloader to select correct board */
-	qcom,msm-id = <0xcf 0x20001>;
+
+	/*
+	 * We support MSM8994 v2 (0x20000) and v2.1 (0x20001).
+	 * The V1 chip (0x0 and 0x10000) is significantly different
+	 * and requires driver-side changes (including CPR, be warned!!).
+	 * Besides that, it's very rare.
+	 */
+	qcom,msm-id = <207 0x20000>, <207 0x20001>;
+	/* We only use pm8994+pmi8994. */
 	qcom,pmic-id = <0x10009 0x1000a 0x00 0x00>;
+	/* This property is shared across all kitakami devices. */
 	qcom,board-id = <8 0>;
 
 	/* Kitakami firmware doesn't support PSCI */
@@ -120,7 +129,7 @@ &blsp_spi0 {
 &blsp_i2c2 {
 	status = "okay";
 
-	/* NXP NFC */
+	/* NXP PN547 NFC */
 };
 
 &blsp_i2c4 {
@@ -132,7 +141,7 @@ &blsp_i2c4 {
 &blsp_i2c5 {
 	status = "okay";
 
-	/* SMB1357 charger and sii8620 HDMI/MHL bridge */
+	/* sii8620 HDMI/MHL bridge */
 };
 
 &blsp_i2c6 {
-- 
2.29.2

