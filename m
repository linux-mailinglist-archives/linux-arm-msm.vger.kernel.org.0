Return-Path: <linux-arm-msm+bounces-66786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FC7B12F34
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 12:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A0C27AB995
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 10:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E523212FAD;
	Sun, 27 Jul 2025 10:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D7kuqpIY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163382116E7
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 10:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753611791; cv=none; b=diqTy9J0uwNvXigIxq2tWMORCCXcHXRq5zUqsFJEGYcKVBY7HqbxIiEhbOweJGur71legFPHQtmyYCnfC1wZIRnZmM16Kb9MbtWiL56sGlt/+JONh+ymfcNjwbcC8eO6VeoSHeX9PDQdqcIbivn3QJddZ/n/LCa8oOxiVt45rj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753611791; c=relaxed/simple;
	bh=GOfYSmnjWjg50rzLw20CFzLtGaZOsWgHtUhEvGpajMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kt+/vSxcZgsNwT3R9ulou2o8WQ+dLq8w22eGc7c3WJSYQoxeHIhCLR8ObCS1eIJ78XQz0eceSFSl52D6QitLIbG3B6q3k7Ea8BB4xoJtz6JXLzRX7GrTmI3W1220BgOSnqRb0zfsYjJNOPwEvFAP6eVeOyKZnKEinyKb/bWvPxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D7kuqpIY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56R5Zd0u007275
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 10:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m2SfRBHMNs8WMnGJqJgzx8xYCjZofwg+ucKkXG1V/Mc=; b=D7kuqpIYcR5jLIg2
	Qh83neysIRZjI2BzMt2m1n6x219mG5IfdJweAeSYadN0fo+req8gFsT6UHXBV2Cx
	n1kWLNzrVwo7MU8ZARZ839a1CRZUS29abyQ9+KnMvWwnwtPhx3ecdcTKrUIIIoXP
	2p61WpnL2a01+E/ElO2/V5RuZICvqzdEpAd1Urj/FvvHSxnHUj0PyvzGFEmPVF9h
	G21gMhDKVMfIxKbs+7NSF4/ah/Fzy3a+9D2NWy+6YoyBifYZ+d8bLRvbY3noGxJl
	y00nHeLtx+GsLec/F8JQ5+Cs+kM3IoBiHEoLBOfBusXIb6qtN2dHHBDOo/MvD5fM
	Eikehw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q85syk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 10:23:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24011c9da24so1434525ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 03:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753611788; x=1754216588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2SfRBHMNs8WMnGJqJgzx8xYCjZofwg+ucKkXG1V/Mc=;
        b=KbFnfdnva6aDwVh2uvNw1+RAOTF3NjZ+ft60IT9giCLQbh/396BmzXstWDGewSgTWf
         Rhuy8GJpRGU0ghikJpO41jH9MBs+8HHsjl+XmKTdT2jBFe6MYiNdzUfI0hFhEuNkxxuJ
         9+Gq2vb5FEnKS/1hiZAccIk0rGbTXzOtAwI3Z9LTvLjqI37fwmyVTbk8JJ6eOgK174Pw
         iOV8w9/OoYoC19QtsemujJCNrBP7f3Q+Ss7dWvxR7AJxY3UTXYl75QTOjFwq6qk+gTG2
         keZNOlkMcib6AKLf5om2MoU9opUR4w9qpUFpKE/JjubOrVmmYaPHQ2UAb/dvWPiw6l93
         B88A==
X-Gm-Message-State: AOJu0YzOLvmowxloLBMUayeP9G4PtLrQlvqUMg3PkWPVttWsyughayeE
	64zBqCJDMqBTXP+yz6fVAWSFEVLyeHfmSIuNtNrozKGaiyMBcjr5TJjrAVu5VTM17OVks76nx/T
	APZ40iQqumvLRH5PlvkRXsrbTfLc8UUCz8DzEN1gtR1HIq+P1CPowo5jpM2G9YVPO4syo
