Return-Path: <linux-arm-msm+bounces-89407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6796BD320B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 14:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF462302684D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 13:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C5229B217;
	Fri, 16 Jan 2026 13:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="a8Ot9dIt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BDE285C9F
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 13:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768570747; cv=none; b=LH8FpKjkr66oTvx0jEjRLRhz5Vz1UTFO47FH/0Z/b/bFWz0pV3isBStX/FrUy79bHVED6vLBjo/mZ38eMJt9HZFlxAYjWE+H1X7ciwQQxMAA6m0Z5bstKWbACGX/uEPnufQ2fYTBGnFmYe0VrOODHlBVRRODIya5JtdTx5QKW2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768570747; c=relaxed/simple;
	bh=Yfgai6qrSyDXbvMaMx6loOe5siBb8JOHwHrZfKdrvlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S1YmovA9KqEBrWW8aOQQf3AY3DH8icVsmBkG7Zw+xkLnbq2vX1SOt5keLkt+NeUF22+JlcI+k+AjxARuGuhMb/2Wgad5U87X6CTGK8ktgO1XwUzob/M8E94iAsEzEdJ2Ps2F5hNKOCPjRHgM4ERKBVUN+J+IJANGC6BLGPowLtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=a8Ot9dIt; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64d0d41404cso3541098a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 05:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768570742; x=1769175542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFtWGQ/w1VbvTfYtd/DEEFUO+JH6omnfD+nhpdXLZhg=;
        b=a8Ot9dItvvgfVGEXn88uIBF6Jsp/45Fi1NAaczeTgNGCgvDQaGa8bV0k56xoEqHRoH
         p8jpyrHrkCLpxnHSRrDWCxAwi7uLXUBE24GyJZn+5ZLtw9YdPy96QRlK+6nqp4/2LE0s
         IfGvzqIPa+uJ5SFbNQSNgjGa08OI09H5mEUCMuZMXaXQLgojgeGuHgD34Zu1aefkoXKi
         YGLDpx/QDgjqJKF5480p7MpbdM5yfhGC+UuB8XJEuO0VhFbyCxgAECLANQssYCNpoCaL
         y3wa1kYrHjO5P0UIkFVEdPSYXgco8DqUw3fzxRTfCYG2qIa9qWQbs1mV5NFU8oiqtaj4
         SchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768570742; x=1769175542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oFtWGQ/w1VbvTfYtd/DEEFUO+JH6omnfD+nhpdXLZhg=;
        b=Ef2kLeWzrvanRGQEzIj9nwSTbIQORDyolNH6oIF06VdtodfqJ3rDDgOpamRlMEd60J
         ybpsi+/sPUcoZO0IvQz+8/nkeSoJBjsBiyWC8dijmGVstfsRlKK3eu107UCvhlj6Ks4D
         nymEphlOyHZGXtciw3yGLp7aiUdfwOuvAGo+MjfxAgx3szajQqk4vCZ8Dv63aRPcGzWh
         GMCaPlSiNpoSExyuBhUzHPFafD80TzikYrUo10fkyH3APZrGo5DwptHv8/RYZVnjuS3j
         i0VCRJR90ZSkXth7gxNSGxQaHQZxIS1Y03pqrbzlACssQXi6xmNVpWmulEF4vTp5naVC
         +RLw==
X-Forwarded-Encrypted: i=1; AJvYcCWBYb+fiZ8vyHvCrVzdwmEjO2zVCS3aFOhljh/o/li0MJ0wHQ8v/bafQ5atzCP04JaNXOpB6jFxFKzYSFau@vger.kernel.org
X-Gm-Message-State: AOJu0Yyim/tCPNAcWYNrpGwntzx53XY9vPK9/gFjCz2qNgnTMX9uvSnm
	9Xmpu6GpCfmMtW8+Dx73CVWNx95LaTyhgPjDow/KZFVeJTIeaGSMlTC4EI4U3u7D5eU=
