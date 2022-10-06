Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 069725F66B7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 14:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231496AbiJFMtH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 08:49:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231623AbiJFMsa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 08:48:30 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7BFCA2862
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 05:47:39 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id t16so2112969ljh.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 05:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=gLNNPHYi9MZtpuf7Sf4vfCFMOo1TuKVCYuBKByb1QBU=;
        b=keU3l4AvJUnPJ+3yyRavQXHw0tU3n5niLcJd2vhRT4CjExMuUEJgdrwM8LlXqVuPZ1
         AvWa3DCj92iiWNV2BQqF9QrUOam4mYFOERWEK5URPAqy2z9h6YPcXtzchcQD9mdAIIkd
         50zD3pNW6Z/wQYs8wrj4b2jh7m/R+g8l1A8usm4py+CGWMSCYWi1sHwWVELtYbpaOURt
         +UzQuO8pQABhT5VX3ylXU01onlWrWGF/aOp58bu1UyVcVmeJp6HXk+lRCgztQrccXod4
         NDuEir4/qZ0SB5Lepd8Xn1Fq9t/lo6aCZI2umG8LqWuXaM+ad3HJ+gCT1BcfB2QiYZFU
         olPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=gLNNPHYi9MZtpuf7Sf4vfCFMOo1TuKVCYuBKByb1QBU=;
        b=vNWlG1ChV/lNdfM364FDIL/fjwUqwG+GZW4/bfCxpIWJhRCu/Jz6Rk5qiSDpcs65oZ
         CdNS44GD9WmAJgr9FsNu9/AekziYeOwBwpYsVytjJw3TG+NsH4oNb4zhvfWiof0+rYr4
         IEHV0JjGFHByFSA4K1ac0KFQowutDrFnYxnsYyDisCoW1EcNtGbjp9bx160N8EhfSHUa
         8Bryv15ep3aYrhTOHZCxhQqwGSkwtlN8fblWmiRxfWfThfAJDT1ibd1/+OfEfXduCIzZ
         p9tAJjjt1cf/uOd0rGDXKaBqSAarMp5vsVxjoPBj7WKeN2x/nqpsCS8OIyF0TUOw77+8
         JEJw==
X-Gm-Message-State: ACrzQf06ImyVCw2dr9UR1+X7JQ1ZjCP02NfPDtfQ7uUNzSaSGtC9i5/j
        FLMMVoFOMILsN2KIRPDLn7HR+Q==
X-Google-Smtp-Source: AMsMyM6/TvjnoCKQArHLuAkLMVa3xZQrDxt++eNx/9pB9jQ4dzx36xs5/M78tIftZtbuGGH84hPxLA==
X-Received: by 2002:a05:651c:1949:b0:26d:cf6d:54a6 with SMTP id bs9-20020a05651c194900b0026dcf6d54a6mr1728359ljb.3.1665060459218;
        Thu, 06 Oct 2022 05:47:39 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:38 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 32/34] dt-bindings: pinctrl: qcom,sdx65: use common TLMM schema
Date:   Thu,  6 Oct 2022 14:46:57 +0200
Message-Id: <20221006124659.217540-33-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
References: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reference common Qualcomm TLMM pin controller schema, to bring common
properties, other pinctrl schemas and additional checks, like function
required only for GPIOs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changes since v3:
1. Drop properties and required items which are already provided by
   common TLMM schema.
---
 .../bindings/pinctrl/qcom,sdx65-pinctrl.yaml  | 31 +++++--------------
 1 file changed, 7 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
index 0f796f1f0104..ad1a2446a8af 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
@@ -20,25 +20,12 @@ properties:
   reg:
     maxItems: 1
 
-  interrupts:
-    maxItems: 1
-
+  interrupts: true
   interrupt-controller: true
-
-  '#interrupt-cells':
-    description: Specifies the PIN numbers and Flags, as defined in
-      include/dt-bindings/interrupt-controller/irq.h
-    const: 2
-
+  "#interrupt-cells": true
   gpio-controller: true
-
-  '#gpio-cells':
-    description: Specifying the pin number and flags, as defined in
-      include/dt-bindings/gpio/gpio.h
-    const: 2
-
-  gpio-ranges:
-    maxItems: 1
+  "#gpio-cells": true
+  gpio-ranges: true
 
   gpio-reserved-ranges:
     maxItems: 1
@@ -142,19 +129,15 @@ patternProperties:
 
     required:
       - pins
-      - function
 
     additionalProperties: false
 
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
 required:
   - compatible
   - reg
-  - interrupts
-  - interrupt-controller
-  - '#interrupt-cells'
-  - gpio-controller
-  - '#gpio-cells'
-  - gpio-ranges
 
 additionalProperties: false
 
-- 
2.34.1

