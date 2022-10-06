Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5115F693A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 16:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbiJFOJA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 10:09:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231694AbiJFOIO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 10:08:14 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FD95AD98F
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 07:07:24 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id by36so2377000ljb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 07:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=2olDxECK+zQrkiY2JQo2dCU+SyZdrbRELD/72jNcoQk=;
        b=c0GF6ISTFE5TK1hJumXSKLJlJtA+SuKtQLJf0uTxjQl0tm4UEIlc4wQCwkt+6gSTRf
         rc2p4rDGooStqcR9RpHQFO9Bx7McQ4klJ7HO2XqzDNzJcEKiBul/qdPqu1jb9t7aXLcx
         YLX3MmNvX6s+R+39NWwALgFWElGSHW4hGL4fS91p9nvncymq8h+sac24rw5ngcqhzw3e
         zq2s2JmwG2gGhmNbiZTZ7HdGqf4OZflqiKB06wUfhGNy+S4dtwqoGDj9s9CRFp5DBZU6
         UMHwEOPNmQsm0v3XmhXTeqVuLBxsUdtoEafm5JoH7rl4TOMDNwHU7/P2+b9x9iLZG3fC
         t1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=2olDxECK+zQrkiY2JQo2dCU+SyZdrbRELD/72jNcoQk=;
        b=ePLsSoncesQDAwgaEPslTaTwbWld4VNq2u/lS+m7+qk8BrklEZT4HwKApdCwbKS4ZE
         xFs/yQkcxRSQyHMoJzsaQdV1izfjc3MqBbzMcIfL+bIbjlYPx9zv06tg8aLHv6RauiWG
         qWzWfaeJW2LyfM3vwE4QTcJEnHjfsf5TWwAYtGtaADx/pxqz52uzFw8qkAIrMMa/vdlt
         64/OtYxDLcdtSdgNOXcuvElEKitHv+FfG4Eq7cbhG78Q+xzce1cpLuQeKRd5iu2JLKOe
         ssXdkG5Uegu6JR9yVJ2MquufxMJg3u3gUBzzcSQEnbhortgcVH88jfkDEhZ38szf1SnF
         mIVA==
X-Gm-Message-State: ACrzQf2Sr7ChnO8LbGz1ZliAkUy2j+73/JeepjqTMbv+rGUaJgNrEWq2
        g89xqs7LnP1D7gvMkvB1LGGCLA==
X-Google-Smtp-Source: AMsMyM7MzGI8PBs+8aSZ3FId52WicGbdurwOFTrZ6V+RxP53uH8dwWCVyMy4ME4KR38ZxTn1xt3r6Q==
X-Received: by 2002:a05:651c:158f:b0:26b:dd9c:dca5 with SMTP id h15-20020a05651c158f00b0026bdd9cdca5mr1838661ljq.400.1665065233986;
        Thu, 06 Oct 2022 07:07:13 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z3-20020a056512370300b004a2386b8ce8sm1833929lfr.211.2022.10.06.07.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:07:13 -0700 (PDT)
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
Subject: [PATCH 24/34] dt-bindings: pinctrl: qcom,sm6125: minor style cleanups
Date:   Thu,  6 Oct 2022 16:06:27 +0200
Message-Id: <20221006140637.246665-25-krzysztof.kozlowski@linaro.org>
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
pinctrl bindings), drop redundant minItems, use double quotes
consistently and drop redundant quotes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,sm6125-pinctrl.yaml  | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
index 50f721d5f843..6258e3f37e0c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
@@ -8,9 +8,8 @@ title: Qualcomm Technologies, Inc. SM6125 TLMM block
 maintainers:
   - Martin Botka <martin.botka@somainline.org>
 
-description: |
-  This binding describes the Top Level Mode Multiplexer (TLMM) block found
-  in the SM6125 platform.
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm SM6125 SoC.
 
 allOf:
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
@@ -20,21 +19,20 @@ properties:
     const: qcom,sm6125-tlmm
 
   reg:
-    minItems: 3
     maxItems: 3
 
   reg-names:
     items:
-      - const: "west"
-      - const: "south"
-      - const: "east"
+      - const: west
+      - const: south
+      - const: east
 
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
 
@@ -46,7 +44,7 @@ required:
 additionalProperties: false
 
 patternProperties:
-  '-state$':
+  "-state$":
     oneOf:
       - $ref: "#/$defs/qcom-sm6125-tlmm-state"
       - patternProperties:
-- 
2.34.1

