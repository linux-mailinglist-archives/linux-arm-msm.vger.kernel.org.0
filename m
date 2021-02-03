Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8404230D8E5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 12:40:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234100AbhBCLjh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 06:39:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234222AbhBCLjf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 06:39:35 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CEC6C061788
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Feb 2021 03:38:55 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id u14so4870551wmq.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Feb 2021 03:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ru0gJ3FIhM/1e3zHEBGMj6OD0UrIuxrB8PYZqtSbE9E=;
        b=deGoSSBpMDV0KT+nbh0cHrqgX6TCjwZggtmcxgivZviABEGOdtSSlYMg78cRYd9Svv
         yPXBXn9jEOHkAl0nPdf0+I5V0XAHrzreDBjk5mY5MWmOfOmJ5AgImXqa9y05Rnq9nmu2
         3mtiyfn5TX2TMrfu1wufpQBSxQW4/1QWfJKneMkf7XfdaNsBs0+PfL+q188URR9DsO/e
         RXwbQljCSX3X1yGyJ9SJ+gfpPNIDSHCQjLsnb1lUbJj6g+FbMpKQBP0tEd3fJojJSybT
         gsp4HYlFjI0pwYPlEbOGcNL7IL/3YKz8l2dWGuHQfpEYFwzz53fJO/CD0cWxrL50C8U7
         rCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ru0gJ3FIhM/1e3zHEBGMj6OD0UrIuxrB8PYZqtSbE9E=;
        b=Td43g9nz8wmvbdAh3hNYkby6vshf5Q3mAgNC3Ef+VFaoJX6rMvDwpOCCBStZ5aV905
         FEt5DbW/LPewV9obTeiitO6scuIDzHqZYOVNdsFVSrTrM5e4W78/chg0MYYEifcDbpdX
         z4qx2Ew7W42sszT6yRj0cApvBDqEwlp39fJqfJSBlXL3kl1QQTzBQ8kvdyBOJsnvKaLS
         JKeJHSYY9BFCY0u08W1d2fHr/7NkVAwbOskf4dnMdE7u/LzKQtMpAIjVvcFTSgOuHW0W
         LL8s7F4JftbznhFJST/yWp2kMjdRSnEIRENjq6RaViSSJ++r3eRYIrpR0swKJyyYTYra
         WNXQ==
X-Gm-Message-State: AOAM531Ut87YISU039/YEf+nSiDXb/Du0wiGijDxjJyq1tdboCY6ltrF
        +9S/PtxfeglIvZhK1ZkP3ktc/5JQ25G2Iw==
X-Google-Smtp-Source: ABdhPJyh4UVryztY67JGWI6UdB0YxMLvrS7w5cxFk8oVu3niBu59MXPjkI1BTyCkyB1rVAtyux0SuA==
X-Received: by 2002:a05:600c:1986:: with SMTP id t6mr2375191wmq.93.1612352333642;
        Wed, 03 Feb 2021 03:38:53 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r15sm3332540wrj.61.2021.02.03.03.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 03:38:53 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, stanimir.varbanov@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     dikshita@qti.qualcomm.com, vgarodia@qti.qualcomm.com,
        bryan.odonoghue@linaro.org, jonathan@marek.ca
Subject: [PATCH 1/1] dt-bindings: media: venus: Add sm8250 dt schema
Date:   Wed,  3 Feb 2021 11:39:14 +0000
Message-Id: <20210203113914.1072380-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210203113914.1072380-1-bryan.odonoghue@linaro.org>
References: <20210203113914.1072380-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a schema description for the venus video encoder/decoder on the sm8250.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,sm8250-venus.yaml     | 153 ++++++++++++++++++
 1 file changed, 153 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
new file mode 100644
index 000000000000..1d4b1ab63297
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
@@ -0,0 +1,153 @@
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
+      - const: video-mem
+      - const: cpu-cfg
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
+  - iommus
+  - memory-region
+  - video-decoder
+  - video-encoder
+
+additionalProperties: false
+
+examples:
+  - |
+        #include <dt-bindings/interrupt-controller/arm-gic.h>
+        #include <dt-bindings/clock/qcom,videocc-sm8250.h>
+
+        venus: video-codec@aa00000 {
+            compatible = "qcom,sm8250-venus";
+            reg = <0 0x0aa00000 0 0xff000>;
+            interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+            power-domains = <&videocc MVS0C_GDSC>,
+                            <&videocc MVS0_GDSC>,
+                            <&rpmhpd SM8250_MX>;
+            power-domain-names = "venus", "vcodec0", "mx";
+            operating-points-v2 = <&venus_opp_table>;
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

