Return-Path: <linux-arm-msm+bounces-74624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7107B9AF02
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 18:58:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8300C4C73BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 16:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB1D314A9E;
	Wed, 24 Sep 2025 16:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ktWUXseM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772E8314A8F
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758733088; cv=none; b=DKTvCmWP7WN7pbFPuhiUxA8EQ3K+YOjBMgZM1HajyGlyMKHs49cvYCmg5B59I/Rmp4Rpne0BQE+HsOP+IPdggIaOH6NoEhOSo2ahWh4FZ4/Q6GxfRVvBHG+U2FF5CWpwqOW9vhKghTaErdUQ431JuEsRPbr1Fk4rVnVOCQLCBpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758733088; c=relaxed/simple;
	bh=IGN5U7nLchdIJ9+t4kEUHTtURx48mGfXTiNwIvV2Y5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=unP8KQ1rMkJvfVjrj1e0DioZ/es/csqunzXH9B9wj+pBw7z4S696BQHl+6iDyCxXLByriGyK9gdLNvdcDZixmLnkN5h6JdlPQxYOtz5OVj0/NqOYHF+WWRx+E/d4cLgsvcUBnr3aUnZZceiXbkjcUFF3hguaL4DgqMzsO6g8qqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ktWUXseM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCGQTd016438
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e/BkY1LLI9ozyqQ6eUzCMLS/ra6VSlcuobkeZlX9n1Q=; b=ktWUXseMQyWJDsKA
	C/fsG6tBFa1RLK5wwNfo+p7uNbGhcTx1IcOBRe9hWYOJx4o03YqITOQMFia8SNdc
	LDN1ucMuPMM7gxJU1cXn5zIDmKeBkgKN9E0Bq9VYyQePhl8YoMf425fpxPGkM6QG
	3F32HzkYVsRWyGE3fxcsfnPmyrmp9Mg4QYslNgJcTo1a6tRp/JW+gLIVYqs4gpXW
	DfD6mMFVkKygGNWoTraoYSkTEBHefzNHIw1z/smD7GG+qPrs/oXvNElcDoH57wlQ
	Yq6MU6Xf/o42H7NcjP2OFZMRMgGZcjp+ieSrb9dx0CFZkxLgEjh8ypaLCjH8pDWU
	st0W3w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nygxrj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:58:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-277f0ea6fc6so192595ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 09:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758733084; x=1759337884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/BkY1LLI9ozyqQ6eUzCMLS/ra6VSlcuobkeZlX9n1Q=;
        b=CqqjKOWh0QdZuJ8ivFCwCgs3YuirAwioaV20kZWefcMwm1HHAMhW6eus37/1frZYMu
         K8nPi1Z/W7atPJndxnRj7GGZpGp7/Ph5jilDhhK5UJnvYOmriaeQoK8+3dVFLoZr9bhz
         ddqsDogATdmRZY7opNk+zcQEiNC4UIEz0FVOxjDcqLEmO8OQ3osCvVK91pIVznSZdDsj
         NnoP3XmqU5FDxY3P1Hj6Km0b93KjzByGx96K1yDavEmcaQlXaSrT8n1hjIfxu0xQ31S8
         POHjZgzbTUHqtYXWXBdZnpcCraCdwwqdF6QUfuA5m787YEDCCPW9XUx19QsW7UVoP+OB
         RbhQ==
X-Gm-Message-State: AOJu0Yw2qzW0VI1Fet+69ln6eIc01V5gMp6u+qrzCRgtT5RX9F+6oLru
	mAzwy1i1w7Rb44KWjXm54kjqTcZfshLpbKBWFqKkR/SGXcDDlAOuK+ct7tUS3eMDy8Kj1JlgZln
	MP/H3uiPoG6ggemSwsEgPm7pE619G6tWktOSlvpK2A6QihV9c9VtL+qf/AVvUq8eEUM6E5VErxh
	KCD6o=
X-Gm-Gg: ASbGncsXPEYJGUzDw1VxBwEDyH6emu1XkIbu4gKauJ5qTfWFSUppiFkqiNn3xNsGjU9
	y7YT5l7GVzTJ5SRxEi4XwI1NbCMkLhihm2vLjRjQNYxhWyEi7DvkjDMbv1OL9/34vKYAM80Fr3I
	MA4hKPj7Fgsu9ttsMAcw3qGvcgqgPfaWyZHgLCNEFIwS0eILKj50M2lVm/vfvJUz9o81dQ2/yoF
	bbPQ61gRvBV25+SbTFxWQP7GQs+NpKDUgi1LNRY9GyB4e2whQFe8rJrCejrisfckx8gX2gTK/ok
	8c28L22COZHz5+kaO7V0WBw2FZIBPujG8iYiut97xlLqk801jl0UNw18Jz0tmdfowsAar2BY+WD
	fiwUp3uPzyk4AARVT4QtroshXNg==
