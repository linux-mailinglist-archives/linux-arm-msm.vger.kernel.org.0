Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93847212003
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 11:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726169AbgGBJeX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jul 2020 05:34:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726875AbgGBJeX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jul 2020 05:34:23 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1567C08C5DE
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2020 02:34:22 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id q5so27312504wru.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2020 02:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EnE6Ie1AshEC9kkSkD1phqKDaIW4ZsPLXsjnuMEgDU4=;
        b=Kwjrp8JUGP94CccB4cuXgAi3KuHXYzOXOQq64FLnC6mOkK3fmZYC6cY7BdONXm0LZi
         PUR6ssV9G01wfDbQ7PrGAPrexfVLZt+TyEPUAFGLllR1AM53gAhMl4wj4oGZjub0twue
         HMGoUK2jCTC4zpNOxDJF4lUNJTkJJLncCHBWigvDIo+Vw7HOGW+rlGpvo2LSDU+0diR7
         pXfUTROIT2a16+rXvI4ghX8kME2uONA9rTZNH3Ax3pVKpqvrwKkauNcxTp0pplxqbJC4
         9FzCH8cO26ojNmvqERd+/PS3gOuAAAKtwQNNfpuOzisswgWGLrOCBUsoNubt1rXVGwR3
         9itA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EnE6Ie1AshEC9kkSkD1phqKDaIW4ZsPLXsjnuMEgDU4=;
        b=caQ0dHHva6W0qkhuespACvMsrv+I2LAv8HBJjTWBlo1cOydyapydoGgTqYPZQGsTLo
         krGofhaNR6HHt5aqoTLBALjxV9Lmo+9WeklRNKYZ2IB1BlGZgHSao9aAcRK+RHPYvNQw
         vBzfe/g7ia2oaoicm7p05XYQZ+up4lkaAdT3bpUEBmerqMyMGpmFQCuhcqBrxM58t8+P
         Vk51EdmTkAovVhNHoMfJovCbYb8rLdA1uwA5gHyp+2NXcPJwuFFlwXxWAkfd06pH+zJz
         t7TKWTvcmlVRjgziPBzhEJobyZvpuA8dWxxctoWl9jCWIcfrLl9FX/lpRjl3Q9PWYckg
         wnpQ==
X-Gm-Message-State: AOAM5334jZAoZjmwqivXKaSspTyDP9KUZ5g0PivB+a4+GJjqgYgEO1Hz
        QEn+xBOMslM+iO5j9c6DimKaMQ==
X-Google-Smtp-Source: ABdhPJw6oI3Q8ll9ZDS6H3SeJLY6Vz/VaMPJAY3lzbSaZGRUso7OG6cpKtYyIKHHX9HtpLYj/5IeFQ==
X-Received: by 2002:adf:9404:: with SMTP id 4mr29723099wrq.367.1593682461410;
        Thu, 02 Jul 2020 02:34:21 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id b184sm10326345wmc.20.2020.07.02.02.34.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Jul 2020 02:34:21 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     sboyd@kernel.org, bjorn.andersson@linaro.org
Cc:     mturquette@baylibre.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, Ilia Lin <ilialin@codeaurora.org>
Subject: [PATCH v3 3/4] dt-bindings: clk: qcom: Add bindings for CPU clock for msm8996
Date:   Thu,  2 Jul 2020 11:39:22 +0200
Message-Id: <1593682763-31368-4-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593682763-31368-1-git-send-email-loic.poulain@linaro.org>
References: <1593682763-31368-1-git-send-email-loic.poulain@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Ilia Lin <ilialin@codeaurora.org>

Each of the CPU clusters (Power and Perf) on msm8996 are
clocked via 2 PLLs, a primary and alternate. There are also
2 Mux'es, a primary and secondary all connected together
as shown below

                             +-------+
              XO             |       |
          +------------------>0      |
                             |       |
                   PLL/2     | SMUX  +----+
                     +------->1      |    |
                     |       |       |    |
                     |       +-------+    |    +-------+
                     |                    +---->0      |
                     |                         |       |
+---------------+    |             +----------->1      | CPU clk
|Primary PLL    +----+ PLL_EARLY   |           |       +------>
|               +------+-----------+    +------>2 PMUX |
+---------------+      |                |      |       |
                       |   +------+     |   +-->3      |
                       +--^+  ACD +-----+   |  +-------+
+---------------+          +------+         |
|Alt PLL        |                           |
|               +---------------------------+
+---------------+         PLL_EARLY

The primary PLL is what drives the CPU clk, except for times
when we are reprogramming the PLL itself (for rate changes) when
we temporarily switch to an alternate PLL. A subsequent patch adds
support to switch between primary and alternate PLL during rate
changes.

The primary PLL operates on a single VCO range, between 600MHz
and 3GHz. However the CPUs do support OPPs with frequencies
between 300MHz and 600MHz. In order to support running the CPUs
at those frequencies we end up having to lock the PLL at twice
the rate and drive the CPU clk via the PLL/2 output and SMUX.

Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/clock/qcom,msm8996-apcc.yaml          | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml b/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
new file mode 100644
index 0000000..d673ede
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,kryocc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm clock controller for MSM8996 CPUs
+
+maintainers:
+  - Loic Poulain <loic.poulain@linaro.org>
+
+description: |
+  Qualcomm CPU clock controller for MSM8996 CPUs, clock 0 is for Power cluster
+  and clock 1 is for Perf cluster.
+
+properties:
+  compatible:
+    enum:
+      - qcom,msm8996-apcc
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    items:
+      - description: Primary PLL clock for power cluster (little)
+      - description: Primary PLL clock for perf cluster (big)
+      - description: Alternate PLL clock for power cluster (little)
+      - description: Alternate PLL clock for perf cluster (big)
+
+  clock-names:
+    items:
+      - const: pwrcl_pll
+      - const: perfcl_pll
+      - const: pwrcl_alt_pll
+      - const: perfcl_alt_pll
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  # Example for msm8996
+  - |
+    kryocc: clock-controller@6400000 {
+        compatible = "qcom,msm8996-apcc";
+        reg = <0x6400000 0x90000>;
+        #clock-cells = <1>;
+  };
+...
-- 
2.7.4

