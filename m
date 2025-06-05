Return-Path: <linux-arm-msm+bounces-60425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4BFACFA06
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 01:39:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E41E47A49D2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 23:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A92218E96;
	Thu,  5 Jun 2025 23:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kkKbWZw0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AFF1A0BF1;
	Thu,  5 Jun 2025 23:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749166759; cv=none; b=rIfv8VvMbBtiIYvvUFvSKgeXxqETwizt28VdD/wqi99IUdpY/V/0gqlIjG+ORNhO4CZGgRUSSsOlBGBIgF70gNMSa5l4rxR41/oDHGRO+VPNbE53kexPOQBPTl/EHQmgbcgTXfy077yMvKSHMuuOCfUhNarFHRqCNJAMoVW45TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749166759; c=relaxed/simple;
	bh=pwrAY09O/aAtNTkahD7MpCJKuzILXIsGsMhzQcXLruo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=diXB966hCUU7vHhq41WKWcwPGi4w9vgypQg6sjLjk0Tmca3zQd12e+1ytq2aygbT+vRkmvP5Vs/K++ZbRIPoS13OcNA19iYS01lpfo3jGVUC/KVzMqGhrIjnwCRBmUGt0GbaI/w6Wp13739t7bUzdEeno2LXMxYQ97lA4Bm+e+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kkKbWZw0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D790C4CEE7;
	Thu,  5 Jun 2025 23:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749166759;
	bh=pwrAY09O/aAtNTkahD7MpCJKuzILXIsGsMhzQcXLruo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=kkKbWZw0zfsKAoC3VkQJNp+kaitbKbsuYKo+BZcm32nQ2irytZBvIyy/MVJPs0dAZ
	 glu9rZVmKeuad6WZDV4gX86agMvBw5Lvsyd6B4DQsom2gJbVdJQxKOpl4n41ZsPdLE
	 S+i5RFbH+ffyUcCPGZfGM/xY/cAaswuA8DINtJ0KXcdUFVEymCnCrDFQ0HA4K/26C2
	 qtnSFVwcP+iyWOLjp8q9AgWTojKcToN0No4cNZ7Og2VB4aubja1Wd5u26wGzxhrlov
	 ZwdtXTxBwpvSyZx0VO/hSNLIQdOeyT+nrHbsK4UYuXUHH6FNGEkE6EYPk3xLLTLKic
	 Bk4gaU5ds8JMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C103C5AE59;
	Thu,  5 Jun 2025 23:39:19 +0000 (UTC)
From: Bjorn Andersson via B4 Relay <devnull+bjorn.andersson.oss.qualcomm.com@kernel.org>
Date: Thu, 05 Jun 2025 18:39:15 -0500
Subject: [PATCH v2] arm64: dts: qcom: x1e80100-dell-xps13-9345: Enable
 fingerprint sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-xps13-fingerprint-v2-1-eebf84c172f2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKIqQmgC/32NQQ6CMBREr0L+2pL2A0FdeQ/DokArPxFa+7HBk
 N7dygHcTPJmMjM7sAlkGK7FDsFEYnJLBjwVMEx6eRhBY2ZAiY2s1FlsnlUlLOUo+EDLKnRre4P
 tBQesIfd8MJa2Y/PeZZ6IVxc+x0VUP/ffWlRCCtv3EsdGV7Vub465fL31c3DzXGaBLqX0BeDbS
 dW5AAAA
X-Change-ID: 20250318-xps13-fingerprint-a7fbe2792c24
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stefan Schmidt <stefan.schmidt@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749166756; l=2975;
 i=bjorn.andersson@oss.qualcomm.com; s=20250318; h=from:subject:message-id;
 bh=cXvpolOc6keIT4UycbiSGZLQJu7kB1ZjcH77QsH5mFo=;
 b=aXdAhx3x9FYmYnIuafyUUIhxpHuHRyAlSog73sFZChFlEKf6oUHwhTrIVg34SFuPBBzzIufMF
 Q6mljzBzU6hBX/o+pZs5vdJGcG4wLLzvaEBmJ4RV+lFU7iGAAYXomdV
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=rD3O9C9Erg+mUPBRBNw91AGaIaDVqquHZbnn6N6xh6s=
X-Endpoint-Received: by B4 Relay for
 bjorn.andersson@oss.qualcomm.com/20250318 with auth_id=362
X-Original-From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Reply-To: bjorn.andersson@oss.qualcomm.com

From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

The fingerprint sensor, hidden in the power button, is connected to one
of the USB multiport ports; while the other port is unused.

Describe the USB controller, the four phys and the repeater involved to
make the fingerprint sensor operational.

Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Changes in v2:
- Dropped patch 1, as an equivalent patch was merged separately
- Moved repeater to other multiport port (per review suggestion)
- Link to v1: https://lore.kernel.org/r/20250318-xps13-fingerprint-v1-0-fbb02d5a34a7@oss.qualcomm.com
---
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     | 59 +++++++++++++++++++++-
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index 967f6dba0878b51a985fd7c9570b8c4e71afe57d..a98254e486dbc7aef1aced34690382950cb3e231 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -744,8 +744,21 @@ touchscreen@10 {
 
 &i2c9 {
 	clock-frequency = <400000>;
-	status = "disabled";
-	/* USB3 retimer device @0x4f */
+	status = "okay";
+
+	eusb6_repeater: redriver@4f {
+		compatible = "nxp,ptn3222";
+		reg = <0x4f>;
+		#phy-cells = <0>;
+
+		vdd3v3-supply = <&vreg_l13b_3p0>;
+		vdd1v8-supply = <&vreg_l4b_1p8>;
+
+		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&eusb6_reset_n>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c17 {
@@ -967,6 +980,14 @@ edp_reg_en: edp-reg-en-state {
 		bias-disable;
 	};
 
+	eusb6_reset_n: eusb6-reset-n-state {
+		pins = "gpio184";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
 	hall_int_n_default: hall-int-n-state {
 		pins = "gpio92";
 		function = "gpio";
@@ -1172,3 +1193,37 @@ &usb_1_ss1_dwc3_hs {
 &usb_1_ss1_qmpphy_out {
 	remote-endpoint = <&retimer_ss1_ss_in>;
 };
+
+&usb_mp {
+	status = "okay";
+};
+
+&usb_mp_hsphy0 {
+	vdd-supply = <&vreg_l2e_0p8>;
+	vdda12-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
+&usb_mp_hsphy1 {
+	vdd-supply = <&vreg_l2e_0p8>;
+	vdda12-supply = <&vreg_l3e_1p2>;
+
+	phys = <&eusb6_repeater>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy0 {
+	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-pll-supply = <&vreg_l3c_0p9>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy1 {
+	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-pll-supply = <&vreg_l3c_0p9>;
+
+	status = "okay";
+};

---
base-commit: 4f27f06ec12190c7c62c722e99ab6243dea81a94
change-id: 20250318-xps13-fingerprint-a7fbe2792c24

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>



