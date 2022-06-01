Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BADA53A54A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jun 2022 14:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352986AbiFAMoF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jun 2022 08:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353048AbiFAMoC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jun 2022 08:44:02 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 144FE4A91D
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jun 2022 05:43:59 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id t5so2024184edc.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jun 2022 05:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BJBEZRlCtPIDFnVc3ujH68azfQRAs2ANl4wIkw87NgU=;
        b=l6S1JRZPQZFbHBkTaJh2eaATKruEQNYCb4KYgn2XH5WEGH+3lfGfmu3n/43NsCxkyT
         eODSQ0VHHRFsBrh6R6ffGHQzV8BAwYAySMYzVOVC7JIoDG2KoBGsw71TsMGg89P9lbtQ
         X9JfPhz7JTiY/1AWjDt0j8GrtTsm6lAwFPWfX4Ib++bht3IcRPhEF9nQs+aRRhNhQ7Wc
         FjYJaidcoG/yE1vDjBnrR7B6hgQfmiZh2oyhE4aDXQtPIyoZ1TLm1wtnu3n0O+vqf/yt
         l4DI4rghRvLX8pyor8eD7t1C6zD6pvU943Nlj+p5tFHquvEa/0mCrY1C54wY1fA/YC0J
         uc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BJBEZRlCtPIDFnVc3ujH68azfQRAs2ANl4wIkw87NgU=;
        b=cAKgNC5kdal4O6FsJ/07/zw9Jl+Xm8vcptZ/EeMRmzCY6JOJmB0St3XFCPKNacMZlW
         zb6LhDbcMSYntXfMW0CP0Hd+7CvoNNt40ICbLMO54E14/wbKJ/Jmtamk/WlquBKXrR8d
         XrWR3UWpOt22z0GdLL3aAIqjvMoh6bPeAaumf0L0GlLQjDmRG3y7CPjrPlJveKLsv6/p
         LOXtw9Oe88iXoKVfUv6cFN5ChfMHbGzbqlwU0NXca/gZGadyLWSzqATQ07BOQZTwMz0e
         VyOOyzPDmet8UvuDal+CFaYG4AnMoN5adAGJYWLa0eDMKtFdb2pYWA8EbOwfLnuNgiIE
         8ltw==
X-Gm-Message-State: AOAM532EbGQYqacVVwbCPmiPnUMURwu9L+7YD/7rq0g02QCvo49Xok3f
        btvqwc09imtLNTxhPpFuWlX4pg==
X-Google-Smtp-Source: ABdhPJwLDOPjvWMN+yEowqbZw2aBGbXb8VFgCsDAV8Sbl2c4ebkftZJqngZtf/pifKNStHJ/K5jdAA==
X-Received: by 2002:a05:6402:516e:b0:42d:c48b:b724 with SMTP id d14-20020a056402516e00b0042dc48bb724mr21404495ede.93.1654087437606;
        Wed, 01 Jun 2022 05:43:57 -0700 (PDT)
Received: from prec5560.. ([176.74.57.19])
        by smtp.gmail.com with ESMTPSA id j10-20020a170906830a00b006f3ef214dc0sm682055ejx.38.2022.06.01.05.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 05:43:56 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, robert.foss@linaro.org, jonathan@marek.ca,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Dmitry Baryshkov <dmityr.baryshkov@linaro.org>
Subject: [PATCH v4 3/6] dt-bindings: clock: Add Qcom SM8350 GPUCC bindings
Date:   Wed,  1 Jun 2022 14:42:47 +0200
Message-Id: <20220601124250.60968-4-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220601124250.60968-1-robert.foss@linaro.org>
References: <20220601124250.60968-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for graphics clock controller for
Qualcomm Technology Inc's SM8350 SoCs.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmityr.baryshkov@linaro.org>
---

Changes since v3
 - Separate from qcom,gpucc
 - Remove clock-names
 - Make example sm8350 based
 - Changed author to me due to size of changes


 .../bindings/clock/qcom,gpucc-sm8350.yaml     | 72 +++++++++++++++++++
 include/dt-bindings/clock/qcom,gpucc-sm8350.h | 52 ++++++++++++++
 2 files changed, 124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sm8350.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml
new file mode 100644
index 000000000000..0a0546c079a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gpucc-sm8350.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics Clock & Reset Controller Binding
+
+maintainers:
+  - Robert Foss <robert.foss@linaro.org>
+
+description: |
+  Qualcomm graphics clock control module which supports the clocks, resets and
+  power domains on Qualcomm SoCs.
+
+  See also:
+    dt-bindings/clock/qcom,gpucc-sm8350.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm8350-gpucc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: GPLL0 main branch source
+      - description: GPLL0 div branch source
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
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
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sm8350.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@3d90000 {
+            compatible = "qcom,sm8350-gpucc";
+            reg = <0 0x03d90000 0 0x9000>;
+            clocks = <&rpmhcc RPMH_CXO_CLK>,
+                     <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+                     <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+            #clock-cells = <1>;
+            #reset-cells = <1>;
+            #power-domain-cells = <1>;
+        };
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,gpucc-sm8350.h b/include/dt-bindings/clock/qcom,gpucc-sm8350.h
new file mode 100644
index 000000000000..d2294e0d527e
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gpucc-sm8350.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_SM8350_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_SM8350_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK			0
+#define GPU_CC_CB_CLK			1
+#define GPU_CC_CRC_AHB_CLK		2
+#define GPU_CC_CX_APB_CLK		3
+#define GPU_CC_CX_GMU_CLK		4
+#define GPU_CC_CX_QDSS_AT_CLK		5
+#define GPU_CC_CX_QDSS_TRIG_CLK		6
+#define GPU_CC_CX_QDSS_TSCTR_CLK	7
+#define GPU_CC_CX_SNOC_DVM_CLK		8
+#define GPU_CC_CXO_AON_CLK		9
+#define GPU_CC_CXO_CLK			10
+#define GPU_CC_FREQ_MEASURE_CLK		11
+#define GPU_CC_GMU_CLK_SRC		12
+#define GPU_CC_GX_GMU_CLK		13
+#define GPU_CC_GX_QDSS_TSCTR_CLK	14
+#define GPU_CC_GX_VSENSE_CLK		15
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK	16
+#define GPU_CC_HUB_AHB_DIV_CLK_SRC	17
+#define GPU_CC_HUB_AON_CLK		18
+#define GPU_CC_HUB_CLK_SRC		19
+#define GPU_CC_HUB_CX_INT_CLK		20
+#define GPU_CC_HUB_CX_INT_DIV_CLK_SRC	21
+#define GPU_CC_MND1X_0_GFX3D_CLK	22
+#define GPU_CC_MND1X_1_GFX3D_CLK	23
+#define GPU_CC_PLL0			24
+#define GPU_CC_PLL1			25
+#define GPU_CC_SLEEP_CLK		26
+
+/* GPU_CC resets */
+#define GPUCC_GPU_CC_ACD_BCR		0
+#define GPUCC_GPU_CC_CB_BCR		1
+#define GPUCC_GPU_CC_CX_BCR		2
+#define GPUCC_GPU_CC_FAST_HUB_BCR	3
+#define GPUCC_GPU_CC_GFX3D_AON_BCR	4
+#define GPUCC_GPU_CC_GMU_BCR		5
+#define GPUCC_GPU_CC_GX_BCR		6
+#define GPUCC_GPU_CC_XO_BCR		7
+
+/* GPU_CC GDSCRs */
+#define GPU_CX_GDSC			0
+#define GPU_GX_GDSC			1
+
+#endif
-- 
2.34.1

