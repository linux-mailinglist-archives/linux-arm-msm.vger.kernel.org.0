Return-Path: <linux-arm-msm+bounces-78709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 047F5C055B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 11:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76FAC1A087FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 09:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B001830AD09;
	Fri, 24 Oct 2025 09:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ngGz33Cm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D4530BB88
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 09:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761298419; cv=none; b=BnJknXNSGDDIu0IhTYT68tgaiH0vrE4oylMYsIewFtGpILa8tjypjUA3+cS5mHuzt1UzdqJuTTZY5pnH0Y/EVoJ6xjgKVxWkqhxMCITyHxwyT7058wKfJUYI+5vgh3Zgf1+ejSBxc4+z7gzsIJfloL8DyPmdQhZM2Mel0IcPfYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761298419; c=relaxed/simple;
	bh=aJDb+NHHQuno7cwN3CiGpg2o/Y516jxogFCrK6JxNqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rdyigEd1Hg7wCFvhAXScU7EH4AWvuf0A2d5qUW4jOQh60LyhRW6m1kAHErLMtg15J0DzZlufxq5oAz2e8IopTRWZ0NsWaTLz/f3v5lU1ZoZFVkes5y6NA0nA8ujW0HH873+4H2VTzEiYxVWkbrBGjsCJ6iK6T3z7xmM0e1V+3rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ngGz33Cm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3MIY0010752
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 09:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ub5W/Kkbd1Alzx9NyyOxlMByJyQ868SAcsxXG1ockE0=; b=ngGz33CmGIhxfsox
	Q+6NcNAs9csb+0UcCu31rU9S0WU+h+DWDinuCJ69B4JYRGr7ReBBsbTl2QzBVgUE
	IIwu3kTwFim5zEHDenRViJ/2b4UdGbKbJoUsEzzSNhHyliYqNTMZIyUUwsEfZSs1
	pM6RK0xlZwWvSoZ6aFEVbkvqKTIrcZCPEVndUHTV/UdaWOSYd1v72aXIrK2x7LyP
	f0cTm8W/BgML4Ia6etKj/dSSllWYLYcv2mhW11Arclog4BQRbzzkXdirvTsPTxkc
	NlE3QS2o7xAO71qgEwLaQXdmnfEBeRCOKaxrVVJ2Lzl9KolgRkQ45w1/8cqiZNwQ
	tAHFlw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y524ds1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 09:33:37 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7a27ab05999so996982b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 02:33:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761298416; x=1761903216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ub5W/Kkbd1Alzx9NyyOxlMByJyQ868SAcsxXG1ockE0=;
        b=QquUETPD4JE1Uyeyvkx2hV9aMeIjNx69XzTnef86bxtVuMZdgLS8jPsgheqwWAEh6Y
         xwTEQ2SrL/wrMrTQYmP+3QsgWPutrRD5IV+zt+ch57lR3Vi3PQDrAquqp4N+whGuoUzC
         KTMypen43FPSHmMOmFzlhnbY/AhUVwXv5yjYLwxxTf7wip2FNse4nRwIbV+A5fCerKAm
         QLttPLDFzqkPOGVELt/2ep4+orqJ0q/szKqiARxJyF7JZE2ebb3Fb5jfFuTBONggvgzi
         E0T7PFateMaScRqZvlGFuP5uXc89L6hD597V09MB8kljePrc6raszeA+PRdV9HGRDolI
         CQvw==
X-Gm-Message-State: AOJu0YxPyfdwGSUiZUZL64YRDtd8FnitX27Y7/tWUpY+No5wuor+1LbU
	6Rl5jMkzTPxfnSj826ysnfVs6JCURRO0nSutGszAirDoT2kabqnfX7K2GsrwA3Q7RQz/rFs9yuf
	1D92OgdiofE8LIU3t4u6baAfacDbKlSK4dnbvDKWAOjq+jJh7Js27HD7w0XRbcPnlAwGD