X-Received: by 2002:a17:903:2446:b0:272:a900:c42b with SMTP id d9443c01a7336-27ed4a5a862mr4251775ad.31.1758733084214;
        Wed, 24 Sep 2025 09:58:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELB6uENUsQUxLp0glYE/434Zg0JWgqKtx8Rxei2PPhvfpXf+pb4eQQCxhGPcpV674wIaiJZw==
X-Received: by 2002:a17:903:2446:b0:272:a900:c42b with SMTP id d9443c01a7336-27ed4a5a862mr4251455ad.31.1758733083514;
        Wed, 24 Sep 2025 09:58:03 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980053078sm197415895ad.10.2025.09.24.09.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 09:58:03 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 22:27:33 +0530
Subject: [PATCH v2 1/2] dt-bindings: spmi: add bindings for
 glymur-spmi-pmic-arb (arbiter v8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-glymur-spmi-v8-v2-1-202fc7a66a97@oss.qualcomm.com>
References: <20250924-glymur-spmi-v8-v2-0-202fc7a66a97@oss.qualcomm.com>
In-Reply-To: <20250924-glymur-spmi-v8-v2-0-202fc7a66a97@oss.qualcomm.com>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758733076; l=5744;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=QseB4mSAc/+LmgNpuRoU87i6+aLt9O4zwSfWCRie4MA=;
 b=mzOhlYvbIvccUK6x+yxcRpMAVEJ6GltSwQfOgskJZVtSNsYe3MdcD3v9gED1GZ2L2fWamso/x
 +TEtZBhu7I3DRKqL0bIiglc3RQ0O7tF2r64UGvo36ypgzXdeUvV/6Qh
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d4231d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=t41Tp4pyULMMg2XcS3IA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: cip9YNxOnrVKut-3xOT009HZAl5G0qyy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfX75UKVi5g0lFv
 LSkFwyfNqos8te7A5Gj9zCDwC56HlfQUgiQdNBOq1HznpmBKYHZ0dtdiBMEJ/jyh92h8R66dVAc
 Qseu7XuosfEoRTvh0pTOuwlbwcGrUVYSfu8PfOEONXdIxN+la+zNQV8IOHGeOetNwq7WYdr4bpA
 VY/knaf2hUM98YJCBvX+TXlImj8TCHrd89XVQ5OvsZopxL3iHtTP40hpvb19VHgfHmHFLd3Xpeq
 AIuI17Q/fHFgDCiLqiGxuezONsg2xONvGhqunoUwqVgIW9gmjwhlzS/y8WZf22vPErb4W8oOiJ/
 Pd1miBln/oBx/m3NuYQ9XZfax76BvcA0L0vV5+XNvUWmS+Ve2q0F8UPEd57WsJWkcWitHfrQnl8
 yA9MpPdx
X-Proofpoint-ORIG-GUID: cip9YNxOnrVKut-3xOT009HZAl5G0qyy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090

From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

SPMI PMIC Arbiter version 8 builds upon version 7 with support for
up to four SPMI buses.  To achieve this, the register map was
slightly rearranged.  Add a new binding file and compatible string
for version 8 using the name 'glymur' as the Qualcomm Technologies,
Inc. Glymur SoC is the first one to use PMIC arbiter version 8.  This
specifies the new register ranges needed only for version 8.

Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 .../bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml   | 158 +++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e80997a5fb4bcf59328e49c8b3e68c9511176a8c
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
@@ -0,0 +1,158 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spmi/qcom,glymur-spmi-pmic-arb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Glymur SPMI Controller (PMIC Arbiter v8)
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+
+description: |
+  The Glymur SPMI PMIC Arbiter implements HW version 8 and it's an SPMI
+  controller with wrapping arbitration logic to allow for multiple on-chip
+  devices to control up to 4 SPMI separate buses.
+
+  The PMIC Arbiter can also act as an interrupt controller, providing interrupts
+  to slave devices.
+
+properties:
+  compatible:
+    enum:
+      - qcom,glymur-spmi-pmic-arb
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
+  qcom,ee:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 5
+    description: >
+      indicates the active Execution Environment identifier
+
+  qcom,channel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 5
+    description: >
+      which of the PMIC Arb provided channels to use for accesses
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
+  - qcom,ee
+  - qcom,channel
+
+additionalProperties: false
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


