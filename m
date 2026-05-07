Return-Path: <linux-arm-msm+bounces-106433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JDILWGg/GksSAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:23:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6BA4EA144
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB0743010D85
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213CE3F9F39;
	Thu,  7 May 2026 14:17:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE033FB7DC;
	Thu,  7 May 2026 14:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163455; cv=none; b=guQ6/rsN91NKqLhdIWxTkRBcU+tccJDVlU9xAFATP5Svwafi6utiGjl6DYiCu707p8juaKONgsgKQK4mbCN51i9WH2PMstxRtWGh+wJDEc8iieMxsbTgW5HXrHudKfj3DlMvE8pD9lAxANC44Iy87oHoFqReqBzEBUtoX3a9UIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163455; c=relaxed/simple;
	bh=3yp3YpVDpc5KxLWKUbouwnCkp5aICEO4dbDBM/bgdAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iz53XOYbOUi/e9dlcn3cWZNxogLh3VFKsyiGB8ULrnId/Su3cpeZygz4rP8uY9PDW6d+msW74EKUDz3uO1e4f2TKlNz9Yd8yGUEAaDpLhx+lXr50XIWcG3e12vUd4VfEV641mOLSaGxY3NHrmrwPC1T6cT3BTHSe5lP+/yupTrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpgz16t1778163389t8b0e6327
X-QQ-Originating-IP: /Acnv1FPW24GmoigqNSKoyL+7+Qk+t3OYiFdsXB4eR8=
Received: from [192.168.30.32] ( [116.234.74.217])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 May 2026 22:16:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17409895627837406214
EX-QQ-RecipientCnt: 9
From: Xilin Wu <sophon@radxa.com>
Date: Thu, 07 May 2026 22:16:07 +0800
Subject: [PATCH] arm64: dts: qcom: sc8280xp: Move PHY, PERST, and Wake
 GPIOs to PCIe port nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-8280-move-perst-wake-v1-1-5b33cef2d807@radxa.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTvJ2Ag2XsW4KPRHRyOQDqAJ4
 e4WXH6L9xYyJIXRpVgoYVbTvss4HgpqHqG7gzVmkxNXSSln9s4Lv/sZPCDZyJ/wArd1KE9OfAx
 VpJwOCa1+9+319rdN9RPNuL1oXX8u8k5qeAAAAA==
