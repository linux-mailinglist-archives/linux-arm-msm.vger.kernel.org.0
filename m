Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8E743E252
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 15:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbhJ1Nek (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 09:34:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbhJ1Nej (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 09:34:39 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BB31C061570
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 06:32:12 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id v17so10200749wrv.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 06:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EIQZtiL4sO2h//qQWQnW0bsrqU7jClGfSi+dVnwdw8M=;
        b=l3Jd2mYMwGQcDVXTII3GPAAIB5QxBoHv3kCzIgU6rIhd8ACjQmOgdOvhXpx9SO+rLy
         g8J/+UwCOHp+V351Hfezv57/EN8QFpgAYL9TlUY8WLC5s//ld2nwxLPwAQgp633fz6MG
         oHz2EGehTrUyMx7SNOyeTJMtvpaRw3faeUYVZbgMXuCeLqzhudrlCvP8XTp8s8dMJhQu
         RXPo49FkkB7ezRxoZhfnpXDg5V4oG1uFSduEACb+/AwwcSJfPbX/DaQs2RleWHhQFkry
         kfdTlJ9OgjEVJ8K5nrzQleHLXL100Sj0K2RabfXJlte79DJqXPRD16gunmuZ3LqLYEvy
         YkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EIQZtiL4sO2h//qQWQnW0bsrqU7jClGfSi+dVnwdw8M=;
        b=SafcqV/BwiprVPWsK88MJmvH0XVc2nErVdF6BVkJL42tD1PaEIf/cpOw2RosrXVkw+
         8RNcTVEiy9tnWx4FsaZc+bgo0G4CnUGkHKfqTXcsZvvbthsBgam/JGBbTSRpkxKYdEzo
         BOpuWiMk+dIEnt3UmCPqfBn8p7YOOEZxTdg7GG8iWkICU8CyYImsI/S3MaH4NwuEbLPb
         Z8DfxNLtg8m5qaZkdxOCO19Tpcw3HDtryXy4haUTBPtiDbJrrF08Eh8YghKIOOuZrXyw
         2BlQ+r+KMx/XFXU8LpL9rLYrbvCaAaltxTJ33TPW5sHb38zM8sWUHYbzTUoA00ILcaF6
         POlg==
X-Gm-Message-State: AOAM5307vMmKpGlNEwSzP1q+VXn32RgB+WHzFuijkCw9yg9u3r/y4Ta5
        Azj0A+3jMFT6IivSP9muAF7lRA==
X-Google-Smtp-Source: ABdhPJzbOvvdoxnTkE4cAuLJ2DwMPMP7drJPJOMowTozO/GCeVQMNOS4A0SND0efOGlYIXRDVEbTiw==
X-Received: by 2002:a5d:69ce:: with SMTP id s14mr4603623wrw.25.1635427930787;
        Thu, 28 Oct 2021 06:32:10 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y23sm2774845wmi.43.2021.10.28.06.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 06:32:10 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        rdunlap@infradead.org, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     wcheng@codeaurora.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 2/7] dt-bindings: usb: Add Qualcomm PMIC type C controller YAML schema
Date:   Thu, 28 Oct 2021 14:33:59 +0100
Message-Id: <20211028133404.826012-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211028133404.826012-1-bryan.odonoghue@linaro.org>
References: <20211028133404.826012-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a YAML binding for the type-c silicon interface inside Qualcomm's
pm8150b hardware block.

The type-c driver operates with a pdphy driver inside of a high level
single TCPM device.

Based on original work by Wesley.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/usb/qcom,pmic-typec.yaml         | 116 ++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
new file mode 100644
index 0000000000000..72602daf910bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/qcom,pmic-typec.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm PMIC based USB type C Detection Driver
+
+maintainers:
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+description: |
+  Qualcomm PMIC Type C Detect
+
+properties:
+  compatible:
+    enum:
+      - qcom,pm8150b-usb-typec
+
+  reg:
+    maxItems: 1
+    description: Type C base address
+
+  interrupts:
+    items:
+      - description: Bitmask of CC attach, VBUS error, tCCDebounce done and more
+      - description: VCONN Powered Detection
+      - description: CC state change
+      - description: VCONN over-current condition
+      - description: VBUS state change
+      - description: Attach Deteach notification
+      - description: Legacy cable detect
+      - description: Try.Src Try.Snk state change
+
+  interrupt-names:
+    items:
+      - const: pmic-typec-or-rid-detect-change
+      - const: pmic-typec-vpd-detect
+      - const: pmic-typec-cc-state-change
+      - const: pmic-typec-vconn-oc
+      - const: pmic-typec-vbus-change
+      - const: pmic-typec-attach-detach
+      - const: pmic-typec-legacy-cable-detect
+      - const: pmic-typec-try-snk-src-detect
+
+  ports:
+    description: Remote endpoint connections
+    $ref: /connector/usb-connector.yaml#/properties/ports
+
+    properties:
+      port@0:
+        description: Remote endpoints for the TCPM driver
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/usb/typec/tcpm/qcom,pmic-usb-typec.h>
+    pm8150b {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pm8150b_typec: typec@1500 {
+            compatible = "qcom,pm8150b-typec";
+            reg = <0x1500>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            interrupts = <0x2 0x15 PMIC_TYPEC_OR_RID_IRQ
+                          IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x15 PMIC_TYPEC_VPD_IRQ
+                          IRQ_TYPE_EDGE_BOTH>,
+                         <0x2 0x15 PMIC_TYPEC_CC_STATE_IRQ
+                          IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x15 PMIC_TYPEC_VCONN_OC_IRQ
+                          IRQ_TYPE_EDGE_BOTH>,
+                         <0x2 0x15 PMIC_TYPEC_VBUS_IRQ
+                          IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x15 PMIC_TYPEC_ATTACH_DETACH_IRQ
+                          IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x15 PMIC_TYPEC_LEGACY_CABLE_IRQ
+                          IRQ_TYPE_EDGE_BOTH>,
+                         <0x2 0x15 PMIC_TYPEC_TRY_SNK_SRC_IRQ
+                          IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "pmic-typec-or-rid-detect-change",
+                              "pmic-typec-vpd-detect",
+                              "pmic-typec-cc-state-change",
+                              "pmic-typec-vconn-oc",
+                              "pmic-typec-vbus-change",
+                              "pmic-typec-attach-detach",
+                              "pmic-typec-legacy-cable-detect",
+                              "pmic-typec-try-snk-src-detect";
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    pmic_typec: endpoint {
+                        remote-endpoint = <&pmic_tcpm_typec>;
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.33.0

