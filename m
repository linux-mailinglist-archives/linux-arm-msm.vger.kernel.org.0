Return-Path: <linux-arm-msm+bounces-57135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9459AADC6F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 12:27:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 341824A8164
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 10:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4D6215168;
	Wed,  7 May 2025 10:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CYKQjybR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946072147F5;
	Wed,  7 May 2025 10:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746613622; cv=none; b=b6TYGBODcXafAC2yB/CxwFnPAkdF78+MxZ6jESIxEtTMwPk+D7uxlOVphnyE8P+POSSyDUcPm3Az68jACveBKYeo9QcDzRxJCe2+pDe8zrw3gXgW/ZG9z2mYpDYhl8iXxG1JKmqItGLAvTCFFAPWvD2Rcbcuel4XdK1zNJxd4KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746613622; c=relaxed/simple;
	bh=mRHd/bi0F4pAEILgJ+Mdf3okfj488JQ4oMxBwTt4PcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=k9oG8lnJ6GthR1t1zk+Sw36PQp8elAeilxTR7/DVh2k5ik955qN2jbxdY8KPqABZgnlTy5RhWYuhPspF4tZ5n1qmloPXR9Gqyquovh2owFWuexXyRspAXHlY4OSQFSUmgLSV8PRQGWaTkBBxcR1qoxOvV8p9RU3UT8H2N4JDgoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CYKQjybR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54758iUx009775;
	Wed, 7 May 2025 10:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZlYW6HAi7Wv3N0kWZGA9Wk/r1UfJW1G0KpByvwo7mFk=; b=CYKQjybR/H1f1FCB
	qepXPS7SoSc7xw3GrJGpXiyFGAnQpj76gcBNAzsudmUK/nZRjyOBUaE08oI3T0ZY
	47GzqJEaxWMJxMSdQ7ZFwFOKtwKKz3iRdyO690XjNyceC10cIyHENN99r2tVyDHn
	Q0yGHQGTQuzLRdjeFX2T/J809okX0pafbOCaHv624aaJx9psv3e1BMFwzZl6i5kW
	vJLVfzuBZZ/uGP+ERYCBslEVuYGcKZHUtEUW5Qw8cQrhN8Dze8CgwNC28Y0Ff7Cq
	H0p6jgoIJoLxEnKRJ6gBvIcZZQJkVTGj2EpLw8SfqZji9IQBhTD0RAiOqRlTvPKm
	YdN9Gg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46g13vrwxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 10:26:57 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 547AQucV032753
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 10:26:56 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 03:26:49 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Wed, 7 May 2025 18:26:11 +0800
Subject: [PATCH v2 1/6] dt-bindings: remoteproc: qcom,sm8150-pas: Document
 QCS615 remoteproc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250507-add_qcs615_remoteproc_support-v2-1-52ac6cb43a39@quicinc.com>
References: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
In-Reply-To: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Lijuan Gao <quic_lijuang@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746613605; l=3100;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=mRHd/bi0F4pAEILgJ+Mdf3okfj488JQ4oMxBwTt4PcI=;
 b=+A0ZgWBCv5FjnZan1ShLSiKLqBZvO3SrVOpRG25mTZzqJF3KseHRaYsv5HEzxyLH91kHdXvyI
 a2r7usGpkdVC2I4co3PNElr4w191hwlV+2VlHDa0Fvq6qXw2EtccBKb
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yHFLFN4k6CPTqu0HC2OcppGCT8IxwK8r
X-Proofpoint-ORIG-GUID: yHFLFN4k6CPTqu0HC2OcppGCT8IxwK8r
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=681b3571 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=5YRdyxvPSVI2_D5q7JMA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA5NiBTYWx0ZWRfX42gZ5A5y4TzA
 GP5lBZ62KuVeHVIMd/ozAqDF5wrJSNUB+ASlCzFgETAPu7DOP0X3BQg7MXzOOI6BibOfWcUfdk7
 g/U6qR5qSo7BkU2uvYtW2wHHBTbuV1TfuFVMM5bv8VWyCq8+LhXFP3AbCQWKNN41rOSc88lfobF
 3JvqbHY0kxdPNJk843qw0+Ea14OO9R9uR0+ZSnJQCfrSKgJFKjuPV6XVFDHhwbRT13lXXREaeHt
 Parbb/duR5qFBMRZKpgmKCOi28z81SYSeOHSU7QD4TMHpb02yuXugoPflWoJDh+IB7TmeQsle2O
 r8vrNJq1Cg7TFapMoejxv/UzFWyZZUOtk1gWRmhzxQkVNEESO5m2pCE1eI5JftheLvagf86znW5
 /TueryrsNx2Ca9sZVQoQAGGsztDejJw8GPAkbK0AjAf/RHwznCnBVihiLZDw1UXhyy4hHO+5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_03,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=967 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070096

