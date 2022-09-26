Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35FFA5E9ADF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 09:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233348AbiIZHqb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 03:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234226AbiIZHp0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 03:45:26 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFB56193F8
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:44:49 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id a2so9495219lfb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=s3LeD0fQ3lVXSe5LvWDqJOXNGaIcujKmFDelUx6yqVs=;
        b=l7+OgR+Oum/n8ZVLx5cX3mHPiY/JfEZSFqFHWUij71YGnYotCt5XwwWqzhUM4qnTsf
         nl/W9aeEO/EzBj8kdYMYPt3ajBbaQcP+Hjzppyyx4AHFGLrVTccQdeoPcXgmrq0WDyeh
         iBXY8+NnxixlCHxGzJthsi9WkcluWyapdMSIgN7bN8v42c3D555gOWZA5w9WaqkOfcKg
         dQE2Qv4uiNuIHcHUwVGYx3X4Xuq3QCGCGNeMj5zMO+kNfZx8MsArtFpU0HluXX5L8KZh
         0qQj1/96jBkz6sE4WAJj2H8Hk2qJ43zdeqxm0VwjFB8hS4fr3l7zloYCvijqdiMf/Urb
         uvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=s3LeD0fQ3lVXSe5LvWDqJOXNGaIcujKmFDelUx6yqVs=;
        b=NxWt0Bs7wn4wuPVleLEj9O/ZbTJGCYVR2g0R3yAXJqmWC/VcopiZ3eqIR0ckJvb8Es
         +9zK7TiyjlP+eXLR18Z/IRygn4DF+SsWoG/5rwzGTi1yNImx8Oz4pRChWBLHzao3x6b0
         wwSp+xYscLtgPL+g8CZZt1GDjghfxBovMnL2JncV0CXwI9EOBVwfT2HzV/oyL8Xb1P49
         Mg1pT1hlI9aNF01FnmmsxgAl18S49oFSpM3P1IPhHNhgRJGTQq2htwW9iXHYMUmwJDAC
         Ba4p+/qI6YAg/uUg7NPFPOleZXOd0WQ0lZ33+raUa0scHxDFyX+jip5F7azz7WiQ5x5o
         pUzQ==
X-Gm-Message-State: ACrzQf2o9ATc+JEcGKaL4ZtZ9mO+3WBkPN5cx8uO4Jaop0KR4swUecq8
        77t492HKqOHVIDE2pqCHCTr+Cw==
X-Google-Smtp-Source: AMsMyM6U4d3jBHNBnbe3odhyJlnWz9QRvahusJDQ12xbrISqYzqFcqeVfhSTeSxh+nAr8bmwKVHqWQ==
X-Received: by 2002:a19:4f4f:0:b0:499:4b:e4ac with SMTP id a15-20020a194f4f000000b00499004be4acmr7546915lfk.189.1664178289042;
        Mon, 26 Sep 2022 00:44:49 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g6-20020a19e046000000b004978e51b691sm2453298lfj.266.2022.09.26.00.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 00:44:47 -0700 (PDT)
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
Subject: [PATCH v2 13/33] dt-bindings: pinctrl: qcom,msm8226: fix matching pin config
Date:   Mon, 26 Sep 2022 09:43:55 +0200
Message-Id: <20220926074415.53100-14-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
References: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
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

