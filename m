Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5143935319B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Apr 2021 01:39:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234821AbhDBXju (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 19:39:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235228AbhDBXjt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 19:39:49 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 894CDC0613E6
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 16:39:47 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id o16so6971260ljp.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 16:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MqUyCQ8bApydwGreXPqVnRLc78HVU/m7ATGYH5tMkXg=;
        b=CRV4wVaJgKNwAGzfnLsbhXrf3/5B0OdKHc/t5G3+AztIgYdXNASnYWvk+zZfNGxRA9
         Pv3AmSbcvzkl8tFQUWb1fhhEniE/TIVl21lJ7WLosk/JLXrqpdE/oztF/LaPRaCITXHO
         hKbPduoy7VoYEuR4SEla8ygjeKA1lsgnWvd+IvjkZHUZ8SldAjFxZtxA8spcO5pIWbsb
         iWAPMoMF8zQZT98wHDWdwa4RXmuJTR7paQ4WYc+ar6VpVO07AQsFFzwQqDGPBQHwYNzS
         iEcvmlaCMndVJDmRxlhKTZ4sdLqL1EYLaZB0TZgHtiqN4fLO85rb20ATEac39z6lcHl1
         qmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MqUyCQ8bApydwGreXPqVnRLc78HVU/m7ATGYH5tMkXg=;
        b=djq6e0MQ9umKtdz4z26lwIG1OwsUxSoH0NHRd2mX4ozN27o0IChJPyHyAxNoXlLYA6
         ptliavFt8R3Q9SWy8fjqyzf9yRtn4kFfo3ATlA8txRk/LzWzYRFKvu28NK0HV6oubUfC
         h4ika/CnqfSN/OrLh6mVXW2OAedBZns0OFx48MtmUws7dSkNYLDd1ulBLbk9i6j0bgn3
         AyRTutddw1uMHKqMM4m6iftUwvaxdqdyTJdIiXrx8X8hidKSyo/CiqC/ajNaCR+dzs5m
         Baa2S+zsOTuMxzu5Xp7wBHqkURanBcEqp/+OeObz3fYqJPw99+KIzd1XR2QiqYIZUVQv
         UtSw==
X-Gm-Message-State: AOAM533c5zk2pYM8QI4kr3VbLCN2JlzIDt0RDcJLOIaL/hStdPSO/uEo
        fPCOld245Qa3L5KLSVEFKe2KuZPCwPKp5Q==
X-Google-Smtp-Source: ABdhPJyFSpdNKrhaXLogMPPh4tFDp1fdxd0HOYG9LhFrVBtCNJ2uEagmXOd8XtRqY7ZnA7sT00/0PA==
X-Received: by 2002:a2e:9b14:: with SMTP id u20mr9483055lji.463.1617406786121;
        Fri, 02 Apr 2021 16:39:46 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w30sm1013134lfq.210.2021.04.02.16.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 16:39:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v1 1/4] dt-bindings: clock: separate SDM845 GCC clock bindings
Date:   Sat,  3 Apr 2021 02:39:41 +0300
Message-Id: <20210402233944.273275-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
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

