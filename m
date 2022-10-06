Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD0FA5F66B9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 14:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231511AbiJFMtI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 08:49:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbiJFMsa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 08:48:30 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF480A2A94
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 05:47:33 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id g1so2503479lfu.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 05:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=6jCYOSDu55V6QZBvLkF9j6tijgskxnXCKDfSvqsPbyU=;
        b=zNo2urZELR20lqD5BX8cQy92lhbO6KIH0db9xKR2jzP0X7yrVF5vTXKCJ7ypnJSI7+
         PX7KxhuoKJDQgWtw2MTCLFAinS/GPhr13JsmIKvXeYH2OHB7dxbVKm+XHo7VeajorQ3Z
         /IOWXOtGQ9tmpUmEdFhN3750gWXi1pL0eAfsYRZn+Nb917QQL5mgNQ1or2NLnbP497f0
         sBqHbkZ5uR/lssZT1ui1ryJDXS2q+kEbR6T8WHjDuHkUQVB6btUhHqwUhVMBi2peC4lk
         3DoATJXs+YihL0Mw8PN/BYJAqEv8AY539Hn3DuXloGgUghQWtzt7esFWy2PI8tA2pBd0
         k9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=6jCYOSDu55V6QZBvLkF9j6tijgskxnXCKDfSvqsPbyU=;
        b=LMPn8PYCjM5LCaqaiIB2qoz3shimDWaitK2cNjNMx4KAoBU8rjEDnqkj+eeZG0Bu2c
         qFUvNvZPLHfoqE9ZpBZGPTCJLQVHbRJiZXe7bpy+3kuY87/4CKwrQxbAl5Hf/GPj4+zY
         zUneoz+Xae+TwkY755KyLyUxvHUZOOZUD+z9cUE1gh2MM/lgqNJxWUzZ7MkS4prNeQKE
         B8Z44duT3gBNvYFCxpSFtehRZVxsihYUNU3xR5N6rspofxDuVGZQKyaf++EwVBpvf6A+
         ryN/r+/3i2IA33lib3wGDQ2JCGWVKcPvv+o/TWSwdUTO/nzJJWRaZm3cusqfACo4kg2J
         hf1Q==
X-Gm-Message-State: ACrzQf3AAVWyJhVs04rOGyZLYaFps06Z3VEVRWCUpNyfJ0g5Y9ezcyED
        b99Vrvk6lenUn3y3UQ0g4g4uaw==
X-Google-Smtp-Source: AMsMyM5tOmNYurHbcPgoRnRCMP1iNmw6jOf9USN6u+0Lspx8i3ZHewpM1Qi4jbE7hAq4VcVGlpDbMw==
X-Received: by 2002:ac2:484d:0:b0:4a0:5399:9b70 with SMTP id 13-20020ac2484d000000b004a053999b70mr1959158lfy.216.1665060453329;
        Thu, 06 Oct 2022 05:47:33 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:33 -0700 (PDT)
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
Subject: [PATCH v4 27/34] dt-bindings: pinctrl: qcom,qcm2290: use common TLMM schema
Date:   Thu,  6 Oct 2022 14:46:52 +0200
Message-Id: <20221006124659.217540-28-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
References: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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
 .../pinctrl/qcom,qcm2290-pinctrl.yaml         | 32 +++----------------
 1 file changed, 5 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
index 5324b61eb4f7..0d73abeea715 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
@@ -20,28 +20,12 @@ properties:
   reg:
     maxItems: 1
 
-  interrupts:
-    description: Specifies the TLMM summary IRQ
-    maxItems: 1
-
+  interrupts: true
   interrupt-controller: true
-
-  '#interrupt-cells':
-    description:
-      Specifies the PIN numbers and Flags, as defined in defined in
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
-
+  "#gpio-cells": true
+  gpio-ranges: true
   wakeup-parent: true
 
 #PIN CONFIGURATION NODES
@@ -119,17 +103,11 @@ patternProperties:
     additionalProperties: false
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
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

