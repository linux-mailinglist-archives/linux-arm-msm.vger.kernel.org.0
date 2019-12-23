Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED41129536
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2019 12:34:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbfLWLe1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Dec 2019 06:34:27 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46383 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727009AbfLWLdz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Dec 2019 06:33:55 -0500
Received: by mail-lj1-f194.google.com with SMTP id m26so14980128ljc.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2019 03:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=H9oZQbNnPKg04bTmHZzlCtfyOoPK++pS7U+3W7/mSLw=;
        b=pxbvWXpEMT6dOlVLN8Q0xT9fFnWN7z/CHLpSnCDRV1VI4aucc64DFyiAkqV935Z5ci
         1iZNw8sDc0VcubAeXhjWVIYglMTzbpOHju7v55qS30jnTKMvz3iIC/jt2NoI2C3oiMbB
         ABNeuncbRKPokgAW1p6Nh5dyY0glsGr2oBpI7SNXw6r1wTlNNPZbmXYzMN/dJArLiF1R
         CtG8OaK8KX9pDhQ3MGXJlHzIDroQulkbfzSOM81YhBtHov0dl/MdTYYCt0+BjD9+kogo
         r0hf2uhnuFoS6TZ0LnqmmlmSj1f+qq/QixvdEmqB8o/oGMDV+/ZqfNFjat6jwWQexb3v
         iBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=H9oZQbNnPKg04bTmHZzlCtfyOoPK++pS7U+3W7/mSLw=;
        b=E09DfClwHGDt5RwzqqZjWWmDaWd3LKYezZua3nZ7PNOW9hEkj2Suov6/8O2ru821UX
         OWH8t7Wy42o3Vtn0slh8bGhmzTo+7UI1raw5ElL3BLoFTkGU4IMGPjW72TnTjlKXj+29
         QCNZoXt7Rfj0YlvIdDXxYjn1jtKZbP7rGllJfh5hcNrlduCRUsiTVoD6JkvsjbLhDXib
         +LaoEuFHCKR5mX/2kVa+OI9sFr6kBjEm/FQWuob42DvZo+e4U7BjR2mnR1Jr/THIrxxN
         L4h5qKi0/ivhh9zMgw6yo0dmJk1qTel+FL9v0Cy2etWCmKl8tDMYTsUt380EQFDwIpAC
         cEdw==
X-Gm-Message-State: APjAAAVMQKY4HI+n2xEuTE7in0wb37mVAbXR211seSN7UweHz2AUW/V8
        8LdYTIuydF8AQ90PVWlcJOcucalNz04=
X-Google-Smtp-Source: APXvYqwYbDeqqVO9C1lE2+oFQ4SHpBeU8V5WMyAeE0MG2YVTxfqkVt/eyi8rsmUdTIL6/p1bw7h26w==
X-Received: by 2002:a2e:8e22:: with SMTP id r2mr10480377ljk.51.1577100832546;
        Mon, 23 Dec 2019 03:33:52 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id g15sm8381500ljk.8.2019.12.23.03.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2019 03:33:52 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 07/12] dt-bindings: media: venus: Convert msm8996 to DT schema
Date:   Mon, 23 Dec 2019 13:33:06 +0200
Message-Id: <20191223113311.20602-8-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191223113311.20602-1-stanimir.varbanov@linaro.org>
References: <20191223113311.20602-1-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert qcom,msm8996-venus Venus binding to DT schema.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../bindings/media/qcom,msm8996-venus.yaml    | 153 ++++++++++++++++++
 1 file changed, 153 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
new file mode 100644
index 000000000000..d1431dfa0de8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
@@ -0,0 +1,153 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/qcom,msm8996-venus.yaml#"
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
+    const: "qcom,msm8996-venus"
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+      - const: mbus
+
+  iommus:
+    minItems: 1
+    maxItems: 20
+
+  memory-region:
+    maxItems: 1
+
+  video-decoder:
+    type: object
+
+    properties:
+      compatible:
+        const: "venus-decoder"
+
+      clocks:
+        maxItems: 1
+
+      clock-names:
+        maxItems: 1
+        items:
+          - const: core
+
+      power-domains:
+        maxItems: 1
+
+    required:
+      - compatible
+      - clocks
+      - clock-names
+      - power-domains
+
+    additionalProperties: false
+
+  video-encoder:
+    type: object
+
+    properties:
+      compatible:
+        const: "venus-encoder"
+
+      clocks:
+        maxItems: 1
+
+      clock-names:
+        maxItems: 1
+        items:
+          - const: core
+
+      power-domains:
+        maxItems: 1
+
+    required:
+      - compatible
+      - clocks
+      - clock-names
+      - power-domains
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
+        minItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - clocks
+  - clock-names
+  - iommus
+  - memory-region
+  - video-decoder
+  - video-encoder
+
+examples:
+  - |
+        #include <dt-bindings/interrupt-controller/arm-gic.h>
+        #include <dt-bindings/clock/qcom,mmcc-msm8996.h>
+
+        video-codec@c00000 {
+                compatible = "qcom,msm8996-venus";
+                reg = <0x00c00000 0xff000>;
+                interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
+                clocks = <&mmcc VIDEO_CORE_CLK>,
+                         <&mmcc VIDEO_AHB_CLK>,
+                         <&mmcc VIDEO_AXI_CLK>,
+                         <&mmcc VIDEO_MAXI_CLK>;
+                clock-names = "core", "iface", "bus", "mbus";
+                power-domains = <&mmcc VENUS_GDSC>;
+                iommus = <&iommu 0>;
+                memory-region = <&venus_mem>;
+
+                video-decoder {
+                        compatible = "venus-decoder";
+                        clocks = <&mmcc VIDEO_SUBCORE0_CLK>;
+                        clock-names = "core";
+                        power-domains = <&mmcc VENUS_CORE0_GDSC>;
+                };
+
+                video-encoder {
+                        compatible = "venus-encoder";
+                        clocks = <&mmcc VIDEO_SUBCORE1_CLK>;
+                        clock-names = "core";
+                        power-domains = <&mmcc VENUS_CORE1_GDSC>;
+                };
+        };
-- 
2.17.1

