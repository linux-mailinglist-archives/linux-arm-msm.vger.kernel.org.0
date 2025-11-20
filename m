Return-Path: <linux-arm-msm+bounces-82624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 41022C728DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 08:17:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5EDE334720E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 07:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CDCD303CA1;
	Thu, 20 Nov 2025 07:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hs/+szAS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC53B30148C;
	Thu, 20 Nov 2025 07:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763622886; cv=none; b=svmJ0pj37Eb455xXym6EKFlttvZbUklsDKtXVMftg55pXqitylInrbfoRjBYcft51fJ+n8QNISOLLVBqq3QHxpR0Eavut77xHHJVf1/A2IgpZhqusoatuprcL0pnd1LVGz+Y5UXQ2DRRFBHpdt5rDG+c4LyaYnYO90eiYVT9on8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763622886; c=relaxed/simple;
	bh=wUMRIieLBzIE+aqveirvwxw8A0WjFHGTrrZtssRY0JM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PW1iRoL3X4Uv057lQGvgYbkhcoF0KjHL88sJl0TaQ/VpI3YtgIccGsdyw9vqAZ8NiHz4WYEpX442JtlViW7vKovwM1G9SSssvzAHV++tPXK2qC9QCVJNBmxLuLUxeBJ6FtMwbo4/sQKCgPGet9NFwCFQKQmUJERrNlEull/DqII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hs/+szAS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E917C116C6;
	Thu, 20 Nov 2025 07:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763622885;
	bh=wUMRIieLBzIE+aqveirvwxw8A0WjFHGTrrZtssRY0JM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hs/+szASjUy0ULfQsjWLdFIGxKMiZQb8+UUkVSaR+XvPS8OzejSci3QSarOGL66QV
	 rVY1swcpTuEOTHculcexyHFu0HYAR7dIpCrkJTblzSw3t+CmpRPT1QSy84YuJiWfD9
	 GMbeahOe2/Gq+K3/wYc/Z9/GkPjKMI3CLEnMHmFOcXJEaLP334TPukwM+2c3SzCfBX
	 3okYSJwNtb2cjEmHEUsXq8lqxFHsozPREO9ZtCmpwyByf3r8ZHJGGe4XufBJeS7Rr/
	 7abIKASaH0LwIWefzrs4XV+93HgqgT5whNT65+PIFil1sQPhPtGc/mR5PKbLb+DVS8
	 Krk31k4XvfRmQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97561CF854A;
	Thu, 20 Nov 2025 07:14:45 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Wed, 19 Nov 2025 23:14:43 -0800
Subject: [PATCH 2/4] ARM: dts: qcom: msm8960: expressatt: Add NFC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-expressatt_nfc_accel_magn_light-v1-2-636f16f05cf4@gmail.com>
References: <20251119-expressatt_nfc_accel_magn_light-v1-0-636f16f05cf4@gmail.com>
In-Reply-To: <20251119-expressatt_nfc_accel_magn_light-v1-0-636f16f05cf4@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763622884; l=1981;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=dhcYn18NjnrjN7FHJSqZT3TzBPkLXU1vzgXpjYyunrU=;
 b=zPt4+IsQkN5byXW7pHQhBS4whiJSKUQi6rLSi45YJogrIksS4H0sZyVYFOQcTa5G5HYb4JODs
 F3P+jp3pQ7pBhN3Xhi411EGaxsgZ8wANu4PjI9Wme/u5humWLQg6SUh
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com

From: Rudraksha Gupta <guptarud@gmail.com>

Add pn544 NFC chip

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index 1e331a046e7b..81806d7ca001 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -77,6 +77,27 @@ light-sensor@39 {
 			pinctrl-0 = <&prox_sensor_int>;
 		};
 	};
+
+	i2c-gpio-nfc {
+		compatible = "i2c-gpio";
+		sda-gpios = <&tlmm 32 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&tlmm 33 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <5>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		nfc@2b {
+			compatible = "nxp,pn544-i2c";
+			reg = <0x2b>;
+			interrupt-parent = <&tlmm>;
+			interrupts = <106 IRQ_TYPE_EDGE_RISING>;
+			enable-gpios = <&pm8921_gpio 21 GPIO_ACTIVE_HIGH>;
+			firmware-gpios = <&tlmm 92 GPIO_ACTIVE_HIGH>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&nfc_default &nfc_enable>;
+		};
+	};
 };
 
 &gsbi5 {
@@ -182,6 +203,22 @@ touchscreen: touchscreen-int-state {
 		bias-disable;
 		drive-strength = <2>;
 	};
+
+	nfc_default: nfc-default-state {
+		irq-pins {
+			pins = "gpio106";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		firmware-pins {
+			pins = "gpio92";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
 };
 
 &pm8921 {
@@ -195,6 +232,15 @@ prox_sensor_int: prox-sensor-int-state {
 		input-enable;
 		bias-disable;
 	};
+
+	nfc_enable: nfc-enable-state {
+		pins = "gpio21";
+		function = "normal";
+		output-low;
+		bias-disable;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+		power-source = <PM8921_GPIO_S4>;
+	};
 };
 
 &rpm {

-- 
2.51.2



