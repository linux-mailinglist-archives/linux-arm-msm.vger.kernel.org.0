Return-Path: <linux-arm-msm+bounces-12254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7CF860633
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 00:08:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0606FB22C5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 23:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F121E1BC47;
	Thu, 22 Feb 2024 23:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kD4CPY5V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FD418032;
	Thu, 22 Feb 2024 23:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708643297; cv=none; b=P488RPzy8JHPjInZanhKmj86lTCFGl97vXqofnABFhBkSbuGWZHan3UXeERgVKdNZ6pjSeRelQ29gE+Fh0hqwMeStMyFtVNxefydYua8r3M6HUhqHI96ih8c1YgSmttTtjsDpnWruQMhVUaLP789z9LOuW7QAsmgKNdDqScj2xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708643297; c=relaxed/simple;
	bh=tbhcdGsZz5J6Il/GyIV16cS31UxNQYHsB+cWiVE748w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MGgL/f/Z56me6r68Fr24rS3lU3Rf8PvkrlpDLUk28eOVAk2c3fld7lQeYvwNrfyN4mVI1mpEgQKlCemwO/3BJ6zyfeKbn4TbElWc/iVCBTcjhJogHDDGx3i+VyoMidFy1h2pNSf7Ym3BNUxaNYN7zknmWmvUdf0d1hEzqYo7Q20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kD4CPY5V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41MLmjL7004888;
	Thu, 22 Feb 2024 23:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=5lGZ9UC1ti19oSeik0qc9lHl96T+ATYFavZCW5VOyN0=; b=kD
	4CPY5VU3lNw+MwS9YPQVNB0u+ftYSgImFgprwoTylGdAyf+lVELnEDfqZKwRyoD0
	IhAYT0auIw6JhBa/NLF04EGo2gNeaaS2PERmiiRRGU1WoVkPaWHZvBPiscgEKyg1
	9jNIqnU5Z3krAQYR/A8cutjv1m8pCkjGdLjlzvHFe6f4+eCqYoJUjnouk7+U9iiO
	Zw9CSFT2T3zLl3v9Ywj+zGek9SaAWaVR4xwRkoe63eIH37QomO5j53eBxosO+EAa
	aO1dBmp+chL6Rd+iK4fyV4pjQ5vRxqhFFj2oUUKP9x8mh/aoeKsP2+lSMbmrAT9R
	Bw2wuOsgDpuDXUoXSRCA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3weedkr50a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 23:08:11 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41MN8A81029081
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 23:08:10 GMT
Received: from hu-uchalich-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 22 Feb 2024 15:08:07 -0800
From: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
Subject: [PATCH v3 1/5] dt-bindings: arm: msm: Add llcc Broadcast_AND register
Date: Thu, 22 Feb 2024 15:07:53 -0800
Message-ID: <93143410af20807c8451539db7fca7cddf31e7b4.1708551850.git.quic_uchalich@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1708551850.git.quic_uchalich@quicinc.com>
References: <cover.1708551850.git.quic_uchalich@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: abl6BYCRES1JKyIXGg87GIDzRTL5w7-p
X-Proofpoint-GUID: abl6BYCRES1JKyIXGg87GIDzRTL5w7-p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2402220178

The LLCC block in SM8450, SM8550 and SM8650 have a new register
space for Broadcast_AND region. This is used to check that all
channels have bit set to "1", mainly in SCID activation/deactivation.

Previously we were mapping only the Broadcast_OR region assuming
there was only one broadcast register region. Now we also map
Broadcast_AND region.

Signed-off-by: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
---
 .../devicetree/bindings/cache/qcom,llcc.yaml  | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 07ccbda4a0ab..a6237028957f 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -141,8 +141,31 @@ allOf:
               - qcom,sm8150-llcc
               - qcom,sm8250-llcc
               - qcom,sm8350-llcc
+    then:
+      properties:
+        reg:
+          items:
+            - description: LLCC0 base register region
+            - description: LLCC1 base register region
+            - description: LLCC2 base register region
+            - description: LLCC3 base register region
+            - description: LLCC broadcast base register region
+        reg-names:
+          items:
+            - const: llcc0_base
+            - const: llcc1_base
+            - const: llcc2_base
+            - const: llcc3_base
+            - const: llcc_broadcast_base
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
               - qcom,sm8450-llcc
               - qcom,sm8550-llcc
+              - qcom,sm8650-llcc
     then:
       properties:
         reg:
@@ -151,7 +174,8 @@ allOf:
             - description: LLCC1 base register region
             - description: LLCC2 base register region
             - description: LLCC3 base register region
-            - description: LLCC broadcast base register region
+            - description: LLCC broadcast OR register region
+            - description: LLCC broadcast AND register region
         reg-names:
           items:
             - const: llcc0_base
@@ -159,6 +183,7 @@ allOf:
             - const: llcc2_base
             - const: llcc3_base
             - const: llcc_broadcast_base
+            - const: llcc_broadcast_and_base
 
 additionalProperties: false
 
-- 
2.25.1


