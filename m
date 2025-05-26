Return-Path: <linux-arm-msm+bounces-59369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2187AC38F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 07:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A1BB3B3A52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 05:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D58F1C84DF;
	Mon, 26 May 2025 05:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dWx+pnpL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BEA1C84BB;
	Mon, 26 May 2025 05:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748236942; cv=none; b=WSNN2xPSmJa5PtJirhpG1pyN1uJg/hSrujKbJL+EC78+hDpLpL9pCGbDWghBh5zYQQ4b+/cmz1hXGrqifD+RwyI7KJeHubjgzEawsrROUacxsSBYK3rxcjCEeZsWY4vzYvaOqy2hxqINY6KdRWpBQ0Z9hYs7Dy6atRAYAj0fHc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748236942; c=relaxed/simple;
	bh=1j47KcCe6SLJPKsy6XK93D/ln0p8cs5lZX4/LALg+8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=EqIJX8EDgONx+Z3HKKAuj4xfF1H5aX7vI1mDodiAtVQ1N6ZQH4KIWOPAw7RDuJBn6gbEXJpJdstCCmyXGK1jtTEXJ0GNfZifKrAGlr1MFkz52lf/kS+kcNT/4NmmxnBbN8uXjJaL8N1w+Y2BBDhfwtRGYsnJ+DKfGBgtj5BnkUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dWx+pnpL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q0s1Lo004039;
	Mon, 26 May 2025 05:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1rnjdRYW75ys876Xp7HRbAmCoIU7R7XEFHekZs4sBw0=; b=dWx+pnpLKfZr4V0x
	SsBA6mLeYN0qzXIpCTV3pWl4yjKVgWT3k1gGoan4viKm0CO7UVsUFP0S0K6kPBsz
	+LocmvI8LyJ3+9CfzDvwBkKsObWb4WZM/wiUuFRsPd/w8i0Yvj2EAIho7zOamdUC
	uB/BGl53MKUYAKJjLSJwq2Wb/j3yHwGXxbjmRIkgSLfvJEqmeJn2rao/h+e0UD+L
	hn6BMvWLxI8KXZlgZ9OmZtmznZHLdC+6usU862Cg30QfOkeAlFA4Lrdp/qM1mCm5
	OlhBJoK0XXCAfgwD7tt8EPB7VI82pnKzAbJtyFRUjEwDOj3+YcRmQfS3lmI6HHc7
	qJmHMg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjk01m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 05:22:14 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54Q5MDUQ012108
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 05:22:13 GMT
Received: from lijuang3-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 25 May 2025 22:22:07 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Mon, 26 May 2025 13:21:47 +0800
Subject: [PATCH v4 1/6] dt-bindings: remoteproc: qcom,sm8150-pas: Document
 QCS615 remoteproc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250526-add_qcs615_remoteproc_support-v4-1-06a7d8bed0b5@quicinc.com>
References: <20250526-add_qcs615_remoteproc_support-v4-0-06a7d8bed0b5@quicinc.com>
In-Reply-To: <20250526-add_qcs615_remoteproc_support-v4-0-06a7d8bed0b5@quicinc.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748236923; l=3360;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=1j47KcCe6SLJPKsy6XK93D/ln0p8cs5lZX4/LALg+8A=;
 b=d86Gjd7xSqBaNrfwoWl5QBQpu9PT5iq0F+otvLAYJEguVG/o3PQAcY8NU4iRv9ECtCUSlXzS1
 /bcl2Kv2SxlDYPAysR0Un8+JkG3ih28GcjTPrQADy2fnqj9iz4qWpo/
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=6833fa86 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=5YRdyxvPSVI2_D5q7JMA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: p7Gc771wC36FsNZzKa1zb6Ape_NTqV69
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDA0MiBTYWx0ZWRfX702dR4P/3XvG
 EeB7eANIZsAr8ebnE6CbxR9UECalaUfLCM5JWJNtl2y4EpxwPxPdhUDH79+i3GlT+OlK5fizAnX
 f/N2yHcMlYTeEZ1X5pI/GkNUuFH93NpU4XvzTFlwb8rxQSAfrgUHM8vJw5bOLJJt7OcLg0vxC8d
 IwsnA8OGd30KmMsN7TLStwuOTpD5AFmUUJ1mVEQtNd4ZfbCODuSyXqFDNmZBEvJNtRfsU1q/i5W
 /2MLDjhBBoRXCr2H6Jj8XPSdOEMBowXuShfDbxrXiKhENs8wSJcmiv1xQUv/W5wM73DcMvjBoZ9
 OiQDIyS5YUsy8/gJ14Wd787EkxMOm8zyBCjxEasGKlUNHDNjUqXcfmDHMszZsvnCJq0r+U3TikS
 xGoV52+XPIxmvg0ItTXnR0X6/47fQ+tqeYSOzXX28vAnFhF3e45gCSwcARLBrL2yutrTVqoX
X-Proofpoint-GUID: p7Gc771wC36FsNZzKa1zb6Ape_NTqV69
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=988 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505260042

Document the components used to boot the ADSP and CDSP on the Qualcomm
QCS615 SoC. Use fallback to indicate the compatibility of the remoteproc
on the QCS615 with that on the SM8150.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 .../bindings/remoteproc/qcom,sm8150-pas.yaml       | 65 +++++++++++++---------
 1 file changed, 38 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
index 5dcc2a32c080049ac6c486614a5bd4d71fd3ed62..a8cddf7e2fe1a84064730d847d2f0601b67572ff 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
@@ -15,17 +15,26 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,sc8180x-adsp-pas
-      - qcom,sc8180x-cdsp-pas
-      - qcom,sc8180x-slpi-pas
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
+          - qcom,sc8180x-adsp-pas
+          - qcom,sc8180x-cdsp-pas
+          - qcom,sc8180x-slpi-pas
+          - qcom,sm8150-adsp-pas
+          - qcom,sm8150-cdsp-pas
+          - qcom,sm8150-mpss-pas
+          - qcom,sm8150-slpi-pas
+          - qcom,sm8250-adsp-pas
+          - qcom,sm8250-cdsp-pas
+          - qcom,sm8250-slpi-pas
 
   reg:
     maxItems: 1
@@ -62,16 +71,17 @@ allOf:
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
@@ -88,12 +98,13 @@ allOf:
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
2.34.1


