Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4E33150F8D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2020 19:33:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729906AbgBCScY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 13:32:24 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:34306 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729898AbgBCScX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 13:32:23 -0500
Received: by mail-pj1-f65.google.com with SMTP id f2so131248pjq.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 10:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tpuBJ+X4Zpv3Hq2Nj3G13VWpyOHBqY9l0gE+WjaNiwA=;
        b=lvKD+cSzmJQ5jI23qGOx7AvWKFYMfWXMsQDsTM7+F7BP6q1vioKgLoswpXuACkN1/V
         EVLOmiRW+JZ4wmEEaRT4FTschoV+JLgN+Ehf+u6s3WBkWQxBAfkj0qKJQNuAfh4dVxJG
         nh7D5W8vADGeirG457aNk+yavORiJ5MnyukJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tpuBJ+X4Zpv3Hq2Nj3G13VWpyOHBqY9l0gE+WjaNiwA=;
        b=cCab9YAuE7hrTt1UdgyDdd7Ov8CO5FXo7i1dN+N5wzYNQrjjcq9qLfdI4ZK6+/0XB6
         sx7LwvfD9CLNvPfdxmj4Rv547B99upV73zPX8zSR0HbMw0lt1g8ppqLolZgcUHuZiKfQ
         EmqLDQxQQscD9EIQ4zTHr2hEDTW6HNIwhPKmwD75jgRcDdiygCvr7h60E3xGKl9hA1sT
         d2X8n7W5/SdaYwUc+MLTmtxQ32mRugZsdZBxjdxi6kCBYexGm2yZp3fJq8HWpvanVXD+
         W5Q6sMLTWr8nU2OmR18io12/Xqzm5Vnb3bA4d3Wrff0ds+DmGWwmCH9IfsZK6NEpdoD1
         K3YQ==
X-Gm-Message-State: APjAAAVtU4wHcGWKwN9Tx1Fdzku1Br+dk1C+yAFtnwS/uyaUDP25y0PZ
        xH0xQRE9mt90On+pshWGDK4OYQ==
X-Google-Smtp-Source: APXvYqw45E5dsFm72/otC1lt06Y7EtOB37KF9pSdEd/dpFCOCGmm4kFyJ3Ti8X8PtIi59D6WHwnfRQ==
X-Received: by 2002:a17:90a:c388:: with SMTP id h8mr374464pjt.83.1580754741274;
        Mon, 03 Feb 2020 10:32:21 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id f9sm21009137pfd.141.2020.02.03.10.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 10:32:20 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, jeffrey.l.hugo@gmail.com,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        devicetree@vger.kernel.org, mka@chromium.org,
        kalyan_t@codeaurora.org, Mark Rutland <mark.rutland@arm.com>,
        linux-clk@vger.kernel.org, hoegsberg@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 07/15] dt-bindings: clock: Fix qcom,gpucc bindings for sdm845/sc7180/msm8998
Date:   Mon,  3 Feb 2020 10:31:40 -0800
Message-Id: <20200203103049.v4.7.I513cd73b16665065ae6c22cf594d8b543745e28c@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200203183149.73842-1-dianders@chromium.org>
References: <20200203183149.73842-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The qcom,gpucc bindings had a few problems with them:

1. When things were converted to yaml the name of the "gpll0 main"
   clock got changed from "gpll0" to "gpll0_main".  Change it back for
   msm8998.

