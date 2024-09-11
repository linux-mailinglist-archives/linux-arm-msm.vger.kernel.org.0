Return-Path: <linux-arm-msm+bounces-31494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD20A97508A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 13:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A8EF1C21F4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 11:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA708188924;
	Wed, 11 Sep 2024 11:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YleVYdu2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A866188930;
	Wed, 11 Sep 2024 11:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726053085; cv=none; b=KBrafRGXq4ymZgWejwDtLIncaDwS76t4+/PddJOzeWbtNzYNMt7YwjHAiEoe9vc46gZKkIRjbu6CbMqiZO1m5YFsszdKBzAOR8WpnvNvyK9ZxAMkgEdIlKI5jAuVKIy4O09pnCiCove/q8tqnrBODJMwDz72Qq8SATdc56W3uhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726053085; c=relaxed/simple;
	bh=bw6wPFEMbojefbEjweSev5Yv9yRhTIfqSoGctp0nElQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Cd/z6KdTDT2eLEQ/hg2bQMSrmh5J0P3RKENupkeKdeZ+fKM7K+UQy/CBimk3eRdUinF0/un3I9lx+OBmXJ1fc13tovLg5toeKQPWCuCr6UjkO3qgzOWWSCKVbeg/WAldFzALOk4PLCYSLr1J9MliXWBnfSQTx8nGwTe2u1Yh584=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YleVYdu2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B2GdHV025587;
	Wed, 11 Sep 2024 11:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bqA4Kh0KmTWwQVhdb2v1UkGM2UhdNz+okCE1r3elW4w=; b=YleVYdu2uz0uPfDZ
	wDndutqMbyANyGS+Ie2zgdaNZADQZLdqLJidVYcK0Hz2U2qgbZhJBDmNVg6zNd2u
	o2fEqc6mzfZw9XXRDYt9y1KVgsIuQ0p+ta8zY104KMXlL6QDFNaUl+rbQYF++nsg
	Z6nuyfK8h8TDvJP92tNQbIwLCMjdgF24+kZWNkRmvNhKf19OL7EyQLi6cxijc7Fw
	6UnTCLRxysoxM+gkfVDcMydRyCPN1vJCQ7wSGtW4kjNkMMoUMpQi+ayKXjXVs+EW
	hmTzs2q/J8EgkktrNDDSQT8OMKxaO97cxwgqjApe6lNF2lgOa+AnLeNVT+tVHS56
	WrJnxA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy731d7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 11:11:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48BBBJNj016705
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 11:11:19 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Sep 2024 04:11:15 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Wed, 11 Sep 2024 19:10:57 +0800
Subject: [PATCH v2 3/4] dt-bindings: arm: qcom: Document qcs9100-ride and
 qcs9100-ride Rev3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240911-add_qcs9100_support-v2-3-e43a71ceb017@quicinc.com>
References: <20240911-add_qcs9100_support-v2-0-e43a71ceb017@quicinc.com>
In-Reply-To: <20240911-add_qcs9100_support-v2-0-e43a71ceb017@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726053066; l=1125;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=bw6wPFEMbojefbEjweSev5Yv9yRhTIfqSoGctp0nElQ=;
 b=FBgGoL5BNZA5rAzI+gvy25djnt4E/SDIu+My+t39mC7M6HfZ++fEvXsoYXv7VNdXPC8GJMY8N
 /+LhcVgggIMARVMtqPjmy5fE71tms08iDL16TjS1g47SgorE26rQT+L
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 95voJbGWkw7HY11lzP7-sm1eYooPL__W
X-Proofpoint-GUID: 95voJbGWkw7HY11lzP7-sm1eYooPL__W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409110083

Document qcs9100-ride and qcs9100-ride Rev3 is based on QCS9100 SoC.

QCS9100 is a IoT version of SA8775p, hence use the latter's compatible
string as fallback.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5cb54d69af0b..b0ba422eec71 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -45,6 +45,7 @@ description: |
         qcs8550
         qcm2290
         qcm6490
+        qcs9100
         qdu1000
         qrb2210
         qrb4210
@@ -912,6 +913,13 @@ properties:
               - qcom,sa8775p-ride-r3
           - const: qcom,sa8775p
 
+      - items:
+          - enum:
+              - qcom,qcs9100-ride
+              - qcom,qcs9100-ride-r3
+          - const: qcom,qcs9100
+          - const: qcom,sa8775p
+
       - items:
           - enum:
               - google,cheza

-- 
2.25.1


