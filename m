Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C702363C302
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 15:47:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235807AbiK2OrM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Nov 2022 09:47:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234542AbiK2OrI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Nov 2022 09:47:08 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 993B45B87A
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 06:47:06 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id l39-20020a05600c1d2700b003cf93c8156dso10991514wms.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 06:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eBiUrWwuuGLK6muO+p4UxsRMuSisu6TfPuhYR9/KcVs=;
        b=btAFXB5Xl4kCKcImulbHCBNx0FBTQ0jgsR7Wnuy9B5aaNW+MyWYAg/3pnJtkbqMiCQ
         vd0XTIv/J5OtEiltMBayX9S0UjAq02MpaHfzTKg4hoSljexvO2SN7rZm1Ih7INiUEMpe
         wpdecUm46rGOGG1Mg6ntcOyT01ITz+Pb+JzuxNBGjSRHsTWCsg+lVr1/ZhAPg9NQv0RD
         K7wiVXgrwNtU6hw1sPYn/JGmKx/Hu20TE88EjP/fHV1kZjpem0FNDI39IO3O1eOSXUfD
         eIog7nq0ysXP+IPi3cf1XCT3K+D35ko28qli8ONONrQqb4shE2mnT+Gm8+G+Hs6C/8NW
         jhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eBiUrWwuuGLK6muO+p4UxsRMuSisu6TfPuhYR9/KcVs=;
        b=OjbQNYHTHoBv/JOqg+xOhho/dVQbAE5BKFF3mwH9ASsc5yDLGRBLZf067nzvN7jlKi
         N1s5oFdhKMsMVyIYDM9rF9glk8vKkJ4+LgTaCsQB0mt9kgQ/mN/usoe8oGvKBtULB1bL
         5l4Q7vha/O51aAWUw4M8/W3QuSqzhIoV4aJz/Slcd45JSXvl6pzZbT8NzojxYNxVA6se
         8odszHug4R7YuZgYivm6P8WZG9w12mp0keGgU1MqT9jljhX7JwNXR0twS/s8PS32CVsE
         ul9pfebgPKUTn5hlhaNCX19F+7Va9vz9aJVXyFWw4py6K0TCroUnMhX9Xe1inq++G7hb
         Tsvg==
X-Gm-Message-State: ANoB5pkyB4CVcZnbuDh4X9K6tsrgQIRH/iJrJ/4z6kFBo3KlYhsf1r4n
        9YilqZru6KDcWR+NWTvSUn26UQ==
X-Google-Smtp-Source: AA0mqf5R3/pLJNwgo1Y3EzpOdfJhTGQLeA+xHc2zaSTJJmVgYbJmpKl1SoZfez1u6MtNlJ/RXwbzvg==
X-Received: by 2002:a05:600c:384d:b0:3cf:7217:d5fa with SMTP id s13-20020a05600c384d00b003cf7217d5famr31122553wmr.191.1669733225099;
        Tue, 29 Nov 2022 06:47:05 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id b10-20020adfee8a000000b00241dec4ad16sm13717792wro.96.2022.11.29.06.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 06:47:04 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 29 Nov 2022 15:47:02 +0100
Subject: [PATCH v3 2/6] dt-bindings: i2c: qcom-geni: document I2C Master Hub serial
 I2C engine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v3-2-f6a20dc9996e@linaro.org>
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

Document the I2C Serial Engine variant used within the I2C Master
Hub Wrapper.

This serial engine variant lacks DMA support, requires a core clock,
and since DMA support is lacking the memory interconnect path isn't
needed.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/i2c/qcom,i2c-geni-qcom.yaml           | 64 ++++++++++++++++++----
 1 file changed, 54 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
index 0e7ed00562e2..f5f7dc8f325c 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
@@ -10,18 +10,19 @@ maintainers:
   - Andy Gross <agross@kernel.org>
   - Bjorn Andersson <bjorn.andersson@linaro.org>
 
-allOf:
-  - $ref: /schemas/i2c/i2c-controller.yaml#
-
 properties:
   compatible:
-    const: qcom,geni-i2c
+    enum:
+      - qcom,geni-i2c
+      - qcom,geni-i2c-master-hub
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   clock-names:
-    const: se
+    minItems: 1
+    maxItems: 2
 
   clock-frequency:
     default: 100000
@@ -35,13 +36,12 @@ properties:
       - const: rx
 
   interconnects:
+    minItems: 2
     maxItems: 3
 
   interconnect-names:
-    items:
-      - const: qup-core
-      - const: qup-config
-      - const: qup-memory
+    minItems: 2
+    maxItems: 3
 
   interrupts:
     maxItems: 1
@@ -71,6 +71,50 @@ required:
   - clock-names
   - reg
 
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,geni-i2c-master-hub
+    then:
+      properties:
+        clocks:
+          minItems: 2
+
+        clock-names:
+          items:
+            - const: se
+            - const: core
+
+        dmas: false
+        dma-names: false
+
+        interconnects:
+          maxItems: 2
+
+        interconnect-names:
+          items:
+            - const: qup-core
+            - const: qup-config
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+
+        clock-names:
+          const: se
+
+        interconnects:
+          minItems: 3
+
+        interconnect-names:
+          items:
+            - const: qup-core
+            - const: qup-config
+            - const: qup-memory
+
 unevaluatedProperties: false
 
 examples:

-- 
b4 0.10.1
