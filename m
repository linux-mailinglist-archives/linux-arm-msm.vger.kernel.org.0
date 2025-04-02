Return-Path: <linux-arm-msm+bounces-53041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CF7A78EBA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 14:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 054AB3A1D3A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 12:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB3A2356DB;
	Wed,  2 Apr 2025 12:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LNixFCdG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AF54C8E
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 12:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743597414; cv=none; b=tEvJaDhFaXNgUnhSLnE0diJ0yyjUoGRUeDeNUZhuh8QP560vH39lcCpGUvxmw6zvCOpjdXQedmnST3CDENpObOnPkHfLVuven5Wlfa9BCfTrXgm2M8s22rm76WXVudVr7sP0U9GLs0GPFmTW0DsE5Ftihe1Wj9OoI5lwev3HoJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743597414; c=relaxed/simple;
	bh=HYoZeqSfw++RDcNbs1tzSN1QkyZWrPi8g+RCYcxstuw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HtuR48MHBmDZzCxoI+8pR2+ZN+TdbA0f2AO/1G77GGPIJ/IPhpxynMir1DKWiMGAMQgTyGkRdSIQPxIPZZqdktfCSmjLwz5w8lENcJpVLZBsF3A3G3VDOaEnx/qZ1XM+AtORDp8ybs1kMuYtIWZt3AyohRriAlqlUNR5oj1s7D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LNixFCdG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5324LvAF024525
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Apr 2025 12:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=84RmlULweGmzhoJMYd+O9blNnHu0JoCPO/Z
	XsF+WdVo=; b=LNixFCdGkbA8JQvsUvJIe1MNlIJ9VxlsaqMKn6IadJH0WG6zffp
	HPuSP+soE78SJKedU097catU0YJHaxHiQaTjlSqhRQ6qWE+EAauEpuwsGLw/KRw1
	s5Vk1pR2mJ6qT2GdrdxcCmI5EmoptdrYOwdcBZHvgSNY+QYyETBl20OFgeh6BnaQ
	OVPOLFap0tW5dmV43UyN0Pjc2LYWbreqVNb3rGiPL7+UgmTXCvp+QdfyZ/xOM0CZ
	1BRyi8ApVlsM27BpPYc7JtBUbARZBrBTIMg7X1n7kKcKfbEvaktLxskqc9JKwdqX
	54DydCqjDAcBHcmI9ekxuZD3j7UR8Ptzm2A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rbpyvf5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 12:36:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c57f80d258so982435385a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 05:36:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743597385; x=1744202185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=84RmlULweGmzhoJMYd+O9blNnHu0JoCPO/ZXsF+WdVo=;
        b=hwn547QFxnOqorglyQjeOo/V6iFR7L9jFCjH1ZjU3c+vQM66dhN1BfGu5M93HjHTgc
         7I6/TTtFEqoqlLH2u3jK5mJ+gdq6shU0vT2mM4SyRYdL2D5SgNXDD0SLLhfU0n6sezue
         gk9tdZk78iQTSqZNBCgvqDl0DSKJF2zwde91nsFGSOYSyj+kdBirZlnVsw/q2WmC7e4f
         LmhJ6yLoOcQ71zItKc2px3R8SK85dKK8DFKzmjM7NdTItG9Zz0aX6F2+KuHdJl4LWxdv
         x1rFWudlB+aRAVzuiC8SFWVqG/u0/TPXjOMxNU9wjBoeU+M6+jant1kIWUjmS9hJ8401
         Qs4g==
X-Gm-Message-State: AOJu0YzmvjVN3bUbW2dG73AZtVX+fjFTMcxWibIP8cXY8+R8kGHr1cF4
	SQEfz7/P6mO6IWnAQHTPW0Ha1IJ7dez/khnzguYbxFyvY9q5RSYXuO/N8wK3meQ2MjHpLN1vwDg
	XsC2lRpDYzPosHCAj2FVwUN8fLfsP/CsbOSKDQSHBDnCm+UuYlOvN4574Nh3HM7Bx
X-Gm-Gg: ASbGncsA5ZKJHOYlUyKQDEfxfQUYDDBKXOOCK6lQi4p6zBmI9+7D8QlNGc6xow87V8M
	xFx2YQedf1KypmB3JaEdh3NdgfcPdnHfkT5e0fjaIdFz0e5A9CtFtoSk/05vtS7gB88RYZ2nWjA
	daXAQ1aNStCD+2BqJh+hvn26atK5+x28tCRCN5CfBaoxH8pElJSwtbgUwnOcxMOHlN55kAfYzFH
	SMavbSydO6U4N0Xr1Y0FKz1R2DLfxEHTs3rCaA7rOshjU1gdYwQFh/zxpQaokl4Xf9YrY9IaYJc
	Yp+1MiACleFI1vxX7Qxr0iya5Sbzme0tySTbxbOlMNthDkEjUA==
X-Received: by 2002:a05:620a:4544:b0:7c5:53ab:a722 with SMTP id af79cd13be357-7c6862ec00cmr2530991585a.5.1743597384832;
        Wed, 02 Apr 2025 05:36:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvQhJy6rozpF/vuTHm7CWCJh4/6BurnDLY9ayJwyt2OLjg4pRrUoSaweyFTyLhCap9N6vr8Q==
X-Received: by 2002:a05:620a:4544:b0:7c5:53ab:a722 with SMTP id af79cd13be357-7c6862ec00cmr2530987785a.5.1743597384375;
        Wed, 02 Apr 2025 05:36:24 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:3450:ba3:21fc:7d2b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac719221034sm916438266b.32.2025.04.02.05.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:36:23 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: i2c: qcom-cci: Document QCM2290 compatible
Date: Wed,  2 Apr 2025 14:36:21 +0200
Message-Id: <20250402123622.11984-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Vcw1RTf2HNh-X1R3FRdjOQDM-oPnr3W3
X-Proofpoint-ORIG-GUID: Vcw1RTf2HNh-X1R3FRdjOQDM-oPnr3W3
X-Authority-Analysis: v=2.4 cv=ZNLXmW7b c=1 sm=1 tr=0 ts=67ed2f64 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=NlPZ1nVzr820ScHG1asA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_05,2025-04-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020080

The CCI on QCM2290 is the interface for controlling camera sensor over I2C.
It requires only two clocks.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 v2: Reorder commits and Fix binding testing syntax

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 73144473b9b2..55ec65df4f7a 100644
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
@@ -120,6 +121,22 @@ allOf:
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