X-Change-ID: 20260507-8280-move-perst-wake-fba54208da6d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13945; i=sophon@radxa.com;
 h=from:subject:message-id; bh=3yp3YpVDpc5KxLWKUbouwnCkp5aICEO4dbDBM/bgdAg=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJl/5m2f7/Ltiu/Rp5lWV6V+Rc+6434ueOZm6bdrNtz8v
 DSgy98jr6OUhUGMi0FWTJFFIZ5hLntl7rWnYqV6MHNYmUCGMHBxCsBEeAwY/pc2OiV6pt8/Fntd
 5I7wpoc7GK6wxM14obg8WijmW1GXliwjwzbuZ1nXuoX1rze6LmT4t+9MZYVWh4P4pGuy3q4TJva
 6cAAA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OJMDfpxdSlueYQKxA3NsXZ0VuQkeA6OGYx1em3gAirwjNPQSVRrFq+Jj
	Z+Bz9uS3igCAKEOEjdWd4eQ+I5S7D3uuwirTV4DornyuJ0hCTi2PvaPnqeiulxoEw7XgHUX
	EN5IClQ6cE2+tLOWj4zPE6YPHemqt+f+h9lvcKVLYK0vH0X3ltmBIi8RxK1rNzIIEGaEEi6
	u2+0mmJpiBRbReUcfeIbi/gICdwu/OfATUsUl7LkJ54gw49pgcwuOgRAu9yy0RdRQVKBhJb
	W71+yzsLHu1KinIvriQgIIr10x8iwuX/XJ5vvC6L9hP0EPlgffAOdOpv0rVE+vjI1jhvsQO
	cZr0P15qD0dybBzB/XTy1eZOiFEB032fm7KQk1KOK57rx0KZ7PwLciVRdeP9MewX7YQ8JtY
	Bx+NWV8Y1gNuYnLISa6fjPiV1oqxFMffBTab838/euuVUATVo1ni3F9v0o42jJSwRSpAls9
	TdkbdZFGPXUSkzxBfGlh8CiWWZIqntfBgqrlpa82E6K171c/Rz9/9odQEIX3sOSWtpZWkBN
	uEgBfK9G3YjAt0n4z+I6hTbRJjokMqKHJ1J6L1rYLIxuiWHRXQyq9ZYNqZaFHzs/UO9Aho7
	/KOSUMn6eNh49GEi4l9hOCKIRn716kWFNhUEoF2sTsIikVKZP4fr7ecFLPrH7b6mj1QMNLJ
	CiMjeOuU8iUYkAu8sDrlFrIEcmdCaalLMSjioNPhqWS60QVKN4Mvaa/yRIMlvoa/DHRoZj1
	sGROJAhECP2mU0TNt3pWTBGxBDRS1IFY8EQ/28O8IcZ5Zu+pm9Qg/Jn5kYatExZHF9khzTw
	yYutLga1PqFWbWGE5bRKsLVwL1zMqTeRI3TsMwMq2akP6suWtzctJ4ydAFGyDYXc2h57saR
	rsVILDdqTG5zUXa/VMnBI0qrGMRulEbKKd4rp30BY6pL9uEDaH+srLQxY9NIOUZT4lZChpc
	fcT1hFT1hHjYvrZ6A9b8eYov0OAkKtaCBythjaM2aY669sh3lm+KTbWWLDaxem2+SIQ4pNI
	yecCHBSw2RvaAYK9uwyebEodZJ5ko=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 0E6BA4EA144
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106433-lists,linux-arm-msm=lfdr.de];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.68:email,1c08000:email,1c18000:email,1c00000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,radxa.com:email,radxa.com:mid,0.0.0.0:email,1c20000:email,1c10000:email]
X-Rspamd-Action: no action

Since describing the PCIe PHY directly under the RC node is now
deprecated, move the references to the respective PCIe port nodes.

And also move the PCIe PERST and wake GPIOs from the controller nodes to
the corresponding PCIe port nodes on sc8280xp-based platforms:

 - sa8295p-adp
 - sa8540p-ride
 - sc8280xp-crd
 - sc8280xp-huawei-gaokun3
 - sc8280xp-lenovo-thinkpad-x13s
 - sc8280xp-microsoft-arcata
 - sc8280xp-microsoft-blackrock

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts           | 32 ++++++++++++++--------
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts          | 16 +++++++----
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          | 22 +++++++++------
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      | 14 ++++++----
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     | 22 +++++++++------
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    | 22 +++++++++------
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 14 ++++++----
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 25 +++++++----------
 8 files changed, 95 insertions(+), 72 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
index d28d69162427..512de3597581 100644
--- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
@@ -453,15 +453,17 @@ &mdss1_dp3_phy {
 };
 
 &pcie2a {
-	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2a_default>;
 
 	status = "okay";
 };
 
