Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3363D67D3D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 19:14:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231838AbjAZSOE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 13:14:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231960AbjAZSOB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 13:14:01 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0327065371
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 10:13:52 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id x10so2632113edd.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 10:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pTb5wpNdthCuVjgjcUKylwdCIsqRo5OGcUFbMgOJow=;
        b=b/A8K/0tYlSS0dzWC+tB/RqdwpPxJXEihggNaF6GullWU5syq3Hgbv9Sqy2Q/zo5zo
         DILtSrp7DIyEhN++LlXvGI45zUC943muS31OZga42jy4htt3HcvuKeVvgZQXvfqbNtuK
         a4Bnb1Gm1/FU0NkF6E+zPJUX90Y0STM/sdP0CyejIdwDDeo2RjIXKpUSKhdGfWhDOoIn
         7yULdOSUY5z8O5SMkFsXzyRX7VD/LZCRjXsOToBe0aB32u/qMsGzwj5daM6+qPOe6n0r
         Z4O02Nmyeh1gieAXM5yXNhvW/urssJI9AOKVVWr700WFbzci0NgKQrXqZIF3Oj2/fL0g
         qIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3pTb5wpNdthCuVjgjcUKylwdCIsqRo5OGcUFbMgOJow=;
        b=hZfYQu8EHEvHXAT4RCRY/+fLF8fOHt8eyYmcLFMPlH3qzdyl9j7Fa9VkC9osk4CroS
         TzIXpyUSEVXFlxnLJh6BNM1IVDcyDfD5P/kBWrO46pVv51x8czEM851vxjhC9f41HuoL
         16Jd65cNnd3UEf148+p4r8gi0EO8litbkdWbc7Mdg+rdDxdTjTzlfmCgMPhrbLzx9DV8
         MP0EbPwI93W8f9GIFj7JNo0EAlXldpvWiSQuYrZYceHCZXvFtJcSvRfnBglJWBWZuxyu
         z+DFSQuksAr7cX4BMdcuJQ9GRzuV7XpEwrEj7NM9JY4IhoLWFkWieWZIQa3LddgeMGIl
         JpXw==
X-Gm-Message-State: AFqh2krUDtGjIYRXOcHe0ykrPWkjCCB+ekXoVJCmNWBeaQKSuYpsjfud
        j5rRlWm70yxCsOJnGiibBgcQWDKh7OxmsE6Z
X-Google-Smtp-Source: AMrXdXstychLZTmlwRBia5qU3U7DVyHSAhRd5pnfGzhcUcXurvOsOVxTpLQWqdSxdcrrdV1kJEMk0Q==
X-Received: by 2002:a05:6402:43c4:b0:49e:8425:6033 with SMTP id p4-20020a05640243c400b0049e84256033mr29415893edc.28.1674756832243;
        Thu, 26 Jan 2023 10:13:52 -0800 (PST)
Received: from localhost.localdomain (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id k6-20020aa7d8c6000000b00487fc51c532sm1100416eds.33.2023.01.26.10.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 10:13:51 -0800 (PST)
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
Subject: [PATCH v2 5/6] dt-bindings: clock: Add Qcom SM6115 GPUCC
Date:   Thu, 26 Jan 2023 19:13:34 +0100
Message-Id: <20230126181335.12970-6-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126181335.12970-1-konrad.dybcio@linaro.org>
References: <20230126181335.12970-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for graphics clock controller for Qualcomm
Technology Inc's SM6115 SoCs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v1 -> v2:

No changes

 .../bindings/clock/qcom,sm6115-gpucc.yaml     | 71 +++++++++++++++++++
 include/dt-bindings/clock/qcom,sm6115-gpucc.h | 36 ++++++++++
 2 files changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6115-gpucc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,sm6115-gpucc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm6115-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm6115-gpucc.yaml
new file mode 100644
index 000000000000..abf4e87359a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm6115-gpucc.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm6115-gpucc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics Clock & Reset Controller on SM6115
+
+maintainers:
+  - Konrad Dybcio <konrad.dybcio@linaro.org>
+
+description: |
+  Qualcomm graphics clock control module provides clocks and power domains on
+  Qualcomm SoCs.
+
+  See also:: include/dt-bindings/clock/qcom,sm6115-gpucc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm6115-gpucc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: GPLL0 main branch source
+      - description: GPLL0 main div source
+
+  '#clock-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 1
+
+  '#reset-cells':
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
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sm6115.h>
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+
+    soc {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        clock-controller@5990000 {
+            compatible = "qcom,sm6115-gpucc";
+            reg = <0x05990000 0x9000>;
+            clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+                     <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+                     <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+            #clock-cells = <1>;
+            #reset-cells = <1>;
+            #power-domain-cells = <1>;
+        };
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,sm6115-gpucc.h b/include/dt-bindings/clock/qcom,sm6115-gpucc.h
new file mode 100644
index 000000000000..945f21a7d745
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm6115-gpucc.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_SM6115_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_SM6115_H
+
+/* GPU_CC clocks */
+#define GPU_CC_PLL0			0
+#define GPU_CC_PLL0_OUT_AUX2		1
+#define GPU_CC_PLL1			2
+#define GPU_CC_PLL1_OUT_AUX		3
+#define GPU_CC_AHB_CLK			4
+#define GPU_CC_CRC_AHB_CLK		5
+#define GPU_CC_CX_GFX3D_CLK		6
+#define GPU_CC_CX_GMU_CLK		7
+#define GPU_CC_CX_SNOC_DVM_CLK		8
+#define GPU_CC_CXO_AON_CLK		9
+#define GPU_CC_CXO_CLK			10
+#define GPU_CC_GMU_CLK_SRC		11
+#define GPU_CC_GX_CXO_CLK		12
+#define GPU_CC_GX_GFX3D_CLK		13
+#define GPU_CC_GX_GFX3D_CLK_SRC		14
+#define GPU_CC_SLEEP_CLK		15
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK	16
+
+/* Resets */
+#define GPU_GX_BCR			0
+
+/* GDSCs */
+#define GPU_CX_GDSC			0
+#define GPU_GX_GDSC			1
+
+#endif
-- 
2.39.1

