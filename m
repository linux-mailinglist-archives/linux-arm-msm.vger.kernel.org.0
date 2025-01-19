Return-Path: <linux-arm-msm+bounces-45517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3880A1624A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 15:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 155A83A5C24
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 14:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D31F1DF254;
	Sun, 19 Jan 2025 14:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TEkkyN31"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA3C19E967;
	Sun, 19 Jan 2025 14:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737298256; cv=none; b=hNdLb2L3qP5HalpWa21ocYSu7/cUJYLx964P355S5YogY+FjzF1Gtkvkw11LJ4dV/rsqslhSNlm3fr4LOPhSy/a957P0f0shMWrXnw6E+VY0THvppCX1InDNaXCIMnIGaLCULHe/Kb9m044EDESJnEocW8LA4Uh6XvJ+VuZDlyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737298256; c=relaxed/simple;
	bh=FAYG5b65m7C2q/5T4+WU8WSDz8J3TLJWqWDUEBUC91I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VStrmoSQ6Ugzeximutq3TAJA342F5YGoM0CtGlkgWA8064/Qx+RzU7krUQqGFcJ1KZUDhfWYRUJ98WO+3pQ5i7wbrqUoQyVlkRPump5caFaCCTukKWWCtXLeycD8BFWOlwpIRtTVkv4E8HPcoC+uAuDxsrZWiA/Ag9KGNGJN/0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TEkkyN31; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 631FBC4CEE0;
	Sun, 19 Jan 2025 14:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737298256;
	bh=FAYG5b65m7C2q/5T4+WU8WSDz8J3TLJWqWDUEBUC91I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TEkkyN31niknrYfZXsefov/1vn0Cb6f5noXcQgEwtIKFBPHJTKL6TomgMwvbFn1F+
	 /fRS1scv9mHH5uF9chn2ya+ygKlSw6+w+hoPwocDOby1WdHGH2HPFWF/6vIszieBmV
	 V2oHi3RL0VS6z5juwKvWHiL+gaW60LB8OQZNNt/gmkU7BCXGQWhPMmYIiemZbB/bLY
	 t/uKEWqsZIBfyodtlWAANxgxFB2cGJMS+0bpgvzKpxvFwc8zJthNTtARKo6mwEywnO
	 UizY1OcQTzZotlc4cBwihGnn/8NUsPLlqrm4/syQmrfn8i8VShYOpxPPFV6T8KcVpu
	 Nlxj2/T9ct0vQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55581C0218B;
	Sun, 19 Jan 2025 14:50:56 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sun, 19 Jan 2025 15:50:52 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: x1e80100-vivobook-s15: Enable
 micro-sd card reader
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250119-usb_a_micro_sd-v1-2-01eb7502ae05@hotmail.com>
References: <20250119-usb_a_micro_sd-v1-0-01eb7502ae05@hotmail.com>
In-Reply-To: <20250119-usb_a_micro_sd-v1-0-01eb7502ae05@hotmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737298255; l=1805;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=qEagHCN4mp21iK7xTZ9rdbXZ95q3ftiIVYE+wWP/Qys=;
 b=mRJxbTQ8UQcOnifr4c0sNJ1GMXjvTA8gQs78OsAvmkTEWPbKTcgqhafeEaHusblvuEiGlfGDs
 P8ZZWl3jTh3CORgC+JAoXa7bCIkJuzZ2GCKOrDNhlW0soF/ERKS17Dg
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

From: Maud Spierings <maud_spierings@hotmail.com>

The asus vivobook s15 has a micro-sd card reader attached to usb_2.

Enable usb_2 to enable this reader.

Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index b66d03ee3ff30561e8665be6ad34919f89a79572..fb9567817be6f887c9214cafbfbabda8b8cb8203 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -422,6 +422,20 @@ keyboard@3a {
 		wakeup-source;
 	};
 
+	eusb5_repeater: redriver@43 {
+		compatible = "nxp,ptn3222";
+		reg = <0x43>;
+		#phy-cells = <0>;
+
+		vdd3v3-supply = <&vreg_l13b_3p0>;
+		vdd1v8-supply = <&vreg_l4b_1p8>;
+
+		reset-gpios = <&tlmm 7 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&eusb5_reset_n>;
+		pinctrl-names = "default";
+	};
+
 	eusb3_repeater: redriver@47 {
 		compatible = "nxp,ptn3222";
 		reg = <0x47>;
@@ -620,6 +634,14 @@ eusb3_reset_n: eusb3-reset-n-state {
 		output-low;
 	};
 
+	eusb5_reset_n: eusb5-reset-n-state {
+		pins = "gpio7";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+		output-low;
+	};
+
 	eusb6_reset_n: eusb6-reset-n-state {
 		pins = "gpio184";
 		function = "gpio";
@@ -764,6 +786,23 @@ &usb_1_ss1_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss1_ss_in>;
 };
 
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_dwc3 {
+	dr_mode = "host";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&vreg_l2e_0p8>;
+	vdda12-supply = <&vreg_l3e_1p2>;
+
+	phys = <&eusb5_repeater>;
+
+	status = "okay";
+};
+
 &usb_mp {
 	status = "okay";
 };

-- 
2.47.1



