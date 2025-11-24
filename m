Return-Path: <linux-arm-msm+bounces-83028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D5CC7FB24
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 10:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA3243A5E6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 09:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB7A2F7AC9;
	Mon, 24 Nov 2025 09:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ocAdHZHK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cRSrOUzZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC58F2F7AAC
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763977544; cv=none; b=Qhd2HbHKjN7K5Kuvj/YEAE6nzDzYOOnHN0jXZRjJiiZFtri7GF8pW5CdRwVLIIqa2CNooC6S8gFy9VwTg9otjvB3PPn6QSYO59QibzKJGnLkzfdMvzDuShXnV98/UZ0ijTY+P2MEr+0Ez7zEgOW1OcL0viymlrzyJ0zX4mLDzfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763977544; c=relaxed/simple;
	bh=Mjr3Uq5yLFh/qgABCSff6VcI7sqTN5uXjj3NPpSl7us=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b0McPky/GRmJXT5t9Kpi0w6IBGfmE+61mUJwjTlxoMeD6pEe59k1na1a+XBqNVu2ggaLwUwEa0dV779Zx9kfp4vUUvRMXecwuPjgEhHjPTQZ1bGKcdVoLHzMZPmbRRSm7+HRyYW1zOwSL4623YyhaI/5fbo9ac1s5ifPC3/qRdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ocAdHZHK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cRSrOUzZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO8kmWD2689189
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x5sWxNbDVr+10c9u1k51VriM1dvH8KtZLvCkbTT9Z24=; b=ocAdHZHKmbewUlqw
	2k7bsbRfme+iMse3meNiuAoQdMSLyATVjbxm8w0ich/Q0V0ATRViP+jcqbUaJi7V
	T7L8VB5DxHqgODpZysLSJ92dPZYxI0KMfMN3uVL7DSEr9NOTo8mIErAPQs7vKy8w
	dSDAyxOBBLpMiQahULwWQmTxYD/9gE3FTtdifJEkUvbHbL6YwmlqSd1wY+YJ/aOW
	QohOdEj8ZnVh4K+pTiRs3MNQzHL8YtJGUh65EPjiNz/+cm7W9xSTNiaYH9ic+cSN
	a+a7xnSEnwPh1CfolAeGSMXSAUFVhtlpVjUAxgQa2hB6x40JQtTBvD+Oxl5bHb0n
	d7v1Kw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6ffcgx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:45:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2980ef53fc5so125948985ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 01:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763977540; x=1764582340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x5sWxNbDVr+10c9u1k51VriM1dvH8KtZLvCkbTT9Z24=;
        b=cRSrOUzZlEHVjJjVkNrJWZ4xpo/Up2ByxVoxPjyRW41UsZin4SKvrkhFPfLBPWPzOA
         emGTIffZbrxSuk7p+gT8QNRUrbgQel+Lgy7otz+4SM4oX9aNyfD5Vg7BUVP8j/ORxpYs
         gj2UGzBuuS5wLkquOz8OnoqoBGbNcHJCw/dbgMGiwsMjnzIfrM+yLq/gGsvAXIF9stTn
         TFw17tove8ZGpAiQfUUFBxgd9DbXnzgUK6zMifGqHd9LKItzEJFGzwAIq+MMcoryJ/po
         +C7Jf1asAG8tmH5eFaCvdhZWxEIFvLl8+DFfX/zs9V2TIRDsfliuNszGrpSYl6eg3Mmv
         Jj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763977540; x=1764582340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x5sWxNbDVr+10c9u1k51VriM1dvH8KtZLvCkbTT9Z24=;
        b=o6Jzzeb5TEaHLJj4qBl2+X3+FYVQ3B82HqsjgAvUmlaaeCzJ7OzViusT0vd7WOMACv
         bDfpcii/Ooapg8cpN25xmvVDtjm8g2e/8uHkEEB9p+OX9dB2spn228ePQNkzwxIcPE5Y
         k4wjto2mT8b904fQRAru1SP7vj7NS2QWF0hYJLjVE8QeDoSU8ZlE4RTiP9xprwXq3HoB
         yMjZH0vGGJCeqPzDLolGSImJwgga/V46Q9Yh+D+xveysWpMVvITnCxvbPb4L5BWLk6KE
         KB71df/lZ2bap5Hsz/6Ry8Mh5qVtf09vF58+eiatblukpQELv894APsMkhtNFeJ216m/
         L1cg==
