Return-Path: <linux-arm-msm+bounces-106441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFN1Dumh/GkSSQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:30:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D7F4EA353
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4850A3016D09
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C694E315D3B;
	Thu,  7 May 2026 14:29:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800813FFAB8;
	Thu,  7 May 2026 14:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164190; cv=none; b=Z1aK+U2jbbBqD+8+x4JHgfkszgb/qthwqdZTaczo34kKSEf09WL70gix72dIXO3wS9Bf+toDxDxxbyvkR4A/W54FyJf86jl3AxlU2+h2m7eBAwQQLa5gj9rChiX17eja+njQbAIPIUjtTFkJ9J/jZe87HohdR3gQR2zim6JcwKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164190; c=relaxed/simple;
	bh=q+6yDC2Hm2Vtwzb0UTwBGyn+hFrR6RtyB3r5B6rycrU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=j6tDThTxVwHEN8oRv37jhiciVywcdTUGbv/v+lm/1E9R2oenHiizO/ny9aOecnKF1wlUkr18sdOm3qYJszvQGyNLv34u/RoI8I1kXNpQ7bZxFpv6jh5Pk0bf7OydXZ70XGs9Q3/kZk1Iqt+jyOBdyoEn4ab1kqBI9D8thwF4O+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpsz5t1778164169t780d0f25
X-QQ-Originating-IP: InXvPXexXPNZ5sdA9TuwvldblBj0klMk4r6dU2UEk24=
Received: from [192.168.30.32] ( [116.234.74.217])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 May 2026 22:29:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6618897104269648509
EX-QQ-RecipientCnt: 9
From: Xilin Wu <sophon@radxa.com>
Date: Thu, 07 May 2026 22:29:24 +0800
Subject: [PATCH] arm64: dts: qcom: sc8280xp: Flatten usb controller nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-sc8280xp-flatten-dwc3-v1-1-b18be56bebba@radxa.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTvJtAiiVyEu2jLoGFNJpwIJ4
 e5WXb7F/xsoJ2GFS7VB4llUXrHAHCoIdxdvjDIUgyXbUkMn1NDZjtYJx6fLmSMOS6jRmsZQffb
 t0Tso7ZR4lPX37a9/69s/OOTvDPb9A2aNkY55AAAA
