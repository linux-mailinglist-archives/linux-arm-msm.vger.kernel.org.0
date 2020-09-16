Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFFFA26CF5D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 01:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgIPXNi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 19:13:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbgIPXMH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 19:12:07 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15E1BC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 16:12:06 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id s14so1968288pju.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 16:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=81p7+yZhOC19karpCT36EA8EczbSyI7n2JwiT6I3I5o=;
        b=nxNHW0ENNHgzSW/k9RNdi23ksGkQcvNDP4Y1yhqLNVZx1cw3WWoBUW08x6RuHMMX9j
         MLiM0i+vQv8lycpxY/YoFMPfHWcCPRiAnRtlc2ovoFNL4xjfJ+AIGI3XvV2xxdiXFd2P
         uI8EvFy9kQKPu6TNvKvJlxKUc5r9LlIgYyNLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=81p7+yZhOC19karpCT36EA8EczbSyI7n2JwiT6I3I5o=;
        b=LS3YqYOKSb3yh8ZnpozKIaaRDXsXh9kl+GFK2rkMHlAAkwqlnh8FlVDXzPPwkDuRin
         9XI+nxMoXT7T+dCmRCgMu1v8fAC/dJP3a/Wo36eujYzc4W/2n7BrmsXeRNvyJg7aGLMm
         PrrcCuzoSqYFG5A+Vk8g5Ic73geC4iIPiZzOOfKD4TIsKJOqSyufh3eh+HgPNtY107bz
         MeC25pJPfZOJ0z9jjJK8SjOyFqH3vF4obsozbWAjt91fLAKZXOX2+emTCFBp6Iub5j8h
         0rNTgyGzyl4uyX0JtQ1Kl6/0r+q67T0xX0gjqpoWiwiJM167v5KTrJC0tkndwzSsu3Bd
         LxUg==
X-Gm-Message-State: AOAM532H6pYr8egN2U3EZLY1HS3zBNzvVPnj8RedMD9eqtbUJXq7QA6s
        8Vxw7R9auIc1V3tesO1AW62lvw==
X-Google-Smtp-Source: ABdhPJxDEI+n0NncCCwY/Zj3xmtOi9fBOH5lbXRFRHszW3OL7lS4R45LhX5UIlbym9d64H8mzre6EQ==
X-Received: by 2002:a17:90a:1903:: with SMTP id 3mr5996818pjg.74.1600297926192;
        Wed, 16 Sep 2020 16:12:06 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id u6sm3643254pjy.37.2020.09.16.16.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 16:12:05 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH v4 01/10] dt-bindings: phy: qcom,qmp-usb3-dp: Add DP phy information
Date:   Wed, 16 Sep 2020 16:11:53 -0700
Message-Id: <20200916231202.3637932-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
In-Reply-To: <20200916231202.3637932-1-swboyd@chromium.org>
References: <20200916231202.3637932-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This binding only describes the USB phy inside the USB3 + DP "combo"
phy. Add information for the DP phy and describe the sub-nodes that
represent the DP and USB3 phys that exist inside the combo wrapper.
Remove reg-names from required properties because it isn't required nor
used by the kernel driver.

Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
Cc: Chandan Uddaraju <chandanu@codeaurora.org>
Cc: Vara Reddy <varar@codeaurora.org>
Cc: Tanmay Shah <tanmay@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Manu Gautam <mgautam@codeaurora.org>
Cc: Sandeep Maheswaram <sanm@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: <devicetree@vger.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Rob Clark <robdclark@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../bindings/phy/qcom,qmp-usb3-dp-phy.yaml    | 95 ++++++++++++++++---
 1 file changed, 84 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
index ef8ae9f73092..33974ad10afe 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
@@ -13,17 +13,21 @@ maintainers:
 properties:
   compatible:
     enum:
+      - qcom,sc7180-qmp-usb3-dp-phy
       - qcom,sc7180-qmp-usb3-phy