X-Gm-Message-State: AOJu0YwTTQLY1U1chr7V4ejUnzOaCF+l+VG88R7y7Wx2cuN5CrnlASYe
	62JV6zWRsRJtcvNwMdNcdYOE9r1aWOzElouiQ1rjw/Jbz+0EyWFUtenYUQLYPmaEPEed7guQ5ml
	OvT3W6r0iGoeb5nyOC8AJl0h2xaoFTANEduLK2RrEV+7ACOV5WRatJRfWeg2TMz2ucpZysAiXAL
	8o
X-Gm-Gg: ASbGncv9C0xzD8bZfCKt6/ZIwvbZFX/ftmB93R+wr5Qfu/mx7IqrY0Cjr0V4nMBxBBP
	fEMwOMNeVBXzcYo6N3OiHB4FJ2Tf1uu8A/KuXtS4XRTYOGFRe+EiVKcj6FvkJ5Y6mF1hkohIfFU
	T4fqMalQyISqgPWYvj8aPGY3gML/x9tx7poW313ApVa7KmpRajQ740WvRJHpXFnzHQp3eUlStAo
	y1bFDu0HWPNsGgjSA5Q4nQyLYJoIbDUSyHa6WwOckZ1ku4hKyCPZ7E7dE9JMxFMr8twLllC666X
	woxWiTSjjiZRgVOUE/cdpSh5ulpTXrVfblWv3mXqa6Y1ITYn7PHymWAv4A4TewrYz9109gimkCJ
	mdm9vRqoa5xwYmsngB0bc6Rh7hNdz2FXoMarnAiCeXe41
X-Received: by 2002:a05:6a20:431e:b0:35f:6586:5df6 with SMTP id adf61e73a8af0-36150e27820mr10846437637.11.1763977540340;
        Mon, 24 Nov 2025 01:45:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRl4mAWu5T4GvrTcQYUQWTgdl7Ag4KO5cCj3WhmRLjW4ovdxBk4syp96T0Y0r5CM5RdaGcQA==
X-Received: by 2002:a05:6a20:431e:b0:35f:6586:5df6 with SMTP id adf61e73a8af0-36150e27820mr10846414637.11.1763977539836;
        Mon, 24 Nov 2025 01:45:39 -0800 (PST)
