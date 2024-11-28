Return-Path: <linux-arm-msm+bounces-39403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0619DB4E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 10:41:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00BEEB222DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 09:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4243C157E82;
	Thu, 28 Nov 2024 09:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DkR7Nzi/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1762155C8A;
	Thu, 28 Nov 2024 09:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732786883; cv=none; b=Fo38pq9TsYAZ4wW9YDcHC9vwWjzVYyya9eB6saQf4OxgASfHluPMBgi+WuCCA831EKeO/ZgUVs9xpi6Yt3tR2g3pFSjHGrCyNkB2xj2T9Eqnr73R8X7rjPnyY+P4SGMfzrb2MOOn8YmIwSdPSC/RtY9j53lescoIiikNW4w6L9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732786883; c=relaxed/simple;
	bh=w+FU/2A2ffFIpufuq6Hi7UKwygmoUoPUyyY7HWAtAr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=f7dx34Eo4qsKWkTBZaztPEh6h1py9htWmNtr//BOkaJOu7+2dmqUKMjHQnLBb9LQnmWdB8NU103SMNVw1A522W1iGb1W2clNtsqrK67X0rhSh50vlij9xapAAzYByxShUOk+tY1zpnozIEu+qvNoWRXUTu8l/adZtWo22ebrQ3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DkR7Nzi/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ARMW4Dx008976;
	Thu, 28 Nov 2024 09:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7mglQ2byCLEpm3wQGV5AbfcFjyTebzuz81XieRQe/DQ=; b=DkR7Nzi/80ocjSrc
	bPTWenzssuPNQVcbMYArJxIDQIFx/gnx3YariZtzwjvktgnB3q2kph3uL/lqaC1X
	cvAVoPgGfCofmNu3iedcoyzJnTrJzqd1sEzZBqWSigUH/Sf0veBLmoMOTIfamLpT
	cmWi3Dd/rvhgz7uuEccA/5tdh8wGoX4d79no6GyfMEZeikjIYiK8EEkfelCCPgNN
	9VdeRJ3Wub7bZRYAAnM9jwrkPgUIY4v0gny/tTtek8JND/GCUd3EMEB9jkDueAFw
	5NTkftWGmrPh0bAcaq2N6DyV5dHrf0k03HRvxL4NcLKFNc4mJOLnLUIpMyBtZjuz
	CMMd6A==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43671ea1rx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 09:41:19 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AS9f1CC003269
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 09:41:01 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 28 Nov 2024 01:40:56 -0800
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
Date: Thu, 28 Nov 2024 17:40:16 +0800
Subject: [PATCH v2 1/2] arm64: dts: qcom: qcs8300: Adds SPMI support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241128-adds-spmi-pmic-peripherals-for-qcs8300-v2-1-001c0bed7c67@quicinc.com>
References: <20241128-adds-spmi-pmic-peripherals-for-qcs8300-v2-0-001c0bed7c67@quicinc.com>
In-Reply-To: <20241128-adds-spmi-pmic-peripherals-for-qcs8300-v2-0-001c0bed7c67@quicinc.com>
To: <quic_fenglinw@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <kernel@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Tingguo Cheng <quic_tingguoc@quicinc.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732786852; l=1399;
 i=quic_tingguoc@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=w+FU/2A2ffFIpufuq6Hi7UKwygmoUoPUyyY7HWAtAr8=;
 b=jXMVpoza8e2Mar0f2xSR/CXNd8I0w7/xXENrJSr769MaJ0IEXHeUKTz907CnJksRr42cuWlNk
 /KWz8xQP8jQBK+JkzmkyOkb51NPL1B33N8K5WJJeQ6n4Jgpn6PUMkY8
X-Developer-Key: i=quic_tingguoc@quicinc.com; a=ed25519;
 pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BiBfkWpxlaji1HG2tDoU9KcMeY11tjfG
X-Proofpoint-GUID: BiBfkWpxlaji1HG2tDoU9KcMeY11tjfG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 mlxscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 mlxlogscore=658
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411280077

Add the SPMI bus arbiter(Version:5.2.0) node for QCS8300 SoC
which connected with PMICs on QCS8300 boards.

Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 2c35f96c3f289d5e2e57e0e30ef5e17cd1286188..03bf72d6ec5c9ec92f6f53df9253c8c5953e13c4 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -939,6 +939,28 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			#clock-cells = <0>;
 		};
 
+		spmi_bus: spmi@c440000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0 0x0c440000 0x0 0x1100>,
+			      <0x0 0x0c600000 0x0 0x2000000>,
+			      <0x0 0x0e600000 0x0 0x100000>,
+			      <0x0 0x0e700000 0x0 0xa0000>,
+			      <0x0 0x0c40a000 0x0 0x26000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr",
+				    "intr",
+				    "cnfg";
+			qcom,channel = <0>;
+			qcom,ee = <0>;
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "periph_irq";
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,qcs8300-tlmm";
 			reg = <0x0 0x0f100000 0x0 0x300000>;

-- 
2.34.1


