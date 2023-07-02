Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0037744FA4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jul 2023 20:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbjGBSXP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 14:23:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbjGBSXP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 14:23:15 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4C03BE
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 11:23:12 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-977e0fbd742so431570766b.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 11:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688322191; x=1690914191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qzr/VwRbbgwsrmE6jlZJ9FcP3Vc2cGWHqLjQfvYlffY=;
        b=iDFLGVhtmva98VVo1s7qaAtOvSb8hoZWP8hPCdQ4DFiRLtfr9Od2UOFA5bcj3ueX+Z
         Q/DHkOcVx73Yem8FSZwZcOGDX1YUo7SdB4uX5hy0p8PwCShj3sudB3xpoRNvN9eB/5WS
         AlrKev4iUUm3r0ir27SCMDF9IR/UhGtZmubXdidRdSiMK9+dCSeI2Exjz7CFMmTwzmd3
         sB1Ded1tyihdP7JQiRd1zV++gqtifXqhaw2LkQLxAeBXhjG35OJus7RtEahQ7BQsRfIe
         upbMphX7kKXqo1BcrUpTItzijk1zXzhyU6J92tZJm1kKyCQok4y3awICBT/gpRLdQSoy
         qW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688322191; x=1690914191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qzr/VwRbbgwsrmE6jlZJ9FcP3Vc2cGWHqLjQfvYlffY=;
        b=D2TBuiHE035sSWTWXOWJlAT3ZfNMuZQClVqCx8tXG9p027FkU9wawAp9ehDeRuQ5Mi
         9+FjkiP5ZCrtWU0VUV6KvBhxGPrsL6bQ9CwNNVFBr2eLwF9nbMF/+qOPG+e7n5WN12EA
         6pymIK8mFyC82g18dfqqUXDHWYCrjexhFIwIl3oP0BhZIZDUw5xTZUs5KTt4YVfN7A1d
         iCGBonvr45XKseyLl7cW0eokfmfyZviBWafh8RronzODolye/ZgP09QUNOIFpG0wQNgO
         EPYdbi59hCN8lg5SkAWK6ICUEJi1QUtTyKlh6Ly79IyVykTcAbc18z/CbwX/Bp8SMJH9
         +s1g==
X-Gm-Message-State: ABy/qLZNLB5jPQX3HJE8fhTT5kTqO/lX9/fCDc6YxHRAswi0oZcz6jCp
        O2ybAju5wOCLz8aOx9XSoiTPbQ==
X-Google-Smtp-Source: ACHHUZ53KUKEp/qx2RT5nWxkeQ2K5QRc74L6k4flhy2OCKXv5BYIsQU3P3oC04yPG5HR5Pl0ibYw7Q==
X-Received: by 2002:a17:906:d9cf:b0:988:f2ad:73e9 with SMTP id qk15-20020a170906d9cf00b00988f2ad73e9mr5829930ejb.52.1688322191275;
        Sun, 02 Jul 2023 11:23:11 -0700 (PDT)
Received: from krzk-bin.. ([217.169.179.6])
        by smtp.gmail.com with ESMTPSA id p11-20020a1709060e8b00b00993159ce075sm2584698ejf.210.2023.07.02.11.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 11:23:10 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Leo Yan <leo.yan@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, linux-iio@vger.kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: cleanup DTS example whitespaces
Date:   Sun,  2 Jul 2023 20:23:08 +0200
Message-Id: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DTS code coding style expects spaces around '=' sign.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Rob,

Maybe this could go via your tree? Rebased on your for-next:
v6.4-rc2-45-gf0ac35049606
---
 .../bindings/arm/arm,coresight-cti.yaml        | 18 +++++++++---------
 .../bindings/arm/keystone/ti,sci.yaml          |  8 ++++----
 .../devicetree/bindings/display/msm/gmu.yaml   |  2 +-
 .../display/panel/samsung,s6e8aa0.yaml         |  2 +-
 .../display/rockchip/rockchip-vop.yaml         |  4 ++--
 .../bindings/iio/adc/ti,adc108s102.yaml        |  2 +-
 .../bindings/media/renesas,rzg2l-cru.yaml      |  4 ++--
 .../devicetree/bindings/media/renesas,vin.yaml |  4 ++--
 .../devicetree/bindings/mtd/mtd-physmap.yaml   |  2 +-
 .../bindings/net/mediatek-dwmac.yaml           |  2 +-
 .../bindings/perf/amlogic,g12-ddr-pmu.yaml     |  4 ++--
 .../bindings/phy/mediatek,dsi-phy.yaml         |  2 +-
 .../remoteproc/amlogic,meson-mx-ao-arc.yaml    |  2 +-
 .../devicetree/bindings/usb/mediatek,mtu3.yaml |  2 +-
 .../devicetree/bindings/usb/ti,am62-usb.yaml   |  2 +-
 15 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
