Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31BDC6001C8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Oct 2022 19:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbiJPRDW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Oct 2022 13:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbiJPRCp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Oct 2022 13:02:45 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39A1037435
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 10:02:09 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id mg6so6240582qvb.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 10:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkxpRfvthMQRkjuRkMuhszBduBQdOCaoDx8XGiiNaXE=;
        b=FF0ZZRRl+dfHZ3gZqs7zxjk9lYREJn4EGbAXjTxVJMKkSrInBPjjJJ0tjpjy4mR3w5
         cbRAzglYzETzRY9C0Z5snGLsQP2+E1uMvUe/FN8+WxBn7UWioB7NoO7mcCYpvVm56tK+
         fMxU8kxgjc6OmmGSdJhaMYy/OO8zSDzgcJ8h9u/zTTaQZfE9AgkZFq07u4g7l0169O8E
         RcZ/NhNJXkDWw9WJUyzp3Smd2kDPsJiI8J0uOP3FS3NCTv3E2gJELY6NFqcSjMqkFvSc
         8OnbZkeXnXkrwOJAlfHXq9/55Y/8BPWCoqzBTLvXAc0mzIEVyxz7blM/I3XFmTxvf51h
         fkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KkxpRfvthMQRkjuRkMuhszBduBQdOCaoDx8XGiiNaXE=;
        b=JYeVHuypVzwVay7kFkc8TAFxbRN2k9f4kU+0GDJe9k2Etf83FrNKSNV5EadDCdwfIA
         xTODDAD0tbbkPWLRur1P/IIB/RASABGa/WhUlh9xZDfuN9jKuqaW9kPHBiaQt9ikRzcy
         +tuT4DTw3xhMyVi0VMN4VCTI2mIFQAs5fP0Ss1miAQXEF6drl0j+8+QdjU34nu6uilzH
         VdI3i0yp/lPeZ/sXacuUcVdqwcXI9hbfZi0DCpA+R3lTWehOHJJrYjXSqZ1OiNmtXep7
         3aDkeOnfN1mlE3XKCXRzOj+1vcft21q37EfEmFhbSVBx6AV/4ZlfSRUlS8xDwj/Wdtdm
         ww8Q==
X-Gm-Message-State: ACrzQf0Q3py4YUjOqtZKNd2QDMomwzmpVlm2u59xzo3+IRPtxEhS7078
        wn/sfbOLiFDevBnGDE0hoQUy+w==
X-Google-Smtp-Source: AMsMyM50GDjeFfLoQbAlxmqn4jw5Q2xwTE1SWr00SNauMKMs78AzjR9XeKN4fTOkH5jo1xczY6e4kQ==
X-Received: by 2002:ad4:5c4c:0:b0:4b1:bc38:5e0f with SMTP id a12-20020ad45c4c000000b004b1bc385e0fmr5627556qva.41.1665939719740;
        Sun, 16 Oct 2022 10:01:59 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id q6-20020a05620a0d8600b006ce7bb8518bsm7539967qkl.5.2022.10.16.10.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 10:01:59 -0700 (PDT)
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
Subject: [PATCH v5 14/34] dt-bindings: pinctrl: qcom,msm8226: fix matching pin config
Date:   Sun, 16 Oct 2022 13:00:15 -0400
Message-Id: <20221016170035.35014-15-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org>
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

