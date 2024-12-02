Return-Path: <linux-arm-msm+bounces-39808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EBC9DFD5A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 10:38:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3860928134A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 09:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B27811FBC91;
	Mon,  2 Dec 2024 09:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gmLVJb2+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FA91FAC59;
	Mon,  2 Dec 2024 09:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733132288; cv=none; b=Y9np3VYDwlIBjkE8iZ/u3foVJlFJrgqjjUPn4byuY0RkFH5LCJOjLoniboBv1gFQFH14lKGf6i5PNpW75n/YqbUrcqkr9XG3DSWKQBt6jxtb32pLz4ZODwTkVuJ5C+nH5bZDcx629pBC0TF0uYDC+GMvsSdyZ+sPS3H4WvNwo7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733132288; c=relaxed/simple;
	bh=5/G0J59uJrBz+XOTGymMyblh6ypnHpbr+COQIRaPkoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=LlrMS7NOpLyii0O78uXwDOMuR37V/EbANGWAQyEatsffuEzu7f17TWZS6CiB6cSEa6l+WwGtOHS6zVib9d3PkGPfWBmUZMWTD8pzfZNW2A7HApEYoU6P0gMtRRrAn+jlBqlCoFXLdxBBVdqGE8JDLiA65rykUeSojsEpR25drfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gmLVJb2+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B28tVAP006193;
	Mon, 2 Dec 2024 09:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o82vAobgDW3WU+0TlaCUqZ+6w3ICY2D1ebggpUJRixE=; b=gmLVJb2+1RCD/ORl
	eSUHWdIofmWetb6t3PIaoTpM47Kh+wX+HfRAq4ElGOBRjtNPbFAf8l/YepON++Pv
	lRVzi2kKw8brtVfoknK0eUuD5wPDAgRuSSJ0F8yhgzNpP6Q/PTT/MPmDhlS4rPGg
	Vn2GR3EDOZBqqKxyKkZI4KLGibJ1T+mFuyCO0sQR206c8jt6cpW5EGsvlnvlnQlN
	n8B9S9hUBK76zmS6PxtM155ZFJs8yrA9wAqYfbXNA+ocd7z/B7e5X02sNlUzn0VM
	8hoISRdbT1h+NDxM3h/ASx2dNhPyFaBzX+q2aPvqIfRw+YyUTCQ9Ct2sSuQAbFmS
	cXCdNA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437ta2vaqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 09:38:03 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B29c2gx018872
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 09:38:02 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Dec 2024 01:37:56 -0800
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
Date: Mon, 2 Dec 2024 17:37:22 +0800
Subject: [PATCH v6 1/3] arm64: dts: qcom: qcs615: Adds SPMI support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241202-adds-spmi-pmic-peripherals-for-qcs615-v6-1-bdd306b4940d@quicinc.com>
References: <20241202-adds-spmi-pmic-peripherals-for-qcs615-v6-0-bdd306b4940d@quicinc.com>
In-Reply-To: <20241202-adds-spmi-pmic-peripherals-for-qcs615-v6-0-bdd306b4940d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733132271; l=1457;
 i=quic_tingguoc@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=5/G0J59uJrBz+XOTGymMyblh6ypnHpbr+COQIRaPkoY=;
 b=dfybo24mFDAvsZT71xLrzp0UqtziA9c+sFu27a8lB5MbCZo38KYRr879OJayQA7A8H8uvhaX/
 YBcjYKpWzQ6AH59hkTKeBmh+N5jm1p3Cs4nTkU+oKsZVgUamYi/rLxC
X-Developer-Key: i=quic_tingguoc@quicinc.com; a=ed25519;
 pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QfvSHbRvX2l32YGrcQChbx54ttOZ9pRg
X-Proofpoint-GUID: QfvSHbRvX2l32YGrcQChbx54ttOZ9pRg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 mlxlogscore=706
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020085

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