X-Gm-Gg: ASbGnctCMg/fzutRRUs2GvfwrUXyydEgQaNeHdw3bhypxq+HJi/Nu/o8Vr6+iniRLAh
	Lk1slj4fjWVvTZ9YPDlkvQD77hDNhNqQgkH3yhR9ijtT5H53qBO9VSkjrGRpoibeEVNxokBvYqx
	w9RQ4JZg3jbmtoiVZbmM0ol68UCs2YOW+vEOKgT9YUAbEWVbMCsR8IaKacmEIwIPBudwcJFprDc
	iK6lk0vjDJTyCHcwF0isLjnk8BSQPEj3XUn6ww6a5FdSp7slmDLXrLjBUcYGf3wTBBmY1TsmFi6
	lQOKkqnyuW6VCpE7eI/ObJ5O+3HrMqbimkeK1sE/cx8hTStQ4xeB962dqPCPyzeyog1My/HEEgi
	SG4eSgSHLXXuV3Bbe39Vm6xAyl/XVfZ4WCQ==
X-Received: by 2002:a05:6a00:26d6:b0:7a2:6e61:c2a4 with SMTP id d2e1a72fcca58-7a26e61c50cmr7606569b3a.18.1761298416102;
        Fri, 24 Oct 2025 02:33:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3lz4HxbH9WXF2OdylXm8XVAgL+lrYMWY4oLNzS+JocMh0r8Y5PYPpgSPgMekzxEa8glMGtA==
X-Received: by 2002:a05:6a00:26d6:b0:7a2:6e61:c2a4 with SMTP id d2e1a72fcca58-7a26e61c50cmr7606529b3a.18.1761298415568;
        Fri, 24 Oct 2025 02:33:35 -0700 (PDT)
Received: from hu-jprakash-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274dc33easm5270332b3a.68.2025.10.24.02.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 02:33:35 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 15:03:22 +0530
Subject: [PATCH v3 2/3] dt-bindings: spmi: add support for
 glymur-spmi-pmic-arb (arbiter v8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-pmic_arb_v8-v3-2-cad8d6a2cbc0@oss.qualcomm.com>
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
        jingyi.wang@oss.qualcomm.com,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761298404; l=5722;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=aJDb+NHHQuno7cwN3CiGpg2o/Y516jxogFCrK6JxNqA=;
 b=crW6gL8X14t7FzTo6LkrNkMHJnC+2Hfrusd048oxV6OixqVXcbj7/cM67CRNUelVk74M0UdDl
 aYN5OHKf4uDC3dICNg3qachNWM4qZaM1jl7KUhIZjTm5UF7Jxbcn/YK
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfXzF4zKiSRPCQX
 ZbEbePSM1PP7tZS4NgNK5ki+CF0lyMeyek9ibi+om1XMdcRbbDrKJkfW57Q0sTH9JCu0m8a64ae
 odvwhd7yjg+922PH/ZKi6JOqKutf//Emob/SXrXbgoxFb/Xnsne1csrjArGBoq6ZD5SX37osFqQ
 pP70EFm6X9e1mZz64+korX6ZD+7uRXOj2+yGUdJ+4u2NP6v/ViXiWBnqoFRpksbihAMfmkIm866
 fFsVAlNj2H7zioWfN83daMoNgWHtrx1xViOzxzTAyz4xq/567B71ktiHESmHlLVG/WmLNL9nDsE
 1/gNdl7pYpQm1W+9oRHbxbPTqTRAzo7KCpVE4cNaUCMIi2e+T0v1/1dWiF0egTKCX3pV0o+PdZG
 p0ihxwc7NK+p7sPEdmX4K7QV026PDQ==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68fb47f1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=t41Tp4pyULMMg2XcS3IA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: a_hyyAGLGIWJV6PtHXPt8rfMR9wGmVwY
X-Proofpoint-ORIG-GUID: a_hyyAGLGIWJV6PtHXPt8rfMR9wGmVwY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155

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


