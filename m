Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 751A7662D4F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 18:48:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237128AbjAIRrL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 12:47:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237355AbjAIRqE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 12:46:04 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC4223D1DF
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 09:45:44 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id bs20so9012762wrb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 09:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DamfAyxua5mOcNQnTJRbUr6W6QeiRHppYu+u0Db1wlo=;
        b=mFzj4OcfLJnOiHKd0q2loV+psMgX08PCZxutS6vuglxJuguCw/Q7yP9wFVJPuCtAsT
         x/h/m88PtFCFgAaHANzCRVpskH3c1OfL0ELbDvdsJEfrRCBPj7nZ7PixwHV6FFLLhJw1
         +htIOwqum6c2wJ2xztGC++OVdJZYhnFPp6FMbappOyp0JhnaR3ebdMWdoDKG1lXoHcrA
         /cI0Nh8eVa2HNbGiBhNc0HJNn88C6CTV3t/H2JqO2jO8Jw+MhOGIILUjHztS19J/a1hA
         ODkSfIRoc/9ZqWTM44oKgPoywNt3SQR+YJDw71Us4+Ky+q9T/FJgGWD7jmphu8WTh6nn
         2Rug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DamfAyxua5mOcNQnTJRbUr6W6QeiRHppYu+u0Db1wlo=;
        b=QGgJjU7mVh1PbgAtsuOwFqDlQZEG2HzZnjTWABrRxisVule3wJGipZa4wo4hh+QPzS
         grWncV2P5+djft+PU0wpaU9KPXNMMp7XrCBkDYInH9kMrpZH9SLhQufM2YSC+dCmrQga
         zVn9PsOjqULOJSUvKRas5+GAlax3iqb2WcfautJfNewXk6t9DWx36IcG4FngYwCTtSOe
         OTNYcltUHIjI1p4MSCrE0WSMlM0ZywN9sVhVq5eUDgTR3zrgSkXU0gVXKgCM5ReOxjFG
         4DNyrRdXyoio9POr1BBtRfwQrwI4R7VVHgj3Fac2ZS4XucjBv/kEwJQD9ZNAZJH1/M2+
         zjog==
X-Gm-Message-State: AFqh2koXvMiTyVzkbWYg9eCG3FfbQ2P1CRUIn8arYM4IBImi+4qs+2Wp
        /S7xkDP1PesZ7bfCRkoP7NQdJA==
X-Google-Smtp-Source: AMrXdXtbtgRdBsH/+sciepnd1MkSiEwiKfLfhoVrimAWC9bDndBxSzIYf7ZexwvdSpk/yOtS6wfb3g==
X-Received: by 2002:a5d:5d10:0:b0:242:5b1f:3dcf with SMTP id ch16-20020a5d5d10000000b002425b1f3dcfmr56541214wrb.63.1673286344466;
        Mon, 09 Jan 2023 09:45:44 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:c88:901e:c74c:8e80])
        by smtp.gmail.com with ESMTPSA id m1-20020a5d6241000000b002bbdaf21744sm6142902wrv.113.2023.01.09.09.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 09:45:44 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 09/18] dt-bindings: pinctrl: sa8775p: add bindings for qcom,sa8775p-tlmm
Date:   Mon,  9 Jan 2023 18:45:02 +0100
Message-Id: <20230109174511.1740856-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230109174511.1740856-1-brgl@bgdev.pl>
References: <20230109174511.1740856-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add DT bindings for the TLMM controller on sa8775p platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../bindings/pinctrl/qcom,sa8775p-tlmm.yaml   | 142 ++++++++++++++++++
 1 file changed, 142 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
