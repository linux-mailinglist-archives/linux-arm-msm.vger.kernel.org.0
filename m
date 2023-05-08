Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15CA46FB28E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 16:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233471AbjEHOXb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 10:23:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233870AbjEHOXa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 10:23:30 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ABBB1BD8
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 07:23:26 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f4000ec71dso30618165e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 07:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683555804; x=1686147804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oIx/YOLzSm+eiNVRyxGbhFkd6n9hgzPbuCkSewwSeo=;
        b=lnCwCq87XPSgFh7byB6nfDVrw1QBlsfxHnqMnikJBWXftT+hsDu801yZh6CvbfQHE2
         dziKG5BEMK+4gEVAOokR7bS26iGYdI6Ykz40wPZ5q2Wukg00XD/eOR6ZKxjWPQ/z7EjC
         COnVWIEt6LnZz5w0pTK86INIrkyCa72kCnAxKJqA1zfOqR1wUY7EZW+PU5hwf9rJJhM8
         WTsGDqIaAiQlcclyiZUp12vtEoc2CfELyJTvzKtvZ2DVB4M0t1GWl85mXqj/GSbMef8D
         0haZTHVnh+/F6rrrgQY/vZ/Iv7wl7LHwoQxKkMc6jjk0LctAgOEvIUghGlAPnyB8+Zle
         A+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683555804; x=1686147804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3oIx/YOLzSm+eiNVRyxGbhFkd6n9hgzPbuCkSewwSeo=;
        b=aSyxytPg9knefZhz4+xbxY4a4f8xvmgdB/3T78NqsxTL3jbdEZBcdd9awYj0+YHBKu
         TpjYD7l1UZIbPsHkTO6QTvrpLij8Fp8NlAZ02pWnGUvX37Sspt3Zx0gNztQ0PxOZSgEl
         O/d3ZDE3hIeAjUpyx4SfDd3rF6ZJPScg1mGH4Ygo8/TDua6jKObOWi+M1syPvh697kNy
         tWqIBQ4V7KQ+2qh8avWpXwu516olhL+iC7kv5mnMEj5CSKtUrEHMBhLIxZAqkEJg+bUV
         gqnTb/nDSM4P8Y/wzbxNhcLz0ZOvGA5zKRWkvLuBqr727vAgVMSGninSUOrLl1/eaL9B
         qOiw==
X-Gm-Message-State: AC+VfDx8JE87RyVNY7/CGxArgB0NsyJOnQVmmX5ekImpa+axXdx9OpS/
        nAUJERt1YKZRMU/7qTTaFxzynA==
X-Google-Smtp-Source: ACHHUZ59fjhFuwsN+1tesyFgb9pAM2X0g9QnwLHnlbs6lSJLD0pc9aElu0uSauVicOZrW+zep5QU+w==
X-Received: by 2002:a05:600c:cf:b0:3f4:29c2:1cd0 with SMTP id u15-20020a05600c00cf00b003f429c21cd0mr46172wmm.25.1683555804559;
        Mon, 08 May 2023 07:23:24 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y25-20020a05600c365900b003f42456c490sm4081544wmq.33.2023.05.08.07.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 07:23:24 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, lujianhua000@gmail.com,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     konrad.dybcio@linaro.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, subbaram@quicinc.com,
        jackp@quicinc.com, robertom@qti.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v7 05/13] dt-bindings: usb: Add Qualcomm PMIC Type-C
Date:   Mon,  8 May 2023 15:23:00 +0100
Message-Id: <20230508142308.1656410-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508142308.1656410-1-bryan.odonoghue@linaro.org>
References: <20230508142308.1656410-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a description for the Type-C silicon interface inside Qualcomm's
PM8150b hardware block.

Based on original work by Wesley.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/usb/qcom,pmic-typec.yaml         | 190 ++++++++++++++++++
 1 file changed, 190 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
new file mode 100644
index 0000000000000..55df3129a0bc7
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -0,0 +1,190 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/qcom,pmic-typec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PMIC based USB Type-C block
+
+maintainers:
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+description:
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
+    maxItems: 2
+
+  interrupts:
+    items:
+      - description: Type-C CC attach notification, VBUS error, tCCDebounce done
+      - description: Type-C VCONN powered
+      - description: Type-C CC state change
+      - description: Type-C VCONN over-current
+      - description: Type-C VBUS state change
+      - description: Type-C Attach/detach notification
+      - description: Type-C Legacy cable detect
+      - description: Type-C Try.Src Try.Snk state change
+      - description: Power Domain Signal TX - HardReset or CableReset signal TX
+      - description: Power Domain Signal RX - HardReset or CableReset signal RX
+      - description: Power Domain TX complete
+      - description: Power Domain RX complete
+      - description: Power Domain TX fail
+      - description: Power Domain TX message discard
+      - description: Power Domain RX message discard
+      - description: Power Domain Fast Role Swap event
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
+    pmic {
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
+
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
+                        pmic_typec_mux_out: endpoint {
+                            remote-endpoint = <&usb_phy_typec_mux_in>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+                        pmic_typec_role_switch_out: endpoint {
+                            remote-endpoint = <&usb_role_switch_in>;
+                        };
+                    };
+                };
+            };
+        };
+    };
+
+    usb {
+        dr_mode = "otg";
+        usb-role-switch;
+        port {
+            usb_role_switch_in: endpoint {
+                remote-endpoint = <&pmic_typec_role_switch_out>;
+            };
+        };
+    };
+
+    usb-phy {
+        orientation-switch;
+        port {
+            usb_phy_typec_mux_in: endpoint {
+                remote-endpoint = <&pmic_typec_mux_out>;
+            };
+        };
+    };
+
+...
-- 
2.39.2

