Return-Path: <linux-arm-msm+bounces-38376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE989D2DCD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 19:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A538FB3531F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 17:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678B31D2716;
	Tue, 19 Nov 2024 17:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Hen+uSXF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977381D1F79;
	Tue, 19 Nov 2024 17:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732038607; cv=none; b=njRKQr4LjQr4niDywfm86ehnZaSjuBDP9xT/knb+kq4s666ZtfLMGKaG/F5rz7+vveeYOkOg+ZIF5R5UgXRPOS/5wc0Yd6rYkBvmm2xk6Mo0VhxKB5omo4L2mQDmdqui23p853WVPSEQaxx9eP+4GSSn8QpB9/Gw0kPIyl/BVIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732038607; c=relaxed/simple;
	bh=TK/x+eTRy7P3IDR7hOUY/tVtyCL8g4YRyBMtnTCipVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cae6ASQZ10x9ZN6jqYfFdU4Rs0nzJWnHjMuVmdzjutdaQEhbBI+TQntOhI+ddUl1+e4pHwtnn6+ahA2p8dKCVXp3NxsvOuY3JcudRtv4S3i327T0sAJzcBMYwiTLjZp38ZlS8kWmW7rKSJ0ovzuDlxTBAk6EGXRcLMWaZYK5vGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Hen+uSXF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJ7bpdE005668;
	Tue, 19 Nov 2024 17:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j8YoXXcP2tM
	W5u8pL03W9TA6l31+kW0KHM0gtEydeV4=; b=Hen+uSXFOysqKvJ/DhiVp0wlKX+
	IUB/++AVJJNpTtq1Q7LDVsmtc3n8HR1yDXdFZxVNcuzjj0ox3l7bZgn4pk7HJjcO
	yhQwQ0bnE4nWePlibUz6FsxRZn7jpNlJoRZuh+Xvzn9VtDdnAT4QV1B7daV0jLjF
	ixRAjxxDwdeF3VCxJmgON1u5+pAWLm1Ry0+fmLIg9thsgLUgdHgyfHfPb/n/gQOA
	ySOAa2ghGBBr0brz49gKQwYNXQ+MIPgiIejoTb9Bld8tooO8Qlpgd7KJRtTgbSCf
	VoRqyObPSGN1D6dpUwaIvxrBojmggp/s9gydEYFzh1QBGHJE1tHFMF8Dx0g==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y8kc7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 17:50:02 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJHnx5D007360;
	Tue, 19 Nov 2024 17:49:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 42xmfm26rg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 17:49:59 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AJHnxSX007334;
	Tue, 19 Nov 2024 17:49:59 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4AJHnwhn007324
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 17:49:59 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id B51145A7; Tue, 19 Nov 2024 23:19:57 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v3 3/5] dt-bindings: arm: qcom: Document rb8/ride/ride-r3 on QCS9075
Date: Tue, 19 Nov 2024 23:19:52 +0530
Message-ID: <20241119174954.1219002-4-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241119174954.1219002-1-quic_wasimn@quicinc.com>
References: <20241119174954.1219002-1-quic_wasimn@quicinc.com>
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
X-Proofpoint-ORIG-GUID: lA-0fJJo8KW8V-iLhQfpv7l8i2StzbvL
X-Proofpoint-GUID: lA-0fJJo8KW8V-iLhQfpv7l8i2StzbvL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 mlxscore=0 spamscore=0 phishscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190132

qcs9075 rb8, ride & ride-r3 boards are based on QCS9075 SoC.

QCS9075 is compatible IoT-industrial grade variant of SA8775p SoC
without safety monitorng feature of SAfety-IsLand subsystem.
This subsystem continues to supports other features like built-in
self-test, error-detection, reset-handling, etc.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7c8c3a97506a..de5cf9fb28ae 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -46,6 +46,7 @@ description: |
         qcs8550
         qcm2290
         qcm6490
+        qcs9075
         qcs9100
         qdu1000
         qrb2210
@@ -928,6 +929,14 @@ properties:
               - qcom,sa8775p-ride-r3
           - const: qcom,sa8775p

+      - items:
+          - enum:
+              - qcom,qcs9075-rb8
+              - qcom,qcs9075-ride
+              - qcom,qcs9075-ride-r3
+          - const: qcom,qcs9075
+          - const: qcom,sa8775p
+
       - items:
           - enum:
               - qcom,qcs9100-ride
--
2.47.0


