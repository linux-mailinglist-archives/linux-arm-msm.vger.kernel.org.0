Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 550592F527B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 19:43:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728163AbhAMSjw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 13:39:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728543AbhAMSjw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 13:39:52 -0500
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4796DC061794;
        Wed, 13 Jan 2021 10:39:12 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 1060D2007F;
        Wed, 13 Jan 2021 19:38:22 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v2 9/9] dt-bindings: clock: Add QCOM SDM630 and SDM660 graphics clock bindings
Date:   Wed, 13 Jan 2021 19:38:17 +0100
Message-Id: <20210113183817.447866-10-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org>
References: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for graphics clock controller for
Qualcomm Technology Inc's SDM630 and SDM660 SoCs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 .../bindings/clock/qcom,gpucc-sdm660.yaml     | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc-sdm660.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc-sdm660.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc-sdm660.yaml
new file mode 100644
index 000000000000..6631f25d7699
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc-sdm660.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gpucc-sdm660.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics Clock & Reset Controller Binding for SDM630 and SDM660
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
+
+description: |
+  Qualcomm graphics clock control module which supports the clocks, resets and
+  power domains on SDM630 and SDM660.
+
+  See also dt-bindings/clock/qcom,gpucc-sdm660.h.
+
+properties:
+  compatible:
+    enum:
+      - qcom,gpucc-sdm630
+      - qcom,gpucc-sdm660
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: GPLL0 main gpu branch
+      - description: GPLL0 divider gpu branch
+
+  clock-names:
+    items:
+      - const: xo
+      - const: gcc_gpu_gpll0_clk
+      - const: gcc_gpu_gpll0_div_clk
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
+    #include <dt-bindings/clock/qcom,gcc-sdm660.h>
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+
+    clock-controller@5065000 {
+      compatible = "qcom,gpucc-sdm660";
+      reg = <0x05065000 0x9038>;
+      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+               <&gcc GCC_GPU_GPLL0_CLK>,
+               <&gcc GCC_GPU_GPLL0_DIV_CLK>;
+      clock-names = "xo", "gcc_gpu_gpll0_clk",
+                    "gcc_gpu_gpll0_div_clk";
+      #clock-cells = <1>;
+      #power-domain-cells = <1>;
+      #reset-cells = <1>;
+    };
+...
-- 
2.29.2

