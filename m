Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53BE9124843
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 14:25:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727329AbfLRNYg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Dec 2019 08:24:36 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37339 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727346AbfLRNYQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Dec 2019 08:24:16 -0500
Received: by mail-lj1-f196.google.com with SMTP id u17so2125791lja.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2019 05:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CITEx26ya518MBT0p0F7PP8DiduXDPXSSgjqESe9/eA=;
        b=HqqpQIYz08yRuwZxJa+FF3HZ+sKTzhV6q+LENhfdzGZPn+Tov0WvsgDJkKRkFGV49N
         kQWSqMx9DM5GnfkKAntAfBgAeTUICk+BslIpWw9byKAr3Kj9JyV0SLdHuoJqxUEozMu5
         FUgVYxCGGL1C0Wtoa8p6kIpeCZP3jCxu3ptDsrS5ObIln+GU4yiyfQaYJvLmpZ7KdKVe
         bN7OQjgFf2EM3NvejCPXNa6bkMXPQKd+uXNFuApsRkaA7DmDzywZCuWpJTQGjcI7ZYzY
         OCIyyN0LXc5efjPaFqsuTdEx+rz2HDIuWrtoTnScvjZF/nkT04ADMmYwgoupTV3oEmMO
         4j4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CITEx26ya518MBT0p0F7PP8DiduXDPXSSgjqESe9/eA=;
        b=UcHbGFDr0qzIlHvDZVI0PX5za+cEaYEdQPw4WfKRywi3loFHL7d1GxSMwoUzpzg+mN
         SRE7GhgSxSnyfPIBOwopJmRp0MFYZtVtx07htf98SHQKzVcwm+TL0gdBuaGBf3kPdzI2
         DYkqMmdd6NTfG+e4VoN3RuwqGmI8qN3ZZNqivi2ufTf5/GdsvxDItf+Dtl99wE6ru25T
         Z6AJiiF8Y3V9a8OQ8VlqrjTiZvbXyjP/ovxnImZngt/8EUbTpc1e5kf9a3AYo91gFOge
         Xz4Ln2lhb/1Pfw0NjCrJ9/734eWiE6wnPDERAD6J4+F8XUJG2wJ/67ZicgjJkeNSZVjy
         wsxg==
X-Gm-Message-State: APjAAAXe+HHT4F4f6+b6Mj6mXD4KuXSRTanFjk4omK3VcukVTI0R6Aok
        miOOpfm4KCM+9WJCDtbZUscgw9YbFf0=
X-Google-Smtp-Source: APXvYqwlZZFinYNRqZOyePG5PluNOBy1O5Mvob+mLxlQUJ18lWEjnitzXVr6sN2m1B/AJIAmUttUWA==
X-Received: by 2002:a2e:9886:: with SMTP id b6mr1754928ljj.47.1576675453349;
        Wed, 18 Dec 2019 05:24:13 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id z7sm1440667lfa.81.2019.12.18.05.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 05:24:12 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 09/12] dt-bindings: media: venus: Add sdm845v2 DT schema
Date:   Wed, 18 Dec 2019 15:22:48 +0200
Message-Id: <20191218132251.24161-10-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218132251.24161-1-stanimir.varbanov@linaro.org>
References: <20191218132251.24161-1-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add new qcom,sdm845-venus-v2 DT binding schema.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../bindings/media/qcom,venus-sdm845-v2.yaml  | 137 ++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,venus-sdm845-v2.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,venus-sdm845-v2.yaml b/Documentation/devicetree/bindings/media/qcom,venus-sdm845-v2.yaml
new file mode 100644
index 000000000000..920cb05d17ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,venus-sdm845-v2.yaml
@@ -0,0 +1,137 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/qcom,venus-sdm845-v2.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Venus video encode and decode accelerators
+
+maintainers:
+  - Stanimir Varbanov <stanimir.varbanov@linaro.org>
+
+description: |
+  The Venus IP is a video encode and decode accelerator present
+  on Qualcomm platforms
+
+properties:
+  compatible:
+    enum:
+      - qcom,sdm845-venus-v2
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 3
+
+  power-domain-names:
+    maxItems: 3
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: vcodec1
+
+  clocks:
+    maxItems: 7
+
+  clock-names:
+    maxItems: 7
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+      - const: vcodec0_core
+      - const: vcodec0_bus
+      - const: vcodec1_core
+      - const: vcodec1_bus
+
+  iommus:
+    minItems: 1
+    maxItems: 20
+
+  memory-region:
+    maxItems: 1
+
+  video-core0:
+    type: object
+
+    properties:
+      compatible:
+        const: "venus-decoder"
+
+    required:
+      - compatible
+
+  video-core1:
+    type: object
+
+    properties:
+      compatible:
+        const: "venus-encoder"
+
+    required:
+      - compatible
+
+  video-firmware:
+    type: object
+
+    description: |
+      Firmware subnode is needed when the platform does not
+      have TrustZone.
+
+    properties:
+      iommus:
+        minItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - power-domain-names
+  - clocks
+  - clock-names
+  - iommus
+  - memory-region
+  - video-core0
+  - video-core1
+
+examples:
+  - |
+        #include <dt-bindings/interrupt-controller/arm-gic.h>
+        #include <dt-bindings/clock/qcom,videocc-sdm845.h>
+
+        video-codec@aa00000 {
+                compatible = "qcom,sdm845-venus-v2";
+                reg = <0 0x0aa00000 0 0xff000>;
+                interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+                clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
+                         <&videocc VIDEO_CC_VENUS_AHB_CLK>,
+                         <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
+                         <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
+                         <&videocc VIDEO_CC_VCODEC0_AXI_CLK>,
+                         <&videocc VIDEO_CC_VCODEC1_CORE_CLK>,
+                         <&videocc VIDEO_CC_VCODEC1_AXI_CLK>;
+                clock-names = "core", "iface", "bus",
+                              "vcodec0_core", "vcodec0_bus",
+                              "vcodec1_core", "vcodec1_bus";
+                power-domains = <&videocc VENUS_GDSC>,
+                                <&videocc VCODEC0_GDSC>,
+                                <&videocc VCODEC1_GDSC>;
+                power-domain-names = "venus", "vcodec0", "vcodec1";
+                iommus = <&apps_smmu 0x10a0 0x8>,
+                         <&apps_smmu 0x10b0 0x0>;
+                memory-region = <&venus_mem>;
+
+                video-core0 {
+                        compatible = "venus-decoder";
+                };
+
+                video-core1 {
+                        compatible = "venus-encoder";
+                };
+        };
-- 
2.17.1

