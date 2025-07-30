Return-Path: <linux-arm-msm+bounces-67101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C894B15D37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 11:52:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE4655A5A31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 09:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB2EB293462;
	Wed, 30 Jul 2025 09:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pAfApRj6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFBA28BA8C;
	Wed, 30 Jul 2025 09:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753869071; cv=none; b=fMif8mPToggh5UZIC/ejGo5EL2GQekFhZGS1nj0k46H71Dx4Dz5+Sh+LItp7HKa800VydaK9UGtI1LKjALWBrMalgy6jmPzW6wd/ZPUFLwMA+bSdpXg+JRPHg1Hji7ZAzjgyqy0V59LGflWd9XWdzIOb4I4RPMc3EZ4uuDVozcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753869071; c=relaxed/simple;
	bh=ZnZb6xmcxwP78eJ7MMiA4V6I92y6M+vFqeet0JiRgZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=GjRtnxN+sD4bQRJAhLnBr6ZAEWBD+bpWBpRChDlSM3McjwYF1xuusEsiDqEdRb+w+QmOsuLddcJRz2IZkirbvbacfJx/P6Xe17ptn8ZHyzeadCl9AxWaIihh+E3HwXwPPx88AG0lCRgtH/Zr1NaF2jwHB7o3m7H06OvvP/47tDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pAfApRj6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U5nvLa031288;
	Wed, 30 Jul 2025 09:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fLFr+3ywE+LJnp0m/Q8Gt+Ex+t0a9xnp2rptFZo1iVI=; b=pAfApRj6BR89d1CZ
	wChAyIlNB2miNF3Ueg7dItKZwRhFwAcbYx6i4mj2+6kTlFkSPDWoOz2EjVxQVHb5
	eTmDgYdRjnwzhIT9bBZqp6o5poViByHfQTpHEhNTGNwDH9zSD+Xlr6HAD5f5/alK
	DMzfzHPrW9mgk/2uWnUSW5MSYGXdVCir1VHtmNuafhqgUEHBjeoQOTv4i2x9IAer
	fb1Th4KWiCg4HxGLgeirTy5y9Fm1mW0nFJTCESUQ3BwswaitbbI6TfRNWLVuo7vI
	XJXUlM9wZAeXN0AAE/lxZBWbtglOcsXOe5y2nnIKkMQ6YZPGfoXu2wApEzke3ZjR
	z7Dc2w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 485v1xgpmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 09:51:07 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56U9p6Zg018019
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 09:51:06 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 30 Jul 2025 02:50:11 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Wed, 30 Jul 2025 17:49:46 +0800
Subject: [PATCH v4 2/2] arm64: dts: qcom: qcs8300-ride: Enable Display Port
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250730-dts_qcs8300-v4-2-5e2dd12ddf6d@quicinc.com>
References: <20250730-dts_qcs8300-v4-0-5e2dd12ddf6d@quicinc.com>
In-Reply-To: <20250730-dts_qcs8300-v4-0-5e2dd12ddf6d@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753869005; l=1765;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=ZnZb6xmcxwP78eJ7MMiA4V6I92y6M+vFqeet0JiRgZE=;
 b=AWQJ7PzEZttbgOD11qpJ4b7O49y5islPNWPxDAimZF4B2M8gP1PXulwjaGiEga79zwgK15rJp
 QQVWrJDPExaDfjMznwHRdoFiHLEXLeJsT1tXozXqrqsLJ+65olKUkjm
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA2OCBTYWx0ZWRfXyVViU66R7S7x
 vbwsUSlYNMpp624w02LOgzDGMrBPhBWll32yqvSqEvh0yI2YmBqOgMn2SRdoQGZh7RjP9ja6n8M
 XzP8k3YSN1Wh/bTcw8MIz96qBAOuWoUXgDvcoIZTeCARK3VFmak4MxlaoLsy2EjAwgM/JzpG5Jv
 1EInywoZdFsrYO3CJw4jiJbBzUJh+lsiqMgSREUFlEGMxxcUO5pU06QKS1FluLPE7X5/XIvE8fG
 dHllFk7g0/CPAtHZUs4i63ogh34wvt+DNBixCtiXnb/stYG3L3YYpbJDwX1yeUhtLT/SEI91Ikm
 PXptBq2NElu4OeHySnjRltj0mxPKNldbohmP8A7G2N0dCNP7XK2yMPr8umKka+16JaPuL4YD4WJ
 qIne8XLIwm0swRQlfLr22CngUqm7BIizf2wOoF1I57ypyCaBCej2baEGFWvxibQk0xGXuHSo
X-Authority-Analysis: v=2.4 cv=JKw7s9Kb c=1 sm=1 tr=0 ts=6889eb0b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=h71ospXMRmq3U9NWu0UA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ztMT7EHcZL1vVlaq_r4mXKFlR9ozxlH3
X-Proofpoint-GUID: ztMT7EHcZL1vVlaq_r4mXKFlR9ozxlH3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=984 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300068

Enable DPTX0 along with their corresponding PHYs for
qcs8300-ride platform.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 42 +++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 8c166ead912c589c01d2bc7d13fa1b6892f6252b..1ce4a3138eac45147eacf5fde8a7eaa79a9af9b1 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -23,6 +23,18 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	dp0-connector {
+		compatible = "dp-connector";
+		label = "DP0";
+		type = "full-size";
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&mdss_dp0_out>;
+			};
+		};
+	};
+
 	regulator-usb2-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "USB2_VBUS";
@@ -308,6 +320,30 @@ &iris {
 	status = "okay";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	pinctrl-0 = <&dp_hot_plug_det>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp0_connector_in>;
+};
+
+&mdss_dp0_phy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -333,6 +369,12 @@ &serdes0 {
 };
 
 &tlmm {
+	dp_hot_plug_det: dp-hot-plug-det-state {
+		pins = "gpio94";
+		function = "edp0_hot";
+		bias-disable;
+	};
+
 	ethernet0_default: ethernet0-default-state {
 		ethernet0_mdc: ethernet0-mdc-pins {
 			pins = "gpio5";

-- 
2.34.1


