Return-Path: <linux-arm-msm+bounces-27357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E78994060A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 05:46:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B4DF1C21038
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 03:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961177641E;
	Tue, 30 Jul 2024 03:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DaFNcVUH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA671BE5D;
	Tue, 30 Jul 2024 03:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722311193; cv=none; b=BdOj4cpbEU+VR5GE0rnPJvx9ecpg7aZr05K3iMl/ht1KEdBp90qYELuISEcLimL3m+HQ+z4RVXZcCfeQq8NHBoib2NbZmZkOkoMbiYFuAgjDK+7SQ8xmLdP/2oIyyS3+zWUOMm61ZxGj9znhm2bwqAqFZZogrk0KaRvdhG7yDBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722311193; c=relaxed/simple;
	bh=A75fw6f+nIprBzqKB4p3N6PXQxqepgrg6HYNGrPLWz0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gPxt8y5HkFM1Gaz1mJWa3zpZpxtMGDmPBBlr6KYG0lPA+Ik7OTNw67xmdtyQdv4KL9n/MHP2oIzEIgUuVwqgOC2ivmKRQQ30HNlRQgUWovxhJ0AecEo2ne9ZzwNvvM5yy7of++k+Qr9zo9GJbsRtntdjjoaq5EsQbXaDC/A5P20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DaFNcVUH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46U0FX7q007429;
	Tue, 30 Jul 2024 03:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CsxwxBF4R7vSIxeod3/nje
	Og8ZQ4XZzw13+ijnWmlA8=; b=DaFNcVUHnOZeIYxCTKWVBXcIZTEYBbwcPiImvR
	gu8i9x7KQTQvCgiBrBsz9G0Xzv52U/3GAQpSTtDfNldKhB8TPm0E5cgNXFBnqbha
	8lRiTQzHTTO6VVbwNn3TUyS07NDbN1cfxtjsTSNLKT0y++FK4ASyh3r+leXKpLi6
	s55kjzwMcMAr6d5Jt8v26Qc8hfdzqmkJJd8eupiW5AYFg8oB1PjjoC6+gnao6kCe
	RjsxtYyadQTtqw7jtVegFybpwr7D8hseI9BvZ4a4cZIupv7qt4pbHMKT73a1hvHu
	QushGFBejJP0kzbWqC3k9/hWTv2jci1kRvRo2SF1MMw/3jVg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mr7gp43r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 03:46:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46U3kFY4004851
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 03:46:15 GMT
Received: from hu-jkona-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 29 Jul 2024 20:46:09 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
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
Subject: [PATCH V3] dt-bindings: clock: qcom: Remove required-opps from required list on SM8650
Date: Tue, 30 Jul 2024 09:15:52 +0530
Message-ID: <20240730034552.31271-1-quic_jkona@quicinc.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gNFsSdnLlNZs-ki3WpgqCfNObBTJzsgV
X-Proofpoint-GUID: gNFsSdnLlNZs-ki3WpgqCfNObBTJzsgV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_03,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 impostorscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 clxscore=1011 priorityscore=1501 mlxlogscore=932 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407300026

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
Reported-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Closes: https://lore.kernel.org/all/0f13ab6b-dff1-4b26-9707-704ae2e2b535@linaro.org/
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407070147.C9c3oTqS-lkp@intel.com/
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
Changes in V3:
 - Made only required-opps property conditional and added it based on the variant
 - Link to V2: https://lore.kernel.org/all/20240720052818.26441-1-quic_jkona@quicinc.com/
Changes in V2:
 - Made required: conditional and dropped required-opps from it only for SM8650 platform
 - Dropped Krzysztof Acked-by tag due to above changes
 - Link to V1: https://lore.kernel.org/all/20240708130836.19273-1-quic_jkona@quicinc.com/

 .../bindings/clock/qcom,sm8450-camcc.yaml     | 22 +++++++++++++++----
 .../bindings/clock/qcom,sm8450-videocc.yaml   | 14 +++++++++++-
 2 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index f58edfc10f4c..eb806ef6dbea 100644
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
@@ -57,7 +54,24 @@ required:
   - compatible
   - clocks
   - power-domains
-  - required-opps
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc8280xp-camcc
+              - qcom,sm8450-camcc
+              - qcom,sm8550-camcc
+              - qcom,x1e80100-camcc
+    then:
+      required:
+        - required-opps
+    else:
+      properties:
+        required-opps: false
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index b2792b4bb554..c5c3fe5091fb 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -44,11 +44,23 @@ required:
   - compatible
   - clocks
   - power-domains
-  - required-opps
   - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8450-videocc
+              - qcom,sm8550-videocc
+    then:
+      required:
+        - required-opps
+    else:
+      properties:
+        required-opps: false
 
 unevaluatedProperties: false
 
-- 
2.45.2


