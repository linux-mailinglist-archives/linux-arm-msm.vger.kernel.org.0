Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4F725FB996
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Oct 2022 19:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbiJKRaG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Oct 2022 13:30:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230382AbiJKR2w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Oct 2022 13:28:52 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D161760F6
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 10:27:12 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id f27so1310849qkh.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 10:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBTPGnB6xCp92zRWIKe7A6aSdXZ2iRizgQ0TLXxzR8A=;
        b=gV6LjKtLqy/uUCALRf4iphyiiwkIkDdv48IwVvNPX9afBvxvlqrkuLmtIg43BJbiPQ
         68WbTlT6CQKgXVXgZn9mILuxnjJdMa1ORf9BfSffwdc0QFTcrAYVVSfmht4ZgeXHl+Bx
         BWUEUr1RQTJOHiCixvibx/jQbo0bVq+5l1PkVgzB3vhcYlTYjvn+uRhqpNcEaSxCdMlu
         KqYEdQxPK1VMPXlD8T2IupbSUwes+Y0AasDc4/UrMa2EHQm80jZQ+2nvMXVxHR04aRQS
         JpWDoGcr13CM0P15wrOWiHypLslD+nAPWHw5fQ1bjlBkH4b3CzjgXRM6FmzfN2gigJ6d
         bRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XBTPGnB6xCp92zRWIKe7A6aSdXZ2iRizgQ0TLXxzR8A=;
        b=hUjjOmUS75lqp3V8vg1AIbQv4krDezq00MWBtO9+tbFcaplWNiT0hO335NeV7rwCqk
         v5DP7QQ3b8tMhsH6ITAayDYSZszi9jIHOK1fHdN73evhYNjfUqyd/8VU9pGPRrxyHoDO
         +P0pc2KYuZ3GwSIwiiEvHE7vwUmfuThUvw7FYg3JKIKk7ykzb8PAO9Ldwma727COdtFo
         xWZ6CLyqrasujkJpZ6/yBcpilibTzDzjDtMmBxZLkS9bLJLIBaUUCfdIZ4x9wMzz/e5x
         ITMOihgrfBq34FoDB9X5ctjQq9efqydzu3aPLCgQQjCiPdReKvl5kkKTrm089elP0D7H
         VdKA==
X-Gm-Message-State: ACrzQf2pZYquZMlBAi6tSaCMuOwf2aiNjPOpXU3TRYRYVhqRV2CcxmPY
        8TJNQSJGog/Wsu+dzrelVVzyOw==
X-Google-Smtp-Source: AMsMyM7npWuUNBxPdIUW5wZ8W5qt4VnrwAHPXNZZ/7ymrloelazFCEtztPMFuw/PUP/Uj6YMcA0USQ==
X-Received: by 2002:a05:620a:290b:b0:6ee:7e19:c446 with SMTP id m11-20020a05620a290b00b006ee7e19c446mr2687421qkp.190.1665509208141;
        Tue, 11 Oct 2022 10:26:48 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id i14-20020a05620a248e00b006bba46e5eeasm14289087qkn.37.2022.10.11.10.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 10:26:47 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 27/34] dt-bindings: pinctrl: qcom,sm8250: minor style cleanups
Date:   Tue, 11 Oct 2022 13:23:51 -0400
Message-Id: <20221011172358.69043-28-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
References: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
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

Drop "binding" from description (and align it with other Qualcomm
pinctrl bindings), drop redundant minItems, use double quotes
consistently and drop redundant quotes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/qcom,sm8250-pinctrl.yaml | 36 +++++++++----------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
index 824a4dce1202..1e42a4c60da9 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
@@ -9,23 +9,21 @@ title: Qualcomm Technologies, Inc. SM8250 TLMM block
 maintainers:
   - Bjorn Andersson <bjorn.andersson@linaro.org>
 
-description: |
-  This binding describes the Top Level Mode Multiplexer block found in the
-  SM8250 platform.
+description:
+  Top Level Mode Multiplexer pin controller in the Qualcomm SM8250 SoC.
 
 properties:
   compatible:
     const: qcom,sm8250-pinctrl
 
   reg:
-    minItems: 3
     maxItems: 3
 
   reg-names:
     items:
-      - const: "west"
-      - const: "south"
-      - const: "north"
+      - const: west
+      - const: south
+      - const: north
 
   interrupts: true
   interrupt-controller: true
@@ -126,16 +124,16 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     pinctrl@1f00000 {
-            compatible = "qcom,sm8250-pinctrl";
-            reg = <0x0f100000 0x300000>,
-                  <0x0f500000 0x300000>,
-                  <0x0f900000 0x300000>;
-            reg-names = "west", "south", "north";
-            interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-            gpio-controller;
-            #gpio-cells = <2>;
-            interrupt-controller;
-            #interrupt-cells = <2>;
-            gpio-ranges = <&tlmm 0 0 180>;
-            wakeup-parent = <&pdc>;
+        compatible = "qcom,sm8250-pinctrl";
+        reg = <0x0f100000 0x300000>,
+              <0x0f500000 0x300000>,
+              <0x0f900000 0x300000>;
+        reg-names = "west", "south", "north";
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 180>;
+        wakeup-parent = <&pdc>;
     };
-- 
2.34.1

