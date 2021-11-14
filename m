Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9C6B44F60F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Nov 2021 02:29:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236219AbhKNBbT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Nov 2021 20:31:19 -0500
Received: from relay05.th.seeweb.it ([5.144.164.166]:50979 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236216AbhKNBbN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Nov 2021 20:31:13 -0500
Received: from localhost.localdomain (83.6.165.118.neoplus.adsl.tpnet.pl [83.6.165.118])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id EEBC63EE61;
        Sun, 14 Nov 2021 02:28:17 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 13/16] arm64: dts: qcom: Add support for Xperia 1 III / 5 III
Date:   Sun, 14 Nov 2021 02:27:52 +0100
Message-Id: <20211114012755.112226-13-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114012755.112226-1-konrad.dybcio@somainline.org>
References: <20211114012755.112226-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for SONY Xperia 1 III (PDX215) and 5 III (PDX214) smartphones.
Both are based on the SM8350 Sagami platform and feature some really high-end
specs, such as:

- 4K (1 III / PRO-I) / 1080p (5 III), 120Hz HDR OLED 10-bit panels
- USB-C 3.1 with HDMI in (yes, phone as display!) and DP out
- 5G
- 8 or 12 gigs of ram, 128/256/512 gigs of storage
- A 3.5mm headphone jack, a RGB notification LED and a uSD card slot :)
- IP65/68 dust/water resistance
- Dual front-firing speakers and a lot of microphones
- Crazy complex camera hardware (especially on the PRO-I), which includes
4 cameras, an RGBIR sensor and a 3D iToF

The aforementioned PRO-I (PDX217) is not supported in this patch, because
even though it shares most of the code with 1 III, nobody really has it (yet?)

This only adds basic support for booting to a USB shell with a
bootloader-enabled display, support for all the awesome hardware listed above
will (hopefully) come (hopefully) soon.

In order to get a working boot image, you need to run (e.g. for 1 III):

cat arch/arm64/boot/Image.gz arch/arm64/boot/dts/qcom/sm8350-sony-xperia-\
sagami-pdx215.dtb > .Image.gz-dtb

mkbootimg \
--kernel .Image.gz-dtb \
--ramdisk some_initrd.img \
--pagesize 4096 \
--base 0x0 \
--kernel_offset 0x8000 \
--ramdisk_offset 0x1000000 \
--tags_offset 0x100 \
--cmdline "SOME_CMDLINE" \
--dtb_offset 0x1f00000 \
--header_version 1 \
--os_version 11 \
--os_patch_level 2021-10 \ # or newer
-o boot.img-sony-xperia-pdx215

Then, you need to flash it on the device and get rid of all the
vendor_boot/dtbo mess:

fastboot flash boot boot.img-sony-xperia-pdx215
fastboot erase vendor_boot
fastboot flash dtbo emptydtbo.img
fastboot reboot

Where emptydtbo.img is a tiny file that consists of 2 bytes (all zeroes), doing
a "fastboot erase" won't cut it, the bootloader will go crazy and things will
fall apart when it tries to overlay random bytes from an empty partition onto a
perfectly good appended DTB.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../qcom/sm8350-sony-xperia-sagami-pdx214.dts |  19 +++
 .../qcom/sm8350-sony-xperia-sagami-pdx215.dts |  13 ++
 .../dts/qcom/sm8350-sony-xperia-sagami.dtsi   | 132 ++++++++++++++++++
 4 files changed, 166 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index bc38b79f4b5b..3a825bdc9052 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -110,3 +110,5 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-sony-xperia-edo-pdx203.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-sony-xperia-edo-pdx206.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-mtp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-sony-xperia-sagami-pdx214.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8350-sony-xperia-sagami-pdx215.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dts b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dts
new file mode 100644
index 000000000000..cc650508dc2d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
+ */
+
+/dts-v1/;
+
+#include "sm8350-sony-xperia-sagami.dtsi"
+
+/ {
+	model = "Sony Xperia 5 III";
+	compatible = "sony,pdx214-generic", "qcom,sm8350";
+};
+
+&framebuffer {
+	width = <1080>;
+	height = <2520>;
+	stride = <(1080 * 4)>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dts b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dts
new file mode 100644
index 000000000000..d21bbeb603a6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
+ */
+
+/dts-v1/;
+
+#include "sm8350-sony-xperia-sagami.dtsi"
+
+/ {
+	model = "Sony Xperia 1 III";
+	compatible = "sony,pdx215-generic", "qcom,sm8350";
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
new file mode 100644
index 000000000000..b50f04ffee95
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
+ */
+
+#include "sm8350.dtsi"
+#include "pm8350.dtsi"
+#include "pm8350b.dtsi"
+#include "pm8350c.dtsi"
+#include "pmk8350.dtsi"
+#include "pmr735a.dtsi"
+#include "pmr735b.dtsi"
+
+/ {
+	/*
+	 * Yes, you are correct, there is NO MORE {msm,board,pmic}-id on SM8350!
+	 * Adding it will cause the bootloader to go crazy and randomly crash
+	 * shortly after closing UEFI boot services.. Perhaps that has something
+	 * to do with the OS running inside a VM now..?
+	 */
+
+	chassis-type = "handset";
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer: framebuffer@e1000000 {
+			compatible = "simple-framebuffer";
+			reg = <0 0xe1000000 0 0x2300000>;
+
+			/* The display, even though it's 4K, initializes at 1080-ish p */
+			width = <1096>;
+			height = <2560>;
+			stride = <(1096 * 4)>;
+			format = "a8r8g8b8";
+			/*
+			 * That's (going to be) a lot of clocks, but it's necessary due
+			 * to unused clk cleanup & no panel driver yet
+			 */
+			clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&gcc GCC_DISP_SF_AXI_CLK>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		/* For reasons still unknown, GAssist key and Camera Focus/Shutter don't work.. */
+
+		vol-down {
+			label = "Volume Down";
+			linux,code = <KEY_VOLUMEDOWN>;
+			gpios = <&pmk8350_gpios 3 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			gpio-key,wakeup;
+		};
+	};
+
+	reserved-memory {
+		cont_splash_mem: memory@e1000000 {
+			reg = <0 0xe1000000 0 0x2300000>;
+			no-map;
+		};
+
+		ramoops@ffc00000 {
+			compatible = "ramoops";
+			reg = <0 0xffc00000 0 0x100000>;
+			console-size = <0x40000>;
+			record-size = <0x1000>;
+			no-map;
+		};
+	};
+};
+
+&pmk8350_rtc {
+	status = "okay";
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	status = "okay";
+	linux,code = <KEY_VOLUMEUP>;
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&qupv3_id_2 {
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <44 4>;
+};
+
+/* BIG WARNING! DO NOT TOUCH UFS, YOUR DEVICE WILL DIE! */
+&ufs_mem_hc { status = "disabled"; };
+&ufs_mem_phy { status = "disabled"; };
+
+/* TODO: Make USB3 work (perhaps needs regulators for higher-current operation?) */
+&usb_1 {
+	status = "okay";
+
+	qcom,select-utmi-as-pipe-clk;
+};
+
+&usb_1_dwc3 {
+	dr_mode = "peripheral";
+
+	maximum-speed = "high-speed";
+	phys = <&usb_1_hsphy>;
+	phy-names = "usb2-phy";
+};
+
+&usb_1_hsphy {
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	status = "okay";
+};
-- 
2.33.1