+      - qcom,sdm845-qmp-usb3-dp-phy
       - qcom,sdm845-qmp-usb3-phy
   reg:
     items:
-      - description: Address and length of PHY's common serdes block.
+      - description: Address and length of PHY's USB serdes block.
       - description: Address and length of the DP_COM control block.
+      - description: Address and length of PHY's DP serdes block.
 
   reg-names:
     items:
-      - const: reg-base
+      - const: usb
       - const: dp_com
+      - const: dp
 
   "#clock-cells":
     enum: [ 1, 2 ]
@@ -74,16 +78,74 @@ properties:
 
 #Required nodes:
 patternProperties:
-  "^phy@[0-9a-f]+$":
+  "^usb3-phy@[0-9a-f]+$":
     type: object
     description:
-      Each device node of QMP phy is required to have as many child nodes as
-      the number of lanes the PHY has.
+      The USB3 PHY.
+
+    properties:
+      reg:
+        items:
+          - description: Address and length of TX.
+          - description: Address and length of RX.
+          - description: Address and length of PCS.
+          - description: Address and length of TX2.
+          - description: Address and length of RX2.
+          - description: Address and length of pcs_misc.
+
+      clocks:
+        items:
+          - description: pipe clock
+
+      clock-names:
+        items:
+          - const: pipe0
+
+      clock-output-names:
+        items:
+          - const: usb3_phy_pipe_clk_src
+
+      '#clock-cells':
+        const: 0
+
+      '#phy-cells':
+        const: 0
+
+    required:
+      - reg
+      - clocks
+      - clock-names
+      - '#clock-cells'
+      - '#phy-cells'
+
+  "^dp-phy@[0-9a-f]+$":
+    type: object
+    description:
+      The DP PHY.
+
+    properties:
+      reg:
+        items:
+          - description: Address and length of TX.
+          - description: Address and length of RX.
+          - description: Address and length of PCS.
+          - description: Address and length of TX2.
+          - description: Address and length of RX2.
+
+      '#clock-cells':
+        const: 1
+
+      '#phy-cells':
+        const: 0
+
+    required:
+      - reg
+      - '#clock-cells'
+      - '#phy-cells'
 
 required:
   - compatible
   - reg
-  - reg-names
   - "#clock-cells"
   - "#address-cells"
   - "#size-cells"
@@ -101,14 +163,15 @@ examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
     usb_1_qmpphy: phy-wrapper@88e9000 {
-        compatible = "qcom,sdm845-qmp-usb3-phy";
+        compatible = "qcom,sdm845-qmp-usb3-dp-phy";
         reg = <0x088e9000 0x18c>,
-              <0x088e8000 0x10>;
-        reg-names = "reg-base", "dp_com";
+              <0x088e8000 0x10>,
+              <0x088ea000 0x40>;
+        reg-names = "usb", "dp_com", "dp";
         #clock-cells = <1>;
         #address-cells = <1>;
         #size-cells = <1>;
-        ranges = <0x0 0x088e9000 0x1000>;
+        ranges = <0x0 0x088e9000 0x2000>;
 
         clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
                  <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
@@ -123,7 +186,7 @@ examples:
         vdda-phy-supply = <&vdda_usb2_ss_1p2>;
         vdda-pll-supply = <&vdda_usb2_ss_core>;
 
-        phy@200 {
+        usb3-phy@200 {
             reg = <0x200 0x128>,
                   <0x400 0x200>,
                   <0xc00 0x218>,
@@ -136,4 +199,14 @@ examples:
             clock-names = "pipe0";
             clock-output-names = "usb3_phy_pipe_clk_src";
         };
+
+        dp-phy@88ea200 {
+            reg = <0xa200 0x200>,
+                  <0xa400 0x200>,
+                  <0xaa00 0x200>,
+                  <0xa600 0x200>,
+                  <0xa800 0x200>;
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+        };
     };
-- 
Sent by a computer, using git, on the internet

