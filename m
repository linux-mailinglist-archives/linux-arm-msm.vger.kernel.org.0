Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57FA668202F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 01:00:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbjA3X76 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Jan 2023 18:59:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbjA3X7n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Jan 2023 18:59:43 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B86BA244BA
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 15:59:40 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id qw12so21014368ejc.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 15:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsZqVss/r1fgDB1F0vcdkCl/uod+C4uxkkKM1hV8pW8=;
        b=Lk0UQt4Rrn4ycn3nVPnjAtH56NWzkGwokDqAsT5h41hiez3MuaFJgGIaGh+leF84jp
         OgLR+zYT1AGnJ2Jzc/dL8z15GxQtubC0/VjbGHG+rVKzgPMZgwL1525/6ak6/hSGrWW8
         w5n034Vr52tRKmLI7rT2g0mirRr2HfqDisx6JGahP380s0RPR/4VII+hrbyA84BWCpuK
         lK6ZbQdcN3CrlSmVgNFcW1yMgpR5yftw6oDRtreiUTSDFncG5IKynXYYLv1k1sHNKO1M
         4FV4yk7jxOEFvbiMG+jm0I1QoICYaIegOsQD2Uphya8/dP9pZxLtOCYVD5IVOAhRLHKD
         hIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VsZqVss/r1fgDB1F0vcdkCl/uod+C4uxkkKM1hV8pW8=;
        b=aerLnSItfLVHy+rPR/5O/XGKzBZMnXQlSOsa4s+AMVy0EqIJxxeLk5UaIUvaWfF42G
         vKShOM/J7bZa3kp3QV3XUKOEk/9EqmdrFhCdxWTbqD4YZBWdmhoiVaYVN/vAH2w2zwua
         LdtwodP89CJg0Yqd6klG1BATqFKPn5k3Fc7p4BK5ugyVRM4+Rh5WBuTGs8SHKcw5DQdf
         i6zFli1eEMf7k048qIN+MbRkjMMI/k/tOWPnu/Dis7quEcgqOk7DESp1MyboWAR6zpSo
         uH2pWPZHObmE24nmUTxjMZnOtVh6rcrfvvKRr/h8kCEenI1WIfDR0kFMH4TkxbcqLsA9
         VebA==
X-Gm-Message-State: AO0yUKVCgP9W7OTymiY4kIypGU5kEbk+qgYpR0zALDJs2TLp6/nNhcJz
        pRysoyRbPQR0xBaCbCmPwRHm9Qi69rQU1dEE
X-Google-Smtp-Source: AK7set970AdLz+nipUt4Ldwmc0dccjvUn3lugZEGaryEPvuwBYpT36dfaSHeHIguy8WO+QKD1hgVew==
X-Received: by 2002:a17:906:168a:b0:87d:f3e2:7f4d with SMTP id s10-20020a170906168a00b0087df3e27f4dmr13709753ejd.25.1675123179035;
        Mon, 30 Jan 2023 15:59:39 -0800 (PST)
Received: from localhost.localdomain (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id jr23-20020a170906515700b0086f4b8f9e42sm7577751ejc.65.2023.01.30.15.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 15:59:38 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/8] dt-bindings: clock: Add Qcom SM6125 GPUCC
Date:   Tue, 31 Jan 2023 00:59:21 +0100
Message-Id: <20230130235926.2419776-4-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130235926.2419776-1-konrad.dybcio@linaro.org>
References: <20230130235926.2419776-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for graphics clock controller for Qualcomm
Technology Inc's SM6125 SoCs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../bindings/clock/qcom,sm6125-gpucc.yaml     | 64 +++++++++++++++++++
 include/dt-bindings/clock/qcom,sm6125-gpucc.h | 31 +++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6125-gpucc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,sm6125-gpucc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm6125-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm6125-gpucc.yaml
new file mode 100644
index 000000000000..374a1844a159
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm6125-gpucc.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm6125-gpucc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics Clock & Reset Controller on SM6125
+
+maintainers:
+  - Konrad Dybcio <konrad.dybcio@linaro.org>
+
+description: |
+  Qualcomm graphics clock control module provides clocks and power domains on
+  Qualcomm SoCs.
+
+  See also:: include/dt-bindings/clock/qcom,sm6125-gpucc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm6125-gpucc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: GPLL0 main branch source
+
+  '#clock-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sm6125.h>
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+
+    soc {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        clock-controller@5990000 {
+            compatible = "qcom,sm6125-gpucc";
+            reg = <0x05990000 0x9000>;
+            clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+                     <&gcc GCC_GPU_GPLL0_CLK_SRC>;
+            #clock-cells = <1>;
+            #power-domain-cells = <1>;
+        };
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,sm6125-gpucc.h b/include/dt-bindings/clock/qcom,sm6125-gpucc.h
new file mode 100644
index 000000000000..ce5bd920f2c4
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm6125-gpucc.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_SM6125_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_SM6125_H
+
+/* Clocks */
+#define GPU_CC_PLL0_OUT_AUX2			0
+#define GPU_CC_PLL1_OUT_AUX2			1
+#define GPU_CC_CRC_AHB_CLK			2
+#define GPU_CC_CX_APB_CLK			3
+#define GPU_CC_CX_GFX3D_CLK			4
+#define GPU_CC_CX_GMU_CLK			5
+#define GPU_CC_CX_SNOC_DVM_CLK			6
+#define GPU_CC_CXO_AON_CLK			7
+#define GPU_CC_CXO_CLK				8
+#define GPU_CC_GMU_CLK_SRC			9
+#define GPU_CC_SLEEP_CLK			10
+#define GPU_CC_GX_GFX3D_CLK			11
+#define GPU_CC_GX_GFX3D_CLK_SRC			12
+#define GPU_CC_AHB_CLK				13
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK		14
+
+/* GDSCs */
+#define GPU_CX_GDSC				0
+#define GPU_GX_GDSC				1
+
+#endif
-- 
2.39.1