X-Change-ID: 20260507-sc8280xp-flatten-dwc3-2151039b64ba
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12832; i=sophon@radxa.com;
 h=from:subject:message-id; bh=q+6yDC2Hm2Vtwzb0UTwBGyn+hFrR6RtyB3r5B6rycrU=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJl/Fh5ff2zhHFUDFaVTh6Y4619r1DK5kjj3p4R4nbZXa
 tiS5KgfHaUsDGJcDLJiiiwK8Qxz2Stzrz0VK9WDmcPKBDKEgYtTACZyWpThv5OnQMuThLW/Z2a0
 /7+wSn62msVVfreJio6/H3YK8dV7fmH4Kymvpnig5Pylv5tDrqy7PunU+s2b+llCUqY/b37w/lu
 xIR8A
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NgPgBA824ZcPSOL8o6fv0o7J0rzJsuoe0OA5czKKYlxpnIcbc5hu2zcR
	tSQgaV7Tt/WzjyXqaFJx+T7YfawkozfqK4CE+WASSgm6aLS5VcnhDUksrU1EXvyXEXNgbYt
	ROcTzo8LUkdWW3tljiAdCzt4waxEGEdTi62i1nIFPFlcj5OgAc1x/1Xh0lYJC44u4laTsir
	KLXV6R1ft7dRzUNXBis0J+UA/HXF1XU31EkQ//Eb/V+/i3nwvtsCqDo29HhzIsDDUV31ayC
	NHE0gBXl3YsnHiP0qst5ZMovUuEOnyHZPqqkNXplEXHezFmm0ZfrYAzQebhGMfqXIDjZnoG
	urooneO68nAnoEIBR0ylPvL3TzndbsIgpmBCS8YY9TuPjygZCQzj+3LLvkP/TN1GA37qdCl
	Hh4A/Ep1T/j8jIJ6nHcGOwPzko3BAbruSxxF3EDnpaU8XNYfXA2wEdBg+UxawZSyvjZQg+E
	KWTw/67PZVyPmm8rIYm7ujyatS4X1sny6NMhZGtFU/l2Voq+bdZUTGCBgtRqAyJXmDTdXTa
	9XBMOGYPLUcB2Z4d1ZRSACSmlwzYdE0fHj7gmBrEtHxaruS97E8Y4UgI+aJlIPltIFkWd+g
	SBrMgiFVqDHy4t+UZH3hikeLxbw3Eweqm+XDHn9ihm5ARUBT5ZPC5IQ735q01/B+hbdcPKL
	/RrKuBBa/wSJbMIOlY0m7dpHQRiXbROz/WcpRzIoW86FRf8tC74xMHeo1F01lzQhm8vQeBl
	OKUGI4w9eIpSR6jug84Y7GWeSj/YOxBGsR/izqPQfPvw5kj+GXqbMq+FVelN0nRkcbtfBLr
	j7yzTHMr9nQA7PLiU2i677v76SZJoNxssFfcwmnGVwwx8+IcBSV9eJEMpK6tOS3LK5Fjnn6
	AkB/u4RSuclSPHt+8txmYfU7eKCPxD0Sen9WJWFreJ3yC4TbiOWp40wKxvnBBcgjYiv3sHs
	YmEk42f7vnWE4LD72blOg5nBLBZkpjOMNGfTXsZf+DoSEePlkpL3S5gAmxLPq4soKnX8FA0
	fKhSprdjxQrmqZYQ8klHlbRXe3m+b8j/beW89QWB/qK1OoicZwUSo85GPyiH+Dkgh+x0bJx
	w==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: F0D7F4EA353
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_FROM(0.00)[bounces-106441-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email,0.140.97.128:email];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,radxa.com:email,radxa.com:mid,a8f8800:email,a800000:email,a400000:email]
X-Rspamd-Action: no action

Flatten usb controller nodes and update to using latest bindings
and flattened driver approach.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts           |  12 +-
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |   6 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  12 +-
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      |  12 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  12 +-
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    |  12 +-
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts |  18 +--
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 156 +++++++++------------
 8 files changed, 97 insertions(+), 143 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
