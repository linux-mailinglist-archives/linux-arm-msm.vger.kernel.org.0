Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEDD05ECB15
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 19:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233017AbiI0Ris (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 13:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232923AbiI0RiN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 13:38:13 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA8CC1E3F5A
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:38:09 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id z25so16818487lfr.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=kObwly8KM8UXKGIu2/gCaga6ryxknVlFGZT/OaEow5s=;
        b=rceIIaBgG64gmIVxVTG1SpmPVB0025LJSF5zHQcfvxVvRD770nabuLK6aD5g7xYk4w
         tWl6uOTFMYPums6k3kjwMxotaU/ehSdvI+lq6WfUsAgVRUlLx8yBtAdb1pVIifQS8/gx
         OFzwTI0h5cmACndXFvRmpkemZwDJoWWkKFOIOUe/oh3Mm2OIwMgefAKRsOEtifHDx+e+
         XiG7ZDkGm81kmm989DI9h4tQdp8+0owlQHTGki0F59avvagYiwVtsWsJXOB7QcQH6vp5
         LQjzSZIwEN545n7SNYbLPt/q5mgRHLzxIbHW/tecG3YuOmM4qzzFj30tIB0ry1Cit0Yc
         5r8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=kObwly8KM8UXKGIu2/gCaga6ryxknVlFGZT/OaEow5s=;
        b=vbQ4oYoHC3kgNRhXmuUWEMwS42x2f9zdg6akgMA2dgmrT1WtHE5UZh2qCRcmKffhgh
         8J4bdKA6lg7pXDEiB9wW2errLPQSzDSbp0MooFsW1HOBipVz57QSKPPHMnyaDx4E3wO7
         oFXJ82EoE3de30M0iq0jgO8O0Yy9NhB84BeXFtxXtvKi9rY5N6Mn4TcuZZXLcbYiTRRL
         LjLLOiBjJSBMMIvdC/dU21907tkxRgqgfQlMPVSaBey6D8Hu7qLE8OnUFd0QV4EhYMmF
         4QeUoZ6sMw9b8+Myk5ysIlOYxXgiR8qI4VYm1hqPDniXmrbjddhQzkEyQLjne9o9aIZv
         gA1A==
X-Gm-Message-State: ACrzQf12elOtnPS9nT/+p7h8yZ2WBKJhZhq3p9erVjt5ZiKyl1oLq+AY
        n1rh3PiboucEVVveG3bTD3ag/Q==
X-Google-Smtp-Source: AMsMyM7TR2DHM1fj1Onn7DOWnaaDlK/lbPAz/mX2SH9DzO84HvAEwMUOvFbDlr1aXslH/wmowN39HA==
X-Received: by 2002:a05:6512:3e1e:b0:499:34:e8a7 with SMTP id i30-20020a0565123e1e00b004990034e8a7mr11091385lfv.655.1664300289133;
        Tue, 27 Sep 2022 10:38:09 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q12-20020ac246ec000000b00498f570aef2sm218879lfo.209.2022.09.27.10.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:38:07 -0700 (PDT)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 11/34] dt-bindings: pinctrl: qcom,ipq6018: fix matching pin config
Date:   Tue, 27 Sep 2022 19:36:39 +0200
Message-Id: <20220927173702.5200-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
References: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
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

The TLMM pin controller follows generic pin-controller bindings, so
should have subnodes with '-state' and '-pins'.  Otherwise the subnodes
(level one and two) are not properly matched.  This method also unifies
the bindings with other Qualcomm TLMM and LPASS pinctrl bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
---
 .../bindings/pinctrl/qcom,ipq6018-pinctrl.yaml    | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
index 7202e2af200b..735a8786cb13 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
@@ -42,10 +42,17 @@ properties:
   gpio-ranges:
     maxItems: 1
 
-#PIN CONFIGURATION NODES
 patternProperties:
-  '-pinmux$':
-    type: object
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-ipq6018-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-ipq6018-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-ipq6018-tlmm-state:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
@@ -146,7 +153,7 @@ examples:
               #gpio-cells = <2>;
               gpio-ranges = <&tlmm 0 0 80>;
 
-              serial3-pinmux {
+              serial3-state {
                       pins = "gpio44", "gpio45";
                       function = "blsp2_uart";
                       drive-strength = <8>;
-- 
2.34.1

