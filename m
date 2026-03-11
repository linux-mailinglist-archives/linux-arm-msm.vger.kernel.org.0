Return-Path: <linux-arm-msm+bounces-96820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNd/N+XWsGnLngIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:43:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 520C725B156
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:43:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 226843016D39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F0F278161;
	Wed, 11 Mar 2026 02:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="oW5ivpS4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B2F347538
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773197014; cv=none; b=EtnW6JAmCWWtpJPtiDPIjW6kXv6LCce2ukNvCGqG5I2tjP/PskTB6TfrEHwdWYvHe91/sH4aW+7E9NZmfQFAisJQU5I/FQwgAe2uyZGJP5wEHhr7AIkbmyhm240b3tYaLX8s0fZz3a8Er8mE477YQgEwHrODxgmD6XZTF10/9vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773197014; c=relaxed/simple;
	bh=yKkVLEh8zT3GalJr2yPen1VOgnLM+ezDJCcTrcmDlb0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nR5IibPPQmcbRaKk9gn3GsQDil2DoDAkBMXNjokTcplDKjMqFpwCVRussTb11AU2uLCOceHm1vZnccp8x/23lR8RQUtKeABIThw+vZQsySTEYt3ineuJetdhNIfWN0IVSYzRc2tJLzvIHVh2wIFk5oJVvCRRspA+fMn1LOEloMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=oW5ivpS4; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773197000; x=1773456200;
	bh=T4y9ViD9Hmsc9iThJ1yg88rpcAJAK4vskf7nayEgHGk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=oW5ivpS4v+0GQ6af8ubjSzO8yBcoXjZd+F7THmjH3syPUynaccxZzPUpZkjld+STo
	 hGqylCy9UsJfRFWTIt8IOxJEpx5pmqV6oCKJFxZ48c/Mm0SypwCuOMZm+ntgY+i9ef
	 kS9chIOBJqU0BX7YHMWjPCQqAHNe3TTNV73C7wbeLo5JuparTqakGBg4VdIHDfo0TQ
	 KcBmGCVkRjZU/SNdXtyfD4D4Zx4psOVO5pgd9ryPaF149bUvO4dK1uEI/GB//3S6bD
	 U8E8fmP4WQpT8Z8SlYqypox9gzT3kgjqcmt1IrUYZFYr1whjdfFnOLNDO0Ci5JiVV5
	 KSssZB0z+j2Kg==
Date: Wed, 11 Mar 2026 02:43:14 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v3 2/2] arm64: dts: qcom: sm8250-asus-obiwan: Add ASUS ROG Phone 3
Message-ID: <20260310-sm8250-asus-obiwan-v3-2-9ed8f0e71e19@pm.me>
In-Reply-To: <20260310-sm8250-asus-obiwan-v3-0-9ed8f0e71e19@pm.me>
References: <20260310-sm8250-asus-obiwan-v3-0-9ed8f0e71e19@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: ced0b1d0cb262ed778f3aab5e510dc78fa1c7ee6
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 520C725B156
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96820-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Supported functionality as of this initial submission:
* Armor Case & Dock Hall Sensors
* Camera flash/torch LED
* Display (Tianma TA066VVHM03)
* DisplayPort Alt Mode
* Macro Camera (OV8856)
* GPU (Adreno 650)
* NFC (NXP PN553)
* Power Button, Volume Keys
* Regulators
* Remoteprocs (ADSP, CDSP, SLPI)
* UFS
* USB
* Video Codec (Venus)
* Wi-Fi / Bluetooth (QCA6390)

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/sm8250-asus-obiwan.dts | 1319 +++++++++++++++++++=
++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi            |   13 +-
 3 files changed, 1332 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/M=
