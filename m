Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36F045ECB26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 19:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233285AbiI0RjW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 13:39:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233287AbiI0Rin (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 13:38:43 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BF991D35BA
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:38:22 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id a8so16749829lff.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=QZpy1tQNR59VQx71GuVhrGdOEH9JzyWI/ex9XtbiKQ0=;
        b=cBr+FXjI2QdZouUINVDb5snru1miuCdF0/9KuAlaFeBNR3FerBcm0MSlEd4JRMe8LO
         Sm50aKKepQObpqku0nKbPzAOPcCdWInvwh/Q3ScyNla+FQwdX72dFsDQmpE4kEqVfneK
         tJ/QD1cJU/8JnmjmjRJqIHFWQOK23wPUOh16xlY6f6bUSyy44mOZ+xwxhl3jB67Yc7X0
         7+Vzy1L6rsXWh3cslj50vVcuNGilxXJaBolDluGzixZSPrVlupFuVK0uVvvcxrdMETc6
         BhuNO9stpCep9glQlYRK4zkQ9wkcu54ffp2mcD0b8xQ6OtP87qXGMl2X8kBYLxi1us93
         bIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=QZpy1tQNR59VQx71GuVhrGdOEH9JzyWI/ex9XtbiKQ0=;
        b=rsNRoTMxmyLuoZRTZ9vetEESVLigNXU9sLyY/KN2qEN4ZiFJebD/i69g+RLRIKGsUc
         X2jpfEEJwBegFmH8XX1XJZybw3voemaO54hs0xWcRS1G9yA2em2nVAl1B9qGX/rFRAlg
         13bgmlpNX3dDxKnDfyXJHSgTz91Vy3OsVjT5jtnCNxtnk4kJWLcD4Ov1JoAKxCpzg6lG
         T54ahBMgfvckOrXJMHj+djEJb2aj7l0Jzx7S7RJQgAXSkNUzmAb2sXp/eEg7arDJQ74h
         2b4fevUFUU55zXOxmxPTzkwLo0GmWStrDcIAqUbaFwCkKTPyPONR+jA/OM2NJNfP1I3/
         bOcw==
X-Gm-Message-State: ACrzQf129Q9Rlx2E1n3evjMA5QpwLcAiFOQaIHNRU5Z+0POXt8QA//zw
        Pawhg7uzlAVlHTUe1DLrkZBcPw==
X-Google-Smtp-Source: AMsMyM48G+IHPuxXwnXw+FyxHn5JBEimD90hr4zfb5of9AjoGUI9FgEmH3Tw2607uxpd0k8ochWDUw==
X-Received: by 2002:ac2:4d0b:0:b0:497:a7fb:229 with SMTP id r11-20020ac24d0b000000b00497a7fb0229mr10956634lfi.174.1664300300449;
        Tue, 27 Sep 2022 10:38:20 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q12-20020ac246ec000000b00498f570aef2sm218879lfo.209.2022.09.27.10.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:38:19 -0700 (PDT)
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
Subject: [PATCH v3 14/34] dt-bindings: pinctrl: qcom,msm8226: fix matching pin config
Date:   Tue, 27 Sep 2022 19:36:42 +0200
Message-Id: <20220927173702.5200-15-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
References: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
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

