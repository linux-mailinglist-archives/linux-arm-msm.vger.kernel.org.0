Return-Path: <linux-arm-msm+bounces-79587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 54726C1EBB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 08:24:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 372D54E28BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 07:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F293370E8;
	Thu, 30 Oct 2025 07:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/c8XbFo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F4A335BB6;
	Thu, 30 Oct 2025 07:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761809075; cv=none; b=Oj7He8LS6tf4l4getlXz7bSscdnAFceYWT9G2U/HzIhtMTs5Vl9s1Ii0jDNNfrCyVtBZO4MQnbWOFcDJ3XSGMu4Kt2efLHJi2pNRTitRy/6VU/vndL4X/02Bo/U+akVkuVS14IVQZdR4pLgQtavt1ZujEXJ0OQxFygiZwI7igaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761809075; c=relaxed/simple;
	bh=rxD5ffuTLyZ4ZO0PfXn2o9SUhY065Cp3Qu9kbJaG90s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GhKX13FmnLLgga5hju06PIJMS9Wa1zfP31jVNHDhaqA4z2J59lSHV+YZqMrf2nTK1+2nPLc91ROw3QUNp7fDBOt8tE8YMhIExbd+uL4CHEq4kON/45PMBDzPxxOh18aLHXuMvlhC8jlvJq7zlzc3n0YxKtT1mTsAopFOMPcqOqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n/c8XbFo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB561C4CEFF;
	Thu, 30 Oct 2025 07:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761809075;
	bh=rxD5ffuTLyZ4ZO0PfXn2o9SUhY065Cp3Qu9kbJaG90s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=n/c8XbFolbthIcxuE+LxQIN6W0C+ICMHfbj9suxtvP35VsjC0ZDv4RDVC9qjHcB8Q
	 wJ2/+eEEvfuz7uPjA5MIRTIb6fCYtGLSI5ZEtYoWxH2zL3BkkViRAr3w9YK8sFWzZq
	 vw2hCqmMgft6s+lg8IiGgl1v6as0EwmBkG3kqiZqMcQkD+zITPh/uFJCZZEvz8894b
	 WECZtHkHl1xv+9hS5ODMVbUgs3L8LQ3ivrLVLWk+eY3Ba6UrNyIZ2gsS/5q0irVqm9
	 Q7DLlMXkhVoNsVAglL2/o99G5SSlsYc+5Y3Dy6cgpvv7kT7veW3FyZYcmmPfS49mZW
	 blRtOw3hidBJw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7041CCF9FC;
	Thu, 30 Oct 2025 07:24:34 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 30 Oct 2025 08:24:30 +0100
Subject: [PATCH v2 2/2] arm64: dts: qcom: Add support for Pixel 3 and Pixel
 3 XL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251030-pixel-3-v2-2-8caddbe072c9@ixit.cz>
References: <20251030-pixel-3-v2-0-8caddbe072c9@ixit.cz>
In-Reply-To: <20251030-pixel-3-v2-0-8caddbe072c9@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Amit Pundir <amit.pundir@linaro.org>, Casey Connolly <casey@connolly.tech>, 
 Joel Selvaraj <foss@joelselvaraj.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=17933; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=HmTGvIkZJVszYl69muqXkTZ71K7P8TAe6fLxFfawBBY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpAxKxCz1M71uoprPgFfPL1Bjs8xoOgYddF7jvC
 T1nkflcrMSJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaQMSsQAKCRBgAj/E00kg
 chBKD/9EjeaNWk4bj54NZLu1jk/fYxvsVYYHEypcxGQ4IlUzqusDyMPeGKGBzQFU5YsavC1ghIO
 JK9OPtARhX02W2LJD9dx1WBA0+9bHjaaANQUcZOJiej+Rwwgk79PTrQ/aPmLi74pS0UqCfdz+Yl
 3742R5Z8vebLxW3Gg1CiUMH1PSiUXOwa1w9+u3fhO7wAeW7mcTKAMhl1eqh01Qs24UFpKdS9RES
 CKdB9BB3VNb0MNaPZ1GaJgt68Dl4V5cKPCJixHxlF3gtCMPduEI+kbsAawL8G6IPeLdKvFefNXC
 XRZKhSkSzu4ZF0TJzcMNEoyGt8GYpGIf4DJe8CR5G4Z24W0dGSqtEpPFYEzcbS8sY71SM2p2GwO
 iNyKnCVPH8S7O+23eVdl4Ubs9/aMSD8phRUXxox4DKwkpPwrrZdhyGLx9kGPhgoBXQPQlpFh8hA
 L2DcPMWNFikBJxUE9IL7IcL4kgZTFluqkI3L5crf1lDRYClhovroCZPDUci4dya4kb65o+Czr7A
 20JJ+S+sHCTURFpW9vLP3LzB4KOr8Z45YiEHzzxz6Li2CokhYSHrooYHU0Q+LifmFuHfgWliorg
 +xmqcZ92uD0MiBnb6vfn04OGHbieYUIrd+HaY8tc8MolZCRvw6yp026BCru/YjyuGhQSQRsxVEa
 ynv2AOXdum0fFIw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

