Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD18A6F30AF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 14:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232494AbjEAMLZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 08:11:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232500AbjEAMLX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 08:11:23 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2C09E5B
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 05:11:21 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-2fe3fb8e25fso1394771f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 05:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682943080; x=1685535080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEAWIVAO8TCad9eUCpAgUfIQC7M2awX7qB9SEkGVDac=;
        b=IwLb+E56usqyA/JioJ/a9nbZTIAcwT0HQTYUQVkxR2LjgmWA0Qf5CgqQ0OrLg6hdDr
         9330RWxIQlvgrRjd3+ldlwJh3sXtXkrv0QPN8HXPgiHg2g1/2N19Yxa1lBN7IUosPjRH
         7b4DfnWZcOf2Z6JQege3SDwEmsBICvXwe8UY8BkuqS+MAQSGwq+ZnG8AG3fDvGwA8yla
         7eKa8moGcfIBZ+AttMJvOn9LtJ09D9gxMEZHuAjpgMCK1/H6bARlNTtqBKBm9kU7MVGZ
         YAp4ctx8WUq+JPFtG3XXQpaffJFdScGceRgzgwl4Im5PWNxBR2L/HJL2XBq2J3kQlhRh
         cWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682943080; x=1685535080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sEAWIVAO8TCad9eUCpAgUfIQC7M2awX7qB9SEkGVDac=;
        b=AW5dWjFvvkLpyrivonYK6A31ClwVXD3m76oZackl1IvdKfEmtn+JWgH6kwbbf+OyEi
         bAmhi2eX1oijubk2izpUWjJ2rLO5h3Y8RjKtbqMf/EE/6oRA21ptxLb7fzpdzaFcZzIT
         eIUvCYWeHOjELfGi+nxKisTFKAFoBRbAzKCQjYk5tPFjer1U9gLbFYrIryFLCkQZcOv9
         6tk2vHSi5rCBNFo+fbNsDUQQPKJNT8VdB5jLV0wa9MYGKW5/bsT5ry3y0uLEOng/Dicx
         lBQT1BTuYaZot1p6jzJlGEDJ8rbENzUuyBzeObsh+NdlWDT06hrwTGOrMC3pcvyddwQ5
         Q4Gg==
X-Gm-Message-State: AC+VfDzWPUHsYO/SQpolkT0XVjP/8s69X5/msy3ZLyxbJlErIqNFy39t
        F2doXRU1FicykTulBO4VOWwyog==
X-Google-Smtp-Source: ACHHUZ4Gf5kVsEf393H0tjUWLhGueZN0Wk3ukc6+9ho0kBS7HJ6y4cF9F3IpD6imKue9wGKU64sW6w==
X-Received: by 2002:a5d:6d50:0:b0:306:2638:fa6c with SMTP id k16-20020a5d6d50000000b003062638fa6cmr4570750wri.33.1682943079890;
        Mon, 01 May 2023 05:11:19 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o10-20020a05600c510a00b003ee443bf0c7sm35856634wms.16.2023.05.01.05.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 05:11:19 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, bryan.odonoghue@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com, Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v6 05/13] dt-bindings: usb: Add Qualcomm PMIC Type-C
Date:   Mon,  1 May 2023 13:11:03 +0100
Message-Id: <20230501121111.1058190-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
References: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
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

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/usb/qcom,pmic-typec.yaml         | 190 ++++++++++++++++++
 1 file changed, 190 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
new file mode 100644
index 0000000000000..17c5c244c1701
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
+                            remote-endpoint = <&usb_controller_role_switch_in>;
+                        };
+                    };
+                };
+            };
+        };
+    };
+
+    usb_controller {
+        dr_mode = "otg";
+        usb-role-switch;
+        port {
+            usb_controller_role_switch_in: endpoint {
+                remote-endpoint = <&pmic_typec_role_switch_out>;
+            };
+        };
+    };
+
+    usb_phy {
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

