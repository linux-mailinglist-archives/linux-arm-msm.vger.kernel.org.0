Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F07A53F5753
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Aug 2021 06:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbhHXEfb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Aug 2021 00:35:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbhHXEfa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Aug 2021 00:35:30 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D8FC061757
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 21:34:47 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id n12so11492661plf.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 21:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WlARBdCH0G+Q0Gto74EDeCNkdp2jkLi1fyvWJUCNQck=;
        b=i8mgH6afafIWcLr3/bxaHLNd22F+f+UHMMkbxKDu04L958bJB5GpP8mRswRU/xNlom
         w3Gpve+ZyVC+0BAsueL4vTkJdnooN2IvconYPiA645UTs0xKuNT5nI9A0TYOr8U40Tob
         mykXu38kKpwZoooU2guS8trQYzxUrkwBLpULyytM5chbT29hKjCWShmlV82aGvGhLFKl
         Q8jNLQx8lcgy67aXUPTTCfpmZ2Lt+ivroWp5VO5EJijLkhzFxFxPbHxxzcO8l0vKqbt8
         mCq8lH4ri0qMbCXEqCAwBUZHEIJ/0WSwD5HYQMUUzLdUCXs0eDTz4fKVnIWzf4MxH/aj
         4ANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WlARBdCH0G+Q0Gto74EDeCNkdp2jkLi1fyvWJUCNQck=;
        b=NziZda/x8e4d7tmX7jnIszkWeTogv9z6WiCFFb/bzn1g4pnTzdIC8zAAsyLus8mwC3
         cqGs1Uq0XBHYdpWM0R7qfz8xU5o0F8YAGZMFmExmCyoUltXqXM30h+cSzCvzzIfaNPpD
         VO+mwrZbScyXi36h2dgp08zddzQB0xfaMWndrGHiykogpE9NEnWt/pgkTdtBjHqeBQ9s
         aWT9ySgNj4rwT/Q2QuZaPLqL7JZH2TKhcX77YpFPwlHAqiO5wHLm65lkmIJkKciBf2Q4
         T98E5LtwhMk/BeEqs8h/f+v7QoO1VCpXGiL46ui36/GfvzV9CAs+b79exStEJeVqQGtv
         7Q/Q==
X-Gm-Message-State: AOAM533QqPsmcRQaYidDKHr8TOLTJA/OUBnr+F9mkQfRZRKTU4xHSClq
        u6WOTzGTpkrOgltqiCx+9ql1Uw==
X-Google-Smtp-Source: ABdhPJy/k9e4jPmt414tRt8dqF8IDjfHZOzJ8yKQ+opLJIqljmM6+E3fNmAG2J3sBCocbtw8625Hfw==
X-Received: by 2002:a17:903:31d6:b0:133:9932:6998 with SMTP id v22-20020a17090331d600b0013399326998mr9449165ple.45.1629779686991;
        Mon, 23 Aug 2021 21:34:46 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id p10sm789401pjv.39.2021.08.23.21.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 21:34:46 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Georgi Djakov <djakov@kernel.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 1/3] dt-bindings: interconnect: sdm660: Add missing a2noc qos clocks
Date:   Tue, 24 Aug 2021 12:34:33 +0800
Message-Id: <20210824043435.23190-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210824043435.23190-1-shawn.guo@linaro.org>
References: <20210824043435.23190-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It adds the missing a2noc clocks required for QoS registers programming
per downstream kernel[1].

[1] https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/sdm660-bus.dtsi?h=LA.UM.8.2.r1-04800-sdm660.0#n43

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 .../bindings/interconnect/qcom,sdm660.yaml    | 46 +++++++++++++++++--
 1 file changed, 42 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sdm660.yaml b/Documentation/devicetree/bindings/interconnect/qcom,sdm660.yaml
index 29de7807df54..bcd41e491f1d 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,sdm660.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,sdm660.yaml
@@ -31,11 +31,11 @@ properties:
 
   clocks:
     minItems: 1
-    maxItems: 3
+    maxItems: 7
 
   clock-names:
     minItems: 1
-    maxItems: 3
+    maxItems: 7
 
 required:
   - compatible
@@ -72,6 +72,32 @@ allOf:
           contains:
             enum:
               - qcom,sdm660-a2noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Bus Clock.
+            - description: Bus A Clock.
+            - description: IPA Clock.
+            - description: UFS AXI Clock.
+            - description: Aggregate2 UFS AXI Clock.
+            - description: Aggregate2 USB3 AXI Clock.
+            - description: Config NoC USB2 AXI Clock.
+        clock-names:
+          items:
+            - const: bus
+            - const: bus_a
+            - const: ipa
+            - const: ufs_axi
+            - const: aggre2_ufs_axi
+            - const: aggre2_usb3_axi
+            - const: cfg_noc_usb2_axi
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
               - qcom,sdm660-bimc
               - qcom,sdm660-cnoc
               - qcom,sdm660-gnoc
@@ -91,6 +117,7 @@ examples:
   - |
       #include <dt-bindings/clock/qcom,rpmcc.h>
       #include <dt-bindings/clock/qcom,mmcc-sdm660.h>
+      #include <dt-bindings/clock/qcom,gcc-sdm660.h>
 
       bimc: interconnect@1008000 {
               compatible = "qcom,sdm660-bimc";
@@ -123,9 +150,20 @@ examples:
               compatible = "qcom,sdm660-a2noc";
               reg = <0x01704000 0xc100>;
               #interconnect-cells = <1>;
-              clock-names = "bus", "bus_a";
+              clock-names = "bus",
+                            "bus_a",
+                            "ipa",
+                            "ufs_axi",
+                            "aggre2_ufs_axi",
+                            "aggre2_usb3_axi",
+                            "cfg_noc_usb2_axi";
               clocks = <&rpmcc RPM_SMD_AGGR2_NOC_CLK>,
-                       <&rpmcc RPM_SMD_AGGR2_NOC_A_CLK>;
+                       <&rpmcc RPM_SMD_AGGR2_NOC_A_CLK>,
+                       <&rpmcc RPM_SMD_IPA_CLK>,
+                       <&gcc GCC_UFS_AXI_CLK>,
+                       <&gcc GCC_AGGRE2_UFS_AXI_CLK>,
+                       <&gcc GCC_AGGRE2_USB3_AXI_CLK>,
+                       <&gcc GCC_CFG_NOC_USB2_AXI_CLK>;
       };
 
       mnoc: interconnect@1745000 {
-- 
2.17.1

