Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FBC35E89E0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 10:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233865AbiIXIIs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 04:08:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233404AbiIXIIB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 04:08:01 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8D66155640
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:06:02 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id c7so2273848ljm.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Zawl5uwjby0oyqN1nYVliQNubSbgLZAX+iK/cI5YQFc=;
        b=NsinxENL6TBcJwYzGJuvtGBKa4JU2xIsBigfXUSO5PVd4Xq9Dn7l4gE5BPx0ydV90G
         PPPIph9mQaTIOv4wDWnraJcLlz3x0mFBEK+TjZSNCU+DFWdwEJRzM1/sRUP3dCFGiPZ3
         M/pKu4D4OqdA20l7fXNn3D+H7UD36QVYrSvFwZY11OgN3rBD46rAIZkjOOeYcFLA5Kzd
         Kt2grbjcuGLy3R9BdD16pMYKcV4m9/qUsry+xBr5Mgre5NJbsboTcsacfaPIthDMjbRZ
         c0l1BpfyDE73UqIblwAVp6MZJbhnzg51M1XJu+bdfxRfXlJ0cQ97XYjJl8Fck6jU792/
         pU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Zawl5uwjby0oyqN1nYVliQNubSbgLZAX+iK/cI5YQFc=;
        b=Hxml+4Uk9u6KGQJV63YwUngNgK58nXKl/yAjx/blne5xilYNmMoPCAX+VuVDgwZVy4
         t0pGyztrqOVQ5ZjUHrXNH1wsNoVvds8pHTQ4DtINMFwnmn1CHgbUCiwf5LMaGY9m99lS
         HQiuQnPRkeKLcWEse+AT1EyIuMdloRxG9y15AGfhLfF0+MVRTb35u9wsVHQ+mdCFZpA+
         +ajxwwGVLMb8UWlqL4UIkifmiqnl/iccBIP/OEFTa4Aqfw412RbhLnz/XBMfmLJ3oKrE
         YQwQYm7nP1TYAu5qLDsNUEq2xeTWS6JFNi6G4i+NXGAd7ZYUNePI37HleV4BVk1O9Hlm
         3oIA==
X-Gm-Message-State: ACrzQf3W75DJIGkRP3ABv5YCpfbjlql4E3n2u+OU867B2uAJWL0jHIMl
        1/krSaJHT179o7gtrHvmy1oRAg==
X-Google-Smtp-Source: AMsMyM4lxZZvY9zIYqBvmNQ7eSjyKMxnFjB3hoPpP+al5KmDZzeMaDyh0wObWQUpsGWtP6j/efSiLw==
X-Received: by 2002:a05:651c:1111:b0:26c:7178:ac4f with SMTP id e17-20020a05651c111100b0026c7178ac4fmr3789553ljo.461.1664006748404;
        Sat, 24 Sep 2022 01:05:48 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y2-20020a2e5442000000b0026c41574790sm1696668ljd.30.2022.09.24.01.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 01:05:47 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sricharan R <sricharan@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 31/32] dt-bindings: pinctrl: qcom,sc7280: fix matching pin config
Date:   Sat, 24 Sep 2022 10:04:58 +0200
Message-Id: <20220924080459.13084-32-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
References: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
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

The TLMM pin controller follows generic pin-controller bindings, so
should have subnodes with '-state' and '-pins'.  Otherwise the subnodes
(level one and two) are not properly matched.  This method also unifies
the bindings with other Qualcomm TLMM and LPASS pinctrl bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,sc7280-pinctrl.yaml      | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
index ad3496784678..4606ca980dc4 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
@@ -47,9 +47,17 @@ properties:
 
   wakeup-parent: true
 
-#PIN CONFIGURATION NODES
 patternProperties:
-  '-pins$':
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-sc7280-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-sc7280-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-sc7280-tlmm-state:
     type: object
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
@@ -162,7 +170,7 @@ examples:
         gpio-ranges = <&tlmm 0 0 175>;
         wakeup-parent = <&pdc>;
 
-        qup_uart5_default: qup-uart5-pins {
+        qup_uart5_default: qup-uart5-state {
             pins = "gpio46", "gpio47";
             function = "qup13";
             drive-strength = <2>;
-- 
2.34.1

