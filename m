Return-Path: <linux-arm-msm+bounces-37881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A20A9C8443
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 08:50:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0BC6B233B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 07:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E97B21F81BF;
	Thu, 14 Nov 2024 07:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FiE1YQPQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AD01F6675;
	Thu, 14 Nov 2024 07:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731570508; cv=none; b=Jy0n9JZqY0dt7PSj5MmJ4WhTfAdP2tVtc2ED8aIGXHqqcd9TOUNFvYnjYT5ID4xbNNTGWi6aklw3Eu14I8WutA2UR+ucbBxn33BZgMtAI8jshjOmU+yGtCxTepIaNNUZT3bsoM9TSNi1XFyu+MU0KuOhdCzqJfS3MiB3yzYPDF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731570508; c=relaxed/simple;
	bh=mKQs3h/9RhTBc87IZ94AN0IVaIXmiTqrouVO/V8+0Rk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ptgxncyz9EOWqMZlPzEQzfKrjgo+JjxXNzb25Q3LjNMG0JAugOvFr4W+cSUVa9Q/uxJBqdqEwBzSUXm6NdjwUQ0to6n5qNTqb5jU2cV9Fl59PeLAx4ynn3hlZAg7a5lmhr1sjxn1pJBSZ9v55JaIVaFxYDiLyiWcjIQ/NkpKx5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FiE1YQPQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE687wc026166;
	Thu, 14 Nov 2024 07:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sgXywXTXEiv18D5jxxPkfjXNoouy6DO/ATfUle8emnU=; b=FiE1YQPQlDEZoUVs
	fIuSLC379iptXft9s+gPmpt/7h/tD4jgzmDsMDkkiqUIFFc7iGpSG3RBJeXG424U
	1/AXk4ZWCbovILbAGVPWt/gBkqLm+mvO2y1SCA7dnLmgFliCnqRstbp6Vqg1nSfy
	Qii5WtIRFW7ARbK7okxke7M+u3Uup5vYAB0gQ50TnXVC9694fLFJhWuLQCfMoSM+
	Sbuw1i+jK773DwSL7aS31TUCHElODHA07KmVAG364LB8wa5nSrmJGJntiku9UPqj
	en2K31cppEHqCt2Cwg8TvBEjNGRRxaFtacFj6nbUzGGYOuWZ2um+bToB+cyfedLO
	4DUyQw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42va07ec2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 07:48:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AE7mIOl028871
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 07:48:19 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 13 Nov 2024 23:48:12 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <mantas@8devices.com>, <quic_kbajaj@quicinc.com>,
        <quic_kriskura@quicinc.com>, <quic_rohiagar@quicinc.com>,
        <abel.vesa@linaro.org>, <quic_varada@quicinc.com>,
        <quic_wcheng@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 5/6] dt-bindings: usb: qcom,dwc3: Add IPQ5424 to USB DWC3 bindings
Date: Thu, 14 Nov 2024 13:17:21 +0530
Message-ID: <20241114074722.4085319-6-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114074722.4085319-1-quic_varada@quicinc.com>
References: <20241114074722.4085319-1-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7f4kN6E9Cm9PrNKMZJOSA6wLaLVm1FdL
X-Proofpoint-ORIG-GUID: 7f4kN6E9Cm9PrNKMZJOSA6wLaLVm1FdL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 mlxlogscore=624 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411140058

Update dt-bindings to add IPQ5424 to USB DWC3 controller list.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
v2: Add 'Acked-by: Conor Dooley'
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 935e204b607b..2622a1f3bcab 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -16,6 +16,7 @@ properties:
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
           - qcom,ipq5332-dwc3
+          - qcom,ipq5424-dwc3
           - qcom,ipq6018-dwc3
           - qcom,ipq8064-dwc3
           - qcom,ipq8074-dwc3
-- 
2.34.1


