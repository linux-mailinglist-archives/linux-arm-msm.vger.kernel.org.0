Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE45A540024
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 15:35:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244806AbiFGNfZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 09:35:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244780AbiFGNfY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 09:35:24 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5864AC6847
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 06:35:21 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id m20so35188697ejj.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 06:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rEEFwb3oB6edXdLTltHDejyT72ppuJHFYFe2MWg11vg=;
        b=bIMjQj29IXUlWVJWuZoBrJbhkXJO/lJL14jsX7JUB+41BhUq7+HsxquSf57k2tT626
         8R9TPXdmTFSAxYlvpyxaWpphgpBkF7DA3OdopeMFpjfCJj+D9jRmYW/BwAxIFg6oU8H/
         ykMoelXY5JuoVEAGTyKI/oJ0h476uMUs1vvUa7zhN51g6R0jualc4p/GJUdCTjXVUZBD
         6n+L8SfTlkVr8yGiYsKi/4I0tA5u1+PIScUdPQ1UteiBbAVjLbGTCBd1itI8uWt7oToO
         iT6h9mvLq0BsXTTbNyFlntd41ibrlhRT2W8o+4jKIPr2azFqGTTBWtctdIiZpSqSbJ8+
         UF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rEEFwb3oB6edXdLTltHDejyT72ppuJHFYFe2MWg11vg=;
        b=6WBaeiOVkfP0Ug/NDaDRKN/EBrfV4NRT4ngIWgr0i2se64ZhR9Uo4QDoos9Qe5oszk
         WZcoa89MOsQ0L/E3+NHlm8g6+yqgNN+pBcuvNa9Iho27NdHWMebox0k5fkmUlxNVWAiR
         nOJojU+5MWDZ6q4aZ+aji+prskMvg2kpzJm0oc3V9CMlgStHhH4aLN662gws9Wrh8yjn
         fjB2tTwz1RdD2iJ3SlVozdFPGjCGMncrvwR8jACeEtcA5oAhd5E8hSxEjMd7AW617+jO
         EM5WJck/xDTVi2zAX8/rnTQkTgR10XhJeYONcrE1oo8ktv0FOsVAfB5mbbiST7f9bDs6
         ffhA==
X-Gm-Message-State: AOAM532ASi6dADnCYXpNeydTQ5TEYIUJsuhZFnvhLj+ftLA2kNFWrq5c
        m/cQSLqrw6OkxZ3kiSvhTsosTw==
X-Google-Smtp-Source: ABdhPJxv4p97hVWx1ZCcLvuuZi+pfqT+8mSLYG+g5JynKNhp5Fb/tpKxruM8YdTd5zyvHh0QHk4VEA==
X-Received: by 2002:a17:907:2cc3:b0:6fa:55f:8805 with SMTP id hg3-20020a1709072cc300b006fa055f8805mr26558728ejc.46.1654608919887;
        Tue, 07 Jun 2022 06:35:19 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b23-20020a17090630d700b0070e1adff390sm5644204ejb.34.2022.06.07.06.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 06:35:19 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: mfd: qcom,tcsr: Convert to dtschema
Date:   Tue,  7 Jun 2022 15:34:42 +0200
Message-Id: <20220607133443.182468-1-krzysztof.kozlowski@linaro.org>
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

Convert the Qualcomm Top Control and Status Register to DT Schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/mfd/qcom,tcsr.txt     | 24 ---------
 .../devicetree/bindings/mfd/qcom,tcsr.yaml    | 49 +++++++++++++++++++
 2 files changed, 49 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/qcom,tcsr.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.txt b/Documentation/devicetree/bindings/mfd/qcom,tcsr.txt
deleted file mode 100644
index add61bcc3c74..000000000000
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-QCOM Top Control and Status Register
-
-Qualcomm devices have a set of registers that provide various control and status
-functions for their peripherals.  This node is intended to allow access to these
-registers via syscon.
-
-Required properties:
-- compatible:	Should contain:
-		"qcom,tcsr-ipq6018", "syscon", "simple-mfd" for IPQ6018
-		"qcom,tcsr-ipq8064", "syscon" for IPQ8064
-		"qcom,tcsr-apq8064", "syscon" for APQ8064
-		"qcom,tcsr-msm8660", "syscon" for MSM8660
-		"qcom,tcsr-msm8953", "syscon" for MSM8953
-		"qcom,tcsr-msm8960", "syscon" for MSM8960
-		"qcom,tcsr-msm8974", "syscon" for MSM8974
-		"qcom,tcsr-apq8084", "syscon" for APQ8084
-		"qcom,tcsr-msm8916", "syscon" for MSM8916
-- reg: Address range for TCSR registers
-
-Example:
-	tcsr: syscon@1a400000 {
-		compatible = "qcom,tcsr-msm8960", "syscon";
-		reg = <0x1a400000 0x100>;
-	};
diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
new file mode 100644
index 000000000000..428973f97a72
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/qcom,tcsr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Top Control and Status Register
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description:
+  Qualcomm devices have a set of registers that provide various control and
+  status functions for their peripherals.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - qcom,tcsr-apq8064
+              - qcom,tcsr-apq8084
+              - qcom,tcsr-ipq8064
+              - qcom,tcsr-msm8660
+              - qcom,tcsr-msm8916
+              - qcom,tcsr-msm8953
+              - qcom,tcsr-msm8960
+              - qcom,tcsr-msm8974
+          - const: syscon
+      - items:
+          - const: qcom,tcsr-ipq6018
+          - const: syscon
+          - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@1a400000 {
+        compatible = "qcom,tcsr-msm8960", "syscon";
+        reg = <0x1a400000 0x100>;
+    };
-- 
2.34.1

