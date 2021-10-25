Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E92BF4399AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 17:07:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233809AbhJYPJc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 11:09:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233786AbhJYPJb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 11:09:31 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55ED3C061746
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 08:07:09 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id u18so10035945wrg.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 08:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EIQZtiL4sO2h//qQWQnW0bsrqU7jClGfSi+dVnwdw8M=;
        b=AZ64cybHrDfTvgiIoQAOwVXQ3E/tj3ncGTT7RY3HLf0NnoPMxfxg7mNXlZtIRaVmhf
         3sEB5ddNLv0qugAb2RwcSK3PyooDDbk0+ci7fToVjkmcBd+Btv7LeRb2nfZMdrTQ4euZ
         Y0N4lNZuirJiHfxeF+5tCD8IYVRqG/9YYPngne3gnP6mOB9yJ0KRSncee9DmxlUUHeJH
         gqpC7qSeTobqJVCB8QZ38Pk20dfTgWpsVc3DwWsQ+fSkyAtAUBaDb1FV+lFSH2XteqnN
         PwbjgUthsQhGWnvaLlxVUb+CwwGRL321dNrM4rmvzMtsH7NDUtE+LefTm8WrYh15moib
         k9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EIQZtiL4sO2h//qQWQnW0bsrqU7jClGfSi+dVnwdw8M=;
        b=XHBRs6R8yNSYFZE3jkSNwe6z6fvztBKuuIb10jqXztuIFh76iOAkNJoM547+Nxakid
         WtQj/R8zPjqUT/kB72Jv6sT0HE55WRpC26UZSU5LXltY1s0+rHP2K2vrmq5Gui2VvNl0
         pgrIxBiAEKIncv2XH9fcC7A/ZcvKXhW8jKmGJsQ6Uchzu49u7yywTdxhe8bIKRDbBBcd
         WeR/1khU0FXUqmRXzCEuoru4+TIX3xDK+dyfZoC3SG6DONijXZg86zsrD6QVRbuCUrJf
         CnEg5OrOi4Sw8HqTu1aNpB8651MP6yku1o9QHAxoUpu6hg/MqqzB2MVVxbSjdTeShAR2
         drHw==
X-Gm-Message-State: AOAM531Zfdzn/aRilyLbksNipNvjc75fzw8/2qvPDQwiUXc7FWjDm+tw
        pui3ggZRP37Qqva+NDDhrAlDMA==
X-Google-Smtp-Source: ABdhPJwNYPbogHyEGLeXXzn9XVrQZIHIXwtAmpsnCeI+SvyOlGNcFC8UrSvnokQb28T//10CUdiMfQ==
X-Received: by 2002:a05:6000:15c6:: with SMTP id y6mr24077552wry.210.1635174427971;
        Mon, 25 Oct 2021 08:07:07 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f20sm19173554wmq.38.2021.10.25.08.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 08:07:07 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     wcheng@codeaurora.org, bryan.odonoghue@linaro.org
Subject: [PATCH 2/6] dt-bindings: usb: Add Qualcomm PMIC type C controller YAML schema
Date:   Mon, 25 Oct 2021 16:09:02 +0100
Message-Id: <20211025150906.176686-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211025150906.176686-1-bryan.odonoghue@linaro.org>
References: <20211025150906.176686-1-bryan.odonoghue@linaro.org>
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

