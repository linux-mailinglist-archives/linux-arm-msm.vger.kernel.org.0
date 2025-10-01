Return-Path: <linux-arm-msm+bounces-75720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 177D0BB1E92
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 00:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B98D317DCC2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 22:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC0C2D9780;
	Wed,  1 Oct 2025 22:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dKwbLIsf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06CD263C9E
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 22:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759356342; cv=none; b=HipoWhSq9ZkOnHH/U0UzUBZYIO7q6nj9GwQBO7GNYPOG+0z/n7ZpMscqeWOU/2ZmxASr3EsD1/nN3F4qfsgQSHhcN5rgPshZBJDx1Q5fkD/lNTqt4vpD7iCt3aEprsvvjYAoUpcNadvc8oMfqkcOGnUz5LODJl9vniHpeovN7UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759356342; c=relaxed/simple;
	bh=TVZ4vO3uGIzpCM4u8IVGrjfHwbiG9Wik0Cp+NPxTO8o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HoYh6fT70Du1CKC9l2k9bmNJAjJ3adGHBSZhryhZrOtT8z9jhINIhly0yQRPIGCGZOZibEmpAckVx+AT2kNiJ3aGajucWZktrbtQeh0956IREIKGh9VzjZsWB3vsAjD6GGkqUVZziiXtjWqkhaheSKkA+TcZeG24TPHpjfxuDkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dKwbLIsf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591Ichp8024960
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 22:05:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AmSkEJDa8qK
	4eI1/7mGS5TmnjFBscoeycTZ9zBe5108=; b=dKwbLIsfNPcO+ULRRhRe8w2TZNd
	u0L3Z45LLgosIMKpaS2NImZTRpqIK6FbG1ReVPFsh01J39vhuXQixvDGODvTcw8+
	ch54TADP3v3w+SdQaAgftGS9jpjHQCNcAM3Ljr31+no+3EEd/TVqZFviw6kGtxhd
	gNIdFAl01QH7NT3/qHFliVIBz4EkEl08G0LjgZQsvGhy4RB9h/YfaTkRnexXseOA
	GGcpRMxSgEVyj7CQ7kZYv1GHRR7AkmWsta887au533dP75ZZBppTu/TFaHS8Y3r0
	2EVtTA/94Rl8ZW58aCGEmfsSP7JskCRX+5azKAdbTvQqzGGEPz9AiXoJptA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977wtxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 22:05:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-28e8d1d9b13so2558965ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 15:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759356339; x=1759961139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AmSkEJDa8qK4eI1/7mGS5TmnjFBscoeycTZ9zBe5108=;
        b=C09xmjRr2hBkhQXdh+Wk1sqDHNx1NtixUixxYvFydCpuYf34N1AGDA7hs79vv7gDCd
         yrcqFKA35YEsDR4DNc31LBgBgfXQ8mRg+8Pfui8VQui3ZPIy/Ne54tv0IuEwHJ1r8b0z
         9/Wi69p88kCfDnG4gx7qN3RRY2sbkgvLBicqZ14F7PkyA24wxNoVEP/qK0T70wvZjABz
         E2V+MCwAD4dczcmERSOekuilSOPGPKCINV891DFA45XaUZd+HEHdUD0CXvVHhgjc54sz
         5Dh0837bGtkQyR1uTrVFQ/tdxhuiIGmlN4FNstWbJfuY93iPUZQGtqlS8cbmrFCv6piV
         QGZg==
X-Gm-Message-State: AOJu0Yxy0zseUyGKfMVYFdcnd4YmQ2faNZpcAFbdNL688oEtdSNN6tSb
	XQrwmcxeGGfJ1QmchkBc+u4mkc1xIidwenADWVtrouWHhp7ZqU8Ub7t41No56cIrwdHv9jZwsS0
	iSgkMtiC0XcLxipun65ac65BW3/mz5Rr6Ab+yEaIMx1veNPway3Jk7c+aps+yNe3D5SNV
X-Gm-Gg: ASbGnctHgnAo98VYj6uNaAOsDAPyVnXPbBToFQJUldgZ+nEmrLcNamZf/XVyD51GeuI
	IGP0+TOnfDGSxTonMO87GGb/UmyunYnKUI1sP31MC5st4DEf8HHlqhRo2CirxIwOQxL8Io1VOEI
	FRma6J1nC2ornQ/b3Ch5EY2e9js43zqwb99klp/0H7VAqoG2x1hhQCWfTs9mKKNueyi0JDUQOYh
	74DhibHVHvLzhLQ3uYfvA0semOp8CF07hT4w1Nyv06UMjVpCopPdYzhgFOP9zJIYjItjwFb91iq
	G6Rp44WqEQopdGy1ApWH02BmJHUpTzq4if2Pvgu4wt25vsLbDBagFEqXEvyP5bJAiasdZrqDAqe
	NtP7RDkdN4PTaXXzexJt9Uw==
X-Received: by 2002:a17:902:d2ca:b0:26c:4085:e3f5 with SMTP id d9443c01a7336-28e7f328c06mr62014675ad.50.1759356339086;
        Wed, 01 Oct 2025 15:05:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhj3DfDVsTx4QSOHS/bgok/IQ+EqC9h4ebMhcNTaCNyglT/+UWr5/pqQ8NnXHTWARe0GdZ6A==
