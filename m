Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 812E73AF67E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 21:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231890AbhFUTzk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 15:55:40 -0400
Received: from relay08.th.seeweb.it ([5.144.164.169]:40549 "EHLO
        relay08.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231722AbhFUTzk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 15:55:40 -0400
Received: from localhost.localdomain (bband-dyn238.178-41-213.t-com.sk [178.41.213.238])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id F3A453EB54;
        Mon, 21 Jun 2021 21:53:22 +0200 (CEST)
From:   Martin Botka <martin.botka@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Martin Botka <martin.botka@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>
Subject: [PATCH V4 2/2] arch: arm64: dts: qcom: Add support for Sony Xperia 10II
Date:   Mon, 21 Jun 2021 21:53:05 +0200
Message-Id: <20210621195308.654587-2-martin.botka@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210621195308.654587-1-martin.botka@somainline.org>
References: <20210621195308.654587-1-martin.botka@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commits add support for Sony Xperia 10II based on the SM6125 SoC.

Currently working features:
- dmesg output to bootloader preconfigured display
- USB
- eMMC
- Volume down button

Signed-off-by: Martin Botka <martin.botka@somainline.org>
---
Changes in v2, v3:
None
Changes in V4:
Replace _ with - in node names
Remove stray indentation
Moved sdc2_state_on to here.
Moved sd-cd to here.
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../qcom/sm6125-sony-xperia-seine-pdx201.dts  | 139 ++++++++++++++++++
 2 files changed, 140 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 456502aeee49..5a70dd9593c2 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -69,6 +69,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-oneplus-enchilada.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-oneplus-fajita.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-xiaomi-beryllium.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-sony-xperia-seine-pdx201.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-hdk.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
new file mode 100644
index 000000000000..58b6b2742d3f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, Martin Botka <martin.botka@somainline.org>
+ */
+
+/dts-v1/;
+
+#include "sm6125.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/input/gpio-keys.h>
+
+/ {
+	/* required for bootloader to select correct board */
+	qcom,msm-id = <394 0x10000>; /* sm6125 v1 */
+	qcom,board-id = <34 0>;
+
+	model = "Sony Xperia 10 II";
+	compatible = "sony,pdx201", "qcom,sm6125";
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer0: framebuffer@5c000000 {
+			compatible = "simple-framebuffer";
+			reg = <0 0x5c000000 0 (2520 * 1080 * 4)>;
+			width = <1080>;
+			height = <2520>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	extcon_usb: extcon-usb {
+		compatible = "linux,extcon-usb-gpio";
+		id-gpio = <&tlmm 102 GPIO_ACTIVE_HIGH>;
+	};
+
+	gpio-keys {
+		status = "okay";
+		compatible = "gpio-keys";
+		input-name = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		autorepeat;
+
+		vol-dn {
+			label = "Volume Down";
+			gpios = <&tlmm 47 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			gpio-key,wakeup;
+			debounce-interval = <15>;
+		};
+	};
+
+	reserved_memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		debug_mem: memory@ffb00000 {
+			reg = <0x0 0xffb00000 0x0 0xc0000>;
+			no-map;
+		};
+
+		last_log_mem: memory@ffbc0000 {
+			reg = <0x0 0xffbc0000 0x0 0x80000>;
+			no-map;
+		};
+
+		pstore_mem: ramoops@ffc00000 {
+			compatible = "ramoops";
+			reg = <0x0 0xffc40000 0x0 0xc0000>;
+			record-size = <0x1000>;
+			console-size = <0x40000>;
+			msg-size = <0x20000 0x20000>;
+		};
+
+		cmdline_mem: memory@ffd00000 {
+			reg = <0x0 0xffd40000 0x0 0x1000>;
+			no-map;
+		};
+	};
+};
+
+&hsusb_phy1 {
+	status = "okay";
+};
+
+&sdc2_state_off {
+	sd-cd {
+		pins = "gpio98";
+		bias-disable;
+		drive-strength = <2>;
+	};
+};
+
+&sdhc_1 {
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <22 2>, <28 6>;
+
+	sdc2_state_on: sdc2-on {
+		clk {
+			pins = "sdc2_clk";
+			bias-disable;
+			drive-strength = <16>;
+		};
+
+		cmd {
+			pins = "sdc2_cmd";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		data {
+			pins = "sdc2_data";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		sd-cd {
+			pins = "gpio98";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+	};
+};
+
+&usb3 {
+	status = "okay";
+};
+
+&usb3_dwc3 {
+	extcon = <&extcon_usb>;
+};
-- 
2.32.0

