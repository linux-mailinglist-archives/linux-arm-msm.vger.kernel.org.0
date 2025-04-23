Return-Path: <linux-arm-msm+bounces-55093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D15A9852C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 11:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6DBB1752B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 09:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F5B925C82D;
	Wed, 23 Apr 2025 09:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lhMio3ll"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F819244667;
	Wed, 23 Apr 2025 09:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745399894; cv=none; b=jSukSJd3FFUpxRe9DiDABFXilewGuvneb1XWShfbPzxhzwKNDve6OdNsPKTCeW9xuV/vOtJNJAs5Ys21gPQlXAhcNJpllFETLrdlu2z4T5QuyyL5d/d6wrInx/W3FHSbrvYQYUfhtXhrCIjoV7pS8rI6YFf+auaJgOxCx2Otezw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745399894; c=relaxed/simple;
	bh=tkQFENw2Fthbkp07+ULgTKRHwO1T2VvKWKshSVIlNHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=WIeOtNwcUIXvV1XSkeG6eaYRwkx7FPJeg7NPvalBoX4DdCGT/BrWEK/CZpX5Z/JyRajrAmDo/li50Ib+UQCukWiZrOK5YPaoYrnBpzYUEM1xjLl4Y5F2k6eVqSaBledZwk81MuLX6XTB+sDyyo8EUSH+AUzUZ3IOW8zfmcyjCp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lhMio3ll; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iAku016264;
	Wed, 23 Apr 2025 09:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VUBDaXX5X4e6oGMboQbSGGM6j8vWZSA7rM4SCQN7EEg=; b=lhMio3ll2KD+B6bB
	OiuQ6ARnhVwJ0/QQ59osHOvbCUBPMTlo4TZQvD9FhuKXIbAKmwlXH6+N1YC61ntH
	iuCNlCHHyRYQCk7as/Qh4bmZP8iie0UtbyDPdgRZGI6zfda0HqMCAXih2Qq9y9ES
	Ux/a/J82JBG5dB5dUEHOzMJtEvfopOFqe4AHWU8cqhDdJ2YJ+WO4uCVnwteClwa9
	t3v0/XnmdKHujsi7wzTv2RuB7M1AyAHLRzHhMhSGKfdOrO7tog5VcKHxtzNAIECf
	ENAbhEKeLsWZvvPyitHefRVxbKwcxhytBx8FSWQdyYjTMcQXwebft0Qk4tWhUC0N
	PKD07w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3hk07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 09:18:08 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N9I7Kk006138
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 09:18:07 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Apr 2025 02:18:00 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Wed, 23 Apr 2025 17:17:37 +0800
Subject: [PATCH 1/6] dt-bindings: remoteproc: qcom,sm8150-pas: Document
 QCS615 remoteproc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250423-add_qcs615_remoteproc_support-v1-1-a94fe8799f14@quicinc.com>
References: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
In-Reply-To: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
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
        <linux-kernel@vger.kernel.org>, Lijuan Gao <quic_lijuang@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745399876; l=3033;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=tkQFENw2Fthbkp07+ULgTKRHwO1T2VvKWKshSVIlNHY=;
 b=v6cpj0uBZ6RU0H+1eGvA55VujRQinU00R8zql79vcFz1HtTt55X5pWQSVY+7rgTE4NitBaVLe
 uE+gL7IXRt2CKxuSeTuP7LWjoswBqsm5aTy5L8caodPt1/QT7vtGb8u
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: O_VN2Aw3iFCf67nEZqKKtZ4CY2NlXbJR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA2MiBTYWx0ZWRfXw7evTWU7KTNz rEjLCFo7U5J7gQx/BuNPmPYY2rNYfSg6t+lPtGKFqSwSYgeqtWfoMXaJ6Hy4KAdwGeil6elhX6a +Eq52+jOKKs/DNiv/TPsFX0wWP1rZTqGVyCsVRCWxy1LYxxBRAKd4U55pLMTIlIPGKQo/fjCDEA
 94Q1x6KC6uZtFmibQL491DmmlX9w9/mRebUURreEEd2A0dIjpLESdfRfFAfcT30o9NPSRstoTbb oGAACDAoLctxyxshY0h/AU2/y8C4CXQ6G1A42wEahLhEiZz7Gwzuiwa7Wu9C58osf1nAW3vlqTa GwHzA/CgKUhTQPSKXEmTluCRuTFHwj2fYDOdN/txumHrOdxxKAFAWvB3yCIL1NfupcdnWvWsmeM
 q9wzXM/ZIkWEqB85BTm+mn8Z6ymj/x5LEjfJGL1XdHRnCd/HLhow6ez+8TlI74tPjczzbgv/
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=6808b050 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=r8ZwJzBHc0S7FObOpmAA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: O_VN2Aw3iFCf67nEZqKKtZ4CY2NlXbJR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_06,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1011 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=965 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230062

Document the components used to boot the ADSP and CDSP on the Qualcomm
QCS615 SoC. Use fallback to indicate the compatibility of the remoteproc
on the QCS615 with that on the SM8150.

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


