Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D34562EFEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 09:45:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241541AbiKRIpj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 03:45:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241536AbiKRIpV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 03:45:21 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEF6C97AB4
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 00:45:11 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id g2so4504978wrv.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 00:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ZVI21GiGBb72P+wFA+fb2eiFTOk5Z1sDSldnLU44Cg=;
        b=B2SPam30PBcRcEgx+uM0RhffnU+8Sb4wu9VwqAiiuxTm8FQMPjFU3TgdBxOB8t3jBd
         mDgl/Jw7JSSsfhef9JLD6b+VVcdiqtd4DkQ8gi06Pzw7kvfEy24Sk6uVrYZg2Y8daFzw
         l6X1NS65kb6/tCVfpeR3rmo1ziYS0NBq0/CXMt3OrIF4TRwFnIVpRRWWtBQJ74EPcWxf
         OPvlQ1hE9PfdNmNiwIJVjwcJEBHxB9ndc7BjLX0QHYaAn6kN0tHXWczO3odmcKI5dgAk
         O7oL8ArrWWgF4jnoNcE+Sbdla+fwanNoehkcYIdYASd+i9h3vHGl3B8UE/h7YFfxAOTQ
         /Y+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ZVI21GiGBb72P+wFA+fb2eiFTOk5Z1sDSldnLU44Cg=;
        b=bG6iXfmF4odtXsMMI2eWAvwYbJn5OhFUOzOuSNeBnek631INdvRgOm/plCzV5L10+P
         a7RT3ty0khAub3DRUZLF8obkryVQfpvvzauzCOvFJjM34wm0rIh/yls56+rOTT4u0ynZ
         jr8p3nnRppOqZRfgOEUc5HXXBoBPgx1uk6pBAOxwHXoQ2BJ8CvhDtDfzjTeVQJ3O8iQE
         AFS9QSxw2Zevce2jhfjWncViy7WRDQUbFImpjm2JiGnpXfYjqCXRKMHDLvh+j+uEKtBT
         AG/30Zq209c+UlH2Dtq327VAnoa/6eNJKRHbosktIjrqalP24tURLPAritDn6DfwVhXc
         CrRg==
X-Gm-Message-State: ANoB5pnj14LeTc5w1zQLVGIymbpRZoYMjYWVpAcn/EiG6SoU+TLc/8lY
        BydD8XiIgPaSipKcOsr8MgpC8Q==
X-Google-Smtp-Source: AA0mqf6F5wvJNAkTP41X0h1o8u4U6H6RuFoxCS+LjsJ/GxH+ysh/AZB9Ba4UzrHuwvxMLeGS0sNu5Q==
X-Received: by 2002:adf:f74d:0:b0:236:4e3c:7720 with SMTP id z13-20020adff74d000000b002364e3c7720mr3641986wrp.674.1668761110226;
        Fri, 18 Nov 2022 00:45:10 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id v18-20020a5d6112000000b00236e834f050sm2960284wrt.35.2022.11.18.00.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 00:45:09 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 18 Nov 2022 09:45:06 +0100
Subject: [PATCH v2 2/6] dt-bindings: i2c: qcom-geni: document I2C Master Hub serial
 I2C engine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v2-2-aadaa6997b28@linaro.org>
References: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v2-0-aadaa6997b28@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v2-0-aadaa6997b28@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org
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
