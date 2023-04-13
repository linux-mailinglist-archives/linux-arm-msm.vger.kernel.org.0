Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 172076E0CA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Apr 2023 13:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbjDMLf0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Apr 2023 07:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230362AbjDMLfZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Apr 2023 07:35:25 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1934C9755
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 04:35:04 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id s2so10624438wra.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 04:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681385688; x=1683977688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qG4MaD6PlBbgPXf6IQ9L3XAJpZUtis1Wm7EfAH9zk/M=;
        b=bRCkwJHbfB3E7f4VjjXSKQIJnl5n3T6+OgM0r5gpIdxymJOLdsXyFcHm0o0HWHKsFE
         Nkjqk1TGPfEjF20mS7NfootHpna5PIS/vF3tF2ZZ7oi7QvRUa/ehByiGK71OxKZmSsDj
         ngZzIE21rCt9v07tYSmjhZng+lFJ+sWTA0A/BZJ2DebkgDbmlqpnCy8fF52o1FViy2ol
         BTZhYmPJqpHpxaO7GZVVpK6oaSNeQ7jiJwopFYU9MisR58EZCbr/kgwVjSMnDI86UvDh
         nEp4rn+jYMtp+l8wAS03eP4xdSPkrwo0FdFUycrfrWCS8broh7b9T7E44hRQ7B70J1mm
         eS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681385688; x=1683977688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qG4MaD6PlBbgPXf6IQ9L3XAJpZUtis1Wm7EfAH9zk/M=;
        b=X+fWxNroWOKxs0zCbUEob3xF9kVagdurxYn7BCQ+zBQ+XuA0K+bnatcE9IrOy036pQ
         lUFSiBTqbiiZkfjLo5umYcSXQqQcKvKgfWqNkSD/JAnAAb9oiVwoH4bX9Tn/izw4l+Dg
         M3SJP3slwfkILvnuQOf6iq5CJrRQH/WXITaquapxByAKCeLRlE9iDK/vrNWWsBvxPs04
         znh9+9qguXhzmhNSDxRfjN2RXtgSS383N3T8WJiVgodnn33Qm/yUFAenE3zc0w4/6zc7
         vTe7ZbpBGYjNqPCRRmjMmYM+D7S8O2GvxOBqv9WPuNreW9I9Eu5UE4gK6/otiZxlaycD
         ZWYw==
X-Gm-Message-State: AAQBX9c2G8UhUWqZBxZRsQ2JxiUqNPmv2MbYrW9GWvDWzX+62PxlIEWr
        GKBwjk5n8MfRSPLlMQlFD6GpgQ==
X-Google-Smtp-Source: AKy350YKb2FcegEmPkRqRWfNiS651SzLf5SbZlRb6NI/9NlOLU7FPNnQpQAQOqZRGyBDp2cOlo5EeQ==
X-Received: by 2002:adf:d843:0:b0:2f3:ebff:396c with SMTP id k3-20020adfd843000000b002f3ebff396cmr1214853wrl.34.1681385687839;
        Thu, 13 Apr 2023 04:34:47 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id e16-20020a5d4e90000000b002f2782978d8sm1108877wru.20.2023.04.13.04.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 04:34:47 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, bryan.odonoghue@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com, Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v5 05/14] dt-bindings: usb: Add Qualcomm PMIC Type-C YAML schema
Date:   Thu, 13 Apr 2023 12:34:29 +0100
Message-Id: <20230413113438.1577658-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a YAML binding for the Type-C silicon interface inside Qualcomm's
pm8150b hardware block.

The Type-C driver operates with a pdphy driver inside of a high level
single TCPM device.

Based on original work by Wesley.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/usb/qcom,pmic-typec.yaml         | 169 ++++++++++++++++++
 1 file changed, 169 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
new file mode 100644
index 0000000000000..6d0f5d00305cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -0,0 +1,169 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/qcom,pmic-typec.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm PMIC based USB Type-C block
+
+maintainers:
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+description: |
+  Qualcomm PMIC Type-C block
+
+properties:
+  compatible:
+    enum:
+      - qcom,pm8150b-typec
+
+  connector:
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+
+  reg:
+    description: Type-C port and pdphy SPMI register base offsets
+    minItems: 2
+    maxItems: 2
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
+      - description: Sig TX - transmitted reset signal
+      - description: Sig RX - received reset signal
+      - description: TX completion
+      - description: RX completion
+      - description: TX fail
+      - description: TX discgard
+      - description: RX discgard
+      - description: Fast Role Swap event
+
+  interrupt-names:
+    items:
+      - const: or-rid-detect-change
+      - const: vpd-detect
+      - const: cc-state-change
+      - const: vconn-oc
+      - const: vbus-change
+      - const: attach-detach
+      - const: legacy-cable-detect
+      - const: try-snk-src-detect
+      - const: sig-tx
+      - const: sig-rx
+      - const: msg-tx
+      - const: msg-rx
+      - const: msg-tx-failed
+      - const: msg-tx-discarded
+      - const: msg-rx-discarded
+      - const: fr-swap
+
+  vdd-vbus-supply:
+    description: VBUS power supply.
+
+  vdd-pdphy-supply:
+    description: VDD regulator supply to the PDPHY.
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Contains a port which produces data-role switching messages.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - vdd-vbus-supply
+  - vdd-pdphy-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/usb/pd.h>
+
+    pm8150b {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pm8150b_typec: typec@1500 {
+            compatible = "qcom,pm8150b-typec";
+            reg = <0x1500>,
+                  <0x1700>;
+
+            interrupts = <0x2 0x15 0x00 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x15 0x01 IRQ_TYPE_EDGE_BOTH>,
+                         <0x2 0x15 0x02 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x15 0x03 IRQ_TYPE_EDGE_BOTH>,
+                         <0x2 0x15 0x04 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x15 0x05 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x15 0x06 IRQ_TYPE_EDGE_BOTH>,
+                         <0x2 0x15 0x07 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 0x00 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 0x01 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 0x02 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 0x03 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 0x04 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 0x05 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 0x06 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 0x07 IRQ_TYPE_EDGE_RISING>;
+
+            interrupt-names = "or-rid-detect-change",
+                              "vpd-detect",
+                              "cc-state-change",
+                              "vconn-oc",
+                              "vbus-change",
+                              "attach-detach",
+                              "legacy-cable-detect",
+                              "try-snk-src-detect",
+                              "sig-tx",
+                              "sig-rx",
+                              "msg-tx",
+                              "msg-rx",
+                              "msg-tx-failed",
+                              "msg-tx-discarded",
+                              "msg-rx-discarded",
+                              "fr-swap";
+
+            vdd-vbus-supply = <&pm8150b_vbus>;
+            vdd-pdphy-supply = <&vreg_l2a_3p1>;
+            connector {
+                compatible = "usb-c-connector";
+
+                power-role = "source";
+                data-role = "dual";
+                self-powered;
+
+                source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_DUAL_ROLE |
+                               PDO_FIXED_USB_COMM | PDO_FIXED_DATA_SWAP)>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        pm8150b_typec_mux_out: endpoint {
+                            remote-endpoint = <&qmpphy_typec_mux_in>;
+                        };
+                    };
+                    port@1 {
+                        reg = <1>;
+                        pm8150b_typec_role_switch_out: endpoint {
+                            remote-endpoint = <&dwc3_role_switch_in>;
+                        };
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.39.2

