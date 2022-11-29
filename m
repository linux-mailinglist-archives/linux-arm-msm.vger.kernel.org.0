Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEC8963C2FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 15:47:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235787AbiK2OrJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Nov 2022 09:47:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235771AbiK2OrI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Nov 2022 09:47:08 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B16F75A6CE
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 06:47:05 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 83-20020a1c0256000000b003d0683389e1so1023608wmc.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 06:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MFuTdix/yEFsrkLuW0V5I25CPqOO/yLI32L0tLkZw6k=;
        b=R4h2Qpg9sZkYrDXmMCfMGw+BmcxI74XNfHVOJHHbNDfyHc+p0dMu+MfNd7y1Iu/bx+
         ZmIAvnuX88R6ZWhkEvgxzH8bxaUekssv/ZYjcxpgIMDEPXOjdGA/sGjb6JoC1GUZKI5J
         oaMki7bjXkT4CzvYVyCBbTDDEVTF1SXmi8VRUtYgfcsxOipACdIucqGrs8Z6+rMnYXjF
         GTdMVrFiEQKxq5QEuMr0SXOlyT2Tng1dqyRLZDkP+KP9qeoPXx3m85v/DiZ/ExAykktI
         KleweXEQCkmxGJjfxEJX9e3xZhj2PIYEb6/qic7V6ClD+1TJk0TtV4mRFy8OGdFwxEM/
         v29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFuTdix/yEFsrkLuW0V5I25CPqOO/yLI32L0tLkZw6k=;
        b=BGip8Gwxp54cRBbUyZ0cokVLihmzvtamlBJDPRKOta/cxeQLDUrCBnyWNf2EMVBTmU
         4AezAgo6ajIxhi5LS/UW7VC4NQXFWMO0Ph+Ot1uEuke65I1RD4d3ye0u2wIAgldIhJ4l
         tspHPoqEpOrjCcb/jICXD1qnQIfRq7UzEnR6v2FLUY/Fde5U7t4yN0fJTT/sGWT80oxZ
         DQ95K5BHYYb6Xzya2HuglkauQyxHIvFmQQpuTQQBCCkqWZkn334i7HXUHWlWVe9F1lmA
         2LkCyK3JDOuldueS0Y/ZlpX3vOCMyhkhft2KYNS6icpWQ6l6W2zPr+fG0Xiei3LJ2jmn
         Olhw==
X-Gm-Message-State: ANoB5pn/wBc1pFAioRbjrqN+7yuH9AywZOSI3k7qOscrQOBlXFUT2bgn
        Q5HPCAbFoaLpxKuvNi03XivEhA==
X-Google-Smtp-Source: AA0mqf5N2V7+ZxHFRJ6mDjLUAPfzTIwHfQjdYaTmjUIV1tEpJOoW+TkTCIw9P6kUxnJvG7icuh8sSg==
X-Received: by 2002:a05:600c:2296:b0:3cf:baa6:8ca5 with SMTP id 22-20020a05600c229600b003cfbaa68ca5mr27410117wmf.178.1669733224199;
        Tue, 29 Nov 2022 06:47:04 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id b10-20020adfee8a000000b00241dec4ad16sm13717792wro.96.2022.11.29.06.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 06:47:03 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 29 Nov 2022 15:47:01 +0100
Subject: [PATCH v3 1/6] dt-bindings: qcom: geni-se: document I2C Master Hub wrapper
 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v3-1-f6a20dc9996e@linaro.org>
References: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v3-0-f6a20dc9996e@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v3-0-f6a20dc9996e@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The I2C Master Hub is a stripped down version of the GENI Serial Engine
QUP Wrapper Controller but only supporting I2C serial engines without
DMA support.

Document the variant compatible, forbid UART and SPI sub-nodes,
and remove requirement for the Master AHB clock and iommu property.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 44 +++++++++++++++++++---
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
index 2bf5293fc995..ab4df0205285 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
@@ -21,20 +21,19 @@ properties:
   compatible:
     enum:
       - qcom,geni-se-qup
+      - qcom,geni-se-i2c-master-hub
 
   reg:
     description: QUP wrapper common register address and length.
     maxItems: 1
 
   clock-names:
-    items:
-      - const: m-ahb
-      - const: s-ahb
+    minItems: 1
+    maxItems: 2
 
   clocks:
-    items:
-      - description: Master AHB Clock
-      - description: Slave AHB Clock
+    minItems: 1
+    maxItems: 2
 
   "#address-cells":
     const: 2
@@ -81,6 +80,39 @@ patternProperties:
     description: GENI Serial Engine based UART Controller.
     $ref: /schemas/serial/qcom,serial-geni-qcom.yaml#
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,geni-se-i2c-master-hub
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: s-ahb
+
+        clocks:
+          items:
+            - description: Slave AHB Clock
+
+        iommus: false
+
+      patternProperties:
+        "spi@[0-9a-f]+$": false
+        "serial@[0-9a-f]+$": false
+    else:
+      properties:
+        clock-names:
+          items:
+            - const: m-ahb
+            - const: s-ahb
+
+        clocks:
+          items:
+            - description: Master AHB Clock
+            - description: Slave AHB Clock
+
 additionalProperties: false
 
 examples:

-- 
b4 0.10.1