X-Gm-Gg: ASbGncuMXcfMNu9bEfh4a13wM7KVsqbd13V08uH2CWYC/GBUqPEpJH2GbOg9nALisoh
	YXPGqAiO/OmaWF7bHn8XKyldTXldDZhcBPZ4GiRAk2LOMDWr1TjqgXbtGw6GEvSKlTVkQlnJ2yY
	xf541ebqLTlAdQXzPuxlIIxKeHi9R+7os83Inm82ORex0MlC4bpEXEhi83rTSoYSQ93xt3VwB+q
	TR9B7JMdHXQSFHV2pAu234XvWfWNgFeMmoJb/dzQVYUv5rWFM6bLomw82E0MAP1fYBWImqYsz6O
	UGJCKmexTgYeEr1jy+9OhlnMuNq0Ti3YzNt0HTRfS2T2V/xcBYIVMGpUUa1nKmXN4hrlA48d6D9
	g0QzFrupm5eTLFgLaS71ncDh6N5c=
X-Received: by 2002:a17:903:1cb:b0:231:9817:6ec1 with SMTP id d9443c01a7336-23fb2b9994dmr122066705ad.17.1753611787778;
        Sun, 27 Jul 2025 03:23:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcsErmuzawqbMa5LNkPKXlpUN8HUDwqsll44NNNp7K8yJMsUh3zzuAaxY8KmOH7lemHuZhBQ==
X-Received: by 2002:a17:903:1cb:b0:231:9817:6ec1 with SMTP id d9443c01a7336-23fb2b9994dmr122066475ad.17.1753611787256;
        Sun, 27 Jul 2025 03:23:07 -0700 (PDT)
Received: from yuzha-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe533b1esm31869715ad.158.2025.07.27.03.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 03:23:06 -0700 (PDT)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
Date: Sun, 27 Jul 2025 18:22:37 +0800
Subject: [PATCH v7 2/2] arm64: dts: qcom: qcs615-ride: Enable WiFi/BT nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250727-615-v7-2-2adb6233bbb9@oss.qualcomm.com>
References: <20250727-615-v7-0-2adb6233bbb9@oss.qualcomm.com>
In-Reply-To: <20250727-615-v7-0-2adb6233bbb9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Yu Zhang (Yuriy)" <yu.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753611779; l=4997;
 i=yu.zhang@oss.qualcomm.com; s=20250625; h=from:subject:message-id;
 bh=GOfYSmnjWjg50rzLw20CFzLtGaZOsWgHtUhEvGpajMk=;
 b=GXZNqmcf0bhDi84wB6QnO9hX2yVACm/TFHg9u3j5Ry2fTFPgYoVEInurPs1xNdlUBFQGtqh8+
 IgJ7VXAFf8IDoaELHEJ9uG2aPs1O4X6MDL0a66N/HUOimSjnjbV+Ckx
X-Developer-Key: i=yu.zhang@oss.qualcomm.com; a=ed25519;
 pk=ZS+pKT1eEx1+Yb0k2iKe8mk1Rk+MUki89iurrz9iucA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDA5MCBTYWx0ZWRfX19xrpGBk86jS
 b3TrH+yZiTnthWo0J9aNr/lmQa2JMf4FS0oaYtuSiyflQLyu390cy7zjV8zYP0JIgBHvITg6Rm7
 550XnJBkc1EqCmsaPvMHxbTxwZMyJ6RIvWv04ipu0XeY/nmrWpsitmowopZJF8TOWbQ86HKTobM
 GQqxRvxNPezHcmyBXnNHLf3826Qi3u6geHqTx1l/tXoPHyqfgcuOGbaIw0QSGuoSL3+/q+I45LK
 yPT/AnvaENer1n6qYcAyf7kc0lmTHc07pk+kw4/1s2vs1/8ZZBuxrgJQ0fKunIyacQfS7Zib4PX
 gdGP7ibJPxaBEXdN7kg18Kde9fTNrkcIgv57cZPU0O+8PktzUBfWg2Deyv825UANo52N5cz7hKE
 MYmORR3bpl1JpkN19km1D+NyCHEPMF1nCHnRKd7oHa0kj1pORFFE6L+ZBbsktel++ZT1HOL5
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=6885fe0d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=cKvnr5XBRiLjHSnd2BMA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: rHOzG0skKEmwckr9rszOGPedB7zBJ07h
X-Proofpoint-GUID: rHOzG0skKEmwckr9rszOGPedB7zBJ07h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507270090

