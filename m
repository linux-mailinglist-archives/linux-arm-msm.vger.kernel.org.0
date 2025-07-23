Return-Path: <linux-arm-msm+bounces-66356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C7EB0FBCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0DCC189B383
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 20:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B6523D286;
	Wed, 23 Jul 2025 20:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1LV9ryD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3320D2367D1;
	Wed, 23 Jul 2025 20:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753303144; cv=none; b=I439HjJmTn4QBexnywGYTN9OPyXhJ2KHT+LYJkbPFxXVuRbW2ev7shUmuluZCifoLpW9Ve5stlbU4hKN8kTsiQjzD2GgjU2zWULuWXKjvJOBU6Zjdmb8V1QD+Tujl2Iq63FyZAKVuFTeFuN77iB5DQ3Fi7znl3id1Rt6yA0F7nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753303144; c=relaxed/simple;
	bh=4R9PJQO81KL8IXrTfP+YQh/A/HwWkj3MLlxBR+e8850=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VWkS0DnFoTHoKlT9j+eB4ndTALI/oD1mey/tVAgqC+Gd8ZtQaFhN4bBjUZAKyimhOQ3ig4KFldMOThcrfdjqAFv/fe62DQ8CnKLvqNBLXbOZDOvXF0fgHBM+uv+V9JoSEVjxY/HtUFBohjfmGdIRlLWNh16/7kctAiEtVKgNC2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T1LV9ryD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 713A0C4CEF5;
	Wed, 23 Jul 2025 20:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753303143;
	bh=4R9PJQO81KL8IXrTfP+YQh/A/HwWkj3MLlxBR+e8850=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=T1LV9ryDi7gfcRU/2/j7ZstVv+bT1W7OBhnuPDmU/4vFd7vKy4xxaTFj39J8dfb6A
	 FztXn+LPSsXHeIaJ8PHkskCDP+zwr6GkleyWg8e5unOk4xO5WF4RgrDtj8mTYwxW43
	 gZxBJbf8wcNd6qDbi4Jokij7dkNu/1JndGtsGytreeklxHd57WyJpmTZmATMPAXDyK
	 mf9eYslBDchDQ0YKQwtujKOoJwogiB/NCVo1F0StrX3qjgZOAl6n7EEJGFgtI7+j6U
	 mJstyC3xqCW/QCgdC3X2UBfjmL9IOMis/lSNLcI1DtGW8NBlkCtBbWwTZc+LxJUiAu
	 2d9aAvkhvXNqw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 23 Jul 2025 22:38:48 +0200
Subject: [PATCH v2 1/3] dt-bindings: clock: qcom: Add SM8750 GPU clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-topic-8750_gpucc-v2-1-56c93b84c390@oss.qualcomm.com>
References: <20250723-topic-8750_gpucc-v2-0-56c93b84c390@oss.qualcomm.com>
In-Reply-To: <20250723-topic-8750_gpucc-v2-0-56c93b84c390@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753303136; l=5589;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=87IXmvmR4fmUBDzvr45LkXIf8g3uZY3iMefZBfRhgZM=;
 b=+P7CzuAlVOsAoNi+JJIkvLAz3qh+2XwEGRNPnCTp1mIXRDqrcQx37WUQMTpi98OKKrwj5lN5M
 loPHTpB9JPiD1SYLkuIrsy01xDkrRVHm/1PP4KYYJSbOud7K+XSW4E8
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The SM8750 features a "traditional" GPU_CC block, much of which is
controlled through the GMU microcontroller. Additionally, there's
an separate GX_CC block, where the GX GDSC is moved.

Add bindings to accommodate for that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  5 ++
 .../bindings/clock/qcom,sm8750-gxcc.yaml           | 61 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,sm8750-gpucc.h      | 53 +++++++++++++++++++
 3 files changed, 119 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index 02968632fb3af34d6b3983a6a24aa742db1d59b1..d1b3557ab344b071d16dba4d5c6a267b7ab70573 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -20,6 +20,7 @@ description: |
     include/dt-bindings/clock/qcom,sm8550-gpucc.h
     include/dt-bindings/reset/qcom,sm8450-gpucc.h
     include/dt-bindings/reset/qcom,sm8650-gpucc.h
