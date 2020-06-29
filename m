Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0346320E3ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 00:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390846AbgF2VTd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 17:19:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390833AbgF2VSq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 17:18:46 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0F5BC03E97B
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 14:18:45 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id e12so14012026qtr.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 14:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XikCz1+zr3FnvV2tYs/cOdK5k7ijVDZQLAkhovyJ9wo=;
        b=0xdas0ecCHGEwSva9Bqw/zQTU0jdNMI5wFoh6iFQVIIF1y9YcAz/jiEr8AxFINEjOB
         dHEjP5VaF/C8TUGSTNkaBwkZOgHVhBwJP46ZoPrKPlxuv8TIJYqbDS5XBLvwHrZWb2yt
         kUsLctOyfa1OJOutGEMvjw+SCW10lHTkFHplc+volINoprmX58JIuvmYa9xqoWqOcl+O
         O6Jyq3L6ddDUnNaY1hZYvVmxH1WVjXj095keuJyksCFbyJZ3+gmIVC3WtmL9A1TDYGml
         SAN3RoAWRqVkED9lnJlL1Dz0hDl6OClNw2v3Fj00E1YPZ1xsazWbmjYEVNN38PoXq6vh
         enjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XikCz1+zr3FnvV2tYs/cOdK5k7ijVDZQLAkhovyJ9wo=;
        b=P4pdtDlzCd+o+Kma25zv+eO4w+Wz1gcIE5mBq+tirx3a35qQ/GakaUQqxxRGuheJfv
         NkPXhGf2g+yDNbTFaGwbUGkvnFkdiXH0zwyucgqnhEMtzyAqbFUQh4A+N2SrJegMTs2S
         mUo/B4/J9+OsY5aKNiQZaCVvXkuskiJmiI+u/R3GQOgyUqy/80X6gC4XV7CXv8m0+cUD
         C6YXKwqvNnuB7VthG+q0up0C6luWxEFnZUJoDwK5FACcUl3FMyzCQLAErlfq9PHqqp8T
         IiVD768Pf3981w8hMUbEdLiVWVMrMURri4oF2ZsjNHXZYyfFFZ501mfSOAvBLIU6LFQM
         eOJQ==
X-Gm-Message-State: AOAM533XsXbK1bj+X+stfp/1E/RP4Bt6/5PDFIHGniWXHan34ubAKajT
        x+K+G72SRYFUQsW/FyAfqSJOzsUGOII=
X-Google-Smtp-Source: ABdhPJzF8YtdnpA7d+t1UhxUqzY9R4+xK2B/UOASslO2Wa/uA1if/HuYNnW7cMVLE4G8qRyCn2Cg6g==
X-Received: by 2002:ac8:7508:: with SMTP id u8mr17762191qtq.339.1593465524841;
        Mon, 29 Jun 2020 14:18:44 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id b196sm1169078qkg.11.2020.06.29.14.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 14:18:44 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [RESEND PATCH v2 07/13] dt-bindings: clock: Introduce SM8250 QCOM Graphics clock bindings
Date:   Mon, 29 Jun 2020 17:17:13 -0400
Message-Id: <20200629211725.2592-8-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200629211725.2592-1-jonathan@marek.ca>
References: <20200629211725.2592-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for graphics clock controller for
Qualcomm Technology Inc's SM8250 SoCs.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 .../bindings/clock/qcom,sm8250-gpucc.yaml     | 74 +++++++++++++++++++
 include/dt-bindings/clock/qcom,gpucc-sm8250.h | 40 ++++++++++
 2 files changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8250-gpucc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sm8250.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8250-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8250-gpucc.yaml
new file mode 100644
index 000000000000..2b9c8f97b76d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8250-gpucc.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm8250-gpucc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics Clock & Reset Controller Binding for SM8250
+
+maintainers:
+  -
+
+description: |
+  Qualcomm graphics clock control module which supports the clocks, resets and
+  power domains on SM8250.
+
+  See also dt-bindings/clock/qcom,gpucc-sm8250.h.
+
+properties:
+  compatible:
+    const: qcom,sm8250-gpucc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: GPLL0 main branch source
+      - description: GPLL0 div branch source
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+      - const: gcc_gpu_gpll0_clk_src
+      - const: gcc_gpu_gpll0_div_clk_src
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
+  - clock-names
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@3d90000 {
+      compatible = "qcom,sm8250-gpucc";
+      reg = <0x3d90000 0x9000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+               <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+      clock-names = "bi_tcxo",
+                    "gcc_gpu_gpll0_clk_src",
+                    "gcc_gpu_gpll0_div_clk_src";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,gpucc-sm8250.h b/include/dt-bindings/clock/qcom,gpucc-sm8250.h
new file mode 100644
index 000000000000..c8fe64e399fd
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gpucc-sm8250.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_SM8250_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_SM8250_H
+
+/* GPU_CC clock registers */
+#define GPU_CC_AHB_CLK				0
+#define GPU_CC_CRC_AHB_CLK			1
+#define GPU_CC_CX_APB_CLK			2
+#define GPU_CC_CX_GMU_CLK			3
+#define GPU_CC_CX_QDSS_AT_CLK			4
+#define GPU_CC_CX_QDSS_TRIG_CLK			5
+#define GPU_CC_CX_QDSS_TSCTR_CLK		6
+#define GPU_CC_CX_SNOC_DVM_CLK			7
+#define GPU_CC_CXO_AON_CLK			8
+#define GPU_CC_CXO_CLK				9
+#define GPU_CC_GMU_CLK_SRC			10
+#define GPU_CC_GX_GMU_CLK			11
+#define GPU_CC_GX_QDSS_TSCTR_CLK		12
+#define GPU_CC_GX_VSENSE_CLK			13
+#define GPU_CC_PLL1				14
+#define GPU_CC_SLEEP_CLK			15
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK		16
+
+/* GPU_CC Resets */
+#define GPUCC_GPU_CC_ACD_BCR			0
+#define GPUCC_GPU_CC_CX_BCR			1
+#define GPUCC_GPU_CC_GFX3D_AON_BCR		2
+#define GPUCC_GPU_CC_GMU_BCR			3
+#define GPUCC_GPU_CC_GX_BCR			4
+#define GPUCC_GPU_CC_XO_BCR			5
+
+/* GPU_CC GDSCRs */
+#define GPU_CX_GDSC				0
+#define GPU_GX_GDSC				1
+
+#endif
-- 
2.26.1

