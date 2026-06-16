Return-Path: <linux-arm-msm+bounces-113341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uRIvGYQTMWoDbQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:12:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB91A68D69A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:12:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=iT0K35lq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113341-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113341-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FDE130F69FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 09:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB1B4219EA;
	Tue, 16 Jun 2026 09:09:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF21F4218AC;
	Tue, 16 Jun 2026 09:09:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781600952; cv=none; b=co1mo1iu/ZZzDpI8lxMGDRnFiZ0jyEDD7qxg1aenBPbi+a5TWdSMwZ/69QxzhavgPkmDy38s9NGIAsJuNpY/HWMYJJFsav3ZAJ1kXiZmRRlw8g8PfdbYH1nC3qrIo2tBXmVfaYglrqI+lIaY5nIDd7c/7uj8uUZnoC9nVph3pdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781600952; c=relaxed/simple;
	bh=8NsqONG9z8AotvhBn6dvdFBogV7xC4hy+6f9I8c7yys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rIByjDLTpxKVtaIBGQMsKuCM6X7UGBFIEVhCXvIuJjMLYFhZPdM0R9ZYocr1OwihaOYLZKF6yn79mMSSHbZYHkUrcIAkzTajC+WXS8sp3ltXRcvGZSGI+JNbDrDTRLOq409wBl4Un3Pjbq6PrhHGVl0ktaIu7fj+/orrumKKN3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iT0K35lq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02ED61F000E9;
	Tue, 16 Jun 2026 09:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781600951;
	bh=7FjAPait2NX6H92p2zaGleMX6ebofExMs9VGvzoAFWA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iT0K35lqOHv+9KrHevgQWPoBXPlCoy8mTQbGTMTacV3R1vom/mhI4XEJlkrwpleI7
	 3nqyxnSc/QWqV5jGlFmmyoT71i8Sq7mHRPOX8zpHQIfsAUdtOhJ+b+TozGEbosHl5v
	 Q6ZLKF1+Vo8OqhEa+Vg2NpPHdg3g1qw9hdiN9d2RgRKYWTVl/ypHMMGriRvGI3W7G3
	 eazyTX7lGWhkNKnwpV+j7lyuhuii7nZ303hw1rM98iVciYAtNDlMrMGQDQOHwdHENb
	 pFCiYABH/d7E2jwAvrUdA8oofVPKvMo263hoesjgU3PnCnINgGltfuM6tAWBALjiDj
	 Vm6KxCOWjvyew==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 16 Jun 2026 11:08:52 +0200
Subject: [PATCH v2 4/4] arm64: dts: qcom: sc8180x-lenovo-flex-5g: Describe
 the display power net
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-topic-8180_disp_power-v2-4-167785993231@oss.qualcomm.com>
References: <20260616-topic-8180_disp_power-v2-0-167785993231@oss.qualcomm.com>
In-Reply-To: <20260616-topic-8180_disp_power-v2-0-167785993231@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781600932; l=2592;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=ncWnxSnGq1AfXSdksneVkZmjX3rOMGs2uoW6e4qzOv4=;
 b=IcdYdIRMzHtzZ5IVzfaJYgVKDipg+6bJxcYAV1qXq3cJb5Pi2W09QzhHlls1Tg5rRkRQxxwfa
 iV5Da8vtjtuDcH4KH3OYEN1hn4KjOVVxCoj/eOt0dKRXYVgCfXKVXMt
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-113341-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB91A68D69A

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Describe and wire up the power supplies for the eDP panel and its
backlight. Previously, this was only working because of settings
inherited from the bootloader.

Fixes: 20dea72a393c ("arm64: dts: qcom: sc8180x: Introduce Lenovo Flex 5G")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index 0d2cfb830e83..7601afc3d7bf 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -26,6 +26,7 @@ backlight: backlight {
 		compatible = "pwm-backlight";
 		pwms = <&pmc8180c_lpg 4 1000000>;
 		enable-gpios = <&pmc8180c_gpios 8 GPIO_ACTIVE_HIGH>;
+		power-supply = <&vled_bl_pw>;
 
 		pinctrl-0 = <&bl_pwm_default>;
 		pinctrl-names = "default";
@@ -157,6 +158,38 @@ cdsp_mem: cdsp-region@98900000 {
 		};
 	};
 
+	vled_bl_pw: regulator-vled-bl-pw {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VLED_BL_PW";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmc8180_2_gpios 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&bl_pwr_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_lcm_3v3: regulator-edp-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_LCM_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 130 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&lcm_3v3_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
 	vreg_s4a_1p8: regulator-pm8150-s4 {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_s4a_1p8";
@@ -438,6 +471,7 @@ &mdss_edp {
 	aux-bus {
 		panel {
 			compatible = "edp-panel";
+			power-supply = <&vreg_lcm_3v3>;
 			no-hpd;
 
 			backlight = <&backlight>;
@@ -472,6 +506,13 @@ &pcie3_phy {
 	status = "okay";
 };
 
+&pmc8180_2_gpios {
+	bl_pwr_en: bl-pwr-en-state {
+		pins = "gpio1";
+		function = "normal";
+	};
+};
+
 &pmc8180_pwrkey {
 	status = "okay";
 };
@@ -765,6 +806,12 @@ ts_int_default: ts-int-default-state {
 		drive-strength = <2>;
 	};
 
+	lcm_3v3_en: lcm-3v3-en-state {
+		pins = "gpio130";
+		function = "gpio";
+		bias-disable;
+	};
+
 	usbprim_sbu_default: usbprim-sbu-state {
 		oe-n-pins {
 			pins = "gpio152";

-- 
2.54.0


