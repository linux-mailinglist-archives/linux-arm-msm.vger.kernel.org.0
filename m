Return-Path: <linux-arm-msm+bounces-75254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B81BA2A1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 09:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 057E61BC2FBE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 07:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7008F2874E9;
	Fri, 26 Sep 2025 07:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="cJrbH044"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A37287256;
	Fri, 26 Sep 2025 07:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758870563; cv=none; b=W3oCT9PM7Up/DO8LvhVBCQ2cNS8qFvaKsLl02x1jVpeH9w/XzxiNok8/EFV8DWUAExNSZrorNAzM8/mS6DFf68pf7IDZqKh5YAwyNbVw1cMoC3bqVIOZ4XbI9mim/dPHsryiXrkTJDgXi3iANZo1s7O4pNVi9AcNiivVgSwHcAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758870563; c=relaxed/simple;
	bh=cIp5yPPUUN8pRc3LNy3sbNn0Bv685Fbmk6Styi0iv6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C4I89iH5l2awYjlxGwjbgawD98xv7OAtzSgVsrF7DqVWCxE0/lv6oek+bxisws7lOnhJQT19mM8fIzSTI827zuW71rc4vQ5wHG0EhNMp3f+G38A5m3zha7ZJRDRtINOh2IWPoAXGHuOKoeA121sLKpPmSfIhvTOaCi0Ir8iZnUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=cJrbH044; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1758870551; x=1759129751;
	bh=PhBr+jHsYzqozr1LavN1fgnllORK7XZ6uJHlGweTnzQ=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=cJrbH044pO35ffM1baRWfqkMKx31fYOJpENJtIHvVlL6RC7NToAyhfn5NN9djJxjg
	 pKoNgqQvIeoBsqDq+oR6id//YxxJkd5p1SQripVukWmyxjKuI+RSay2pLvzJxMs3+A
	 Gyv7i4OnKihLBO74jCp5vpf0vlS670p2vX+h6fSagx+4sUTjdHKT8eMQ/L5fEzzNTq
	 +tag8yQQSIERacucStxHGImEbpSKj+EnSz0VFvczYNXf5fnylJHOC9U5JOgZr2r8Li
	 eA2tlKW7SH1a6KBt89G6FC3zab6IiYjMLYWmbVLgeYwujBuf/CIb9kH6tMRyNeC06o
	 oT2OH1e99bJ3g==
X-Pm-Submission-Id: 4cY1sf1S4Tz1DDKn
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Fri, 26 Sep 2025 09:08:54 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: x1e80100-asus-zenbook-a14: Enable
 WiFi, Bluetooth
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-zenbook-improvements-v2-3-c0b512ab6b57@vinarskis.com>
References: <20250926-zenbook-improvements-v2-0-c0b512ab6b57@vinarskis.com>
In-Reply-To: <20250926-zenbook-improvements-v2-0-c0b512ab6b57@vinarskis.com>
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
 h=from:subject:message-id; bh=cIp5yPPUUN8pRc3LNy3sbNn0Bv685Fbmk6Styi0iv6I=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBnXbPiMnzZNzBH+IS4Xc6so6inHd9krJXbvL23K6yv7N
 un/z/f/O0pZGMS4GGTFFFm6/3xN61o0dy3DdY1vMHNYmUCGMHBxCsBEdl1m+KfbzBhjLD9boU/T
 9fSVlSvbXISOcFzlnbqPX8xzmYfrg7kM/zMmmar9eq9Rcjt0sYHTEzY5nuV3ZKLtJ29iUN2pyTz
 1MysA
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
2.51.0


