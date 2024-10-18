Return-Path: <linux-arm-msm+bounces-34955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CB69A3EA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 14:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54CF92861BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 12:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D4826AD9;
	Fri, 18 Oct 2024 12:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Kakf+EEt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70E523D2;
	Fri, 18 Oct 2024 12:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729255392; cv=none; b=iAj8R64OTQfzYzwSOm7km82lA6Amij0Apexqvrt1kCwYvshfRa47aV2Z10JRKlsjb1XNqEQMRXteh6/X1ARyngGPIZjkJZ+HSKxactlS5+xiwNVClg63xmeu1QJC//FCcFgIPymx2bBAQefNNMrDz6mcorTlG0wzJIHgrFqdzhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729255392; c=relaxed/simple;
	bh=Cv7xyEXZOZSDG9J9x31VtLuQMUSsl7TRNopNGyFGFaU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KKmzi84cAZ9d97V+0869zmD0Z/AU4qYJYv5GYM5no3hxG+RECvX2E5wLR8cWAfxhlsAnEmHNO8n/2WaBogdvBIC5HsI56akn5dd+3AHW1W16etwVFLrqA6sKmuszPDYSLezJI0HwFACdP/8QJ9j0r6s7IpGyVcBasxLwIe3eOYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Kakf+EEt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49ICF0oX007760;
	Fri, 18 Oct 2024 12:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=FSTB4VKhE654z+9CRlmFf3Ue5XCmln0JR3cTPFdChfc=; b=Ka
	kf+EEts+O081vLN2oNd3nks6fERuBcZ9PG3VCTbHRv0DzhC2pGCfYDZyzxo+VoKQ
	tFtjQAaPJsQjVInyxrGhhjeqdwoLz3ft81I0lCUnXWzjLDrXzE0ssgwgyhrWvvn9
	BYiLcm+vRcILc1V8+xfLSUmeyGGlQYJ0WBDG9bhUJr11RfXM2c2JYo/aymYNnRWH
	Ymft3M9KNi4BtKKr293XvJPuCM3JaoMr3UANIJ1qpq+/a9YB6aJY+lPoTrefI7qk
	aMWD9+dKjwWDL//nF18t+wq4Gd2Ab0cGo9x7reX21P8b0N+epwyjVNiYovIT4vc2
	Jn/Cx4SndFPawQePL8kQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42athc555m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 12:43:06 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49ICh5XO003002
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 12:43:05 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 18 Oct 2024 05:43:02 -0700
From: Manish Pandey <quic_mapa@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>
Subject: [PATCH V3] arm64: dts: qcom: qcm6490-idp: Add UFS nodes
Date: Fri, 18 Oct 2024 18:12:52 +0530
Message-ID: <20241018124252.5326-1-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZsRRQ3GbXmCbrRq_33HK3bEYpWbPhAkn
X-Proofpoint-ORIG-GUID: ZsRRQ3GbXmCbrRq_33HK3bEYpWbPhAkn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 clxscore=1011 malwarescore=0 mlxlogscore=599 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180080

Add UFS host controller and Phy nodes for Qualcomm qcm6490 board.

Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
---

Changes from v2:
 - Included the board name qcm6490-idp in the subject (Thanks Konrad).
 - 'regulator-allow-set-load' for UFS regulator has been raised in
   https://lore.kernel.org/linux-arm-msm/20241016100511.2890983-1-quic_kotarake@quicinc.com/

Changes from v1:
 - updated correct patchset number.

 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
---
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 5f3d4807ac43..c5fb153614e1 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -702,6 +702,25 @@
 	status = "okay";
 };
 
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l7b_2p952>;
+	vcc-max-microamp = <800000>;
+	vccq-supply = <&vreg_l9b_1p2>;
+	vccq-max-microamp = <900000>;
+	vccq2-supply = <&vreg_l9b_1p2>;
+	vccq2-max-microamp = <900000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l10c_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+
+	status = "okay";
+};
+
 &usb_1 {
 	status = "okay";
 };
-- 
2.17.1


