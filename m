Return-Path: <linux-arm-msm+bounces-64033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B649CAFCAC6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 14:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04BA34A363E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 12:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D79B2DCC06;
	Tue,  8 Jul 2025 12:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1XCvHLr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2815273FE;
	Tue,  8 Jul 2025 12:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751978853; cv=none; b=MY/FTBR8zf6gddf+gr1V57Nif4ra2zO2jq7EE/Q40pgp5DlAeVrBC4gTySwvVJydXEcbJWH6ket8DCKADBeqUbFIU/tsQOriaqNsmvkDZ2tfZFxpOtkyHzfwwQQ5HmqSOGp0oC+6knSZKpSw12zN/6I85xjxGEkOQzRgvphwdzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751978853; c=relaxed/simple;
	bh=pj0ToWAvdk9MImwS3ciwuKF14EHt+YZ/Vr1onTRPAXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DKxNeIY063JvLkT7HeJSgEFNgM8jTwiYi/qUu0lm7wMHAdZFC5n29DRiKRATP3iAwM25nj78E6t8dNl9ZD2KtjNWM1zRro9+2CJeQXkqtpjT9d7877J/wQW8S+eqXn8YbBMEFpffIqAN5/PRTwXqJT8uBq432RBMjVgFInt9dGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1XCvHLr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5034DC4CEED;
	Tue,  8 Jul 2025 12:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751978852;
	bh=pj0ToWAvdk9MImwS3ciwuKF14EHt+YZ/Vr1onTRPAXg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d1XCvHLrBkkqO5o0qeKA8yHV8+qJUjbYkSRtoGQrMLSeqpMRZEac02U4/4bUWcMlu
	 nJFJJmLPsK91nYcHJoUz7/XVcGdhuHwmbtKkdjF6IFwiEyZjn7TOkcCmQafzkgyREe
	 bGHKvtqqIBhnVG7p8F2L0uQ648spfhlEkdfXSLfa89X7Q6ZbadBMOSDnDoA4Krs/gj
	 7tiGFMmv5omBZF2dt9hXX7sG+87fKIJP10aQwSvXF64oCxDWvNXoIDA/oBDZDOwN57
	 ZNPmmVQhCaq2hCYKnEdSDufE4aaHhseCI1fdd3wSaADTCJyO0lRZ45WpVASHtefUqt
	 FALQr8GUkRwxQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 08 Jul 2025 14:47:20 +0200
Subject: [PATCH 1/3] dt-bindings: clock: qcom: Add SM8750 GPU clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-topic-8750_gpucc-v1-1-86c86a504d47@oss.qualcomm.com>
References: <20250708-topic-8750_gpucc-v1-0-86c86a504d47@oss.qualcomm.com>
In-Reply-To: <20250708-topic-8750_gpucc-v1-0-86c86a504d47@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751978844; l=5467;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=P7PMEJhRaxNBrvzCQCl5zw5RaGZ5DA+9rz7azhDMEXs=;
 b=1dU7A4zSImcMlBNwxqiNoRN0wsWoYH3NXVIBkq9arDfCP73iW4A4dHAMIgkfJG6DHuorV9Afa
 SMLa6lfpKvtCJBMdtpRedzwLvuOlc87aIhnrb5sf4qxH2glh1mf9sdT
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
 .../bindings/clock/qcom,sm8750-gxcc.yaml           | 58 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,sm8750-gpucc.h      | 53 ++++++++++++++++++++
 3 files changed, 116 insertions(+)

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
index 0000000000000000000000000000000000000000..f35839193d18b608e177b4d6561827dfa98c9aa1
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8750-gxcc.yaml
@@ -0,0 +1,58 @@
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
+  See also::
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
+    maxItems: 3
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
2.50.0


