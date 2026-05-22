Return-Path: <linux-arm-msm+bounces-109249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDFhOTI1EGqqUwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:51:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DE95B27DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFAFF30A8657
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 10:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A90C13D3480;
	Fri, 22 May 2026 10:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HvUy1v/c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0FA3CE0B1;
	Fri, 22 May 2026 10:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779446625; cv=none; b=I8QPCenswXtGy8n1IrWfRupbwMw3/FAEpvWTCxiehhspHxUrQV6d0iqPzzpvyA1omnIHBxLBt5Ffpa+8GNfnv2nbYLWB719zgKewyK8t+8XazUw5GnzhmtHSeyaf5AcidKYJtKQmO4p+IrctYb6zXgEwISbMyJJJZZJb3WJ91Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779446625; c=relaxed/simple;
	bh=OAdJDoexPkQT9ots4EbkSWm5SFdMRsHbuuzQVtz1jwM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dDeLuFyC1dAiaJvNU7sU2jd3Cs6DMtAOD1nLUTdIPh1NjQR5jVCqdQE+qc95I0P59xMtt9YX9HDLVNwCBhwZg3bwgO9AOOYXJKpLhdjWPUVRNaSqb7Az+1pzAPdJR+j+aSLIhEvmT3FEBljoc1wCBFU42Qk3gGP08VbwHHKrQ64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HvUy1v/c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37303C2BCB9;
	Fri, 22 May 2026 10:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779446625;
	bh=OAdJDoexPkQT9ots4EbkSWm5SFdMRsHbuuzQVtz1jwM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HvUy1v/cMHGV763cJ9SloQxanfiCv7tBN/JC2wstIpP5a0w5zP3ovZr5tCYwDDC9R
	 SmT5A28AbszPVsNA+IZxFQd5bP4ulGTkIOrjDTbw/gNaYzFq0ErjgspObvZGJiWIrD
	 fbi4Nkf9E6pEZQm8m+vki0mZZBeb2ydTLBlMZOESc1CfdrP7RNw++uuZZuRYkW0xrG
	 RHWSva+2mCdIAnV4UrVA1FlporEl9NtIvqzhSrfe/IGkjis9d3dIJ+h8BOWD1PhVeq
	 zuD5v11hksT15ypT+kzri54QsouEAmVh2O4kSqAwlAHcAGojTTS6XsI0OrJz3i6xni
	 ATRofYx/IGHtA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24FA3CD5BB1;
	Fri, 22 May 2026 10:43:45 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Fri, 22 May 2026 12:43:18 +0200
Subject: [PATCH v2 02/10] arm64: dts: qcom: sc8280xp-arcata: Enable the eDP
 display
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260522-surface-sp9-5g-for-next-v2-2-dd9d477407f5@gmail.com>
References: <20260522-surface-sp9-5g-for-next-v2-0-dd9d477407f5@gmail.com>
In-Reply-To: <20260522-surface-sp9-5g-for-next-v2-0-dd9d477407f5@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779446623; l=2658;
 i=jerome.debretagne@gmail.com; s=20260520; h=from:subject:message-id;
 bh=ArT83CzUHU9cMXn/mN7oML+/ug0Ds8jF1qJcB4FmuvI=;
 b=MC/sgpFH/Rm/assHFo+NXk9ltx8t+plL5Ow1X3mh+OzHUmBXLg/3Mj3pZgK9Eh8fy9b5eiwGp
 ieFxHTdXUgxB5BMkMw0cV4+VyRC5DtRk9/tP2Oex4L8d5pxzue0Q/DK
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=3/JYhgYjGg5V9mlFxc0A0+pFiyjsuDB/TtDlNMId9fk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20260520
 with auth_id=785
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Reply-To: jerome.debretagne@gmail.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109249-lists,linux-arm-msm=lfdr.de,jerome.debretagne.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[jerome.debretagne@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 91DE95B27DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jérôme de Bretagne <jerome.debretagne@gmail.com>

Add the vreg_edp_3p3, edp_reg_en and mdss0_dp3 nodes to enable the
Surface Pro 9 5G eDP-based LCD display (LG LP129WT232166).

Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    | 64 ++++++++++++++++++++--
 1 file changed, 59 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index f24f60dc73afea6eeee0ea26472cda3223811752..476e17415da273330e3638e040db9cd4ed408bf1 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -136,6 +136,22 @@ pmic_glink_con1_sbu: endpoint {
 		};
 	};
 
+	vreg_edp_3p3: regulator-edp-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_EDP_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 36 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -344,7 +360,6 @@ vreg_l6b: ldo6 {
 			regulator-max-microvolt = <880000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-boot-on;
-			regulator-always-on;	// FIXME: VDD_A_EDP_0_0P9
 		};
 	};
 
@@ -448,10 +463,6 @@ &dispcc0 {
 	status = "okay";
 };
 
-&dispcc1 {
-	status = "okay";
-};
-
 &gpi_dma0 {
 	status = "okay";
 };
@@ -494,6 +505,42 @@ &mdss0_dp1_out {
 	remote-endpoint = <&usb_1_qmpphy_dp_in>;
 };
 
+&mdss0_dp3 {
+	compatible = "qcom,sc8280xp-edp";
+	/delete-property/ #sound-dai-cells;
+
+	data-lanes = <0 1 2 3>;
+
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "edp-panel";
+
+			backlight = <&backlight>;
+			power-supply = <&vreg_edp_3p3>;
+
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss0_dp3_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss0_dp3_out {
+	remote-endpoint = <&edp_panel_in>;
+};
+
+&mdss0_dp3_phy {
+	compatible = "qcom,sc8280xp-edp-phy";
+	vdda-phy-supply = <&vreg_l6b>;
+	vdda-pll-supply = <&vreg_l3b>;
+
+	status = "okay";
+};
+
 &pcie2a {
 	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
@@ -910,6 +957,13 @@ hstp-sw-ctrl-pins {
 		};
 	};
 
+	edp_reg_en: edp-reg-en-state {
+		pins = "gpio36";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	nvme_reg_en: nvme-reg-en-state {
 		pins = "gpio135";
 		function = "gpio";

-- 
2.47.3



