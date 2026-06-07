Return-Path: <linux-arm-msm+bounces-111546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id czVDLbICJWruCgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 07:33:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E57EA64EDB2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 07:33:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=thundersoft.com header.s=default header.b=j1Fb3ika;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111546-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111546-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=thundersoft.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E24C730160C9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 05:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA6C2853E9;
	Sun,  7 Jun 2026 05:33:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m15596.qiye.163.com (mail-m15596.qiye.163.com [101.71.155.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CFE226CFE;
	Sun,  7 Jun 2026 05:33:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780810414; cv=none; b=LVwdCkR6Y94MYf0M8ubLjOgQtbT3p6biyM6bfuSZmN+rCCg5Se95fLBzPQlpjJCWgInqkVx9pXFPISH0+GaUHW/0jk3ZePF/tP8/C4EbVjjhdVAyrmlC1drjLZiy4IVIScAxcBpeYulgC0w9YVqY+94r86UIabXaqdrPmK0gs8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780810414; c=relaxed/simple;
	bh=jXf0D0/KSVfgmFqE7LNZBRH6GD+df6VVqHSvUy4cnSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oVjidR1xpt6q7k64lPS0Zkrn917Um+t5G9afrmcG5toMcT86EWW2uY1Pqjf8lJAWZRUWiCKS0NHzecZ/kOb+OGNiS2KarVrcu/Q2TWhgCXUj899sj5OTq9jTJ4qLK3S8jDqMKxImpGk2rQn3lCnw+8b7C+pX0DVFO1MCscsFzI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=j1Fb3ika; arc=none smtp.client-ip=101.71.155.96
Received: from [127.0.1.1] (unknown [113.235.125.44])
	by smtp.qiye.163.com (Hmail) with ESMTP id 415e9f25c;
	Sun, 7 Jun 2026 12:17:36 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Sun, 07 Jun 2026 12:17:26 +0800
Subject: [PATCH v2] arm64: dts: qcom: kodiak: Move PCIe GPIOs and PHYs to
 root ports
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260607-rubikpi-bugfix-next-20260605-v2-1-7bf229978bcd@thundersoft.com>
X-B4-Tracking: v=1; b=H4sIANXwJGoC/y3M0QqEIBCF4VeJud4BM7LoVWIv1KaaFiw0I4jeP
 be6/DmH74BAnilAkx3gaePAs0shPxnYUbuBkLvUIIVUQokKfTT8WxhNHHre0dG+4juWWNhaWk1
 KV30OiVg8pdPNt9+nQzQT2fVvwnleHmdldYAAAAA=
X-Change-ID: 20260607-rubikpi-bugfix-next-20260605-3c82cae6a7f1
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rosh@debian.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780805856; l=8909;
 i=hongyang.zhao@thundersoft.com; s=20251115; h=from:subject:message-id;
 bh=jXf0D0/KSVfgmFqE7LNZBRH6GD+df6VVqHSvUy4cnSA=;
 b=pKA5L4an75TENtSSjINQ6Pntmkv9J46stsvrUw6vovkaCcif79WbzkYzzARLfctN8w0lfu0TL
 nHd201/Yu0fDuX3luGsVgi51vzsA3vXHp0tyjmTTGNzQPnmL3wmw4TV
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=0M0CJ1s9WiFZwli2JsxLB9ykikp5WkpKzCWgpdANKNI=
X-HM-Tid: 0a9ea04cee6a09d5kunmc3b598e31629d8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHhhDVh9DQxoaTB1DSB4aHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkhVSUhOVUpJTlVPT1lXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PSFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=j1Fb3ikaOj/1/blK1ROsNHUYaxGlEwxym6XV3JF9xZXfEI1brnKbasqmjoqgwxnbS3uMyT2Etnr+2xQDyjNT+yE8S3a3+fYZgDi5zqMHUqNMMezIWtr0NB+NDOKgdkTZrbADSPCgoUTsg9MRZMtmO0HEjG2/G4Gs5Uxym/iLieA=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=0ui/LvDm8vyDthh7w2gqDwJl/W6fzjvsE+14cCIHNTs=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[thundersoft.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111546-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rosh@debian.org,m:hongyang.zhao@thundersoft.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,thundersoft.com:mid,thundersoft.com:dkim,thundersoft.com:from_mime,thundersoft.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E57EA64EDB2

The Qualcomm PCIe binding deprecates perst-gpios and wake-gpios
on the host bridge and expects board reset and wake GPIOs to be
described on the root port. PERST# is described there as
reset-gpios.

Move the PCIe PHY references in kodiak.dtsi to the PCIe0 and PCIe1
root port nodes, and move the board-specific PCIe reset and wake
GPIOs in the Kodiak DTs to the corresponding root ports.

Keep the PHY and GPIO resources on the same root port nodes so the
Qualcomm PCIe driver can parse the root port binding instead of
falling back to the legacy host bridge GPIO parsing.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
Refresh Kodiak PCIe descriptions to match the current Qualcomm
PCIe binding guidance.

The series moves PCIe PHY references from the host bridge nodes to
the root port nodes in kodiak.dtsi. It also moves all Kodiak board
PERST# and WAKE# GPIO descriptions from host bridge nodes to the
corresponding root ports, using reset-gpios for PERST#.

Changes in v2:
- Refresh all Kodiak DTs instead of only the Thundercomm RubikPi3.
- Move PCIe PHY references to the root port nodes together with the
  reset and wake GPIOs.
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi                     | 10 ++++------
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts    | 14 +++++++++-----
 arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts    | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts             |  4 ++--
 .../boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts   | 14 ++++++++------
 .../arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi                 |  5 ++++-
 7 files changed, 47 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index fa540d8c2615..aae1774cb99e 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2286,9 +2286,6 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc GCC_PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_clkreq_n>;
 			dma-coherent;
@@ -2300,6 +2297,8 @@ pcie0_port: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2416,9 +2415,6 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc GCC_PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_clkreq_n>;
 
@@ -2434,6 +2430,8 @@ pcie1_port0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
index bf18c4852081..694c87ba7c1f 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
@@ -545,9 +545,6 @@ &mdss_dp_out {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
-
 	pinctrl-0 = <&pcie0_reset_n>, <&pcie0_wake_n>, <&pcie0_clkreq_n>;
 	pinctrl-names = "default";
 
@@ -561,9 +558,12 @@ &pcie0_phy {
 	status = "okay";
 };
 
-&pcie1 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+&pcie0_port {
+	reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+};
 
+&pcie1 {
 	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>, <&pcie1_clkreq_n>;
 	pinctrl-names = "default";
 
@@ -579,6 +579,10 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+};
+
 &pmk8350_adc_tm {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index bb5a42b038f1..27e1ca4889dd 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -522,9 +522,6 @@ &lpass_va_macro {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
-
 	pinctrl-0 = <&pcie0_clkreq_n>, <&pcie0_reset_n>, <&pcie0_wake_n>;
 	pinctrl-names = "default";
 
@@ -538,10 +535,12 @@ &pcie0_phy {
 	status = "okay";
 };
 
-&pcie1 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+&pcie0_port {
+	reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+};
 
+&pcie1 {
 	pinctrl-0 = <&pcie1_clkreq_n>, <&pcie1_reset_n>, <&pcie1_wake_n>;
 	pinctrl-names = "default";
 
@@ -566,6 +565,11 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+};
+
 &pm7325_gpios {
 	pm7325_adc_default: adc-default-state {
 		pins = "gpio2";
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 37a3b51323ce..4274d01c612f 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -841,8 +841,6 @@ &mdss_edp_phy {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>, <&pcie1_clkreq_n>;
 	pinctrl-names = "default";
 
@@ -867,6 +865,8 @@ &pcie1_phy {
 };
 
 &pcie1_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+
 	pcie@0,0 {
 		compatible = "pci1179,0623";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index a5ad796cb65d..935b3f21ee86 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -684,9 +684,6 @@ &mdss_dsi_phy {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
-
 	pinctrl-0 = <&pcie0_clkreq_n>,
 		    <&pcie0_reset_n>,
 		    <&pcie0_wake_n>;
@@ -702,10 +699,12 @@ &pcie0_phy {
 	status = "okay";
 };
 
-&pcie1 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+&pcie0_port {
+	reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+};
 
+&pcie1 {
 	pinctrl-0 = <&pcie1_clkreq_n>,
 		    <&pcie1_reset_n>,
 		    <&pcie1_wake_n>;
@@ -732,6 +731,9 @@ &pcie1_phy {
 };
 
 &pcie1_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+
 	pcie@0,0 {
 		compatible = "pci1179,0623";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index f47efca42d48..5c08ab53cdbd 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -812,9 +812,6 @@ &mdss_dsi_phy {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
-
 	pinctrl-0 = <&pcie0_clkreq_n>,
 		    <&pcie0_reset_n>,
 		    <&pcie0_wake_n>;
@@ -830,10 +827,12 @@ &pcie0_phy {
 	status = "okay";
 };
 
-&pcie1 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+&pcie0_port {
+	reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+};
 
+&pcie1 {
 	pinctrl-0 = <&pcie1_clkreq_n>,
 		    <&pcie1_reset_n>,
 		    <&pcie1_wake_n>;
@@ -849,6 +848,11 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
 &pm7325_gpios {
 	kypd_vol_up_n: kypd-vol-up-n-state {
 		pins = "gpio6";
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 8cac4ce9c851..6bb806931b79 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -418,7 +418,6 @@ &lpass_va_macro {
 
 &pcie1 {
 	status = "okay";
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
 
 	vddpe-3v3-supply = <&nvme_3v3_regulator>;
 
@@ -433,6 +432,10 @@ &pcie1_phy {
 	vdda-pll-supply = <&vreg_l6b_1p2>;
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+};
+
 &pmk8350_vadc {
 	channel@3 {
 		reg = <PMK8350_ADC7_DIE_TEMP>;

---
base-commit: 6e845bcb78c95af935094040bd4edc3c2b6dd784
change-id: 20260607-rubikpi-bugfix-next-20260605-3c82cae6a7f1

Best regards,
--  
Hongyang Zhao <hongyang.zhao@thundersoft.com>


