Return-Path: <linux-arm-msm+bounces-50501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 290F8A54AA5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 13:26:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5349D16B2D6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 12:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A251320C009;
	Thu,  6 Mar 2025 12:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="aOPgWdGq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7411B20A5C6;
	Thu,  6 Mar 2025 12:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741263966; cv=none; b=RAAiAqNKRnPTDvHysU4XdlALIGW4TsWusHKCGjES3QvRbvtI1TKAAg5c2iqbiUIqzfACqxV5LcXl0xYj/wOC6Yl0qHS9+ONR1qFlVJa5t5ujmE30qNMk64sFQnMmCEGpIw4+nyYfT+ovh2b4nFmcTglLmRaKv9c/zJzFwy9W/8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741263966; c=relaxed/simple;
	bh=9N40ebO3EvsMcCQLrs/9rbOc7R1iTl307EE2nYR5jzo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=uZRHsl5uDEkN5fuiO1S006a63hZEgm0G5095yvnMmNIvEjoyN9BumLQa3T0S3u+cPzBGD2x5CdiBKaWI4cSFL8+kgm0pcfwDqxBNlebrx0WM9uDMVyF924I93QxsLKyL/NVfIR5fvLanS25KYMreF4hXwc6UISGqZoCeG5hjTNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=aOPgWdGq; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.178.76] (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 8A1BC2FC0048;
	Thu,  6 Mar 2025 13:25:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1741263953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dGCrCeDhVv9ixGTnWlj7a2vonzXKEPd8CqgGrmCkQrA=;
	b=aOPgWdGqdx52Ceh772kCvTUmpgVL9/Rczl1YztNVw+p7uW82QXT4xrY4xdybOJCxUA25Dj
	HF0OW6F0Dm5hMNIu1w6E15vp8XmkUAJkyf+nmDOyon2pS4AKX7Vw0yMN/f1yl3DK0Zzjfa
	5fbW49bMUBcjUKhm2m1iwJf7n3oCrk8=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=g.gottleuber@tuxedocomputers.com smtp.mailfrom=ggo@tuxedocomputers.com
Message-ID: <57589859-fec1-4875-9127-d1f99e40a827@tuxedocomputers.com>
Date: Thu, 6 Mar 2025 13:25:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Georg Gottleuber <ggo@tuxedocomputers.com>
Subject: [PATCH] arm64: dts: qcom: Add device tree for TUXEDO Elite 14 Gen1
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>, Georg Gottleuber
 <ggo@tuxedocomputers.com>, wse@tuxedocomputers.com, cs@tuxedocomputers.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Initial support for TUXEDO Elite 14 Gen1 based on Qualcomm Snapdragon X
Elite SoC (X1E78100).

Working:
* Touchpad
* Keyboard
* eDP (no brightness control yet)
* NVMe
* USB Type-C port
* WiFi (WiFi 7 untested)
* GPU (software rendering)

Not working:
* GPU (WIP: firmware loading but output is jerky)
* USB Type-A (WIP)
* Suspend with substantial energy saving
* Audio, Speakers, Microphones
* Camera
* Fingerprint Reader

Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../qcom/x1e80100-tuxedo-elite-14-gen1.dts    | 798 ++++++++++++++++++
 2 files changed, 799 insertions(+)
 create mode 100644
arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 140b0b2abfb5..f0a9d677d957 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -298,3 +298,4 @@ dtb-$(CONFIG_ARCH_QCOM)     += x1e80100-lenovo-yoga-slim7x.dtb
 dtb-$(CONFIG_ARCH_QCOM)        += x1e80100-microsoft-romulus13.dtb
 dtb-$(CONFIG_ARCH_QCOM)        += x1e80100-microsoft-romulus15.dtb
 dtb-$(CONFIG_ARCH_QCOM)        += x1e80100-qcp.dtb
+dtb-$(CONFIG_ARCH_QCOM)        += x1e80100-tuxedo-elite-14-gen1.dtb
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts b/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
new file mode 100644
index 000000000000..86bdec4a2dd8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
@@ -0,0 +1,798 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025 TUXEDO Computers GmbH
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "x1e80100.dtsi"
+#include "x1e80100-pmics.dtsi"
+
+/ {
+       model = "TUXEDO Elite 14 Gen1";
+       compatible = "tuxedo,elite14gen1", "qcom,x1e80100";
+
+       aliases {
+               serial0 = &uart21;
+       };
+
+       chosen {
+               stdout-path = "serial0:115200n8";
+       };
+
+       gpio-keys {
+               compatible = "gpio-keys";
+
+               pinctrl-0 = <&hall_int_n_default>;
+               pinctrl-names = "default";
+
+               switch-lid {
+                       gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
+                       linux,input-type = <EV_SW>;
+                       linux,code = <SW_LID>;
+                       wakeup-source;
+               };
+       };
+
+       pmic-glink {
+               compatible = "qcom,x1e80100-pmic-glink",
+                            "qcom,sm8550-pmic-glink",
+                            "qcom,pmic-glink";
+               orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>;
+               #address-cells = <1>;
+               #size-cells = <0>;
+
+               /* Left-side rear port */
+               connector@0 {
+                       compatible = "usb-c-connector";
+                       reg = <0>;
+                       power-role = "dual";
+                       data-role = "dual";
+
+                       ports {
+                               #address-cells = <1>;
+                               #size-cells = <0>;
+
+                               port@0 {
+                                       reg = <0>;
+
+                                       pmic_glink_ss0_hs_in: endpoint {
+                                               remote-endpoint = <&usb_1_ss0_dwc3_hs>;
+                                       };
+                               };
+
+                               port@1 {
+                                       reg = <1>;
+
+                                       pmic_glink_ss0_ss_in: endpoint {
+                                               remote-endpoint = <&usb_1_ss0_qmpphy_out>;
+                                       };
+                               };
+                       };
+               };
+       };
+
+       reserved-memory {
+               linux,cma {
+                       compatible = "shared-dma-pool";
+                       size = <0x0 0x8000000>;
+                       reusable;
+                       linux,cma-default;
+               };
+       };
+
+       vreg_edp_3p3: regulator-edp-3p3 {
+               compatible = "regulator-fixed";
+
+               regulator-name = "VREG_EDP_3P3";
+               regulator-min-microvolt = <3300000>;
+               regulator-max-microvolt = <3300000>;
+
+               // EDP_VDD_EN_GPIO54
+               gpio = <&tlmm 54 GPIO_ACTIVE_HIGH>;
+               enable-active-high;
+
+               pinctrl-0 = <&edp_reg_en>;
+               pinctrl-names = "default";
+
+               regulator-always-on;
+               regulator-boot-on;
+       };
+
+       vreg_nvme: regulator-nvme {
+               compatible = "regulator-fixed";
+
+               regulator-name = "VREG_NVME_3P3";
+               regulator-min-microvolt = <3300000>;
+               regulator-max-microvolt = <3300000>;
+
+               // NVME_REG_EN_GPIO18
+               gpio = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+               enable-active-high;
+
+               pinctrl-0 = <&nvme_reg_en>;
+               pinctrl-names = "default";
+               regulator-boot-on;
+       };
+
+       vph_pwr: regulator-vph-pwr {
+               compatible = "regulator-fixed";
+
+               regulator-name = "vph_pwr";
+               regulator-min-microvolt = <3700000>;
+               regulator-max-microvolt = <3700000>;
+
+               regulator-always-on;
+               regulator-boot-on;
+       };
+};
+
+&apps_rsc {
+       regulators-0 {
+               compatible = "qcom,pm8550-rpmh-regulators";
+               qcom,pmic-id = "b";
+               vdd-bob1-supply = <&vph_pwr>;
+               vdd-bob2-supply = <&vph_pwr>;
+               vdd-l1-l4-l10-supply = <&vreg_s4c_1p8>;
+               vdd-l2-l13-l14-supply = <&vreg_bob1>;
+               vdd-l5-l16-supply = <&vreg_bob1>;
+               vdd-l6-l7-supply = <&vreg_bob2>;
+               vdd-l8-l9-supply = <&vreg_bob1>;
+               vdd-l12-supply = <&vreg_s5j_1p2>;
+               vdd-l15-supply = <&vreg_s4c_1p8>;
+               vdd-l17-supply = <&vreg_bob2>;
+
+               vreg_bob1: bob1 {
+                       regulator-name = "vreg_bob1";
+                       regulator-min-microvolt = <3008000>;
+                       regulator-max-microvolt = <3960000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+
+               vreg_bob2: bob2 {
+                       regulator-name = "vreg_bob2";
+                       regulator-min-microvolt = <2504000>;
+                       regulator-max-microvolt = <3008000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+
+               vreg_l2b_3p0: ldo2 {
+                       regulator-name = "vreg_l2b_3p0";
+                       regulator-min-microvolt = <3072000>;
+                       regulator-max-microvolt = <3072000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+
+               vreg_l4b_1p8: ldo4 {
+                       regulator-name = "vreg_l4b_1p8";
+                       regulator-min-microvolt = <1800000>;
+                       regulator-max-microvolt = <1800000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+
+               vreg_l6b_1p8: ldo6 {
+                       regulator-name = "vreg_l6b_1p8";
+                       regulator-min-microvolt = <1800000>;
+                       regulator-max-microvolt = <2960000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+
+               vreg_l7b_2p8: ldo7 {
+                       regulator-name = "vreg_l7b_2p8";
+                       regulator-min-microvolt = <2800000>;
+                       regulator-max-microvolt = <2800000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+
+               vreg_l8b_3p0: ldo8 {
+                       regulator-name = "vreg_l8b_3p0";
+                       regulator-min-microvolt = <3072000>;
+                       regulator-max-microvolt = <3072000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+
+               vreg_l9b_2p9: ldo9 {
+                       regulator-name = "vreg_l9b_2p9";
+                       regulator-min-microvolt = <2960000>;
+                       regulator-max-microvolt = <2960000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+
+               vreg_l10b_1p8: ldo10 {
+                       regulator-name = "vreg_l10b_1p8";
+                       regulator-min-microvolt = <1800000>;
+                       regulator-max-microvolt = <1800000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+
+               vreg_l12b_1p2: ldo12 {
+                       regulator-name = "vreg_l12b_1p2";
+                       regulator-min-microvolt = <1200000>;
+                       regulator-max-microvolt = <1200000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+
+               vreg_l13b_3p0: ldo13 {
+                       regulator-name = "vreg_l13b_3p0";
+                       regulator-min-microvolt = <3072000>;
+                       regulator-max-microvolt = <3072000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+
+               vreg_l14b_3p0: ldo14 {
+                       regulator-name = "vreg_l14b_3p0";
+                       regulator-min-microvolt = <3072000>;
+                       regulator-max-microvolt = <3072000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+
+               vreg_l15b_1p8: ldo15 {
+                       regulator-name = "vreg_l15b_1p8";
+                       regulator-min-microvolt = <1800000>;
+                       regulator-max-microvolt = <1800000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+
+               vreg_l16b_2p8: ldo16 {
+                       regulator-name = "vreg_l16b_2p8";
+                       regulator-min-microvolt = <2800000>;
+                       regulator-max-microvolt = <2800000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+
+               vreg_l17b_2p5: ldo17 {
+                       regulator-name = "vreg_l17b_2p5";
+                       regulator-min-microvolt = <2504000>;
+                       regulator-max-microvolt = <2504000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+       };
+
+       regulators-1 {
+               compatible = "qcom,pm8550ve-rpmh-regulators";
+               qcom,pmic-id = "c";
+
+               vdd-l1-supply = <&vreg_s5j_1p2>;
+               vdd-l2-supply = <&vreg_s1f_0p7>;
+               vdd-l3-supply = <&vreg_s1f_0p7>;
+               vdd-s4-supply = <&vph_pwr>;
+
+               vreg_s4c_1p8: smps4 {
+                       regulator-name = "vreg_s4c_1p8";
+                       regulator-min-microvolt = <1856000>;
+                       regulator-max-microvolt = <2000000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+
+               vreg_l1c_1p2: ldo1 {
+                       regulator-name = "vreg_l1c_1p2";
+                       regulator-min-microvolt = <1200000>;
+                       regulator-max-microvolt = <1200000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+
+               vreg_l2c_0p8: ldo2 {
+                       regulator-name = "vreg_l2c_0p8";
+                       regulator-min-microvolt = <880000>;
+                       regulator-max-microvolt = <880000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+
+               vreg_l3c_0p9: ldo3 {
+                       regulator-name = "vreg_l3c_0p9";
+                       regulator-min-microvolt = <920000>;
+                       regulator-max-microvolt = <920000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+       };
+
+       regulators-2 {
+               compatible = "qcom,pmc8380-rpmh-regulators";
+               qcom,pmic-id = "d";
+
+               vdd-l1-supply = <&vreg_s1f_0p7>;
+               vdd-l2-supply = <&vreg_s1f_0p7>;
+               vdd-l3-supply = <&vreg_s4c_1p8>;
+               vdd-s1-supply = <&vph_pwr>;
+
+               vreg_l1d_0p8: ldo1 {
+                       regulator-name = "vreg_l1d_0p8";
+                       regulator-min-microvolt = <880000>;
+                       regulator-max-microvolt = <880000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+
+               vreg_l2d_0p9: ldo2 {
+                       regulator-name = "vreg_l2d_0p9";
+                       regulator-min-microvolt = <912000>;
+                       regulator-max-microvolt = <912000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+
+               vreg_l3d_1p8: ldo3 {
+                       regulator-name = "vreg_l3d_1p8";
+                       regulator-min-microvolt = <1800000>;
+                       regulator-max-microvolt = <1800000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+       };
+
+       regulators-3 {
+               compatible = "qcom,pmc8380-rpmh-regulators";
+               qcom,pmic-id = "e";
+
+               vdd-l2-supply = <&vreg_s1f_0p7>;
+               vdd-l3-supply = <&vreg_s5j_1p2>;
+
+               vreg_l2e_0p8: ldo2 {
+                       regulator-name = "vreg_l2e_0p8";
+                       regulator-min-microvolt = <880000>;
+                       regulator-max-microvolt = <880000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+
+               vreg_l3e_1p2: ldo3 {
+                       regulator-name = "vreg_l3e_1p2";
+                       regulator-min-microvolt = <1200000>;
+                       regulator-max-microvolt = <1200000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+       };
+
+       regulators-4 {
+               compatible = "qcom,pmc8380-rpmh-regulators";
+               qcom,pmic-id = "f";
+
+               vdd-l1-supply = <&vreg_s5j_1p2>;
+               vdd-l2-supply = <&vreg_s5j_1p2>;
+               vdd-l3-supply = <&vreg_s5j_1p2>;
+               vdd-s1-supply = <&vph_pwr>;
+
+               vreg_s1f_0p7: smps1 {
+                       regulator-name = "vreg_s1f_0p7";
+                       regulator-min-microvolt = <700000>;
+                       regulator-max-microvolt = <1100000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+       };
+
+       regulators-6 {
+               compatible = "qcom,pm8550ve-rpmh-regulators";
+               qcom,pmic-id = "i";
+
+               vdd-l1-supply = <&vreg_s4c_1p8>;
+               vdd-l2-supply = <&vreg_s5j_1p2>;
+               vdd-l3-supply = <&vreg_s1f_0p7>;
+               vdd-s1-supply = <&vph_pwr>;
+               vdd-s2-supply = <&vph_pwr>;
+
+               vreg_s1i_0p9: smps1 {
+                       regulator-name = "vreg_s1i_0p9";
+                       regulator-min-microvolt = <900000>;
+                       regulator-max-microvolt = <920000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+
+               vreg_s2i_1p0: smps2 {
+                       regulator-name = "vreg_s2i_1p0";
+                       regulator-min-microvolt = <1000000>;
+                       regulator-max-microvolt = <1100000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+
+               vreg_l1i_1p8: ldo1 {
+                       regulator-name = "vreg_l1i_1p8";
+                       regulator-min-microvolt = <1800000>;
+                       regulator-max-microvolt = <1800000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+
+               vreg_l2i_1p2: ldo2 {
+                       regulator-name = "vreg_l2i_1p2";
+                       regulator-min-microvolt = <1200000>;
+                       regulator-max-microvolt = <1200000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+
+               vreg_l3i_0p8: ldo3 {
+                       regulator-name = "vreg_l3i_0p8";
+                       regulator-min-microvolt = <880000>;
+                       regulator-max-microvolt = <880000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+       };
+
+       regulators-7 {
+               compatible = "qcom,pm8550ve-rpmh-regulators";
+               qcom,pmic-id = "j";
+
+               vdd-l1-supply = <&vreg_s1f_0p7>;
+               vdd-l2-supply = <&vreg_s5j_1p2>;
+               vdd-l3-supply = <&vreg_s1f_0p7>;
+               vdd-s5-supply = <&vph_pwr>;
+
+               vreg_s5j_1p2: smps5 {
+                       regulator-name = "vreg_s5j_1p2";
+                       regulator-min-microvolt = <1256000>;
+                       regulator-max-microvolt = <1304000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+
+               vreg_l1j_0p9: ldo1 {
+                       regulator-name = "vreg_l1j_0p9";
+                       regulator-min-microvolt = <912000>;
+                       regulator-max-microvolt = <912000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+
+               vreg_l2j_1p2: ldo2 {
+                       regulator-name = "vreg_l2j_1p2";
+                       regulator-min-microvolt = <1256000>;
+                       regulator-max-microvolt = <1256000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+
+               vreg_l3j_0p8: ldo3 {
+                       regulator-name = "vreg_l3j_0p8";
+                       regulator-min-microvolt = <880000>;
+                       regulator-max-microvolt = <880000>;
+                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+               };
+       };
+};
+
+&gpu {
+       status = "okay";
+
+       zap-shader {
+               firmware-name = "qcom/a740_zap.mbn";
+       };
+};
+
+&i2c0 {
+       clock-frequency = <400000>;
+
+       status = "okay";
+
+       touchpad@2c {
+               compatible = "hid-over-i2c";
+               reg = <0x2c>;
+
+               hid-descr-addr = <0x20>;
+               interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
+
+               pinctrl-0 = <&tpad_default>;
+               pinctrl-names = "default";
+
+               wakeup-source;
+       };
+
+       keyboard@3a {
+               compatible = "hid-over-i2c";
+               reg = <0x3a>;
+
+               hid-descr-addr = <0x1>;
+               interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
+
+               pinctrl-0 = <&kybd_default>;
+               pinctrl-names = "default";
+
+               wakeup-source;
+       };
+};
+
+&i2c5 {
+       clock-frequency = <400000>;
+
+       status = "okay";
+
+       eusb3_repeater: redriver@47 {
+               compatible = "nxp,ptn3222";
+               reg = <0x47>;
+               #phy-cells = <0>;
+
+               vdd1v8-supply = <&vreg_l4b_1p8>;
+               vdd3v3-supply = <&vreg_l13b_3p0>;
+
+               reset-gpios = <&tlmm 124 GPIO_ACTIVE_LOW>;
+
+               pinctrl-0 = <&eusb3_reset_n>;
+               pinctrl-names = "default";
+       };
+
+       eusb5_repeater: redriver@43 {
+               compatible = "nxp,ptn3222";
+               reg = <0x43>;
+               #phy-cells = <0>;
+
+               vdd1v8-supply = <&vreg_l4b_1p8>;
+               vdd3v3-supply = <&vreg_l13b_3p0>;
+
+               reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
+
+               pinctrl-0 = <&eusb6_reset_n>;
+               pinctrl-names = "default";
+       };
+
+       eusb6_repeater: redriver@4f {
+               compatible = "nxp,ptn3222";
+               reg = <0x4f>;
+               #phy-cells = <0>;
+
+               vdd1v8-supply = <&vreg_l4b_1p8>;
+               vdd3v3-supply = <&vreg_l13b_3p0>;
+
+               reset-gpios = <&tlmm 111 GPIO_ACTIVE_LOW>;
+
+               pinctrl-0 = <&eusb6_reset_n>;
+               pinctrl-names = "default";
+       };
+
+};
+
+&mdss {
+       status = "okay";
+};
+
+&mdss_dp3 {
+       compatible = "qcom,x1e80100-dp";
+       /delete-property/ #sound-dai-cells;
+
+       status = "okay";
+
+       aux-bus {
+               panel {
+                       compatible = "edp-panel";
+                       power-supply = <&vreg_edp_3p3>;
+
+                       port {
+                               edp_panel_in: endpoint {
+                                       remote-endpoint = <&mdss_dp3_out>;
+                               };
+                       };
+               };
+       };
+
+       ports {
+               port@1 {
+                       reg = <1>;
+
+                       mdss_dp3_out: endpoint {
+                               data-lanes = <0 1 2 3>;
+                               link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+                               remote-endpoint = <&edp_panel_in>;
+                       };
+               };
+       };
+};
+
+&mdss_dp3_phy {
+       vdda-phy-supply = <&vreg_l3j_0p8>;
+       vdda-pll-supply = <&vreg_l2j_1p2>;
+
+       status = "okay";
+};
+
+&pcie4 {
+       status = "okay";
+};
+
+&pcie4_phy {
+       vdda-phy-supply = <&vreg_l3j_0p8>;
+       vdda-pll-supply = <&vreg_l3e_1p2>;
+
+       status = "okay";
+};
+
+&pcie6a {
+       perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
+
+       wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+
+       vddpe-3v3-supply = <&vreg_nvme>;
+
+       pinctrl-0 = <&pcie6a_default>;
+       pinctrl-names = "default";
+
+       status = "okay";
+};
+
+&pcie6a_phy {
+       vdda-phy-supply = <&vreg_l1d_0p8>;
+       vdda-pll-supply = <&vreg_l2j_1p2>;
+
+       status = "okay";
+};
+
+&qupv3_0 {
+       status = "okay";
+};
+
+&qupv3_1 {
+       status = "okay";
+};
+
+&qupv3_2 {
+       status = "okay";
+};
+
+&remoteproc_adsp {
+       firmware-name = "qcom/x1e80100/adsp.mbn",
+                       "qcom/x1e80100/adsp_dtb.mbn";
+
+       status = "okay";
+};
+
+&remoteproc_cdsp {
+       firmware-name = "qcom/x1e80100/cdsp.mbn",
+                       "qcom/x1e80100/cdsp_dtb.mbn";
+
+       status = "okay";
+};
+
+&smb2360_0 {
+       status = "okay";
+};
+
+&smb2360_0_eusb2_repeater {
+       vdd18-supply = <&vreg_l3d_1p8>;
+       vdd3-supply = <&vreg_l2b_3p0>;
+};
+
+&smb2360_1 {
+       status = "okay";
+};
+
+&tlmm {
+       gpio-reserved-ranges = <28 4>, /* Unused */
+                              <44 4>, /* SPI (TPM) */
+                              <238 1>; /* UFS Reset */
+
+       kybd_default: kybd-default-state {
+               pins = "gpio67";
+               function = "gpio";
+               bias-disable;
+       };
+
+       edp_reg_en: edp-reg-en-state {
+               pins = "gpio54";
+               function = "gpio";
+               drive-strength = <16>;
+               bias-pull-up;
+       };
+
+       nvme_reg_en: nvme-reg-en-state {
+               pins = "gpio18";
+               function = "gpio";
+               drive-strength = <2>;
+               bias-disable;
+       };
+
+       hall_int_n_default: hall-int-n-state {
+               pins = "gpio92";
+               function = "gpio";
+               bias-disable;
+       };
+
+       eusb3_reset_n: eusb3-reset-n-state {
+               pins = "gpio124";
+               function = "gpio";
+               drive-strength = <2>;
+               bias-disable;
+               output-low;
+       };
+
+       eusb6_reset_n: eusb6-reset-n-state {
+               pins = "gpio111";
+               function = "gpio";
+               drive-strength = <2>;
+               bias-disable;
+               output-low;
+       };
+
+       eusb5_reset_n: eusb5-reset-n-state {
+               pins = "gpio184";
+               function = "gpio";
+               drive-strength = <2>;
+               bias-disable;
+               output-low;
+       };
+
+       pcie4_default: pcie4-default-state {
+               perst-n-pins {
+                       pins = "gpio146";
+                       function = "gpio";
+                       drive-strength = <2>;
+                       bias-pull-down;
+               };
+
+               clkreq-n-pins {
+                       pins = "gpio147";
+                       function = "pcie4_clk";
+                       drive-strength = <2>;
+                       bias-pull-up;
+               };
+
+               wake-n-pins {
+                       pins = "gpio148";
+                       function = "gpio";
+                       drive-strength = <2>;
+                       bias-pull-up;
+               };
+       };
+
+       pcie6a_default: pcie6a-default-state {
+               perst-n-pins {
+                       pins = "gpio152";
+                       function = "gpio";
+                       drive-strength = <2>;
+                       bias-pull-down;
+               };
+
+               clkreq-n-pins {
+                       pins = "gpio153";
+                       function = "pcie6a_clk";
+                       drive-strength = <2>;
+                       bias-pull-up;
+               };
+
+               wake-n-pins {
+                       pins = "gpio154";
+                       function = "gpio";
+                       drive-strength = <2>;
+                       bias-pull-up;
+               };
+       };
+
+       tpad_default: tpad-default-state {
+               pins = "gpio3";
+               function = "gpio";
+               bias-disable;
+       };
+
+       wcd_default: wcd-reset-n-active-state {
+               pins = "gpio191";
+               function = "gpio";
+               drive-strength = <16>;
+               bias-disable;
+               output-low;
+       };
+};
+
+&usb_1_ss0_hsphy {
+       vdd-supply = <&vreg_l3j_0p8>;
+       vdda12-supply = <&vreg_l2j_1p2>;
+
+       phys = <&smb2360_0_eusb2_repeater>;
+
+       status = "okay";
+};
+
+&usb_1_ss0_qmpphy {
+       vdda-phy-supply = <&vreg_l2j_1p2>;
+       vdda-pll-supply = <&vreg_l1j_0p9>;
+
+       status = "okay";
+};
+
+&usb_1_ss0 {
+       status = "okay";
+};
+
+&usb_1_ss0_dwc3 {
+       dr_mode = "host";
+};
+
+&usb_1_ss0_dwc3_hs {
+       remote-endpoint = <&pmic_glink_ss0_hs_in>;
+};
+
+&usb_1_ss0_qmpphy_out {
+       remote-endpoint = <&pmic_glink_ss0_ss_in>;
+};
+
-- 
2.47.2


