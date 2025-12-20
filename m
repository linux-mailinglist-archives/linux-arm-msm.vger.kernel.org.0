Return-Path: <linux-arm-msm+bounces-86047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD7BCD34A0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 18:47:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 181DC3011A60
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 17:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C732830C61B;
	Sat, 20 Dec 2025 17:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R1I2U7hM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9766223AE62;
	Sat, 20 Dec 2025 17:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766252836; cv=none; b=O7JeGbwHSKKeHt8EUyuULFivsI1jJMX/zNjSo5DQFiCAqKA9qYtSmuykCEjK1zSdUnYVtzFsu4I3qD2qKhfY7M0iVMjxClyKhdfUSRUCK+wBZIk6bwRTRwnc8Ow/TpkIFru2lMFjKgqFE550ic+8q7NimZ1BZeYSNLT5lQasusY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766252836; c=relaxed/simple;
	bh=zs58iPHc9dVMILZf+f0sXG/xtW4XWxiXDfAKslwS8p8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t2AHO9vwo0oL0CEBnJsbqLN89jhRthAMNltnhTPnu0V01gyhB11AiK8XU9FVTMJ7Hw7TcKm+Q6WbSk5Hua7O3+4+dZxMmZ0tKw3tEVi7QxC8GV6wKi4EbGwHctf+5NKSPhoFZmtOCePghMSmUhpuR5NqdKzIdVgrpfGL7KLdOPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R1I2U7hM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22B1FC116C6;
	Sat, 20 Dec 2025 17:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766252836;
	bh=zs58iPHc9dVMILZf+f0sXG/xtW4XWxiXDfAKslwS8p8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=R1I2U7hMNmhZJgXE+D/aTsAEyhNhq3dlnetcA9wwFJ5RjWpUTulxqywso81eSSIEO
	 7ttJ/7g/3o85oQOa2+hZLqbZ75n7cZrYSS0kgu/ELfJc4gTgGb6JSp1QWkFcVl2Sre
	 luFqSDd8Nxm59syaKeZ+UuVX9yGlXh60fR03hU815KB/xk9/mXAi658GDASMNhzj8Y
	 cF1GtruB9m+Vapb5InWhuZqH9PaiqDfNn4iOubHSaV8EDxWsu2uqpNk+DdyvXyUHTS
	 jBz+v1Fldzw4YCAL7aJrKwSRF6TfUD5cK6VxUmwvyXJTu4CArPp/erfU9FY3MSHxap
	 RU1KvVRdYeNPg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD45E668B4;
	Sat, 20 Dec 2025 17:47:16 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 20 Dec 2025 18:47:10 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: x1p42100-lenovo-thinkbook-16: add
 hdmi bridge with enable pin
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251220-tb16-hdmi-v1-2-18b1e20b396e@oldschoolsolutions.biz>
References: <20251220-tb16-hdmi-v1-0-18b1e20b396e@oldschoolsolutions.biz>
In-Reply-To: <20251220-tb16-hdmi-v1-0-18b1e20b396e@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766252834; l=3182;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=G6F6G3AffDaqVvF/PzUgapReH3Uv+q5DJWksfE18o8U=;
 b=2qSiY6qbhNn9vDJLCu36cyhlYfB41DU45Lq9nZfDS0i2IoiFrnuKgYqhWEdg61nY2tPkfaWG8
 im/8Yb8+UDiAIky8PoWdVHFvezMZUVa4ifWaPaQFmI8w+2ei/SRWhS/
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Add TLMM 119 for hdmi bridge enable. AeoB has this gpio.
In general this is the same setup as on the T14s. Since its using simple-bridge
and also is Lenovo, we also use the same realtek,rtd2171 compatible.
The real chip identity is not known yet. The bridge is wired with un-swapped
lanes, though.

As for gpio119 being used twice: It doesn't work if you don't, so it may be a case
of TLMM multiplexing hpd for both ports.

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
index b505a4cbb4350a962bbf779ec788265c7583bf20..80172f3059a42c8656eb682682495194015d3bbc 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
@@ -78,6 +78,47 @@ camera {
 		vdd-supply = <&vreg_cam_5p0>;
 	};
 
+	hdmi-bridge {
+		compatible = "realtek,rtd2171";
+
+		enable-gpios = <&tlmm 119 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&hdmi_hpd_default>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hdmi_bridge_dp_in: endpoint {
+					remote-endpoint = <&usb_1_ss2_qmpphy_out_dp>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				hdmi_bridge_tmds_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&hdmi_bridge_tmds_out>;
+			};
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -1038,6 +1079,14 @@ &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
+&mdss_dp2 {
+	status = "okay";
+};
+
+&mdss_dp2_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
@@ -1327,6 +1376,19 @@ hall_int_n_default: hall-int-n-state {
 		bias-disable;
 	};
 
+	hdmi_bridge_en: hdmi-bridge-en-state {
+		pins = "gpio119";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	hdmi_hpd_default: hdmi-hpd-default-state {
+		pins = "gpio126";
+		function = "usb2_dp";
+		bias-disable;
+	};
+
 	kybd_default: kybd-default-state {
 		pins = "gpio67";
 		function = "gpio";
@@ -1585,6 +1647,32 @@ &usb_1_ss2_hsphy {
 	status = "okay";
 };
 
+&usb_1_ss2_qmpphy {
+	vdda-phy-supply = <&vreg_l2j_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p9>;
+
+	/delete-property/ mode-switch;
+	/delete-property/ orientation-switch;
+
+	status = "okay";
+
+	ports {
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/delete-node/ endpoint;
+
+			usb_1_ss2_qmpphy_out_dp: endpoint@0 {
+				reg = <0>;
+
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&hdmi_bridge_dp_in>;
+			};
+		};
+	};
+};
+
 &usb_2 {
 	status = "okay";
 };

-- 
2.51.0



