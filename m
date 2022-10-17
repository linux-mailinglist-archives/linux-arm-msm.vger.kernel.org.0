Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10493601D74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 01:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbiJQXPY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 19:15:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbiJQXPX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 19:15:23 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BE7F2EF74
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 16:15:19 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id d187so13069546vsd.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 16:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iE4vSe5hWotrWOkI1wwSCz4sPd387WiOtTSfYxWCa6o=;
        b=AdKJebHm1MORD5u946Bpgojih9XaFFX8TFi2Geg3fhKqhq+Pt/yVBfn4rDohlFLkj9
         S9F4N89IjeSji011rHLrMA83Fp6OC4ntSFhIMcmyA6ksJW6RIw5TY7t0HNOh8HrkMhMJ
         fZzRVvnuBMaswkEjTHNMG6ouySuHP675jmLfBKjMUJkNenk0VNyNTt2XCWytcreNVNh/
         FidFCGVCM9rJLphTBhXDXopGphQp0e0dJKP7XcWs2L3EnN6DOC0AgcvNw7uPHpu8eAtW
         JshGNcM1EIM9UhM1jMx5gZtCeBC68DRtsRTvAvJEifgiHfwvdyWUj1osBJhWX310vdvL
         lMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iE4vSe5hWotrWOkI1wwSCz4sPd387WiOtTSfYxWCa6o=;
        b=ilJuzZEDNNzcoRw1BhNO2L9nxLA/Qx6kKHPiPCbpxEnL5iYGBsW+m5wiNjK81DTeR0
         /AgmvmUfISbf4sIPUFWFTsZJjCwzZq4b2xTEyvFWm4LTjy1z8H9/CTvX5gkaGcTr/l9/
         wW5gqwSlwfOd6iSYv4xz5cdFOGAoea3zysedvKhAqBmohwZpZXLw1aZNTLDTCBdRLGZh
         PBnTVFB0mQdnrgiZeIUJLhRxjmPT3zJpTdr+S7HzJq+F5XnD3thDMg8qs+Ud/Fac1k+0
         7ALrnWCIU06EXtgTOhfIQyqzkrWTNXV7zZivhrZ4nEcxW67t8bBrsoP/8qEciMfVQT4R
         +/Bw==
X-Gm-Message-State: ACrzQf0I7GYsqcirdhBgKcTgo/VwEdAUEw88uHYHpch0uZ3gicB3KhBV
        PIWuWFAvARyyEkoNTxmkBx3jUHtkOcmwzA==
X-Google-Smtp-Source: AMsMyM4D5lg1qS66sOdh2HyUb5ZbSlXzUe4jIq3Iqb2dpGMNP+SFUD4XbrmuYu4wjAGpTZMJsq4r/A==
X-Received: by 2002:ad4:5dc8:0:b0:4b3:cf2b:b169 with SMTP id m8-20020ad45dc8000000b004b3cf2bb169mr148059qvh.114.1666047694873;
        Mon, 17 Oct 2022 16:01:34 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id fg11-20020a05622a580b00b0039cb9b6c390sm729670qtb.79.2022.10.17.16.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:01:33 -0700 (PDT)
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
Subject: [PATCH v3 31/33] dt-bindings: pinctrl: qcom,sm8250-lpass-lpi: minor style cleanups
Date:   Mon, 17 Oct 2022 19:00:10 -0400
Message-Id: <20221017230012.47878-32-krzysztof.kozlowski@linaro.org>
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
pinctrl bindings), drop redundant minItems, use double quotes
consistently and drop redundant quotes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml   | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
index 290ba2375e92..bd45faa3f078 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
@@ -4,22 +4,20 @@
 $id: http://devicetree.org/schemas/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Technologies, Inc. Low Power Audio SubSystem (LPASS)
-  Low Power Island (LPI) TLMM block
+title: Qualcomm SM8250 SoC LPASS LPI TLMM
 
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
-description: |
-  This binding describes the Top Level Mode Multiplexer block found in the
-  LPASS LPI IP on most Qualcomm SoCs
+description:
+  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
+  (LPASS) Low Power Island (LPI) of Qualcomm SM8250 SoC.
 
 properties:
   compatible:
     const: qcom,sm8250-lpass-lpi-pinctrl
 
   reg:
-    minItems: 2
     maxItems: 2
 
   clocks:
@@ -34,7 +32,7 @@ properties:
 
   gpio-controller: true
 
-  '#gpio-cells':
+  "#gpio-cells":
     description: Specifying the pin number and flags, as defined in
       include/dt-bindings/gpio/gpio.h
     const: 2
@@ -110,7 +108,7 @@ $defs:
     additionalProperties: false
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: pinctrl.yaml#
 
 required:
   - compatible
@@ -118,7 +116,7 @@ required:
   - clocks
   - clock-names
   - gpio-controller
-  - '#gpio-cells'
+  - "#gpio-cells"
   - gpio-ranges
 
 additionalProperties: false
-- 
2.34.1

