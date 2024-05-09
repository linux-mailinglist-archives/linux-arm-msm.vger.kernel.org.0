Return-Path: <linux-arm-msm+bounces-19576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1DE8C0E1D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 12:24:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C22EAB2154A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 10:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ACDF14B95F;
	Thu,  9 May 2024 10:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OYhiCFtS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6230414B090;
	Thu,  9 May 2024 10:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715250268; cv=none; b=VuY4CIOEr6AKIyD6zDDBoOJDvXl/QikisiBI75r6TMDDH1OD15v1CloEM9AVKFykKELWPX9JPZhWH4iY2Bcj2U987KQVsID6s3P9E7Ud+aQs43Kq4s2XaAg4aIzPeqYRdKuENebNc05BZ5rHi+o/z6ptoOnECUJ68/4nBd5y8SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715250268; c=relaxed/simple;
	bh=2zi+kEihJitrs753NUD2GMaCfbQBwjSe1f0P5q8WYeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=KS+miDwnqVazEBIdJcuuk6/slM58lkSuyaI0u7pqcXm2knXxaIbS+Qx3IfBrWegt0VJF0KaEhybU6D1JD6Zl2LOgzUNNSh7g8NCg6ntesm1pdXr2vPiTJwAamUnI/j845jPfZlr5ilwjtX2Y0JiUM39ntspGEjOIv0SiABp/BCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OYhiCFtS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4490XdRq004571;
	Thu, 9 May 2024 10:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=CRHiHzaAIECahOjs2KrAbVJGUysvWZtEh/P6fAi1juc
	=; b=OYhiCFtSBj6K6nM13MgJSk93HH76viUv+PwYLj6xVVC/2HlE11yAFQvnbHi
	94VxKJ6WEZbTsTPERl+HIZfYN0uyV/MtiRgw1oU2A2ltVVnAgHfPy1dqkZRi9knq
	XKbrLUR61y07jEZaBVrZfsrfQcE/HtSJZEOP/whsRubPzPhPaamzWbjBuLhioBv6
	pOHpLJUzMyDd1E2tCTw6G75G9g1H03lZ7bF/N6wm8m+EJhV7Yet/zretRWMAwOp+
	0EfWao5/bLE3z+7zi6KzqOuldluNPXCn4a6vbQ4vjZaRXP5vyKL6Xzs+0t0G/guU
	yFXLLQZr9697e0sDyADD1aFPfMQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y07u9am3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 10:24:21 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 449AOJGF020769
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 May 2024 10:24:19 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 9 May 2024 03:24:14 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Thu, 9 May 2024 15:54:03 +0530
Subject: [PATCH v4 1/2] dt-bindings: clock: qcom: Add AHB clock for SM8150
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240509-videocc-sm8150-dt-node-v4-1-e9617f65e946@quicinc.com>
References: <20240509-videocc-sm8150-dt-node-v4-0-e9617f65e946@quicinc.com>
In-Reply-To: <20240509-videocc-sm8150-dt-node-v4-0-e9617f65e946@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek
	<jonathan@marek.ca>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>
X-Mailer: b4 0.12.4
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: y5PK3bT7vtpB3GW-V_DAeSW8-61xSXnw
X-Proofpoint-ORIG-GUID: y5PK3bT7vtpB3GW-V_DAeSW8-61xSXnw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-09_05,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=923 impostorscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405090066

SM8150 videocc needs AHB clock, so update the bindings for sm8150
to add the AHB clock.

Fixes: df3f61d2cdc9 ("dt-bindings: clock: add SM8150 QCOM video clock bindings")
Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 .../devicetree/bindings/clock/qcom,videocc.yaml         | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
index 6999e36ace1b..68bac801adb0 100644
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
@@ -75,7 +75,6 @@ allOf:
           enum:
             - qcom,sc7180-videocc
             - qcom,sdm845-videocc
-            - qcom,sm8150-videocc
     then:
       properties:
         clocks:
@@ -101,6 +100,22 @@ allOf:
             - const: bi_tcxo
             - const: bi_tcxo_ao
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm8150-videocc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: AHB
+            - description: Board XO source
+        clock-names:
+          items:
+            - const: iface
+            - const: bi_tcxo
+
   - if:
       properties:
         compatible:

-- 
2.25.1


