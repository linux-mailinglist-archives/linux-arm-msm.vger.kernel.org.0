Return-Path: <linux-arm-msm+bounces-64155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7C6AFE463
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:41:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2521E7BC594
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 09:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F82D28853C;
	Wed,  9 Jul 2025 09:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Cez1ruNf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD8C2882C2;
	Wed,  9 Jul 2025 09:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752053904; cv=none; b=KxTHPeYwDxmobr43Iyvy+KC2oY2QIcL+/SFNPVvet1jSrJBhmZ/isapfeUmkVOb2/Nd6SczcKqzpkm51AEax7/4k3thA3WZI/gl+ReF/jAwTy39fFUrASVMKdr9cT3AJvNyz9ZmjL+oWyWVVkmLMQdSyUFc1X0SphBoTX8Vi2+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752053904; c=relaxed/simple;
	bh=fX+pnErT2LCfcbiQnnzsWPmoMTzd+csI5mYick7lm8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lsbxRhZGZWIV1xcoCgDo4uSqZ8Io+/7a6VJtnHjVqYUX9OhaxO7tG1BugfvtM0q0YxWrqM5/1ton2rAhwkS8CVNL8cFzHpwL+C+yrUiOA1XgPCZUa3V1Nvl0HjKLOLwNkBVb/5SRSN/xvCB+KJSo+bcog0uYjbsRGRXtqDfyE/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Cez1ruNf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5697jLc2009942;
	Wed, 9 Jul 2025 09:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gJyUFZ33OjhnLmW5M/6BEtQtoYLsnyHEGQkd50rH8C0=; b=Cez1ruNf7i/52Sb3
	jBIqry0Z71tv9bzdJ/Y6W/8Bq7vAkm/T0CmaZ6nZNloi7ji3rwTGLmnGEAbRRSpi
	mT1AKD/OKH5pkd1VDxAohutVwz9ZolLc9JxsF9/WlaHi8DoO4bfQw/yyCa8URFJb
	E7pO28qvTKG3ftKgMZMAUpRG2obYpvB14UG2xnyM3mYlkTlSFe/44efr2DJTncW6
	1d/Zr9JjUUw2bVB2W1aS8FzqugYB7vQ/6d13YRtcsxX4+3JZFU0eo/QNm8nl48Tb
	pyzyIc4Bi0R89VCcCXQL/irW2tiAmaTKnJLOPogE5oIfAbK/hn6vz+z3WWRq/NV2
	jV7d0g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smafgb7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 09:38:19 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5699cIoj026760
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Jul 2025 09:38:18 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 9 Jul 2025 02:38:13 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Wed, 9 Jul 2025 15:07:26 +0530
Subject: [PATCH 5/8] dt-bindings: clock: qcom,qdu1000-ecpricc: Reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250709-gcc-ref-fixes-v1-5-ceddde06775b@quicinc.com>
References: <20250709-gcc-ref-fixes-v1-0-ceddde06775b@quicinc.com>
In-Reply-To: <20250709-gcc-ref-fixes-v1-0-ceddde06775b@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        "Srinivas
 Kandagatla" <srini@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZJ/XmW7b c=1 sm=1 tr=0 ts=686e388b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=cJd_3PyVQ4VzZXvhod0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: lVQ18SPKq2mazYlrgdHgenZLoD7BGBZB
X-Proofpoint-GUID: lVQ18SPKq2mazYlrgdHgenZLoD7BGBZB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA4NiBTYWx0ZWRfX9IHuciawjEP3
 48wWZQw9gw/5L0+yeVbXlzT5E5gEfJcjzk8J+UzYp6oE0wFSMK0Uvx0Mal7tyF4uEOM9bS3bDBg
 lsjb4qeLb0gIIa4K75/ZXS6qtS1E9z2IdNHU+CSYETtkmImQEalRLPKZ8eNWjxpLDDfl5LTuOgm
 +5uGIazzeUApeo0D9rnmOpgJW4Xswgh4XA6XQQlDTadxjGwCim16HcsWC2+KKDmUB5gl//Mz2SG
 YlVTO6ls7JB24rAzr1pY0ljGE6FrhiPvKzsfL/5PowZDbYtygIPuaL1ovsgLOugGPeGGfyQH9Hq
 g3LYcciD38FnqWkPsQL7HIBRxlY7FzbKV4rZ22TFv2PavSVG8LG0PtJ4qOYfjBG5qSUW9mz919U
 1j53RRZ0p6qLjuWPLqFvygxAmkKm62RGmh5T/NGOxEH64laZUwcpQj0hL6CKGfvI7cm2mn7I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090086

Reference the common qcom,gcc.yaml schema to unify the common
parts of the binding.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 .../devicetree/bindings/clock/qcom,qdu1000-ecpricc.yaml | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qdu1000-ecpricc.yaml b/Documentation/devicetree/bindings/clock/qcom,qdu1000-ecpricc.yaml
index fd21df0e76976e6fecd32db5ee4a5eeec2757083..f452529437be8149ed83d95655bf89d34466f83e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qdu1000-ecpricc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qdu1000-ecpricc.yaml
@@ -21,9 +21,6 @@ properties:
     enum:
       - qcom,qdu1000-ecpricc
 
-  reg:
-    maxItems: 1
-
   clocks:
     items:
       - description: Board XO source
@@ -34,20 +31,14 @@ properties:
       - description: GPLL4 source from GCC
       - description: GPLL5 source from GCC
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
 required:
   - compatible
-  - reg
   - clocks
-  - '#clock-cells'
-  - '#reset-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.25.1


