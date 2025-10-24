Return-Path: <linux-arm-msm+bounces-78708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E280C055A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 11:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE3D51A08747
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 09:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BCC830AD11;
	Fri, 24 Oct 2025 09:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PVxUHoqQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0423030AD1D
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 09:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761298415; cv=none; b=ksUmFJ6LzQAtPjRIS2KlwKSQwtgv7/v4NAxQ6xrbBLfMdcupy7URWvMHHvKRRir2dTjkXXIjxg4zO7vU8dQdQZoWafD9PDIS8eiNEq2NQcnfegKMNd0JCuqts6z6CCj55GOBwFzVostu2OxIvcubHlo5EETc6U5JEFk5ff0shaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761298415; c=relaxed/simple;
	bh=sLfc6/pV30D5lq+QPBhYvo6G/wXhYAzok8S7hahT+7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lVYTW6DHvxXvFdrAxoK+2JwOZHLpWdD9x46assziTQ/i+Oxxz5xXMjcOBCxVFJhwtaY5OIqxmWSFEEW1h5LBopE4FndDElQSzJHHwUFVedy0Lqy+v15MOUS97xMo3XZD0U9nuChCZ5QH2eWZCdyhopOq1JbBchGCLl20rGmQKtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PVxUHoqQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FLEG022314
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 09:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BFsQ8QDek/CRCSn3Sn2QCbGXL9ljG8jJXnynkhQ8/wA=; b=PVxUHoqQpdk3Qd3Z
	zenZ8FkKkE5N79dpFY5gw3CrMyiuzk3gl8xjqFB3SHr6n8xb3ICBBjST0e3WmYmv
	xE8yRYNonw93SQXilO6LHegF9k7wwtZTZPJYH2ykRYn1IVFykUg+YHSWJA8VuLbP
	OsnGGSNyYYUHnjmcchB1kq/JhUp68gKqnphIoQCxHFFgwf8gj9Sd6viP0JNFSgim
	iTO5WMOaqGBT03b2+PaRm+cZ4xt4TxYcl5zURZYMx4sSypWUYWc0F88v0U47IU+1
	a6GMErki3GUKHh4c1/qC1KFNISRD3ldSU1SLjYDuPV0qYXOzT5Wfj8oOGH7IgQLM
	/5MCuw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qngud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 09:33:33 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7a27d7b0195so2029716b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 02:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761298412; x=1761903212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BFsQ8QDek/CRCSn3Sn2QCbGXL9ljG8jJXnynkhQ8/wA=;
        b=vK87/LAB0p0mP75K8Vb7VZVQyRvWlmazDVixtHgDpBdMCHUabRrqpCU2zU5EhDVSQG
         WmOsEEknh3t7Dwjde9ewVv2wgPWRSxQiDMTRCrZUBs+9bfCIV0Lcpi727q/SAKKAWiuT
         Ifb7BN+/7bf0UCV55baM9KLWhxV6NVQtvXCdCfdoSxyxFSc7pDLzDzIXJprwPldeMkud
         wnAetSGPh5NeY3ohFjhunGt/96GV/nKh1/nwb15Rw6G+n+IvYoHRl1Ws69t83z4OdAhR
         oBX25Pz0EwV318k6lwPefyLGA0SmX1VdNJpjokWCv7phaTrXq5vuXa0nfM69wjA7N9qE
         46cQ==
X-Gm-Message-State: AOJu0YyH1MdvaueDSfPgyqjuaBCBxr0V+5NU4y6SQoPXGHs4rdDb9Frx
	6CyqMTZy0E9EAmZefbmbxa10ZnQf9qEplycKt3XMjJYgoPb2iA34WqD4Y8gGthHQDBkJeFZvNWg
	DQH3DI2JG5GRfZ69XFwBwGQ/9AZUNuvRghwT1eJ8PcwY+86lGO81gd6SAIQYML9SeSZWv
X-Gm-Gg: ASbGncuI9R1FiRqSfpjbi+DuyFfrRJPQnrICGBpmhmJ+sBZUGzs9brHvJ2ffOTaGe1l
	0IrTyQcO2BEw61u0ttrhWCKfft7VvNhFhopAWItyAlROuekLXu/iErtA0QbW055zI099rT4IXmg
	+N2r/nwVcIzSKJkBvmiLWhAozsdEAhdu4Ot9HNU5yq4udQ5f8aa8+cHJn1tqoIF0vCwiPUDvVgT
	3Otqd+bpd0t3j3OUb0zUTnScm+H3palNChi0ALO5Bg6bPH8HG28Vi4xoVhtv4O/2igb7luLHP28
	gw7Rw3YxlIjb/7mJGINz5wti4JTOU9K0d9SmHNIWMxXH5hFuvkFOGkDSjf7OmMKOvykHk4i4DZO
	1E16laIJOO149OOBgs20J9X/WAjxOJm4FZA==
X-Received: by 2002:a05:6a00:1916:b0:793:11fc:783f with SMTP id d2e1a72fcca58-7a220d2ebb7mr32870187b3a.29.1761298412267;
        Fri, 24 Oct 2025 02:33:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXf9hXKUbGYeXNisbeDICxOQKlKaEkz3DZyx21OlN2Wx/k/LrRUL017iNPl39reqGmwOs8Tg==
X-Received: by 2002:a05:6a00:1916:b0:793:11fc:783f with SMTP id d2e1a72fcca58-7a220d2ebb7mr32870160b3a.29.1761298411772;
        Fri, 24 Oct 2025 02:33:31 -0700 (PDT)
