Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5DDF60D2FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Oct 2022 20:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232641AbiJYSHG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Oct 2022 14:07:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232580AbiJYSG5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Oct 2022 14:06:57 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E4A167E3;
        Tue, 25 Oct 2022 11:06:55 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2a00:f41:181d:45ba:3479:f7c2:4c21:3ad3])
        (using TLSv1.3 with cipher TLS_CHACHA20_POLY1305_SHA256 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA512)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 890D8200B9;
        Tue, 25 Oct 2022 20:06:52 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-hardening@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: qcom: Add device tree for Sony Xperia 10 IV
Date:   Tue, 25 Oct 2022 20:06:33 +0200
Message-Id: <20221025180634.28956-4-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20221025180634.28956-1-konrad.dybcio@somainline.org>
References: <20221025180634.28956-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for Sony Xperia 10 IV, a.k.a PDX225. This device is a part
of the SoMC SM6375 Murray platform and currently it is the only
device based on that board, so no -common DTSI is created until (if?)
other Murray devices appear.

This commit brings support for:
* USB (only USB2 for now)
* Display via simplefb

To create a working boot image, you need to run:
cat arch/arm64/boot/Image.gz arch/arm64/boot/dts/qcom/sm6375-sony-xperia-\
murray-pdx225.dtb > .Image.gz-dtb

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
--os_version 12 \
--os_patch_level 2022-04 \ # or newer
-o boot.img-sony-xperia-pdx225

Then, you need to flash it on the device and get rid of all the
vendor_boot/dtbo mess:

First, you need to get rid of vendor_boot. However, the bootloader
is utterly retarded and it will not let you neither flash nor erase it.
There are a couple ways to handle this: you can either dd /dev/zero to
it from Android (if you have root) or a custom recovery or from fastbootd
(fastboot/adb reboot fastboot). You will not be able to boot Android
images on your phone unless you lock the bootloader (fastboot oem lock)
and restore the factory image with Xperia Companion
Windows-and-macOS-only software.

The best way so far is probably to use the second (_b) slot and flash
mainline there. This will however require you to flash some partitions
manually, as they are not populated from factory:

(boot_b, dtbo_b, vendor_boot_b, vbmeta_b, vbmeta_system_b) - these we
don't really care about as we nuke/replace them

(dsp_b, imagefv_b, modem_b, oem_b, rdimage_b) - these you NEED to populate
to get a successful boot on slot B, otherwise you will have limited / no
functionality.

To switch slots, simply run:

fastboot --set-active=a //or =b

The rest assumes you are on slot A.

// You have to either pull vbmeta{"","_system"} from
// /dev/block/bootdevice/by-name/ or build one as a part of AOSP
fastboot --disable-verity --disable-verification flash vbmeta_b vbmeta.img
fastboot --disable-verity --disable-verification flash vbmeta_system_b \
vbmeta_system.img

fastboot flash boot_b boot.img-sony-xperia-pdx225
fastboot reboot fastboot // entering fastbootd
fastboot flash vendor_boot_b emptything.img
fastboot flash dtbo_b emptything.img
fastboot reboot bootloader // entering bootloader fastboot
fastboot --set-active=b
fastboot reboot // mainline time!

Where emptything.img is a tiny file that consists of 2 bytes (all zeroes),
doing a "fastboot erase" won't cut it, the bootloader will go crazy and
things will fall apart when it tries to overlay random bytes from an empty
partition onto a perfectly good appended DTB.

From there on you can flash new mainline builds by simply flashing
boot.img that you create after each kernel rebuild.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
Changes since v1:
- Move the xo_board freq into device DTS

 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../qcom/sm6375-sony-xperia-murray-pdx225.dts | 86 +++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index b0558d3389e5..0292d116c25b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -144,6 +144,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-samsung-w737.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-sony-xperia-seine-pdx201.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6350-sony-xperia-lena-pdx213.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm6375-sony-xperia-murray-pdx225.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm7225-fairphone-fp4.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-microsoft-surface-duo.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts b/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts
new file mode 100644
index 000000000000..08a705e8ff92
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2022, Konrad Dybcio <konrad.dybcio@somainline.org>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "sm6375.dtsi"
+#include "pmr735a.dtsi"
+
+/ {
+	model = "Sony Xperia 10 IV";
+	compatible = "sony,pdx225", "qcom,sm6375";
+	chassis-type = "handset";
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer: framebuffer@85200000 {
+			compatible = "simple-framebuffer";
+			reg = <0 0x85200000 0 0xc00000>;
+
+			width = <1080>;
+			height = <2520>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+			/*
+			 * That's (going to be) a lot of clocks, but it's necessary due
+			 * to unused clk cleanup & no panel driver yet
+			 */
+			clocks = <&gcc GCC_DISP_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&gcc GCC_DISP_THROTTLE_CORE_CLK>,
+				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>;
+		};
+	};
+
+	reserved-memory {
+		cont_splash_mem: memory@85200000 {
+			reg = <0 0x85200000 0 0xc00000>;
+			no-map;
+		};
+
+		ramoops@ffc40000 {
+			compatible = "ramoops";
+			reg = <0 0xffc40000 0 0xb0000>;
+			record-size = <0x10000>;
+			console-size = <0x60000>;
+			ftrace-size = <0x10000>;
+			pmsg-size = <0x20000>;
+			ecc-size = <16>;
+		};
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&tlmm {
+	gpio-reserved-ranges = <13 4>;
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&usb_1_hsphy {
+	status = "okay";
+};
+
+&xo_board {
+	clock-frequency = <19200000>;
+};
-- 
2.38.1