X-Gm-Gg: AY/fxX7dfBHq/0PtX3pO7AcmQOcjIrIEm2YLqFnLFUxy5nhsEk46YGmxJaRxcoOmfyx
	WxeY1txM7SpcQS4Ku4Urq8gdHgKxW/hevjal9l800CI2n6ZTU/Xo0L9XzotDrBMgV5m5mV8nbkK
	EIbE+ef2rUZwk8GKhXhXpJsOkGxRF3DA0Qtps1OH3b5MWEF/TyEENXuMs6FZWT832GcW/p5X5RA
	T3bEsZNUb2Yb2/Zrbsw0bsGolI+qvv5G1NfPBlmMcdsqD9Tkuk81JgreQA/uCRR2Y0FwJIRr9iX
	i0KaeoHrLbGXPztwH+SpvH3ry8xOw1VS6ciaoR74vTlQOX14nlWuqap7BULBaRBlB1YmwoZQxOg
	2ZuFwi4EqgvVlLxSvpX9K+HkoGxCNCH0yYPa5FafYp8O9vTfZKJRj7fTzb4uA32MDVd1k8d9Ps3
	CfprP+n45D5TkfvT7nD8HsimRToxj8Ng2ScrIOaNE9xN7Akr3e1MwNImcBPqN1hqBV
X-Received: by 2002:a05:6402:e0a:b0:655:c2f7:9f37 with SMTP id 4fb4d7f45d1cf-655c2f7a01emr981543a12.2.1768570742461;
        Fri, 16 Jan 2026 05:39:02 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654534c8b7fsm2495528a12.27.2026.01.16.05.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 05:39:02 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Jan 2026 14:38:57 +0100
Subject: [PATCH 3/4] arm64: dts: qcom: milos: Add CCI busses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-milos-cci-v1-3-28e01128da9c@fairphone.com>
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
In-Reply-To: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768570739; l=5415;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Yfgai6qrSyDXbvMaMx6loOe5siBb8JOHwHrZfKdrvlc=;
 b=PlG90T1HaQ7oCDdUV+49GaybYGmN222ZTMKkMQRFhBG4axvFxsoJObUUAP15jmqi71hrFT7pm
 9LMqbh4vENpC4Nq7lCPXr7+2pxqeSL/RPs40ONy738CjJqVYPTohv+m
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the nodes and the pinctrl for the CCI I2C busses on the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 194 ++++++++++++++++++++++++++++++++++++
 1 file changed, 194 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 58b4c2966df1..c8771beffa9b 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1652,6 +1652,72 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci0: cci@ac15000 {
+			compatible = "qcom,milos-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac15000 0x0 0x1000>;
+			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING 0>;
+			power-domains = <&camcc CAM_CC_CAMSS_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "soc_ahb",
+				      "cpas_ahb",
+				      "cci";
+			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
+			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac16000 {
+			compatible = "qcom,milos-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac16000 0x0 0x1000>;
+			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING 0>;
+			power-domains = <&camcc CAM_CC_CAMSS_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "soc_ahb",
+				      "cpas_ahb",
+				      "cci";
+			pinctrl-0 = <&cci1_0_default &cci1_1_default>;
+			pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camcc: clock-controller@adb0000 {
 			compatible = "qcom,milos-camcc";
 			reg = <0x0 0x0adb0000 0x0 0x40000>;
@@ -1791,6 +1857,134 @@ tlmm: pinctrl@f100000 {
 
 			wakeup-parent = <&pdc>;
 
+			cci0_0_default: cci0-0-default-state {
+				sda-pins {
+					pins = "gpio88";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					pins = "gpio89";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			cci0_0_sleep: cci0-0-sleep-state {
+				sda-pins {
+					pins = "gpio88";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio89";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci0_1_default: cci0-1-default-state {
+				sda-pins {
+					pins = "gpio90";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					pins = "gpio91";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			cci0_1_sleep: cci0-1-sleep-state {
+				sda-pins {
+					pins = "gpio90";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio91";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_0_default: cci1-0-default-state {
+				sda-pins {
+					pins = "gpio92";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					pins = "gpio93";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			cci1_0_sleep: cci1-0-sleep-state {
+				sda-pins {
+					pins = "gpio92";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio93";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_1_default: cci1-1-default-state {
+				sda-pins {
+					pins = "gpio94";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					pins = "gpio95";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			cci1_1_sleep: cci1-1-sleep-state {
+				sda-pins {
+					pins = "gpio94";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio95";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio4", "gpio5";

-- 
2.52.0


