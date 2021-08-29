Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17BF13FAE0D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 21:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234667AbhH2ThW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Aug 2021 15:37:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233976AbhH2ThU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Aug 2021 15:37:20 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 833D3C061756
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Aug 2021 12:36:28 -0700 (PDT)
Received: from localhost.localdomain (83.6.166.149.neoplus.adsl.tpnet.pl [83.6.166.149])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 8A9DC3E81B;
        Sun, 29 Aug 2021 21:36:22 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2 1/9] dt-bindings: clk: qcom: Add bindings for MSM8994 GCC driver
Date:   Sun, 29 Aug 2021 21:36:08 +0200
Message-Id: <20210829193617.4105-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add documentation for the MSM8994 GCC driver.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Acked-by: Rob Herring <robh@kernel.org>
---
No changes since the original v2, only added Rob's A-b

 .../bindings/clock/qcom,gcc-msm8994.yaml      | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
new file mode 100644
index 000000000000..b44a844d894c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/clock/qcom,gcc-msm8994.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Global Clock & Reset Controller Binding for MSM8994
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on MSM8994 and MSM8992.
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-msm8994.h
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Taniya Das <tdas@codeaurora.org>
+
+properties:
+  compatible:
+    enum:
+      - qcom,gcc-msm8992
+      - qcom,gcc-msm8994
+
+  clocks:
+    items:
+      - description: XO source
+      - description: Sleep clock source
+
+  clock-names:
+    items:
+      - const: xo
+      - const: sleep
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
+  protected-clocks:
+    description:
+      Protected clock specifier list as per common clock binding.
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@300000 {
+      compatible = "qcom,gcc-msm8994";
+      reg = <0x300000 0x90000>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+      clocks = <&xo_board>, <&sleep_clk>;
+      clock-names = "xo", "sleep";
+    };
+...
-- 
2.33.0

