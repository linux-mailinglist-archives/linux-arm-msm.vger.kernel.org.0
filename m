Return-Path: <linux-arm-msm+bounces-101060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPdRORzPy2mILwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 15:41:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC06C36A68A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 15:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6BF5B30CC4A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 13:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E563A3E7165;
	Tue, 31 Mar 2026 13:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="FzPpq9pH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-07.mail-europe.com (mail-0701.mail-europe.com [51.83.17.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1123E316C;
	Tue, 31 Mar 2026 13:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.83.17.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774964242; cv=none; b=fXtdQ+4eJ1wKmoECHtS9C7uRmc8Uqbw6UgNOAc570ECYtdY8+QplPRUgYFswr4aIQD5/S7AvE4r3YeDqokTNo5uXwqOcf8khdK+RJO0o12NAXpMHke2we95t6M2yX5B29Co3fookYcqy53UyPunehDXxaSJC4pNHyh0ozliGzyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774964242; c=relaxed/simple;
	bh=Un1v5rWA//tbvwUD80Fv5DGWNJ0jHt2mPAC5ctO6d4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AVmoiHONMp/4qC8YxJMz9uhnC8PnPNLwBwwdArXalHXe9vcPbFooqQExqPXtdqAOHnuFQnxdlf02y0aWIWO9wWqMK8YYCwa9wLgWL92IdBwFZ8e+pUdLeEHFAz2LowXzPF811Wa+MakngqQa0+z5sQuyNHKa8LICrWuAJU4Y9hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=fail smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=FzPpq9pH; arc=none smtp.client-ip=51.83.17.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail2; t=1774964226; x=1775223426;
	bh=9DtaIFhbuYTF9VFfi0fZ9WHrgUOPll3EiGLAWOmlMtE=;
	h=From:Date:Subject:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FzPpq9pHjnPIfQFP0hbOKeQJcV04HY4LK/COmCOjFsww/1/RP1Eibu0rSWtL0sjOp
	 WcHdNJe4/UmZQPVa3m66tc0oE7MeGPmRYE8NRBQ1p7LMaTpOlGZt4riKSUBjCSCsKg
	 WLNRA1BN0xAzroGqe1ZEJ+/jioFJjXK0v3nFtPlmhvOU39iv4UDAq9EeEF46mllK+u
	 2037JwGHzYiENRfXyskzAg1kVJPbFTIE3vui7wE/PzTEAPX2Pt0Hh5lUiiPfeh2lSE
	 GXrKkzgQFfwmEDDLBhMVpTUIRpEJnf/CnTgmpnyU1xz8i70pNqiMtRa8iHVZK+tB7Z
	 qtboyQoGYwzcg==
X-Pm-Submission-Id: 4flTgP2b78z2ScXV
gpg: Signature made Tue 31 Mar 2026 03:29:26 PM CEST
gpg: using EDDSA key 8BFCF5668AA29DAD00D728F6EDAE71A20F500310
gpg: Good signature from "Aleksandrs Vinarskis <alex@vinarskis.com>"
 [ultimate]
gpg: aka "Aleksandrs Vinarskis <alex.vinarskis@gmail.com>" [ultimate]
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Tue, 31 Mar 2026 15:36:47 +0200
Subject: [PATCH v2] arm64: dts: qcom: x1e80100-dell-xps13-9345: enable
 onboard accelerometers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-dell-xps-9345-accel-v2-1-7dacbd24b43d@vinarskis.com>
X-B4-Tracking: v=1; b=H4sIAO7Ny2kC/32NSw6CQBAFr0J6bRsYQIGV9zAs5tNIRxzItJlgC
 Hd35AAuq5JXbwOhwCTQZRsEiiw8+wTqlIEdtX8QsksMKleXXKkGHU0TrotgW1Y1amtpwkqbKif
 X2kZdIS2XQAOvR/XeJx5Z3nP4HCex+Nn/vVhggU4PLZWmNDXRLbLXQZ4sZzu/oN/3/Qv42Gddu
 gAAAA==
