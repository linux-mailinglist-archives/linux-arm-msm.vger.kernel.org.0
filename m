Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 297B2310139
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 01:02:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231535AbhBEACr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 19:02:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231509AbhBEACq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 19:02:46 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4989C061794
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Feb 2021 16:01:25 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id c18so5598219ljd.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Feb 2021 16:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sDtJL1PbqVWXnwq2JOyelcfSEkHlszqUyvF72mpd46U=;
        b=Oy4nZ8g1rvn9CReQXZZfkStcbq5+BQilkjEo5UujwYK+G2yUjxRZ7A1YFuludtHC8c
         URHS86E4K+yhXz6LB9br6+hptD7HW5YdH9AAwsRAGlF+qGZIopEwqEsOg+INypH1UQAR
         y4l3fJhEqYU0G6jahhkMScRO+gx47is0Yss4qcAa/RU89kKqvrgtys92sJqxcpODlGi6
         itCn+H9n/73UGz9ZWuAhvM1AeQuMkV+fLQVneGajZOxnTWnbyArQ4LVUjXCUvvMvZ4dn
         9a/+G4AoaNFwfDT4jfqcgZoZ5PLcPJE+kWXZ2toqhheYGst6Z3O+ORo2Hq/dr/ya7oMa
         P1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sDtJL1PbqVWXnwq2JOyelcfSEkHlszqUyvF72mpd46U=;
        b=tRNqG9nEd3MisCdhV3bLoVWIsPiv3CiTDhcIq7fl0HHIp7BqiKAO3Wx2Mn10FXkg6k
         +xzxjekUa9VMPvgZM0WEEG7B5UFjj91T5gE6otn86VLw2QLhBc2oYvxfc4sQfYiYu4T8
         gr0fZQVnYNAz1lmvWGDT7ldZeLvIfYpvxoNos0u1nO5KJ5ifDmjU4hl31R+faGhqypYR
         +2olGytsMLomJiX6xogsmcXx4rJ8wEDF94Nusu06Q/JTHC74SoBe5M5Elf6KZjOe4fcn
         rBShEaATEpWFwUt9q6/kYtqnZYFbVSG8Nc18wUX0fOkdXgYYpmWKY8yGAonWNT8rKEmV
         wTqA==
X-Gm-Message-State: AOAM5321/x5hXjOrHnr3nWL77GvUH4IU4MLIYKaeBeciCHxvO6Zbc98o
        1M9mDMlhpF8OVnzlLmsf0ERXtw==
X-Google-Smtp-Source: ABdhPJyPwpPTD4OqH6po7YsBgmLCh+ckzlKhK5q1GNBnHHPfO2+ErbYuRKIk5Ci19k+YlmvogrBggA==
X-Received: by 2002:a2e:90c7:: with SMTP id o7mr1050357ljg.427.1612483284198;
        Thu, 04 Feb 2021 16:01:24 -0800 (PST)
Received: from eriador.lan ([188.162.64.67])
        by smtp.gmail.com with ESMTPSA id x11sm799532ljh.69.2021.02.04.16.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 16:01:23 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jishnu Prakash <jprakash@qti.qualcomm.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v14 1/2] dt-bindings: thermal: qcom: add adc-thermal monitor bindings
Date:   Fri,  5 Feb 2021 03:01:17 +0300
Message-Id: <20210205000118.493610-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210205000118.493610-1-dmitry.baryshkov@linaro.org>
References: <20210205000118.493610-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add bindings for thermal monitor, part of Qualcomm PMIC5 chips. It is a
close counterpart of VADC part of those PMICs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/thermal/qcom-spmi-adc-tm5.yaml   | 153 ++++++++++++++++++
 1 file changed, 153 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml

diff --git a/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml b/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml
new file mode 100644
index 000000000000..7cd364430573
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml
@@ -0,0 +1,153 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/qcom-spmi-adc-tm5.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm's SPMI PMIC ADC Thermal Monitoring
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+
+properties:
+  compatible:
+    const: qcom,spmi-adc-tm5
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#thermal-sensor-cells":
+    const: 1
+    description:
+      Number of cells required to uniquely identify the thermal sensors. Since
+      we have multiple sensors this is set to 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  qcom,avg-samples:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of samples to be used for measurement.
+    enum:
+      - 1
+      - 2
+      - 4
+      - 8
+      - 16
+    default: 1
+
+  qcom,decimation:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: This parameter is used to decrease ADC sampling rate.
+            Quicker measurements can be made by reducing decimation ratio.
+    enum:
+      - 250
+      - 420
+      - 840
+    default: 840
+
+patternProperties:
+  "^([-a-z0-9]*)@[0-7]$":
+    type: object
+    description:
+      Represent one thermal sensor.
+
+    properties:
+      reg:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Specify the sensor channel. There are 8 channels in PMIC5's ADC TM
+        minimum: 0
+        maximum: 7
+
+      io-channels:
+        description:
+          From common IIO binding. Used to pipe PMIC ADC channel to thermal monitor
+
+      qcom,ratiometric:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          Channel calibration type.
+          If this property is specified VADC will use the VDD reference
+          (1.875V) and GND for channel calibration. If property is not found,
+          channel will be calibrated with 0V and 1.25V reference channels,
+          also known as absolute calibration.
+
+      qcom,hw-settle-time-us:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Time between AMUX getting configured and the ADC starting conversion.
+        enum: [15, 100, 200, 300, 400, 500, 600, 700, 1000, 2000, 4000, 8000, 16000, 32000, 64000, 128000]
+
+      qcom,pre-scaling:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description: Used for scaling the channel input signal before the
+          signal is fed to VADC. The configuration for this node is to know the
+          pre-determined ratio and use it for post scaling. It is a pair of
+          integers, denoting the numerator and denominator of the fraction by
+          which input signal is multiplied. For example, <1 3> indicates the
+          signal is scaled down to 1/3 of its value before ADC measurement.  If
+          property is not found default value depending on chip will be used.
+        items:
+          - const: 1
+          - enum: [ 1, 3, 4, 6, 20, 8, 10 ]
+
+    required:
+      - reg
+      - io-channels
+
+    additionalProperties:
+      false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#address-cells"
+  - "#size-cells"
+  - "#thermal-sensor-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/iio/qcom,spmi-vadc.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    spmi_bus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        pm8150b_adc: adc@3100 {
+            reg = <0x3100>;
+            compatible = "qcom,spmi-adc5";
+            #address-cells = <1>;
+            #size-cells = <0>;
+            #io-channel-cells = <1>;
+
+            /* Other propreties are omitted */
+            conn-therm@4f {
+                reg = <ADC5_AMUX_THM3_100K_PU>;
+                qcom,ratiometric;
+                qcom,hw-settle-time = <200>;
+            };
+        };
+
+        pm8150b_adc_tm: adc-tm@3500 {
+            compatible = "qcom,spmi-adc-tm5";
+            reg = <0x3500>;
+            interrupts = <0x2 0x35 0x0 IRQ_TYPE_EDGE_RISING>;
+            #thermal-sensor-cells = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            conn-therm@0 {
+                reg = <0>;
+                io-channels = <&pm8150b_adc ADC5_AMUX_THM3_100K_PU>;
+                qcom,ratiometric;
+                qcom,hw-settle-time-us = <200>;
+            };
+        };
+    };
+...
-- 
2.30.0