+    include/dt-bindings/reset/qcom,sm8750-gpucc.h
     include/dt-bindings/reset/qcom,x1e80100-gpucc.h
 
 properties:
@@ -31,6 +32,7 @@ properties:
       - qcom,sm8475-gpucc
       - qcom,sm8550-gpucc
       - qcom,sm8650-gpucc
+      - qcom,sm8750-gpucc
       - qcom,x1e80100-gpucc
       - qcom,x1p42100-gpucc
 
@@ -40,6 +42,9 @@ properties:
       - description: GPLL0 main branch source
       - description: GPLL0 div branch source
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8750-gxcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8750-gxcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b900c19156f5a2ba4e0f7c95276c771f615fdf23
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8750-gxcc.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm8750-gxcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics Clock & Reset Controller on SM8750
+
+maintainers:
+  - Konrad Dybcio <konradybcio@kernel.org>
+
+description: |
+  Qualcomm graphics clock control module provides the clocks, resets and power
+  domains on Qualcomm SoCs.
+
+  See also:
+    include/dt-bindings/reset/qcom,sm8750-gpucc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm8750-gxcc
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    items:
+      - description: GFX voltage rail
+      - description: MX_COLLAPSIBLE voltage rail
+      - description: GPU_CC_CX GDSC
+
+  '#power-domain-cells':
+    const: 1
+
+required:
+  - compatible
+  - power-domains
+  - '#power-domain-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sm8750-gpucc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@3d64000 {
+            compatible = "qcom,sm8750-gxcc";
+            reg = <0x0 0x03d64000 0x0 0x6000>;
+            power-domains = <&rpmhpd RPMHPD_GFX>,
+                            <&rpmhpd RPMHPD_MXC>,
+                            <&gpucc GPU_CC_CX_GDSC>;
+            #power-domain-cells = <1>;
+        };
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,sm8750-gpucc.h b/include/dt-bindings/clock/qcom,sm8750-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..98e2f5df78740bf298c6b1065972d7e58ee81713
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8750-gpucc.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_SM8750_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_SM8750_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK						0
+#define GPU_CC_CB_CLK						1
+#define GPU_CC_CX_ACCU_SHIFT_CLK				2
+#define GPU_CC_CX_FF_CLK					3
+#define GPU_CC_CX_GMU_CLK					4
+#define GPU_CC_CXO_AON_CLK					5
+#define GPU_CC_CXO_CLK						6
+#define GPU_CC_DEMET_CLK					7
+#define GPU_CC_DPM_CLK						8
+#define GPU_CC_FF_CLK_SRC					9
+#define GPU_CC_FREQ_MEASURE_CLK					10
+#define GPU_CC_GMU_CLK_SRC					11
+#define GPU_CC_GX_ACCU_SHIFT_CLK				12
+#define GPU_CC_GX_ACD_AHB_FF_CLK				13
+#define GPU_CC_GX_AHB_FF_CLK					14
+#define GPU_CC_GX_GMU_CLK					15
+#define GPU_CC_GX_RCG_AHB_FF_CLK				16
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK				17
+#define GPU_CC_HUB_AON_CLK					18
+#define GPU_CC_HUB_CLK_SRC					19
+#define GPU_CC_HUB_CX_INT_CLK					20
+#define GPU_CC_HUB_DIV_CLK_SRC					21
+#define GPU_CC_MEMNOC_GFX_CLK					22
+#define GPU_CC_PLL0						23
+#define GPU_CC_PLL0_OUT_EVEN					24
+#define GPU_CC_RSCC_HUB_AON_CLK					25
+#define GPU_CC_RSCC_XO_AON_CLK					26
+#define GPU_CC_SLEEP_CLK					27
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+
+/* GPU_CC resets */
+#define GPU_CC_GPU_CC_CB_BCR					0
+#define GPU_CC_GPU_CC_CX_BCR					1
+#define GPU_CC_GPU_CC_FAST_HUB_BCR				2
+#define GPU_CC_GPU_CC_FF_BCR					3
+#define GPU_CC_GPU_CC_GMU_BCR					4
+#define GPU_CC_GPU_CC_GX_BCR					5
+#define GPU_CC_GPU_CC_XO_BCR					6
+
+/* GX_CC power domains */
+#define GX_CC_GX_GDSC						0
+
+#endif

-- 
2.50.1


