Return-Path: <linux-arm-msm+bounces-99029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AlkKdnOvmmMdQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 18:01:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B02912E66E9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 18:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA1B6300C82A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 17:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E2F30FC06;
	Sat, 21 Mar 2026 17:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="PF0hEiMc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027D22BE7DD;
	Sat, 21 Mar 2026 17:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774112465; cv=none; b=YHN/9QltcgH+S2ytBhzlDkEKTrjecEhpv9QM2pitmop2ujKPmhL0B1oO3dPDbL3qEDwQ5MUizj11nb0PwkcjiqAzAbldV39r6smXKj1nt/npMnrANwJwjYa4QWc0J7eq1gTqlGPUr1t4iUvPUzoZbTmxL36g/kQwtHNGr6M9Aps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774112465; c=relaxed/simple;
	bh=ENqqM1Q1go9mTo7eoJdUQli7jgltaQ6H/21fDAMGAYA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gSPvhdnNbMoBLTGQwIlLPYuWwT/Y3Xz2+thhH1CIgZfKgs2K133VTs0eZDsO9qBeXu+l639xv+nx8jMgICYKCDq8vFLlX+jIaXSNgRun1NGsV6YmpUxHiI6d8mESlUlqGscPEmWm8tcstLXSqn02ODF3MbGFM0+lSUTRnsiO2uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=PF0hEiMc; arc=none smtp.client-ip=109.224.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774112452; x=1774371652;
	bh=1OM4rWpkj1T0cXzZpr+z7zesTCcJVC2475fibc3dyfg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=PF0hEiMcbcNWJaWJ/IBCjMb5eImHjsenSbgj/HaCWH3IudT3ZnPS8TKDaQuRZIkym
	 IA5nHd3QbHyHivLqBSZV1wuPBmgZVp2DKFoebBTB8wbn22MSMNx1jXdWGnjVM97eSY
	 C0fLN+PZ6yic5mhDiRnDcA02lo2yhWV7gvWfzlIAKSRvaCjhlX+g/oTpgib5STVmNc
	 seqkIoVGcwSScUZPPzaua0W7BVNXv8/Uzyv9EMXxzQz0qs7yedWsT7icnTvyP5GCFd
	 i4G1cM4EVcx+yS4v5MPjtDNNrJRNtSZLdnhSJo9N3Nhh8ED0eS24a7laUGdAf6BbcZ
	 /Wge5qiXPcTew==
Date: Sat, 21 Mar 2026 17:00:48 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 3/3] arm64: dts: qcom: Add the Nothing Phone (3a)
Message-ID: <20260321-asteroids-v1-3-4b902901cb49@pm.me>
In-Reply-To: <20260321-asteroids-v1-0-4b902901cb49@pm.me>
References: <20260321-asteroids-v1-0-4b902901cb49@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 05fbe999eac7d6086974c0e5a17f239eebf871e8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99029-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B02912E66E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a devicetree for the Nothing Phone (3a) smartphone, which is based
on the Milos/SM7635 SoC.

Supported functionality as of this initial submission:
* Camera flash/torch LED
* Debug UART
* Glyph LEDs (AW20036)
* PMIC-GLINK (Charger, Fuel gauge, USB-C mode switching)
* Assistant Key, Power Button, Volume Keys
* Regulators (PM7550, PM8550VS, PMR735B)
* Remoteprocs (ADSP, CDSP, MPSS, WPSS)
* USB (USB2 + FSA4480)

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/milos-nothing-asteroids.dts      | 964 +++++++++++++++++=
++++
 2 files changed, 965 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/M=
