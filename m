Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A79F257342
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Aug 2020 07:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725891AbgHaFYX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Aug 2020 01:24:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgHaFYP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Aug 2020 01:24:15 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CB53C061573
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2020 22:24:15 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id l9so851871plt.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2020 22:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=jMoCGzxggQS28J5sKgibCffSv1W6ppOY1n0LogiGFCI=;
        b=xpKt0/O/gtgdCR9DbPdPNcIQN4SYab0ULAUE+HxJjXWkiX3iDHVncc2S34sQw9n17r
         i/bNpRRtq0xrvbkRs5estleUUrx58Yhq3Qpn8K3flVU+hnxjMSzBHnW2V2yBOiNTk91s
         IrcFLyKhpjreHjpbF0nja1mLFD6+wwpt8Po17BOBQeRIBVYD+tOOg5nrJ6g6Qwq0B3v5
         d+Nx20lwT/kRfdlfWquhulpKOOXO3qBMvvswW7RYDsHvI1CplPNp8gYlAV9jAHBIW6dz
         il08PYhS7hLItyJiMr0/+DE1mBopNaz6Si9pL5xpGxt4ETOyDXNmkPc9io2JTgiV7ZvE
         l00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=jMoCGzxggQS28J5sKgibCffSv1W6ppOY1n0LogiGFCI=;
        b=TgyItUZE4/QL92A/YdZA0n50VUDLw3YY7NRdkffPZYk3nKMKro/AJmhuKAZUyh9kLM
         BqkMBFHCDsGJNVgLoj5sn2Hy6ODBwYGIAPkQraeRbXebLrcewK/2XHB3TtPKs6xoQYll
         1/nhfe1cw3OLX+hi92+/xw767r0golnqbmH9ARCjUXsW4JV5v/F9JrXFprbt63SltN3l
         4dgbf3jkj9stkw0bq2qlN+K2vuMybNKm6/V1BkkRUdmDFFAtDkIQCcLb817CvZ0rKXAj
         FX1mo6HQi1q1qTx7vpE3s3rrpkd6N93fznS/zCzFEh1guQjXaO02wEhHsNmpNpbUf7kl
         gbLg==
X-Gm-Message-State: AOAM531T0KDdWfU9mHAJoqS+7NPzeY1DEUxTT6+xXOxbP+wS5IW5LXia
        8DQWjN+0fJ7M1MIbyfde+daY7W4wxDdbbw==
X-Google-Smtp-Source: ABdhPJzZN2DMR2DeutI1douJ1Qi7oYSVVf8SOU5vK8CNhaFPjd75p85IkEFgCqvIN7qSlQ4HgdJMwg==
X-Received: by 2002:a17:90b:4ac7:: with SMTP id mh7mr64974pjb.99.1598851455051;
        Sun, 30 Aug 2020 22:24:15 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6803:69cf:9804:99c:722f:322c])
        by smtp.gmail.com with ESMTPSA id y8sm6621851pfr.23.2020.08.30.22.24.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 30 Aug 2020 22:24:14 -0700 (PDT)
From:   Amit Pundir <amit.pundir@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v6] arm64: dts: qcom: Add support for Xiaomi Poco F1 (Beryllium)
Date:   Mon, 31 Aug 2020 10:54:08 +0530
Message-Id: <1598851448-5493-1-git-send-email-amit.pundir@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add initial dts support for Xiaomi Poco F1 (Beryllium).

This initial support is based on upstream Dragonboard 845c
(sdm845) device. With this dts, Beryllium boots AOSP up to
ADB shell over USB-C.

Supported functionality includes UFS, USB-C (peripheral),
microSD card and Vol+/Vol-/power keys. Bluetooth should work
too but couldn't be verified from adb command line, it is
verified when enabled from UI with few WIP display patches.

Just like initial db845c support, initializing the SMMU is
clearing the mapping used for the splash screen framebuffer,
which causes the device to hang during boot and recovery
needs a hard power reset. This can be worked around using:

    fastboot oem select-display-panel none

To switch ON the display back run:

    fastboot oem select-display-panel