index 0c5b875cb654..d6c84b6e7fe6 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
@@ -287,7 +287,7 @@ examples:
             arm,trig-in-sigs = <0 1>;
             arm,trig-in-types = <PE_DBGTRIGGER
                                  PE_PMUIRQ>;
-            arm,trig-out-sigs=<0 1 2 >;
+            arm,trig-out-sigs = <0 1 2 >;
             arm,trig-out-types = <PE_EDBGREQ
                                   PE_DBGRESTART
                                   PE_CTIIRQ>;
@@ -309,24 +309,24 @@ examples:
 
       trig-conns@0 {
         reg = <0>;
-        arm,trig-in-sigs=<0>;
-        arm,trig-in-types=<GEN_INTREQ>;
-        arm,trig-out-sigs=<0>;
-        arm,trig-out-types=<GEN_HALTREQ>;
+        arm,trig-in-sigs = <0>;
+        arm,trig-in-types = <GEN_INTREQ>;
+        arm,trig-out-sigs = <0>;
+        arm,trig-out-types = <GEN_HALTREQ>;
         arm,trig-conn-name = "sys_profiler";
       };
 
       trig-conns@1 {
         reg = <1>;
-        arm,trig-out-sigs=<2 3>;
-        arm,trig-out-types=<GEN_HALTREQ GEN_RESTARTREQ>;
+        arm,trig-out-sigs = <2 3>;
+        arm,trig-out-types = <GEN_HALTREQ GEN_RESTARTREQ>;
         arm,trig-conn-name = "watchdog";
       };
 
       trig-conns@2 {
         reg = <2>;
-        arm,trig-in-sigs=<1 6>;
-        arm,trig-in-types=<GEN_HALTREQ GEN_RESTARTREQ>;
+        arm,trig-in-sigs = <1 6>;
+        arm,trig-in-types = <GEN_HALTREQ GEN_RESTARTREQ>;
         arm,trig-conn-name = "g_counter";
       };
     };
diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
index 91b96065f7df..86b59de7707e 100644
--- a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
+++ b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
@@ -96,8 +96,8 @@ examples:
       compatible = "ti,k2g-sci";
       ti,system-reboot-controller;
       mbox-names = "rx", "tx";
-      mboxes= <&msgmgr 5 2>,
-              <&msgmgr 0 0>;
+      mboxes = <&msgmgr 5 2>,
+               <&msgmgr 0 0>;
       reg-names = "debug_messages";
       reg = <0x02921800 0x800>;
     };
@@ -107,8 +107,8 @@ examples:
       compatible = "ti,k2g-sci";
       ti,host-id = <12>;
       mbox-names = "rx", "tx";
-      mboxes= <&secure_proxy_main 11>,
-              <&secure_proxy_main 13>;
+      mboxes = <&secure_proxy_main 11>,
+               <&secure_proxy_main 13>;
       reg-names = "debug_messages";
       reg = <0x44083000 0x1000>;
 
diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 029d72822d8b..65b02c7a1211 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -225,7 +225,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     gmu: gmu@506a000 {
-        compatible="qcom,adreno-gmu-630.2", "qcom,adreno-gmu";
+        compatible = "qcom,adreno-gmu-630.2", "qcom,adreno-gmu";
 
         reg = <0x506a000 0x30000>,
               <0xb280000 0x10000>,
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
index 1cdc91b3439f..200fbf1c74a0 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
@@ -74,7 +74,7 @@ examples:
             vdd3-supply = <&vcclcd_reg>;
             vci-supply = <&vlcd_reg>;
             reset-gpios = <&gpy4 5 0>;
-            power-on-delay= <50>;
+            power-on-delay = <50>;
             reset-delay = <100>;
             init-delay = <100>;
             panel-width-mm = <58>;
diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
index 6f43d885c9b3..df61cb5f5c54 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
@@ -121,11 +121,11 @@ examples:
         #size-cells = <0>;
         vopb_out_edp: endpoint@0 {
           reg = <0>;
-          remote-endpoint=<&edp_in_vopb>;
+          remote-endpoint = <&edp_in_vopb>;
         };
         vopb_out_hdmi: endpoint@1 {
           reg = <1>;
-          remote-endpoint=<&hdmi_in_vopb>;
+          remote-endpoint = <&hdmi_in_vopb>;
         };
       };
     };
