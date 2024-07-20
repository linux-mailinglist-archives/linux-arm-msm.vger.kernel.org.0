Return-Path: <linux-arm-msm+bounces-26665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE85937F0E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jul 2024 07:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7D3328223C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jul 2024 05:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F82DDCB;
	Sat, 20 Jul 2024 05:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NnRYsAJY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2187D524;
	Sat, 20 Jul 2024 05:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721453356; cv=none; b=V53QFm6uYWKcPM7XV7DyIYmOauabWE5+CF/UDojV3r/Y/S9C13AoDXGTXEevom9RE59rqANUuPOKncT+bhwphkkttoj+cbwP4Vwf53tYUswXSJ0+0rsDqTNqAfeGzPWQTm+XxKyjrR5OZVd8bX45/t+UpriUnTliLUFwsN7auSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721453356; c=relaxed/simple;
	bh=JQZI9mQjMpy46QFQdaD5QS4COYUG8w+TTrdhrB8V02k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h8lKuvrsf8nWjocvSUKWpQHiAAEkoMiV8C4/BJ9jYs6zNJaJIp6JxrCjdDtyFgRaLS3ElpteB7wZhg0QBASTHXPq4/PotUiaFcNMIfu+B6Cwe/e/JyhwB+hbL/wKaA94bz5Yojs18NXOW2ELXWwbVMvldOheI4M8TpPZ0/o2gN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NnRYsAJY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46K3sbV9019642;
	Sat, 20 Jul 2024 05:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8vS6rd9qVYiZ+IRKsnwiEz
	DK3Qawi1gz38elvDsEu6Q=; b=NnRYsAJYZ5WhQM0Z6jVPS/N2Sj68FiQsmSpks7
	hbr1Y9roOChSvKxQpPGVB9dOsd2lJud2DDeiVkKqgc+uKqyF/LluE/r9LaYpaDwG
	18GOVULQQcYH7F5+cTw6Avh26aoaQQMzyK0snd7S5OrIm2fH2lhN3AnZU/iioYqd
	jIQVIQcnQs1AndJjJPVH17JgIRhHRYAKdaJg0mvsSMZ+DUilKxXNJXUoI19Ff8t8
	325A/6e001OLIaRBx9ZO3U3DJhyrXn/WQ8TF2mrgBiCNEYUurOBiBHfKh9NrXklS
	Flijh/4NkV381K4v3GgWR2s2TJtN4DXXb5yVYedFfPR54QvA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g46s06fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 20 Jul 2024 05:29:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46K5T7XB000873
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 20 Jul 2024 05:29:07 GMT
Received: from hu-jkona-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 19 Jul 2024 22:29:01 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        "Satya
 Priya Kakitapalli" <quic_skakitap@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        "kernel
 test robot" <lkp@intel.com>
Subject: [PATCH V2] dt-bindings: clock: qcom: Remove required-opps from required list on SM8650
Date: Sat, 20 Jul 2024 10:58:18 +0530
Message-ID: <20240720052818.26441-1-quic_jkona@quicinc.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9RuIi-2uh9lBfK5nCvissDWhTY450QHP
X-Proofpoint-ORIG-GUID: 9RuIi-2uh9lBfK5nCvissDWhTY450QHP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-20_03,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1011 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 mlxlogscore=888 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407200039

On SM8650, the minimum voltage corner supported on MMCX from cmd-db is
sufficient for clock controllers to operate and there is no need to specify
the required-opps. Hence remove the required-opps property from the list of
required properties for SM8650 camcc and videocc bindings.

This fixes:
arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@aaf0000:
'required-opps' is a required property

arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@ade0000:
'required-opps' is a required property

Fixes: a6a61b9701d1 ("dt-bindings: clock: qcom: Add SM8650 video clock controller")
Fixes: 1ae3f0578e0e ("dt-bindings: clock: qcom: Add SM8650 camera clock controller")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407070147.C9c3oTqS-lkp@intel.com/
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
Changes in V2:
 - Made required: conditional and dropped required-opps from it only for SM8650 platform
 - Dropped Krzysztof Acked-by tag due to above changes
 - Link to V1: https://lore.kernel.org/all/20240708130836.19273-1-quic_jkona@quicinc.com/#r

.../bindings/clock/qcom,sm8450-camcc.yaml     | 26 +++++++++++++------
 .../bindings/clock/qcom,sm8450-videocc.yaml   | 25 +++++++++++++-----
 2 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index f58edfc10f4c..8698c801ed11 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -21,9 +21,6 @@ description: |
     include/dt-bindings/clock/qcom,sm8650-camcc.h
     include/dt-bindings/clock/qcom,x1e80100-camcc.h
 
-allOf:
-  - $ref: qcom,gcc.yaml#
-
 properties:
   compatible:
     enum:
@@ -53,11 +50,24 @@ properties:
   reg:
     maxItems: 1
 
-required:
-  - compatible
-  - clocks
-  - power-domains
-  - required-opps
+allOf:
+  - $ref: qcom,gcc.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8650-camcc
+    then:
+      required:
+        - compatible
+        - clocks
+        - power-domains
+    else:
+      required:
+        - compatible
+        - clocks
+        - power-domains
+        - required-opps
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index b2792b4bb554..2e5a061f33d6 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -40,15 +40,26 @@ properties:
     description:
       A phandle to an OPP node describing required MMCX performance point.
 
-required:
-  - compatible
-  - clocks
-  - power-domains
-  - required-opps
-  - '#power-domain-cells'
-
 allOf:
   - $ref: qcom,gcc.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8650-videocc
+    then:
+      required:
+        - compatible
+        - clocks
+        - power-domains
+        - '#power-domain-cells'
+    else:
+      required:
+        - compatible
+        - clocks
+        - power-domains
+        - required-opps
+        - '#power-domain-cells'
 
 unevaluatedProperties: false
 
-- 
2.43.0


