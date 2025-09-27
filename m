Return-Path: <linux-arm-msm+bounces-75385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AB3BA5F96
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 15:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E922F17AAA2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 13:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D502D6E7E;
	Sat, 27 Sep 2025 13:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="rSTyHZv7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362EB2D6605
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 13:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758979349; cv=none; b=m+W+amGdV54QEv0BfYLMEvs0T+YKjkWlucq0YLGRrn+3zYTxLrA5SyEDl7AEXxlEI9Lpb/n4PnmKsdsYbHcVWxVFZUakEGYYW9qOKGmpf6MxyW1UOPhdfosEL45Hqs2DAn3OkgDzsBuN9vgwp8uN6Y1EPwtavwGDmkauTJRKcmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758979349; c=relaxed/simple;
	bh=wTRHW7ZJF6Oi6CATe3WPdLo5UKggx5rhoXwO0OwAgvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iLN8HaZ8my5Z+YQBd98A5IKiqR0tTvt6YaJHBoM6RAWtb9SuAF8DqTeHO2tIcJ2FMRQxYRbzsVDBLPUAF6bZqG19kHZXW9zDeC2ZN2a4NVWQ140qsLVEyNu3Usq3UnNQ8dw0qwxe997o1pQcSGe8JjeH+J1lr4rirvf4vgLWSGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=rSTyHZv7; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1758979344; x=1759238544;
	bh=+6HIyn4sVSnnXupA8X3gmpCSo6mQ2/AiRb7T0R1lH90=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=rSTyHZv7e/wGDz2fT7sbKAWOYyXNnRwbNPDAe1t4FOXGAVleECIWaD2kiBUs0YfUM
	 11Vt0bdvPg8FGzBAUo8RwjKKlmeluTMQRJDzusX5V2Fni0EW5uf0PYpN3cZKzUCtjE
	 0q7I+Q0YuudvBYekya+bzXLnSmOaIEvxXx/YMRodR/1MhOU6hk5RQEHTBqXIsbQlMd
	 0+epBk9gOPJvArKmFyK60fq+YCd07qSrWst55HkAseNeTVo3jjXiorEaPLLym+euTR
	 NV0kFGWBLG0iwA5DYGqVrJe+lcXfpOxeNJKC6tGpMEuZVnO160sQH1zreP8FbMfH+o
	 EkUfTYfUYNxsQ==
X-Pm-Submission-Id: 4cYp5q1rvLz1DF4L
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Sat, 27 Sep 2025 15:21:37 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: x1e80100-asus-zenbook-a14: Enable
 WiFi, Bluetooth
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-zenbook-improvements-v3-3-d46c7368dc70@vinarskis.com>
References: <20250927-zenbook-improvements-v3-0-d46c7368dc70@vinarskis.com>
In-Reply-To: <20250927-zenbook-improvements-v3-0-d46c7368dc70@vinarskis.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3590; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=wTRHW7ZJF6Oi6CATe3WPdLo5UKggx5rhoXwO0OwAgvE=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBnXn7J/L7ud86rguUZffe4s16xHEdWTvrzIOP3wbtCUC
 81FrezTOkpZGMS4GGTFFFm6/3xN61o0dy3DdY1vMHNYmUCGMHBxCsBEvi1j+F+zI9V6edQTjpiI
 Y1czM283cs/c4HMxOTrun/ryarfpFyYyMizazft0xxSx79Xv36nMrf6gcMToadmNd19j46/uUl6
 6y4EFAA==
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815

Unlike UX3407QA with WCN6855, UX3407RA comes with WCN7850. Definitions
were not added during initial bringup due to lack of hardware to test
it. Add missing definitions that were now confirmed to work.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