+&pcie2a_port0 {
+	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+};
+
 &pcie2a_phy {
 	vdda-phy-supply = <&vreg_l11a>;
 	vdda-pll-supply = <&vreg_l3a>;
@@ -472,15 +474,17 @@ &pcie2a_phy {
 &pcie3a {
 	num-lanes = <2>;
 
-	perst-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 56 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie3a_default>;
 
 	status = "okay";
 };
 
+&pcie3a_port0 {
+	reset-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 56 GPIO_ACTIVE_LOW>;
+};
+
 &pcie3a_phy {
 	vdda-phy-supply = <&vreg_l11a>;
 	vdda-pll-supply = <&vreg_l3a>;
@@ -489,15 +493,17 @@ &pcie3a_phy {
 };
 
 &pcie3b {
-	perst-gpios = <&tlmm 153 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 130 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie3b_default>;
 
 	status = "okay";
 };
 
+&pcie3b_port0 {
+	reset-gpios = <&tlmm 153 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 130 GPIO_ACTIVE_LOW>;
+};
+
 &pcie3b_phy {
 	vdda-phy-supply = <&vreg_l11a>;
 	vdda-pll-supply = <&vreg_l3a>;
@@ -506,15 +512,17 @@ &pcie3b_phy {
 };
 
 &pcie4 {
-	perst-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie4_default>;
 
 	status = "okay";
 };
 
+&pcie4_port0 {
+	reset-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
+};
+
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l11a>;
 	vdda-pll-supply = <&vreg_l3a>;
diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
index 44177e9b64b5..83d5f1d9e79b 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -366,15 +366,17 @@ &pcie2a {
 		 <0x02000000 0x0 0x3c300000 0x0 0x3c300000 0x0 0x1d00000>,
 		 <0x03000000 0x5 0x00000000 0x5 0x00000000 0x1 0x00000000>;
 
-	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 145 GPIO_ACTIVE_HIGH>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2a_default>;
 
 	status = "disabled";
 };
 
+&pcie2a_port0 {
+	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_HIGH>;
+};
+
 &pcie2a_phy {
 	vdda-phy-supply = <&vreg_l11a>;
 	vdda-pll-supply = <&vreg_l3a>;
@@ -387,15 +389,17 @@ &pcie3a {
 		 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x20000000>,
 		 <0x03000000 0x6 0x00000000 0x6 0x00000000 0x2 0x00000000>;
 
-	perst-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 56 GPIO_ACTIVE_HIGH>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie3a_default>;
 
 	status = "okay";
 };
 
+&pcie3a_port0 {
+	reset-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 56 GPIO_ACTIVE_HIGH>;
+};
+
 &pcie3a_phy {
 	vdda-phy-supply = <&vreg_l11a>;
 	vdda-pll-supply = <&vreg_l3a>;
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index c53e00cae465..777b253d2e76 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -628,9 +628,6 @@ keyboard@68 {
 };
 
 &pcie2a {
-	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_nvme>;
 
 	pinctrl-names = "default";
@@ -646,10 +643,12 @@ &pcie2a_phy {
 	status = "okay";
 };
 
-&pcie3a {
-	perst-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+&pcie2a_port0 {
+	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+};
 
+&pcie3a {
 	vddpe-3v3-supply = <&vreg_wwan>;
 
 	pinctrl-names = "default";
@@ -665,12 +664,14 @@ &pcie3a_phy {
 	status = "okay";
 };
 
+&pcie3a_port0 {
+	reset-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+};
+
 &pcie4 {
 	max-link-speed = <2>;
 
-	perst-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_wlan>;
 
 	pinctrl-names = "default";
@@ -687,6 +688,9 @@ &pcie4_phy {
 };
 
 &pcie4_port0 {
+	reset-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1103";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
index 9819454abe13..96c7bcbe9bbc 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
@@ -739,9 +739,6 @@ &mdss0_dp1_out {
 };
 
 &pcie2a {
-	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_nvme>;
 
 	pinctrl-0 = <&pcie2a_default>;
@@ -757,12 +754,14 @@ &pcie2a_phy {
 	status = "okay";
 };
 
+&pcie2a_port0 {
+	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+};
+
 &pcie4 {
 	max-link-speed = <2>;
 
-	perst-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_wlan>;
 
 	pinctrl-0 = <&pcie4_default>;
@@ -772,6 +771,9 @@ &pcie4 {
 };
 
 &pcie4_port0 {
+	reset-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1103";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index d84ca010ab9d..0ef98a36acfd 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -933,9 +933,6 @@ keyboard@68 {
 };
 
 &pcie2a {
-	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_nvme>;
 
 	pinctrl-names = "default";
@@ -951,10 +948,12 @@ &pcie2a_phy {
 	status = "okay";
 };
 
-&pcie3a {
-	perst-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+&pcie2a_port0 {
+	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+};
 
+&pcie3a {
 	vddpe-3v3-supply = <&vreg_wwan>;
 
 	pinctrl-names = "default";
@@ -970,12 +969,14 @@ &pcie3a_phy {
 	status = "okay";
 };
 
+&pcie3a_port0 {
+	reset-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+};
+
 &pcie4 {
 	max-link-speed = <2>;
 
-	perst-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_wlan>;
 
 	pinctrl-names = "default";
@@ -985,6 +986,9 @@ &pcie4 {
 };
 
 &pcie4_port0 {
+	reset-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1103";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index f2b4470d4407..3d589f05b90e 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -486,9 +486,6 @@ &mdss0_dp1_out {
 };
 
 &pcie2a {
-	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_nvme>;
 
 	pinctrl-0 = <&pcie2a_default>;
@@ -504,10 +501,12 @@ &pcie2a_phy {
 	status = "okay";
 };
 
-&pcie3a {
-	perst-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+&pcie2a_port0 {
+	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+};
 
+&pcie3a {
 	vddpe-3v3-supply = <&vreg_wwan>;
 
 	pinctrl-0 = <&pcie3a_default>;
@@ -523,12 +522,14 @@ &pcie3a_phy {
 	status = "okay";
 };
 
+&pcie3a_port0 {
+	reset-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+};
+
 &pcie4 {
 	max-link-speed = <2>;
 
-	perst-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_wlan>;
 
 	pinctrl-0 = <&pcie4_default>;
@@ -538,6 +539,9 @@ &pcie4 {
 };
 
 &pcie4_port0 {
+	reset-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1103";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
index 00bbeeef6f14..7f82d583c3f7 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
@@ -624,9 +624,6 @@ &mdss0_dp2_phy {
 };
 
 &pcie2a {
-	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_nvme>;
 
 	pinctrl-0 = <&pcie2a_default>;
@@ -642,12 +639,14 @@ &pcie2a_phy {
 	status = "okay";
 };
 
+&pcie2a_port0 {
+	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+};
+
 &pcie4 {
 	max-link-speed = <2>;
 
-	perst-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_wlan>;
 
 	pinctrl-0 = <&pcie4_default>;
@@ -657,6 +656,9 @@ &pcie4 {
 };
 
 &pcie4_port0 {
+	reset-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1103";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 761f229e8f47..40577173053d 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -2220,9 +2220,6 @@ pcie4: pcie@1c00000 {
 			power-domains = <&gcc PCIE_4_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
-			phys = <&pcie4_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
 			pcie4_port0: pcie@0 {
@@ -2230,6 +2227,8 @@ pcie4_port0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie4_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2331,9 +2330,6 @@ pcie3b: pcie@1c08000 {
 			power-domains = <&gcc PCIE_3B_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
-			phys = <&pcie3b_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
 			pcie3b_port0: pcie@0 {
@@ -2341,6 +2337,8 @@ pcie3b_port0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie3b_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2442,9 +2440,6 @@ pcie3a: pcie@1c10000 {
 			power-domains = <&gcc PCIE_3A_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
-			phys = <&pcie3a_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
 			pcie3a_port0: pcie@0 {
@@ -2452,6 +2447,8 @@ pcie3a_port0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie3a_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2556,9 +2553,6 @@ pcie2b: pcie@1c18000 {
 			power-domains = <&gcc PCIE_2B_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
-			phys = <&pcie2b_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
 			pcie2b_port0: pcie@0 {
@@ -2566,6 +2560,8 @@ pcie2b_port0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie2b_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2667,9 +2663,6 @@ pcie2a: pcie@1c20000 {
 			power-domains = <&gcc PCIE_2A_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
-			phys = <&pcie2a_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
 			pcie2a_port0: pcie@0 {
@@ -2677,6 +2670,8 @@ pcie2a_port0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie2a_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

---
base-commit: 735d2f48cadaa9a87e7c7601667878de70c771c5
change-id: 20260507-8280-move-perst-wake-fba54208da6d

Best regards,
--  
Xilin Wu <sophon@radxa.com>


