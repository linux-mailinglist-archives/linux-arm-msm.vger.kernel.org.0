Return-Path: <linux-arm-msm+bounces-53082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 170AAA7A0EC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 12:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EDDB188BDBB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 10:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071CC1F12FD;
	Thu,  3 Apr 2025 10:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M2Saqoty"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6461D5151
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Apr 2025 10:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743675785; cv=none; b=h5FVGOVki9Ps/jIpaLvIaxScd+mPMMqjDRE1A+cXZAlGbH+55ld3DxSI7z0DRI89sLXY9ILpLh2TApCqj7ueS9zqk0kLNDR4Gb7oS7b2mxFoN2nbCqqdhc7ElbK5E5wFEJ+KubJxkvQiqPLqPXIR0/PnOUKclod/z6KGkKm1LE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743675785; c=relaxed/simple;
	bh=WOZx1oh/XmGQx6hQtAzMP9+B5QcPcd4T42zyWRvFk3s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nxbDaoxAy4PCThwgDpSJ7Kx16ruZiJYXo4yjeSdBg6omtRXBm5kw6U3QYXZeDV7MJnD4iLT+ZP3QEqtojVfLAxbT4AjvE4HD6R2JXtA3jJ8mDfJPZw8CdaeGLZ17++IQMXDvUx30dTyhpoHfHcIZnhaEhWcUYrzOw7ZH3/bP3Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M2Saqoty; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533A4Sd5017250
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Apr 2025 10:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Y/o/iLMTOZoo21hU2Wli8O+99n2B8VWbFzn
	jVy/8RoY=; b=M2SaqotyeHmAVFxLocASoa/1LTHwVI/bxX5PaawJlK8XlfZdZRq
	qE3qxlY018bNcl2NnctMOzYuDWXyVkPJ+A4PrGJjOxNoO9l4t4H+M7scweg/N1Zm
	neyMeajBvqw9w4dCXjsSwRyb1OpFj52a6m7DV3XpFI1AD70aa6FZ+yMkS2scBgU5
	dSMEXr9nbyudvCbA8e4s2duIWuIQd4ZD85DnyMm+Qb+zoNwGdztc3Jh62wrr44cU
	IdLPGdtVWL/4RfErXJf5Lg1K2XNZgJHrGIPT6+1ulB0uj07lyFuuTgLws4/3yOy9
	N9m+7p3SA0Ps7ly0Iw0MY/rERdyaUvdCOHg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45sr8q01va-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 10:23:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c77aff78so207923985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 03:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743675782; x=1744280582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/o/iLMTOZoo21hU2Wli8O+99n2B8VWbFznjVy/8RoY=;
        b=iVerubEJn7qKl0+/hRFLpSc3pIOZY2eNpvOHST4D2BQj2sdrT3HFeh3w14AZ6KIe4X
         3sQejPWdHLO7LIgNF/RhpF8MROg4ToPic0OcgnSaccFW7bG4UtkUOoTlsq38G3fdVgdD
         H2Ku3qUKg+GFHQ9IsldBHfdofXMqfJMHeCT69WejV5Z77ot7Qc6a5lE8ewUYa1mkwXw8
         0VGvs0f4kUBmd+5yYV4qLz7e27vwMP0mdRQh2QDoyUibhFgBeKvFZ4SKymVeLPcksQac
         K1q3ca5KO+PPT3Bg1DzWVbJz9DL4is/T8BO51JFsobJIS5PCV00S/pKNZFKWP9My3tI0
         h2qw==
X-Gm-Message-State: AOJu0Yy1BgS/5rxMqJi5dlh6Pehvt8sLajuGL7DISzay3VNaCq0B24rG
	JfDYYEI3By2kMlvFvyvPeu/3XDmnQ7igKcbhiUP1PsqJzvsYL0eiQ5R3+gkQtKN8d6QvBPBQO4L
	yKppZGRDWw8z4HPUuCpHgAamBtzT5uP6Hb0XFqoF8QgnpnEPaLnhFClXfTNP5f16C
X-Gm-Gg: ASbGncsmD6AKJNy0KkRy3ffdvCwl7IZBYPp3pU/BShnVvUcx6YyR2qrXQcO1rZQuxrc
	b8oFPJKmnD0Ua9eivcdGBT9GJuuEpvG3LsPAqruEVP3n8xLaHHDSwgGnftIoMZqU/+awAAudjVV
	zg4bcFJnrHvZL+7AXbjfazFA5ZXu6Y0cDc+nVCSrlcx2gHsujEQvD14PzMbc7IHf1X45dHR4g/z
	Ku3eAY6rGe40Xm/cQo+Tda1WIT+2CPCv4TwyzufR3lNP5NREcN7q+kO8VhN84wcXNbs3SsrbVma
	S6hHT5vkoNlWwS0ZZ4UsbtvFHFpbqvCjjcVwtyurMUrattuwuA==
X-Received: by 2002:a05:620a:25d1:b0:7c5:44d0:7dbb with SMTP id af79cd13be357-7c76df78075mr196834285a.28.1743675782320;
        Thu, 03 Apr 2025 03:23:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVz115vUkLcoWLtOF/ZKfGrtULTjRX5q/fBWWZ4mkgEcv2nYbyW5ZY2XonDXXbxdm6KUkGrg==
X-Received: by 2002:a05:620a:25d1:b0:7c5:44d0:7dbb with SMTP id af79cd13be357-7c76df78075mr196833085a.28.1743675782000;
        Thu, 03 Apr 2025 03:23:02 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:3450:ba3:21fc:7d2b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c0186566sm69201166b.131.2025.04.03.03.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 03:23:01 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        krzk+dt@kernel.org, robh@kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: i2c: qcom-cci: Document QCM2290 compatible
Date: Thu,  3 Apr 2025 12:22:55 +0200
Message-Id: <20250403102256.101217-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zEnvuzG6-v_SEFrpbQ5rtN0Qji5Agvh2
X-Authority-Analysis: v=2.4 cv=Iu4ecK/g c=1 sm=1 tr=0 ts=67ee6187 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=NlPZ1nVzr820ScHG1asA:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: zEnvuzG6-v_SEFrpbQ5rtN0Qji5Agvh2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_04,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030037

The CCI on QCM2290 is the interface for controlling camera sensor over I2C.
It requires only two clocks.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 v2: Reorder commits and Fix binding testing syntax
 v3: Add clocks minItems for msm8974 as top-level minItems changed

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 73144473b9b2..5d117c8e238c 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -25,6 +25,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,qcm2290-cci
               - qcom,sc7280-cci
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
@@ -44,11 +45,11 @@ properties:
     const: 0
 
   clocks:
-    minItems: 3
+    minItems: 2
     maxItems: 6
 
   clock-names:
-    minItems: 3
+    minItems: 2
     maxItems: 6
 
   interrupts:
@@ -113,6 +114,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 3
           maxItems: 3
         clock-names:
           items:
@@ -120,6 +122,22 @@ allOf:
             - const: cci_ahb
             - const: cci
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcm2290-cci
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: camss_top_ahb
+            - const: cci
+
   - if:
       properties:
         compatible:
-- 
2.34.1