But this only works on Beryllium devices running bootloader
version BOOT.XF.2.0-00369-SDM845LZB-1 that shipped with
Android-9 based release. Newer bootloader version do not
support switching OFF the display panel at all.

Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
My WIP tree with a few out-of-tree patches to support
display, touchscreen, wifi, audio etc is here:
https://github.com/pundiramit/linux/commits/beryllium-mainline

v6: Renamed dts file to include vendor (xiaomi) name. Moved
    reserved memory changes in the main node. Renamed model to
    phone's pretty name. Removed the mmc drive strength comment
    to avoid further confusion. Sorted the entries in alphabetical
    order, but additional pinctrl entries are still defined at the
    end to align with the upstream db845c dts.
v5: Bumped &tz_mem size from 0x2d00000 to 0x4900000 (to include
    downstream &removed_region), all the way up to &qseecom_mem.
v4: Added more downstream reserved memory regions. It probably
    need more work, but for now I see adsp/cdsp/wlan remoteprocs
    powering up properly. Removed the regulator nodes not
    required for the device, as suggested by Bjorn. Also added
    couple of clocks to protected clocks, which is needed for
    display to work.
v3: Added a reserved-memory region from downstream kernel to fix
    a boot regression with recent dma-pool changes in v5.8-rc6.
v2: Updated machine compatible string for seemingly inevitable
    future quirks.

 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts      | 383 +++++++++++++++++++++
 2 files changed, 384 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index d8f1466e6758..9adc269252d3 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -30,6 +30,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-xiaomi-beryllium.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-mtp.dtb
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
new file mode 100644
index 000000000000..cd25d5d8c0c9
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
@@ -0,0 +1,383 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "sdm845.dtsi"
+#include "pm8998.dtsi"
+#include "pmi8998.dtsi"
+
+/*
+ * Delete following upstream (sdm845.dtsi) reserved
+ * memory mappings which are different in this device.
+ */
+/delete-node/ &tz_mem;
+/delete-node/ &adsp_mem;
+/delete-node/ &wlan_msa_mem;
+/delete-node/ &mpss_region;
+/delete-node/ &venus_mem;
+/delete-node/ &cdsp_mem;
+/delete-node/ &mba_region;
+/delete-node/ &slpi_mem;
+/delete-node/ &spss_mem;
+/delete-node/ &rmtfs_mem;
+
+/ {
+	model = "Xiaomi Pocophone F1";
+	compatible = "xiaomi,beryllium", "qcom,sdm845";
+
+	/* required for bootloader to select correct board */
+	qcom,board-id = <69 0>;
+	qcom,msm-id = <321 0x20001>;
+
+	aliases {
+		hsuart0 = &uart6;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&vol_up_pin_a>;
+
+		vol-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pm8998_gpio 6 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	/* Reserved memory changes from downstream */
+	reserved-memory {
+		tz_mem: memory@86200000 {
+			reg = <0 0x86200000 0 0x4900000>;
+			no-map;
+		};
+
+		adsp_mem: memory@8c500000 {
+			reg = <0 0x8c500000 0 0x1e00000>;
+			no-map;
+		};
+
+		wlan_msa_mem: memory@8e300000 {
+			reg = <0 0x8e300000 0 0x100000>;
+			no-map;
+		};
+
+		mpss_region: memory@8e400000 {
+			reg = <0 0x8e400000 0 0x7800000>;
+			no-map;
+		};
+
+		venus_mem: memory@95c00000 {
+			reg = <0 0x95c00000 0 0x500000>;
+			no-map;
+		};
+
+		cdsp_mem: memory@96100000 {
+			reg = <0 0x96100000 0 0x800000>;
+			no-map;
+		};
+
+		mba_region: memory@96900000 {
+			reg = <0 0x96900000 0 0x200000>;
+			no-map;
+		};
+
+		slpi_mem: memory@96b00000 {
+			reg = <0 0x96b00000 0 0x1400000>;
+			no-map;
+		};
+
+		spss_mem: memory@97f00000 {
+			reg = <0 0x97f00000 0 0x100000>;
+			no-map;
+		};
+
+		rmtfs_mem: memory@f6301000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0 0xf6301000 0 0x200000>;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <15>;
+		};
+	};
+
+	vreg_s4a_1p8: vreg-s4a-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_s4a_1p8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+};
+
+&adsp_pas {
+	status = "okay";
+	firmware-name = "qcom/sdm845/adsp.mdt";
+};
+
+&apps_rsc {
+	pm8998-rpmh-regulators {
+		compatible = "qcom,pm8998-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vreg_l1a_0p875: ldo1 {
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5a_0p8: ldo5 {
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a_1p8: ldo7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12a_1p8: ldo12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13a_2p95: ldo13 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17a_1p3: ldo17 {
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l20a_2p95: ldo20 {
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2968000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l21a_2p95: ldo21 {
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2968000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l24a_3p075: ldo24 {
+			regulator-min-microvolt = <3088000>;
+			regulator-max-microvolt = <3088000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l25a_3p3: ldo25 {
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l26a_1p2: ldo26 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&cdsp_pas {
+	status = "okay";
+	firmware-name = "qcom/sdm845/cdsp.mdt";
+};
+
+&gcc {
+	protected-clocks = <GCC_QSPI_CORE_CLK>,
+			   <GCC_QSPI_CORE_CLK_SRC>,
+			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
+			   <GCC_LPASS_Q6_AXI_CLK>,
+			   <GCC_LPASS_SWAY_CLK>;
+};
+
+&gpu {
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/sdm845/a630_zap.mbn";
+	};
+};
+
+&mss_pil {
+	status = "okay";
+	firmware-name = "qcom/sdm845/mba.mbn", "qcom/sdm845/modem.mdt";
+};
+
+&pm8998_gpio {
+	vol_up_pin_a: vol-up-active {
+		pins = "gpio6";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+	};
+};
+
+&pm8998_pon {
+	resin {
+		compatible = "qcom,pm8941-resin";
+		interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
+		debounce = <15625>;
+		bias-pull-up;
+		linux,code = <KEY_VOLUMEDOWN>;
+	};
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&sdhc_2 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdc2_default_state &sdc2_card_det_n>;
+
+	vmmc-supply = <&vreg_l21a_2p95>;
+	vqmmc-supply = <&vreg_l13a_2p95>;
+
+	bus-width = <4>;
+	cd-gpios = <&tlmm 126 GPIO_ACTIVE_HIGH>;
+};
+
+&tlmm {
+	gpio-reserved-ranges = <0 4>, <81 4>;
+
+	sdc2_default_state: sdc2-default {
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
+	};
+
+	sdc2_card_det_n: sd-card-det-n {
+		pins = "gpio126";
+		function = "gpio";
+		bias-pull-up;
+	};
+};
+
+&uart6 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn3990-bt";
+
+		vddio-supply = <&vreg_s4a_1p8>;
+		vddxo-supply = <&vreg_l7a_1p8>;
+		vddrf-supply = <&vreg_l17a_1p3>;
+		vddch0-supply = <&vreg_l25a_3p3>;
+		max-speed = <3200000>;
+	};
+};
+
+&ufs_mem_hc {
+	status = "okay";
+
+	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l20a_2p95>;
+	vcc-max-microamp = <800000>;
+};
+
+&ufs_mem_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l26a_1p2>;
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
+
+	vdd-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l12a_1p8>;
+	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
+
+	qcom,imp-res-offset-value = <8>;
+	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
+	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
+	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
+};
+
+&usb_1_qmpphy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l26a_1p2>;
+	vdda-pll-supply = <&vreg_l1a_0p875>;
+};
+
+&wifi {
+	status = "okay";
+
+	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
+	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
+	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
+	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
+};
+
+/* PINCTRL - additions to nodes defined in sdm845.dtsi */
+
+&qup_uart6_default {
+	pinmux {
+		pins = "gpio45", "gpio46", "gpio47", "gpio48";
+		function = "qup6";
+	};
+
+	cts {
+		pins = "gpio45";
+		bias-disable;
+	};
+
+	rts-tx {
+		pins = "gpio46", "gpio47";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	rx {
+		pins = "gpio48";
+		bias-pull-up;
+	};
+};
-- 
2.7.4