akefile
index f80b5d9cf1e8..bb7ac369682c 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -44,6 +44,7 @@ lemans-evk-el2-dtbs :=3D lemans-evk.dtb lemans-el2.dtbo
=20
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D lemans-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D milos-fairphone-fp6.dtb
+dtb-$(CONFIG_ARCH_QCOM)=09+=3D milos-nothing-asteroids.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D monaco-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)=09+=3D msm8916-acer-a1-724.dtb
diff --git a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts b/arch/ar=
m64/boot/dts/qcom/milos-nothing-asteroids.dts
new file mode 100644
index 000000000000..882e51ddb782
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
@@ -0,0 +1,964 @@
+// SPDX-License-Identifier: BSD-3-Clause
+
+/dts-v1/;
+
+#define PMIV0104_SID 7
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "milos.dtsi"
+#include "pm7550.dtsi"
+#include "pm8550vs.dtsi"
+#include "pmiv0104.dtsi" /* PMIV0102 */
+#include "pmk8550.dtsi" /* PMK7635 */
+#include "pmr735b.dtsi"
+
+/ {
+=09model =3D "Nothing Phone (3a)";
+=09compatible =3D "nothing,asteroids", "qcom,milos";
+=09chassis-type =3D "handset";
+
+=09aliases {
+=09=09serial0 =3D &uart5;
+=09};
+
+=09chosen {
+=09=09#address-cells =3D <2>;
+=09=09#size-cells =3D <2>;
+=09=09ranges;
+
+=09=09framebuffer0: framebuffer@e3940000 {
+=09=09=09compatible =3D "simple-framebuffer";
+=09=09=09reg =3D <0x0 0xe3940000 0x0 (2392 * 1080 * 4)>;
+=09=09=09width =3D <1080>;
+=09=09=09height =3D <2392>;
+=09=09=09stride =3D <(1080 * 4)>;
+=09=09=09format =3D "a8r8g8b8";
+=09=09=09panel =3D <&panel>;
+=09=09=09interconnects =3D <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
+=09=09=09=09=09 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+=09=09=09clocks =3D <&gcc GCC_DISP_HF_AXI_CLK>;
+
+=09=09=09/* Dummy panel for simple-framebuffer dimension info */
+=09=09=09panel: dummy-panel {
+=09=09=09=09compatible =3D "boe,bf068mwm-td0";
+=09=09=09=09height-mm =3D <157>;
+=09=09=09=09width-mm =3D <71>;
+=09=09=09};
+=09=09};
+=09};
+
+=09gpio-keys {
+=09=09compatible =3D "gpio-keys";
+
+=09=09pinctrl-0 =3D <&assist_default>, <&volume_up_default>;
+=09=09pinctrl-names =3D "default";
+
+=09=09key-assist {
+=09=09=09gpios =3D <&tlmm 71 GPIO_ACTIVE_LOW>;
+=09=09=09label =3D "Assistant";
+=09=09=09linux,code =3D <KEY_LEFTMETA>;
+=09=09};
+
+=09=09key-volume-up {
+=09=09=09gpios =3D <&pm7550_gpios 6 GPIO_ACTIVE_LOW>;
+=09=09=09label =3D "Volume Up";
+=09=09=09linux,code =3D <KEY_VOLUMEUP>;
+=09=09};
+=09};
+
+=09pmic-glink {
+=09=09compatible =3D "qcom,milos-pmic-glink",
+=09=09=09     "qcom,sm8550-pmic-glink",
+=09=09=09     "qcom,pmic-glink";
+=09=09#address-cells =3D <1>;
+=09=09#size-cells =3D <0>;
+=09=09orientation-gpios =3D <&tlmm 131 GPIO_ACTIVE_HIGH>;
+
+=09=09connector@0 {
+=09=09=09compatible =3D "usb-c-connector";
+=09=09=09reg =3D <0>;
+
+=09=09=09data-role =3D "dual";
+=09=09=09power-role =3D "dual";
+
+=09=09=09ports {
+=09=09=09=09#address-cells =3D <1>;
+=09=09=09=09#size-cells =3D <0>;
+
+=09=09=09=09port@0 {
+=09=09=09=09=09reg =3D <0>;
+
+=09=09=09=09=09pmic_glink_hs_in: endpoint {
+=09=09=09=09=09=09remote-endpoint =3D <&usb_1_dwc3_hs>;
+=09=09=09=09=09};
+=09=09=09=09};
+
+=09=09=09=09port@1 {
+=09=09=09=09=09reg =3D <1>;
+
+=09=09=09=09=09pmic_glink_sbu: endpoint {
+=09=09=09=09=09=09remote-endpoint =3D <&fsa4480_sbu_mux>;
+=09=09=09=09=09};
+=09=09=09=09};
+=09=09=09};
+=09=09};
+=09};
+
+=09vph_pwr: regulator-vph-pwr {
+=09=09compatible =3D "regulator-fixed";
+=09=09regulator-name =3D "vph_pwr";
+=09=09regulator-min-microvolt =3D <3700000>;
+=09=09regulator-max-microvolt =3D <3700000>;
+
+=09=09regulator-always-on;
+=09=09regulator-boot-on;
+=09};
+
+=09reserved-memory {
+=09=09#address-cells =3D <2>;
+=09=09#size-cells =3D <2>;
+=09=09ranges;
+
+=09=09ramoops@81f20000 {
+=09=09=09compatible =3D "ramoops";
+=09=09=09reg =3D <0x0 0x81f20000 0x0 0x400000>;
+=09=09=09console-size =3D <0x200000>;
+=09=09=09mem-type =3D <2>;
+=09=09=09pmsg-size =3D <0x200000>;
+=09=09};
+
+=09=09/*
+=09=09 * ABL is powering down display and controller if this node is
+=09=09 * not named exactly "splash_region".
+=09=09 */
+=09=09splash_region@e3940000 {
+=09=09=09reg =3D <0x0 0xe3940000 0x0 0x2b00000>;
+=09=09=09no-map;
+=09=09};
+=09};
+};
+
+&apps_rsc {
+=09regulators-0 {
+=09=09compatible =3D "qcom,pm7550-rpmh-regulators";
+
+=09=09vdd-l1-supply =3D <&vreg_s1b>;
+=09=09vdd-l2-l3-supply =3D <&vreg_s3b>;
+=09=09vdd-l4-l5-supply =3D <&vreg_s2b>;
+=09=09vdd-l7-supply =3D <&vreg_s1b>;
+=09=09vdd-l8-supply =3D <&vreg_s1b>;
+=09=09vdd-l9-l10-supply =3D <&vreg_s1b>;
+=09=09vdd-l11-supply =3D <&vreg_s1b>;
+=09=09vdd-l12-l14-supply =3D <&vreg_bob>;
+=09=09vdd-l13-l16-supply =3D <&vreg_bob>;
+=09=09vdd-l15-l17-l18-l19-l20-l21-l22-l23-supply =3D <&vreg_bob>;
+=09=09vdd-s1-supply =3D <&vph_pwr>;
+=09=09vdd-s2-supply =3D <&vph_pwr>;
+=09=09vdd-s3-supply =3D <&vph_pwr>;
+=09=09vdd-s4-supply =3D <&vph_pwr>;
+=09=09vdd-s5-supply =3D <&vph_pwr>;
+=09=09vdd-s6-supply =3D <&vph_pwr>;
+=09=09vdd-bob-supply =3D <&vph_pwr>;
+
+=09=09qcom,pmic-id =3D "b";
+
+=09=09vreg_s1b: smps1 {
+=09=09=09regulator-name =3D "vreg_s1b";
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <2080000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_s2b: smps2 {
+=09=09=09regulator-name =3D "vreg_s2b";
+=09=09=09regulator-min-microvolt =3D <1256000>;
+=09=09=09regulator-max-microvolt =3D <1408000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_s3b: smps3 {
+=09=09=09regulator-name =3D "vreg_s3b";
+=09=09=09regulator-min-microvolt =3D <880000>;
+=09=09=09regulator-max-microvolt =3D <1040000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_s4b: smps4 {
+=09=09=09regulator-name =3D "vreg_s4b";
+=09=09=09regulator-min-microvolt =3D <300000>;
+=09=09=09regulator-max-microvolt =3D <1004000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l1b: ldo1 {
+=09=09=09regulator-name =3D "vreg_l1b";
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l2b: ldo2 {
+=09=09=09regulator-name =3D "vreg_l2b";
+=09=09=09regulator-min-microvolt =3D <880000>;
+=09=09=09regulator-max-microvolt =3D <912000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l3b: ldo3 {
+=09=09=09regulator-name =3D "vreg_l3b";
+=09=09=09regulator-min-microvolt =3D <880000>;
+=09=09=09regulator-max-microvolt =3D <912000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l4b: ldo4 {
+=09=09=09regulator-name =3D "vreg_l4b";
+=09=09=09regulator-min-microvolt =3D <1200000>;
+=09=09=09regulator-max-microvolt =3D <1200000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l5b: ldo5 {
+=09=09=09regulator-name =3D "vreg_l5b";
+=09=09=09regulator-min-microvolt =3D <1200000>;
+=09=09=09regulator-max-microvolt =3D <1200000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l7b: ldo7 {
+=09=09=09regulator-name =3D "vreg_l7b";
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l8b: ldo8 {
+=09=09=09regulator-name =3D "vreg_l8b";
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l9b: ldo9 {
+=09=09=09regulator-name =3D "vreg_l9b";
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l10b: ldo10 {
+=09=09=09regulator-name =3D "vreg_l10b";
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l11b: ldo11 {
+=09=09=09regulator-name =3D "vreg_l11b";
+=09=09=09regulator-min-microvolt =3D <1800000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l12b: ldo12 {
+=09=09=09regulator-name =3D "vreg_l12b";
+=09=09=09regulator-min-microvolt =3D <2952000>;
+=09=09=09regulator-max-microvolt =3D <2952000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l13b: ldo13 {
+=09=09=09regulator-name =3D "vreg_l13b";
+=09=09=09regulator-min-microvolt =3D <2700000>;
+=09=09=09regulator-max-microvolt =3D <3300000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l14b: ldo14 {
+=09=09=09regulator-name =3D "vreg_l14b";
+=09=09=09regulator-min-microvolt =3D <3300000>;
+=09=09=09regulator-max-microvolt =3D <3304000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l15b: ldo15 {
+=09=09=09regulator-name =3D "vreg_l15b";
+=09=09=09regulator-min-microvolt =3D <3300000>;
+=09=09=09regulator-max-microvolt =3D <3304000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l16b: ldo16 {
+=09=09=09regulator-name =3D "vreg_l16b";
+=09=09=09regulator-min-microvolt =3D <3008000>;
+=09=09=09regulator-max-microvolt =3D <3008000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l17b: ldo17 {
+=09=09=09regulator-name =3D "vreg_l17b";
+=09=09=09regulator-min-microvolt =3D <3104000>;
+=09=09=09regulator-max-microvolt =3D <3104000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l18b: ldo18 {
+=09=09=09regulator-name =3D "vreg_l18b";
+=09=09=09regulator-min-microvolt =3D <2800000>;
+=09=09=09regulator-max-microvolt =3D <2800000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l19b: ldo19 {
+=09=09=09regulator-name =3D "vreg_l19b";
+=09=09=09regulator-min-microvolt =3D <3000000>;
+=09=09=09regulator-max-microvolt =3D <3000000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l20b: ldo20 {
+=09=09=09regulator-name =3D "vreg_l20b";
+=09=09=09regulator-min-microvolt =3D <1620000>;
+=09=09=09regulator-max-microvolt =3D <3544000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l21b: ldo21 {
+=09=09=09regulator-name =3D "vreg_l21b";
+=09=09=09regulator-min-microvolt =3D <1620000>;
+=09=09=09regulator-max-microvolt =3D <3544000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l22b: ldo22 {
+=09=09=09regulator-name =3D "vreg_l22b";
+=09=09=09regulator-min-microvolt =3D <3200000>;
+=09=09=09regulator-max-microvolt =3D <3200000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l23b: ldo23 {
+=09=09=09regulator-name =3D "vreg_l23b";
+=09=09=09regulator-min-microvolt =3D <1650000>;
+=09=09=09regulator-max-microvolt =3D <3544000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_bob: bob {
+=09=09=09regulator-name =3D "vreg_bob";
+=09=09=09regulator-min-microvolt =3D <3008000>;
+=09=09=09regulator-max-microvolt =3D <3960000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+=09};
+
+=09regulators-1 {
+=09=09compatible =3D "qcom,pm8550vs-rpmh-regulators";
+
+=09=09vdd-l1-supply =3D <&vreg_s3b>;
+=09=09vdd-l2-supply =3D <&vreg_s3b>;
+=09=09vdd-l3-supply =3D <&vreg_s3b>;
+=09=09vdd-s3-supply =3D <&vph_pwr>;
+=09=09vdd-s4-supply =3D <&vph_pwr>;
+=09=09vdd-s5-supply =3D <&vph_pwr>;
+=09=09vdd-s6-supply =3D <&vph_pwr>;
+
+=09=09qcom,pmic-id =3D "c";
+
+=09=09vreg_s3c: smps3 {
+=09=09=09regulator-name =3D "vreg_s3c";
+=09=09=09regulator-min-microvolt =3D <1010000>;
+=09=09=09regulator-max-microvolt =3D <1120000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_s4c: smps4 {
+=09=09=09regulator-name =3D "vreg_s4c";
+=09=09=09regulator-min-microvolt =3D <352000>;
+=09=09=09regulator-max-microvolt =3D <812000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_s5c: smps5 {
+=09=09=09regulator-name =3D "vreg_s5c";
+=09=09=09regulator-min-microvolt =3D <540000>;
+=09=09=09regulator-max-microvolt =3D <884000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_s6c: smps6 {
+=09=09=09regulator-name =3D "vreg_s6c";
+=09=09=09regulator-min-microvolt =3D <352000>;
+=09=09=09regulator-max-microvolt =3D <904000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l1c: ldo1 {
+=09=09=09regulator-name =3D "vreg_l1c";
+=09=09=09regulator-min-microvolt =3D <320000>;
+=09=09=09regulator-max-microvolt =3D <1004000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l2c: ldo2 {
+=09=09=09regulator-name =3D "vreg_l2c";
+=09=09=09regulator-min-microvolt =3D <320000>;
+=09=09=09regulator-max-microvolt =3D <650000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l3c: ldo3 {
+=09=09=09regulator-name =3D "vreg_l3c";
+=09=09=09regulator-min-microvolt =3D <320000>;
+=09=09=09regulator-max-microvolt =3D <912000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+=09};
+
+=09regulators-2 {
+=09=09compatible =3D "qcom,pmr735b-rpmh-regulators";
+
+=09=09vdd-l1-l2-supply =3D <&vreg_s3b>;
+=09=09vdd-l3-supply =3D <&vreg_s3b>;
+=09=09vdd-l4-supply =3D <&vreg_s1b>;
+=09=09vdd-l5-supply =3D <&vreg_s2b>;
+=09=09vdd-l7-l8-supply =3D <&vreg_s2b>;
+=09=09vdd-l9-supply =3D <&vreg_s3b>;
+=09=09vdd-l10-supply =3D <&vreg_s1b>;
+=09=09vdd-l11-supply =3D <&vreg_s3b>;
+=09=09vdd-l12-supply =3D <&vreg_s3b>;
+
+=09=09qcom,pmic-id =3D "f";
+
+=09=09vreg_l1f: ldo1 {
+=09=09=09regulator-name =3D "vreg_l1f";
+=09=09=09regulator-min-microvolt =3D <852000>;
+=09=09=09regulator-max-microvolt =3D <950000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l2f: ldo2 {
+=09=09=09regulator-name =3D "vreg_l2f";
+=09=09=09regulator-min-microvolt =3D <751000>;
+=09=09=09regulator-max-microvolt =3D <824000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l3f: ldo3 {
+=09=09=09regulator-name =3D "vreg_l3f";
+=09=09=09regulator-min-microvolt =3D <650000>;
+=09=09=09regulator-max-microvolt =3D <880000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l4f: ldo4 {
+=09=09=09regulator-name =3D "vreg_l4f";
+=09=09=09regulator-min-microvolt =3D <1700000>;
+=09=09=09regulator-max-microvolt =3D <1950000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l5f: ldo5 {
+=09=09=09regulator-name =3D "vreg_l5f";
+=09=09=09regulator-min-microvolt =3D <1140000>;
+=09=09=09regulator-max-microvolt =3D <1260000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l7f: ldo7 {
+=09=09=09regulator-name =3D "vreg_l7f";
+=09=09=09regulator-min-microvolt =3D <1080000>;
+=09=09=09regulator-max-microvolt =3D <1350000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l9f: ldo9 {
+=09=09=09regulator-name =3D "vreg_l9f";
+=09=09=09regulator-min-microvolt =3D <870000>;
+=09=09=09regulator-max-microvolt =3D <970000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l10f: ldo10 {
+=09=09=09regulator-name =3D "vreg_l10f";
+=09=09=09regulator-min-microvolt =3D <1500000>;
+=09=09=09regulator-max-microvolt =3D <1800000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l11f: ldo11 {
+=09=09=09regulator-name =3D "vreg_l11f";
+=09=09=09regulator-min-microvolt =3D <320000>;
+=09=09=09regulator-max-microvolt =3D <864000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+
+=09=09vreg_l12f: ldo12 {
+=09=09=09regulator-name =3D "vreg_l12f";
+=09=09=09regulator-min-microvolt =3D <480000>;
+=09=09=09regulator-max-microvolt =3D <884000>;
+=09=09=09regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
+=09=09};
+=09};
+};
+
+&dispcc {
+=09/* Disable for now so simple-framebuffer continues working */
+=09status =3D "disabled";
+};
+
+&gcc {
+=09protected-clocks =3D <GCC_PCIE_1_AUX_CLK>, <GCC_PCIE_1_AUX_CLK_SRC>,
+=09=09=09   <GCC_PCIE_1_CFG_AHB_CLK>, <GCC_PCIE_1_MSTR_AXI_CLK>,
+=09=09=09   <GCC_PCIE_1_PHY_RCHNG_CLK>, <GCC_PCIE_1_PHY_RCHNG_CLK_SRC>,
+=09=09=09   <GCC_PCIE_1_PIPE_CLK>, <GCC_PCIE_1_PIPE_CLK_SRC>,
+=09=09=09   <GCC_PCIE_1_PIPE_DIV2_CLK>, <GCC_PCIE_1_PIPE_DIV2_CLK_SRC>,
+=09=09=09   <GCC_PCIE_1_SLV_AXI_CLK>, <GCC_PCIE_1_SLV_Q2A_AXI_CLK>;
+};
+
+&i2c7 {
+=09clock-frequency =3D <400000>;
+
+=09status =3D "okay";
+
+=09led-controller@3a {
+=09=09compatible =3D "awinic,aw20036";
+=09=09reg =3D <0x3a>;
+=09=09#address-cells =3D <1>;
+=09=09#size-cells =3D <0>;
+
+=09=09enable-gpios =3D <&tlmm 54 GPIO_ACTIVE_HIGH>;
+
+=09=09led@0 {
+=09=09=09reg =3D <0x0>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-1";
+=09=09=09function-enumerator =3D <0>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@1 {
+=09=09=09reg =3D <0x1>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-1";
+=09=09=09function-enumerator =3D <1>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@2 {
+=09=09=09reg =3D <0x2>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-1";
+=09=09=09function-enumerator =3D <2>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@3 {
+=09=09=09reg =3D <0x3>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-1";
+=09=09=09function-enumerator =3D <3>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@4 {
+=09=09=09reg =3D <0x4>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-1";
+=09=09=09function-enumerator =3D <4>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@5 {
+=09=09=09reg =3D <0x5>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-1";
+=09=09=09function-enumerator =3D <5>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@6 {
+=09=09=09reg =3D <0x6>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-1";
+=09=09=09function-enumerator =3D <6>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@7 {
+=09=09=09reg =3D <0x7>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-2";
+=09=09=09function-enumerator =3D <0>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@8 {
+=09=09=09reg =3D <0x8>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-3";
+=09=09=09function-enumerator =3D <0>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@9 {
+=09=09=09reg =3D <0x9>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-3";
+=09=09=09function-enumerator =3D <1>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@a {
+=09=09=09reg =3D <0xa>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-3";
+=09=09=09function-enumerator =3D <2>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@b {
+=09=09=09reg =3D <0xb>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-3";
+=09=09=09function-enumerator =3D <3>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@c {
+=09=09=09reg =3D <0xc>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-1";
+=09=09=09function-enumerator =3D <7>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@d {
+=09=09=09reg =3D <0xd>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-1";
+=09=09=09function-enumerator =3D <8>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@e {
+=09=09=09reg =3D <0xe>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-1";
+=09=09=09function-enumerator =3D <9>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@f {
+=09=09=09reg =3D <0xf>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-1";
+=09=09=09function-enumerator =3D <10>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@10 {
+=09=09=09reg =3D <0x10>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-1";
+=09=09=09function-enumerator =3D <11>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@11 {
+=09=09=09reg =3D <0x11>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-1";
+=09=09=09function-enumerator =3D <12>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@12 {
+=09=09=09reg =3D <0x12>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-1";
+=09=09=09function-enumerator =3D <13>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@13 {
+=09=09=09reg =3D <0x13>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-2";
+=09=09=09function-enumerator =3D <1>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@14 {
+=09=09=09reg =3D <0x14>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-2";
+=09=09=09function-enumerator =3D <2>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@15 {
+=09=09=09reg =3D <0x15>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-3";
+=09=09=09function-enumerator =3D <4>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@16 {
+=09=09=09reg =3D <0x16>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-3";
+=09=09=09function-enumerator =3D <5>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@17 {
+=09=09=09reg =3D <0x17>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-3";
+=09=09=09function-enumerator =3D <6>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@18 {
+=09=09=09reg =3D <0x18>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-1";
+=09=09=09function-enumerator =3D <14>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@19 {
+=09=09=09reg =3D <0x19>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-1";
+=09=09=09function-enumerator =3D <15>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@1a {
+=09=09=09reg =3D <0x1a>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-1";
+=09=09=09function-enumerator =3D <16>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@1b {
+=09=09=09reg =3D <0x1b>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-1";
+=09=09=09function-enumerator =3D <17>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@1c {
+=09=09=09reg =3D <0x1c>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-1";
+=09=09=09function-enumerator =3D <18>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@1d {
+=09=09=09reg =3D <0x1d>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-1";
+=09=09=09function-enumerator =3D <19>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@1e {
+=09=09=09reg =3D <0x1e>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-2";
+=09=09=09function-enumerator =3D <3>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@1f {
+=09=09=09reg =3D <0x1f>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-2";
+=09=09=09function-enumerator =3D <4>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@20 {
+=09=09=09reg =3D <0x20>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-3";
+=09=09=09function-enumerator =3D <7>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@21 {
+=09=09=09reg =3D <0x21>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-3";
+=09=09=09function-enumerator =3D <8>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@22 {
+=09=09=09reg =3D <0x22>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-3";
+=09=09=09function-enumerator =3D <9>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+
+=09=09led@23 {
+=09=09=09reg =3D <0x23>;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09=09function =3D "glyph-3";
+=09=09=09function-enumerator =3D <10>;
+=09=09=09led-max-microamp =3D <6560>;
+=09=09};
+=09};
+
+=09typec-mux@42 {
+=09=09compatible =3D "fcs,fsa4480";
+=09=09reg =3D <0x42>;
+
+=09=09vcc-supply =3D <&vph_pwr>;
+
+=09=09mode-switch;
+=09=09orientation-switch;
+
+=09=09port {
+=09=09=09fsa4480_sbu_mux: endpoint {
+=09=09=09=09remote-endpoint =3D <&pmic_glink_sbu>;
+=09=09=09};
+=09=09};
+=09};
+};
+
+&pm7550_flash {
+=09status =3D "okay";
+
+=09led-0 {
+=09=09function =3D LED_FUNCTION_FLASH;
+=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09led-sources =3D <1>, <4>;
+=09=09led-max-microamp =3D <350000>;
+=09=09flash-max-microamp =3D <1500000>;
+=09=09flash-max-timeout-us =3D <400000>;
+=09};
+};
+
+&pm7550_gpios {
+=09volume_up_default: volume-up-default-state {
+=09=09pins =3D "gpio6";
+=09=09function =3D PMIC_GPIO_FUNC_NORMAL;
+=09=09power-source =3D <1>;
+=09=09bias-pull-up;
+=09};
+};
+
+&pm8550vs_c {
+=09status =3D "okay";
+};
+
+&pmiv0104_eusb2_repeater {
+=09vdd18-supply =3D <&vreg_l7b>;
+=09vdd3-supply =3D <&vreg_l17b>;
+
+=09qcom,tune-res-fsdif =3D /bits/ 8 <0x5>;
+=09qcom,tune-usb2-amplitude =3D /bits/ 8 <0x8>;
+=09qcom,tune-usb2-disc-thres =3D /bits/ 8 <0x7>;
+=09qcom,tune-usb2-preem =3D /bits/ 8 <0x6>;
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
+&remoteproc_adsp {
+=09firmware-name =3D "qcom/milos/nothing/asteroids/adsp.mbn",
+=09=09=09"qcom/milos/nothing/asteroids/adsp_dtb.mbn";
+
+=09status =3D "okay";
+};
+
+&remoteproc_cdsp {
+=09firmware-name =3D "qcom/milos/nothing/asteroids/cdsp.mbn",
+=09=09=09"qcom/milos/nothing/asteroids/cdsp_dtb.mbn";
+
+=09status =3D "okay";
+};
+
+&remoteproc_mpss {
+=09firmware-name =3D "qcom/milos/nothing/asteroids/modem.mbn";
+
+=09status =3D "okay";
+};
+
+&remoteproc_wpss {
+=09firmware-name =3D "qcom/milos/nothing/asteroids/wpss.mbn";
+
+=09status =3D "okay";
+};
+
+&tlmm {
+=09gpio-reserved-ranges =3D <13 1>, /* Display */
+=09=09=09       <63 2>; /* WLAN UART */
+
+=09assist_default: assist-default-state {
+=09=09pins =3D "gpio71";
+=09=09function =3D "gpio";
+=09=09bias-pull-up;
+=09};
+};
+
+&trusted_apps_mem {
+=09reg =3D <0x0 0xe9500000 0x0 0x5500000>;
+};
+
+/*
+ * UART_RX and UART_TX are routed to test points on board, not
+ * available over USB.
+ */
+&uart5 {
+=09status =3D "okay";
+};
+
+&usb_1 {
+=09dr_mode =3D "otg";
+
+=09/* USB 2.0 only, HW does not support USB 3.x */
+=09qcom,select-utmi-as-pipe-clk;
+
+=09status =3D "okay";
+};
+
+&usb_1_dwc3_hs {
+=09remote-endpoint =3D <&pmic_glink_hs_in>;
+};
+
+&usb_1_hsphy {
+=09vdd-supply =3D <&vreg_l2b>;
+=09vdda12-supply =3D <&vreg_l4b>;
+
+=09phys =3D <&pmiv0104_eusb2_repeater>;
+
+=09status =3D "okay";
+};

--=20
2.53.0



