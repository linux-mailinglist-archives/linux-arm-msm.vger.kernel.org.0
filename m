Return-Path: <linux-arm-msm+bounces-87295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E412ACEFD1E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 10:00:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEF8C302E147
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 09:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BAD62F5A09;
	Sat,  3 Jan 2026 09:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQw4M+ev"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4F72F39CF;
	Sat,  3 Jan 2026 09:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767430838; cv=none; b=UziNIY399vXWqIncVxydL8QCCD7yVsYM/Sj4R6xRKcLgQCSfToS628xhvXsNCFGvVNJ+q1Z131VNGFzGAiE9OsL+ckBUbgmVvLyUYM45s8uvYDq8wY23/LmBXDO5dARz6KilfKKu48FwxgSkc6iV26vxV8q03UiEk5zu9d/820U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767430838; c=relaxed/simple;
	bh=sKfhtLzpUhGaaC91v1uir3a8OHSo2lBvqHfimsx2Au0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NyI+p88uMuW79aqLc3hwsacqqHAM4TiR+aOZjHiTXze9h0DpzkMm6kV/B0Zbe3rkYStI9pWXcqv6XVryAaIFImGZZKOrW0++hEjW6/h7eVIwC0bs9SgYkk+BB3K2CIIzBf4RdEoIcjsceCLM+s5tQ+SGuw0vfpElpkSdy2FltaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQw4M+ev; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7AAEC16AAE;
	Sat,  3 Jan 2026 09:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767430838;
	bh=sKfhtLzpUhGaaC91v1uir3a8OHSo2lBvqHfimsx2Au0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BQw4M+eveJo/C9Ki+bk6jcBCSBrSt9h1v/ZN7CMqzOXmw2XUsGnJnnbpNfeMKvQg+
	 4cUsuDrEPA+JIesYo3TJD4jSCeAT0o8HDMjB1LwLitjzCpzYGkkPwkLKQHJdKvbI0c
	 sBO1UUeFYKIGNhI8TLDE5xRQBzeXhvavIWRj8GkzugcTKrY/uQfR7iAaCH7shtGa2L
	 U9wM09bkvjLgTM5GnkxHYolh/VLGykwGAgTiG8IDjMuRMsbjSnrBH+7P8eFi0A36NC
	 1rVj1+AA0vjjPxnsPeM2+I3O7pEWwkes74gKhNhSFTFG/RLqWlATqMvxcog4jTzAYw
	 PAxGWN2EFhfag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7138FC617C;
	Sat,  3 Jan 2026 09:00:37 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 03 Jan 2026 10:00:24 +0100
Subject: [PATCH v2 2/2] arm64: dts: qcom: x1p42100-lenovo-thinkbook-16: add
 hdmi bridge with enable pin
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260103-tb16-hdmi-v2-2-92b0930fa82e@oldschoolsolutions.biz>
References: <20260103-tb16-hdmi-v2-0-92b0930fa82e@oldschoolsolutions.biz>
In-Reply-To: <20260103-tb16-hdmi-v2-0-92b0930fa82e@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767430836; l=3036;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=Fn6Y6Iaroanl56fohqh2G6S9QZFMHlCGJtymrsxNGH4=;
 b=Lub8dXW86feYnaxRIXMKLvr7iHFiaF2R1C4plOgyYoPaQXst8W5PtUeG8IKujhGSeQClmuadV
 dSoUDHctxiXCjrQUkzv0iSRn09ElKdbWuLnPg3/6Pomw8MB6M0FiNyP
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Add TLMM 120 for hdmi bridge enable.
In general this is the same setup as on the T14s. Since its using simple-bridge
and also is Lenovo, we also use the same realtek,rtd2171 compatible.
The real chip identity is not known yet. The bridge is wired with un-swapped
lanes, though.

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
index b4a40904f0a01b36ff2fc72e801a5fe7d6971e2a..1e5eb8c5dc988c3c4655f0019e53fc19e0884e4e 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
@@ -78,6 +78,47 @@ camera {
 		vdd-supply = <&vreg_cam_5p0>;
 	};
 
+	hdmi-bridge {
+		compatible = "realtek,rtd2171";
+
+		enable-gpios = <&tlmm 120 GPIO_ACTIVE_HIGH>;
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
+		pins = "gpio120";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-down;
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
@@ -1573,6 +1635,32 @@ &usb_1_ss2_hsphy {
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



