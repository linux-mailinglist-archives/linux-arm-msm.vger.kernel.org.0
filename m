Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EEBB5ED0C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 01:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232285AbiI0XIt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 19:08:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbiI0XIs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 19:08:48 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 613BB10CA7F;
        Tue, 27 Sep 2022 16:08:47 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id g8so8996938iob.0;
        Tue, 27 Sep 2022 16:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=OgVyYllKMgEriC9IpICvgstDFpi7b1qgaoHgAKhnG/E=;
        b=UrfXqKZUlDvEPN8DgJl54KA9mEmRY+1SWMSSRtR5id1nubCqc4lW4cZwhNXs7NoBCW
         OnVSIWmTCMv4aJ4qcR4NwFDOSm20qKGT9pPaw4gzOBnhtWRmuCmo2F9iyrRKUf6n7gYH
         0ZmD1yraUK6nehasFj4PZMBxeX4qdwR3ebuTz18qBOcZ2lKfBoYWWHs1TMzB9RFKGBHm
         UF9CbjB131zIdXh0+7fk3QOBcTdTRR/pViQBbqwAYQg739lsk2sZ878ols4XCXDYaJT7
         q1vanSsOgGMcSBJJn86JrQGfPKnc8PKA08lqHj4p6pfrBogi7VbJ6p9ciAgjaNUFZifp
         8fmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=OgVyYllKMgEriC9IpICvgstDFpi7b1qgaoHgAKhnG/E=;
        b=2/OkOWlU6gbFBfc1w6UL32qLcbamzE86XCzAnBbxsscyb0fcDpKmt0k1HfTxPtd+3l
         /iG9vHwdDY4aWYNYBUKpMi68AUFo0YCwpiFB/RcfiZ0G2UGjsuBa5jc00UOlsSdQTHkG
         uiHiVUdQQfKtVWTp/BdHsbzlLf0aguk5ptFez85NAbeM8JWsvAgxYXRUZTaSwxegrzsn
         Gjt43ywl30K506VAtG+GrR6xXAjFzgAuBfziNhdvdVArI5OkcLq/tN836pgOtdaoxaLF
         Lsni2nj1h7UimxjabvkpsrVdIc1ds705LvSCkxuRIcL6JHanSOXUki235UOAYboVOOj4
         Q/1Q==
X-Gm-Message-State: ACrzQf14HT7e0G8ac6olh9C3qZQpbr9RkpWN0AxYfxNNhvh+bfc8I4S/
        2eWbLPHhbjINL3V7UywCNCJUThvbaXY=
X-Google-Smtp-Source: AMsMyM5v9vycCrdudA2M6WiKz5SBUeNGVk1UfCovQNSH6kDvXZEYFcdyPdltoQhkIUf7yIC4j7hfYQ==
X-Received: by 2002:a05:6638:26f:b0:35a:bc20:41f2 with SMTP id x15-20020a056638026f00b0035abc2041f2mr15849281jaq.121.1664320126404;
        Tue, 27 Sep 2022 16:08:46 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::ac99])
        by smtp.gmail.com with UTF8SMTPSA id s17-20020a02b151000000b0035a10a7e3ecsm1097192jah.74.2022.09.27.16.08.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 16:08:45 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v5 1/3] dt-bindings: pinctrl: qcom: add sdm670 pinctrl
Date:   Tue, 27 Sep 2022 19:08:31 -0400
Message-Id: <20220927230833.125749-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927230833.125749-1-mailingradian@gmail.com>
References: <20220927230833.125749-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is a new driver for the Snapdragon 670 TLMM (Top-Level Mode
Multiplexer). Document it.

Adapted from qcom,sm6350-pinctrl.yaml.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,sdm670-tlmm.yaml    | 138 ++++++++++++++++++
 1 file changed, 138 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdm670-tlmm.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm670-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdm670-tlmm.yaml
new file mode 100644
index 000000000000..1d8e76db57c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm670-tlmm.yaml
@@ -0,0 +1,138 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,sdm670-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. SDM670 TLMM block
+
+maintainers:
+  - Richard Acayan <mailingradian@gmail.com>
+
+description: |
+  This binding describes the Top Level Mode Multiplexer (TLMM) block found
+  in the SDM670 platform.
+
+allOf:
+  - $ref: pinctrl.yaml#
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sdm670-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts: true
+  interrupt-controller: true
+  '#interrupt-cells': true
+  gpio-controller: true
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 75
+
+  '#gpio-cells': true
+  gpio-ranges: true
+  wakeup-parent: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+patternProperties:
+  '-state$':
+    oneOf:
+      - $ref: "#/$defs/qcom-sdm670-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-sdm670-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-sdm670-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-4][0-9])$"
+            - enum: [ ufs_reset, sdc1_rclk, sdc1_clk, sdc1_cmd, sdc1_data,
+                      sdc2_clk, sdc2_cmd, sdc2_data ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+        enum: [ adsp_ext, agera_pll, atest_char, atest_tsens, atest_tsens2, atest_usb1, atest_usb10,
+                atest_usb11, atest_usb12, atest_usb13, atest_usb2, atest_usb20, atest_usb21,
+                atest_usb22, atest_usb23, cam_mclk, cci_async, cci_i2c, cci_timer0, cci_timer1,
+                cci_timer2, cci_timer3, cci_timer4, copy_gp, copy_phase, dbg_out, ddr_bist,
+                ddr_pxi0, ddr_pxi1, ddr_pxi2, ddr_pxi3, edp_hot, edp_lcd, gcc_gp1, gcc_gp2, gcc_gp3,
+                gp_pdm0, gp_pdm1, gp_pdm2, gpio, gps_tx, jitter_bist, ldo_en, ldo_update,
+                lpass_slimbus, m_voc, mdp_vsync, mdp_vsync0, mdp_vsync1, mdp_vsync2, mdp_vsync3,
+                mss_lte, nav_pps, pa_indicator, pci_e0, pci_e1, phase_flag, pll_bist, pll_bypassnl,
+                pll_reset, pri_mi2s, pri_mi2s_ws, prng_rosc, qdss_cti, qdss, qlink_enable,
+                qlink_request, qua_mi2s, qup0, qup1, qup10, qup11, qup12, qup13, qup14, qup15, qup2,
+                qup3, qup4, qup5, qup6, qup7, qup8, qup9, qup_l4, qup_l5, qup_l6, sdc4_clk,
+                sdc4_cmd, sdc4_data, sd_write, sec_mi2s, ter_mi2s, tgu_ch0, tgu_ch1, tgu_ch2,
+                tgu_ch3, tsif1_clk, tsif1_data, tsif1_en, tsif1_error, tsif1_sync, tsif2_clk,
+                tsif2_data, tsif2_en, tsif2_error, tsif2_sync, uim1_clk, uim1_data, uim1_present,
+                uim1_reset, uim2_clk, uim2_data, uim2_present, uim2_reset, uim_batt, usb_phy, vfr_1,
+                vsense_trigger, wlan1_adc0, wlan1_adc1, wlan2_adc0, wlan2_adc1, wsa_clk, wsa_data, ]
+
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
+    allOf:
+      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
+      - if:
+          properties:
+            pins:
+              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-4][0-9])$"
+        then:
+          required:
+            - function
+
+    additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    pinctrl@3400000 {
+        compatible = "qcom,sdm670-tlmm";
+        reg = <0x03400000 0x300000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 151>;
+
+        qup-i2c9-state {
+            pins = "gpio6", "gpio7";
+            function = "qup9";
+        };
+    };
+...
-- 
2.37.3

