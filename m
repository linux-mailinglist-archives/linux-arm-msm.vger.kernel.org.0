Return-Path: <linux-arm-msm+bounces-20087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C9D8CA396
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 23:00:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B85B28182D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 21:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC71B139D17;
	Mon, 20 May 2024 21:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JExGrcze"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE9117BAB;
	Mon, 20 May 2024 21:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716238829; cv=none; b=m616wA2mgdug4YK0T2Of6kJn86cS5o1UfHpxLjGpBr3z3yrZRY78FNkOr7ElT4uHUSsP3jx31eIyrbD8R41DYMTM3vd2C2YcxnC6NEqO7pE83iP2c5Z6gc/lsAOk9SiAgs7E8jOurQBn2sMr9Ze7jbj+15L1yJrWgQv9VN+s8pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716238829; c=relaxed/simple;
	bh=V0dOZxWPgDrqV3kwmvN5CXjG3vARp49SCbjGtF4s+sY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=flwACFf/xjKYSTRoFQhTxkOMiyAVP3qPGp9AgOL/+1COyDbFlDWzvlIP1FYg0Kqpbl1CPhBSOP4disHwqpFUZvVKh/PMzKNtwJPZjgnOOgxqtbF1WCE/oSmwjP8mllAytWINbGutq0lQFd62mo0wyMoMtS4jVdJzxomt6WXCOds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JExGrcze; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44KBtUQ9014086;
	Mon, 20 May 2024 21:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=qcppdkim1; bh=Xej7Mdj
	8B3W4gF4TEFskOP5nfnYJbm8rIl6YpnPsaqA=; b=JExGrczeJ243gMqcj2MXtqA
	U7G4SzP6xd9c81RaCqvYkMUNGB9oTjNJSrihJ0vb7Jh6YeXRigr7xi+xOj9vAn6/
	V+wlTmX8C3Adfvkjr3lV1cYsmO0MSdYv+R4gpPVcqSB979SvSrlZxNgCZTo3r/Yv
	Xcej6/YWuErn7pLx+yCH4ssTuWc6Fr2IZzvr+MKKQ+XEOKGj60x9ViUcA702lA8k
	SMLxf0UT2yNUKqO6cCh5EcATO71Anj7Z1ThgOPMVCM0Ts9WiOqvgh3A9jp9MLMZd
	e8X/gwA0geOrMwjEvyDiftTIs+AlN7g0EEQIFhQhq4xEAOmI4ZfzY3l2WjVUnlw=
	=
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n45madr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 21:00:22 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 44KL0LFC016479;
	Mon, 20 May 2024 21:00:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3y6ndmhegr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 21:00:21 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44KL0LlG016471;
	Mon, 20 May 2024 21:00:21 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-uchalich-lv.qualcomm.com [10.81.89.1])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 44KL0L79016470
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 21:00:21 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4184210)
	id 9FAEA641; Mon, 20 May 2024 14:00:20 -0700 (PDT)
From: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Unnathi Chalicheemala <quic_uchalich@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/5] dt-bindings: arm: msm: Add llcc Broadcast_AND register
Date: Mon, 20 May 2024 14:00:13 -0700
Message-Id: <6a271ba29a0e72da3c5ff81ef255b964c946ee0a.1716228054.git.quic_uchalich@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716228054.git.quic_uchalich@quicinc.com>
References: <cover.1716228054.git.quic_uchalich@quicinc.com>
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
X-Proofpoint-GUID: I1ahL7tKZ5EP0o2ddZCD3aGpdbChTUTZ
X-Proofpoint-ORIG-GUID: I1ahL7tKZ5EP0o2ddZCD3aGpdbChTUTZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-20_11,2024-05-17_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405200167

The LLCC block in SM8450, SM8550 and SM8650 have a new register
space for Broadcast_AND region. This is used to check that all
channels have bit set to "1", mainly in SCID activation/deactivation.

Previously we were mapping only the Broadcast_OR region assuming
there was only one broadcast register region. Now we also map
Broadcast_AND region.

Signed-off-by: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
2.34.1