2. Apparently there is a push not to use purist aliases for clocks but
   instead to just use the internal Qualcomm names.  For sdm845 and
   sc7180 (where the drivers haven't already been changed) move in
   this direction.

Things were also getting complicated harder to deal with by jamming
several SoCs into one file.  Splitting simplifies things.

Fixes: 5c6f3a36b913 ("dt-bindings: clock: Add YAML schemas for the QCOM GPUCC clock bindings")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- (non-change): Didn't combine sdm845 & sc7180 gpucc as per Stephen.
- Fixed schema id to not have "bindings/" as per Rob.

Changes in v3:
- Added pointer to inlude file in description.
- Everyone but msm8998 now uses internal QC names.
- Fixed typo grpahics => graphics
- Split bindings into 3 files.

Changes in v2:
- Patch ("dt-bindings: clock: Fix qcom,gpucc...") new for v2.

 .../devicetree/bindings/clock/qcom,gpucc.yaml | 72 -------------------
 .../bindings/clock/qcom,msm8998-gpucc.yaml    | 66 +++++++++++++++++
 .../bindings/clock/qcom,sc7180-gpucc.yaml     | 72 +++++++++++++++++++
 .../bindings/clock/qcom,sdm845-gpucc.yaml     | 72 +++++++++++++++++++
 4 files changed, 210 insertions(+), 72 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,msm8998-gpucc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-gpucc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sdm845-gpucc.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
deleted file mode 100644
index 622845aa643f..000000000000
--- a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
+++ /dev/null
@@ -1,72 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/bindings/clock/qcom,gpucc.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm Graphics Clock & Reset Controller Binding
-
-maintainers:
-  - Taniya Das <tdas@codeaurora.org>
-
-description: |
-  Qualcomm grpahics clock control module which supports the clocks, resets and
-  power domains.
-
-properties:
-  compatible:
-    enum:
-      - qcom,msm8998-gpucc
-      - qcom,sc7180-gpucc
-      - qcom,sdm845-gpucc
-
-  clocks:
-    minItems: 1
-    maxItems: 3
-    items:
-      - description: Board XO source
-      - description: GPLL0 main branch source from GCC(gcc_gpu_gpll0_clk_src)
-      - description: GPLL0 div branch source from GCC(gcc_gpu_gpll0_div_clk_src)
-
-  clock-names:
-    minItems: 1
-    maxItems: 3
-    items:
-      - const: xo
-      - const: gpll0_main
-      - const: gpll0_div
-
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-required:
-  - compatible
-  - reg
-  - clocks
-  - clock-names
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
-
-examples:
-  # Example of GPUCC with clock node properties for SDM845:
-  - |
-    clock-controller@5090000 {
-      compatible = "qcom,sdm845-gpucc";
-      reg = <0x5090000 0x9000>;
-      clocks = <&rpmhcc 0>, <&gcc 31>, <&gcc 32>;
-      clock-names = "xo", "gpll0_main", "gpll0_div";
-      #clock-cells = <1>;
-      #reset-cells = <1>;
-      #power-domain-cells = <1>;
-     };
-...
diff --git a/Documentation/devicetree/bindings/clock/qcom,msm8998-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,msm8998-gpucc.yaml
new file mode 100644
index 000000000000..7d853c1a85e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,msm8998-gpucc.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,msm8998-gpucc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics Clock & Reset Controller Binding for MSM8998
+
+maintainers:
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm graphics clock control module which supports the clocks, resets and
+  power domains on MSM8998.
+
+  See also dt-bindings/clock/qcom,gpucc-msm8998.h.
+
+properties:
+  compatible:
+    const: qcom,msm8998-gpucc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: GPLL0 main branch source (gcc_gpu_gpll0_clk_src)
+
+  clock-names:
+    items:
+      - const: xo
+      - const: gpll0
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
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8998.h>
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    clock-controller@5065000 {
+      compatible = "qcom,msm8998-gpucc";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+      reg = <0x05065000 0x9000>;
+      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&gcc GPLL0_OUT_MAIN>;
+      clock-names = "xo", "gpll0";
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7180-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7180-gpucc.yaml
new file mode 100644
index 000000000000..5785192cc4be
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7180-gpucc.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sc7180-gpucc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics Clock & Reset Controller Binding for SC7180
+
+maintainers:
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm graphics clock control module which supports the clocks, resets and
+  power domains on SC7180.
+
+  See also dt-bindings/clock/qcom,gpucc-sc7180.h.
+
+properties:
+  compatible:
+    const: qcom,sc7180-gpucc
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
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@5090000 {
+      compatible = "qcom,sc7180-gpucc";
+      reg = <0 0x05090000 0 0x9000>;
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
diff --git a/Documentation/devicetree/bindings/clock/qcom,sdm845-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sdm845-gpucc.yaml
new file mode 100644
index 000000000000..bac04f1c5d79
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sdm845-gpucc.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sdm845-gpucc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics Clock & Reset Controller Binding for SDM845
+
+maintainers:
+  - Taniya Das <tdas@codeaurora.org>
+
+description: |
+  Qualcomm graphics clock control module which supports the clocks, resets and
+  power domains on SDM845.
+
+  See also dt-bindings/clock/qcom,gpucc-sdm845.h.
+
+properties:
+  compatible:
+    const: qcom,sdm845-gpucc
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
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@5090000 {
+      compatible = "qcom,sdm845-gpucc";
+      reg = <0 0x05090000 0 0x9000>;
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
-- 
2.25.0.341.g760bfbb309-goog

