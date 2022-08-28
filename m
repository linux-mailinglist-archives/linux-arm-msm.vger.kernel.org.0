Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 165755A3D9F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Aug 2022 15:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbiH1NBY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Aug 2022 09:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiH1NBX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Aug 2022 09:01:23 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CB8510FF5
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Aug 2022 06:01:21 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id i21so249680lfv.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Aug 2022 06:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=G6q99tFV5zDIWUnco/c4mKVD0xJW7VMbRdjRGKQjAt8=;
        b=DLz6IBmV8LBfhG5UiGcd8gNLWxnU9MJAHwyX1cTORiUOcLKCqLnC+9vaGIbI+SJpE2
         52Z2/UhDmo+KdsmgylbSn8bP3LS/iqjorrtlG82rh6t/h0HypS5bYgRcfQLGXKdIh9QH
         MBYB71tZn/V0uygZueOoAMIfEPqRPg9cF7FYiwdE7pW8pStZegXzvs0q26D0UEw+4+GW
         2478ejsTyFaYir5e5jnYWcW+lNGsMoVTfH+Wiyct3Do1HaIoGWppE0U+32QBiG+kvJi7
         2Woj3dcGNrCu/cYUQiPs3FcTVhglcxxvND8gGNztHZDcYNSERC+rxI4OgoVc7BU6nOLV
         x2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=G6q99tFV5zDIWUnco/c4mKVD0xJW7VMbRdjRGKQjAt8=;
        b=LzD8WJXY3qtbnyqKYvjfMYbkt6zleEVGf5kI/xm82gjhBFHvWgHDTLpitCcgSiQfjn
         dUv9eA4mFDX/gYcztt2qXYKHynj5RuaU9zkjPcq8W1LtZSI/LR7UbljkZPhbIYLmGVqg
         qRNLwg89kkaifn79koWTqG3gghhQyNDCHVeGJwHsY7Bqb/iJW3g90Ca5oZVTIXQpaj2r
         lJLKcOO8IkG9iJfyueRa6k5ZR3uMaLRRnpOspRDnn2NtRU38TX/VydjlUgT5dBR0wEy0
         tdrc6W+ooVo88mSAOMVc7NmrUR9ySGgYENloRR3TtKp+8qDS+dUaIqUrAveXNZ4701cq
         2t8g==
X-Gm-Message-State: ACgBeo2R/eWmEJpGzdvlU1apl3mWb7XQvRv9LETW90cxQasAb9It3YXV
        MNDO/iU0dkol91xEU596+Em6vA==
X-Google-Smtp-Source: AA6agR5CMAaUfuNsOo55O6/Pp9V57W6soCFzdY1i+KfmNUgwcA1432j0Xm8It0zqYgrVRHg7viHwvQ==
X-Received: by 2002:a05:6512:3a94:b0:492:b8d3:2236 with SMTP id q20-20020a0565123a9400b00492b8d32236mr4764772lfu.147.1661691679332;
        Sun, 28 Aug 2022 06:01:19 -0700 (PDT)
Received: from krzk-bin.starman.ee (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id o4-20020ac25e24000000b00492ebf36ac4sm958228lfg.89.2022.08.28.06.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 06:01:18 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: extend example
Date:   Sun, 28 Aug 2022 16:01:13 +0300
Message-Id: <20220828130113.5845-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Add a more complete example with PM6150 to provide better validation of
the bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/mfd/qcom,spmi-pmic.yaml          | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 230f3bf9c1ea..9676a9e3d176 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -208,3 +208,87 @@ examples:
             };
         };
     };
+
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/iio/qcom,spmi-vadc.h>
+    #include <dt-bindings/spmi/spmi.h>
+
+    pmic@0 {
+        compatible = "qcom,pm6150", "qcom,spmi-pmic";
+        reg = <0x0 SPMI_USID>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pon@800 {
+            compatible = "qcom,pm8998-pon";
+            reg = <0x800>;
+            mode-bootloader = <0x2>;
+            mode-recovery = <0x1>;
+
+            pwrkey {
+                compatible = "qcom,pm8941-pwrkey";
+                interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
+                debounce = <15625>;
+                bias-pull-up;
+                linux,code = <KEY_POWER>;
+            };
+        };
+
+        temp-alarm@2400 {
+            compatible = "qcom,spmi-temp-alarm";
+            reg = <0x2400>;
+            interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_RISING>;
+            io-channels = <&pm6150_adc ADC5_DIE_TEMP>;
+            io-channel-names = "thermal";
+            #thermal-sensor-cells = <0>;
+        };
+
+        pm6150_adc: adc@3100 {
+            compatible = "qcom,spmi-adc5";
+            reg = <0x3100>;
+            interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            #io-channel-cells = <1>;
+
+            adc-chan@6 {
+                reg = <ADC5_DIE_TEMP>;
+                label = "die_temp";
+            };
+
+            adc-chan@4f {
+                reg = <ADC5_AMUX_THM3_100K_PU>;
+                qcom,ratiometric;
+                qcom,hw-settle-time = <200>;
+            };
+        };
+
+        adc-tm@3500 {
+            compatible = "qcom,spmi-adc-tm5";
+            reg = <0x3500>;
+            interrupts = <0x0 0x35 0x0 IRQ_TYPE_EDGE_RISING>;
+            #thermal-sensor-cells = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            charger-thermistor@0 {
+                reg = <0>;
+                io-channels = <&pm6150_adc ADC5_AMUX_THM3_100K_PU>;
+                qcom,ratiometric;
+                qcom,hw-settle-time-us = <200>;
+            };
+        };
+
+        pm6150_gpio: gpios@c000 {
+            compatible = "qcom,pm6150-gpio", "qcom,spmi-gpio";
+            reg = <0xc000>;
+            gpio-controller;
+            gpio-ranges = <&pm6150_gpio 0 0 10>;
+            #gpio-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+        };
+    };
-- 
2.34.1