This adds initial device tree support for the following phones:

 - Google Pixel 3 (blueline)
 - Google Pixel 3 XL (crosshatch)

Both phone boards use the same identifiers and differ only slightly
in their connected peripherals.

Supported functionality includes:
 - Debug UART
 - UFS
 - USB-C (peripheral mode)
 - Display (Pixel 3 only, and the driver needs improvements)
 - GPU
 - Bluetooth
 - Wi-Fi

GPIOs 0–3 and 81–84 are not accessible from the application CPUs,
so they are marked as reserved to allow the Pixel 3 to boot.

The rmtfs region is allocated using UIO, making it technically "dynamic."

Its address and size can be read from sysfs:

$ cat /sys/class/uio/uio0/name
/sys/class/uio/uio0/maps/map0/addr
0x00000000f2701000

$ cat /sys/class/uio/uio0/maps/map0/size
0x0000000000200000

Like the OnePlus 6, the Pixel 3 requires 1 kB of reserved memory on either
side of the rmtfs region to work around an XPU bug that would otherwise
cause erroneous violations when accessing the rmtfs_mem region.

Co-developed-by: Amit Pundir <amit.pundir@linaro.org>
Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
Co-developed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Co-developed-by: Casey Connolly <casey@connolly.tech>
Signed-off-by: Casey Connolly <casey@connolly.tech>
Co-developed-by: Joel Selvaraj <foss@joelselvaraj.com>
Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
Co-developed-by: Sumit Semwal <sumit.semwal@linaro.org>
Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
Co-developed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 .../arm64/boot/dts/qcom/sdm845-google-blueline.dts |  94 ++++
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 522 +++++++++++++++++++++
 .../boot/dts/qcom/sdm845-google-crosshatch.dts     |  39 ++
 4 files changed, 657 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f34d5ed331c4..c853b28b3b198 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -250,6 +250,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
 sdm845-db845c-navigation-mezzanine-dtbs	:= sdm845-db845c.dtb sdm845-db845c-navigation-mezzanine.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c-navigation-mezzanine.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-google-crosshatch.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-google-blueline.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyln.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
