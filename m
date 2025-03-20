Return-Path: <linux-arm-msm+bounces-52048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6D6A69F94
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 06:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 524228A627E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 05:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478D11F09AC;
	Thu, 20 Mar 2025 05:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M1cEQCbG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B381EE01F;
	Thu, 20 Mar 2025 05:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742450129; cv=none; b=Qzfd/74H6zyV4wT1GWGYHImEhzfHQz1CukFwQSZMR4Mx/Q7rZONxjLwDdItIZuHQzgWU1AJSZSPz0KYAsEh3Cvw6+CnIvPJOgEQd8edVK2/VP5PwbzhtcdomGozIDoKgbEppZSEcVEg91f79Ryov0ICBhQrdsJdJ9Mu1BbOsxNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742450129; c=relaxed/simple;
	bh=j9LDk3bAIaM3KPUlvtMndGsx04IwPXEEZSiFOohJnEE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uhStKzAfqoAc1vEUIOvlTNXZkDf4XVvcihWUY42ZkWGX56926X+Vgg6GrUHzopkNlJ5QYFU5LHXjwMyfnlGgluJexbC6HCAlAG9+WNjHe/qZMfLE40ZPwmN7KYrIWA1yONTc7pEMFIubdZy7LwDiWZnJUqkPTbuJxNHFEhIZQz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M1cEQCbG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JKFMqE013593;
	Thu, 20 Mar 2025 05:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nxLrqePuJgc
	kjU9Gq6tzwwGieyaiXAZhf8WK7spWf+8=; b=M1cEQCbGlY4Jy45FZNcnftsizAb
	l/nX+eOjcjy+tQnLb6/syiuDwdKJjMxZs7le5ORN40H4MvCHHja0a7usw73WfpKo
	0TIo+wDg+F8SKMKKyWwF9HWV2udQaWZjJbz5pyKPeo05V3y0lrCtqo1CBfGRew69
	PmIGnxvPXnIC46NrazqjdSJC2OCR3rE8GxNYz3G8PVDN6rA2ruFk7iI5kfhBU4tC
	HPliVflcD+huVhWTxr9rwfxXAoa8P1X+M+dezaFx9NrHJZOrsmziYW0wgAkpvpCL
	fxBWBhWZu1vGMuOJLz7C1O/KRK3IhR55xZ16IjFXnmxtcDZ5KMSRBiCf17Q==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g4t414ee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 05:55:16 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52K5tEbg001167;
	Thu, 20 Mar 2025 05:55:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 45dk9w97cm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 05:55:14 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52K5tEp6001162;
	Thu, 20 Mar 2025 05:55:14 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 52K5tDuW001161
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 05:55:14 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id 8D71B40BF8; Thu, 20 Mar 2025 13:55:10 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, quic_qianyu@quicinc.com,
        sfr@canb.auug.org.au, linux-arm-kernel@lists.infradead.org
Cc: quic_wenbyao@quicinc.com
Subject: [PATCH v1 3/3] arm64: dts: qcom: x1e80100-qcp: Add power control and sideband signals for PCIe3
Date: Thu, 20 Mar 2025 13:55:02 +0800
Message-Id: <20250320055502.274849-4-quic_wenbyao@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250320055502.274849-1-quic_wenbyao@quicinc.com>
References: <20250320055502.274849-1-quic_wenbyao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=HMPDFptv c=1 sm=1 tr=0 ts=67dbadc4 cx=c_pps a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=uqfcqhS-80NqSzA78J4A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: j9VWoZr1Lv5nxXfVBsZ4Iaf2RA-gfPVs
X-Proofpoint-ORIG-GUID: j9VWoZr1Lv5nxXfVBsZ4Iaf2RA-gfPVs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_01,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxscore=0 clxscore=1011 bulkscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503200035

From: Qiang Yu <quic_qianyu@quicinc.com>

Add perst, wake and clkreq sideband signals and required regulators in
PCIe3 controller and PHY device tree node. Describe the voltage rails of
the x8 PCI slots for PCIe3 port.

Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 119 ++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 28086a2bc..9cd313802 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -318,6 +318,48 @@ vreg_wcn_3p3: regulator-wcn-3p3 {
 		regulator-boot-on;
 	};
 
+	vreg_pcie_12v: regulator-pcie_12v {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_PCIE_12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+
+		gpio = <&pm8550ve_8_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pcie_x8_12v>;
+	};
+
+	vreg_pcie_3v3_aux: regulator-pcie_3v3_aux {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_PCIE_3P3_AUX";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmc8380_3_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pm_sde7_aux_3p3_en>;
+	};
+
+	vreg_pcie_3v3: regulator-pcie_3v3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_PCIE_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmc8380_3_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pm_sde7_main_3p3_en>;
+};
+
 	usb-1-ss0-sbu-mux {
 		compatible = "onnn,fsusb42", "gpio-sbu-mux";
 
@@ -907,6 +949,60 @@ &mdss_dp3_phy {
 	status = "okay";
 };
 
+&pm8550ve_8_gpios {
+	pcie_x8_12v: pcie-12v-default-state {
+		pins = "gpio8";
+		function = "normal";
+		output-enable;
+		output-high;
+		bias-pull-down;
+		power-source = <0>;
+	};
+};
+
+&pmc8380_3_gpios {
+	pm_sde7_aux_3p3_en: pcie-aux-3p3-default-state {
+		pins = "gpio8";
+		function = "normal";
+		output-enable;
+		output-high;
+		bias-pull-down;
+		power-source = <0>;
+	};
+
+	pm_sde7_main_3p3_en: pcie-main-3p3-default-state {
+		pins = "gpio6";
+		function = "normal";
+		output-enable;
+		output-high;
+		bias-pull-down;
+		power-source = <0>;
+	};
+};
+
+&pcie3 {
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie3_default>;
+	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pcie3_phy {
+	vdda-phy-supply = <&vreg_l3j_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+	vdda-qref-supply = <&vreg_l3c_0p8>;
+
+	status = "okay";
+};
+
+&pcie3port {
+	vpcie12v-supply = <&vreg_pcie_12v>;
+	vpcie3v3-supply = <&vreg_pcie_3v3>;
+	vpcie3v3aux-supply = <&vreg_pcie_3v3_aux>;
+};
+
 &pcie4 {
 	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
@@ -1118,6 +1214,29 @@ nvme_reg_en: nvme-reg-en-state {
 		bias-disable;
 	};
 
+	pcie3_default: pcie3-default-state {
+		clkreq-n-pins {
+			pins = "gpio144";
+			function = "pcie3_clk";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio143";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		wake-n-pins {
+		       pins = "gpio145";
+		       function = "gpio";
+		       drive-strength = <2>;
+		       bias-pull-up;
+		};
+	};
+
 	pcie4_default: pcie4-default-state {
 		clkreq-n-pins {
 			pins = "gpio147";
-- 
2.34.1


