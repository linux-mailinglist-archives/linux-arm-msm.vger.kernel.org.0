Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F481263AA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 04:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730624AbgIJCiw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Sep 2020 22:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730629AbgIJCII (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Sep 2020 22:08:08 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EE71C061358
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2020 17:49:06 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id d19so67109pld.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2020 17:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gbp5El4soX0C+z5m/RfNuwNwoyYLjPi9BYBBMtXuagI=;
        b=YnVaEwNWE04/qKnEH3GPtGIsOyarRr+pjd3r6DnJAnGIUasut5Q5KzzCacETsTql7z
         tIJh8GGCblJiCJgWOL/dR2LQ9uPSdtGuG98213yGcoN573Fqhowyb65/3r0e6MSjnGem
         QpFwPTr6M/d+nyHFyWCdadvmccgM7OskSBy4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gbp5El4soX0C+z5m/RfNuwNwoyYLjPi9BYBBMtXuagI=;
        b=KigPfgyzVTt3aXy5GVFZFex/HajTC1bTd20GVrEq6uQf13bWUuwvll9it6WXQYAvh7
         S0HpyhJdI5lELnwIIVrdjgN23SU+1lfwarWxeQ8jqg3O1Qsg9DLKPssSYnm0F1fQfH4d
         e42X7xT4ND9nS/Bh12xHgODSMNmJrBIL6mo85lD+A/g3O2qjoRyPKGYdF5dlLin50B1L
         nzsEp3aSORJTlR6WU00DllkC0OPVtBaBAs3lxkfZNVlFraWmViN1hVuB1HQvVm3T4i9j
         SM1n1lv1K293iFBt6gp4zII6z4gYXBohTT0/sUup0FstD5oABPpEDDL27ds3h5VcAEhl
         +FOA==
X-Gm-Message-State: AOAM530N9QfxOTGn8phkp9NEmVvbKJEVpOXrE9XjGcI9NcfkO1phbjk7
        bjU7ptmc1UCrLTA6q4z/W8s/cQ==
X-Google-Smtp-Source: ABdhPJxQlkMNF9bBiBU9hk9zmJeLgnKLfUNce+PpxbkK2vWplfdNiVTww7excDXjEoVorhhVHuuERw==
X-Received: by 2002:a17:902:be0b:: with SMTP id r11mr3336537pls.84.1599698945850;
        Wed, 09 Sep 2020 17:49:05 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id c7sm3899050pfj.100.2020.09.09.17.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 17:49:05 -0700 (PDT)
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
Subject: [PATCH v3 01/10] dt-bindings: phy: qcom,qmp-usb3-dp: Add DP phy information
Date:   Wed,  9 Sep 2020 17:48:53 -0700
Message-Id: <20200910004902.2252694-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
In-Reply-To: <20200910004902.2252694-1-swboyd@chromium.org>
References: <20200910004902.2252694-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
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
 .../bindings/phy/qcom,qmp-usb3-dp-phy.yaml    | 91 +++++++++++++++++--
 1 file changed, 81 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
index ef8ae9f73092..4154f5748d39 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
@@ -17,13 +17,15 @@ properties:
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
@@ -74,16 +76,74 @@ properties:
 
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
@@ -103,12 +163,13 @@ examples:
     usb_1_qmpphy: phy-wrapper@88e9000 {
         compatible = "qcom,sdm845-qmp-usb3-phy";
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
@@ -123,7 +184,7 @@ examples:
         vdda-phy-supply = <&vdda_usb2_ss_1p2>;
         vdda-pll-supply = <&vdda_usb2_ss_core>;
 
-        phy@200 {
+        usb3-phy@200 {
             reg = <0x200 0x128>,
                   <0x400 0x200>,
                   <0xc00 0x218>,
@@ -136,4 +197,14 @@ examples:
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

