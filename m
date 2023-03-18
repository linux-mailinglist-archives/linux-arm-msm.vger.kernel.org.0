Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F02D36BF9E1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Mar 2023 13:18:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbjCRMS4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Mar 2023 08:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229830AbjCRMSw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Mar 2023 08:18:52 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C64E3E617
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 05:18:45 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id l15-20020a05600c4f0f00b003ed58a9a15eso4821011wmq.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 05:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679141924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmhAneZaAlmWW9bghs/uPFpD4YYuHAdYFsrvbdKAhWg=;
        b=fdegTtX0ArzzAVQgtxqPEWd1rY6tz416Sf6+aphRty7zbQdD3CnlxOv3SAR9VmM2F1
         Xf7++SVP0uSUWOBMm16RQm50yOgHNgrK4YdGl90MLa9m2BWtdAL0ja5ldyMObA+jKLlY
         YAVusGNkWjwa9bX3LgAAYd/V3+PLSJoVmCdTuvNn6bYQvo+mIFozyMZ5RVCSZPTU5e7K
         LUXG0LWn5HQyrGezv/pqwKvsbTac4iLulEIKXoOSmhsvTnDqGciS8lXMFbgSNZ2tFunB
         S9mnkBKA5wcn6sMrBeb34gDrb9FC5VKEXi5Am5e0VFQJb42fdIn0ViQGvhkDBpFX7PYb
         JtBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679141924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kmhAneZaAlmWW9bghs/uPFpD4YYuHAdYFsrvbdKAhWg=;
        b=dG7+QmdVzZXwRuU7qHTzDe072Qd6981bfGIDfnxCCE817khAALssPM9nnK5+df+cRu
         v9642E4YOcHmHS54rmiIXh+YYzMJsNPDRs42k4ZpJd8Vjh3gBrfetwvpTkvAIWkjlno8
         23xtYcQieN2iZLa9c6mazqKiJ75911HrPsNjIVYtMEecFlEPVVg8RJ5IPy4rbkLZB2+A
         zKnxUM1xXLdxJQmmJmaAMvOg4rUviABFZXpFFvDFuZC3eSkYMoxUp1P2Ga82tkAMMs7C
         kaO0z4j1o7EXADin8HIx43EUhO+j545Xy3C3TCZ5vf7bcWX41is3k6uR5jadehe0PISd
         z3vQ==
X-Gm-Message-State: AO0yUKWLgIjSLAuqoGrGd97ZV9YRekn60jEOA4BeoM5IbcjZgG4K4o3O
        h8ib4ni9KBA7OuE/it+zQQsT+Q==
X-Google-Smtp-Source: AK7set+sTySfoJ57o27rpr0isEzIgS4OofwKP0cnf9gsEujcPk6W68xzuo5zqsFvh17HdFW01BpcPw==
X-Received: by 2002:a05:600c:35ce:b0:3e2:1368:e3a0 with SMTP id r14-20020a05600c35ce00b003e21368e3a0mr28066551wmq.18.1679141923883;
        Sat, 18 Mar 2023 05:18:43 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id az40-20020a05600c602800b003e2096da239sm10814997wmb.7.2023.03.18.05.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 05:18:43 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: [PATCH v4 09/18] dt-bindings: usb: Add Qualcomm PMIC TCPM YAML schema
Date:   Sat, 18 Mar 2023 12:18:19 +0000
Message-Id: <20230318121828.739424-10-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
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

Add a YAML description for the pm8150b-tcpm driver. The pm8150b-tcpm
encapsulates a type-c block and a pdphy block into one block presented to
the TCPM Linux API.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/usb/qcom,pmic-virt-tcpm.yaml     | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-virt-tcpm.yaml

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-virt-tcpm.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-virt-tcpm.yaml
new file mode 100644
index 0000000000000..576842c8b65b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-virt-tcpm.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/qcom,pmic-virt-tcpm.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm PMIC Virtual TCPM Driver
+
+maintainers:
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+description: |
+  Qualcomm PMIC Virtual Type-C Port Manager Driver
+  A virtual device which manages Qualcomm PMIC provided Type-C port and
+  Power Delivery in one place.
+
+properties:
+  compatible:
+    const: qcom,pmic-virt-tcpm
+
+  connector:
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Contains a port which consumes data-role switching messages.
+
+  qcom,pmic-typec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A phandle to the typec port hardware driver.
+
+  qcom,pmic-pdphy:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A phandle to the type-c pdphy hardware driver.
+
+required:
+  - compatible
+  - connector
+  - port
+  - qcom,pmic-typec
+  - qcom,pmic-pdphy
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/usb/pd.h>
+    #include <dt-bindings/usb/typec/qcom,pmic-typec.h>
+    #include <dt-bindings/usb/typec/qcom,pmic-pdphy.h>
+
+    pm8150b_tcpm: pmic-tcpm {
+        compatible = "qcom,pmic-virt-tcpm";
+
+        qcom,pmic-typec = <&pm8150b_typec>;
+        qcom,pmic-pdphy = <&pm8150b_pdphy>;
+
+        port {
+            usb3_role: endpoint {
+                remote-endpoint = <&dwc3_drd_switch>;
+            };
+        };
+
+        connector {
+            compatible = "usb-c-connector";
+
+            power-role = "source";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    pmic_tcpm_ss_mux: endpoint {
+                        remote-endpoint = <&qmp_ss_mux>;
+                    };
+                };
+            };
+        };
+    };
+
+...
-- 
2.39.2

