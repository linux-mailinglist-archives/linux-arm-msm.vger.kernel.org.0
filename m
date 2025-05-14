Return-Path: <linux-arm-msm+bounces-57950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2260AB7534
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6B843AA143
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970CB28CF56;
	Wed, 14 May 2025 19:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lzfFRTY1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0380628C87B;
	Wed, 14 May 2025 19:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747249772; cv=none; b=lypYbNe2rnu7qX2vuEkCvRSpCV5GlO/gCa+NwNebpO/QocpUPNomxjDtjgAua6D/TVJn7sseCEaU6gMaabkmbglrw3hWzBY4XRXeaBUZVBcwxIrjgCYQdoJ0/5dxAs/xm1nDw8+dQZrTbGeA8q4CtsBmstffQdyNwQq1468XdWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747249772; c=relaxed/simple;
	bh=qMFEHICt0FBm3xMzs2TSCF2DHDIJx5nJ2vL4q9g2gXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=oHJzCdUFlb06ReWE0yAlpvgG+OgBJ8Oi0r7TiOTr6+1XXAWYdoqrT0Fni7A945qnp28yS02moQg+3a/kD1X7jz2/WkYhqCW19Y+wqVhjt5G5rzwF2YgPwnuPgnGAfTUOWgGGm5XFJ8HdmEe85Rzn+cDzDE6r17z4TJBELWgy7wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lzfFRTY1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuw1K002608;
	Wed, 14 May 2025 19:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PpvYOmbFwqIYEstihQvJPyWW0+nb/MKyu7+2+ms0a5M=; b=lzfFRTY1ZSxKyvC6
	NRswA/QmlTw6h+EfrFGAMV3rS0AgbPfhN+u3mxjMeIKnf+b2Q2zWajw2ReEfMX2b
	DwX0oHsmC8DvlTr2OQethF43PjHx7FY5TX9jcAZSsD2OC60VJoEBF0ZWjDkAtqq3
	n2EW61BtwcgmvyYEgfoBBNE0nUKXHp/mACq3g7e4t8ydd4BQHYmk3XQaT7V3uBq2
	NM7Dui3L8MsSsBwxESqB32zeAK+0NQohDkVJ3oJpQgv8Cl021ho07RlFhQnMcQGx
	2qxvLpY2QvNbRkq5LTGyYERU/YWVjYey4YNwMve5Js3KETer4uZYAy5cvF4ZvmCJ
	U6gzag==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex3t17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 19:09:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54EJ9QB9027709
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 19:09:26 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 May
 2025 12:09:20 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Thu, 15 May 2025 00:38:47 +0530
Subject: [PATCH v4 02/18] dt-bindings: clock: qcom: Update sc8280xp camcc
 bindings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250515-videocc-pll-multi-pd-voting-v4-2-571c63297d01@quicinc.com>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov
	<lumag@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NCBTYWx0ZWRfX49agdxeCZb6I
 ZtV6iL014NmT0h+FL2H6qzxRr293EYT1zxQyXqT1G2tXVfnpBwN4nGr/8ZQTLZC9snypzILCpVu
 EWuy4PDIKe0al6HUaZ7G09ujBxe0/JW6iBavOnmaYGbmensao+Ye6u3yBh1Gp4yas9Y6CfOQvTM
 06nGNOUZWUJZf1qjiGBud04R7Oep7h/tLmdnbuHHXyj7unTGWtVSkCh2uXeXyU93Nuyw8k1ZQe4
 /k+g16CCxMgEWmmNvD1clOQTLnsmhb05IBr7dxm+s7jeT10qAaV+RviWhr1ZMUtOYkMTioLmXci
 3OQpQo1JIHzeDGDE4ht7lEJiBjKPwZX4Ba+/bX+l1d14w7gIxNebbnVGo3fgR05n1eNFFE5VGeA
 /hNIvPtPgwD2Z4FYb/eD8jl8r0KEXbuwTgfWY0ouA5I9h9Ih9h2DGE5hRaMXkmWo1fkjKsvI
X-Proofpoint-ORIG-GUID: pe_t4R7TkdM9T9CJyjvFHkdsc20Xd6WK
X-Proofpoint-GUID: pe_t4R7TkdM9T9CJyjvFHkdsc20Xd6WK
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=6824ea67 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=oOvxUONE3R-d0kLshUMA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=984 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140174

SC8280XP camcc only requires the MMCX power domain, unlike
SM8450 camcc which will now support both MMCX and MXC power
domains. Hence move SC8280XP camcc bindings from SM8450 to
SA8775P camcc.

SA8775P camcc doesn't support required-opps property currently
but SC8280XP camcc need that property,  so add required-opps
based on SC8280XP camcc conditional check in SA8775P camcc
bindings.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 .../devicetree/bindings/clock/qcom,sa8775p-camcc.yaml     | 15 +++++++++++++++
 .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml      |  2 --
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
index 81623f59d11d73839e5c551411a52427e2f28415..f42ccb6627a387ee0d0238ebd1fcd1cdf64c5676 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
@@ -17,12 +17,14 @@ description: |
   See also:
     include/dt-bindings/clock/qcom,qcs8300-camcc.h
     include/dt-bindings/clock/qcom,sa8775p-camcc.h
+    include/dt-bindings/clock/qcom,sc8280xp-camcc.h
 
 properties:
   compatible:
     enum:
       - qcom,qcs8300-camcc
       - qcom,sa8775p-camcc
+      - qcom,sc8280xp-camcc
 
   clocks:
     items:
@@ -35,6 +37,11 @@ properties:
     maxItems: 1
     description: MMCX power domain
 
+  required-opps:
+    description:
+      OPP node describing required MMCX performance point.
+    maxItems: 1
+
 required:
   - compatible
   - clocks
@@ -43,6 +50,14 @@ required:
 
 allOf:
   - $ref: qcom,gcc.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sc8280xp-camcc
+    then:
+      required:
+        - required-opps
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index 9e79f8fec437b9aecb5103092f6ff2ad1cd42626..883f12e3d11fa16384108434f6de120162226a28 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -15,7 +15,6 @@ description: |
   domains on SM8450.
 
   See also:
-    include/dt-bindings/clock/qcom,sc8280xp-camcc.h
     include/dt-bindings/clock/qcom,sm8450-camcc.h
     include/dt-bindings/clock/qcom,sm8550-camcc.h
     include/dt-bindings/clock/qcom,sm8650-camcc.h
@@ -23,7 +22,6 @@ description: |
 properties:
   compatible:
     enum:
-      - qcom,sc8280xp-camcc
       - qcom,sm8450-camcc
       - qcom,sm8475-camcc
       - qcom,sm8550-camcc

-- 
2.34.1


