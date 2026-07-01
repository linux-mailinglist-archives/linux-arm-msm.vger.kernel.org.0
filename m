Return-Path: <linux-arm-msm+bounces-115640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A1JKJM/sRGpY3QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:32:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C02A6EC2D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:32:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HotLwFIW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115640-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115640-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B7E53001BED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 10:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36363B3BED;
	Wed,  1 Jul 2026 10:32:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D59B2264A8;
	Wed,  1 Jul 2026 10:32:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782901964; cv=none; b=iAg8SqR6TkmBufO6P3XkDU12b50OXE8fJsaPgFCmMMrCz6XRt59ZpFDMap2/LMdPcWC0BNG59jEEUZVemBO8KnPJ4y8EIfrmDeZYRjtbUMV+3SsUi66cUlCs/DrzsqH3V33wtQ7h8+k18QosfJZHe4Wk8k+UkxM/EG+MB+3vcqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782901964; c=relaxed/simple;
	bh=I+OJU5lxsGhcUXol0iQgXWqCpufkQrFozRXU+0PpZ3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JNgL0KXkK0lXa2s5bfQcIKrqajXQzwxZC60Byu6sIDoXgzg5sNEXN0mwYgeUOP/2yh+F3BEJxNQvqU+yHx76MIMMFZbJeoyv7OE6XQ5xwgxfpAbexZyA4DKzGYR7MnunWUmK2EAq77/YyiyTDdMA5bdrolPMeb6D+mzwr91XYVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HotLwFIW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7607B1F000E9;
	Wed,  1 Jul 2026 10:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782901963;
	bh=Ptvg1ylGxHnshrrECxTmUr8gU4sZPkl++bmW1JmyOAI=;
	h=From:Date:Subject:To:Cc;
	b=HotLwFIW2BKKaTL7pX4N3gz2IPrdJx+d+7VJ9Cgsa/ZBqhR/XVPcHPLjXTf8fhIgd
	 Apkd8NdhKoO+0d2CTnI0ujmyTmMt24zFyUgWSfJ+vyZedAurZ6Vb5prdsUWnEd3z4M
	 bkFZm2gDofz+NToGXWEp7iOcohVgRjhh/Grw1K6xKuXIyuUnZNqG39wQdgIibTow4C
	 0jvqw5emmMVZohuzsls5tOrGdUfmq8KwxmS3re/TtEfithxYZ5KtCD2CXaexyb+8oY
	 tPYjFquHqyqMIlLlzeL7+dPuRxMHpOW2p0bYvIQI6aCdjJ+o/G8k29WkjtJdt5X4Of
	 MzPxRTz/DJuog==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 01 Jul 2026 12:32:37 +0200
Subject: [PATCH] arm64: dts: qcom: Rename pci@ nodes to pcie@
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-dts_pci_pcie-v1-1-aab8de213b39@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwND3ZL8gsxk3ZSS4viC5EwQTtVNM0pLsjA1NklLNrZUAmosKEpNy6w
 AGxodC+EXlyZlpSaXgExSqq0FADCAQgt2AAAA
X-Change-ID: 20260701-topic-dts_pci_pcie-f2fb8534fc39
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782901960; l=8750;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=x30iMF+TYnUycZ9fiSS+053+qlKHkFT6fnTCDyrkIEQ=;
 b=47Z/1jlYH1fDqbih81PsZDwmv7WKd+f50DMCmIbuFe7H42Y84kVOvn4Bbq2KeEmhtETpd8Ylq
 mTwjEO+wNBGAwo8peZ3eH+g9WOohibVEOS+QX6tf7Rssixo0aT0Nyh8
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-115640-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C02A6EC2D4

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

PCIe hosts/devices commonly use the 'pcie' for their node name to
reflect they're not legacy PCI.

Every couple months someone comes around to clean this up because
people keep introducing new uses of 'pci@'. Seems like it's my turn
now, so do that for RCs and the downstream devices (switches etc.)
defined in board files.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi                              | 8 ++++----
 arch/arm64/boot/dts/qcom/hamoa.dtsi                               | 6 +++---
 arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso            | 4 ++--
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts                 | 4 ++--
 arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso            | 4 ++--
 arch/arm64/boot/dts/qcom/monaco.dtsi                              | 4 ++--
 .../arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 8 ++++----
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts                      | 4 ++--
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts     | 4 ++--
 9 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..4a2be27601a0 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -2750,7 +2750,7 @@ pcie_west_slv_noc: interconnect@1920000 {
 			#interconnect-cells = <2>;
 		};
 
