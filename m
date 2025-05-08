Return-Path: <linux-arm-msm+bounces-57230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EA9AAF54E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 10:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E483173E54
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 08:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B9DF22F3B1;
	Thu,  8 May 2025 08:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TOx+ZG0D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA3A221D85;
	Thu,  8 May 2025 08:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746692156; cv=none; b=E4VUw6YxcN4Gi0YQ4jzakW2ixUWHxcBqC2xDtIvqhcj72868/JaNcuW9MquECFDCdfNeHrSnkOQtKvBI9gjfnQM1lonb5ZySdBipXN5GLP6O/NTjRdzU/4eojB59kQS8gzYXbjSlH/VQgthvzN8xZONuh8sB94GIk8Z+gAWU908=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746692156; c=relaxed/simple;
	bh=JmA7pvrEgYrs1PcjyGWOcGGiRiGcNAA8tjFKPgJx2Tw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=epEQwsa70AsaIslES0NqLg4y9NPskSMKb+KdE0JliDqZ1U0I3kwlrfvUMjSh566P7JA1/Do5hzNnIYKTGn/I9Ujiv0fwPYStu/5yJLe5donJxpjG+cVFVF+p5g4c6yJL3/5fnk/SYk1v+ZE5j2UjnVQB3sSwb8fL5QvNy+nrqgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TOx+ZG0D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5484WPMl014263;
	Thu, 8 May 2025 08:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6I5NKwnudXs
	ObxUBmaCCU9StOtiNnwgkCDL8qEnAgzY=; b=TOx+ZG0Dh3Ig+fCoxuwaXtwt1Ic
	u4IVPcb0q6STBFYyhb1vLqStwZDjoyPP+WF3xV0ae7I5/eWLXxEyuF7BkfVQR2D3
	lOsUGgGoZnIDjYfuKNrs1due5s225o3x+rbsGTbUB/493/n4X9y5mURhlX2K/DWA
	yUDtTpBI7o/xVkXBPRU8zVHhpv7dR1ujopXREAzxlPTZz9XjcWNG1ofFMdZojU4o
	bNZTDebuPzhj/kQGDDkkbcD0Jrkkq6lMS2s+mkdcHdyVhXAVK4kvMyocRsEI7x0t
	jWGZC9YCqvylJH6ka3PFPvB5mTaRZGbKiYe7D4vBePmv2fhhqMyN9mProSg==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp4ghnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 08:15:39 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5488FbZE006412;
	Thu, 8 May 2025 08:15:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 46dc7mf854-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 08:15:37 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5488Fabu006398;
	Thu, 8 May 2025 08:15:36 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5488FasM006396
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 08:15:36 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id 6622C40D09; Thu,  8 May 2025 16:15:34 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com,
        quic_wenbyao@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 3/5] arm64: dts: qcom: x1e80100-qcp: enable pcie3 x8 slot for X1E80100-QCP
Date: Thu,  8 May 2025 16:15:12 +0800
Message-Id: <20250508081514.3227956-4-quic_wenbyao@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
References: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
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
X-Proofpoint-GUID: N_9C08JeuGa1MEvu6N2nBB-ACA3IuWHg
X-Authority-Analysis: v=2.4 cv=E5XNpbdl c=1 sm=1 tr=0 ts=681c682b cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=uqfcqhS-80NqSzA78J4A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA3MiBTYWx0ZWRfXxuG5Og18+1RK
 bytTJHGcI/d/qt0IflvEg8+p2kej5t1x8kOXQr/i+qhgM++A3IaBXxBphFDZ1EzuWEORfhtVy3k
 MY3dwmIB1SPAHEMwX3QkUSU8n9NNqNkRxkbGYVoGBx39uXB5t1efA4xPHk4zfVXYlDrmWjMbKlP
 uDtXygBRcbHYhEkGyLt71ZGwx0re+m2j8kGuB1+yy6Rtujz73Sv87dGXy/EfWFH3MK4rvsYOaJA
 ln69qliaVB/98IAjKyk8Seacst7o6Ep8TgGM77ojezf9LefELqQiQArSR/z8MbHycFvQOs35DBV
 t6s7QpLO9BCvONe3jFGSUD/8f4QfhTgeISlDv0ADateRDAkqyOYex5wkLkG7FrgVoj4XAK/uVPI
 L7PtTyhoFy/1azRV+Ho6WISANLU3S3+nb43ng5ZUay3q4KoQd4XqRI2Z/fN3rB0eqSkv1hAX
X-Proofpoint-ORIG-GUID: N_9C08JeuGa1MEvu6N2nBB-ACA3IuWHg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_02,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxlogscore=900
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080072

From: Qiang Yu <quic_qianyu@quicinc.com>

Add perst, wake and clkreq sideband signals and required regulators in
PCIe3 controller and PHY device tree node. Describe the voltage rails of
the x8 PCI slots for PCIe3 port.

Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 118 ++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 470c4f826..ec2479f8f 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -318,6 +318,48 @@ vreg_wcn_3p3: regulator-wcn-3p3 {
 		regulator-boot-on;
 	};
 
+	vreg_pcie_12v: regulator-pcie-12v {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_PCIE_12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+
+		gpio = <&pm8550ve_8_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&pcie_x8_12v>;
+		pinctrl-names = "default";
+	};
+
+	vreg_pcie_3v3_aux: regulator-pcie-3v3-aux {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_PCIE_3P3_AUX";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmc8380_3_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&pm_sde7_aux_3p3_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_pcie_3v3: regulator-pcie-3v3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_PCIE_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmc8380_3_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&pm_sde7_main_3p3_en>;
+		pinctrl-names = "default";
+};
+
 	usb-1-ss0-sbu-mux {
 		compatible = "onnn,fsusb42", "gpio-sbu-mux";
 
@@ -909,6 +951,59 @@ &mdss_dp3_phy {
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie3_default>;
+	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&pcie3_phy {
+	vdda-phy-supply = <&vreg_l3c_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
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
@@ -1120,6 +1215,29 @@ nvme_reg_en: nvme-reg-en-state {
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
+			pins = "gpio145";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
 	pcie4_default: pcie4-default-state {
 		clkreq-n-pins {
 			pins = "gpio147";
-- 
2.34.1