diff --git a/Documentation/devicetree/bindings/iio/adc/ti,adc108s102.yaml b/Documentation/devicetree/bindings/iio/adc/ti,adc108s102.yaml
index 9b072b057f16..a60b1e100ee4 100644
--- a/Documentation/devicetree/bindings/iio/adc/ti,adc108s102.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/ti,adc108s102.yaml
@@ -35,7 +35,7 @@ unevaluatedProperties: false
 examples:
   - |
     spi {
-        #address-cells= <1>;
+        #address-cells = <1>;
         #size-cells = <0>;
 
         adc@0 {
diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
index 7dde7967c886..1e72b8808d24 100644
--- a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
@@ -137,7 +137,7 @@ examples:
 
                 cru_parallel_in: endpoint@0 {
                     reg = <0>;
-                    remote-endpoint= <&ov5642>;
+                    remote-endpoint = <&ov5642>;
                     hsync-active = <1>;
                     vsync-active = <1>;
                 };
@@ -150,7 +150,7 @@ examples:
 
                 cru_csi_in: endpoint@0 {
                     reg = <0>;
-                    remote-endpoint= <&csi_cru_in>;
+                    remote-endpoint = <&csi_cru_in>;
                 };
             };
         };
diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
index 91e8f368fb52..324703bfb1bd 100644
--- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
@@ -303,11 +303,11 @@ examples:
 
                             vin0csi20: endpoint@0 {
                                     reg = <0>;
-                                    remote-endpoint= <&csi20vin0>;
+                                    remote-endpoint = <&csi20vin0>;
                             };
                             vin0csi40: endpoint@2 {
                                     reg = <2>;
-                                    remote-endpoint= <&csi40vin0>;
+                                    remote-endpoint = <&csi40vin0>;
                             };
                     };
             };
diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
index f8c976898a95..18f6733408b4 100644
--- a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
@@ -164,7 +164,7 @@ examples:
             reg = <0 0xf80000>;
         };
         firmware@f80000 {
-            label ="firmware";
+            label = "firmware";
             reg = <0xf80000 0x80000>;
             read-only;
         };
diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
index 0fa2132fa4f4..400aedb58205 100644
--- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
@@ -156,7 +156,7 @@ examples:
         reg = <0x1101c000 0x1300>;
         interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_LOW>;
         interrupt-names = "macirq";
-        phy-mode ="rgmii-rxid";
+        phy-mode = "rgmii-rxid";
         mac-address = [00 55 7b b5 7d f7];
         clock-names = "axi",
                       "apb",
diff --git a/Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml b/Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
index 50f46a6898b1..4adab0149108 100644
--- a/Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
+++ b/Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
@@ -42,8 +42,8 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     pmu {
-        #address-cells=<2>;
-        #size-cells=<2>;
+        #address-cells = <2>;
+        #size-cells = <2>;
 
         pmu@ff638000 {
             compatible = "amlogic,g12a-ddr-pmu";
diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
index 26f2b887cfc1..b8d77165c4a1 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
@@ -83,7 +83,7 @@ examples:
         clocks = <&clk26m>;
         clock-output-names = "mipi_tx0_pll";
         drive-strength-microamp = <4000>;
-        nvmem-cells= <&mipi_tx_calibration>;
+        nvmem-cells = <&mipi_tx_calibration>;
         nvmem-cell-names = "calibration-data";
         #clock-cells = <0>;
         #phy-cells = <0>;
diff --git a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
index 3100cb870170..76e8ca44906a 100644
--- a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
@@ -75,7 +75,7 @@ additionalProperties: false
 examples:
   - |
     remoteproc@1c {
-      compatible= "amlogic,meson8-ao-arc", "amlogic,meson-mx-ao-arc";
+      compatible = "amlogic,meson8-ao-arc", "amlogic,meson-mx-ao-arc";
       reg = <0x1c 0x8>, <0x38 0x8>;
       reg-names = "remap", "cpu";
       resets = <&media_cpu_reset>;
diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index 478214ab045e..a59d91243ac8 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -304,7 +304,7 @@ examples:
   # Dual role switch with type-c
   - |
     usb@11201000 {
-        compatible ="mediatek,mt8183-mtu3", "mediatek,mtu3";
+        compatible = "mediatek,mt8183-mtu3", "mediatek,mtu3";
         reg = <0x11201000 0x2e00>, <0x11203e00 0x0100>;
         reg-names = "mac", "ippc";
         interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_LOW>;
diff --git a/Documentation/devicetree/bindings/usb/ti,am62-usb.yaml b/Documentation/devicetree/bindings/usb/ti,am62-usb.yaml
index d25fc708e32c..fec5651f5602 100644
--- a/Documentation/devicetree/bindings/usb/ti,am62-usb.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,am62-usb.yaml
@@ -92,7 +92,7 @@ examples:
 
         usb@31100000 {
           compatible = "snps,dwc3";
-          reg =<0x00 0x31100000 0x00 0x50000>;
+          reg = <0x00 0x31100000 0x00 0x50000>;
           interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>, /* irq.0 */
                        <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>; /* irq.0 */
           interrupt-names = "host", "peripheral";
-- 
2.34.1