-		pcie4: pci@1bf0000 {
+		pcie4: pcie@1bf0000 {
 			device_type = "pci";
 			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
 			reg = <0x0 0x01bf0000 0x0 0x3000>,
@@ -2960,7 +2960,7 @@ pcie4_phy: phy@1bf6000 {
 			status = "disabled";
 		};
 
-		pcie5: pci@1b40000 {
+		pcie5: pcie@1b40000 {
 			device_type = "pci";
 			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
 			reg = <0x0 0x01b40000 0x0 0x3000>,
@@ -3226,7 +3226,7 @@ pcie5_phy: phy@1b50000 {
 			status = "disabled";
 		};
 
-		pcie6: pci@1c00000 {
+		pcie6: pcie@1c00000 {
 			device_type = "pci";
 			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
 			reg = <0x0 0x01c00000 0x0 0x3000>,
@@ -3436,7 +3436,7 @@ pcie6_phy: phy@1c06000 {
 			status = "disabled";
 		};
 
-		pcie3b: pci@1b80000 {
+		pcie3b: pcie@1b80000 {
 			device_type = "pci";
 			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
 			reg = <0x0 0x01b80000 0x0 0x3000>,
diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4ba751a65142..56cfce354eb9 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -3462,7 +3462,7 @@ pcie3_phy: phy@1be0000 {
 			status = "disabled";
 		};
 
-		pcie6a: pci@1bf8000 {
+		pcie6a: pcie@1bf8000 {
 			device_type = "pci";
 			compatible = "qcom,pcie-x1e80100";
 			reg = <0 0x01bf8000 0 0x3000>,
@@ -3605,7 +3605,7 @@ pcie6a_phy: phy@1bfc000 {
 			status = "disabled";
 		};
 
-		pcie5: pci@1c00000 {
+		pcie5: pcie@1c00000 {
 			device_type = "pci";
 			compatible = "qcom,pcie-x1e80100";
 			reg = <0 0x01c00000 0 0x3000>,
@@ -3742,7 +3742,7 @@ pcie5_phy: phy@1c06000 {
 			status = "disabled";
 		};
 
-		pcie4: pci@1c08000 {
+		pcie4: pcie@1c08000 {
 			device_type = "pci";
 			compatible = "qcom,pcie-x1e80100";
 			reg = <0 0x01c08000 0 0x3000>,
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
index 44bd9b1a1765..4fc5f482a18f 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
@@ -271,7 +271,7 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
-			pci@0,0 {
+			pcie@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
@@ -279,7 +279,7 @@ pci@0,0 {
 				ranges;
 			};
 
-			pci@0,1 {
+			pcie@0,1 {
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 379b796f261f..e1cc3954efe8 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -340,7 +340,7 @@ &pcie1 {
 &pcieport0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
 
-	pci@0,0 {
+	pcie@0,0 {
 		#address-cells = <3>;
 		#size-cells = <2>;
 		device_type = "pci";
@@ -348,7 +348,7 @@ pci@0,0 {
 		ranges;
 		reg = <0x010000 0x00 0x00 0x00 0x00>;
 
-		pci@2,0 {
+		pcie@2,0 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
index e6beb4393430..77c28c19d17a 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
@@ -117,7 +117,7 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
-			pci@0,0 {
+			pcie@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
@@ -125,7 +125,7 @@ pci@0,0 {
 				ranges;
 			};
 
-			pci@0,1 {
+			pcie@0,1 {
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index e4c8466f941b..c354fb4ce1fe 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2276,7 +2276,7 @@ mmss_noc: interconnect@17a0000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
-		pcie0: pci@1c00000 {
+		pcie0: pcie@1c00000 {
 			device_type = "pci";
 			compatible = "qcom,pcie-qcs8300", "qcom,pcie-sa8775p";
 			reg = <0x0 0x01c00000 0x0 0x3000>,
@@ -2455,7 +2455,7 @@ pcie0_phy: phy@1c04000 {
 			status = "disabled";
 		};
 
-		pcie1: pci@1c10000 {
+		pcie1: pcie@1c10000 {
 			device_type = "pci";
 			compatible = "qcom,pcie-qcs8300", "qcom,pcie-sa8775p";
 			reg = <0x0 0x01c10000 0x0 0x3000>,
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index 83908db335af..937b63eae3ba 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -130,7 +130,7 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
-			pci@0,0 {
+			pcie@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
@@ -138,7 +138,7 @@ pci@0,0 {
 				ranges;
 			};
 
-			pci@0,1 {
+			pcie@0,1 {
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
@@ -225,7 +225,7 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
-			pci@0,0 {
+			pcie@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
@@ -233,7 +233,7 @@ pci@0,0 {
 				ranges;
 			};
 
-			pci@0,1 {
+			pcie@0,1 {
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 37a3b51323ce..8dde7f4b2dc6 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -954,7 +954,7 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
-			pci@0,0 {
+			pcie@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
@@ -962,7 +962,7 @@ pci@0,0 {
 				ranges;
 			};
 
-			pci@0,1 {
+			pcie@0,1 {
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index a5ad796cb65d..7827f66342c9 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -784,7 +784,7 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
-			pci@0,0 {
+			pcie@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
@@ -792,7 +792,7 @@ pci@0,0 {
 				ranges;
 			};
 
-			pci@0,1 {
+			pcie@0,1 {
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;

---
base-commit: 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
change-id: 20260701-topic-dts_pci_pcie-f2fb8534fc39

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


