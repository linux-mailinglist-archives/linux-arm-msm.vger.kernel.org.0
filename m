Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 123F6355F54
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 01:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245056AbhDFXTZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 19:19:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242895AbhDFXTX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 19:19:23 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A767C061760
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Apr 2021 16:19:13 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id o10so25372565lfb.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Apr 2021 16:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MqUyCQ8bApydwGreXPqVnRLc78HVU/m7ATGYH5tMkXg=;
        b=YhWJ4w34d5BT8WeRgmPjRzgfvtQ/G+N5xQqF+e/xyxgLPYXcQCJIOmOuw07gRyk8di
         KsiuvhrWHUj7AIm14xo/f0UXiVt83vGwvX9wMEg2WJkbfGQ4kETjogeiVfOMVaogxwbx
         sVAM2uaUvZFanT+G9mvxDOQE6TOtNZ8sxliDOl4R7LdKme5VmVwZEw7eAORzx1kuPoIG
         okrfJEhGPKCb7/vfC/MkGsf9CE+3HKYJs1PUswBHYrK8JTP6lJF4Q60Ko+V5jK+vioH7
         BomBa+V0WIcsX6F9/NA2pd3xpa92W5kA3CWdzeb3th/Bl2EH3Pc43ouHr19cwTiiQVTJ
         kfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MqUyCQ8bApydwGreXPqVnRLc78HVU/m7ATGYH5tMkXg=;
        b=mkjp52Tck0aLhvitBiMVdpu8KqhuwTni2pIZL3vA1Gj7R0acMk2+mPVcUBhI+GWmQ8
         X/qJvGG3iEnhzWhsmVXlD5todkSlbEd6k71ZAkTTuG27/RT2URJIVit6tkSUOjtIEs0V
         JCCtkKNd2UARhBkoklVXvuZbAR533vqibtiiOBJUXe67O0jg+juS0o2ddZtqStnVE+UG
         /fujjM63z0leiznsXITp9dpimA/Q9f8vc3wlbOTHvrgNgIArShhFRqe6b8mnBNqPRA4M
         29KcPjI2NZYUHMWf2iWTByqEdFF7Pr5pmMZxYuIyhu7NRzpsSg/zcHeum7Ahmml0kWlN
         qabw==
X-Gm-Message-State: AOAM531/KQYaGXsvLm5z9HRB36C9milwn3o2uMUSEx/+Ti9/8Yg6nvvp
        4oWauFAi8HxOVphFsZ0MLr/zVQ==
X-Google-Smtp-Source: ABdhPJwkLWiyhCewoLQCKO+jo8s3cpku/eCJjC3nN5ah9VRA02+LNwBh7nJO7JtF32yDagLZbL6+wQ==
X-Received: by 2002:a05:6512:11c7:: with SMTP id h7mr393606lfr.197.1617751152000;
        Tue, 06 Apr 2021 16:19:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u16sm2366565lja.48.2021.04.06.16.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 16:19:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: clock: separate SDM845 GCC clock bindings
Date:   Wed,  7 Apr 2021 02:19:06 +0300
Message-Id: <20210406231909.3035267-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210406231909.3035267-1-dmitry.baryshkov@linaro.org>
References: <20210406231909.3035267-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Separate qcom,gcc-sdm845 clock bindings, adding required clocks and
clock-names properties.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gcc-sdm845.yaml       | 84 +++++++++++++++++++
 .../devicetree/bindings/clock/qcom,gcc.yaml   |  2 -
 2 files changed, 84 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
new file mode 100644
index 000000000000..4808fa7a6b8c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-sdm845.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on SDM845
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-sdm845.h
+
+properties:
+  compatible:
+    const: qcom,gcc-sdm845
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board active XO source
+      - description: Sleep clock source
+      - description: PCIE 0 Pipe clock source (Optional clock)
+      - description: PCIE 1 Pipe clock source (Optional clock)
+    minItems: 3
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+      - const: bi_tcxo_ao
+      - const: sleep_clk
+      - const: pcie_0_pipe_clk # Optional clock
+      - const: pcie_1_pipe_clk # Optional clock
+    minItems: 3
+    maxItems: 5
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
+  # Example for GCC for MSM8960:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@100000 {
+      compatible = "qcom,gcc-sdm845";
+      reg = <0x100000 0x1f0000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>,
+               <&sleep_clk>;
+      clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
index ee0467fb5e31..490edad25830 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
@@ -32,7 +32,6 @@ description: |
   - dt-bindings/clock/qcom,gcc-mdm9615.h
   - dt-bindings/reset/qcom,gcc-mdm9615.h
   - dt-bindings/clock/qcom,gcc-sdm660.h  (qcom,gcc-sdm630 and qcom,gcc-sdm660)
-  - dt-bindings/clock/qcom,gcc-sdm845.h
 
 properties:
   compatible:
@@ -52,7 +51,6 @@ properties:
       - qcom,gcc-mdm9615
       - qcom,gcc-sdm630
       - qcom,gcc-sdm660
-      - qcom,gcc-sdm845
 
   '#clock-cells':
     const: 1
-- 
2.30.2

