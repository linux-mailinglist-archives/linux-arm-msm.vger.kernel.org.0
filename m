Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 897C93F35B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Aug 2021 22:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240874AbhHTUul (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Aug 2021 16:50:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240854AbhHTUuc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Aug 2021 16:50:32 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17C2FC0612A3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Aug 2021 13:49:53 -0700 (PDT)
Received: from localhost.localdomain (83.6.167.97.neoplus.adsl.tpnet.pl [83.6.167.97])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 153211F54F;
        Fri, 20 Aug 2021 22:49:51 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 17/17] arm64: dts: qcom: Add device tree for Sony Xperia 10 III
Date:   Fri, 20 Aug 2021 22:49:26 +0200
Message-Id: <20210820204926.235192-18-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210820204926.235192-1-konrad.dybcio@somainline.org>
References: <20210820204926.235192-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add initial SM6350 SoC and Sony Xperia 10 III (PDX213, Lena platform) device
trees. There is no sign of another Lena devices on the horizon, so a common
DTSI is not created for now. 10 III features a Full HD OLED display and 5G
support, among other nice things like USB3.

The bootloader is VERY unpleasant, to get a bootable setup you have to run:

mkbootimg --kernel arch/arm64/boot/Image.gz --ramdisk [some initrd] \
--dtb arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dtb \
--cmdline "[some cmdline]" --base 0 --kernel_offset 0x8000 \
--ramdisk_offset 0x1000000 --dtb_offset 0x1f00000 --os_version 11 \
--os_patch_level "2021-08" --tags_offset 0x100 --pagesize 4096 \
--header_version 2 -o mainline.img

adb reboot bootloader

// You have to either pull vbmeta{"","_system"} from
// /dev/block/bootdevice/by-name/ or build one as a part of AOSP build process
fastboot --disable-verity --disable-verification flash vbmeta vbmeta.img
fastboot --disable-verity --disable-verification flash vbmeta_system \
vbmeta_system.img

fastboot flash boot mainline.img
fastboot erase dtbo // This will take approx 70s...
fastboot reboot

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../qcom/sm6350-sony-xperia-lena-pdx213.dts   | 57 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5bbeb058e1f2..d1ace2541ce1 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -78,6 +78,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-sony-xperia-tama-akatsuki.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-sony-xperia-tama-apollo.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-xiaomi-beryllium.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm6350-sony-xperia-lena-pdx213.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-microsoft-surface-duo.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-mtp.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
new file mode 100644
index 000000000000..a26c23754f5d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
+ */
+/dts-v1/;
+
+#include "sm6350.dtsi"
+
+/ {
+	model = "Sony Xperia 10 III";
+	compatible = "sony,pdx213", "qcom,sm6350";
+	qcom,msm-id = <434 0x10000>, <459 0x10000>;
+	qcom,board-id = <0x1000B 0>;
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer: framebuffer@a0000000 {
+			compatible = "simple-framebuffer";
+			reg = <0 0xa0000000 0 0x2300000>;
+			width = <1080>;
+			height = <2520>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+			clocks = <&gcc GCC_DISP_AXI_CLK>;
+		};
+	};
+};
+
+&sdhc_2 {
+	status = "okay";
+
+	cd-gpios = <&tlmm 94 GPIO_ACTIVE_HIGH>;
+};
+
+&tlmm {
+	gpio-reserved-ranges = <13 4>, <45 2>, <56 2>;
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	maximum-speed = "super-speed";
+	dr_mode = "peripheral";
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
2.33.0