Received: from hu-jprakash-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75dfed99esm12668291a12.1.2025.11.24.01.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 01:45:39 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 15:15:11 +0530
Subject: [PATCH v4 2/3] dt-bindings: spmi: add support for
 glymur-spmi-pmic-arb (arbiter v8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-pmic_arb_v8-v4-2-d91dcbf097c7@oss.qualcomm.com>
References: <20251124-pmic_arb_v8-v4-0-d91dcbf097c7@oss.qualcomm.com>
In-Reply-To: <20251124-pmic_arb_v8-v4-0-d91dcbf097c7@oss.qualcomm.com>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        kamal.wadhwa@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763977527; l=5772;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=Mjr3Uq5yLFh/qgABCSff6VcI7sqTN5uXjj3NPpSl7us=;
 b=61WGnGG96++Zdr65vvncD3X15lL3hrjGpyxF4NY73Tvpxq9gmAWVU1UO8Lj7RnVgydiIslV1F
 +Osiufjnmv6Dw+9BJ5lB00DyIqObkgf/Vn5S5fuZCKVFD+LMNW0Jpqp
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: WLxwzsXTC71Fikh2iitkv_1j_IQ2S25S
X-Proofpoint-ORIG-GUID: WLxwzsXTC71Fikh2iitkv_1j_IQ2S25S
X-Authority-Analysis: v=2.4 cv=OsxCCi/t c=1 sm=1 tr=0 ts=69242945 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=t41Tp4pyULMMg2XcS3IA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDA4NiBTYWx0ZWRfXyenqXwLlPw7/
 QIzVVd2aYf4JJOr3EeQD56Wmo230OcHsxvZ6WuklnfmvVnDQXMnuCKV8Dgwch/WO0f7fsqlFvtK
 SF6EbBDAylY5U0KZ9mh9ekaDiss4sPeJYIrPOtZ/HllmPOprfvIhcX3RSjwOy/c8QkPdfS55ug7
 0mwjxLhbiVZmq86eFbhM6vI2q/RXHJV9DQv55xZfBo/EQDzuVVa8Xx/GzvvB0XWpaKqXvvSDb9H
 FNgfUWN30ihSLjQAoloHUSu6hdk2Gc2trQr5EaukxOmKDtzzALerA7JUcLzoIQCYgdEl65NeFa3
 dPfrbiYHO6cDjlKdhAuIV9hmMxDGkqnVf80F05d2b3SBFc7pRooVRkmN8D6l3jhpUXN03mN6fK+
 qj78/Ahek09uWVcsojIKjD9iuZwPIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240086

SPMI PMIC Arbiter version 8 builds upon version 7 with support for
up to four SPMI buses.  To achieve this, the register map was
slightly rearranged.  Add a new binding file and compatible string
for version 8 using the name 'glymur' as the Qualcomm Technologies,
Inc. Glymur SoC is the first one to use PMIC arbiter version 8.  This
specifies the new register ranges needed only for version 8.

Also document SPMI PMIC Arbiter for Qualcomm Kaanapali SoC, by adding
fallback to Glymur compatible string, as it too has version 8
functionality.

Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 .../bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml   | 150 +++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
new file mode 100644
index 000000000000..3b5005b96c6d
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
@@ -0,0 +1,150 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spmi/qcom,glymur-spmi-pmic-arb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Glymur SPMI Controller (PMIC Arbiter v8)
+
+maintainers:
+  - David Collins <david.collins@oss.qualcomm.com>
+
+description: |
+  The Glymur SPMI PMIC Arbiter implements HW version 8 and it's an SPMI
+  controller with wrapping arbitration logic to allow for multiple on-chip
+  devices to control up to 4 SPMI separate buses.
+
+  The PMIC Arbiter can also act as an interrupt controller, providing interrupts
+  to slave devices.
+
+allOf:
+  - $ref: /schemas/spmi/qcom,spmi-pmic-arb-common.yaml
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - qcom,kaanapali-spmi-pmic-arb
+          - const: qcom,glymur-spmi-pmic-arb
+      - enum:
+          - qcom,glymur-spmi-pmic-arb
+
+  reg:
+    items:
+      - description: core registers
+      - description: tx-channel per virtual slave registers
+      - description: rx-channel (called observer) per virtual slave registers
+      - description: channel to PMIC peripheral mapping registers
+
+  reg-names:
+    items:
+      - const: core
+      - const: chnls
+      - const: obsrvr
+      - const: chnl_map
+
+  ranges: true
+
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+patternProperties:
+  "^spmi@[a-f0-9]+$":
+    type: object
+    $ref: /schemas/spmi/spmi.yaml
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        items:
+          - description: configuration registers
+          - description: interrupt controller registers
+          - description: channel owner EE mapping registers
+
+      reg-names:
+        items:
+          - const: cnfg
+          - const: intr
+          - const: chnl_owner
+
+      interrupts:
+        maxItems: 1
+
+      interrupt-names:
+        const: periph_irq
+
+      interrupt-controller: true
+
+      '#interrupt-cells':
+        const: 4
+        description: |
+          cell 1: slave ID for the requested interrupt (0-15)
+          cell 2: peripheral ID for requested interrupt (0-255)
+          cell 3: the requested peripheral interrupt (0-7)
+          cell 4: interrupt flags indicating level-sense information,
+                  as defined in dt-bindings/interrupt-controller/irq.h
+
+required:
+  - compatible
+  - reg-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        arbiter@c400000 {
+            compatible = "qcom,glymur-spmi-pmic-arb";
+            reg = <0x0 0xc400000 0x0 0x3000>,
+                  <0x0 0xc900000 0x0 0x400000>,
+                  <0x0 0xc4c0000 0x0 0x400000>,
+                  <0x0 0xc403000 0x0 0x8000>;
+            reg-names = "core", "chnls", "obsrvr", "chnl_map";
+
+            qcom,ee = <0>;
+            qcom,channel = <0>;
+
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+
+            spmi@c426000 {
+                reg = <0x0 0xc426000 0x0 0x4000>,
+                      <0x0 0xc8c0000 0x0 0x10000>,
+                      <0x0 0xc42a000 0x0 0x8000>;
+                reg-names = "cnfg", "intr", "chnl_owner";
+
+                interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+                interrupt-names = "periph_irq";
+                interrupt-controller;
+                #interrupt-cells = <4>;
+
+                #address-cells = <2>;
+                #size-cells = <0>;
+            };
+
+            spmi@c437000 {
+                reg = <0x0 0xc437000 0x0 0x4000>,
+                      <0x0 0xc8d0000 0x0 0x10000>,
+                      <0x0 0xc43b000 0x0 0x8000>;
+                reg-names = "cnfg", "intr", "chnl_owner";
+
+                interrupts-extended = <&pdc 3 IRQ_TYPE_LEVEL_HIGH>;
+                interrupt-names = "periph_irq";
+                interrupt-controller;
+                #interrupt-cells = <4>;
+
+                #address-cells = <2>;
+                #size-cells = <0>;
+            };
+        };
+    };

-- 
2.25.1


