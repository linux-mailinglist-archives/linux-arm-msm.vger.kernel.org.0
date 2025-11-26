Return-Path: <linux-arm-msm+bounces-83371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E640DC881F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 06:13:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03C5D3B4667
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 05:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C3383101A6;
	Wed, 26 Nov 2025 05:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N4UcXV6Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KX5IEF9+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71373126BF
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 05:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764134020; cv=none; b=ES8Zt3VVEN3Q2HZ5o/Kzk7FNbpnpAp01oArLIK0RYGQv9CNSqS7R4+CqUkwgVtvQe3mIj+bsv081G/Bxg5se8CBR1gY8bBsUsOi6Rvr7lwDZmN1qrer5xeTdmXzF1JcOIcmjck5IhR5vXxkYAYop5QPC1Rts/MzvMSAA1+XbTic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764134020; c=relaxed/simple;
	bh=Mjr3Uq5yLFh/qgABCSff6VcI7sqTN5uXjj3NPpSl7us=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bixDOCzgLMzuY70BBtLX1x084SbtWTKtWtl/AJn1binPwohALNjRyM0eIwVPx/0cpP2P4uG9PGIcpmH7XJILoqbwq6/LIM8YshtA0bpyibfwS7UQ7kYDOQUTrvBkyLRd0eJzt0j3dz7cHA1r7nxiOlFQxT/c+78KMqPiDU7RNrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N4UcXV6Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KX5IEF9+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ2hMao3706625
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 05:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x5sWxNbDVr+10c9u1k51VriM1dvH8KtZLvCkbTT9Z24=; b=N4UcXV6ZEMi6ooLl
	/sogQnv/YOPUIuTTUYwmDRRUA/B1ZSXj2y6YWbKMXW7zABk1tucKluG6h5hMmswm
	BG9diQy8ls/bxLt2NgdjdXPWnJVi/r2mwWczzGALJbmJxaw5RV/KCiqRwCL1mgbu
	v4MIdruoL3RVE20PYW5SvKRpVl6r1YlJXntww9w7fCVe6oDzN6b8OUZ4qq55FmM+
	wooH7HEJ4QNejyuU7UHVevEVe6TeSvGQHIizafllNIPHtz8WXJWIzdlLI/D3/Aay
	ybYUDm5GJbiRBHItE0rSlPerhTRuCHh1R8M97kxhNuueboLhbluo8SQ14AIEvkpS
	jp95gg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anduft6n5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 05:13:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29b760316a8so53440485ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 21:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764134013; x=1764738813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x5sWxNbDVr+10c9u1k51VriM1dvH8KtZLvCkbTT9Z24=;
        b=KX5IEF9+8PT0arox2idLpNppnsDYpMpw+polrPvnIOzQIxpCCWa8CmFg0WMjnJdrXi
         aeRGXy+AqW7B6cMQMk2qzHL9ovdNaPn544bFZA3wGvNKVTG0NIZch2bLx/u9eOK6uxDJ
         GSVwYpTs4Tgc1xF6ChAEZQs/iMkiL+E+7SK1SexQh9/baHcUpIR5MZteYyv1wJgrSVkO
         Upu5KXWwnBHacIivpBJ9l0dIRxrk3wNm7PIFZEeX+YGCfqX6rUCk5rqxv8/vgJ5lGaac
         FZeol77aJXe3Rd2QPxxA07DyCbLbCgFsn58GYcPL/XHDxQ97in9VR6dwlEsWP+OZ1o4L
         Q+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764134013; x=1764738813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x5sWxNbDVr+10c9u1k51VriM1dvH8KtZLvCkbTT9Z24=;
        b=J+GOYa82SDCny8hdPUC5IvCvSTEKfrwa682IyQBtLXebPX5NCRxz9Ea9VLssMrytv0
         vd/reBsf36U2huPJxUzcM9K8AyfM2T+2CfExCLN78CijegH4WRJMB3+iMCaAwtdO35Qi
         TWHmNscKcL8JdfV7jvcJSKajVqFeLlRVIMJB8BUe0KXR9pCSTZDE46k9Bz3yfV1KnN0a
         XrfGmEI9McmBhdx2NcIPTF3RNe2EXa7LJkacdFA1M1l44fY30hGFN73UfTRouWiuPKeE
         JZvaoD+9hfOpVUsTUcMpwhfwRLyduNzrGV/hj2lT5jYzT9ZtK4EyiZGNuRXundaAXdzK
         y4WQ==
