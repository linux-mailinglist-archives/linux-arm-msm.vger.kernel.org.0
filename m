Return-Path: <linux-arm-msm+bounces-62898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5573AEC45A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 05:03:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90BB7560F8F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 03:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88322D600;
	Sat, 28 Jun 2025 03:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YIz48+P3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1EB21D3E2
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 03:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751079770; cv=none; b=si4+sdehmbmm4ifJBMP2AjslNsiue7y+yrs3HOf95An36WvgtRScqopOyW0Z6etD/znv9cL7l1V0FcBi1DXn+TSAK6si3J5tnBbaI/TcELR3XtKMnHGUafNEx8ZXIwf1K8+eE021u/wVVrVbUhPA+j/yyueN2tIsEQ2TLVJ4DNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751079770; c=relaxed/simple;
	bh=on2BHgBcWkoYT/ewSpxz+0Nn83q7soVlm475P3sXIOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PYkoJDDWRULBX9eyu1FndM+zJ3NmO9+XuFv4EW+N50drzT12Zzu3T+uvvxN5Sg4N+MN6bdsooJI4/kpnKq3nQE2r5WY7cNF9ReBxSIjGjkg8jQdZz66lVX1vhV8UQ7OcgxVknCiFCJFd8NwS0qvVYn2YGpUi4XBGpEyhXyVdnlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YIz48+P3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S0DTSn009322
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 03:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5aR8fGjAivIsW8Z1WVaLdu7x69SPiAPyD3BZFTe1eAA=; b=YIz48+P3xsJXg6wd
	1+L1uf4/U9lp4P+97DCeZK9z60HcfCWiCuAPDmFhVJWhd+rPk9W3cxtGm2jBrDKZ
	9A6UlpxGZ7WXAW2i676ZQ61jT4m4dO5Vx7Ic99WwpvbjDnYWxnhtikius2Mw7Yq7
	rw49iMfS9AK/0r0qaWsK4cFALEl/GuXRMfIDROukP9275u7QownKubnKesR+Z3Qs
	tU1sCb9FsA7pG+VWGCvaekZ/p6b3YNJqyvIYhZuJBpMaSeF39bQgoF93v9tw5KP5
	WtNA+NdSQcQaZw2U0kXIvhbFk3o6ewx8rHK7sAF7ULi15Ti/2WDi4UxfJNLXre1i
	X133ng==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcn28vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 03:02:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d413a10b4cso457221785a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 20:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751079767; x=1751684567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5aR8fGjAivIsW8Z1WVaLdu7x69SPiAPyD3BZFTe1eAA=;
        b=etTcMP/aPYEifBBhLZ9KSBG1EquLvKf0Sz4587nEgKxLrcpLStoSo99QW3JW8vqvPH
         tnNokru3MuGxJRJyWO4fqwAyqqInEzE8mUhUQAJIqsm84vwMJcHyG8oWsKO4WJK11qre
         uBPGSA7jMxJQ9z5hwFB+0dn6EF2hBU2A7U4WwLVCJxWNYHVIA+Xxy/dMinQtVO/vOeYF
         Z3SjIh9TAnOhkROa6Uh5NR3+9SWBfh0FpUnsfErEKdEFle7OOxWFWUlGKWx7F+X2Z1Pr
         obIo+AqKWeXGqQR6h089gHDcJ5Jwz7tGwLT1Y2U0PgBnR0IkyRZOI+c71IxZpATIpqE9
         PI2Q==
X-Gm-Message-State: AOJu0YxDwcEwk1tWBJ16KERjAPbNiympUgCCwkSLwiSUR50hNFrgEtPT
	Uneb84iCGyJ3zoy+hweqn3a0qaD0GXOrf0iGrP1ScM9HamjDeBqSDfNST2x3Dlf0gpU6oNGPqmj
	Lbx6ykmcG+jm7KRq7MkMxkIqUSJULqOIeucr6CijxmREXNpoR5KCJndTnwYVtwmADgMLY
X-Gm-Gg: ASbGncutPKsf3NstfBCVoPPGozpvEgMWyakSW6LDk9y3peucOKANlm+3AOEDjf1CF82
	nLh3ChQVRW9QLzr1yrKEnZQpKJNX9/ks0/1uYRLRj5eicQmMjvFA9Qh3qvw2HuTpcGelb1aD94O
	B2rENTV9NQWscxjOBn88c1a/nJssnFEWB6uHh3vAhelyBnCQCOT92M0HPX6v0sjiJZw0rvK70H/
	5YRSvoLtorfsxpAlxS/MAcs/fOPYB0XlBl/GBNLonjj49MSEixwnkPx/WTSNvKDNMn2tG/p4keF
	yx0gwA63ecDHS9AeoQPzhXA+2pwRmXWJG2Dyu/1xhh3HrO9qj8DbaGg9c9SOKMJgUNQ6dCk6jRM
	pzk6jbD6a6fgycnEpwuIFxZUUdsWo/WUN8qI=
