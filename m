Return-Path: <linux-arm-msm+bounces-36883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6409BAD4B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 08:39:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC6FB1C20DDB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 07:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C52D1A4AAA;
	Mon,  4 Nov 2024 07:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d65F9/KJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C046719CC2D;
	Mon,  4 Nov 2024 07:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730705967; cv=none; b=GMFDdGGynpN5MOw8VEj9S/uCnCPwG062oPswWhrMdqV6JZK37BwMAvkqg1BeqEIVQq3aHFX7QypbuihC+Dg9ZfkHoqQoc7TDqOgfklSz30Zmfmqk8qvdP+DcsRGTTHJHyj6zk0O/AdUVE+HhPk9u+dxeCfSJGxAQ1GmEyRJNevA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730705967; c=relaxed/simple;
	bh=89+1YdtInzR6yRJzF+GacN6UC7R+AxO+NqeyBa7AMGw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AikrRtVWVZdvoVk661mDzxnCVxJYK79qgIMsv3xayHRJmC28rWIarqGBWnJzzXABIkZ+TYRMRxgnesdD2f1avXM4XR6sS1VRQOszkoOB60Po+jHWCmNF1HwkvtTWdOsb5hlUcY8g9vK/eUkn5JoNKO4yXDSCRtpny9K2D08n/lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d65F9/KJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3NPPnX016857;
	Mon, 4 Nov 2024 07:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oyrVL7hggy4F4fy/qZAfclNSFwZA28TyCokpJknVgoU=; b=d65F9/KJQXGxYUdA
	SzmaPF466VBf8hD/OFW5k57q8nFkkkIfRNhTqIskXw1Na0h+AVq/U+mX8uadkxhg
	n2EWAZggH9L2ZgBaJMzyCDjaw9/UCqlgoJeEr9Z1V3ZQYsX1r39vqqdo3vHsksKW
	bVbd+fZtIUMa7NS8AwHWJOOUVQ1FkgjcAeSyumpScN+QwVucETGXtYmjs7cwJUOO
	zsANE7hJiyisNHiVCFir5r8GSUi6Dr4C/ZbCoWUeoWaEBZ9JsGdKPZH/zH7OmUwK
	P04I6xCUlXm0/2wWxO8Giy/jtFbEFe86ob5XIQa5PFSf3QFKqoDaKKk1J8WuWdum
	Y6vZ3g==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd11udxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 07:39:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A47dL3C027739
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Nov 2024 07:39:21 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 3 Nov 2024 23:39:18 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <conor@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [PATCH v1 1/3] dt-bindings: cache: qcom,llcc: Add IPQ5424 compatible
Date: Mon, 4 Nov 2024 13:08:38 +0530
Message-ID: <20241104073840.3686674-2-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104073840.3686674-1-quic_varada@quicinc.com>
References: <20241104073840.3686674-1-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RYdC6LrFxOCcpTKRfR7Sv3WnAv_xQVwb
X-Proofpoint-ORIG-GUID: RYdC6LrFxOCcpTKRfR7Sv3WnAv_xQVwb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040067

Document the Last Level Cache Controller on IPQ5424. The
'broadcast' register space is present only in chipsets that have
multiple instances of LLCC IP. Since IPQ5424 has only one
instance, both the LLCC and LLCC_BROADCAST points to the same
register space.

Hence, allow only '1' reg & reg-names entry for IPQ5424.

Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
 .../devicetree/bindings/cache/qcom,llcc.yaml  | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 68ea5f70b75f..0b03cb35aa47 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -21,6 +21,7 @@ properties:
   compatible:
     enum:
       - qcom,qdu1000-llcc
+      - qcom,ipq5424-llcc
       - qcom,sa8775p-llcc
       - qcom,sc7180-llcc
       - qcom,sc7280-llcc
@@ -38,11 +39,11 @@ properties:
       - qcom,x1e80100-llcc
 
   reg:
-    minItems: 2
+    minItems: 1
     maxItems: 9
 
   reg-names:
-    minItems: 2
+    minItems: 1
     maxItems: 9
 
   interrupts:
@@ -62,6 +63,21 @@ required:
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