X-Received: by 2002:a17:902:d2ca:b0:26c:4085:e3f5 with SMTP id d9443c01a7336-28e7f328c06mr62014215ad.50.1759356338559;
        Wed, 01 Oct 2025 15:05:38 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339b4ea3c3dsm702085a91.5.2025.10.01.15.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 15:05:37 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v4 01/10] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Glymur compatible
Date: Wed,  1 Oct 2025 15:05:25 -0700
Message-Id: <20251001220534.3166401-2-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251001220534.3166401-1-wesley.cheng@oss.qualcomm.com>
References: <20251001220534.3166401-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sppbxJkCvGuNqcrmlcuXD6C_tq6Nw3EW
X-Proofpoint-ORIG-GUID: sppbxJkCvGuNqcrmlcuXD6C_tq6Nw3EW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfXzvWd2IUtJTlq
 A+MaltKsev/eqFzdewX7uc5nlgmUYeojh3VXvWfJe+3eszrd9bGaWtnB3oNmMMZ3hbJkN8MnV6F
 AfpzM7qmtCVXukZ4z+0wV9QZ7s9LPKqqMDFwPUUA/8KROu1JEnRwfSRWo3b4mnoxTT3NIsl+3wm
 NS0ZBM8/kcm72HcR9m1ZTlGOTk5q4A3MblW5kaXepqOcGyzynacwII8mMEwhMDjMkEcltZhvbCB
 qRdLzIjX/LC/lAO4Bn5UirbAGo5pG2rOmIIN6hW17l0fipqNzOysElkAPmNYBUIhGhG7YoGVdH3
 Sq8cuZr6891jJKO1yB4IJcwNMzw0YChjvEPe6Pth4vMs/KWvn216QiQ/iANYOMZqGRqc/Rgcxxs
 N0y4xmNJ/87zPMUqHL/Du5Cr1r8ifg==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68dda5b4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=eoTMOhb7NpBO2Q1ca4UA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043

Define a Glymur compatible string for the QMP PHY combo driver, along with
resource requirements.  This adds a new requirement for a clkref clock-name
for each QMP PHY.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    | 76 +++++++++++++++----
 1 file changed, 63 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index c8bc512df08b..377d830f0855 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,glymur-qmp-usb3-dp-phy
       - qcom,sar2130p-qmp-usb3-dp-phy
       - qcom,sc7180-qmp-usb3-dp-phy
       - qcom,sc7280-qmp-usb3-dp-phy
@@ -41,12 +42,7 @@ properties:
 
   clock-names:
     minItems: 4
-    items:
-      - const: aux
-      - const: ref
-      - const: com_aux
-      - const: usb3_pipe
-      - const: cfg_ahb
+    maxItems: 5
 
   power-domains:
     maxItems: 1
@@ -63,6 +59,8 @@ properties:
 
   vdda-pll-supply: true
 
+  refgen-supply: true
+
   "#clock-cells":
     const: 1
     description:
@@ -105,6 +103,22 @@ required:
 
 allOf:
   - $ref: /schemas/usb/usb-switch.yaml#
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,glymur-qmp-usb3-dp-phy
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: aux
+            - const: ref
+            - const: com_aux
+            - const: usb3_pipe
+            - const: clkref
+
   - if:
       properties:
         compatible:
@@ -113,21 +127,45 @@ allOf:
             - qcom,sdm845-qmp-usb3-dp-phy
     then:
       properties:
-        clocks:
-          maxItems: 5
         clock-names:
-          maxItems: 5
-    else:
+          items:
+            - const: aux
+            - const: ref
+            - const: com_aux
+            - const: usb3_pipe
+            - const: cfg_ahb
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sar2130p-qmp-usb3-dp-phy
+            - qcom,sc7280-qmp-usb3-dp-phy
+            - qcom,sc8180x-qmp-usb3-dp-phy
+            - qcom,sc8280xp-qmp-usb43dp-phy
+            - qcom,sm6350-qmp-usb3-dp-phy
+            - qcom,sm8150-qmp-usb3-dp-phy
+            - qcom,sm8250-qmp-usb3-dp-phy
+            - qcom,sm8350-qmp-usb3-dp-phy
+            - qcom,sm8450-qmp-usb3-dp-phy
+            - qcom,sm8550-qmp-usb3-dp-phy
+            - qcom,sm8650-qmp-usb3-dp-phy
+            - qcom,sm8750-qmp-usb3-dp-phy
+            - qcom,x1e80100-qmp-usb3-dp-phy
+    then:
       properties:
-        clocks:
-          maxItems: 4
         clock-names:
-          maxItems: 4
+          items:
+            - const: aux
+            - const: ref
+            - const: com_aux
+            - const: usb3_pipe
 
   - if:
       properties:
         compatible:
           enum:
+            - qcom,glymur-qmp-usb3-dp-phy
             - qcom,sar2130p-qmp-usb3-dp-phy
             - qcom,sc8280xp-qmp-usb43dp-phy
             - qcom,sm6350-qmp-usb3-dp-phy
@@ -142,6 +180,18 @@ allOf:
       properties:
         power-domains: false
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,glymur-qmp-usb3-dp-phy
+    then:
+      required:
+        - refgen-supply
+    else:
+      properties:
+        refgen-supply: false
+
 additionalProperties: false
 
 examples:

