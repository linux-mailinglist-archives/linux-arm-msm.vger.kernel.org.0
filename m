Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD46331BEAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Feb 2021 17:19:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232005AbhBOQP4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Feb 2021 11:15:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232690AbhBOQCm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Feb 2021 11:02:42 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D3F6C061224
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Feb 2021 08:01:42 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id l12so9560258wry.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Feb 2021 08:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JxRZlErNXPjnpC+yN0itO0sslWLEquDG/p8f0PT1wRA=;
        b=sLI2bR231U91KLt3ANmrRMnWDsYMaa4YwuNRarrmXaGrn7f/zb4lh5/iFepp5xzWk7
         84Ej47LtyFUOI2SdQkXcd4Qb7HsDhNZ8NeSfq8zMfnJvM8uUqwXFbPHmY5wG6s++0Yu1
         AgkcJV7xRy9eTOHcESkGhqmD0IXES7EiO0kg/5k9rMlhAtRejMbeWs3021r6xCrIqfl4
         ZYIoOI7n8dlNrvIMMOyqCVBEQwffJOFvcako3Y8pSFQxKX5gzkKGb5YDRQV8NYcjPWXB
         VeshivIcEHf5JVUznrGbROwx+TZUoujHPsk2rniwOtBfa3Q1+arI8UQlzytPZWSXMTJ1
         CjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JxRZlErNXPjnpC+yN0itO0sslWLEquDG/p8f0PT1wRA=;
        b=DUso4v0lO0lkXC1KZ+VI4wSAgCn9FbwV4BgWFskc+bQXlNI66nHdvT6fJe+nLXSwYI
         I+S9LYT2yQLp0TV101quFC0gItpOv82Ty2uLGKBXA12wbS8o6zBzedpC1RxG1cJatf3K
         mX6eGyvsSc1oaVePuHfLbSJLL1Gpmu74HseZxo2AeuCPAZfk72l8I+Z5UOnIHUM8gdXN
         QCs9Xy+SFXsZm9nEIowKviNqud0Aj8T98g0ozW/Yv5XqZasYF4VkajNfTGI4pwKtKJun
         UD4aB/CsYl9t16FuSKdRfB+lpWSP0ddyZvrJ+rgtr+hs8E90mUm+VyhALO74mgnJDddf
         cgsA==
X-Gm-Message-State: AOAM53108FGSl/J7Y9UlSWSKFZGLAZ5kKdcoKjpkSLGIanBwUUqqaTDL
        fhWByIA1Zx19LOJquDJI/L2qIAa+IDHj4w==
X-Google-Smtp-Source: ABdhPJwmv2o468vUPS0CZWoSUulA0lCoZoLy1GOuleln2dj7CJ1XkjTZ+N+IZLV4lZij9fSPpHl5Wg==
X-Received: by 2002:adf:80c3:: with SMTP id 61mr19256425wrl.100.1613404901155;
        Mon, 15 Feb 2021 08:01:41 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 101sm14698659wrk.4.2021.02.15.08.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 08:01:40 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stanimir.varbanov@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH v2 2/2] dt-bindings: media: venus: Add sm8250 dt schema
Date:   Mon, 15 Feb 2021 16:02:54 +0000
Message-Id: <20210215160254.1572615-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215160254.1572615-1-bryan.odonoghue@linaro.org>
References: <20210215160254.1572615-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a schema description for the venus video encoder/decoder on the sm8250.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,sm8250-venus.yaml     | 167 ++++++++++++++++++
 1 file changed, 167 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
new file mode 100644
index 000000000000..7b81bd7f2399
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
@@ -0,0 +1,167 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/qcom,sm8250-venus.yaml#"
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
+    const: qcom,sm8250-venus
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    minItems: 2
+    maxItems: 3
+
+  power-domain-names:
+    minItems: 2
+    maxItems: 3
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mx
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: iface
+      - const: core
+      - const: vcodec0_core
+
+  iommus:
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: bus
+      - const: core
+
+  video-decoder:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-decoder
+
+    required:
+      - compatible
+
+    additionalProperties: false
+
+  video-encoder:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-encoder
+
+    required:
+      - compatible
+
+    additionalProperties: false
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
+        maxItems: 1
+
+    required:
+      - iommus
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - power-domain-names
+  - clocks
+  - clock-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - memory-region
+  - resets
+  - reset-names
+  - video-decoder
+  - video-encoder
+
+additionalProperties: false
+
+examples:
+  - |
+        #include <dt-bindings/interrupt-controller/arm-gic.h>
+        #include <dt-bindings/clock/qcom,videocc-sm8250.h>
+        #include <dt-bindings/interconnect/qcom,sm8250.h>
+        #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+        #include <dt-bindings/power/qcom-rpmpd.h>
+
+        venus: video-codec@aa00000 {
+            compatible = "qcom,sm8250-venus";
+            reg = <0x0aa00000 0xff000>;
+            interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+            power-domains = <&videocc MVS0C_GDSC>,
+                            <&videocc MVS0_GDSC>,
+                            <&rpmhpd SM8250_MX>;
+            power-domain-names = "venus", "vcodec0", "mx";
+
+            clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+                     <&videocc VIDEO_CC_MVS0C_CLK>,
+                     <&videocc VIDEO_CC_MVS0_CLK>;
+            clock-names = "iface", "core", "vcodec0_core";
+
+            interconnects = <&gem_noc MASTER_AMPSS_M0 &config_noc SLAVE_VENUS_CFG>,
+                            <&mmss_noc MASTER_VIDEO_P0 &mc_virt SLAVE_EBI_CH0>;
+            interconnect-names = "cpu-cfg", "video-mem";
+
+            iommus = <&apps_smmu 0x2100 0x0400>;
+            memory-region = <&video_mem>;
+
+            resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+                     <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
+            reset-names = "bus", "core";
+
+            video-decoder {
+                compatible = "venus-decoder";
+            };
+
+            video-encoder {
+                compatible = "venus-encoder";
+            };
+        };
-- 
2.29.2