Document the components used to boot the ADSP and CDSP on the Qualcomm
QCS615 SoC. Use fallback to indicate the compatibility of the remoteproc
on the QCS615 with that on the SM8150.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 .../bindings/remoteproc/qcom,sm8150-pas.yaml       | 59 +++++++++++++---------
 1 file changed, 35 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
index 56ff6386534d..caee47b52d5a 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
@@ -15,14 +15,23 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,sm8150-adsp-pas
-      - qcom,sm8150-cdsp-pas
-      - qcom,sm8150-mpss-pas
-      - qcom,sm8150-slpi-pas
-      - qcom,sm8250-adsp-pas
-      - qcom,sm8250-cdsp-pas
-      - qcom,sm8250-slpi-pas
+    oneOf:
+      - items:
+          - enum:
+              - qcom,qcs615-adsp-pas
+          - const: qcom,sm8150-adsp-pas
+      - items:
+          - enum:
+              - qcom,qcs615-cdsp-pas
+          - const: qcom,sm8150-cdsp-pas
+      - enum:
+          - qcom,sm8150-adsp-pas
+          - qcom,sm8150-cdsp-pas
+          - qcom,sm8150-mpss-pas
+          - qcom,sm8150-slpi-pas
+          - qcom,sm8250-adsp-pas
+          - qcom,sm8250-cdsp-pas
+          - qcom,sm8250-slpi-pas
 
   reg:
     maxItems: 1
@@ -59,16 +68,17 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sc8180x-adsp-pas
-            - qcom,sc8180x-cdsp-pas
-            - qcom,sc8180x-slpi-pas
-            - qcom,sm8150-adsp-pas
-            - qcom,sm8150-cdsp-pas
-            - qcom,sm8150-slpi-pas
-            - qcom,sm8250-adsp-pas
-            - qcom,sm8250-cdsp-pas
-            - qcom,sm8250-slpi-pas
+          contains:
+            enum:
+              - qcom,sc8180x-adsp-pas
+              - qcom,sc8180x-cdsp-pas
+              - qcom,sc8180x-slpi-pas
+              - qcom,sm8150-adsp-pas
+              - qcom,sm8150-cdsp-pas
+              - qcom,sm8150-slpi-pas
+              - qcom,sm8250-adsp-pas
+              - qcom,sm8250-cdsp-pas
+              - qcom,sm8250-slpi-pas
     then:
       properties:
         interrupts:
@@ -85,12 +95,13 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sc8180x-adsp-pas
-            - qcom,sc8180x-cdsp-pas
-            - qcom,sm8150-adsp-pas
-            - qcom,sm8150-cdsp-pas
-            - qcom,sm8250-cdsp-pas
+          contains:
+            enum:
+              - qcom,sc8180x-adsp-pas
+              - qcom,sc8180x-cdsp-pas
+              - qcom,sm8150-adsp-pas
+              - qcom,sm8150-cdsp-pas
+              - qcom,sm8250-cdsp-pas
     then:
       properties:
         power-domains:

-- 
2.46.0


