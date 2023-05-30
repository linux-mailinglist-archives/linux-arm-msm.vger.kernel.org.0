Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08BCF716973
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 18:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233311AbjE3Q1Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 12:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233356AbjE3Q0U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 12:26:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF0FDE73;
        Tue, 30 May 2023 09:25:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A130362D06;
        Tue, 30 May 2023 16:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE27C433A0;
        Tue, 30 May 2023 16:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685463950;
        bh=IhfrXSRYeppBiKSQbUE6Zdvbaibxo47NgA49aejhbtU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AZaNOD4B+QV9brTRzuZx0sNrvAn7BVuNv2f5NImvIYKipTr0NfzfixsymHjTnuLmP
         h+/hHl7K0aRZ7S2Lun95hZxE4paYL2UIXnkMtXg3jrQUL9/euh9Dpq9K+qSr4i2a9R
         XhYSLyljmBIu/S6CEmVRZpll9lxJQmgAZOq/K6QepVHdjgw6y6DvYd6GVRmmSJvMR6
         by/xbF9WMeqJi3Fzvdku3RikUZd8YJThX01Atdm9SYkyKRE3MVT3//hZm8CfKcldVa
         k3tqRjrHZTxJhV16fOkjdf2+63UmwRPhve/n/rD3iWpsAJRAfjTHO5n81h4+cB+j5T
         /3gtkOygBGiLQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v3 14/15] arm64: dts: qcom: sc8180x: Introduce Primus
Date:   Tue, 30 May 2023 21:54:53 +0530
Message-Id: <20230530162454.51708-15-vkoul@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530162454.51708-1-vkoul@kernel.org>
References: <20230530162454.51708-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

Introduce support for the SC8180X reference device, aka Primus, with
debug UART, regulators, UFS and USB support.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/Makefile           |   1 +
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts | 706 ++++++++++++++++++++
 2 files changed, 707 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc8180x-primus.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index d42c59572ace..29bfc13d3425 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -140,6 +140,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-zombie-nvme-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-idp2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-crd-r3.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc8180x-primus.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-lenovo-thinkpad-x13s.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sda660-inforce-ifc6560.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
