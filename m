Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0743B36B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 21:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232029AbhFXTUK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 15:20:10 -0400
Received: from relay06.th.seeweb.it ([5.144.164.167]:43843 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231969AbhFXTUJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 15:20:09 -0400
Received: from localhost.localdomain (83.6.168.10.neoplus.adsl.tpnet.pl [83.6.168.10])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 244CC3F479;
        Thu, 24 Jun 2021 21:17:47 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add bindings for MDM9607
Date:   Thu, 24 Jun 2021 21:17:40 +0200
Message-Id: <20210624191743.617073-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the newly added MDM9607 pinctrl driver.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
Changes since v3:
- Use the correct compatible in the example

 .../pinctrl/qcom,mdm9607-pinctrl.yaml         | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
new file mode 100644
index 000000000000..3b02dc6626ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,mdm9607-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. MDM9607 TLMM block
+
+maintainers:
+  - Konrad Dybcio <konrad.dybcio@somainline.org>
+
+description: |
+  This binding describes the Top Level Mode Multiplexer block found in the
+  MDM9607 platform.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,mdm9607-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts: true
+  interrupt-controller: true
+  '#interrupt-cells': true
+  gpio-controller: true
+  gpio-reserved-ranges: true
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
+      - $ref: "#/$defs/qcom-mdm9607-tlmm-state"
+      - patternProperties:
+          ".*":
+            $ref: "#/$defs/qcom-mdm9607-tlmm-state"
+
+'$defs':
+  qcom-mdm9607-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([1-9]|[1-7][0-9]|80)$"
+            - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk, sdc2_cmd,
+                      sdc2_data, qdsd_cmd, qdsd_data0, qdsd_data1, qdsd_data2,
+                      qdsd_data3 ]
+        minItems: 1
+        maxItems: 16
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+        enum: [ adsp_ext, atest_bbrx0, atest_bbrx1, atest_char, atest_char0,
+                atest_char1, atest_char2, atest_char3,
+                atest_combodac_to_gpio_native, atest_gpsadc_dtest0_native,
+                atest_gpsadc_dtest1_native, atest_tsens, backlight_en_b,
+                bimc_dte0, bimc_dte1, blsp1_spi, blsp2_spi, blsp3_spi,
+                blsp_i2c1, blsp_i2c2, blsp_i2c3, blsp_i2c4, blsp_i2c5,
+                blsp_i2c6, blsp_spi1, blsp_spi2, blsp_spi3, blsp_spi4,
+                blsp_spi5, blsp_spi6, blsp_uart1, blsp_uart2, blsp_uart3,
+                blsp_uart4, blsp_uart5, blsp_uart6, blsp_uim1, blsp_uim2,
+                codec_int, codec_rst, coex_uart, cri_trng, cri_trng0,
+                cri_trng1, dbg_out, ebi0_wrcdc, ebi2_a, ebi2_a_d_8_b,
+                ebi2_lcd, ebi2_lcd_cs_n_b, ebi2_lcd_te_b, eth_irq, eth_rst,
+                gcc_gp1_clk_a, gcc_gp1_clk_b, gcc_gp2_clk_a, gcc_gp2_clk_b,
+                gcc_gp3_clk_a, gcc_gp3_clk_b, gcc_plltest, gcc_tlmm, gmac_mdio,
+                gpio, gsm0_tx, lcd_rst, ldo_en, ldo_update, m_voc, modem_tsync,
+                nav_ptp_pps_in_a, nav_ptp_pps_in_b, nav_tsync_out_a,
+                nav_tsync_out_b, pa_indicator, pbs0, pbs1, pbs2,
+                pri_mi2s_data0_a, pri_mi2s_data1_a, pri_mi2s_mclk_a,
+                pri_mi2s_sck_a, pri_mi2s_ws_a, prng_rosc, ptp_pps_out_a,
+                ptp_pps_out_b, pwr_crypto_enabled_a, pwr_crypto_enabled_b,
+                pwr_modem_enabled_a, pwr_modem_enabled_b, pwr_nav_enabled_a,
+                pwr_nav_enabled_b, qdss_cti_trig_in_a0, qdss_cti_trig_in_a1,
+                qdss_cti_trig_in_b0, qdss_cti_trig_in_b1, qdss_cti_trig_out_a0,
+                qdss_cti_trig_out_a1, qdss_cti_trig_out_b0, qdss_cti_trig_out_b1,
+                qdss_traceclk_a, qdss_traceclk_b, qdss_tracectl_a,
+                qdss_tracectl_b, qdss_tracedata_a, qdss_tracedata_b, rcm_marker1,
+                rcm_marker2, sd_write, sec_mi2s, sensor_en, sensor_int2,
+                sensor_int3, sensor_rst, ssbi1, ssbi2, touch_rst, ts_int,
+                uim1_clk, uim1_data, uim1_present, uim1_reset, uim2_clk,
+                uim2_data, uim2_present, uim2_reset, uim_batt, wlan_en1, ]
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
+      - function
+
+    additionalProperties: false
+
+examples:
+  - |
+        #include <dt-bindings/interrupt-controller/arm-gic.h>
+        tlmm: pinctrl@1000000 {
+          compatible = "qcom,mdm9607-tlmm";
+          reg = <0x01000000 0x300000>;
+          interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+          gpio-controller;
+          gpio-ranges = <&msmgpio 0 0 80>;
+          #gpio-cells = <2>;
+          interrupt-controller;
+          #interrupt-cells = <2>;
+        };
-- 
2.32.0