akefile
index f80b5d9cf1e8..cca71c3884f6 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -307,6 +307,7 @@ dtb-$(CONFIG_ARCH_QCOM)=09+=3D sm8150-microsoft-surface=
-duo.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D sm8150-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D sm8150-sony-xperia-kumano-bahamut.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D sm8150-sony-xperia-kumano-griffin.dtb
+dtb-$(CONFIG_ARCH_QCOM)=09+=3D sm8250-asus-obiwan.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D sm8250-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D sm8250-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D sm8250-samsung-r8q.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8250-asus-obiwan.dts b/arch/arm64/b=
oot/dts/qcom/sm8250-asus-obiwan.dts
new file mode 100644
index 000000000000..6cdd66349bb1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8250-asus-obiwan.dts
@@ -0,0 +1,1319 @@
+// SPDX-License-Identifier: BSD-3-Clause
+
+/dts-v1/;
+
+#include <dt-bindings/arm/qcom,ids.h>
+#include <dt-bindings/clock/qcom,camcc-sm8250.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/usb/pd.h>
+
+#include "sm8250.dtsi"
+#include "pm8150.dtsi" /* PM8250 */
+#include "pm8150b.dtsi"
+#include "pm8150l.dtsi"
+
+/delete-node/ &adsp_mem;
+/delete-node/ &camera_mem;
+/delete-node/ &cdsp_mem;
+/delete-node/ &cdsp_secure_heap;
+/delete-node/ &cvp_mem;
+/delete-node/ &gpu_mem;
+/delete-node/ &ipa_fw_mem;
+/delete-node/ &ipa_gsi_mem;
+/delete-node/ &npu_mem;
+/delete-node/ &removed_mem;
+/delete-node/ &slpi_mem;
+/delete-node/ &spss_mem;
+/delete-node/ &video_mem;
+/delete-node/ &wlan_mem;
+
+/ {
+=09model =3D "ASUS ROG Phone 3";
+=09compatible =3D "asus,obiwan", "qcom,sm8250";
+=09chassis-type =3D "handset";
+=09/*
+=09 * There are also ER & EVB boards, but those have meaningful hardware
+=09 * differences that make them not compatible with this devicetree.
+=09 */
+=09qcom,board-id =3D <31 0>, /* ER2 */
+=09=09=09<40 0>, /* PR */
+=09=09=09<41 0>, /* PR2 */
+=09=09=09<50 0>; /* MP */
+=09qcom,msm-id =3D <QCOM_ID_SM8250 0x20001>;
+
+=09aliases {
+=09=09serial0 =3D &uart12;
+=09=09serial1 =3D &uart6;
+=09};
+
+=09battery: battery {
+=09=09compatible =3D "simple-battery";
+=09=09voltage-min-design-microvolt =3D <3400000>;
+=09=09voltage-max-design-microvolt =3D <4360000>;
+=09=09charge-full-design-microamp-hours =3D <5800000>;
+=09=09charge-term-current-microamp =3D <200000>;
+=09=09constant-charge-current-max-microamp =3D <2750000>;
+=09=09constant-charge-voltage-max-microvolt =3D <4360000>;
+=09};
+
+=09chosen {
+=09=09stdout-path =3D "serial0:115200n8";
+=09};
+
+=09gpio_keys: gpio-keys {
+=09=09compatible =3D "gpio-keys";
+
+=09=09pinctrl-0 =3D <&volume_up_default>, <&hall_sensors_default>;
+=09=09pinctrl-names =3D "default";
+
+=09=09event-hall-sensor-case {
+=09=09=09label =3D "Hall Effect Sensor (Armor Case)";
+=09=09=09gpios =3D <&tlmm 113 GPIO_ACTIVE_LOW>;
+=09=09=09linux,input-type =3D <EV_SW>;
+=09=09=09linux,code =3D <SW_MACHINE_COVER>;
+=09=09=09linux,can-disable;
+=09=09=09wakeup-source;
+=09=09};
+
+=09=09event-hall-sensor-dock {
+=09=09=09label =3D "Hall Effect Sensor (Dock)";
+=09=09=09gpios =3D <&tlmm 121 GPIO_ACTIVE_LOW>;
+=09=09=09linux,input-type =3D <EV_SW>;
+=09=09=09linux,code =3D <SW_DOCK>;
+=09=09=09linux,can-disable;
+=09=09=09wakeup-source;
+=09=09};
+
+=09=09key-vol-up {
+=09=09=09label =3D "Volume Up";
+=09=09=09gpios =3D <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
+=09=09=09linux,code =3D <KEY_VOLUMEUP>;
+=09=09=09debounce-interval =3D <15>;
+=09=09=09linux,can-disable;
+=09=09=09wakeup-source;
+=09=09};
+=09};
+
+=09qca6390-pmu {
+=09=09compatible =3D "qcom,qca6390-pmu";
+
+=09=09pinctrl-0 =3D <&bt_en_default>, <&wlan_en_default>;
+=09=09pinctrl-names =3D "default";
+
+=09=09vddaon-supply =3D <&vreg_s6a>;
+=09=09vddpmu-supply =3D <&vreg_s6a>;
+=09=09vddrfa0p95-supply =3D <&vreg_s6a>;
+=09=09vddrfa1p3-supply =3D <&vreg_s8c>;
+=09=09vddrfa1p9-supply =3D <&vreg_s5a>;
+=09=09vddpcie1p3-supply =3D <&vreg_s8c>;
+=09=09vddpcie1p9-supply =3D <&vreg_s5a>;
+=09=09vddio-supply =3D <&vreg_s4a>;
+
+=09=09wlan-enable-gpios =3D <&tlmm 20 GPIO_ACTIVE_HIGH>;
+=09=09bt-enable-gpios =3D <&tlmm 21 GPIO_ACTIVE_HIGH>;
+
+=09=09regulators {
+=09=09=09vreg_pmu_rfa_cmn: ldo0 {
+=09=09=09=09regulator-name =3D "vreg_pmu_rfa_cmn";
+=09=09=09};
+
+=09=09=09vreg_pmu_aon_0p59: ldo1 {
+=09=09=09=09regulator-name =3D "vreg_pmu_aon_0p59";
+=09=09=09};
+
+=09=09=09vreg_pmu_wlcx_0p8: ldo2 {
+=09=09=09=09regulator-name =3D "vreg_pmu_wlcx_0p8";
+=09=09=09};
+
+=09=09=09vreg_pmu_wlmx_0p85: ldo3 {
+=09=09=09=09regulator-name =3D "vreg_pmu_wlmx_0p85";
+=09=09=09};
+
+=09=09=09vreg_pmu_btcmx_0p85: ldo4 {
+=09=09=09=09regulator-name =3D "vreg_pmu_btcmx_0p85";
+=09=09=09};
+
+=09=09=09vreg_pmu_rfa_0p8: ldo5 {
+=09=09=09=09regulator-name =3D "vreg_pmu_rfa_0p8";
+=09=09=09};
+
+=09=09=09vreg_pmu_rfa_1p2: ldo6 {
+=09=09=09=09regulator-name =3D "vreg_pmu_rfa_1p2";
+=09=09=09};
+
+=09=09=09vreg_pmu_rfa_1p7: ldo7 {
+=09=09=09=09regulator-name =3D "vreg_pmu_rfa_1p7";
+=09=09=09};
+
+=09=09=09vreg_pmu_pcie_0p9: ldo8 {
+=09=09=09=09regulator-name =3D "vreg_pmu_pcie_0p9";
+=09=09=09};
+
+=09=09=09vreg_pmu_pcie_1p8: ldo9 {
+=09=09=09=09regulator-name =3D "vreg_pmu_pcie_1p8";
+=09=09=09};
+=09=09};
+=09};
+
+=09vreg_cam_dvdd_1p2: regulator-cam-dvdd-1p2 {
+=09=09compatible =3D "regulator-fixed";
+=09=09regulator-name =3D "vreg_cam_dvdd_1p2";
+=09=09regulator-min-microvolt =3D <1200000>;
+=09=09regulator-max-microvolt =3D <1200000>;
+=09=09regulator-enable-ramp-delay =3D <233>;
+=09=09gpio =3D <&pm8150l_gpios 3 GPIO_ACTIVE_HIGH>;
+=09=09enable-active-high;
+=09};
+
+=09vreg_pm8150b_vbus: regulator-pm8150b-vbus {
+=09=09compatible =3D "regulator-fixed";
+=09=09regulator-name =3D "vreg_pm8150b_vbus";
+=09=09regulator-min-microvolt =3D <5000000>;
+=09=09regulator-max-microvolt =3D <5000000>;
+=09=09gpio =3D <&tlmm 11 GPIO_ACTIVE_HIGH>;
+=09=09enable-active-high;
+=09=09vin-supply =3D <&pm8150b_vbus>;
+=09};
+
+=09vreg_rt1715_vbus: regulator-rt1715-vbus {
+=09=09compatible =3D "regulator-fixed";
+=09=09regulator-name =3D "vreg_rt1715_vbus";
+=09=09regulator-min-microvolt =3D <5000000>;
+=09=09regulator-max-microvolt =3D <5000000>;
+=09=09gpio =3D <&tlmm 71 GPIO_ACTIVE_HIGH>;
+=09=09enable-active-high;
+=09};
+
+=09vreg_s6c: regulator-smpc6 {
+=09=09compatible =3D "regulator-fixed";
+=09=09regulator-name =3D "vreg_s6c";
+
+=09=09regulator-min-microvolt =3D <880000>;
+=09=09regulator-max-microvolt =3D <880000>;
+=09=09regulator-always-on;
+
+=09=09vin-supply =3D <&vph_pwr>;
+=09};
+
+=09vph_pwr: regulator-vph-pwr {
+=09=09compatible =3D "regulator-fixed";
+=09=09regulator-name =3D "vph_pwr";
+=09=09regulator-min-microvolt =3D <3700000>;
+=09=09regulator-max-microvolt =3D <3700000>;
+=09};
+
+=09reserved-memory {
+=09=09removed_mem: memory@80b00000 {
+=09=09=09reg =3D <0x0 0x80b00000 0x0 0xb200000>;
+=09=09=09no-map;
+=09=09};
+
+=09=09camera_mem: memory@8bf00000 {
+=09=09=09reg =3D <0x0 0x8bf00000 0x0 0x500000>;
+=09=09=09no-map;
+=09=09};
+
+=09=09wlan_mem: memory@8c400000 {
+=09=09=09reg =3D <0x0 0x8c400000 0x0 0x100000>;
+=09=09=09no-map;
+=09=09};
+
+=09=09ipa_fw_mem: memory@8c500000 {
+=09=09=09reg =3D <0x0 0x8c500000 0x0 0x10000>;
+=09=09=09no-map;
+=09=09};
+
+=09=09ipa_gsi_mem: memory@8c510000 {
+=09=09=09reg =3D <0x0 0x8c510000 0x0 0xa000>;
+=09=09=09no-map;
+=09=09};
+
+=09=09gpu_mem: memory@8c51a000 {
+=09=09=09reg =3D <0x0 0x8c51a000 0x0 0x2000>;
+=09=09=09no-map;
+=09=09};
+
+=09=09npu_mem: memory@8c600000 {
+=09=09=09reg =3D <0x0 0x8c600000 0x0 0x500000>;
+=09=09=09no-map;
+=09=09};
+
+=09=09video_mem: memory@8cb00000 {
+=09=09=09reg =3D <0x0 0x8cb00000 0x0 0x500000>;
+=09=09=09no-map;
+=09=09};
+
+=09=09cvp_mem: memory@8d000000 {
+=09=09=09reg =3D <0x0 0x8d000000 0x0 0x500000>;
+=09=09=09no-map;
+=09=09};
+
+=09=09cdsp_mem: memory@8d500000 {
+=09=09=09reg =3D <0x0 0x8d500000 0x0 0x1400000>;
+=09=09=09no-map;
+=09=09};
+
+=09=09slpi_mem: memory@8e900000 {
+=09=09=09reg =3D <0x0 0x8e900000 0x0 0x1500000>;
+=09=09=09no-map;
+=09=09};
+
+=09=09adsp_mem: memory@8fe00000 {
+=09=09=09reg =3D <0x0 0x8fe00000 0x0 0x1d00000>;
+=09=09=09no-map;
+=09=09};
+
+=09=09spss_mem: memory@92300000 {
+=09=09=09reg =3D <0x0 0x92300000 0x0 0x100000>;
+=09=09=09no-map;
+=09=09};
+
+=09=09cdsp_secure_heap: memory@92400000 {
+=09=09=09reg =3D <0x0 0x92400000 0x0 0x4600000>;
+=09=09=09no-map;
+=09=09};
+
+=09=09ramoops: ramoops@96a00000 {
+=09=09=09compatible =3D "ramoops";
+=09=09=09reg =3D <0x0 0x96a00000 0x0 0x400000>;
+=09=09=09console-size =3D <0x200000>;
+=09=09=09pmsg-size =3D <0x200000>;
+=09=09=09ecc-size =3D <16>;
+=09=09};
+
+=09=09asus_debug_mem: memory@97000000 {
+=09=09=09reg =3D <0x0 0x97000000 0x0 0x400000>;
+=09=09=09no-map;
+=09=09};
+=09};
+
+=09sbu-mux {
+=09=09compatible =3D "pericom,pi3usb102", "gpio-sbu-mux";
+
+=09=09enable-gpios =3D <&tlmm 162 GPIO_ACTIVE_LOW>;
+=09=09select-gpios =3D <&pm8150l_gpios 1 GPIO_ACTIVE_HIGH>;
+
+=09=09pinctrl-0 =3D <&sbu_mux_default>, <&sbu_mux_sel_default>;
+=09=09pinctrl-names =3D "default";
+
+=09=09vcc-supply =3D <&vreg_l2a>;
+=09=09mode-switch;
+=09=09orientation-switch;
+
+=09=09port {
+=09=09=09sbu_mux_in: endpoint {
+=09=09=09=09remote-endpoint =3D <&pm8150b_sbu>;
+=09=09=09};
+=09=09};
+=09};
+};
+
+&adsp {
+=09firmware-name =3D "qcom/sm8250/asus/obiwan/adsp.mbn";
+
+=09status =3D "okay";
+};
+
+&apps_rsc {
+=09regulators-0 {
+=09=09compatible =3D "qcom,pm8150-rpmh-regulators";
+=09=09qcom,pmic-id =3D "a";
+
+=09=09vdd-s1-supply =3D <&vph_pwr>;
+=09=09vdd-s2-supply =3D <&vph_pwr>;
+=09=09vdd-s3-supply =3D <&vph_pwr>;
+=09=09vdd-s4-supply =3D <&vph_pwr>;
+=09=09vdd-s5-supply =3D <&vph_pwr>;
+=09=09vdd-s6-supply =3D <&vph_pwr>;
+=09=09vdd-s7-supply =3D <&vph_pwr>;
+=09=09vdd-s8-supply =3D <&vph_pwr>;
+=09=09vdd-s9-supply =3D <&vph_pwr>;
+=09=09vdd-s10-supply =3D <&vph_pwr>;
+=09=09vdd-l1-l8-l11-supply =3D <&vreg_s6c>;
+=09=09vdd-l2-l10-supply =3D <&vreg_bob>;
+=09=09vdd-l3-l4-l5-l18-supply =3D <&vreg_s6a>;
+=09=09vdd-l6-l9-supply =3D <&vreg_s8c>;
+=09=09vdd-l7-l12-l14-l15-supply =3D <&vreg_s5a>;
+=09=09vdd-l13-l16-l17-supply =3D <&vreg_bob>;
+
+=09=09vreg_s4a: smps4 {
+=09=09=09regulator-name =3D "vreg_s4a";
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1920000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_s5a: smps5 {
+=09=09=09regulator-name =3D "vreg_s5a";
+=09=09=09regulator-min-microvolt =3D <1900000>;
+=09=09=09regulator-max-microvolt =3D <2100000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_s6a: smps6 {
+=09=09=09regulator-name =3D "vreg_s6a";
+=09=09=09regulator-min-microvolt =3D <600000>;
+=09=09=09regulator-max-microvolt =3D <1128000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l2a: ldo2 {
+=09=09=09regulator-name =3D "vreg_l2a";
+=09=09=09regulator-min-microvolt =3D <3072000>;
+=09=09=09regulator-max-microvolt =3D <3072000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l3a: ldo3 {
+=09=09=09regulator-name =3D "vreg_l3a";
+=09=09=09regulator-min-microvolt =3D <928000>;
+=09=09=09regulator-max-microvolt =3D <932000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l5a: ldo5 {
+=09=09=09regulator-name =3D "vreg_l5a";
+=09=09=09regulator-min-microvolt =3D <880000>;
+=09=09=09regulator-max-microvolt =3D <880000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l6a: ldo6 {
+=09=09=09regulator-name =3D "vreg_l6a";
+=09=09=09regulator-min-microvolt =3D <1200000>;
+=09=09=09regulator-max-microvolt =3D <1200000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l7a: ldo7 {
+=09=09=09regulator-name =3D "vreg_l7a";
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l9a: ldo9 {
+=09=09=09regulator-name =3D "vreg_l9a";
+=09=09=09regulator-min-microvolt =3D <1200000>;
+=09=09=09regulator-max-microvolt =3D <1200000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l10a: ldo10 {
+=09=09=09regulator-name =3D "vreg_l10a";
+=09=09=09regulator-min-microvolt =3D <2960000>;
+=09=09=09regulator-max-microvolt =3D <2960000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l12a: ldo12 {
+=09=09=09regulator-name =3D "vreg_l12a";
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l13a: ldo13 {
+=09=09=09regulator-name =3D "vreg_l13a";
+=09=09=09regulator-min-microvolt =3D <3000000>;
+=09=09=09regulator-max-microvolt =3D <3000000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l14a: ldo14 {
+=09=09=09regulator-name =3D "vreg_l14a";
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1880000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l15a: ldo15 {
+=09=09=09regulator-name =3D "vreg_l15a";
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l16a: ldo16 {
+=09=09=09regulator-name =3D "vreg_l16a";
+=09=09=09regulator-min-microvolt =3D <3024000>;
+=09=09=09regulator-max-microvolt =3D <3304000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l17a: ldo17 {
+=09=09=09regulator-name =3D "vreg_l17a";
+=09=09=09regulator-min-microvolt =3D <2496000>;
+=09=09=09regulator-max-microvolt =3D <3008000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l18a: ldo18 {
+=09=09=09regulator-name =3D "vreg_l18a";
+=09=09=09regulator-min-microvolt =3D <800000>;
+=09=09=09regulator-max-microvolt =3D <920000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+=09};
+
+=09regulators-1 {
+=09=09compatible =3D "qcom,pm8150l-rpmh-regulators";
+=09=09qcom,pmic-id =3D "c";
+
+=09=09vdd-s1-supply =3D <&vph_pwr>;
+=09=09vdd-s2-supply =3D <&vph_pwr>;
+=09=09vdd-s3-supply =3D <&vph_pwr>;
+=09=09vdd-s4-supply =3D <&vph_pwr>;
+=09=09vdd-s5-supply =3D <&vph_pwr>;
+=09=09vdd-s6-supply =3D <&vph_pwr>;
+=09=09vdd-s7-supply =3D <&vph_pwr>;
+=09=09vdd-s8-supply =3D <&vph_pwr>;
+=09=09vdd-l1-l8-supply =3D <&vreg_s4a>;
+=09=09vdd-l2-l3-supply =3D <&vreg_s8c>;
+=09=09vdd-l4-l5-l6-supply =3D <&vreg_bob>;
+=09=09vdd-l7-l11-supply =3D <&vreg_bob>;
+=09=09vdd-l9-l10-supply =3D <&vreg_bob>;
+=09=09vdd-bob-supply =3D <&vph_pwr>;
+
+=09=09vreg_bob: bob {
+=09=09=09regulator-name =3D "vreg_bob";
+=09=09=09regulator-min-microvolt =3D <3008000>;
+=09=09=09regulator-max-microvolt =3D <4000000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_AUTO>;
+=09=09};
+
+=09=09vreg_s7c: smps7 {
+=09=09=09regulator-name =3D "vreg_s7c";
+=09=09=09regulator-min-microvolt =3D <348000>;
+=09=09=09regulator-max-microvolt =3D <1000000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_s8c: smps8 {
+=09=09=09regulator-name =3D "vreg_s8c";
+=09=09=09regulator-min-microvolt =3D <1350000>;
+=09=09=09regulator-max-microvolt =3D <1400000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l1c: ldo1 {
+=09=09=09regulator-name =3D "vreg_l1c";
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l2c: ldo2 {
+=09=09=09regulator-name =3D "vreg_l2c";
+=09=09=09regulator-min-microvolt =3D <1200000>;
+=09=09=09regulator-max-microvolt =3D <1304000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l3c: ldo3 {
+=09=09=09regulator-name =3D "vreg_l3c";
+=09=09=09regulator-min-microvolt =3D <1200000>;
+=09=09=09regulator-max-microvolt =3D <1200000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l4c: ldo4 {
+=09=09=09regulator-name =3D "vreg_l4c";
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <2800000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l5c: ldo5 {
+=09=09=09regulator-name =3D "vreg_l5c";
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <2800000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l6c: ldo6 {
+=09=09=09regulator-name =3D "vreg_l6c";
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <2960000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l7c: ldo7 {
+=09=09=09regulator-name =3D "vreg_l7c";
+=09=09=09regulator-min-microvolt =3D <2856000>;
+=09=09=09regulator-max-microvolt =3D <3104000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l8c: ldo8 {
+=09=09=09regulator-name =3D "vreg_l8c";
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09=09/* Hall sensor VDD */
+=09=09=09regulator-always-on;
+=09=09};
+
+=09=09vreg_l9c: ldo9 {
+=09=09=09regulator-name =3D "vreg_l9c";
+=09=09=09regulator-min-microvolt =3D <2704000>;
+=09=09=09regulator-max-microvolt =3D <2960000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l10c: ldo10 {
+=09=09=09regulator-name =3D "vreg_l10c";
+=09=09=09regulator-min-microvolt =3D <3000000>;
+=09=09=09regulator-max-microvolt =3D <3312000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l11c: ldo11 {
+=09=09=09regulator-name =3D "vreg_l11c";
+=09=09=09regulator-min-microvolt =3D <3104000>;
+=09=09=09regulator-max-microvolt =3D <3304000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+=09};
+};
+
+&camss {
+=09vdda-phy-supply =3D <&vreg_l5a>;
+=09vdda-pll-supply =3D <&vreg_l9a>;
+
+=09status =3D "okay";
+
+=09ports {
+=09=09port@2 {
+=09=09=09csiphy2_ep: endpoint {
+=09=09=09=09clock-lanes =3D <7>;
+=09=09=09=09data-lanes =3D <0 1>;
+=09=09=09=09remote-endpoint =3D <&ov8856_ep>;
+=09=09=09};
+=09=09};
+=09};
+};
+
+&cci1 {
+=09status =3D "okay";
+};
+
+&cci1_i2c0 {
+=09camera@36 {
+=09=09compatible =3D "ovti,ov8856";
+=09=09reg =3D <0x36>;
+
+=09=09rotation =3D <90>;
+=09=09orientation =3D <1>;
+
+=09=09reset-gpios =3D <&tlmm 109 GPIO_ACTIVE_LOW>;
+
+=09=09pinctrl-0 =3D <&cam_ov8856_default>;
+=09=09pinctrl-names =3D "default";
+
+=09=09clocks =3D <&camcc CAM_CC_MCLK2_CLK>;
+=09=09clock-names =3D "xvclk";
+=09=09assigned-clocks =3D <&camcc CAM_CC_MCLK2_CLK>;
+=09=09assigned-clock-rates =3D <19200000>;
+
+=09=09dovdd-supply =3D <&vreg_l6p>;
+=09=09avdd-supply =3D <&vreg_l5p>;
+=09=09dvdd-supply =3D <&vreg_cam_dvdd_1p2>;
+
+=09=09port {
+=09=09=09ov8856_ep: endpoint {
+=09=09=09=09link-frequencies =3D /bits/ 64 <720000000 360000000>;
+=09=09=09=09data-lanes =3D <1 2>;
+=09=09=09=09remote-endpoint =3D <&csiphy2_ep>;
+=09=09=09};
+=09=09};
+=09};
+};
+
+&cdsp {
+=09firmware-name =3D "qcom/sm8250/asus/obiwan/cdsp.mbn";
+
+=09status =3D "okay";
+};
+
+&gmu {
+=09status =3D "okay";
+};
+
+&gpi_dma0 {
+=09status =3D "okay";
+};
+
+&gpi_dma1 {
+=09status =3D "okay";
+};
+
+&gpi_dma2 {
+=09status =3D "okay";
+};
+
+&gpu {
+=09status =3D "okay";
+};
+
+&gpu_zap_shader {
+=09firmware-name =3D "qcom/sm8250/asus/obiwan/a650_zap.mbn";
+};
+
+&i2c1 {
+=09status =3D "okay";
+=09clock-frequency =3D <400000>;
+
+=09nfc@28 {
+=09=09compatible =3D "nxp,pn553",
+=09=09=09     "nxp,nxp-nci-i2c";
+=09=09reg =3D <0x28>;
+
+=09=09interrupt-parent =3D <&tlmm>;
+=09=09interrupts =3D <111 IRQ_TYPE_EDGE_RISING>;
+
+=09=09enable-gpios =3D <&tlmm 6 GPIO_ACTIVE_HIGH>;
+=09=09firmware-gpios =3D <&tlmm 110 GPIO_ACTIVE_HIGH>;
+
+=09=09pinctrl-0 =3D <&nfc_en_default>,
+=09=09=09    <&nfc_clk_req_default>,
+=09=09=09    <&nfc_firmware_default>,
+=09=09=09    <&nfc_irq_default>;
+=09=09pinctrl-names =3D "default";
+=09};
+};
+
+&i2c4 {
+=09/* AW8697FCR vibrator @ 0x5a */
+
+=09status =3D "okay";
+};
+
+&i2c13 {
+=09/* Goodix GT9896 touchscreen @ 0x5d */
+
+=09status =3D "okay";
+};
+
+&i2c15 {
+=09status =3D "okay";
+
+=09typec@4e {
+=09=09compatible =3D "richtek,rt1715";
+=09=09reg =3D <0x4e>;
+=09=09interrupts-extended =3D <&tlmm 175 IRQ_TYPE_LEVEL_LOW>;
+=09=09vbus-supply =3D <&vreg_rt1715_vbus>;
+=09=09pinctrl-0 =3D <&rt1715_irq_default>;
+=09=09pinctrl-names =3D "default";
+
+=09=09connector {
+=09=09=09compatible =3D "usb-c-connector";
+=09=09=09power-role =3D "dual";
+=09=09=09data-role =3D "dual";
+=09=09=09try-power-role =3D "sink";
+=09=09=09self-powered;
+=09=09=09op-sink-microwatt =3D <10000000>;
+
+=09=09=09source-pdos =3D <PDO_FIXED(5000, 500,
+=09=09=09=09=09=09 PDO_FIXED_DUAL_ROLE |
+=09=09=09=09=09=09 PDO_FIXED_USB_COMM |
+=09=09=09=09=09=09 PDO_FIXED_DATA_SWAP)>;
+
+=09=09=09sink-pdos =3D <PDO_FIXED(5000, 3000,
+=09=09=09=09=09       PDO_FIXED_DUAL_ROLE |
+=09=09=09=09=09       PDO_FIXED_USB_COMM |
+=09=09=09=09=09       PDO_FIXED_DATA_SWAP)
+=09=09=09=09     PDO_FIXED(9000, 2000, 0)>;
+
+=09=09=09ports {
+=09=09=09=09#address-cells =3D <1>;
+=09=09=09=09#size-cells =3D <0>;
+
+=09=09=09=09port@0 {
+=09=09=09=09=09reg =3D <0>;
+
+=09=09=09=09=09rt1715_con_hs: endpoint {
+=09=09=09=09=09=09remote-endpoint =3D <&usb_2_dwc3_hs_out>;
+=09=09=09=09=09};
+=09=09=09=09};
+=09=09=09};
+=09=09};
+=09};
+
+=09pm8008: pmic@8 {
+=09=09compatible =3D "qcom,pm8008";
+=09=09reg =3D <0x8>;
+
+=09=09interrupts-extended =3D <&tlmm 39 IRQ_TYPE_EDGE_RISING>;
+=09=09reset-gpios =3D <&tlmm 38 GPIO_ACTIVE_LOW>;
+
+=09=09vdd-l1-l2-supply =3D <&vreg_s8c>;
+=09=09vdd-l3-l4-supply =3D <&vreg_bob>;
+=09=09vdd-l5-supply =3D <&vreg_bob>;
+=09=09vdd-l6-supply =3D <&vreg_s5a>;
+=09=09vdd-l7-supply =3D <&vreg_bob>;
+
+=09=09pinctrl-0 =3D <&pm8008_default>;
+=09=09pinctrl-names =3D "default";
+
+=09=09gpio-controller;
+=09=09#gpio-cells =3D <2>;
+=09=09gpio-ranges =3D <&pm8008 0 0 2>;
+
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <2>;
+
+=09=09#thermal-sensor-cells =3D <0>;
+
+=09=09regulators {
+=09=09=09vreg_l1p: ldo1 {
+=09=09=09=09regulator-name =3D "vreg_l1p";
+=09=09=09=09regulator-min-microvolt =3D <1104000>;
+=09=09=09=09regulator-max-microvolt =3D <1104000>;
+=09=09=09};
+
+=09=09=09vreg_l2p: ldo2 {
+=09=09=09=09regulator-name =3D "vreg_l2p";
+=09=09=09=09regulator-min-microvolt =3D <1104000>;
+=09=09=09=09regulator-max-microvolt =3D <1104000>;
+=09=09=09};
+
+=09=09=09vreg_l3p: ldo3 {
+=09=09=09=09regulator-name =3D "vreg_l3p";
+=09=09=09=09regulator-min-microvolt =3D <2856000>;
+=09=09=09=09regulator-max-microvolt =3D <2856000>;
+=09=09=09};
+
+=09=09=09vreg_l4p: ldo4 {
+=09=09=09=09regulator-name =3D "vreg_l4p";
+=09=09=09=09regulator-min-microvolt =3D <2800000>;
+=09=09=09=09regulator-max-microvolt =3D <2800000>;
+=09=09=09};
+
+=09=09=09vreg_l5p: ldo5 {
+=09=09=09=09regulator-name =3D "vreg_l5p";
+=09=09=09=09regulator-min-microvolt =3D <2800000>;
+=09=09=09=09regulator-max-microvolt =3D <2800000>;
+=09=09=09};
+
+=09=09=09vreg_l6p: ldo6 {
+=09=09=09=09regulator-name =3D "vreg_l6p";
+=09=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09=09};
+
+=09=09=09vreg_l7p: ldo7 {
+=09=09=09=09regulator-name =3D "vreg_l7p";
+=09=09=09=09regulator-min-microvolt =3D <2800000>;
+=09=09=09=09regulator-max-microvolt =3D <2800000>;
+=09=09=09};
+=09=09};
+=09};
+};
+
+&i2c16 {
+=09/* TFA9874 amplifier (top) @ 0x34 */
+=09/* TFA9874 amplifier (bottom) @ 0x35 */
+
+=09status =3D "okay";
+};
+
+&mdss {
+=09status =3D "okay";
+};
+
+&mdss_dp {
+=09status =3D "okay";
+};
+
+&mdss_dp_out {
+=09data-lanes =3D <0 1>;
+};
+
+&mdss_dsi0 {
+=09vdda-supply =3D <&vreg_l9a>;
+
+=09status =3D "okay";
+
+=09panel@0 {
+=09=09compatible =3D "tianma,ta066vvhm03";
+=09=09reg =3D <0>;
+
+=09=09enable-gpios =3D <&tlmm 12 GPIO_ACTIVE_HIGH>;
+=09=09reset-gpios =3D <&tlmm 75 GPIO_ACTIVE_LOW>;
+
+=09=09vci-supply =3D <&vreg_l10a>;
+=09=09vdd-supply =3D <&vreg_l3c>;
+=09=09vddio-supply =3D <&vreg_l14a>;
+
+=09=09pinctrl-0 =3D <&disp_en_active>, <&disp_reset_n_active>, <&mdp_vsync=
>;
+=09=09pinctrl-1 =3D <&disp_en_suspend>, <&disp_reset_n_suspend>, <&mdp_vsy=
nc>;
+=09=09pinctrl-names =3D "default", "sleep";
+
+=09=09port {
+=09=09=09panel_in: endpoint {
+=09=09=09=09remote-endpoint =3D <&mdss_dsi0_out>;
+=09=09=09};
+=09=09};
+=09};
+};
+
+&mdss_dsi0_out {
+=09data-lanes =3D <0 1 2 3>;
+=09remote-endpoint =3D <&panel_in>;
+};
+
+&mdss_dsi0_phy {
+=09vdds-supply =3D <&vreg_l5a>;
+
+=09status =3D "okay";
+};
+
+&pcie0 {
+=09status =3D "okay";
+};
+
+&pcie0_phy {
+=09vdda-phy-supply =3D <&vreg_l5a>;
+=09vdda-pll-supply =3D <&vreg_l9a>;
+
+=09status =3D "okay";
+};
+
+&pcieport0 {
+=09wifi@0 {
+=09=09compatible =3D "pci17cb,1101";
+=09=09reg =3D <0x10000 0x0 0x0 0x0 0x0>;
+
+=09=09vddrfacmn-supply =3D <&vreg_pmu_rfa_cmn>;
+=09=09vddaon-supply =3D <&vreg_pmu_aon_0p59>;
+=09=09vddwlcx-supply =3D <&vreg_pmu_wlcx_0p8>;
+=09=09vddwlmx-supply =3D <&vreg_pmu_wlmx_0p85>;
+=09=09vddrfa0p8-supply =3D <&vreg_pmu_rfa_0p8>;
+=09=09vddrfa1p2-supply =3D <&vreg_pmu_rfa_1p2>;
+=09=09vddrfa1p7-supply =3D <&vreg_pmu_rfa_1p7>;
+=09=09vddpcie0p9-supply =3D <&vreg_pmu_pcie_0p9>;
+=09=09vddpcie1p8-supply =3D <&vreg_pmu_pcie_1p8>;
+
+=09=09qcom,calibration-variant =3D "ASUS_ROG_Phone_3";
+=09};
+};
+
+&pm8150_gpios {
+=09volume_up_default: volume-up-default-state {
+=09=09pins =3D "gpio6";
+=09=09function =3D PMIC_GPIO_FUNC_NORMAL;
+=09=09power-source =3D <1>;
+=09=09input-enable;
+=09=09bias-pull-up;
+=09};
+
+=09/*
+=09 * When low the USB 2 data lanes are routed to the bottom USB port.
+=09 * When high they are routed to the pogo port on the side of the device=
.
+=09 */
+=09usb2_mux_en: usb2-mux-en-default-state {
+=09=09pins =3D "gpio9";
+=09=09function =3D PMIC_GPIO_FUNC_NORMAL;
+=09=09power-source =3D <0>;
+=09=09output-low;
+=09};
+};
+
+&pm8150l_flash {
+=09status =3D "okay";
+
+=09led-0 {
+=09=09function =3D LED_FUNCTION_FLASH;
+=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09led-sources =3D <1>, <2>;
+=09=09led-max-microamp =3D <500000>;
+=09=09flash-max-microamp =3D <1500000>;
+=09=09flash-max-timeout-us =3D <1280000>;
+=09};
+};
+
+&pm8150l_gpios {
+=09sbu_mux_sel_default: sbu-mux-sel-default-state {
+=09=09pins =3D "gpio1";
+=09=09function =3D PMIC_GPIO_FUNC_NORMAL;
+=09=09power-source =3D <0>;
+=09=09output-low;
+=09};
+};
+
+&pm8150b_gpios {
+=09rt1715_mux_en: rt1715-mux-en-default-state {
+=09=09pins =3D "gpio10";
+=09=09function =3D PMIC_GPIO_FUNC_NORMAL;
+=09=09power-source =3D <0>;
+=09=09output-high;
+=09};
+};
+
+&pm8150b_typec {
+=09vdd-pdphy-supply =3D <&vreg_l2a>;
+=09vdd-vbus-supply =3D <&vreg_pm8150b_vbus>;
+
+=09status =3D "okay";
+
+=09connector {
+=09=09compatible =3D "usb-c-connector";
+=09=09power-role =3D "dual";
+=09=09data-role =3D "dual";
+=09=09try-power-role =3D "source";
+=09=09self-powered;
+=09=09op-sink-microwatt =3D <10000000>;
+
+=09=09source-pdos =3D <PDO_FIXED(5000, 900,
+=09=09=09=09=09 PDO_FIXED_DUAL_ROLE |
+=09=09=09=09=09 PDO_FIXED_USB_COMM |
+=09=09=09=09=09 PDO_FIXED_DATA_SWAP)>;
+
+=09=09sink-pdos =3D <PDO_FIXED(5000, 3000,
+=09=09=09=09       PDO_FIXED_DUAL_ROLE |
+=09=09=09=09       PDO_FIXED_USB_COMM |
+=09=09=09=09       PDO_FIXED_DATA_SWAP)
+=09=09=09     PDO_FIXED(9000, 3000, 0)
+=09=09=09     PDO_FIXED(12000, 2250, 0)>;
+
+=09=09altmodes {
+=09=09=09displayport {
+=09=09=09=09svid =3D /bits/ 16 <0xff01>;
+=09=09=09=09vdo =3D <0x00001c46>;
+=09=09=09};
+=09=09};
+
+=09=09ports {
+=09=09=09#address-cells =3D <1>;
+=09=09=09#size-cells =3D <0>;
+
+=09=09=09port@0 {
+=09=09=09=09reg =3D <0>;
+
+=09=09=09=09pm8150b_hs: endpoint {
+=09=09=09=09=09remote-endpoint =3D <&usb_1_dwc3_hs_out>;
+=09=09=09=09};
+=09=09=09};
+
+=09=09=09port@1 {
+=09=09=09=09reg =3D <1>;
+
+=09=09=09=09pm8150b_ss: endpoint {
+=09=09=09=09=09remote-endpoint =3D <&usb_1_qmpphy_out>;
+=09=09=09=09};
+=09=09=09};
+
+=09=09=09port@2 {
+=09=09=09=09reg =3D <2>;
+
+=09=09=09=09pm8150b_sbu: endpoint {
+=09=09=09=09=09remote-endpoint =3D <&sbu_mux_in>;
+=09=09=09=09};
+=09=09=09};
+=09=09};
+=09};
+};
+
+&pm8150b_vbus {
+=09regulator-min-microamp =3D <500000>;
+=09regulator-max-microamp =3D <3000000>;
+
+=09status =3D "okay";
+};
+
+&pon {
+=09mode-bootloader =3D <0x2>;
+=09mode-recovery =3D <0x1>;
+};
+
+&pon_pwrkey {
+=09status =3D "okay";
+};
+
+&pon_resin {
+=09linux,code =3D <KEY_VOLUMEDOWN>;
+
+=09status =3D "okay";
+};
+
+&qupv3_id_0 {
+=09status =3D "okay";
+};
+
+&qupv3_id_1 {
+=09status =3D "okay";
+};
+
+&qupv3_id_2 {
+=09status =3D "okay";
+};
+
+&slpi {
+=09firmware-name =3D "qcom/sm8250/asus/obiwan/slpi.mbn";
+
+=09status =3D "okay";
+};
+
+&tlmm {
+=09gpio-reserved-ranges =3D <28 4>, /* NXP PN553 eSE (SPI) */
+=09=09=09       <40 4>; /* Goodix GF9608 UDFPS (SPI) */
+
+=09nfc_en_default: nfc-en-default-state {
+=09=09pins =3D "gpio6";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-pull-up;
+=09};
+
+=09nfc_clk_req_default: nfc-clk-req-default-state {
+=09=09pins =3D "gpio7";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-pull-up;
+=09};
+
+=09disp_en_active: disp-en-active-state {
+=09=09pins =3D "gpio12";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <8>;
+=09=09bias-disable;
+=09};
+
+=09disp_en_suspend: disp-en-suspend-state {
+=09=09pins =3D "gpio12";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-pull-down;
+=09};
+
+=09wlan_en_default: wlan-default-state {
+=09=09pins =3D "gpio20";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <16>;
+=09=09output-low;
+=09=09bias-pull-up;
+=09};
+
+=09bt_en_default: bt-default-state {
+=09=09pins =3D "gpio21";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <16>;
+=09=09output-low;
+=09=09bias-pull-up;
+=09};
+
+=09pm8008_default: pm8008-default-state {
+=09=09reset-n-pins {
+=09=09=09pins =3D "gpio38";
+=09=09=09function =3D "gpio";
+=09=09=09drive-strength =3D <2>;
+=09=09=09bias-disable;
+=09=09};
+
+=09=09irq-pins {
+=09=09=09pins =3D "gpio39";
+=09=09=09function =3D "gpio";
+=09=09=09drive-strength =3D <2>;
+=09=09=09bias-pull-down;
+=09=09};
+=09};
+
+=09mdp_vsync: mdp-vsync-state {
+=09=09pins =3D "gpio66";
+=09=09function =3D "mdp_vsync";
+=09=09drive-strength =3D <2>;
+=09=09bias-pull-down;
+=09};
+
+=09disp_reset_n_active: disp-reset-n-active-state {
+=09=09pins =3D "gpio75";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <8>;
+=09=09bias-disable;
+=09};
+
+=09disp_reset_n_suspend: disp-reset-n-suspend-state {
+=09=09pins =3D "gpio75";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-pull-down;
+=09};
+
+=09cam_ov8856_default: cam-ov8856-default-state {
+=09=09mclk-pins {
+=09=09=09pins =3D "gpio96";
+=09=09=09function =3D "cam_mclk";
+=09=09=09drive-strength =3D <16>;
+=09=09=09bias-disable;
+=09=09};
+
+=09=09reset-n-pins {
+=09=09=09pins =3D "gpio109";
+=09=09=09function =3D "gpio";
+=09=09=09drive-strength =3D <2>;
+=09=09=09bias-disable;
+=09=09};
+=09};
+
+=09nfc_firmware_default: nfc-firmware-default-state {
+=09=09pins =3D "gpio110";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-pull-up;
+=09};
+
+=09nfc_irq_default: nfc-irq-default-state {
+=09=09pins =3D "gpio111";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-pull-up;
+=09};
+
+=09hall_sensors_default: hall-sensors-default-state {
+=09=09pins =3D "gpio113", "gpio121";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-pull-up;
+=09};
+
+=09sbu_mux_default: sbu-mux-default-state {
+=09=09pins =3D "gpio162";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-disable;
+=09};
+
+=09uart12_mux_default: uart12-mux-default-state {
+=09=09pins =3D "gpio170";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09output-low;
+=09};
+
+=09rt1715_irq_default: rt1715-irq-default-state {
+=09=09pins =3D "gpio175";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-pull-up;
+=09};
+};
+
+/* Debug UART is routed to bottom USB-C pins A11/B11 (TX) and A10/B10 (RX)=
. */
+&uart12 {
+=09pinctrl-0 =3D <&uart12_mux_default>;
+=09pinctrl-names =3D "default";
+
+=09status =3D "okay";
+};
+
+&uart6 {
+=09status =3D "okay";
+
+=09bluetooth {
+=09=09compatible =3D "qcom,qca6390-bt";
+
+=09=09vddrfacmn-supply =3D <&vreg_pmu_rfa_cmn>;
+=09=09vddaon-supply =3D <&vreg_pmu_aon_0p59>;
+=09=09vddbtcmx-supply =3D <&vreg_pmu_btcmx_0p85>;
+=09=09vddrfa0p8-supply =3D <&vreg_pmu_rfa_0p8>;
+=09=09vddrfa1p2-supply =3D <&vreg_pmu_rfa_1p2>;
+=09=09vddrfa1p7-supply =3D <&vreg_pmu_rfa_1p7>;
+=09};
+};
+
+&ufs_mem_hc {
+=09vcc-supply =3D <&vreg_l17a>;
+=09vcc-max-microamp =3D <750000>;
+=09vccq-supply =3D <&vreg_l6a>;
+=09vccq-max-microamp =3D <700000>;
+=09vccq2-supply =3D <&vreg_s4a>;
+=09vccq2-max-microamp =3D <750000>;
+
+=09status =3D "okay";
+};
+
+&ufs_mem_phy {
+=09vdda-phy-supply =3D <&vreg_l5a>;
+=09vdda-pll-supply =3D <&vreg_l9a>;
+
+=09status =3D "okay";
+};
+
+&usb_1 {
+=09status =3D "okay";
+};
+
+&usb_1_dwc3_hs_out {
+=09remote-endpoint =3D <&pm8150b_hs>;
+};
+
+&usb_1_hsphy {
+=09vdda-pll-supply =3D <&vreg_l5a>;
+=09vdda18-supply =3D <&vreg_l12a>;
+=09vdda33-supply =3D <&vreg_l2a>;
+
+=09qcom,hs-disconnect-bp =3D <973>;
+=09qcom,hs-amplitude-bp =3D <1110>;
+=09qcom,pre-emphasis-amplitude-bp =3D <10000>;
+
+=09status =3D "okay";
+};
+
+&usb_1_qmpphy {
+=09vdda-phy-supply =3D <&vreg_l9a>;
+=09vdda-pll-supply =3D <&vreg_l18a>;
+
+=09status =3D "okay";
+};
+
+&usb_1_qmpphy_out {
+=09remote-endpoint =3D <&pm8150b_ss>;
+};
+
+&usb_2 {
+=09pinctrl-0 =3D <&rt1715_mux_en>, <&usb2_mux_en>;
+=09pinctrl-names =3D "default";
+
+=09/*
+=09 * Disable USB3 clock requirement as the bottom port only supports USB2=
.
+=09 * The USB3 lanes are routed through the pogo connector on this board f=
or
+=09 * use with accessories, so will need to revisit this when we start to =
add
+=09 * support for those.
+=09 */
+=09qcom,select-utmi-as-pipe-clk;
+
+=09status =3D "okay";
+};
+
+&usb_2_dwc3 {
+=09maximum-speed =3D "high-speed";
+=09phys =3D <&usb_2_hsphy>;
+=09phy-names =3D "usb2-phy";
+
+=09port {
+=09=09usb_2_dwc3_hs_out: endpoint {
+=09=09=09remote-endpoint =3D <&rt1715_con_hs>;
+=09=09};
+=09};
+};
+
+&usb_2_hsphy {
+=09vdda-pll-supply =3D <&vreg_l5a>;
+=09vdda18-supply =3D <&vreg_l12a>;
+=09vdda33-supply =3D <&vreg_l2a>;
+
+=09qcom,hs-disconnect-bp =3D <1332>;
+=09qcom,hs-amplitude-bp =3D <2000>;
+=09qcom,pre-emphasis-amplitude-bp =3D <20000>;
+
+=09status =3D "okay";
+};
+
+&venus {
+=09firmware-name =3D "qcom/sm8250/asus/obiwan/venus.mbn";
+
+=09status =3D "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qco=
m/sm8250.dtsi
index c7dffa440074..9803aa8cac46 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -665,6 +665,11 @@ cpu7_opp20: opp-2841600000 {
 =09=09=09opp-hz =3D /bits/ 64 <2841600000>;
 =09=09=09opp-peak-kBps =3D <8368000 51609600>;
 =09=09};
+
+=09=09cpu7_opp21: opp-3091200000 {
+=09=09=09opp-hz =3D /bits/ 64 <3091200000>;
+=09=09=09opp-peak-kBps =3D <8368000 51609600>;
+=09=09};
 =09};
=20
 =09firmware {
@@ -3928,6 +3933,7 @@ usb_1_qmpphy: phy@88e8000 {
 =09=09=09#phy-cells =3D <1>;
=20
 =09=09=09orientation-switch;
+=09=09=09mode-switch;
=20
 =09=09=09ports {
 =09=09=09=09#address-cells =3D <1>;
@@ -3949,7 +3955,9 @@ usb_1_qmpphy_usb_ss_in: endpoint {
 =09=09=09=09port@2 {
 =09=09=09=09=09reg =3D <2>;
=20
-=09=09=09=09=09usb_1_qmpphy_dp_in: endpoint {};
+=09=09=09=09=09usb_1_qmpphy_dp_in: endpoint {
+=09=09=09=09=09=09remote-endpoint =3D <&mdss_dp_out>;
+=09=09=09=09=09};
 =09=09=09=09};
 =09=09=09};
 =09=09};
@@ -4223,6 +4231,7 @@ usb_1_dwc3: usb@a600000 {
 =09=09=09=09snps,dis-u2-entry-quirk;
 =09=09=09=09phys =3D <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 =09=09=09=09phy-names =3D "usb2-phy", "usb3-phy";
+=09=09=09=09usb-role-switch;
=20
 =09=09=09=09ports {
 =09=09=09=09=09#address-cells =3D <1>;
@@ -4312,6 +4321,7 @@ usb_2_dwc3: usb@a800000 {
 =09=09=09=09snps,dis-u2-entry-quirk;
 =09=09=09=09phys =3D <&usb_2_hsphy>, <&usb_2_qmpphy>;
 =09=09=09=09phy-names =3D "usb2-phy", "usb3-phy";
+=09=09=09=09usb-role-switch;
 =09=09=09};
 =09=09};
=20
@@ -4819,6 +4829,7 @@ port@1 {
 =09=09=09=09=09=09reg =3D <1>;
=20
 =09=09=09=09=09=09mdss_dp_out: endpoint {
+=09=09=09=09=09=09=09remote-endpoint =3D <&usb_1_qmpphy_dp_in>;
 =09=09=09=09=09=09};
 =09=09=09=09=09};
 =09=09=09=09};

--=20
2.53.0



