Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2332F21A157
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 15:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728103AbgGINyk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 09:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728099AbgGINyh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 09:54:37 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDF5FC08E6DC
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 06:54:36 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id j10so1656354qtq.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 06:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xBmIQ/oFSlwKs4/CrMYdbz9vzigPGjdXhvW7tiY1q5s=;
        b=Y0t8U+7kBoHAhht8cZbl0esChsmmQGUV65NQEP4n2Mi67f8bU0caK8Eg8LNtdABMJj
         CS2EpBebA7TozKr9tsjnw6Wx5yav4ul1LoFieYf9jYfYvKuCLPLlzlkJo4+XvBFDMN0y
         qB0+6o/C2HPq6G3dP6zr0h4Sim2KH1JeEsORHLOzoLnkMzIcE7lzCRS6gBXFwKQ8gpx0
         jh09Q0rLx6Hv7zFx3Sp3LDHKvsI41hQEImppIOyzzY7DFApxdnzUmsVodiBBBeFf0w56
         6szy6O21223IbvVmDakpwISGgrwFgnH+iRAaCHGk9nB3mFyPIMQ1kudtw6cW6DwzoRms
         InWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xBmIQ/oFSlwKs4/CrMYdbz9vzigPGjdXhvW7tiY1q5s=;
        b=QI8nno3yOM7psdMkj+v8cFbQeYuNil7qRLS/bCQCeqycEffNbFhZSYZXAaN/qXZoHP
         WcqNKZ4+bbvgMIHsSW6DtbkBzsRA+o9ZqgDbeX2KjMazW1DF80jbWymnu2ZmO76VMf2z
         1E4rb7odNO4j9cMTMFiZE+drTliGv9C6tYCXGCsUol4iHinUhFstPCGqOAk0EC8EMmFK
         aMWfd7zVtLqRksfXiU+xTOObjoboPcSrMg0Cv6E644qxjxQEwdFieiBWtuSICjpIWlFs
         irBeQJkT1wqQ0hl/5XWU+ZbskCOsVPhKucdFdXYd2zExnbFUgHwXg2CO1ZQqPrq7mXUN
         2YWA==
X-Gm-Message-State: AOAM531BCfI5HgTZygmnmGUo7WoVC3x46jNeon4lNYSxzQlpkO2rZz1+
        3O0L8KhctR3Kh5/Qgu9/XTeENF3S6fs=
X-Google-Smtp-Source: ABdhPJxEu2r7SE7pouSNQfxD3yyelZtr61AgVQwz8GFUA1mtvBCxou6af4TnVPC6zx/KBLl2y4g74A==
X-Received: by 2002:ac8:5486:: with SMTP id h6mr65069007qtq.255.1594302875850;
        Thu, 09 Jul 2020 06:54:35 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id 130sm3632735qkn.82.2020.07.09.06.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 06:54:35 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 06/14] dt-bindings: clock: combine qcom,sdm845-gpucc and qcom,sc7180-gpucc
Date:   Thu,  9 Jul 2020 09:52:37 -0400
Message-Id: <20200709135251.643-7-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200709135251.643-1-jonathan@marek.ca>
References: <20200709135251.643-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These two bindings are almost identical, so combine them into one. This
will make it easier to add the sm8150 and sm8250 gpucc bindings.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 ...qcom,sdm845-gpucc.yaml => qcom,gpucc.yaml} | 14 ++--
 .../bindings/clock/qcom,sc7180-gpucc.yaml     | 74 -------------------
 2 files changed, 9 insertions(+), 79 deletions(-)
 rename Documentation/devicetree/bindings/clock/{qcom,sdm845-gpucc.yaml => qcom,gpucc.yaml} (82%)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-gpucc.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,sdm845-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
similarity index 82%
rename from Documentation/devicetree/bindings/clock/qcom,sdm845-gpucc.yaml
rename to Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
index 8a0c576ba8b3..aab6bef79771 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sdm845-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
@@ -1,23 +1,27 @@
 # SPDX-License-Identifier: GPL-2.0-only
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/clock/qcom,sdm845-gpucc.yaml#
+$id: http://devicetree.org/schemas/clock/qcom,gpucc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Graphics Clock & Reset Controller Binding for SDM845
+title: Qualcomm Graphics Clock & Reset Controller Binding
 
 maintainers:
   - Taniya Das <tdas@codeaurora.org>
 
 description: |
   Qualcomm graphics clock control module which supports the clocks, resets and
-  power domains on SDM845.
+  power domains on SDM845/SC7180.
 
-  See also dt-bindings/clock/qcom,gpucc-sdm845.h.
+  See also:
+    dt-bindings/clock/qcom,gpucc-sdm845.h
+    dt-bindings/clock/qcom,gpucc-sc7180.h
 
 properties:
   compatible:
-    const: qcom,sdm845-gpucc
+    enum:
+      - qcom,sdm845-gpucc
+      - qcom,sc7180-gpucc
 
   clocks:
     items:
diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7180-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7180-gpucc.yaml
deleted file mode 100644
index fe08461fce05..000000000000
--- a/Documentation/devicetree/bindings/clock/qcom,sc7180-gpucc.yaml
+++ /dev/null
@@ -1,74 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/clock/qcom,sc7180-gpucc.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm Graphics Clock & Reset Controller Binding for SC7180
-
-maintainers:
-  - Taniya Das <tdas@codeaurora.org>
-
-description: |
-  Qualcomm graphics clock control module which supports the clocks, resets and
-  power domains on SC7180.
-
-  See also dt-bindings/clock/qcom,gpucc-sc7180.h.
-
-properties:
-  compatible:
-    const: qcom,sc7180-gpucc
-
-  clocks:
-    items:
-      - description: Board XO source
-      - description: GPLL0 main branch source
-      - description: GPLL0 div branch source
-
-  clock-names:
-    items:
-      - const: bi_tcxo
-      - const: gcc_gpu_gpll0_clk_src
-      - const: gcc_gpu_gpll0_div_clk_src
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
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
-    #include <dt-bindings/clock/qcom,rpmh.h>
-    clock-controller@5090000 {
-      compatible = "qcom,sc7180-gpucc";
-      reg = <0x05090000 0x9000>;
-      clocks = <&rpmhcc RPMH_CXO_CLK>,
-               <&gcc GCC_GPU_GPLL0_CLK_SRC>,
-               <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
-      clock-names = "bi_tcxo",
-                    "gcc_gpu_gpll0_clk_src",
-                    "gcc_gpu_gpll0_div_clk_src";
-      #clock-cells = <1>;
-      #reset-cells = <1>;
-      #power-domain-cells = <1>;
-    };
-...
-- 
2.26.1

