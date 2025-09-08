Return-Path: <linux-arm-msm+bounces-72634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C98B4989E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 20:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38DBD1BC1DA7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 18:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED30731C589;
	Mon,  8 Sep 2025 18:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="m0rVPOxh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D3631CA50;
	Mon,  8 Sep 2025 18:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757357196; cv=none; b=H+7pCQRu7yfWPjVP7D62nHCje4H6/rxrXEOOQRiobsVJSjzoObLTMpCc+T9ZDDM3BgCAY87skU6ZBx/Ic366hravMz+deO9i82HLkQxa/Ql/KkqlfsjuuplHgJtnJgYLCWp32TOo7JvKht1EuZOoBHfE/xraS+15s9f1ubMsYq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757357196; c=relaxed/simple;
	bh=ZTL4mo3IdeFy55m31g9bpMYE6DwwUws0685hpScwJaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OROPKfxb7BgFY0ECWHQTDSoWNCoyAFQHs2VyDGx6KRnR5tli3BDsRFonZetPtfRAfZ6a++SPq9fotUxhIeQYXWS83r0IzJVpNzMKeRDkxzBZBloUFkjhgUbnlxtZPKerBZKlhe1yNz/1lN8Z9M8Fl9R5PGzG2kgsgSYvAg0LsYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=m0rVPOxh; arc=none smtp.client-ip=185.70.43.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757357192; x=1757616392;
	bh=IEwMV6/JiXbyk4aBp+8b95+H3KpKR+NvxtbGYTP2Jwc=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=m0rVPOxhHup2nI4+QhZ/tTJR/oxwQqGnpp9uEdgn/H560wYxOD5yrgOilKyEJfOBV
	 IalCuw/UYC4mr+zX52xJDlNkt3ixtprbaoyTccJewCQ7+Xu/RNQAz1JWQiq3l/0roH
	 Z4vu9Q8cGJe798GyRMZ1gONqaVYrU+aSOVg33rkWSddjjBiO8IsXswAkEHnyAvuH2Z
	 su9D9NKWqhZCMpEJD6V98OfcJY6/XUT7KaLVbY3qFD0CfiV5sCVvDKuRcly3nfAi7H
	 mf62um/b2rRNUy876V4+BsMAzx8bG9uCvsKPWHHur8VXB/Jslsunyo97h265aBA1+Y
	 768y3X7UBBTcA==
X-Pm-Submission-Id: 4cLGBb1yrDz1DDL6
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Mon, 08 Sep 2025 20:45:47 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: x1e80100-asus-zenbook-a14: Enable
 WiFi, Bluetooth
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-zenbook-improvements-v1-3-43ecbbf39c60@vinarskis.com>
References: <20250908-zenbook-improvements-v1-0-43ecbbf39c60@vinarskis.com>
In-Reply-To: <20250908-zenbook-improvements-v1-0-43ecbbf39c60@vinarskis.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Aleksandrs Vinarskis <alex@vinarskis.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3527; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=ZTL4mo3IdeFy55m31g9bpMYE6DwwUws0685hpScwJaA=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBn7VRpbj3RYiiaf/qsx9ddm/bK58dJ32V5NqT/NyJ+UP
 eVQQT9rRykLgxgXg6yYIkv3n69pXYvmrmW4rvENZg4rE8gQBi5OAZjIzyyG/wGlhu9f9+yY52p4
 X29N47/KI7O//Vxv83lmRfbZbp2Z6xcw/A9P5c5h/C2yzl6m/Wz0hL37P0+pmX65+fjrj/lf3Hd
 pT2ACAA==
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815

Unlike UX3407QA with ath11k, UX3407RA comes with ath12k. Definitions
were not added during initial bringup due to lack of hardware to test
it. Add missing definitions that were now confirmed to work.

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
 .../boot/dts/qcom/x1e80100-asus-zenbook-a14.dts    | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts
index f8f541153165c7c28351ef97172bdb698074a5c3..7ee558c19968ad9e9410235d6ad1497b7df2d072 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts
@@ -12,6 +12,65 @@
 / {
 	model = "ASUS Zenbook A14 (UX3407RA)";
 	compatible = "asus,zenbook-a14-ux3407ra", "qcom,x1e80100";
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		vdd-supply = <&vreg_wcn_0p95>;
+		vddio-supply = <&vreg_l15b_1p8>;
+		vddaon-supply = <&vreg_wcn_0p95>;
+		vdddig-supply = <&vreg_wcn_0p95>;
+		vddrfa1p2-supply = <&vreg_wcn_1p9>;
+		vddrfa1p8-supply = <&vreg_wcn_1p9>;
+
+		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
+		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&wcn_bt_en>, <&wcn_wlan_en>;
+		pinctrl-names = "default";
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &gpu {
@@ -22,6 +81,23 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1e80100/ASUSTeK/zenbook-a14/qcdxkmsuc8380.mbn";
 };
 
+&pcie4_port0 {
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+	};
+};
+
 &panel {
 	compatible = "samsung,atna40cu11", "samsung,atna33xc20";
 	enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
@@ -43,3 +119,21 @@ &remoteproc_cdsp {
 
 	status = "okay";
 };
+
+&uart14 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+
+		max-speed = <3000000>;
+	};
+};

-- 
2.48.1


