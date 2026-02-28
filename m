Return-Path: <linux-arm-msm+bounces-94629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKKdC0tHo2lM/AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 20:51:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 688601C76EB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 20:51:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CA3733102C9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 19:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32CAC430B89;
	Sat, 28 Feb 2026 17:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="fYu/WtkI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031284301CB
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 17:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772300822; cv=none; b=QLHCwUGnSHBxqnlebpo8aaOhMIKc7hj1PcHNeucVakJ5XB4gHjf+6jtMD8mX6k6ccHTI3tt0l/2/suOwpqLGF4MU+S29Psqh1CDVTdzlWckZiBVr/ta2RdmsqzfuGbAUWPXNloNfnHj/p0hFAnkpW+U3NHosTy6iDu9PnLOSIco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772300822; c=relaxed/simple;
	bh=upM5bB7sMn/Bn9Wg0AfAFftRp/cOqqhtEvvqO8KjEw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VRmU8OTeLQD3U8UGcTx5psQxu0ZD6aqoYjYAcEKUXKpMZslLpNb1GFjNNO1Kfw09MuHjp9fmGDg54kxoclcCBcwhOy+hjExY4SaAZFynUowxsFSm/ypMkx+ERsgnRHAdMb8Q5sQtKZdvKcbnhOYScHdugtbffmmdJ32rCkHY+So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=fYu/WtkI; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1772300816; x=1772560016;
	bh=282rh6NXOUty00jSQAeI5nGW6jMmS6pNYooX9wfpBww=;
	h=From:Date:Subject:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=fYu/WtkIaslzC74V/VYUBbZnCXrd5q4MHe9EYE+F3Z9r90ug449Ly1bgeCZp1m2rV
	 RM51lVuCZJ/7489MiZ5HGX4v1H2SezFxJBENR/4MYac2cErFCzX2QVBnA2ak87ROz3
	 82hUFQpr3tkpGBVZJoMQsS18LsCumRyz1rkawscoRuraTr7gM8cIKIazY5s5OfmgFU
	 cKNoMNc4ARUeB5Pe4sjdB2ZVf51x+zgO6IIDJ0sjyeilIBF6PHTloW31zaCSwaLl4o
	 co9XOVuSkLXdYydxQD9Ne5bBif1CvHOGRnIbgrAp9dVUIiaifZ+jZqaJHT6keJ0Dgp
	 0RGokMokLdeYA==
X-Pm-Submission-Id: 4fNXgy2jkvz2SdyT
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Sat, 28 Feb 2026 18:46:23 +0100
Subject: [PATCH] arm64: dts: qcom: x1e80100-dell-xps13-9345: enable onboard
 accelerometers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-dell-xps-9345-accel-v1-1-daf9e3b3b5ee@vinarskis.com>
X-B4-Tracking: v=1; b=H4sIAO4po2kC/x3MTQqAIBBA4avErBuwyX6vEi1MpxqQCoUQorsnL
 b/Few9EDsIRxuKBwLdEOY+MqizA7ubYGMVlAylqFVGPjr3HdEUcat2gsZY9arNoxW6wPXWQyyv
 wKum/TvP7fgrb2eVlAAAA
X-Change-ID: 20260228-dell-xps-9345-accel-4ab40ed9c827
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: laurentiu.tudor1@dell.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5116; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=upM5bB7sMn/Bn9Wg0AfAFftRp/cOqqhtEvvqO8KjEw0=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDJmLtfhmyTwrZI/+uch8vul8iaC1VZwxobGHtbcHvLiqf
 3jfkv07O0pZGMS4GGTFFFm6/3xN61o0dy3DdY1vMHNYmUCGMHBxCsBEvi5mZFh0qzi/2/CV2ow7
 pSu/vcuZ3tj0IeF1z8T+f89Ca9K2T0tjZHgx37ws0nmN1bb1B6S4bhxltS5//u5xWZdzaY9PV0t
 nJB8A
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[vinarskis.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[vinarskis.com:s=protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-94629-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[vinarskis.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.18:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@vinarskis.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gnome.org:url,vinarskis.com:mid,vinarskis.com:dkim,vinarskis.com:email]
X-Rspamd-Queue-Id: 688601C76EB
X-Rspamd-Action: no action

Particular laptop comes with two sets of sensors:
1. Motherboard: accelerometer
2. Display/Camera module: accelerometer, ambient ligth (and more)
   sensor

Define both i2c busses (bitbanged), sensors and respective rotation
matrices.

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
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index 4c95b1af2c64432967dc1e8b1d1c8bfe5a59cc34..42829a7e7c407add12560c75ede9bf02bcc0d9f8 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -40,6 +40,67 @@ switch-lid {
 		};
 	};
 
+	/* Display-mounted sensors */
+	i2c-sensors-display {
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
+	i2c-sensors-mobo {
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
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260228-dell-xps-9345-accel-4ab40ed9c827

Best regards,
-- 
Aleksandrs Vinarskis <alex@vinarskis.com>