new file mode 100644
index 0000000000000..a3e95c47947e2
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "sdm845-google-common.dtsi"
+
+/ {
+	model = "Google Pixel 3";
+	compatible = "google,blueline", "qcom,sdm845";
+};
+
+&battery {
+	charge-full-design-microamp-hours = <2970000>;
+	voltage-min-design-microvolt = <3600000>;
+	voltage-max-design-microvolt = <4400000>;
+
+	status = "okay";
+};
+
+&cont_splash_mem {
+	reg = <0 0x9d400000 0 0x02400000>;
+
+	status = "okay";
+};
+
+&framebuffer0 {
+	width = <1080>;
+	height = <2160>;
+	stride = <(1080 * 4)>;
+	format = "a8r8g8b8";
+
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vdda_mipi_dsi0_1p2>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "lg,sw43408";
+		reg = <0>;
+
+		vddi-supply = <&vreg_l14a_1p88>;
+		vpnl-supply = <&vreg_l28a_3p0>;
+
+		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&panel_reset_pins &panel_te_pin>;
+		pinctrl-names = "default";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
+	qcom,te-source = "mdp_vsync_e";
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vdda_mipi_dsi0_pll>;
+
+	status = "okay";
+};
+
+&tlmm {
+	panel_te_pin: panel-te-state {
+		pins = "gpio12";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_reset_pins: panel-active-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	panel_suspend: panel-suspend-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
new file mode 100644
index 0000000000000..226f1d9004915
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -0,0 +1,522 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include <dt-bindings/arm/qcom,ids.h>
+#include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "sdm845.dtsi"
+#include "pm8998.dtsi"
+#include "pmi8998.dtsi"
+
+/delete-node/ &mpss_region;
+/delete-node/ &venus_mem;
+/delete-node/ &cdsp_mem;
+/delete-node/ &mba_region;
+/delete-node/ &slpi_mem;
+/delete-node/ &spss_mem;
+/delete-node/ &rmtfs_mem;
+
+/ {
+	chassis-type = "handset";
+	qcom,board-id = <0x00021505 0>;
+	qcom,msm-id = <QCOM_ID_SDM845 0x20001>;
+
+	aliases {
+		serial0 = &uart9;
+		serial1 = &uart6;
+	};
+
+	battery: battery {
+		compatible = "simple-battery";
+
+		status = "disabled";
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		stdout-path = "serial0:115200n8";
+
+		/* Use display framebuffer as setup by bootloader */
+		framebuffer0: framebuffer-0 {
+			compatible = "simple-framebuffer";
+			memory-region = <&cont_splash_mem>;
+
+			status = "disabled";
+		};
+	};
+
+	reserved-memory {
+		cont_splash_mem: splash@9d400000 {
+			/* size to be updated by actual board */
+			reg = <0x0 0x9d400000 0x0>;
+			no-map;
+
+			status = "disabled";
+		};
+
+		mpss_region: memory@8e000000 {
+			reg = <0 0x8e000000 0 0x9800000>;
+			no-map;
+		};
+
+		venus_mem: venus@97800000 {
+			reg = <0 0x97800000 0 0x500000>;
+			no-map;
+		};
+
+		cdsp_mem: cdsp-mem@97D00000 {
+			reg = <0 0x97D00000 0 0x800000>;
+			no-map;
+		};
+
+		mba_region: mba@98500000 {
+			reg = <0 0x98500000 0 0x200000>;
+			no-map;
+		};
+
+		slpi_mem: slpi@98700000 {
+			reg = <0 0x98700000 0 0x1400000>;
+			no-map;
+		};
+
+		spss_mem: spss@99B00000 {
+			reg = <0 0x99B00000 0 0x100000>;
+			no-map;
+		};
+
+		rmtfs_mem: rmtfs-region@f2700000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0 0xf2700000 0 0x202000>;
+			qcom,use-guard-pages;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		label = "Volume keys";
+		autorepeat;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&volume_up_gpio>;
+
+		key-vol-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pm8998_gpios 6 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+		};
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+	};
+
+	vreg_s4a_1p8: regulator-vreg-s4a-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_s4a_1p8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+
+		vin-supply = <&vph_pwr>;
+	};
+};
+
+&adsp_pas {
+	firmware-name = "qcom/sdm845/Google/blueline/adsp.mbn";
+
+	status = "okay";
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8998-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+		vdd-s9-supply = <&vph_pwr>;
+		vdd-s10-supply = <&vph_pwr>;
+		vdd-s11-supply = <&vph_pwr>;
+		vdd-s12-supply = <&vph_pwr>;
+		vdd-s13-supply = <&vph_pwr>;
+		vdd-l1-l27-supply = <&vreg_s7a_1p025>;
+		vdd-l2-l8-l17-supply = <&vreg_s3a_1p35>;
+		vdd-l3-l11-supply = <&vreg_s7a_1p025>;
+		vdd-l4-l5-supply = <&vreg_s7a_1p025>;
+		vdd-l6-supply = <&vph_pwr>;
+		vdd-l7-l12-l14-l15-supply = <&vreg_s5a_2p04>;
+		vdd-l9-supply = <&vreg_bob>;
+		vdd-l10-l23-l25-supply = <&vreg_bob>;
+		vdd-l13-l19-l21-supply = <&vreg_bob>;
+		vdd-l16-l28-supply = <&vreg_bob>;
+		vdd-l18-l22-supply = <&vreg_bob>;
+		vdd-l20-l24-supply = <&vreg_bob>;
+		vdd-l26-supply = <&vreg_s3a_1p35>;
+		vin-lvs-1-2-supply = <&vreg_s4a_1p8>;
+
+		vreg_s3a_1p35: smps3 {
+			regulator-min-microvolt = <1352000>;
+			regulator-max-microvolt = <1352000>;
+		};
+
+		vreg_s5a_2p04: smps5 {
+			regulator-min-microvolt = <1904000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		vreg_s7a_1p025: smps7 {
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <1028000>;
+		};
+
+		vdda_mipi_dsi0_pll:
+		vreg_l1a_0p875: ldo1 {
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-boot-on;
+		};
+
+		vreg_l5a_0p8: ldo5 {
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12a_1p8: ldo12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a_1p8: ldo7 {
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
+		vreg_l14a_1p88: ldo14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-boot-on;
+			/*
+			 * We can't properly bring the panel back if it gets turned off
+			 * so keep it's regulators always on for now.
+			 */
+			regulator-always-on;
+		};
+
+		vreg_l17a_1p3: ldo17 {
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l19a_3p3: ldo19 {
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			/*
+			 * The touchscreen needs this to be 3.3v, which is apparently
+			 * quite close to the hardware limit for this LDO (3.312v)
+			 * It must be kept in high power mode to prevent TS brownouts
+			 */
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
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
+		vdda_mipi_dsi0_1p2:
+		vreg_l26a_1p2: ldo26 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-boot-on;
+		};
+
+		vreg_l28a_3p0: ldo28 {
+			regulator-min-microvolt = <2856000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+			regulator-boot-on;
+			/*
+			 * We can't properly bring the panel back if it gets turned off
+			 * so keep it's regulators always on for now.
+			 */
+			regulator-always-on;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pmi8998-rpmh-regulators";
+		qcom,pmic-id = "b";
+
+		vdd-bob-supply = <&vph_pwr>;
+
+		vreg_bob: bob {
+			regulator-min-microvolt = <3312000>;
+			regulator-max-microvolt = <3600000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-bypass;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pm8005-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+
+		vreg_s3c_0p6: smps3 {
+			regulator-min-microvolt = <600000>;
+			regulator-max-microvolt = <600000>;
+		};
+	};
+};
+
+&cdsp_pas {
+	firmware-name = "qcom/sdm845/Google/blueline/cdsp.mbn";
+
+	status = "okay";
+};
+
+&gcc {
+	protected-clocks = <GCC_QSPI_CORE_CLK>,
+			   <GCC_QSPI_CORE_CLK_SRC>,
+			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
+};
+
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sdm845/Google/blueline/a630_zap.mbn";
+};
+
+&ipa {
+	firmware-name = "qcom/sdm845/Google/blueline/ipa_fws.mbn";
+	memory-region = <&ipa_fw_mem>;
+
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mss_pil {
+	firmware-name = "qcom/sdm845/Google/blueline/mba.mbn",
+			"qcom/sdm845/Google/blueline/modem.mbn";
+
+	status = "okay";
+};
+
+&pm8998_gpios {
+	volume_up_gpio: vol-up-active-state {
+		pins = "gpio6";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		qcom,drive-strength = <0>;
+	};
+};
+
+&pm8998_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&pmi8998_charger {
+	monitored-battery = <&battery>;
+
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
+&qup_uart9_rx {
+	drive-strength = <2>;
+	bias-pull-up;
+};
+
+&qup_uart9_tx {
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&tlmm {
+	gpio-reserved-ranges = <0 4>, <81 4>;
+
+	touchscreen_reset: ts-reset-state {
+		pins = "gpio99";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	touchscreen_pins: ts-pins-gpio-state {
+		pins = "gpio125";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	touchscreen_i2c_pins: qup-i2c2-gpio-state {
+		pins = "gpio27", "gpio28";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&uart6 {
+	pinctrl-0 = <&qup_uart6_4pin>;
+
+	status = "okay";
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
+&uart9 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l20a_2p95>;
+	vcc-max-microamp = <800000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l26a_1p2>;
+
+	status = "okay";
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
+	vdd-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l12a_1p8>;
+	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
+
+	qcom,imp-res-offset-value = <8>;
+	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
+	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
+	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l26a_1p2>;
+	vdda-pll-supply = <&vreg_l1a_0p875>;
+
+	status = "okay";
+};
+
+&venus {
+	firmware-name = "qcom/sdm845/Google/blueline/venus.mbn";
+
+	status = "okay";
+};
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
+	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
+	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
+	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
+
+	qcom,snoc-host-cap-8bit-quirk;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dts b/arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dts
new file mode 100644
index 0000000000000..ef5b6817958fe
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "sdm845-google-common.dtsi"
+
+/ {
+	model = "Google Pixel 3 XL";
+	compatible = "google,crosshatch", "qcom,sdm845";
+};
+
+&battery {
+	charge-full-design-microamp-hours = <3480000>;
+	voltage-min-design-microvolt = <3600000>;
+	voltage-max-design-microvolt = <4400000>;
+
+	status = "okay";
+};
+
+&cont_splash_mem {
+	reg = <0 0x9d400000 0 0x02400000>;
+
+	status = "okay";
+};
+
+&framebuffer0 {
+	width = <1440>;
+	height = <2960>;
+	stride = <(1440 * 4)>;
+	format = "a8r8g8b8";
+
+	status = "okay";
+};
+
+&mdss {
+	/* until the panel is prepared */
+	status = "disabled";
+};
+

-- 
2.51.0