X-Received: by 2002:a05:620a:1727:b0:7d3:9e75:6953 with SMTP id af79cd13be357-7d44399cea1mr913296485a.52.1751079766804;
        Fri, 27 Jun 2025 20:02:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeIaPbr6Eb6DCFi+U0O1m19Bb2BROvDh0XhxtlAu0XGoBDUeVMqWy1lJZwa8PIlZmHgxATKw==
X-Received: by 2002:a05:620a:1727:b0:7d3:9e75:6953 with SMTP id af79cd13be357-7d44399cea1mr913293185a.52.1751079766356;
        Fri, 27 Jun 2025 20:02:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2cec36sm652162e87.180.2025.06.27.20.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 20:02:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Jun 2025 06:02:37 +0300
Subject: [PATCH 3/3] dt-bindings: display/msm/gpu: describe clocks for each
 Adreno GPU type
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-rework-msm-gpu-schema-v1-3-89f818c51b6a@oss.qualcomm.com>
References: <20250628-rework-msm-gpu-schema-v1-0-89f818c51b6a@oss.qualcomm.com>
In-Reply-To: <20250628-rework-msm-gpu-schema-v1-0-89f818c51b6a@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8307;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=on2BHgBcWkoYT/ewSpxz+0Nn83q7soVlm475P3sXIOM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoX1tMJ5CQdX181Qavk2jRBSkDutKIttOYQLspI
 dO14GTIeq+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaF9bTAAKCRCLPIo+Aiko
 1Xt3B/4s/QVV4Tn7GK5YrC9I1uckXq9WeLcot75I7GKrsJVje+7LzUciGGirOrkTpC4SFrZbNRp
 WQ1F9qSOUpWQxcoqdEiOPuDnMIR6/T5IRfkXgGEck+VR0rk5D6HK7ek68vU6XKZIgACVCsDzZ1x
 XdF/vHHOV+FviOcFLmqQMmzxQA27jMobKgqDAnnGX7Rvaa7XEXbNmVAmlU7bozTiutDP7ZBuRAB
 WnV9AIMFgLYLyRcMLNT31R7X4OTo/1YuV/BvJIH0zf/SAwkzujl7S8guuhCJPkgeIatQhoDYsyM
 ZlNo3fNNCDcslxx4+/tFv3Blco1ZYqbK6BkpzLxg7rFf36nF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: tkDrZbuSh8niHmIS0KntDnbChs_1NU1S
X-Proofpoint-ORIG-GUID: tkDrZbuSh8niHmIS0KntDnbChs_1NU1S
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685f5b58 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=iX1fKmmLQLlQjSsTkigA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAyMyBTYWx0ZWRfX/ox8immEMBHC
 jisEHFgdJdu2uHC9MNLCP71Z9xN/NPPAkYuGA8MEKEu8/0zGmoDmrc9VSHBqhPniPCNAK840cvQ
 ilBxiHkIt82WuipkcALMzeVsBSygoXcF4A5B4br71wzBFKuyc3IoKfhy044BVeOdPX8Fw0esO/b
 7f0BPstyTo+epWU0e5iIeLmwzAzuL9R8BoxOTQuIRn4axnJghi9IoGmLhC2xSD3ntKU9IU3LIfI
 a/voPGY23+g+VNRYfY80Oyf6DfZZJRr1jckR47o+/KEL8+uzCDZfVGxqJVe3ABNpYxMYMQDguci
 6ejA0eFJ16k9k09vZmJrt2TZ7vH2ZWeBMDxrAQjcxIgHdv7f2Iz6KAOaddfg2zVFSE5bZk8DLUZ
 EmbiX9S43Y90wbQNeUbwe+BPrtKPrsKgYUMOek1ODf7+x71zaO7HdIG3oxj0sigfj0M9xscW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=792 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280023

Rather than having a single list with all possible clocks for A3xx-A5xx
define individual Adreno GPU types and corresponding clock lists.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gpu.yaml       | 220 ++++++++++++++++++---
 1 file changed, 194 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index af43527188cefda0c127c4674d4667203972f583..7ef80f9fac8b2927b2a69100a7f6c729d9d188ab 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -146,41 +146,209 @@ allOf:
       properties:
         compatible:
           contains:
-            pattern: '^qcom,adreno-[3-5][0-9][0-9]\.[0-9]+$'
+            oneOf:
+              - pattern: '^qcom,adreno-305\.[0-9]+$'
+              - pattern: '^qcom,adreno-330\.[0-9]+$'
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: core
+              description: GPU Core clock
+            - const: iface
+              description: GPU Interface clock
+            - const: mem_iface
+              description: GPU Memory Interface clock
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            pattern: '^qcom,adreno-306\.[0-9]+$'
     then:
       properties:
         clocks:
