Return-Path: <linux-arm-msm+bounces-44920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB0BA0C396
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 22:22:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E91C1169241
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 21:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613381E8854;
	Mon, 13 Jan 2025 21:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F+xzGTfY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B788A1D5CFD;
	Mon, 13 Jan 2025 21:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736803354; cv=none; b=aQn9mhzMduSiieR7g5Vg9rhcq+Jfg81oxDqH0RJiIlI1Fje17L+Qs5d6UOHdV1ip4l1DmMLvBxFJr0KfB/zSTimDFjvrxw9RfPsxYXczXv5i9M0Pr8lpCNnw87g82GG6EuZ+W3s9XNe1BiK6cM9WtvQXWqVVmAnrVAahnDyxk2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736803354; c=relaxed/simple;
	bh=30GV2EsdvOw6K0NfCewvXrTykiYj3H+J+LNGzficPH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BZJwqdvmWcu+Oag2lL1lG4vjBC7jQM2JBfXcbKbt9JVGxoqb3Pp06K22orZLPbZCpoTHzT+Wzp+X16Ob0xkZ/u4Q4Hac0g3h25N/k2xDKyPNAS+obuoQaJxf0HGwvSMTCksiIMawOy9UwdTKLX/dV3pZoQbfStL8N0TrbHtUbjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F+xzGTfY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DErdfv021698;
	Mon, 13 Jan 2025 21:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	24/floz4KUZX/41AoH6M7cRSogiMCnGK0zwSGoyA1Kw=; b=F+xzGTfYueifnNUS
	GDq1YT8WbAad3bZYe6u5NUbhOU2tzXNRLKQQEiRgFOD/7cD1WfH3DANj2Johb+LK
	gFYafXLXowekSbjqAlAjBtrRUIZfCzweBfoqaGVXUIdbiOp9dt8ZnLw5DSqArRA6
	Vx4tDqk4NCyoHKQP+/tzW8TJKZNdoG8VDeEH7Yxg2TrOKyW2xOOlzrPQXh7fUiWx
	draTJyclFJMewPTb1DFTNk4+a5AH5eYIFffOJDyUXif8cNVlFW/FP6TnNnNh+XeP
	hOE6OoO25n1vWJ/YPLqw44oUOGKj953POwuIab6ScWhreM2XLFXV0IbVnvMUjueV
	9NZqug==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44550agw02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:22:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DLMSmn001142
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:22:28 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 13:22:27 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Mon, 13 Jan 2025 13:22:23 -0800
Subject: [PATCH 2/2] arm64: dts: qcom: Add PMIC glink nodes for SM8750 MTP
 and QRD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-sm8750_gpmic_master-v1-2-ef45cf206979@quicinc.com>
References: <20250113-sm8750_gpmic_master-v1-0-ef45cf206979@quicinc.com>
In-Reply-To: <20250113-sm8750_gpmic_master-v1-0-ef45cf206979@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Satya Durga
 Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736803346; l=2481;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=fkbWuaFRcOO+xTXsWLZ13QibeClVRCGoAskRRsbcERU=;
 b=Ghm7muzmRys9TW6XznAtccc+zXDd2OArV9qzNROABVO2h8qgoUfQgQbtZ1arHSYXwRjXrhGsc
 gNul2FaJZ2mCDJcnnjINcpt7XvSzbhKjEIa3HqWYlOy9WtZTkswP92O
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ah8ibQxjq6U_J6KzA1QL_S1sdsw4hocI
X-Proofpoint-GUID: ah8ibQxjq6U_J6KzA1QL_S1sdsw4hocI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=683 adultscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130170

From: Jishnu Prakash <quic_jprakash@quicinc.com>

Add the PMIC glink node with connectors for SM8750 MTP and QRD.

Signed-off-by: Jishnu Prakash <quic_jprakash@quicinc.com>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 34 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 34 +++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 9e3aacad7bdab6848e86f8e45e04907e1c752a07..0bca1f9acdedfe1852293b72862979e42fdd6241 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -81,6 +81,40 @@ key-volume-up {
 		};
 	};
 
+	pmic-glink {
+		compatible = "qcom,sm8750-pmic-glink",
+			     "qcom,sm8550-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		orientation-gpios = <&tlmm 61 GPIO_ACTIVE_HIGH>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					pmic_glink_hs_in: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					pmic_glink_ss_in: endpoint {
+					};
+				};
+			};
+		};
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 
diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index f77efab0aef9bab751a947173bcdcc27df7295a8..c53c08fc7d0d759aab921c76550bf98c2a308d49 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -80,6 +80,40 @@ key-volume-up {
 		};
 	};
 
+	pmic-glink {
+		compatible = "qcom,sm8750-pmic-glink",
+			     "qcom,sm8550-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		orientation-gpios = <&tlmm 61 GPIO_ACTIVE_HIGH>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					pmic_glink_hs_in: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					pmic_glink_ss_in: endpoint {
+					};
+				};
+			};
+		};
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 

-- 
2.46.1


