Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38F60601D2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 01:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231254AbiJQXDn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 19:03:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231266AbiJQXCr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 19:02:47 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1593582D18
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 16:01:51 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id f22so8721924qto.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 16:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZqgsGmvSE1+fOZ/tmTIcifOBksip+9lbghJPY68QP4=;
        b=Pwxtaxh15Y7PYJmsoD0c90IuimCOUBYPRmLM3N4aIGliN1UKbiDIKQ45TyvFdqCg4Z
         02gF8CTDDX2dTfbq/+PTy8sVP6NF1D0RHJU5Ct2eAjqZ+BrJsVjeTZZCOH1AqnJJHdly
         +63GdABmovYWtjixqKSGBWBUNlmc1Cb1ePtgMeqn7SRhucXzRb91GTxwPbGuEIshdHm8
         wlJjxboVEeyLHYXINJXXkVQuZ6uBrcIgsg6Br088tD1kyjReD4vPPPWkewH/Nu26QGNj
         P7Toih0fHk/bqxmubWwUN/2cd/6i3Nt7mqQFbBRIhMhSuB284q0hH8bgHDX+Zb8Ld2Xi
         e/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZqgsGmvSE1+fOZ/tmTIcifOBksip+9lbghJPY68QP4=;
        b=nvOn41tN60Zn6T7HZkIOauJZ/2sKF2VM6UpMNFHvFMN8MxxzHA5GKg712IqoDHK1Dl
         1xnpXComqWtxlN8e0VhXkz5GuhRoL4HipEAJU65SuVPuseal07KOcojK6YTm8k7XJtwT
         JJaGyRZRaIqidedR8q7GpeKENUITfKBZEJXONb+GGvmpQcRD6pmkbm0BboqcgGvKFR7f
         r2AuFPYL/hWAf8X4ddMwab/Dc/ODII9jXwFIwcsyX4pIoJhB26zkF3Xe1HHeyo5aaNv4
         y1KSR3Xf3L6dPpTxMnp454/jOAGQXVlzHok6lMdSoB/n33w3/BrkEGfDn3xxXqdK8zRs
         4KoQ==
X-Gm-Message-State: ACrzQf084OtjEDfUoKanehHm6Bx1Zfd5nV/Y2wVJl6E2oDrtVKK+8lKZ
        Zu51qwrNL0gNzhn8ejdJTbYqPA==
X-Google-Smtp-Source: AMsMyM4udkESC00DIDaFfQ1yHfhqHhNbeP/IZSwFvUJPShYAGyDgOXHz227pUnlYHfMcjbM+/ot30g==
X-Received: by 2002:ac8:58c5:0:b0:39c:c710:f58c with SMTP id u5-20020ac858c5000000b0039cc710f58cmr10735280qta.295.1666047673179;
        Mon, 17 Oct 2022 16:01:13 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id fg11-20020a05622a580b00b0039cb9b6c390sm729670qtb.79.2022.10.17.16.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:01:12 -0700 (PDT)
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
Subject: [PATCH v3 20/33] dt-bindings: pinctrl: qcom,sc8180x-tlmm: minor style cleanups
Date:   Mon, 17 Oct 2022 18:59:59 -0400
Message-Id: <20221017230012.47878-21-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017230012.47878-1-krzysztof.kozlowski@linaro.org>
References: <20221017230012.47878-1-krzysztof.kozlowski@linaro.org>
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
pinctrl bindings), use double quotes consistently, drop redundant quotes
and rename file to match compatible (to match coding convention).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 ...180x-pinctrl.yaml => qcom,sc8180x-tlmm.yaml} | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)
 rename Documentation/devicetree/bindings/pinctrl/{qcom,sc8180x-pinctrl.yaml => qcom,sc8180x-tlmm.yaml} (94%)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-tlmm.yaml
similarity index 94%
rename from Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
rename to Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-tlmm.yaml
index 71ca4cfd567c..24191d5f64ac 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-tlmm.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/qcom,sc8180x-pinctrl.yaml#
+$id: http://devicetree.org/schemas/pinctrl/qcom,sc8180x-tlmm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Technologies, Inc. SC8180X TLMM block
@@ -9,9 +9,8 @@ title: Qualcomm Technologies, Inc. SC8180X TLMM block
 maintainers:
   - Bjorn Andersson <bjorn.andersson@linaro.org>
 
-description: |
-  This binding describes the Top Level Mode Multiplexer block found in the
-  SC8180X platform.
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm SC8180X SoC.
 
 allOf:
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
@@ -25,9 +24,9 @@ properties:
 
   reg-names:
     items:
-      - const: "west"
-      - const: "east"
-      - const: "south"
+      - const: west
+      - const: east
+      - const: south
 
   interrupts: true
   interrupt-controller: true
@@ -46,7 +45,7 @@ required:
 additionalProperties: false
 
 patternProperties:
-  '-state$':
+  "-state$":
     oneOf:
       - $ref: "#/$defs/qcom-sc8180x-tlmm-state"
       - patternProperties:
@@ -54,7 +53,7 @@ patternProperties:
             $ref: "#/$defs/qcom-sc8180x-tlmm-state"
         additionalProperties: false
 
-'$defs':
+$defs:
   qcom-sc8180x-tlmm-state:
     type: object
     description:
-- 
2.34.1

