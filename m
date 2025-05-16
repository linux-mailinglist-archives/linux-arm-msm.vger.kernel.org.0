Return-Path: <linux-arm-msm+bounces-58163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B56AB94AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 05:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43AA37AEB97
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 03:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D7F22F772;
	Fri, 16 May 2025 03:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f9Cf8JH3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E15229B01;
	Fri, 16 May 2025 03:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747366076; cv=none; b=agMgeaNTOHPIY8T8WJwgm//k07O7yligRtqB2BqInZWk8tbXBdIrmE1/CxEiKprzQCn1qH9qWE96eayDng/jwftcVHmr1zEtTCV8StEDqvgF7sK5pLV2AcPn3P1r3NBI4iNkiiOUF98siumZpnQVTf/VvGO4nwYI5yzT9Qv+I6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747366076; c=relaxed/simple;
	bh=1j47KcCe6SLJPKsy6XK93D/ln0p8cs5lZX4/LALg+8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=SajOMPmRVkhl7G26d8w56hg5SNjREFUcs5SBmUQLKlMOqA6XRQCcMVPAYj49dxrz49jzx8FP60OH/zYzjOxPTfbfFKjwiVcuZPXmSL5FJMigpOjHVWBrAnIW4nk8SjD/2RFwzY8MT3bl0TFPG6na3r4x+3XveIpsm69QdP3Exwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f9Cf8JH3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G2hWct032612;
	Fri, 16 May 2025 03:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1rnjdRYW75ys876Xp7HRbAmCoIU7R7XEFHekZs4sBw0=; b=f9Cf8JH32WHEe+Va
	JbjdaFSMdI9IjgadQlGYvHxMaWet5ls6DRAYezlv58fQNuv++HC0O8OW3ONWonTc
	SmjTuxphcarxgo+DN5uYhk1ybSqHOjcSlaI5OjSxy85tvkd9SS/yx9CaW6CZwsUo
	yPFhXFYRCJ3X55MlkVwmQTFeN/IklO5E2HuqzhAKFLdqi3CIfELHZlb29zheoCi2
	nuCE27L+ptv+1kAGCQHJzlf1ZMbLLQH6WpNBW1sGhIqaqnA3szGj7xK2297/AvtH
	6MCI7iszNETcfrC/gSFQvU078qd6/TMXnTDdgU7h0EI2AIdgd9FfXFowSzN7rePd
	/vwmEQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcp0c9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 03:27:50 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54G3Rnis018521
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 03:27:49 GMT
Received: from lijuang3-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 15 May 2025 20:27:43 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Fri, 16 May 2025 11:27:02 +0800
Subject: [PATCH v3 1/6] dt-bindings: remoteproc: qcom,sm8150-pas: Document
 QCS615 remoteproc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250516-add_qcs615_remoteproc_support-v3-1-ad12ceeafdd0@quicinc.com>
References: <20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com>
In-Reply-To: <20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747366059; l=3360;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=1j47KcCe6SLJPKsy6XK93D/ln0p8cs5lZX4/LALg+8A=;
 b=LOIzB+8cPxUWbMOzo66Rsm7lSEDPCh8E4Yh5CAW/JYCzeE0lAY/Qal+d4PphCq91XaMq4VUWU
 7o0riu6sMHfCyT8saOfVBRjXtH8gpTc01999QARLR0z/iBLyobd0ASO
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: N5pVLNLedK1aJ39HLmCpOkxwPnnsTAer
X-Proofpoint-ORIG-GUID: N5pVLNLedK1aJ39HLmCpOkxwPnnsTAer
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDAzMCBTYWx0ZWRfX39cZitHTxBFl
 zEAZSdWTwDbeMJrbUm6pfNqp8qCB/sBDdO8P56mKdDCo/i4ENS2dZ5IpKIBcOkgXRmJspqK+1Dh
 XmV9q+3yKzgY/McYqgpNmbcN0AizfQDWngsBicMHa3S8OoTnGzlY3p1Ig9HFDRnf19PcIA6mhZW
 EoQm8ZPJ6PhP8Ft2+Fq/Fo7Gf+GN9HHs2A82gnwYbkeB1+7Hikm84SkFFLSLz86DLl8kby57hL4
 ZI7hLzTliB3IJm7ipS2UGN4TA6pJzybIPsob0qT1/mAEaBYd31hMfvpATBNlx3dCTfgNPAuMEuM
 alQ/VFDs6WyvrALgPJ61p1G0cUdNBIbk826Ab4tMgIN1hmII3Odq7lhoNCxWA65R8OUJb40evve
 yxyRUqumeioyYSqSTP9U8I9KgQ9VjM+fxPXwGWTdKYMu5blGHMCqU4H+FxeX/KHzjjNmH3P4
X-Authority-Analysis: v=2.4 cv=Gp9C+l1C c=1 sm=1 tr=0 ts=6826b0b6 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=5YRdyxvPSVI2_D5q7JMA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_01,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=987 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160030

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


