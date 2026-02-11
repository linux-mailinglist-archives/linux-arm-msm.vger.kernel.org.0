Return-Path: <linux-arm-msm+bounces-92532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OalNW/Ki2m4bAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 01:16:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEDE12040B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 01:16:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D93D5300BC55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 00:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34EB01A2392;
	Wed, 11 Feb 2026 00:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="tNuM6/8I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A525D155C87;
	Wed, 11 Feb 2026 00:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770769002; cv=none; b=Fmqo3EUtTEwcIq/ygp1BKKBmJSXV7GchDmwz4E6f+pBQAYCERmq8dwor+pejYn+bWegXGgM4UDk4hOxTYgYZ+wH+6GElG94CwNLPYc6nv8eZbAnqC/8sLOLSJj+xfCzHczjSuzHrIukjI/PYwWWUTkcDMtDCu04H/Lm+GBgMiQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770769002; c=relaxed/simple;
	bh=v9WLBO0ARhcNiPcyw61+9QQNglHDM9tPKNk9uwKb/Qs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UZ+0xoEuxhDgeZrFHLk6OaMMT/LqPi3rltmVWSk+tzz/WP/u+fRxRAp5VTRFZU5+/3Ck0ppf+vZuxQIRbhgnucE5sqd2yVYwKqr7Yystp0Vk++OoBE+RhND38S1N5Rto3fEN2R5opUbmxhpsm2nS57f669NiaH1ZAHbOeWSO8qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=tNuM6/8I; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1770768997; x=1771028197;
	bh=6drSHtbjk9gQYo8LNUUSxjp/txRXwp9S3mSPZJIhCcc=;
	h=From:Date:Subject:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=tNuM6/8I465JIP9s+e9okFBT2bbaMhVP1E3Y5bi3bfJfjJjP7jmZnaHUxCqdGsMuz
	 8ydAv/W5RwGNUXNd5EOqDboGz5nxqSjvnasorASPhQnDx6/2LvqmpEaVBJDiOvTsmk
	 j7cqIzjmbp+p86AR3cJwsWk8pFsEEnUfUj6uW1fQedoNZ8hnYVRXNgSuOlX5cbGkDB
	 eIE4QsPAmJQkPqwiR6qg63rMLVFLdZHEpnjgPpK8oD7g7Uct4bMJ7J4WeHj0HPAG3t
	 ybgu0bgq3guCFsJi/QRoqzjcjnXBWCsJXbSCu6qdvrL5lxXj9jG0w699Dhf+pyq3KO
	 jhcBhrnNyxkmg==
X-Pm-Submission-Id: 4f9f9v6v0Tz1DDnj
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Wed, 11 Feb 2026 01:16:25 +0100
Subject: [PATCH] arm64: dts: qcom: x1-asus-zenbook-a14: add HDMI port
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-zenbook-a14-improvements-v1-1-d970af6e25a3@vinarskis.com>
X-B4-Tracking: v=1; b=H4sIAFjKi2kC/x3MQQqDMBBA0auEWXcgmarYXqV0ocmog5gJSZFS8
 e4NLt/i/wMKZ+ECT3NA5l2KaKxwNwN+GeLMKKEayFJnyTr8cRxVVxxcg7KlrDtvHD8Fx97T495
 SCL2HmqfMk3yv9et9nn8AEcQfagAAAA==
X-Change-ID: 20260201-zenbook-a14-improvements-b8c29352dd8c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2930; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=v9WLBO0ARhcNiPcyw61+9QQNglHDM9tPKNk9uwKb/Qs=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDJndpxK85zmy1ndIlV3UL3sdNCfhq+DvnNAsy+q7/P82L
 H2zzry4o5SFQYyLQVZMkaX7z9e0rkVz1zJc1/gGM4eVCWQIAxenAEzkuQMjQ0+AufvCql3ri6uv
 OG+qeCi7f7Xul8wP/zd2210Rsq5Pv8/wP/qkqSHDlJtbeHWP38/RcCsSkd/350Xm/sm8HP/tP6o
 7sgMA
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[vinarskis.com,quarantine];
	R_DKIM_ALLOW(-0.20)[vinarskis.com:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DKIM_TRACE(0.00)[vinarskis.com:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@vinarskis.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-92532-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.0:email,100hz:email,0.0.0.1:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: EAEDE12040B
X-Rspamd-Action: no action

Add HDMI port that utilizes qmpphy via Parade PS185HDM DP-HDMI
bridge.

Based on commit 34d76723c410 ("arm64: dts: qcom: x1e80100-vivobook-s15:
add HDMI port")

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
Successfully tested with 3440x1440@100hz, both hotplug and coldplug.
---
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi | 79 +++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
index 8e5c5575a5320172caa628db181560f55b688e67..d441f860fbed26df91e336ae7c0a3fb8406c6446 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
@@ -63,6 +63,45 @@ switch-lid {
 		};
 	};
 
+	hdmi-bridge {
+		compatible = "parade,ps185hdm";
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
 	leds {
 		compatible = "gpio-leds";
 
@@ -995,6 +1034,14 @@ &mdss_dp1_out {
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
 
@@ -1253,6 +1300,12 @@ hall_int_n_default: hall-int-n-state {
 		bias-disable;
 	};
 
+	hdmi_hpd_default: hdmi-hpd-default-state {
+		pins = "gpio126";
+		function = "usb2_dp";
+		bias-disable;
+	};
+
 	hdtl_default: hdtl-default-state {
 		pins = "gpio95";
 		function = "gpio";
@@ -1451,6 +1504,32 @@ &usb_1_ss1_qmpphy_out {
 	remote-endpoint = <&retimer_ss1_ss_in>;
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
+				data-lanes = <3 2 1 0>;
+				remote-endpoint = <&hdmi_bridge_dp_in>;
+			};
+		};
+	};
+};
+
 &usb_mp {
 	status = "okay";
 };

---
base-commit: 159c55202f6ec8f0fafca984ba6b0bd5751acddf
change-id: 20260201-zenbook-a14-improvements-b8c29352dd8c

Best regards,
-- 
Aleksandrs Vinarskis <alex@vinarskis.com>