X-Gm-Message-State: AOJu0Yy35cbyX3GjRzvNcaZ2+RZWgu4TgLnPL0IEzFA8URsmSTaEkb5M
	w3saJ31C8nyheawWlJJwsVKLUNxWUvnMs95dqp0xkXc7hiaVX+dbH7MFa2ObtuseaBFjEX/OvGp
	Wk7DiQt9i2w//QNX4DW+d/2Ixt1Hhw2OTv+nXcQx9f0BRFvcrp/Pk+3mUHLN2B6AgQIwB
X-Gm-Gg: ASbGncsaAYxi1g0pbb3pnM4zY+tnyRZJdieOfx7vgQsGQd8gSC9SDbKSPLE82bkGycK
	Icd2mYx3IEeg8efBLXtYZMd8rCAyyF42aAV22yCLL6TvUbv9bZJtzeKIzh98XdFmRT3H/YzuP0S
	WpXI/HPtPiq/OzqAp8y2FtebrawV1IluAvjHno/1XNMM2jKLD2jpd7ndOWgLnLzSKSCGghSAWW6
	+hEQBHzLXjugeEdzvgejFXj4sBMN+UPMXei8z73tj6If9tADweBldlrB5lkBJSevOYYR+S1Zqku
	lGHPK8ShStvtojQggduQCOcA4xdxvlUTZ1VUsNFtGfznXbHC5dgwH0drCb3uI+XZvbAGS67yka/
	6gGrnu1DDHY72LBQTvnR6xr8kqy9+GfOXeLDH3aZ7i71+
X-Received: by 2002:a17:902:ccca:b0:297:f2e7:96f3 with SMTP id d9443c01a7336-29b6c6b693cmr220351335ad.50.1764134012779;
        Tue, 25 Nov 2025 21:13:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFexRh2WeqBUK/mStfH2nv4fzK3NCPdAJpCb5WJtPLYEs3zPnC4ZSuNPqcRCnF+VCdOBCW7IA==
X-Received: by 2002:a17:902:ccca:b0:297:f2e7:96f3 with SMTP id d9443c01a7336-29b6c6b693cmr220351005ad.50.1764134012304;
        Tue, 25 Nov 2025 21:13:32 -0800 (PST)
Received: from hu-jprakash-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13a870sm183591315ad.34.2025.11.25.21.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 21:13:32 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 10:42:54 +0530
Subject: [PATCH v5 2/3] dt-bindings: spmi: add support for
 glymur-spmi-pmic-arb (arbiter v8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-pmic_arb_v8-v5-2-4dd8dc5dc5a1@oss.qualcomm.com>
References: <20251126-pmic_arb_v8-v5-0-4dd8dc5dc5a1@oss.qualcomm.com>
In-Reply-To: <20251126-pmic_arb_v8-v5-0-4dd8dc5dc5a1@oss.qualcomm.com>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        aiqun.yu@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764133999; l=5772;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=Mjr3Uq5yLFh/qgABCSff6VcI7sqTN5uXjj3NPpSl7us=;
 b=IduOHIhVyyDWu0SM7MNUPgJ8fx5hreQA7iRY1Xp9s/8rDNtLyP67R2WCz71GzSRt/dALW4uVy
 Gw/ZYYRwLuDC69etygaW+wbDDMvQajoMcw8ssTSJC+21lhf+kyBF8LU
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=C53kCAP+ c=1 sm=1 tr=0 ts=69268c7d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=t41Tp4pyULMMg2XcS3IA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA0MCBTYWx0ZWRfX5rswmqunisB+
 kkMVDhW1sSeR019L1UPUhR5bRbNlwAQqhfVUkWybiWyMfBjmDgtV+ajv2iBs2qnGv0JLF+2ttIG
 0gV4/NUGUDC5E33WrPPP2OGqbGNG8QA+Roque6gNPmmZUlAM8hSlVgqp6RKIe76yr5lPq2G2ZC3
 SVCcLmBTwPuY8PrH0kRdg3Kc8Ls1AHxlxNYGKZv9YLJUKL366Smz03gG9Pp2LzeOjHyrBzw+dWV
 rEXNRa76QLACzVRNyerYUCGl9Z8Cty7kYgL56m8eDSvpU0f2O+/OxqfQKhI4qXXy7SW6O/Wm/F0
 c4jCNxKNoSRt0F+bzJt17lpVTO+0AbV4qDmiR5KepMGJEjzqQJLbT3InJIfLvYTHNEcvsWjbTBY
 v2uAcfg/ujKnq/EF9wasm5hva0rCIw==
X-Proofpoint-ORIG-GUID: ggmwxw2LuYd8UA8j8ZdDiSdVLCpX1O8b
X-Proofpoint-GUID: ggmwxw2LuYd8UA8j8ZdDiSdVLCpX1O8b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260040

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


