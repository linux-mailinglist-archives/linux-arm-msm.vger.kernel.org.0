Return-Path: <linux-arm-msm+bounces-47713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D85BA320E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 09:23:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B4A01888FCD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 08:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C410205515;
	Wed, 12 Feb 2025 08:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YU/6RE6m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C5D1EB9E7;
	Wed, 12 Feb 2025 08:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739348590; cv=none; b=HuqUgddyP4J41uoIEOhpPQDZT6uMKuSQFRU8zFd/Zg5YfI8gmSGDil3eOq+LnZygJnSEy9uIO9C4VgU9piMeHHMJJNB+1d3ZM07W/Mv0T2MIUMw03lVYuEiNHMSumRJylVXJ7TRshlthaXEXwGoGTqaK/EmHxJEFoGUJBAULRG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739348590; c=relaxed/simple;
	bh=KYdDS6B7wvjb0omg8B10oPqGBZDKPXF7RR4qQ8hWeNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=sbmd0UMqzvcz1Eiqaepq50LeuEDIcIi+tDGaEw9814mq+fWomEGWYCqSMBGLMoXP24gJI5uHEqge9gtz5f5VVAeTBEYkeQIfQZtJZeogEqNZsPIJEBJw8ISs5P9nhaYW8Vlt4ArEzSGldc9xoJP4ozfZSPLLbcdVFpV7WW8xgiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YU/6RE6m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C2Pl4c008015;
	Wed, 12 Feb 2025 08:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7cHzvg6PF6lQr0kj15FvGwSQkUwo93/jKuEkuqAaNkI=; b=YU/6RE6m0qVmZ0jo
	omXhH2LBVv+ZwBlbjGK3u+nll5clU9BHnY1oJCLB7YbP0riSstJevXVvrNYOVz0i
	Ac4Wkv1iVTOCNhU8uYV1RC0XJtNYy8o8R1c3GyTzZ0Pt2X5RDmvepw2Y5yRL5H1N
	GhCdg37+M/8fzOQpZzXNjsFGJlKoMoxF9uaKsLeQmTyjB3iauMQGK0QaVmI6zVmI
	acjd3SyrTzC8c0ik3LtcMmHVhf2OqVDFJgDw0OMFgW1eF1pO6FdBcGOaq4j3r3nS
	gryeFgTSBGqLLUUDLAJMe+zLEus6kXHS4azOybV2sGYp1QrOsSuTv7fC40W9jIAO
	QTCRdg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qy4dc5e4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 08:23:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51C8N4pS017594
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 08:23:04 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Feb 2025 00:23:00 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Date: Wed, 12 Feb 2025 13:52:19 +0530
Subject: [PATCH v3 1/4] dt-bindings: clock: qcom: Add compatible for
 QCM6490 boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250212-lpass_qcm6490_resets-v3-1-0b1cfb35b38e@quicinc.com>
References: <20250212-lpass_qcm6490_resets-v3-0-0b1cfb35b38e@quicinc.com>
In-Reply-To: <20250212-lpass_qcm6490_resets-v3-0-0b1cfb35b38e@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dhZk7qTrRSs5K45G4bacrzJMGX-L53kx
X-Proofpoint-GUID: dhZk7qTrRSs5K45G4bacrzJMGX-L53kx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120064

Add the new QCM6490 compatible to support the reset functionality for
Low Power Audio subsystem.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 .../devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
index 488d63959424088ede67835eb4dcf3feef6d0848..3217cd3c3b602e62b5cf2270fb351a6988d025aa 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
@@ -20,6 +20,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,qcm6490-lpassaudiocc
       - qcom,sc7280-lpassaoncc
       - qcom,sc7280-lpassaudiocc
       - qcom,sc7280-lpasscorecc
@@ -130,6 +131,19 @@ allOf:
         reg:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,qcm6490-lpassaudiocc
+
+    then:
+      properties:
+        reg:
+          items:
+            - description: lpass core cc register
+            - description: lpass audio csr register
+
 additionalProperties: false
 
 examples:

-- 
2.45.2