new file mode 100644
index 000000000000..cca663bcb92d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
@@ -0,0 +1,706 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2020-2023, Linaro Limited
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "sc8180x.dtsi"
+#include "sc8180x-pmics.dtsi"
+
+/ {
+	model = "Qualcomm SC8180x Primus";
+	compatible = "qcom,sc8180x-primus", "qcom,sc8180x";
+
+	aliases {
+		serial0 = &uart12;
+		serial1 = &uart13;
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pmc8180c_lpg 4 1000000>;
+		enable-gpios = <&pmc8180c_gpios 8 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&bl_pwm_default>;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&hall_int_active_state>;
+
+		lid-switch {
+			gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+		};
+	};
+
+	reserved-memory {
+		rmtfs_mem: rmtfs-region@85500000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0x0 0x85500000 0x0 0x200000>;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <15>;
+		};
+
+		wlan_mem: wlan-region@8bc00000 {
+			reg = <0x0 0x8bc00000 0x0 0x180000>;
+			no-map;
+		};
+
+		adsp_mem: adsp-region@96e00000 {
+			reg = <0x0 0x96e00000 0x0 0x1c00000>;
+			no-map;
+		};
+
+		mpss_mem: mpss-region@8d800000 {
+			reg = <0x0 0x8d800000 0x0 0x9600000>;
+			no-map;
+		};
+
+		gpu_mem: gpu-region@98a00000 {
+			reg = <0x0 0x98a00000 0x0 0x2000>;
+			no-map;
+		};
+
+		reserved-region@9a500000 {
+			reg = <0x0 0x9a500000 0x0 0x600000>;
+			no-map;
+		};
+	};
+
+	vreg_nvme_0p9: nvme-0p9-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_nvme_0p9";
+
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <900000>;
+
+		regulator-always-on;
+	};
+
+	vreg_nvme_3p3: nvme-3p3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_nvme_3p3";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmc8180c_gpios 11 0>;
+		enable-active-high;
+
+		regulator-always-on;
+	};
+
+	vdd_kb_tp_3v3: vdd-kb-tp-3v3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_kb_tp_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		regulator-always-on;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&kb_tp_3v3_en_active_state>;
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+	};
+
+	vreg_s4a_1p8: pm8150-s4 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_s4a_1p8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		vin-supply = <&vph_pwr>;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pmc8180-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-l7-l12-l14-l15-supply = <&vreg_s5a_2p0>;
+
+		vreg_s5a_2p0: smps5 {
+			regulator-min-microvolt = <2040000>;
+			regulator-max-microvolt = <2100000>;
+		};
+
+		vreg_l7a_1p8: ldo7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9a_1p3: ldo9 {
+			regulator-min-microvolt = <1296000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12a_1p8: ldo12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pmc8180c-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vdd-s6-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+		vdd-l2-l3-supply = <&vreg_s6c_1p35>;
+		vdd-bob-supply = <&vph_pwr>;
+
+		vreg_s6c_1p35: smps6 {
+			regulator-min-microvolt = <1350000>;
+			regulator-max-microvolt = <1372000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s8c_1p8: smps8 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+		};
+
+		vreg_l3c_1p2: ldo3 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4c_3p3: ldo4 {
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10c_3p3: ldo10 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11c_3p3: ldo11 {
+			regulator-min-microvolt = <3296000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob: bob {
+			regulator-min-microvolt = <3296000>;
+			regulator-max-microvolt = <3350000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pmc8180-rpmh-regulators";
+		qcom,pmic-id = "e";
+
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-l2-l10-supply = <&vreg_bob>;
+		vdd-l3-l4-l5-l18-supply = <&vreg_s4e_0p98>;
+		vdd-l7-l12-l14-l15-supply = <&vreg_s5e_2p05>;
+		vdd-l13-l16-l17-supply = <&vreg_bob>;
+
+		vreg_s4e_0p98: smps4 {
+			regulator-min-microvolt = <992000>;
+			regulator-max-microvolt = <992000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5e_2p05: smps5 {
+			regulator-min-microvolt = <2040000>;
+			regulator-max-microvolt = <2040000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1e_0p75: ldo1 {
+			regulator-min-microvolt = <752000>;
+			regulator-max-microvolt = <752000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5e_0p88: ldo5 {
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7e_1p8: ldo7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10e_2p9: ldo10 {
+			regulator-min-microvolt = <2904000>;
+			regulator-max-microvolt = <2904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12e: ldo12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16e_3p0: ldo16 {
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&dispcc {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/sc8180x/qcdxkmsuc8180.mbn";
+	};
+};
+
+&i2c1 {
+	clock-frequency = <100000>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&ts_i2c_active_state>;
+
+	status = "okay";
+
+	touchscreen@10 {
+		compatible = "hid-over-i2c";
+		reg = <0x10>;
+		hid-descr-addr = <0x1>;
+
+		vdd-supply = <&vreg_l4c_3p3>;
+		vddl-supply = <&vreg_l12e>;
+
+		post-power-on-delay-ms = <20>;
+
+		interrupts-extended = <&tlmm 122 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_active_state>;
+	};
+};
+
+&i2c7 {
+	clock-frequency = <100000>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&aux_i2c_active_state>;
+
+	status = "okay";
+
+	touchpad@15 {
+		compatible = "hid-over-i2c";
+		reg = <0x15>;
+		hid-descr-addr = <0x1>;
+
+		interrupts-extended = <&tlmm 24 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&tp_int_active_state>;
+
+		vdd-supply = <&vdd_kb_tp_3v3>;
+	};
+
+	keyboard@3a {
+		compatible = "hid-over-i2c";
+		reg = <0x3a>;
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 37 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&kb_int_active_state>;
+
+		vdd-supply = <&vdd_kb_tp_3v3>;
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_edp {
+	data-lanes = <0 1 2 3>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&edp_hpd_active>;
+
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "edp-panel";
+
+			backlight = <&backlight>;
+
+			ports {
+				port {
+					auo_b133han05_in: endpoint {
+						remote-endpoint = <&mdss_edp_out>;
+					};
+				};
+			};
+		};
+	};
+
+	ports {
+		port@1 {
+			reg = <1>;
+			mdss_edp_out: endpoint {
+				remote-endpoint = <&auo_b133han05_in>;
+			};
+		};
+	};
+};
+
+&pcie1 {
+	perst-gpio = <&tlmm 175 GPIO_ACTIVE_LOW>;
+	wake-gpio = <&tlmm 177 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_default_state>;
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l5e_0p88>;
+	vdda-pll-supply = <&vreg_l3c_1p2>;
+
+	status = "okay";
+};
+
+&pmc8180c_lpg {
+	status = "okay";
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
+&remoteproc_adsp {
+	memory-region = <&adsp_mem>;
+	firmware-name = "qcom/sc8180x/qcadsp8180.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	memory-region = <&mpss_mem>;
+	firmware-name = "qcom/sc8180x/qcmpss8180.mbn";
+
+	status = "okay";
+};
+
+&uart12 {
+	compatible = "qcom,geni-debug-uart";
+	status = "okay";
+};
+
+&uart13 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart13_state>;
+
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn3998-bt";
+
+		vddio-supply = <&vreg_s4a_1p8>;
+		vddxo-supply = <&vreg_l7a_1p8>;
+		vddrf-supply = <&vreg_l9a_1p3>;
+		vddch0-supply = <&vreg_l11c_3p3>;
+		max-speed = <3200000>;
+	};
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 190 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l10e_2p9>;
+	vcc-max-microamp = <155000>;
+
+	vccq2-supply = <&vreg_l7e_1p8>;
+	vccq2-max-microamp = <425000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l5e_0p88>;
+	vdda-pll-supply = <&vreg_l3c_1p2>;
+
+	status = "okay";
+};
+
+&usb_prim_hsphy {
+	vdda-pll-supply = <&vreg_l5e_0p88>;
+	vdda18-supply = <&vreg_l12a_1p8>;
+	vdda33-supply = <&vreg_l16e_3p0>;
+
+	status = "okay";
+};
+
+&usb_prim_qmpphy {
+	vdda-phy-supply = <&vreg_l3c_1p2>;
+	vdda-pll-supply = <&vreg_l5e_0p88>;
+
+	status = "okay";
+};
+
+&usb_prim {
+	status = "okay";
+};
+
+&usb_prim_dwc3 {
+	dr_mode = "host";
+};
+
+&usb_sec_hsphy {
+	vdda-pll-supply = <&vreg_l5e_0p88>;
+	vdda18-supply = <&vreg_l12a_1p8>;
+	vdda33-supply = <&vreg_l16e_3p0>;
+
+	status = "okay";
+};
+
+&usb_sec_qmpphy {
+	vdda-phy-supply = <&vreg_l3c_1p2>;
+	vdda-pll-supply = <&vreg_l5e_0p88>;
+
+	status = "okay";
+};
+
+&usb_sec {
+	status = "okay";
+};
+
+&usb_sec_dwc3 {
+	dr_mode = "host";
+};
+
+&wifi {
+	memory-region = <&wlan_mem>;
+
+	vdd-0.8-cx-mx-supply = <&vreg_l1e_0p75>;
+	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
+	vdd-1.3-rfa-supply = <&vreg_l9a_1p3>;
+	vdd-3.3-ch0-supply = <&vreg_l11c_3p3>;
+	vdd-3.3-ch1-supply = <&vreg_l10c_3p3>;
+
+	status = "okay";
+};
+
+&xo_board_clk {
+	clock-frequency = <38400000>;
+};
+
+/* PINCTRL */
+
+&pmc8180c_gpios {
+	bl_pwm_default: bl-pwm-default-state {
+		en-pins {
+			pins = "gpio8";
+			function = "normal";
+		};
+
+		pwm-pins {
+			pins = "gpio10";
+			function = "func1";
+		};
+	};
+};
+
+&tlmm {
+	gpio-reserved-ranges = <0 4>, <47 4>, <126 4>;
+
+	aux_i2c_active_state: aux-i2c-active-state {
+		pins = "gpio98", "gpio99";
+		function = "qup7";
+
+		bias-disable;
+		drive-strength = <16>;
+	};
+
+	edp_hpd_active: epd-hpd-active-state {
+		pins = "gpio10";
+		function = "edp_hot";
+	};
+
+	hall_int_active_state: hall-int-active-state {
+		pins = "gpio121";
+		function = "gpio";
+
+		input-enable;
+		bias-disable;
+	};
+
+	kb_int_active_state: kb-int-active-state {
+		int-n-pins {
+			pins = "gpio37";
+			function = "gpio";
+
+			bias-pull-up;
+			intput-enable;
+		};
+
+		kp-disable-pins {
+			pins = "gpio135";
+			function = "gpio";
+
+			output-high;
+		};
+	};
+
+	kb_tp_3v3_en_active_state: kb-tp-3v3-en-active-state {
+		pins = "gpio4";
+		function = "gpio";
+
+		bias-disable;
+	};
+
+	pcie2_default_state: pcie2-default-state {
+		clkreq-pins {
+			pins = "gpio176";
+			function = "pci_e2";
+			bias-pull-up;
+		};
+
+		reset-n-pins {
+			pins = "gpio175";
+			function = "gpio";
+
+			drive-strength = <2>;
+			output-low;
+			bias-pull-down;
+		};
+
+		wake-n-pins {
+			pins = "gpio177";
+			function = "gpio";
+
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	tp_int_active_state: tp-int-active-state {
+		tp-int-pins {
+			pins = "gpio24";
+			function = "gpio";
+
+			bias-disable;
+			input-enable;
+		};
+
+		tp-close-n-pins {
+			pins = "gpio116";
+			function = "gpio";
+
+			bias-disable;
+			input-enable;
+		};
+	};
+
+	ts_active_state: ts-active-state {
+		int-n-pins {
+			pins = "gpio122";
+			function = "gpio";
+
+			input-enable;
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio54";
+			function = "gpio";
+
+			output-high;
+		};
+	};
+
+	ts_i2c_active_state: ts-i2c-active-state {
+		pins = "gpio114", "gpio115";
+		function = "qup1";
+
+		/* External pull up */
+		bias-disable;
+		drive-strength = <2>;
+	};
+
+	uart13_state: uart13-state {
+		cts-pins {
+			pins = "gpio43";
+			function = "qup13";
+			bias-pull-down;
+		};
+
+		rts-tx-pins {
+			pins = "gpio44", "gpio45";
+			function = "qup13";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		rx-pins {
+			pins = "gpio46";
+			function = "qup13";
+			bias-pull-up;
+		};
+	};
+};
-- 
2.40.1

