Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1369E4CB5B8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 05:01:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbiCCECI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Mar 2022 23:02:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbiCCECE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Mar 2022 23:02:04 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CA5215D3AA
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Mar 2022 20:01:15 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id bk29so5795792wrb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Mar 2022 20:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BXhDDcjJdPDbZfpGFJmQRsA5lMP0BnPrEwgZzVXptZc=;
        b=JDRDF7L9j+J0cp5DEERpQSomuHOZbDMBN1Fw3ImY2ks4Yg1GlxEL8x4vTIKArRXXj6
         m00/9IbotcMXMdPdOynVeL9JxP17DF/CrBfdmkdTTCgjvJ/SbPmz5emfV7e7LuNOHgcY
         mM7Y2EwcsgbjZvggqhtusXoTTJyYsqDY7EzTJoePz9Rry4jZCOa8PLiEgaQKQtWv0XJ5
         z5HFVMsqSxxoFV3G5M/md6wit0ISopUswNMUoOukStNuy4hpH2f9GH6sN3CtKvbLOBp/
         FZ94lVg62FZSkBd9E/Bav0tNvIl0ZBSUdsoWSYgoDR7esGi0RmJETtZEcW17ZplzMnoQ
         Motg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BXhDDcjJdPDbZfpGFJmQRsA5lMP0BnPrEwgZzVXptZc=;
        b=5u2SsmxxpwIALXXj34azyKLg/nPMPJ6V6GgJs/xVqLHb0solnkPVuK426Jt8R3C+UD
         i+lCsF40Sbpzd/jFO+zRkyWuIXJz3+inT06TnZCcWkr0Oy5bKE6GPIUQ5up/tfbSM76k
         1zC+XA7LOjqNjDHJPhBECPUaZu+x8UN+JW3bDVOezXdHiO8a1VlDruIkN8Ma1RANhea6
         5Y+OW53P1uUcPrfzL3A5k4/rnQSUeovLoRYso6FxFrE/abCMuuYl3glJD77CA8sWC7aW
         ceCt3jH54uz3VTr9kE5GYamCYkYSlrsZBf3XvROkcaRsbekoGZRbqpJcblBbBefP22rz
         QlHg==
X-Gm-Message-State: AOAM530Fdl1Jp7wKSRWj6OQl75SHGtrAp57q7iCJdSU/G6FPZ+P7yvgw
        8/bGe1QVfSroOxIq+3EzXKzxLA==
X-Google-Smtp-Source: ABdhPJxilu6oH+AdPhmD6Cy9G19EoALyD6rQvtK4jseQmwrCLQtygYNRGqxAsjBihuuaYyjAG9G1bA==
X-Received: by 2002:adf:b64c:0:b0:1e3:16d0:3504 with SMTP id i12-20020adfb64c000000b001e316d03504mr25390573wre.333.1646280073793;
        Wed, 02 Mar 2022 20:01:13 -0800 (PST)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id r16-20020a5d4e50000000b001f0075f4ca1sm702615wrt.105.2022.03.02.20.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 20:01:13 -0800 (PST)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     sumit.semwal@linaro.org, amit.pundir@linaro.org,
        john.stultz@linaro.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v9 4/9] dt-bindings: iio: adc: document qcom-spmi-rradc
Date:   Thu,  3 Mar 2022 04:00:30 +0000
Message-Id: <20220303040035.1454103-5-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303040035.1454103-1-caleb.connolly@linaro.org>
References: <20220303040035.1454103-1-caleb.connolly@linaro.org>
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

Add dt-binding docs for the Qualcomm SPMI RRADC found in PMICs like
PMI8998 and PMI8994

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/iio/adc/qcom,spmi-rradc.yaml     | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/qcom,spmi-rradc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-rradc.yaml b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-rradc.yaml
new file mode 100644
index 000000000000..11d47c46a48d
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-rradc.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/qcom,spmi-rradc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm's SPMI PMIC Round Robin ADC
+
+maintainers:
+  - Caleb Connolly <caleb.connolly@linaro.org>
+
+description: |
+  The Qualcomm SPMI Round Robin ADC (RRADC) provides interface to clients to read the
+  voltage, current and temperature for supported peripherals such as the battery thermistor
+  die temperature, charger temperature, USB and DC input voltage / current and battery ID
+  resistor.
+
+properties:
+  compatible:
+    enum:
+      - qcom,pmi8998-rradc
+      - qcom,pm660-rradc
+
+  reg:
+    description: rradc base address and length in the SPMI PMIC register map
+    maxItems: 1
+
+  qcom,batt-id-delay-ms:
+    description:
+      Sets the hardware settling time for the battery ID resistor.
+    enum: [0, 1, 4, 12, 20, 40, 60, 80]
+
+  "#io-channel-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pmic {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      pmic_rradc: adc@4500 {
+          compatible = "qcom,pmi8998-rradc";
+          reg = <0x4500>;
+          #io-channel-cells  = <1>;
+      };
+    };
+...
-- 
2.35.1

