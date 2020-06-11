Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A61A1F6AC2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2020 17:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728465AbgFKPSj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 11:18:39 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:37719 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728455AbgFKPSj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 11:18:39 -0400
Received: by mail-io1-f67.google.com with SMTP id r2so6714818ioo.4;
        Thu, 11 Jun 2020 08:18:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qewf9D0YCS3J7N1tva5v2BWLcm4vmSaFS/uNfMsMQOA=;
        b=bojqiPx8fRYVI3oWEjkt2yGvM+7kPfxfB2STpytXlYupemo+LuEYoMMVn3WE4S2Lwz
         z+S7mpmR+id0AJzkzj3CYkhZ6SUtVce5q5S2uUnajFGJCN1ow2FxK0/fjPK1Amz9Q7i/
         4ihoWlNMl0/pDm7dwow+YwDQ3ydO4nnzkMEBAQzg1KDUhloPVp04e8vA7sXoJRxqXflG
         UB2YmNdQQ1qHJM/9dwm1e6YwxJqNQ5mZnikehH9LPull04ednQK1cks5GLMCOOlPMixO
         l1BtnREL2ifRK0fkYfJe14qlshRxFRtAZgXoH565jteCqgbqlrVqX1bx3DIdCxyjLfFv
         pWuQ==
X-Gm-Message-State: AOAM530lJ++j+uAZL1Jtpxqwa7E3X80AuCUC02JcrQW5U57IOIjvY4u6
        YPw3cxMsffM2O7ZWltWVo36ZYUg=
X-Google-Smtp-Source: ABdhPJyXSOEN50P1Ie0dxxhGQGFYjfCC/pbXW+7eha3EnGyI7HKavpUGqp8H/wYn/GK7u+yOFoyeZA==
X-Received: by 2002:a5d:8e19:: with SMTP id e25mr9187308iod.36.1591888717457;
        Thu, 11 Jun 2020 08:18:37 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.251])
        by smtp.googlemail.com with ESMTPSA id b22sm1611332ios.21.2020.06.11.08.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 08:18:37 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] dt-bindings: phy: qcom: Fix missing 'ranges' and example addresses
Date:   Thu, 11 Jun 2020 09:18:35 -0600
Message-Id: <20200611151835.1100883-1-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The QCom QMP PHY bindings have child nodes with translatable (MMIO)
addresses, so a 'ranges' property is required in the parent node.
Additionally, the examples default to 1 address and size cell, so let's
fix that, too.

Fixes: ccf51c1cedfd ("dt-bindings: phy: qcom,qmp: Convert QMP PHY bindings to yaml")
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Manu Gautam <mgautam@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
I'll take this via the DT tree for rc1.

 .../devicetree/bindings/phy/qcom,qmp-phy.yaml | 20 ++++++----
 .../bindings/phy/qcom,qmp-usb3-dp-phy.yaml    | 38 ++++++++++---------
 2 files changed, 33 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index 973b2d196f46..f80f8896d527 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -44,6 +44,8 @@ properties:
   "#size-cells":
     enum: [ 1, 2 ]
 
+  ranges: true
+
   clocks:
     minItems: 1
     maxItems: 4
@@ -87,6 +89,7 @@ required:
   - "#clock-cells"
   - "#address-cells"
   - "#size-cells"
+  - ranges
   - clocks
   - clock-names
   - resets
@@ -281,10 +284,11 @@ examples:
     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
     usb_2_qmpphy: phy-wrapper@88eb000 {
         compatible = "qcom,sdm845-qmp-usb3-uni-phy";
-        reg = <0 0x088eb000 0 0x18c>;
+        reg = <0x088eb000 0x18c>;
         #clock-cells = <1>;
-        #address-cells = <2>;
-        #size-cells = <2>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x088eb000 0x2000>;
 
         clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK >,
                  <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
@@ -299,11 +303,11 @@ examples:
         vdda-phy-supply = <&vdda_usb2_ss_1p2>;
         vdda-pll-supply = <&vdda_usb2_ss_core>;
 
-        usb_2_ssphy: phy@88eb200 {
-                reg = <0 0x088eb200 0 0x128>,
-                      <0 0x088eb400 0 0x1fc>,
-                      <0 0x088eb800 0 0x218>,
-                      <0 0x088eb600 0 0x70>;
+        usb_2_ssphy: phy@200 {
+                reg = <0x200 0x128>,
+                      <0x400 0x1fc>,
+                      <0x800 0x218>,
+                      <0x600 0x70>;
                 #clock-cells = <0>;
                 #phy-cells = <0>;
                 clocks = <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
index b770e637df1d..6e2487501457 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
@@ -34,6 +34,8 @@ properties:
   "#size-cells":
     enum: [ 1, 2 ]
 
+  ranges: true
+
   clocks:
     items:
       - description: Phy aux clock.
@@ -86,6 +88,7 @@ required:
   - "#clock-cells"
   - "#address-cells"
   - "#size-cells"
+  - ranges
   - clocks
   - clock-names
   - resets
@@ -100,12 +103,13 @@ examples:
     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
     usb_1_qmpphy: phy-wrapper@88e9000 {
         compatible = "qcom,sdm845-qmp-usb3-phy";
-        reg = <0 0x088e9000 0 0x18c>,
-              <0 0x088e8000 0 0x10>;
+        reg = <0x088e9000 0x18c>,
+              <0x088e8000 0x10>;
         reg-names = "reg-base", "dp_com";
         #clock-cells = <1>;
-        #address-cells = <2>;
-        #size-cells = <2>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x088e9000 0x1000>;
 
         clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
                  <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
@@ -120,17 +124,17 @@ examples:
         vdda-phy-supply = <&vdda_usb2_ss_1p2>;
         vdda-pll-supply = <&vdda_usb2_ss_core>;
 
-        usb_1_ssphy: phy@88e9200 {
-                reg = <0 0x088e9200 0 0x128>,
-                      <0 0x088e9400 0 0x200>,
-                      <0 0x088e9c00 0 0x218>,
-                      <0 0x088e9600 0 0x128>,
-                      <0 0x088e9800 0 0x200>,
-                      <0 0x088e9a00 0 0x100>;
-                #clock-cells = <0>;
-                #phy-cells = <0>;
-                clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
-                clock-names = "pipe0";
-                clock-output-names = "usb3_phy_pipe_clk_src";
-            };
+        phy@200 {
+            reg = <0x200 0x128>,
+                  <0x400 0x200>,
+                  <0xc00 0x218>,
+                  <0x600 0x128>,
+                  <0x800 0x200>,
+                  <0xa00 0x100>;
+            #clock-cells = <0>;
+            #phy-cells = <0>;
+            clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+            clock-names = "pipe0";
+            clock-output-names = "usb3_phy_pipe_clk_src";
         };
+    };
-- 
2.25.1