index d28d69162427..abd0f6a64b11 100644
--- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
@@ -587,12 +587,10 @@ &ufs_card_phy {
 };
 
 &usb_0 {
-	status = "okay";
-};
-
-&usb_0_dwc3 {
 	/* TODO: Define USB-C connector properly */
 	dr_mode = "peripheral";
+
+	status = "okay";
 };
 
 &usb_0_hsphy {
@@ -611,12 +609,10 @@ &usb_0_qmpphy {
 };
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	/* TODO: Define USB-C connector properly */
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_hsphy {
diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
index 44177e9b64b5..e794689f0777 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -462,11 +462,9 @@ &ufs_mem_phy {
 };
 
 &usb_0 {
-	status = "okay";
-};
-
-&usb_0_dwc3 {
 	dr_mode = "peripheral";
+
+	status = "okay";
 };
 
 &usb_0_hsphy {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index c53e00cae465..3b624544b676 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -816,11 +816,9 @@ &ufs_mem_phy {
 };
 
 &usb_0 {
-	status = "okay";
-};
-
-&usb_0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_0_dwc3_hs {
@@ -853,11 +851,9 @@ &usb_0_qmpphy_out {
 };
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
index 9819454abe13..dfc1341ccc5d 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
@@ -1129,11 +1129,9 @@ bluetooth {
 };
 
 &usb_0 {
-	status = "okay";
-};
-
-&usb_0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_0_dwc3_hs {
@@ -1166,11 +1164,9 @@ &usb_0_qmpphy_out {
 };
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index d84ca010ab9d..a1e8e75fc553 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -1338,11 +1338,9 @@ bluetooth {
 };
 
 &usb_0 {
-	status = "okay";
-};
-
-&usb_0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_0_dwc3_hs {
@@ -1376,11 +1374,9 @@ &usb_0_qmpphy_out {
 };
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index f2b4470d4407..207c13adcb9d 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -755,11 +755,9 @@ embedded-controller {
 };
 
 &usb_0 {
-	status = "okay";
-};
-
-&usb_0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_0_dwc3_hs {
@@ -792,11 +790,9 @@ &usb_0_qmpphy_out {
 };
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
index 00bbeeef6f14..0cfd69201cae 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
@@ -983,11 +983,9 @@ bluetooth {
 };
 
 &usb_0 {
-	status = "okay";
-};
-
-&usb_0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_0_dwc3_hs {
@@ -1020,11 +1018,9 @@ &usb_0_qmpphy_out {
 };
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_dwc3_hs {
@@ -1060,12 +1056,10 @@ &usb_2 {
 	pinctrl-0 = <&usb2_en_state>;
 	pinctrl-names = "default";
 
-	status = "okay";
-};
-
-&usb_2_dwc3 {
 	phys = <&usb_2_hsphy0>, <&usb_2_qmpphy0>;
 	phy-names = "usb2-0", "usb3-0";
+
+	status = "okay";
 };
 
 &usb_2_hsphy0 {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 761f229e8f47..ecfc64d864fc 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -3940,12 +3940,9 @@ system-cache-controller@9200000 {
 			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		usb_2: usb@a4f8800 {
-			compatible = "qcom,sc8280xp-dwc3-mp", "qcom,dwc3";
-			reg = <0 0x0a4f8800 0 0x400>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+		usb_2: usb@a400000 {
+			compatible = "qcom,sc8280xp-dwc3-mp", "qcom,snps-dwc3";
+			reg = <0 0x0a400000 0 0xfc100>;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_MP_AXI_CLK>,
 				 <&gcc GCC_USB30_MP_MASTER_CLK>,
@@ -3963,7 +3960,8 @@ usb_2: usb@a4f8800 {
 					  <&gcc GCC_USB30_MP_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 857 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 856 IRQ_TYPE_LEVEL_HIGH>,
@@ -3982,7 +3980,8 @@ usb_2: usb@a4f8800 {
 					      <&pdc 16 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
 
-			interrupt-names = "pwr_event_1", "pwr_event_2",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event_1", "pwr_event_2",
 					  "pwr_event_3", "pwr_event_4",
 					  "hs_phy_1",	 "hs_phy_2",
 					  "hs_phy_3",	 "hs_phy_4",
@@ -4003,33 +4002,25 @@ usb_2: usb@a4f8800 {
 
 			wakeup-source;
 
+			iommus = <&apps_smmu 0x800 0x0>;
+			phys = <&usb_2_hsphy0>, <&usb_2_qmpphy0>,
+			       <&usb_2_hsphy1>, <&usb_2_qmpphy1>,
+			       <&usb_2_hsphy2>,
+			       <&usb_2_hsphy3>;
+			phy-names = "usb2-0", "usb3-0",
+				    "usb2-1", "usb3-1",
+				    "usb2-2",
+				    "usb2-3";
+			dr_mode = "host";
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+
 			status = "disabled";
+		};
 
-			usb_2_dwc3: usb@a400000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x0a400000 0 0xcd00>;
-				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
-				iommus = <&apps_smmu 0x800 0x0>;
-				phys = <&usb_2_hsphy0>, <&usb_2_qmpphy0>,
-				       <&usb_2_hsphy1>, <&usb_2_qmpphy1>,
-				       <&usb_2_hsphy2>,
-				       <&usb_2_hsphy3>;
-				phy-names = "usb2-0", "usb3-0",
-					    "usb2-1", "usb3-1",
-					    "usb2-2",
-					    "usb2-3";
-				dr_mode = "host";
-				snps,dis-u1-entry-quirk;
-				snps,dis-u2-entry-quirk;
-			};
-		};
-
-		usb_0: usb@a6f8800 {
-			compatible = "qcom,sc8280xp-dwc3", "qcom,dwc3";
-			reg = <0 0x0a6f8800 0 0x400>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+		usb_0: usb@a600000 {
+			compatible = "qcom,sc8280xp-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0xfc100>;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
 				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
@@ -4047,12 +4038,14 @@ usb_0: usb@a6f8800 {
 					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 804 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 804 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 805 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 138 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "hs_phy_irq",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq",
@@ -4069,46 +4062,38 @@ usb_0: usb@a6f8800 {
 
 			wakeup-source;
 
-			status = "disabled";
+			iommus = <&apps_smmu 0x820 0x0>;
+			phys = <&usb_0_hsphy>, <&usb_0_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy", "usb3-phy";
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
 
-			usb_0_dwc3: usb@a600000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x0a600000 0 0xcd00>;
-				interrupts = <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>;
-				iommus = <&apps_smmu 0x820 0x0>;
-				phys = <&usb_0_hsphy>, <&usb_0_qmpphy QMP_USB43DP_USB3_PHY>;
-				phy-names = "usb2-phy", "usb3-phy";
-				snps,dis-u1-entry-quirk;
-				snps,dis-u2-entry-quirk;
+			status = "disabled";
 
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-					port@0 {
-						reg = <0>;
+				port@0 {
+					reg = <0>;
 
-						usb_0_dwc3_hs: endpoint {
-						};
+					usb_0_dwc3_hs: endpoint {
 					};
+				};
 
-					port@1 {
-						reg = <1>;
+				port@1 {
+					reg = <1>;
 
-						usb_0_dwc3_ss: endpoint {
-							remote-endpoint = <&usb_0_qmpphy_usb_ss_in>;
-						};
+					usb_0_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_0_qmpphy_usb_ss_in>;
 					};
 				};
 			};
 		};
 
-		usb_1: usb@a8f8800 {
-			compatible = "qcom,sc8280xp-dwc3", "qcom,dwc3";
-			reg = <0 0x0a8f8800 0 0x400>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+		usb_1: usb@a800000 {
+			compatible = "qcom,sc8280xp-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a800000 0 0xfc100>;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
 				 <&gcc GCC_USB30_SEC_MASTER_CLK>,
@@ -4126,12 +4111,14 @@ usb_1: usb@a8f8800 {
 					  <&gcc GCC_USB30_SEC_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 810 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 136 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "hs_phy_irq",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq",
@@ -4148,35 +4135,30 @@ usb_1: usb@a8f8800 {
 
 			wakeup-source;
 
-			status = "disabled";
+			iommus = <&apps_smmu 0x860 0x0>;
+			phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy", "usb3-phy";
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
 
-			usb_1_dwc3: usb@a800000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x0a800000 0 0xcd00>;
-				interrupts = <GIC_SPI 810 IRQ_TYPE_LEVEL_HIGH>;
-				iommus = <&apps_smmu 0x860 0x0>;
-				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
-				phy-names = "usb2-phy", "usb3-phy";
-				snps,dis-u1-entry-quirk;
-				snps,dis-u2-entry-quirk;
+			status = "disabled";
 
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-					port@0 {
-						reg = <0>;
+				port@0 {
+					reg = <0>;
 
-						usb_1_dwc3_hs: endpoint {
-						};
+					usb_1_dwc3_hs: endpoint {
 					};
+				};
 
-					port@1 {
-						reg = <1>;
+				port@1 {
+					reg = <1>;
 
-						usb_1_dwc3_ss: endpoint {
-							remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
-						};
+					usb_1_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
 					};
 				};
 			};

---
base-commit: 735d2f48cadaa9a87e7c7601667878de70c771c5
change-id: 20260507-sc8280xp-flatten-dwc3-2151039b64ba

Best regards,
--  
Xilin Wu <sophon@radxa.com>


