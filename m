Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4521746E983
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 14:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238274AbhLIOAv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 09:00:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231816AbhLIOAv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 09:00:51 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85A22C0617A1
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Dec 2021 05:57:17 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id a18so9842077wrn.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Dec 2021 05:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=INUpPFFgEt5pw9ophBKKAQ7IapQv4sE23ioeoEBE0OY=;
        b=yTYRX1BSqSSSdFgijh0cLEViDk4dB5eLUObNtmJczcLpYCTsB2VrlnSkNskPDGqKl8
         0IHz+0IJ6pwtvPRswOw77ZDR+njkaIcb7ehm+t6kSZPIwUAeujBerNUGFVQiLhScPo9k
         +7DwBG0QqP7eDyf7Wbj+hllerKIszULRjDow+uEDM8IiOX3mKVozkR+qSORtJEHKLKDv
         eRiUGWuNZcNZWzGXdK4Z/il74NkyoIl3+CONRd3UR8vzuN4OBTHEWNLG2fM9MBo4E/uB
         kpI3rzWWbhTZMDFo7dwgITzGwvAuiY4GAHbK4DHe0fv4vhzYVkbOFHQ8dbzdg8Y0RX6+
         T8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=INUpPFFgEt5pw9ophBKKAQ7IapQv4sE23ioeoEBE0OY=;
        b=t6Mq1bHUpwJ9ttzEU7A/7mY9ccH0no8AZd53BwLvId8/pNxUJyvr0VMORXLqCEYFL2
         xi89MWgBaEIMwhTeFAwdU476IeZwppOv5XYwQQI7YWhnrG2nNFFun8kWKakHrL+pHGZz
         ik4qAZ4IdtVd3wH6DH2n285rgItTXH98EJJqg/+F+Ld4+1Uz8D9SKT4PbWNZQchvToyA
         fq+a0Y7xxhg7YrvAaM0ZDFlFGCqdYhWLFXHpHfMENhcEYyYX3XsXjZYLH8jkr+nZ6Ov9
         Vbxj0aSPfeOFZL+dHX99MzOgHIiVLp0dkoxLBBcASfuVfd3cO8K7OXfmCa/jK/VM79h4
         GZkw==
X-Gm-Message-State: AOAM533Kj4/sLaR0TgWaMHek4E2bgjry1tR1u1Gj8aVHE+r5az6/5EsG
        VWVyOzNFiTGpb6xASkOGKFczSA==
X-Google-Smtp-Source: ABdhPJyteSOjZHYvMVrscybKNvrFHSauqZNNp92GwrEYHMpr8Q7vb/TI6ndQLPx5MNNvHshkcb3ZhA==
X-Received: by 2002:a05:6000:156a:: with SMTP id 10mr6554478wrz.87.1639058236017;
        Thu, 09 Dec 2021 05:57:16 -0800 (PST)
Received: from localhost.localdomain ([88.160.176.23])
        by smtp.gmail.com with ESMTPSA id d15sm7919295wri.50.2021.12.09.05.57.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Dec 2021 05:57:15 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, shawn.guo@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 2/2] dt-bindings: clock: Add qualcomm QCM2290 DISPCC bindings
Date:   Thu,  9 Dec 2021 15:09:11 +0100
Message-Id: <1639058951-12660-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1639058951-12660-1-git-send-email-loic.poulain@linaro.org>
References: <1639058951-12660-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for display clock controller on QCM2290 SoCs.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: no change

 .../bindings/clock/qcom,qcm2290-dispcc.yaml        | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
new file mode 100644
index 00000000..44d5ce7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,qcm2290-dispcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display Clock & Reset Controller Binding for qcm2290
+
+maintainers:
+  - Loic Poulain <loic.poulain@linaro.org>
+
+description: |
+  Qualcomm display clock control module which supports the clocks, resets and
+  power domains on qcm2290.
+
+  See also dt-bindings/clock/qcom,dispcc-qcm2290.h.
+
+properties:
+  compatible:
+    const: qcom,qcm2290-dispcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board active-only XO source
+      - description: GPLL0 source from GCC
+      - description: GPLL0 div source from GCC
+      - description: Byte clock from DSI PHY
+      - description: Pixel clock from DSI PHY
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+      - const: bi_tcxo_ao
+      - const: gcc_disp_gpll0_clk_src
+      - const: gcc_disp_gpll0_div_clk_src
+      - const: dsi0_phy_pll_out_byteclk
+      - const: dsi0_phy_pll_out_dsiclk
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    clock-controller@5f00000 {
+            compatible = "qcom,qcm2290-dispcc";
+            reg = <0x5f00000 0x20000>;
+            clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+                     <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
+                     <&gcc GCC_DISP_GPLL0_CLK_SRC>,
+                     <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
+                     <&dsi0_phy 0>,
+                     <&dsi0_phy 1>;
+            clock-names = "bi_tcxo",
+                          "bi_tcxo_ao",
+                          "gcc_disp_gpll0_clk_src",
+                          "gcc_disp_gpll0_div_clk_src",
+                          "dsi0_phy_pll_out_byteclk",
+                          "dsi0_phy_pll_out_dsiclk";
+            #clock-cells = <1>;
+            #reset-cells = <1>;
+            #power-domain-cells = <1>;
+    };
+...
-- 
2.7.4