Enable WiFi/BT on qcs615-ride by adding a node for the PMU module of the
WCN6855 and assigning its LDO power outputs to the existing WiFi/BT
module.

Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 135 +++++++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 011f8ae077c256f079ce1b07720374a9bf721488..7d8064303547e8be1e749cffc8f3ec8d3f3ec59b 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -18,6 +18,7 @@ aliases {
 		mmc0 = &sdhc_1;
 		mmc1 = &sdhc_2;
 		serial0 = &uart0;
+		serial1 = &uart7;
 	};
 
 	chosen {
@@ -38,6 +39,22 @@ xo_board_clk: xo-board-clk {
 		};
 	};
 
+	vreg_conn_1p8: regulator-conn-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_conn_1p8";
+		startup-delay-us = <4000>;
+		enable-active-high;
+		gpio = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
+	};
+
+	vreg_conn_pa: regulator-conn-pa {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_conn_pa";
+		startup-delay-us = <4000>;
+		enable-active-high;
+		gpio = <&pm8150_gpios 6 GPIO_ACTIVE_HIGH>;
+	};
+
 	regulator-usb2-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "USB2_VBUS";
@@ -47,6 +64,69 @@ regulator-usb2-vbus {
 		enable-active-high;
 		regulator-always-on;
 	};
+
+	wcn6855-pmu {
+		compatible = "qcom,wcn6855-pmu";
+
+		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
+		pinctrl-names = "default";
+
+		bt-enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
+		wlan-enable-gpios = <&tlmm 98 GPIO_ACTIVE_HIGH>;
+
+		vddio-supply = <&vreg_conn_pa>;
+		vddaon-supply = <&vreg_s5a>;
+		vddpmu-supply = <&vreg_conn_1p8>;
+		vddpmumx-supply = <&vreg_conn_1p8>;
+		vddpmucx-supply = <&vreg_conn_pa>;
+		vddrfa0p95-supply = <&vreg_s5a>;
+		vddrfa1p3-supply = <&vreg_s6a>;
+		vddrfa1p9-supply = <&vreg_l15a>;
+		vddpcie1p3-supply = <&vreg_s6a>;
+		vddpcie1p9-supply = <&vreg_l15a>;
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
+			vreg_pmu_rfa_1p7: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p7";
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
 
 &apps_rsc {
@@ -234,6 +314,25 @@ &pcie_phy {
 	status = "okay";
 };
 
+&pcie_port0 {
+	wifi@0 {
+		compatible = "pci17cb,1103";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		qcom,calibration-variant = "QC_QCS615_Ride";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
 &pm8150_gpios {
 	usb2_en: usb2-en-state {
 		pins = "gpio10";
@@ -257,6 +356,10 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/qcs615/adsp.mbn";
 
@@ -274,6 +377,13 @@ &rpmhcc {
 };
 
 &tlmm {
+	bt_en_state: bt-en-state {
+		pins = "gpio85";
+		function = "gpio";
+		bias-pull-down;
+		output-low;
+	};
+
 	pcie_default_state: pcie-default-state {
 		clkreq-pins {
 			pins = "gpio90";
@@ -296,6 +406,13 @@ wake-pins {
 			bias-pull-up;
 		};
 	};
+
+	wlan_en_state: wlan-en-state {
+		pins = "gpio98";
+		function = "gpio";
+		bias-pull-down;
+		output-low;
+	};
 };
 
 &sdhc_1 {
@@ -336,6 +453,24 @@ &uart0 {
 	status = "okay";
 };
 
+&uart7 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn6855-bt";
+		firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+	};
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l12a>;

-- 
2.34.1


