Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A32345F6693
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 14:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230518AbiJFMs0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 08:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbiJFMrf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 08:47:35 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC82FA2AA4
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 05:47:18 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id bs18so2111942ljb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 05:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=KkxpRfvthMQRkjuRkMuhszBduBQdOCaoDx8XGiiNaXE=;
        b=t8OfFcCHjF354Iunv1WOrhcrPkLUwoNfUMTKxkrhyBGu++r2dWIbd9Trp89q9JcbE8
         2Z8o1x1710EiffUgBmVm2S97sIkTiNiyM0xFcx/sI8aruxmGuep/7wsGCuX5cjxoRFFq
         +cn+FJLNKgE/SX2r44kWi6TUcN10t+9Gpw4yDwMT/TwtrD7+jd+q2qNbTZ/Muu7/wiQr
         l8TOZrXTK3PWWoMOqBiVQpVojvpuB1Y9iZeAiqBfBmzcDKYFjdCzN6e//DK9ZZxwUajO
         D9bacmhTLOYjRLj8zIhx6GCUfGIbXeScnR+e4YJcD3qw//rp6G0MyndMKrUzR2oXdi3R
         0QSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=KkxpRfvthMQRkjuRkMuhszBduBQdOCaoDx8XGiiNaXE=;
        b=Xm6oDIhPyuKhvMJgXeMCkFT2z45Y5DI27kexczZxSWzquk60S6S/b3PR02V2T0IH4j
         ELZdjGG0aczBZBazJzp7B+ndSu5cwfD0e2ZIPhqLXPaatzrBq4JHrB8vnNpM1Y8KwIWC
         JOgj2A+IInIL3ch+9DDDPQMZBc0zMSY61u3+E4MIckuekVnvaWPwN/xNE8fdDnZvUPZZ
         dV1ImSbq5TEdLRGx0dKyVeGi0ROoDwWrQh6yfIbxoIUAq8/OExrLG1Pk0Rs7HQ1tgN1p
         mqhrIvhn8dXU+CRZmgBBqMOHGDttNH129Q5hMmBlFgU5VTYG89pNJo5o9ZvwWkyY9Dam
         MdDw==
X-Gm-Message-State: ACrzQf07ckdUSU2ymQC2ntzUf7o0QoUpEMo10Z5IvT31x2tOiXZszt9/
        uW81+o10vaDEITNYE0a2xpp3sg==
X-Google-Smtp-Source: AMsMyM4OEumtTO6GnQ1j8KE4qDqmgwmJ2Bh2E3H018RB/8IKKgq6ErcGcG1WC81FWiYj12CDcMNfHQ==
X-Received: by 2002:a05:651c:1504:b0:26c:6331:3463 with SMTP id e4-20020a05651c150400b0026c63313463mr1794089ljf.30.1665060437872;
        Thu, 06 Oct 2022 05:47:17 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:17 -0700 (PDT)
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
Subject: [PATCH v4 14/34] dt-bindings: pinctrl: qcom,msm8226: fix matching pin config
Date:   Thu,  6 Oct 2022 14:46:39 +0200
Message-Id: <20221006124659.217540-15-krzysztof.kozlowski@linaro.org>
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

The TLMM pin controller follows generic pin-controller bindings, so
should have subnodes with '-state' and '-pins'.  Otherwise the subnodes
(level one and two) are not properly matched.  This method also unifies
the bindings with other Qualcomm TLMM and LPASS pinctrl bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/qcom,msm8226-pinctrl.yaml     | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
index ab4a2b4cfda2..ecb90c77f666 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
@@ -45,9 +45,17 @@ properties:
   gpio-reserved-ranges:
     maxItems: 1
 
-#PIN CONFIGURATION NODES
 patternProperties:
-  '-pins$':
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-msm8226-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-msm8226-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-msm8226-tlmm-state:
     type: object
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
@@ -126,7 +134,7 @@ examples:
                 #interrupt-cells = <2>;
                 interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 
-                serial-pins {
+                serial-state {
                         pins = "gpio8", "gpio9";
                         function = "blsp_uart3";
                         drive-strength = <8>;
-- 
2.34.1

