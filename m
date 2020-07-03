Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 282FB2136A7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2020 10:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbgGCIog (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jul 2020 04:44:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgGCIog (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jul 2020 04:44:36 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 029DDC08C5C1
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2020 01:44:36 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id g75so31250154wme.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2020 01:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EnE6Ie1AshEC9kkSkD1phqKDaIW4ZsPLXsjnuMEgDU4=;
        b=aw1ohUsBoxDniIyHNA7v9rnOKSNC66sjlVpOBM5APjRG6gPP9i9mIa341pwrvaLg4c
         j0R6Tn7xEcRao5qhNSmg6FSwQQrxxEdzl5dbI0lXVMLmFRklohnafoWqhI/tFYAJYvRO
         ExBwhDJMvblHQDUUqgVG1xN2i4T0iiLGXJdWd3k+9CIMMLUclDFwJYhEK/KrRr402XN3
         rE+LaYWyl+Ho3w2nVfZTLc0Gj54XoSR6rE5N67g3VIkZMJ4pdG4/XRUIwzID7U/0tnqv
         L9WV+RFdSoUKXLYobGtfzYb+xjwm9ROcv/44pZHSuQGcFlRD35YCasG2NvRzLHjKg6bO
         AlvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EnE6Ie1AshEC9kkSkD1phqKDaIW4ZsPLXsjnuMEgDU4=;
        b=M9TUUetKXSUJQIvYj0kGu/goIj+m9RhL5ZSO4f5QJ2A32zrIzty4eEMfc2oduKRlrQ
         gvoOArCSMELOq3l4fC45kf4R9Tj6XVOKZ/qcR/5P6I4bdTfuh1TKlPgkVfIvK9x0f2+O
         Qw9iS+wOOQpEaHRtfqfuC/aUpGQsNXWmTwVGkuutJtTvxKGmBhLFEIS/O/95W0gP8j57
         vJmuoXxEbxp5FS3fKglEDxnKAmDoZkfW1I82xpMhX7mEqEn6JR/Dz/FCyhldlEGwVtag
         mPVVSU4IR45ERhICRgwI5RHHsEPQRvSeHyuLT5xAa+Tclp0Aujom4qrB7SO5+4hSFy5x
         w7sA==
X-Gm-Message-State: AOAM5339CAskd1AWWGf9CuBmOdGdU+XG1Q74QrHVd0sEQsXrNKDDyWpa
        X+1Cdjf91B6FmcbfTFXdg5ffmQ==
X-Google-Smtp-Source: ABdhPJzHaGuRIryFRfqDYj/1ac3PdTPEdE2FmP9y5RQ8kfQ08roaBOYWoRuACMf9TgqTfaMZpACkBw==
X-Received: by 2002:a1c:e209:: with SMTP id z9mr36019759wmg.153.1593765874676;
        Fri, 03 Jul 2020 01:44:34 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id b18sm4213116wrs.46.2020.07.03.01.44.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Jul 2020 01:44:34 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     sboyd@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        amit.kucheria@linaro.org, Ilia Lin <ilialin@codeaurora.org>
Subject: [PATCH v5 3/5] dt-bindings: clk: qcom: Add bindings for CPU clock for msm8996
Date:   Fri,  3 Jul 2020 10:49:43 +0200
Message-Id: <1593766185-16346-4-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593766185-16346-1-git-send-email-loic.poulain@linaro.org>
References: <1593766185-16346-1-git-send-email-loic.poulain@linaro.org>
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

