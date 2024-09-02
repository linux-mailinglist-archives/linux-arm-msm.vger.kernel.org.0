Return-Path: <linux-arm-msm+bounces-30402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E075968A4D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 16:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDEE4B23052
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 14:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114A92101AF;
	Mon,  2 Sep 2024 14:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t9HcNADd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EB11A263C;
	Mon,  2 Sep 2024 14:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725288647; cv=none; b=JWU8CCvH4xSaGYpAmmZbJd2fOBCkZOBAH6wxugzK0iBD5wjIlaevnLQPHsBKXTyxZwRWUU6t8sX7AyQA331tsE+0fc7CoznVZ79fhI00518MP/GOB9ZafpeEmieMitl3B8EEhU2ld9ixPHU6tMPFjxGJmtyS75368Fc7F2Zz6QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725288647; c=relaxed/simple;
	bh=3PbIDbYxO9K6PuPo6xzWP3ATC90/zS9q5o6YWlTOa3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FAOkEw/sa0HQHFQW4PbFCCYILZyuE4fvzgGYLFvAqWUSp8isRXHj/Y2NQvcoAYJxYNFLnY0M5WkitcGXdv+8lmgu3SNSV2nQ/jlETDSpr6j9l6cO1Pv7JFs/fS9uMt442vZH8g16wku+jdO/cLhdtZriJlD7PH/Vkd6Zr0TWhsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t9HcNADd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D8AC4CEC8;
	Mon,  2 Sep 2024 14:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725288646;
	bh=3PbIDbYxO9K6PuPo6xzWP3ATC90/zS9q5o6YWlTOa3s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=t9HcNADdZRENX9wPInf/RR7TIFxc4tYHqAhEz3bLpl4a9VqgLAh/OEOaqmjc2WKbU
	 93r3LKCeijBUtipmINbeBw5cjB9ChpTlHs0zv1HEj3BZVAE3tZQ2I/JtyEgYGuqF3P
	 QYH74+J/5QNHsV6E6KfSsqFdZLCOaiyQvCnFa2D9lfldpkbMMCoxZYwvGdqNdCXt4p
	 4eqRSAPQjQtKOa1qT0vi0/GJEVZ74+s8BFX+veDW2/cpuGs7Z12WorP6jqP4eSNTCm
	 uN7NX2lLT/I3jTMJgYyIBfnhR/TA+O6ji7Lw6oInjA8+9r61fr2C5Uq7iY0Hq9O/IQ
	 0XZik5vexdpow==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 02 Sep 2024 16:50:34 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: x1e80100-romulus: Set up USB
 Multiport controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240902-topic-sl7_updates-v1-2-3ee667e6652d@quicinc.com>
References: <20240902-topic-sl7_updates-v1-0-3ee667e6652d@quicinc.com>
In-Reply-To: <20240902-topic-sl7_updates-v1-0-3ee667e6652d@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>, 
 20240830-nxp-ptn3222-v2-0-4c6d8535cf6c@linaro.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725288635; l=2200;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=+2FgctR0c+GxQ6JKbJJVixux86lxHv6P5NiKLaCF4eo=;
 b=kJQnnjk6F4VWqJKMGMb4DQVCq6CoBC+U9Z6ocVK2Pl0G+yMQBvH94sPcvFTC+cpDsC4CUGO/r
 HQqFu2YSKrTCxFWFXOfRhYjr3LHCozNxcNOxWeimO4UprFl8Kh2bPgp
X-Developer-Key: i=quic_kdybcio@quicinc.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <quic_kdybcio@quicinc.com>

The USB MP controller is wired up to the USB-A port on the left side
and to the Surface Connector on the right side. Configure it.

While at it, remove a stray double \n.

Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
---
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  | 59 +++++++++++++++++++++-
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 5419d0b02785..ac2acf949b70 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -572,7 +572,17 @@ &i2c5 {
 
 	status = "okay";
 
-	/* Something @4f */
+	ptn3222: redriver@4f {
+		compatible = "nxp,ptn3222";
+		reg = <0x4f>;
+
+		reset-gpios = <&tlmm 7 GPIO_ACTIVE_LOW>;
+
+		vdd3v3-supply = <&vreg_l13b>;
+		vdd1v8-supply = <&vreg_l4b>;
+
+		#phy-cells = <0>;
+	};
 };
 
 &i2c7 {
@@ -583,7 +593,6 @@ &i2c7 {
 	/* PS8830 USB retimer @8 */
 };
 
-
 &mdss {
 	status = "okay";
 };
@@ -717,6 +726,15 @@ &smb2360_1_eusb2_repeater {
 	vdd3-supply = <&vreg_l14b>;
 };
 
+&smb2360_2 {
+	status = "okay";
+};
+
+&smb2360_2_eusb2_repeater {
+	vdd18-supply = <&vreg_l3d>;
+	vdd3-supply = <&vreg_l8b>;
+};
+
 &tlmm {
 	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
@@ -856,3 +874,40 @@ &usb_1_ss1_dwc3_hs {
 &usb_1_ss1_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss1_ss_in>;
 };
+
+/* MP0 goes to the Surface Connector, MP1 goes to the USB-A port */
+&usb_mp {
+	status = "okay";
+};
+
+&usb_mp_hsphy0 {
+	vdd-supply = <&vreg_l2e>;
+	vdda12-supply = <&vreg_l2j>;
+
+	phys = <&smb2360_2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_mp_hsphy1 {
+	vdd-supply = <&vreg_l2e>;
+	vdda12-supply = <&vreg_l2j>;
+
+	phys = <&ptn3222>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy0 {
+	vdda-phy-supply = <&vreg_l3e>;
+	vdda-pll-supply = <&vreg_l3c>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy1 {
+	vdda-phy-supply = <&vreg_l3e>;
+	vdda-pll-supply = <&vreg_l3c>;
+
+	status = "okay";
+};

-- 
2.46.0


