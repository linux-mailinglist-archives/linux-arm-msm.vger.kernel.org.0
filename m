Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36A0C40A447
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 05:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238787AbhINDWV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 23:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238474AbhINDWT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 23:22:19 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43B94C061764
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 20:20:52 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id w19so6434883pfn.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 20:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tTEiTbO1ZH85XonKLmdTYGjcvfIzkgPG2492l17rrOI=;
        b=o0Wp+y9Oc1SJtQMVmXF5bDY6z8etnwqllWaOXlatEAHh6g/e8PFaZ5snnZBs++t+oc
         rGt61Oar74qZzrkPtfF6qRGdWrsK4weJGlCy4H3WQ2Ob5CEvVMRFeOC9PCTJ3l0YU+JJ
         xs4K66GUk3C1rkGaPeA9+6kLMl9ylzRukNiKnBUHBaVWvhTsbgpN6x3zwMlCFFwNxhwR
         +BGmWYkMSGsSQGzrbcXxlCXjx0rJxg0e8fY+wYOq3i64Cs/zbiL9zJ0Trfafq9sei6Yc
         9UvVLyDk1HlWbkwhSW8M3LvOc6PzZoz8ICTi7lZZBZPZHL/9AAlEILSaqnFA2rRJM1vs
         BgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tTEiTbO1ZH85XonKLmdTYGjcvfIzkgPG2492l17rrOI=;
        b=A3xy5WGXflebtcv0u4NT1YHHGdPXa1SLZ9oTJ9jkWG1W/UpQbzcwfO0Scjh50Jf8H0
         /oVn0+y5So5UBfE/htF0VbNF0ZcX/1J9woACLvJye5Pg+zNUxzdulEmH6RP9Fbn3vqyc
         XCfEqi7iPP8St09FwWuvNEiYZXTarF5xcuoFsqYEjfnl62kjHePP5Ttypjqm7XJevI4B
         pl9unmE9koorn0+g4FHBPpV0UoCKQi4wIAQeXw5AbWDCNLw1LZ2xj9RP5qVff+4gRpGA
         9YC4PxVs6HRiyAyk41CiLZD/D/D2j2bXpBxQgRpdR10kLfM8Z1dY3f1wblmuWEHtUbjJ
         NzXQ==
X-Gm-Message-State: AOAM530+PCEc+hYShIX1h10WUt2YB4mt7d5a+M34ZdSH/6hqncreoUYm
        x6bW33uozWQKe3pgoJoKgXgc7g==
X-Google-Smtp-Source: ABdhPJxc67ZwkwMeb3rMevjY1tOcyCMODfRBsnj+wvzInM8/hFFQTju7+UhIiGnXaYQeha86SFNgYw==
X-Received: by 2002:a05:6a00:14c4:b0:412:444e:f600 with SMTP id w4-20020a056a0014c400b00412444ef600mr2488264pfu.83.1631589651751;
        Mon, 13 Sep 2021 20:20:51 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id t68sm9714498pgc.59.2021.09.13.20.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 20:20:51 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 1/2] dt-bindings: clk: qcom: Add QCM2290 Global Clock Controller bindings
Date:   Tue, 14 Sep 2021 11:20:40 +0800
Message-Id: <20210914032041.6547-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210914032041.6547-1-shawn.guo@linaro.org>
References: <20210914032041.6547-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It adds device tree bindings for QCM2290 Global Clock Controller.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 .../bindings/clock/qcom,gcc-qcm2290.yaml      | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml
new file mode 100644
index 000000000000..f8130d8ce259
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-qcm2290.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding for QCM2290
+
+maintainers:
+  - Shawn Guo <shawn.guo@linaro.org>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on QCM2290.
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-qcm2290.h
+
+properties:
+  compatible:
+    const: qcom,gcc-qcm2290
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+      - const: sleep_clk
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
+  - clocks
+  - clock-names
+  - reg
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    clock-controller@1400000 {
+        compatible = "qcom,gcc-qcm2290";
+        reg = <0x01400000 0x1f0000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+        clock-names = "bi_tcxo", "sleep_clk";
+        clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&sleep_clk>;
+    };
+...
-- 
2.17.1

