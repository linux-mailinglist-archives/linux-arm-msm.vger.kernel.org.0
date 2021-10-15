Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 074C342FDE7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 00:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238848AbhJOWNc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Oct 2021 18:13:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243288AbhJOWNb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Oct 2021 18:13:31 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5089C061764
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 15:11:23 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id l16-20020a9d6a90000000b0054e7ab56f27so14664886otq.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 15:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bjNfLq1QB8fLMEsBwBn7uXas0Vm/2KjKssKVAEdSfj8=;
        b=KvsCdlqRbTQxItKSMZiHq3p6Va9Qh3RKVjLBfVJ4SOznSPmvxDzk2kt99hpvY73VYt
         +zVIRzhpTR4g6JMbDOXMdjCFB0vmupv2QOjHMJNhblbhaTy2WG9MSkfncfOmL0h4Lpl9
         g3vresA3V5A0p+v7OaO7R5sLYMhcvbysuFXBk1k/JN09Vsq9vj3AqK4+UnnnX6t1h147
         UDPPpWQQloLjakwbY4hq84Fzch5En+LAHAP1IbI35RnmIruI9uJcg2IQsh42yX+qtY5L
         GP1eJIVO8IouIkTvBldYf8UkUS5qRrfliGNu6DOpGHcfTPc1zwSPTLdVyC7mWZXLMDhl
         24RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bjNfLq1QB8fLMEsBwBn7uXas0Vm/2KjKssKVAEdSfj8=;
        b=wsPF0/IoG0oAPtRazgLXr2gEbrG4d4lW7fYAlJFLcK6DnQMLOvuEm2Yl4LlNMCs3L9
         B18Hw2WszVA1TjZAQ5/9wNfmRBT7WJgmF1gxGu7VjTPAIg7dUqUwWwbkReaJoQwyYhoU
         mHMveWN1nbbC5M44YK1r5Ws+m3crAyYYSB0jvu2iKJ1oAQaFD2JssX3EFu+Ov+wt/Yqz
         ZBb0GlD+pDSDTgLVyJlp8FhnCkL1wAkTUx930O9ixFN3tFhVvG21SjnkMwAylkamfA0Q
         ku+E8XaSbzhMXTbIA0U2IHOtJq/tb5aGS4YoSQP4UOGWdcKrPOB2I1eArKuHQqKaPzfG
         TQjQ==
X-Gm-Message-State: AOAM531I6xsmjr87A4OcK7Bfynl7TRATeWcPg2CCJmJbqLkZXx0WmvX4
        DD7t0QoI6bu5aWopbcP9SexIvQ==
X-Google-Smtp-Source: ABdhPJzXC14+f95z1L9QMi3O+ePps8LkjmJida0VipaUCsJGioxCOn1qwVYVKGBFEFjwPVeB8Xlzsg==
X-Received: by 2002:a05:6830:30a4:: with SMTP id g4mr10125929ots.312.1634335883234;
        Fri, 15 Oct 2021 15:11:23 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id f10sm1599635otc.26.2021.10.15.15.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:11:22 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        abhinavk@codeaurora.org, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: phy: Introduce Qualcomm eDP/DP PHY binding
Date:   Fri, 15 Oct 2021 15:13:11 -0700
Message-Id: <20211015221312.1699043-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce a binding for the eDP/DP PHY hardware block found in several
different Qualcomm platforms.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 .../devicetree/bindings/phy/qcom,edp-phy.yaml | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
new file mode 100644
index 000000000000..c258e4f7e332
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm DP/eDP PHY
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description:
+  The Qualcomm DP/eDP PHY is found in a number of Qualcomm platform and
+  provides the physical interface for DisplayPort and Embedded Display Port.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sc8180x-dp-phy
+      - qcom,sc8180x-edp-phy
+
+  reg:
+    items:
+      - description: PHY base register block
+      - description: tx0 register block
+      - description: tx1 register block
+      - description: PLL register block
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: aux
+      - const: cfg_ahb
+
+  "#clock-cells":
+    const: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#clock-cells"
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@aec2a00 {
+      compatible = "qcom,sc8180x-edp-phy";
+      reg = <0x0aec2a00 0x1c0>,
+            <0x0aec2200 0xa0>,
+            <0x0aec2600 0xa0>,
+            <0x0aec2000 0x19c>;
+
+      clocks = <&dispcc 0>, <&dispcc 1>;
+      clock-names = "aux", "cfg_ahb";
+
+      #clock-cells = <1>;
+      #phy-cells = <0>;
+    };
+...
-- 
2.29.2

