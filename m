Return-Path: <linux-arm-msm+bounces-59892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F77AC8FDC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 15:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 741E1179BEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 13:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9738122D9E4;
	Fri, 30 May 2025 13:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h1n2EtQZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FE770830;
	Fri, 30 May 2025 13:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748611284; cv=none; b=s2LW3tPO9ZCCFfNdPpBYgSrTgQTF82LRfW/w93LxU8caPveuZgM4/DW+8mj5QbuwN6n+VCG/377Dr8rgDZkKb2GTv75arkmvT4/7UC8Qy22NnGUN62EWx3CEcVPKS5DmYAZgswmimC8XEH24dXtYFKJgqc9t26zTr5oZAAj0rws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748611284; c=relaxed/simple;
	bh=tUtcVkDg0xGTKWopR2tiTazext0gjEukXIv2Wlcv+MA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=IKFNI/JW+QrzdLSoWh7Kmqg9XTfJFhL7S4FbvYy4JFBknvVHBUg2Ybl3B4cnBGZhK3bHQJaqa22KAqLsoC3VrELkNwfU2ujztYw33IZ5lNDg8OqLKAo5fuClSthkbuuBThhyThDGAXXKLVCENOZ56tsfmf2tCkbignm96kZyc/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h1n2EtQZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBnXmI016399;
	Fri, 30 May 2025 13:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rnelTyR+BPTeg+lF25ASa2tXVoK9rN30c5beFyl75aE=; b=h1n2EtQZ3vSll9SP
	JQMdpayKiimo/2RU3J3Yev7ZfvPtPUl9RdarVvspiDn0egognhr0sHoUsSeE24zO
	ROU0VYB4dwquZHuBzr691CwHiWoukG2RGTgYSrg9lVCor4D90fWmKLybbpn9CArU
	X+GUTOxxeCo8RJ7r3lwwfOa5p7t+ycIVAjuWz+odBn+frUIRZ4hNtutTrczE6JYT
	eaLNb6OrLoqbXJcyI0yKPcIiN1IbGBhyQRQOrXWffnMwHPkld8edNgja0gFQlImK
	3LdaN0y00oP49L6ni6HuvxEU8wCfUUFaMwP+cFvLgy2uQHN35yUjm4HwsTzXQAj8
	JVNioQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46yc4yr8ys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 13:21:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54UDLI8v027813
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 13:21:18 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 May
 2025 06:21:12 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Fri, 30 May 2025 18:50:48 +0530
Subject: [PATCH v5 03/18] dt-bindings: clock: qcom,sm8450-camcc: Move
 sc8280xp camcc to sa8775p camcc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250530-videocc-pll-multi-pd-voting-v5-3-02303b3a582d@quicinc.com>
References: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com>
In-Reply-To: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDExNiBTYWx0ZWRfX99uiDVB8K42y
 KdDgAWSz065RbtNeyoF/b/9tEsSVIeUck+GjHktWMlO5S8rVW2cHqeh2k6MsffkAOx/+gwjTFPp
 NYydZtd29UDzqUSQLfZkJSLDb2rsoY5fo8mpwnsjEj6NHkLGZEr5x4LxqGhlqGNQcpiO4Qlk37w
 N9UiSUrwFrzigc5nFPZaPzdI9clKILzujNZyyyGBME1U7SRpnsaiIj2pdaXEFFXtXoe0qANk/TG
 MYEpYepCop31zzwnhBZ89l9aI0JH2CkALpetJuAdCniJr8C9f+VE4/PITPsPATngmwrObccn8Fp
 3uVCymHrtvAvx5j3HzXFtXhcrT0sh0lj9dETGHLG9bb9BVz5CIuZg9nM3vy0WidgFIts0NMvY4n
 s/4FyVDHFB5g1xXIfIy0gRfwUJTyLhYKC0gYMEsHH9JUPTiD4vCJwQFjZ3smeUar1nYzJSQL
X-Authority-Analysis: v=2.4 cv=Ybe95xRf c=1 sm=1 tr=0 ts=6839b0cf cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=oOvxUONE3R-d0kLshUMA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: T2Clx29YLSn5qMEKNJlPBagMK_9o-xr8
X-Proofpoint-ORIG-GUID: T2Clx29YLSn5qMEKNJlPBagMK_9o-xr8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 mlxlogscore=958 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300116

SC8280XP camcc only requires the MMCX power domain, unlike SM8450 camcc
which now supports both MMCX and MXC power domains. Hence move SC8280XP
camcc from SM8450 to SA8775P camcc, to have single power domain support.

SA8775P camcc doesn't support required-opps property currently but SC8280XP
camcc need that property,  so add required-opps based on SC8280XP camcc
conditional check in SA8775P camcc bindings.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
index 3fded6aa712fc1920c4c4a923545901ba804c42f..c1e06f39431e68a3cd2f6c2dba84be2a3c143bb1 100644
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


