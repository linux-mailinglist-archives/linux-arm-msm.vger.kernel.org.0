Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3C75F6912
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 16:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231841AbiJFOIV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 10:08:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231736AbiJFOH1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 10:07:27 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E65EABD48
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 07:07:08 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id o7so2874348lfk.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 07:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=OCWkAJ7KxqXnhA84/Mh4GyCtqI5XCUy/WYJu0Iki/HM=;
        b=TOUkUu03byz1VIzmP+xPFeQKPDwgYlGiubJzG8E9krW0jcxMimUSFGQcCY56CAufbg
         F4YN8D8KbQp3tBEfyHK5ev8h3xoEkyUhwFchsNbst3KzHl5b9Z4oxn2T8NTZACTDmi9e
         7KFa359tjIQzQSpqG8HewIAP1p/W6jNKD1x1MtazCkpGLL+DcJUm1KVflqS1iuG+jw5y
         B1z7Frb86Ei1cb2hisB5hsYMcJ++UTAexpv3DJuZsYAg8IvFfmwq75CSXR/pHdt55fsW
         J1yBdqA4fQUWckSNvBACe1Mfr5uxWTgHfAHr9hK04DPpRC95DhMkydmSftdkS1neB/Q+
         GQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=OCWkAJ7KxqXnhA84/Mh4GyCtqI5XCUy/WYJu0Iki/HM=;
        b=UjNM+oAj8irEZuhNj9QbP0eQlB2Hmkzxh8WL1OTK+F8LYsOZpXydC5cjHsvC2Jv2gp
         ahQoEbvMG9e2f9gj/ZWg5/RgHGaUAWw6ENz/ifFy4iVSAZlkuBxhTQ02ay55YA9Dc0qO
         iaPl7fGxI1g9fINz8/gf9hKhBXzA3hL/1MYTThEFYdiMR23MnTqPCcZa9FshiBUUptOR
         tK8c8Gsvnd9j26Zv7zlg3IOq3QldNrasZay1gB1RAEnmLPtE4PjjNqHqpr+CN717xbnC
         16DX2Azlz9Eyu1Bv0v8EefQFX5bVfbYdlkeLagSYTgxCUTTe41TptGtEne/T3JJcrask
         U1AA==
X-Gm-Message-State: ACrzQf0I/lFr0NwdWfluoZ5J/Du2b04Gr3OywiNf1g1Y6yHcSdFdM7qN
        rbcejVigVCQ4rF8U8XL5R5zfoA==
X-Google-Smtp-Source: AMsMyM6ki0h9js1zI42JYqPue074WCPbfFEECSp5LIbWHBv2gJNYNXg2GGyoGw9qOORJz2BdWK/0Nw==
X-Received: by 2002:ac2:4d28:0:b0:4a2:40ef:2996 with SMTP id h8-20020ac24d28000000b004a240ef2996mr38282lfk.425.1665065225024;
        Thu, 06 Oct 2022 07:07:05 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z3-20020a056512370300b004a2386b8ce8sm1833929lfr.211.2022.10.06.07.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:07:04 -0700 (PDT)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 17/34] dt-bindings: pinctrl: qcom,mdm9607: minor style cleanups
Date:   Thu,  6 Oct 2022 16:06:20 +0200
Message-Id: <20221006140637.246665-18-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
References: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
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
pinctrl bindings), use double quotes consistently and drop redundant
quotes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,mdm9607-pinctrl.yaml    | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
index 5a9002a83423..f832d776e1ab 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
@@ -9,9 +9,8 @@ title: Qualcomm Technologies, Inc. MDM9607 TLMM block
 maintainers:
   - Konrad Dybcio <konrad.dybcio@somainline.org>
 
-description: |
-  This binding describes the Top Level Mode Multiplexer block found in the
-  MDM9607 platform.
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm MDM9607 SoC.
 
 allOf:
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
@@ -25,10 +24,10 @@ properties:
 
   interrupts: true
   interrupt-controller: true
-  '#interrupt-cells': true
+  "#interrupt-cells": true
   gpio-controller: true
   gpio-reserved-ranges: true
-  '#gpio-cells': true
+  "#gpio-cells": true
   gpio-ranges: true
   wakeup-parent: true
 
@@ -39,20 +38,20 @@ required:
 additionalProperties: false
 
 patternProperties:
-  '-state$':
+  "-state$":
     oneOf:
       - $ref: "#/$defs/qcom-mdm9607-tlmm-state"
       - patternProperties:
           ".*":
             $ref: "#/$defs/qcom-mdm9607-tlmm-state"
 
-'$defs':
+$defs:
   qcom-mdm9607-tlmm-state:
     type: object
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
 
     properties:
       pins:
-- 
2.34.1

