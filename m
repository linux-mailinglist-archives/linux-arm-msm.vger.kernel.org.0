Return-Path: <linux-arm-msm+bounces-64380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40397B002C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 15:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D0B2175B8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 13:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07ACB28DB5D;
	Thu, 10 Jul 2025 13:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LX3X0nP5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A16E27055E;
	Thu, 10 Jul 2025 13:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752152466; cv=none; b=l9zwUMWMKyk1iERhofWhhTSu/BX5WWOFOuLj0VnJhvLV1MPWlBAGDolbMyFPr0ZGxQWxRrDnxWf0TjvwbrtWiu0u0EXFy3D5zRA1m5y6cnL8+riQa1kzF3yt7GaU6Jmz6v9yReFA4DErRgJCUUhOYhcij6pXQvM+jXVhLtfyqhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752152466; c=relaxed/simple;
	bh=I4T3RH/7M3Qq83blNEdwfK0RU6iZvei/jtigeGzPJcE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=rWk1dW/biQ0PiZB/eZeqsLdLIVYPdatRtSrtfNfvWb7r6h+Fm+GR97B0f5bTOLE7MGCsdISfKq98YdEorzSCcFlkpJKFO0DPRUKtbx9YoOSYc5xDjICsWh7u2+cHBy0V6zEPLKm0uUbXKUo/YerYpuR8DimTe3VGI+7DHewuwxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LX3X0nP5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A93ubL030247;
	Thu, 10 Jul 2025 13:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pa/eGRj0YzVKrQK22PY//PnYZNTnR2z4+sU5Re1dIXc=; b=LX3X0nP53YQwdiml
	VO5bitwPdQKI92nZfb9QNzGG6NJL/xhxMW6IZisXVIzTnu1ue9XfN2ijKcW55KE2
	q0cpORRIS6sQLICvWZC+lmqQRdEf28ZucxlXinQbvefCepKw0lj3IvTWV7mKOE8I
	bRvQyDdPYw3AXoEO3bGvhMrVAYVJN/Q2Z1C16rnbSsNFcpeQ+FP5JgBxzLYyqyrr
	j/VDrPBN9SX3Ma5BBd76CG3WWg84h2nB4354BovZa0cQtC8Y+807reyhNkh/hr1+
	/iy+OoASCZaVRoLY0oiH+lqd7OxOxuLLstr4eTEUgc+e6lMUDhSPBMCCsp8z544Q
	ZI84sg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcg50aq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 13:01:01 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56AD10dp002131
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 13:01:00 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 10 Jul 2025 06:00:56 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Thu, 10 Jul 2025 18:30:39 +0530
Subject: [PATCH v4 1/2] dt-bindings: clock: qcom,videocc: Add sc8180x
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250710-sc8180x-videocc-dt-v4-1-07a9d9d5e0e6@quicinc.com>
References: <20250710-sc8180x-videocc-dt-v4-0-07a9d9d5e0e6@quicinc.com>
In-Reply-To: <20250710-sc8180x-videocc-dt-v4-0-07a9d9d5e0e6@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=686fb98d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=m3WaDHdJIJcFsLUxIFMA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 6FL1bORg_yGlgbjjAlKPJveIS30skfax
X-Proofpoint-GUID: 6FL1bORg_yGlgbjjAlKPJveIS30skfax
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDExMSBTYWx0ZWRfXzqx3rxdOR69b
 IyeczqXumRUJSe3GNeK7A1taLq3dmX9EV9PnQl6fIre5ROPaQWzGARsVUnuQ9x/TCZ8e8nAke0r
 exizwnTj1nMv9r1vzLGRn0tGYIsB/cQOM16P2Tq/nsbBYtETCSE3ePeZ4uJQfQifzuJ9t0wAqVA
 JQ1be8zJhE3mtKTgjjHwBAXt0bqIbgSvAUMto7NW1gkMfRZSxEA2h4MemY08iyWy2kyYOQ2m+t6
 iS5KC9cGsWewPZ0w9K5NrbMmKqjdOvXfQp3vsbD0d9y6z4Mq9pPv0O7umbaaGwCt+mDoufNWIL1
 UYPSaItSueQ0ZLdQ632izcyJJ4ILokXbJ/jWUjqtCdUW61CxJTXbxJ0W2dqmfwcWdlfg9rspCMe
 3Kpi6xC+oCl+ty+k9m81nrQ5li0XFKB7DtzweHTAzUjxzFFK4w7WZPHFuLNt40OSIt4xUXIM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=991 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100111

The sc8180x video clock controller block is identical to that
of sm8150. Add a new compatible string for sc8180x videocc and
use sm8150 as fallback.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 .../devicetree/bindings/clock/qcom,videocc.yaml    | 23 +++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
index 5f7738d6835c4ba999402e163fc85a07e3a47a5a..f4ff9acef9d5fd819bc72252de188b82f31daf88 100644
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
@@ -23,13 +23,17 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,sc7180-videocc
-      - qcom,sc7280-videocc
-      - qcom,sdm845-videocc
-      - qcom,sm6350-videocc
-      - qcom,sm8150-videocc
-      - qcom,sm8250-videocc
+    oneOf:
+      - enum:
+          - qcom,sc7180-videocc
+          - qcom,sc7280-videocc
+          - qcom,sdm845-videocc
+          - qcom,sm6350-videocc
+          - qcom,sm8150-videocc
+          - qcom,sm8250-videocc
+      - items:
+          - const: qcom,sc8180x-videocc
+          - const: qcom,sm8150-videocc
 
   clocks:
     minItems: 1
@@ -110,8 +114,9 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sm8150-videocc
+          contains:
+            enum:
+              - qcom,sm8150-videocc
     then:
       properties:
         clocks:

-- 
2.25.1


