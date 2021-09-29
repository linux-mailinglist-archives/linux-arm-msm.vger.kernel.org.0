Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6212641BDA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Sep 2021 05:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244068AbhI2Dow (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 23:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244060AbhI2Dou (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 23:44:50 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0101CC061746
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 20:43:10 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id t11so565312plq.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 20:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=abFTFmuowhNWr1sh/rZmGCZE7/q4bRx8HdmPJpdl9es=;
        b=tJvxk1DqNMcFK2RE/5ScJjAzsZvbhqkii1vOHmPUesraorVNGMf0TXD+QphpZCaiot
         +myZ8gCorzzu7r0elg42e5Zg27/7o7pjsE6OXtWVgupuJKClsGIqZfNueM6XQ9R1mCSM
         lgjy9BBFYww9zS+VPrB6SJC7DRkmMIEkwTu+Ra8OqNdykupByZG796qkdIP67AhqPTGI
         QEUJypHgGEvjWm0PIOBxlgAfyf/nt+ZU2sQPoW38+qtB6olJGcmaAEP1TqtM8EMUNBwR
         /EmFVFznqQ/F2FpjX6PYSaSx5N6a2iQS/QS0FQLdFWmtrLWU6oSQarESViCi8adLOMCH
         UMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=abFTFmuowhNWr1sh/rZmGCZE7/q4bRx8HdmPJpdl9es=;
        b=hzJqZEEZjREJ8VFtGgromw3FqjtwsknqKJI1q/5+8O/UhCNc5e14viuTrt6uX+2WGh
         OA6L7LSYIlB9d/SRBL5oDqV97WBxxBpjA1xDJ64yx3AyBMc5l9kDjSr/a4VCer70JP6Z
         wq0Mgys+p7sj/wOZnhN5L7ZDNaVvEzvLq60QNToR2zOVL58ul71FnGNGg16xJsuEOLc+
         UhV2VTkMZIuWKqWzslfSybaFEOnPLCOuRFdyyL+WmPDon+oMdkWVeO8qcOf+11+BPau/
         xspBmblCr99HtDAFyiAgm36b55uoFYp6pmywIok0QzqFN54jdOjur2V3KlMGiNqf9fPo
         9t1Q==
X-Gm-Message-State: AOAM533ca2pGvuEnEQMYz+8qvh+6fLgE0VL6H3ywsZ7Yx7PQfy+A2jL/
        ek0zmKRlCKF7x/VqmHCqFPiUqA==
X-Google-Smtp-Source: ABdhPJxX75SOgD5icVOwlMHV7sXoBhHdx5l7DdpEIlt6uxE8a0diYRPF7VpKCrCFYaETOCKfkMXWzQ==
X-Received: by 2002:a17:902:8c98:b0:13e:51d1:6fbd with SMTP id t24-20020a1709028c9800b0013e51d16fbdmr4595687plo.45.1632886989518;
        Tue, 28 Sep 2021 20:43:09 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id b7sm533032pfb.20.2021.09.28.20.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 20:43:09 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 02/10] dt-bindings: phy: qcom,qmp: IPQ6018 and IPQ8074 PCIe PHY require no supply
Date:   Wed, 29 Sep 2021 11:42:45 +0800
Message-Id: <20210929034253.24570-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210929034253.24570-1-shawn.guo@linaro.org>
References: <20210929034253.24570-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The qmp-phy driver suggests that 'vdda-phy-supply' and 'vdda-pll-supply'
are not required for IPQ6018 and IPQ8074 QMP PCIe PHY.  Update the
bindings to reflect it.

While at it, also correct the clock properies for IPQ8074 QMP PCIe PHY.
And as the result, 'qcom,ipq8074-qmp-pcie-phy' and
'qcom,ipq6018-qmp-pcie-phy' share the same clock, reset and supply
bindings.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 .../devicetree/bindings/phy/qcom,qmp-phy.yaml | 52 ++++++++++---------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index 604435e46623..ed62dde5f97d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -112,8 +112,6 @@ required:
   - clock-names
   - resets
   - reset-names
-  - vdda-phy-supply
-  - vdda-pll-supply
 
 additionalProperties: false
 
@@ -146,6 +144,9 @@ allOf:
           items:
             - const: phy
             - const: common
+      required:
+        - vdda-phy-supply
+        - vdda-pll-supply
   - if:
       properties:
         compatible:
@@ -172,6 +173,9 @@ allOf:
           items:
             - const: phy
             - const: common
+      required:
+        - vdda-phy-supply
+        - vdda-pll-supply
   - if:
       properties:
         compatible:
@@ -200,6 +204,9 @@ allOf:
             - const: phy
             - const: common
             - const: cfg
+      required:
+        - vdda-phy-supply
+        - vdda-pll-supply
   - if:
       properties:
         compatible:
@@ -229,6 +236,9 @@ allOf:
           items:
             - const: phy
             - const: common
+      required:
+        - vdda-phy-supply
+        - vdda-pll-supply
   - if:
       properties:
         compatible:
@@ -249,6 +259,9 @@ allOf:
         reset-names:
           items:
             - const: ufsphy
+      required:
+        - vdda-phy-supply
+        - vdda-pll-supply
   - if:
       properties:
         compatible:
@@ -274,34 +287,16 @@ allOf:
         reset-names:
           items:
             - const: ufsphy
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,ipq8074-qmp-pcie-phy
-    then:
-      properties:
-        clocks:
-          items:
-            - description: pipe clk.
-        clock-names:
-          items:
-            - const: pipe_clk
-        resets:
-          items:
-            - description: reset of phy block.
-            - description: phy common block reset.
-        reset-names:
-          items:
-            - const: phy
-            - const: common
+      required:
+        - vdda-phy-supply
+        - vdda-pll-supply
   - if:
       properties:
         compatible:
           contains:
             enum:
               - qcom,ipq6018-qmp-pcie-phy
+              - qcom,ipq8074-qmp-pcie-phy
     then:
       properties:
         clocks:
@@ -352,6 +347,9 @@ allOf:
         reset-names:
           items:
             - const: phy
+      required:
+        - vdda-phy-supply
+        - vdda-pll-supply
   - if:
       properties:
         compatible:
@@ -383,6 +381,9 @@ allOf:
           items:
             - const: phy
             - const: common
+      required:
+        - vdda-phy-supply
+        - vdda-pll-supply
   - if:
       properties:
         compatible:
@@ -410,6 +411,9 @@ allOf:
           items:
             - const: phy
             - const: common
+      required:
+        - vdda-phy-supply
+        - vdda-pll-supply
 
 examples:
   - |
-- 
2.17.1