X-Change-ID: 20260228-dell-xps-9345-accel-4ab40ed9c827
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: laurentiu.tudor1@dell.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5862; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=Un1v5rWA//tbvwUD80Fv5DGWNJ0jHt2mPAC5ctO6d4c=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDJmnz/5b/mljSqGq9pv+oJg3QYc5buwVStMv42G99fMrI
 zf7/miVjlIWBjEuBlkxRZbuP1/TuhbNXctwXeMbzBxWJpAhDFycAjCRel5GhqmbC/OeTedSmy76
 NTzPKMu8Q2SF/l+zmb5LJI///sN7LouR4Ytrd3OVUY5Y1EqPiAixeWzSi5hSVjEtrOT6W5TJGa7
 BDgA=
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[vinarskis.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[vinarskis.com:s=protonmail2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101060-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[vinarskis.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@vinarskis.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams-osram.com:url,0.0.0.18:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vinarskis.com:dkim,vinarskis.com:email,vinarskis.com:mid,gnome.org:url]
X-Rspamd-Queue-Id: AC06C36A68A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Particular laptop comes with two sets of sensors:
1. Motherboard: accelerometer
2. Display/Camera module: accelerometer, ambient ligth (and more)
   sensor

Both i2c busses are bound to Snapdragon Sensor Core (SSC) and are
typically controlled by (A)DSP thus allowing for great power
efficiency. This however requires DSP libraries matching ADSP firmware,
sensors descriptions (must be extracted from Windows) and other
potentially closed-source libraries. Opensource tooling includes
`libssc` and `hexagonrpcd`, but they were not verified to be working.

Until SSC support for X1E lands, bitbang both i2c busses to enable
accelerometer functionality. In the future if/when sensors on this
platform can be used from DSP directly, this commit can be reverted.

Both accelerometers were tested individually via `monitor-sensor`.
Display accelerometer is defined first, as it appears automatic
screen rotation tools simply pick the 1st iio device.

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
Enable two accelerometers, one on the motherboard, one in display.
In combination with userland screen rotation tools such as Gnome's
'screen rotate' [1] this allows for automatic screen rotation depending
on device orientation.

There appears to be an ALS, a "True Color Sensor with Flicker Detection"
AMS TCS3530 at 0x39. Out-of-tree driver from OSRAM is available [2].
Document bus, address, IRQ such that it could be added in the future.

There is an issue with st_sensors which prevents initializing two
sensors at the time, fix submitted [3]. It is not blocking this series,
as without it, 2nd currently unused accelerometer on the motherboard
will simply fail to probe.

[1] https://extensions.gnome.org/extension/5389/screen-rotate
[2] https://ams-osram.com/support/download-center?search=TCS3530&type=software&subtype=driver
[3] https://lore.kernel.org/all/20260228-st-iio-trigger-v1-1-abf5909e547f@vinarskis.com/
---
Changes in v2:
- Fixed i2c node names to pass dtbs_check
- Updated commit description to reflect discussions of v1
- Link to v1: https://lore.kernel.org/r/20260228-dell-xps-9345-accel-v1-1-daf9e3b3b5ee@vinarskis.com
---
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index ce7b10ea89b6dcb2a4a65c114037f4c90a4b0c6d..bde88655c36889cc4865a109370a9d2cd0166a00 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -40,6 +40,67 @@ switch-lid {
 		};
 	};
 
+	/* Display-mounted sensors */
+	i2c-sensors1 {
+		compatible = "i2c-gpio";
+		i2c-gpio,delay-us = <2>;
+
+		scl-gpios = <&tlmm 232 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		sda-gpios = <&tlmm 231 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+
+		pinctrl-0 = <&sensors_i2c_display_default>;
+		pinctrl-names = "default";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		accelerometer@18 {
+			compatible = "st,lis2dw12";
+			reg = <0x18>;
+
+			interrupts-extended = <&tlmm 29 IRQ_TYPE_LEVEL_LOW>;
+			pinctrl-0 = <&acc_display_int_n_default>;
+			pinctrl-names = "default";
+
+			mount-matrix = "-1", "0", "0",
+				       "0", "1", "0",
+				       "0", "0", "-1";
+		};
+
+		/* AMS TCS3530 @ 0x39, IRQ 93 */
+	};
+
+	/* Motherboard-mounted sensors */
+	i2c-sensors2 {
+		compatible = "i2c-gpio";
+		i2c-gpio,delay-us = <2>;
+
+		scl-gpios = <&tlmm 216 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		sda-gpios = <&tlmm 215 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+
+		pinctrl-0 = <&sensors_i2c_mobo_default>;
+		pinctrl-names = "default";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		accelerometer@18 {
+			compatible = "st,lis2dw12";
+			reg = <0x18>;
+
+			interrupts-extended = <&tlmm 28 IRQ_TYPE_LEVEL_LOW>;
+			pinctrl-0 = <&acc_mobo_int_n_default>;
+			pinctrl-names = "default";
+
+			vdd-supply = <&vreg_l10b_1p8>;
+			vddio-supply = <&vreg_l10b_1p8>;
+
+			mount-matrix = "0", "1", "0",
+				       "0", "0", "1",
+				       "1", "0", "0";
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -450,6 +511,13 @@ vreg_l9b_2p9: ldo9 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l10b_1p8: ldo10 {
+			regulator-name = "vreg_l10b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l12b_1p2: ldo12 {
 			regulator-name = "vreg_l12b_1p2";
 			regulator-min-microvolt = <1200000>;
@@ -1074,6 +1142,18 @@ &tlmm {
 			       <76 4>,  /* SPI19 (TZ Protected) */
 			       <238 1>; /* UFS Reset */
 
+	acc_display_int_n_default: acc-display-int-n-state {
+		pins = "gpio29";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	acc_mobo_int_n_default: acc-mobo-int-n-state {
+		pins = "gpio28";
+		function = "gpio";
+		bias-pull-up;
+	};
+
 	cam_indicator_en: cam-indicator-en-state {
 		pins = "gpio110";
 		function = "gpio";
@@ -1197,6 +1277,20 @@ rtmr1_default: rtmr1-reset-n-active-state {
 		bias-disable;
 	};
 
+	sensors_i2c_display_default: sensors-i2c-display-state {
+		pins = "gpio231", "gpio232";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	sensors_i2c_mobo_default: sensors-i2c-mobo-state {
+		pins = "gpio215", "gpio216";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	tpad_default: tpad-default-state {
 		disable-pins {
 			pins = "gpio38";

---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260228-dell-xps-9345-accel-4ab40ed9c827

Best regards,
-- 
Aleksandrs Vinarskis <alex@vinarskis.com>


