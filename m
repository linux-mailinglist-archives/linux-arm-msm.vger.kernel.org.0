Return-Path: <linux-arm-msm+bounces-51886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D868A683AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 04:23:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 263927A381B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 03:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F7724E4B0;
	Wed, 19 Mar 2025 03:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aXZaKHMu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42438524F;
	Wed, 19 Mar 2025 03:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742354577; cv=none; b=Kb8kOpinNg3rtZwiSlTm9k0PkSeQl/NFzUVV8hFtG20Obf0P2Kn7+P+eksD42bR2EB/XP30Y/7r9EdCjpMqnkN1PQMMTADtuJtQnQHW9Hu99aRrMCPyRdkJVpvR5LdXP2Azy6Kga8g/rXnuzedjq0WZwFm6CTBK2hGXuL+0jdnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742354577; c=relaxed/simple;
	bh=A+qGhWclSTQgJLfO6HsVTrl9lT2YLZYjDUmxW1OxdLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gOKdiXTkH1qXXJe4iAjo6LI02w5uviOEVkMVNDag9ZmAos2/6yG5x/cVDvimpIQL+mxTpf+b2Qki92rzJM/NU0PoXNV3027ClCKw5s1v2OQPaYTl02IQkuVQo0/XI5a6vze+e8zWWHEJ2bw3Btyem7j84ENaBJoJ4zM2w8/C9is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aXZaKHMu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4540C4CEF1;
	Wed, 19 Mar 2025 03:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742354576;
	bh=A+qGhWclSTQgJLfO6HsVTrl9lT2YLZYjDUmxW1OxdLg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aXZaKHMuPh9SMOMyJIU2qNcHonFUYFKzCoruEMpmgJwGko0OmlQArTa1+Mu5aLN/Y
	 Zn89NaWXrjH97f7ByzqXzxQ4vggEpOUA1xIIKJLP7e5iTdEPS5qUtSnAkti3sBbWBK
	 wuSHMaQu9XDZQmzNP1cdASBObYl4mXvxuIGGXANwQy4VowdFqDiSOad3uVjWNAKZJk
	 6zyVxWNYtemH3hGqGTX7U7FD+rMKPNMk//hEQUyenYQ5Y4+o+gqxQGrOqVP4xqXP0h
	 ajhZNbnBVg0FhHUs6AGYmG7PyWEhsXiPm+QvfA+tS5s49Aq0T3JMq6waP30dxc/IhE
	 EMcxKoQv+JIKA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA79DC35FF3;
	Wed, 19 Mar 2025 03:22:56 +0000 (UTC)
From: Bjorn Andersson via B4 Relay <devnull+bjorn.andersson.oss.qualcomm.com@kernel.org>
Date: Tue, 18 Mar 2025 22:22:57 -0500
Subject: [PATCH 2/2] arm64: dts: qcom: x1e80100-dell-xps13-9345: Enable
 fingerprint sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-xps13-fingerprint-v1-2-fbb02d5a34a7@oss.qualcomm.com>
References: <20250318-xps13-fingerprint-v1-0-fbb02d5a34a7@oss.qualcomm.com>
In-Reply-To: <20250318-xps13-fingerprint-v1-0-fbb02d5a34a7@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742354576; l=2311;
 i=bjorn.andersson@oss.qualcomm.com; s=20250318; h=from:subject:message-id;
 bh=KSwrj8xKMzxf6ypfNwkySkK2Q48YHl4Qf210H7WoC74=;
 b=p4E23SmrYTjT4d3hpFlI9Hk/U1ZFSFLDMzYhgP7g98WcIrxdMTwAnsDGcJ40o5WVDjwTVMyUa
 6UAUGhcdcoIAE2ziNSxH2EgRJa/qBXHOdwBBpylHI6W8+1DTAxn2zBS
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

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     | 59 +++++++++++++++++++++-
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index 967f6dba0878b51a985fd7c9570b8c4e71afe57d..a35557c562d771e2ce209fca05b82c1943d70f63 100644
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
+	phys = <&eusb6_repeater>;
+
+	status = "okay";
+};
+
+&usb_mp_hsphy1 {
+	vdd-supply = <&vreg_l2e_0p8>;
+	vdda12-supply = <&vreg_l3e_1p2>;
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

-- 
2.48.1