-          minItems: 2
-          maxItems: 7
+          minItems: 5
+          maxItems: 6
+        clock-names:
+          oneOf:
+            - items:
+                - const: core
+                  description: GPU Core clock
+                - const: iface
+                  description: GPU Interface clock
+                - const: mem_iface
+                  description: GPU Memory Interface clock
+                - const: alt_mem_iface
+                  description: GPU Alternative Memory Interface clock
+                - const: gfx3d
+                  description: GPU 3D engine clock
+            - items:
+                - const: core
+                  description: GPU Core clock
+                - const: iface
+                  description: GPU Interface clock
+                - const: mem
+                  description: GPU Memory clock
+                - const: mem_iface
+                  description: GPU Memory Interface clock
+                - const: alt_mem_iface
+                  description: GPU Alternative Memory Interface clock
+                - const: gfx3d
+                  description: GPU 3D engine clock
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            pattern: '^qcom,adreno-320\.[0-9]+$'
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
         clock-names:
           items:
-            anyOf:
-              - const: core
-                description: GPU Core clock
-              - const: iface
-                description: GPU Interface clock
-              - const: mem
-                description: GPU Memory clock
-              - const: mem_iface
-                description: GPU Memory Interface clock
-              - const: alt_mem_iface
-                description: GPU Alternative Memory Interface clock
-              - const: gfx3d
-                description: GPU 3D engine clock
-              - const: rbbmtimer
-                description: GPU RBBM Timer for Adreno 5xx series
-              - const: rbcpr
-                description: GPU RB Core Power Reduction clock
-              - const: alwayson
-                description: GPU AON clock
-          minItems: 2
+            - const: core
+              description: GPU Core clock
+            - const: iface
+              description: GPU Interface clock
+            - const: mem
+              description: GPU Memory clock
+            - const: mem_iface
+              description: GPU Memory Interface clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            pattern: '^qcom,adreno-405\.[0-9]+$'
+    then:
+      properties:
+        clocks:
+          minItems: 7
           maxItems: 7
+        clock-names:
+          items:
+            - const: core
+              description: GPU Core clock
+            - const: iface
+              description: GPU Interface clock
+            - const: mem
+              description: GPU Memory clock
+            - const: mem_iface
+              description: GPU Memory Interface clock
+            - const: alt_mem_iface
+              description: GPU Alternative Memory Interface clock
+            - const: gfx3d
+              description: GPU 3D engine clock
+            - const: rbbmtimer
+              description: GPU RBBM Timer for Adreno 5xx series
 
-      required:
-        - clocks
-        - clock-names
+  - if:
+      properties:
+        compatible:
+          contains:
+            pattern: '^qcom,adreno-506\.[0-9]+$'
+    then:
+      properties:
+        clocks:
+          minItems: 6
+          maxItems: 6
+        clock-names:
+          items:
+            - const: core
+              description: GPU Core clock
+            - const: iface
+              description: GPU Interface clock
+            - const: mem_iface
+              description: GPU Memory Interface clock
+            - const: alt_mem_iface
+              description: GPU Alternative Memory Interface clock
+            - const: rbbmtimer
+              description: GPU RBBM Timer for Adreno 5xx series
+            - const: alwayson
+              description: GPU AON clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            oneOf:
+              - pattern: '^qcom,adreno-508\.[0-9]+$'
+              - pattern: '^qcom,adreno-509\.[0-9]+$'
+              - pattern: '^qcom,adreno-512\.[0-9]+$'
+              - pattern: '^qcom,adreno-540\.[0-9]+$'
+    then:
+      properties:
+        clocks:
+          minItems: 6
+          maxItems: 6
+        clock-names:
+          items:
+            - const: iface
+              description: GPU Interface clock
+            - const: rbbmtimer
+              description: GPU RBBM Timer for Adreno 5xx series
+            - const: mem
+              description: GPU Memory clock
+            - const: mem_iface
+              description: GPU Memory Interface clock
+            - const: rbcpr
+              description: GPU RB Core Power Reduction clock
+            - const: core
+              description: GPU Core clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            pattern: '^qcom,adreno-510\.[0-9]+$'
+    then:
+      properties:
+        clocks:
+          minItems: 6
+          maxItems: 6
+        clock-names:
+          items:
+            - const: core
+              description: GPU Core clock
+            - const: iface
+              description: GPU Interface clock
+            - const: mem
+              description: GPU Memory clock
+            - const: mem_iface
+              description: GPU Memory Interface clock
+            - const: rbbmtimer
+              description: GPU RBBM Timer for Adreno 5xx series
+            - const: alwayson
+              description: GPU AON clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            pattern: '^qcom,adreno-530\.[0-9]+$'
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          maxItems: 5
+        clock-names:
+          items:
+            - const: core
+              description: GPU Core clock
+            - const: iface
+              description: GPU Interface clock
+            - const: rbbmtimer
+              description: GPU RBBM Timer for Adreno 5xx series
+            - const: mem
+              description: GPU Memory clock
+            - const: mem_iface
+              description: GPU Memory Interface clock
 
   - if:
       properties:

-- 
2.39.5


