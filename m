Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC925F668C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 14:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbiJFMsM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 08:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231411AbiJFMre (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 08:47:34 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1982FA2A80
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 05:47:14 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id bp15so2505963lfb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 05:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=F+J798FgdxjOymxzo9NpgSksOzAvjC4SZmthtS8ZpaI=;
        b=RFHtvVyDqCucmapJX1wB3SdolJJAGxdi9jSggDjr40zqTpquDnWdDm3VsKEsW0BxsE
         D/FXc3Z37TtZ4RVG5jTyTgj6BTOMRndOEMcz7iwIDUAQwnm7s0F5MxgxbgvKg09Jd+NT
         6ZS6mZtR7l7hLMkg2ZZ23qfKgfkcldxvn6TATLfD335XaX8oiNjGHUJtt67w82YW7Z4w
         BenVln062F/MGeM25YQBraVbJxNKtWx59i4NBcWIL20ngOuNp3+wF4KtH8aP4wukYBCI
         /rEltOPHP2uT+lg+Adt1bMoU7oVfE+ebq0Ve/YQrOPZYkxU87hbaDJKYcChNzXDX1EAq
         vLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=F+J798FgdxjOymxzo9NpgSksOzAvjC4SZmthtS8ZpaI=;
        b=VyqlJ3ekHIRlH1V59qlToXumATUCMGHas4PNGTuODtehNd2+pnX3s5/ers5v6sOYdf
         iKYD1isB1F4UgdWzpgN0Sv2nAryJxuXMAUu/PeBIXZ6hLO4WCPtiErGAyNmAKpt9uEoF
         nLSVTseeYyOt9JMkps/8RgVmr4V6vpL2EYV4MW+bEzsKr++AnI6FSEq3FpwlD0p7RI2B
         MN6Iv/KMP/gwtaCXb0CSPhYaK3cKTOzs7ssfPRju6aK2I6hP7kUFkPWOtyVFt8Ga53H7
         4TMsbLJdZyjq1Yzpsein2LFMyl27MI2GjEynN15p5iB5sxv/JJXLEBRJzOCNwJYDZZNd
         kGYQ==
X-Gm-Message-State: ACrzQf3/V4g2JF6CXSvWsk+cf++4GN/YO9cwjaORPS5Yo6qSulRDOZYG
        Ph1fnG8akneiGqI4Mis1hUuizA==
X-Google-Smtp-Source: AMsMyM5cjGRquyYjHiV0IgCOZqeZWVNQCSTqW+7/jL3Hx2DHFpRm3A6w56ktDxoqX7BpJ1kNgt7CVA==
X-Received: by 2002:a05:6512:3996:b0:4a2:1c8c:c9a1 with SMTP id j22-20020a056512399600b004a21c8cc9a1mr1939179lfu.230.1665060434502;
        Thu, 06 Oct 2022 05:47:14 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:14 -0700 (PDT)
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
Subject: [PATCH v4 11/34] dt-bindings: pinctrl: qcom,ipq6018: fix matching pin config
Date:   Thu,  6 Oct 2022 14:46:36 +0200
Message-Id: <20221006124659.217540-12-krzysztof.kozlowski@linaro.org>
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

