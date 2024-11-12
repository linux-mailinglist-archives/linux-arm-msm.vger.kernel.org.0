Return-Path: <linux-arm-msm+bounces-37575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9169C51D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 10:22:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 920C6282E32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 09:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D4F020DD4B;
	Tue, 12 Nov 2024 09:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bobkrVT6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205A5206042;
	Tue, 12 Nov 2024 09:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731403347; cv=none; b=UJtUDk+GK7/riyDlO/CUcmulHjaZsgfxYaFj/QXXzRw/eK4NrZxZ+6uUgR49tgYG6e5voPccTE74dzwwqblcyYQwGm7eh+4afz4jl/ntOuKpOb93tLqVgvcwB7TjY3w9QLYVw3nXSArFuNoyY8Y1tkXK6OMf6BRI0q6E4e960fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731403347; c=relaxed/simple;
	bh=5/G0J59uJrBz+XOTGymMyblh6ypnHpbr+COQIRaPkoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=DCT7/da40CnZ3nFzg5Wf2yxjc4bd0QN3LaQQzLFcKztBOl5C6Ra7Ibi/UBNmVn34bc2VEm7/dN7vJVtDKOLy4Gbu4JuMauEOhBfWTASfBlwNG4nTRmvgbWgpA+MW1bJM1eAB28fSVo8W3xZah3CwoH9TiNQ6FrvRF9avH3K/s24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bobkrVT6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC6Acca004270;
	Tue, 12 Nov 2024 09:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o82vAobgDW3WU+0TlaCUqZ+6w3ICY2D1ebggpUJRixE=; b=bobkrVT6vaVIwaME
	NSGsARqflrBUDEX9bKqKKoatpfl9J3fDqJsT66wgvIp+pSauum3GfZ1GX32JrZac
	D4guWWMwnXLx/VwCbWcpp5Se32fguIQTEfZt/zkNmtzCJgW2QJjK76GxeynKERUD
	VXkNW8FXUavj9UgOX4nYucwlXsw4+MA4Ezrh/as40eOAzZsofnJHFWmaKSC20sCN
	yxDSrWkm+zTBpo9V+F3Z7Wr9tfOO1+rnA32+kZsblyYnbZTUqk6HB/pCUHtumo4q
	vPySoIatGyPRS2159PN7YbmXQQEgDxVL13e3YoV7tej3LvZWJnuPpH/iJesjmxNW
	97FthQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42v1h6gem1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 09:22:23 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AC9MNhR005451
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 09:22:23 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 01:22:16 -0800
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
Date: Tue, 12 Nov 2024 17:21:30 +0800
Subject: [PATCH v4 1/3] arm64: dts: qcom: qcs615: Adds SPMI support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241112-adds-spmi-pmic-peripherals-for-qcs615-v4-1-f0e54d8b6516@quicinc.com>
References: <20241112-adds-spmi-pmic-peripherals-for-qcs615-v4-0-f0e54d8b6516@quicinc.com>
In-Reply-To: <20241112-adds-spmi-pmic-peripherals-for-qcs615-v4-0-f0e54d8b6516@quicinc.com>
To: <quic_fenglinw@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <kernel@quicinc.com>, <quic_eberman@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Tingguo Cheng <quic_tingguoc@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731403332; l=1457;
 i=quic_tingguoc@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=5/G0J59uJrBz+XOTGymMyblh6ypnHpbr+COQIRaPkoY=;
 b=obOw4zKJHfz3k3jSM/Ow8wEWBJAN8ZeCb4QGBUUa3msYXiV/4TMQfUZNpG9ktk04S8joXePIf
 jvCabd/bpyqBoctdGf40xmeZNanoPCY+Cx1xTqRfbmZvQI82Qn21xFk
X-Developer-Key: i=quic_tingguoc@quicinc.com; a=ed25519;
 pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xMMLrMjlM_1pl6OjzaeLdTTP3ZTuR2C3
X-Proofpoint-GUID: xMMLrMjlM_1pl6OjzaeLdTTP3ZTuR2C3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=718
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120076

Add the SPMI bus Arbiter node for the PMIC on QCS615 platforms.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index 868808918fd2cdf3f23fcb43ead61b2abfc776f7..630b5d3c4560b31ff5a67857b2e3eb798a310f9d 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -517,6 +517,29 @@ sram@c3f0000 {
 			reg = <0x0 0x0c3f0000 0x0 0x400>;
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
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "periph_irq";
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			cell-index = <0>;
+			qcom,channel = <0>;
+			qcom,ee = <0>;
+		};
+
 		intc: interrupt-controller@17a00000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */

-- 
2.34.1