Received: from hu-jprakash-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274dc33easm5270332b3a.68.2025.10.24.02.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 02:33:31 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 15:03:21 +0530
Subject: [PATCH v3 1/3] dt-bindings: spmi: split out common QCOM SPMI PMIC
 arbiter properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-pmic_arb_v8-v3-1-cad8d6a2cbc0@oss.qualcomm.com>
References: <20251024-pmic_arb_v8-v3-0-cad8d6a2cbc0@oss.qualcomm.com>
In-Reply-To: <20251024-pmic_arb_v8-v3-0-cad8d6a2cbc0@oss.qualcomm.com>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        aiqun.yu@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com,
        jingyi.wang@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761298404; l=4364;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=sLfc6/pV30D5lq+QPBhYvo6G/wXhYAzok8S7hahT+7E=;
 b=OOLipLvIqkKmby+XtgeiARJi6Q7hKTpNM25DoMrZf+1ImHEB9gLCCWLjrEN/4eub69Fcm3ndG
 QwZwUkOhoXvB13EsfFcmh3e5beeU3+/8jYkxnNU886bDrXj+HuEE7w5
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfX/QC9NAB1HnZJ
 UMJ0ixHTO1SzezZOZrskfFXoMh7uLZgtR9Bo4RSg4NeyDd/eS9woWTRZKanLmiC+AG76xUvJZUq
 DtbJ1Fc5CZ6aLprrW1w73NpwS1f58gxf8kHkIerQic+4RRSEhum1P9XJrD3rjCgq3cnB+8rXjuH
 pSuI94uaMQOzrtuB/GNzlxoY7N188gjarmwvn5Hd6v9kF+fAv/wVr3xB8SMN0/VVrnA9Lt3tuNL
 mw0PL4LJfcyUH7u/9ygPp3tf+i6ZESNDGB+4iKSYd5/BZBa3qBglHvXYVOAf2yUv8iOdr2afgSn
 mYXu7XLTICG3MIoX4Hl3qFoToz4z//0taVH+AKRMN6RWHp3q+kM1hZYB0tUVi66AFspP2hNVSVi
 p1wI6UwbfhsuvALq7sDrELQjtnslOw==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68fb47ed cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=w24Q35eUI-_Cj95TU7gA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: mWT6MH-px7TAPUH_oV0_Y1qhfh92VdgT
X-Proofpoint-ORIG-GUID: mWT6MH-px7TAPUH_oV0_Y1qhfh92VdgT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168

Split out the common SPMI PMIC arbiter properties for QCOM devices into a
separate file so that it can be included as a reference for devices
using them. This will be needed for the upcoming PMIC v8 arbiter
support patch, as the v8 arbiter also uses these common properties.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 .../bindings/spmi/qcom,spmi-pmic-arb-common.yaml   | 35 ++++++++++++++++++++++
 .../bindings/spmi/qcom,spmi-pmic-arb.yaml          | 17 +----------
 .../bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml | 21 +++----------
 3 files changed, 40 insertions(+), 33 deletions(-)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb-common.yaml b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb-common.yaml
new file mode 100644
index 000000000000..8c38ed145e74
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb-common.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. SPMI Controller (common)
+
+maintainers:
+  - David Collins <david.collins@oss.qualcomm.com>
+
+description: |
+  This defines some common properties used to define Qualcomm SPMI controllers
+  for PMIC arbiter.
+
+properties:
+  qcom,ee:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 5
+    description:
+      indicates the active Execution Environment identifier
+
+  qcom,channel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 5
+    description:
+      which of the PMIC Arb provided channels to use for accesses
+
+required:
+  - qcom,ee
+  - qcom,channel
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
index 51daf1b847a9..d0c683dd5284 100644
--- a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
+++ b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
@@ -19,6 +19,7 @@ description: |
 
 allOf:
   - $ref: spmi.yaml
+  - $ref: qcom,spmi-pmic-arb-common.yaml
 
 properties:
   compatible:
@@ -71,20 +72,6 @@ properties:
 
   '#size-cells': true
 
-  qcom,ee:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    minimum: 0
-    maximum: 5
-    description: >
-      indicates the active Execution Environment identifier
-
-  qcom,channel:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    minimum: 0
-    maximum: 5
-    description: >
-      which of the PMIC Arb provided channels to use for accesses
-
   qcom,bus-id:
     $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
@@ -97,8 +84,6 @@ properties:
 required:
   - compatible
   - reg-names
-  - qcom,ee
-  - qcom,channel
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
index 7c3cc20a80d6..08369fdd2161 100644
--- a/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
+++ b/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
@@ -17,6 +17,9 @@ description: |
   The PMIC Arbiter can also act as an interrupt controller, providing interrupts
   to slave devices.
 
+allOf:
+  - $ref: qcom,spmi-pmic-arb-common.yaml
+
 properties:
   compatible:
     oneOf:
@@ -45,20 +48,6 @@ properties:
   '#size-cells':
     const: 2
 
-  qcom,ee:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    minimum: 0
-    maximum: 5
-    description: >
-      indicates the active Execution Environment identifier
-
-  qcom,channel:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    minimum: 0
-    maximum: 5
-    description: >
-      which of the PMIC Arb provided channels to use for accesses
-
 patternProperties:
   "^spmi@[a-f0-9]+$":
     type: object
@@ -96,10 +85,8 @@ patternProperties:
 required:
   - compatible
   - reg-names
-  - qcom,ee
-  - qcom,channel
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.25.1