new file mode 100644
index 000000000000..44abf83b1358
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
@@ -0,0 +1,142 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,sa8775p-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. SA8775P TLMM block
+
+maintainers:
+  - Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+description: |
+  Top Level Mode Multiplexer pin controller in Qualcomm SA8775P SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sa8775p-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts: true
+  interrupt-controller: true
+  "#interrupt-cells": true
+  gpio-controller: true
+  "#gpio-cells": true
+  gpio-ranges: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-sa8775p-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-sa8775p-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-sa8775p-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-1][0-9]|22[0-7])$"
+            - enum: [ sdc1_rclk, sdc1_clk, sdc1_cmd, sdc1_data, ufs_reset ]
+        minItems: 1
+        maxItems: 16
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+        enum: [ atest_char, atest_char0, atest_char1, atest_char2,
+                atest_char3, atest_usb2, atest_usb20, atest_usb21, atest_usb22,
+                atest_usb23, audio_ref, cam_mclk, cci_async, cci_i2c,
+                cci_timer0, cci_timer1, cci_timer2, cci_timer3, cci_timer4,
+                cci_timer5, cci_timer6, cci_timer7, cci_timer8, cci_timer9,
+                cri_trng, cri_trng0, cri_trng1, dbg_out, ddr_bist, ddr_pxi0,
+                ddr_pxi1, ddr_pxi2, ddr_pxi3, ddr_pxi4, ddr_pxi5, edp0_hot,
+                edp0_lcd, edp1_hot, edp1_lcd, edp2_hot, edp2_lcd, edp3_hot,
+                edp3_lcd, emac0_mcg0, emac0_mcg1, emac0_mcg2, emac0_mcg3,
+                emac0_mdc, emac0_mdio, emac0_ptp, emac1_mcg0, emac1_mcg1,
+                emac1_mcg2, emac1_mcg3, emac1_mdc, emac1_mdio, emac1_ptp,
+                gcc_gp1, gcc_gp2, gcc_gp3, gcc_gp4, gcc_gp5, hs0_mi2s, hs1_mi2s,
+                hs2_mi2s, ibi_i3c, jitter_bist, mdp0_vsync0, mdp0_vsync1,
+                mdp0_vsync2, mdp0_vsync3, mdp0_vsync4, mdp0_vsync5, mdp0_vsync6,
+                mdp0_vsync7, mdp0_vsync8, mdp1_vsync0, mdp1_vsync1, mdp1_vsync2,
+                mdp1_vsync3, mdp1_vsync4, mdp1_vsync5, mdp1_vsync6, mdp1_vsync7,
+                mdp1_vsync8, mdp_vsync, mi2s1_data0, mi2s1_data1, mi2s1_sck,
+                mi2s1_ws, mi2s2_data0, mi2s2_data1, mi2s2_sck, mi2s2_ws,
+                mi2s_mclk0, mi2s_mclk1, pcie0_clkreq, pcie1_clkreq, phase_flag0,
+                phase_flag1, phase_flag10, phase_flag11, phase_flag12,
+                phase_flag13, phase_flag14, phase_flag15, phase_flag16,
+                phase_flag17, phase_flag18, phase_flag19, phase_flag2,
+                phase_flag20, phase_flag21, phase_flag22, phase_flag23,
+                phase_flag24, phase_flag25, phase_flag26, phase_flag27,
+                phase_flag28, phase_flag29, phase_flag3, phase_flag30,
+                phase_flag31, phase_flag4, phase_flag5, phase_flag6,
+                phase_flag7, phase_flag8, phase_flag9, pll_bist, pll_clk,
+                prng_rosc0, prng_rosc1, prng_rosc2, prng_rosc3, qdss_cti,
+                qdss_gpio, qdss_gpio0, qdss_gpio1, qdss_gpio10, qdss_gpio11,
+                qdss_gpio12, qdss_gpio13, qdss_gpio14, qdss_gpio15, qdss_gpio2,
+                qdss_gpio3, qdss_gpio4, qdss_gpio5, qdss_gpio6, qdss_gpio7,
+                qdss_gpio8, qdss_gpio9, qup0_se0, qup0_se1, qup0_se2, qup0_se3,
+                qup0_se4, qup0_se5, qup1_se0, qup1_se1, qup1_se2, qup1_se3,
+                qup1_se4, qup1_se5, qup1_se6, qup2_se0, qup2_se1, qup2_se2,
+                qup2_se3, qup2_se4, qup2_se5, qup2_se6, qup3_se0, sail_top,
+                sailss_emac0, sailss_ospi, sgmii_phy, tb_trig, tgu_ch0, tgu_ch1,
+                tgu_ch2, tgu_ch3, tgu_ch4, tgu_ch5, tsense_pwm1, tsense_pwm2,
+                tsense_pwm3, tsense_pwm4, usb2phy_ac, vsense_trigger]
+
+      bias-disable: true
+      bias-pull-down: true
+      bias-pull-up: true
+      drive-strength: true
+      input-enable: true
+      output-high: true
+      output-low: true
+
+    required:
+      - pins
+
+    additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    tlmm: pinctrl@f000000 {
+        compatible = "qcom,sa8775p-pinctrl";
+        reg = <0xf000000 0x1000000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 149>;
+
+        qup_uart10_state {
+            pins = "gpio46", "gpio47";
+            function = "qup1_se3";
+        };
+    };
+...
-- 
2.37.2

