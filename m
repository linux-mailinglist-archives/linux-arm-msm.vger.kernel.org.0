Return-Path: <linux-arm-msm+bounces-38276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3D29D200E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 07:09:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 869E4B20F66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 06:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713D6153BFC;
	Tue, 19 Nov 2024 06:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Fwg8jmLR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8CB150981;
	Tue, 19 Nov 2024 06:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731996556; cv=none; b=XTwhnbximYGG9bKcFzyibcAC/I8NIPZ7zb8ceklV6xvEmtj/rmfezM2aIr8gWA8f0x8LmfZCQPmSV9fLKQMjUuqOaIkRfssH5vG+D5Rv/iSnzU3GK1p8AvxgTC9wOiZS9Az6B5cHY1fzdiysi9QgV5veUMYAPeUwq+GAP+qY1Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731996556; c=relaxed/simple;
	bh=0DI9gzC7ladnZGGvZmVBK2cdJY2pSpFyY8/cVWj8kxs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lnuOFmBZE2zchY5TzVbzmBVQ4AoJhaB/Eix5KRKVts/h3rH/ZRcFRTQtbkBEzx5gvFU8sdX/2f5N614pSDcEU2g+wWyRiJynRy9KfiYrqA47RVaKXejSQ1EjCwIIdIQgYlfEgrEqgd4eFA9AWnyKNfYXsR91eRphepxn3cJi0pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Fwg8jmLR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIGGjvJ004796;
	Tue, 19 Nov 2024 06:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pA1E4me58bzShog12sUn2LI+ekAXQNApuzEK1c30DhM=; b=Fwg8jmLRNCJ0Jyul
	r4/LMRljhX1OWT1hCnmSRPe56f5KBiFwHCVp2vXZ6DoxxwlC1xX439xujxyO/MSa
	oPNtTJJX//agXIPkaQInpJJAa2qa1ENDLE8JbIpvprpMeLP3nb+uYddpjJZAMZTO
	1Pm0opLZcdB9HdrUgS5f2nmIlIVUeqzERuJ7nNofdvytOy5gL9m8Ht4YQKVKdak4
	gkDLMEa+XYhOEqJVoDuHNJwCZUuHALMVrRrLZJlNq0NEq/JF/7n8G0TPsxmG0rC+
	ASD4u0WHUwCkyVw9nf9qUSHmo9PzrZ0buk0JgrdcSHTx6E9MVgQ7n+xYt1OWQW5/
	LB8uIQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y7skcf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 06:09:11 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJ68UZo015070
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 06:08:30 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 18 Nov 2024 22:08:17 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <conor@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [PATCH v3 1/3] dt-bindings: cache: qcom,llcc: Add IPQ5424 compatible
Date: Tue, 19 Nov 2024 11:37:52 +0530
Message-ID: <20241119060754.3350320-2-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241119060754.3350320-1-quic_varada@quicinc.com>
References: <20241119060754.3350320-1-quic_varada@quicinc.com>
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
X-Proofpoint-GUID: waj7DFvpWJdIh6TiIGXzF71ihd_wEdMo
X-Proofpoint-ORIG-GUID: waj7DFvpWJdIh6TiIGXzF71ihd_wEdMo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190045

Document the Last Level Cache Controller on IPQ5424. The
'broadcast' register space is present only in chipsets that have
multiple instances of LLCC IP. Since IPQ5424 has only one
instance, both the LLCC and LLCC_BROADCAST points to the same
register space.

Hence, allow only '1' reg & reg-names entry for IPQ5424.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
v3: Rebase to ToT

v2: Add Reviewed-by
---
 .../devicetree/bindings/cache/qcom,llcc.yaml  | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 03b1941eaa33..612de26b7064 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -23,6 +23,7 @@ properties:
       - qcom,qcs615-llcc
       - qcom,qcs8300-llcc
       - qcom,qdu1000-llcc
+      - qcom,ipq5424-llcc
       - qcom,sa8775p-llcc
       - qcom,sar1130p-llcc
       - qcom,sar2130p-llcc
@@ -42,11 +43,11 @@ properties:
       - qcom,x1e80100-llcc
 
   reg:
-    minItems: 2
+    minItems: 1
     maxItems: 10
 
   reg-names:
-    minItems: 2
+    minItems: 1
     maxItems: 10
 
   interrupts:
@@ -66,6 +67,21 @@ required:
   - reg-names
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq5424-llcc
+    then:
+      properties:
+        reg:
+          items:
+            - description: LLCC0 base register region
+        reg-names:
+          items:
+            - const: llcc0_base
+
   - if:
       properties:
         compatible:
-- 
2.34.1


