Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 253175F66BA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 14:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbiJFMtO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 08:49:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbiJFMsc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 08:48:32 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85CD8A346F
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 05:47:46 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id s20so2507140lfi.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 05:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=KzWzb3hZrQFEQ0Rr65DWDq+RHVqeUt74LUhgKPrHSTM=;
        b=pbV132erSrm7elZPfUZmdVYCpRBOwrj08a4lY8jaP2h+xs0PQy6gk79ARw0Jp1Fq/D
         xaFTbyps+2U2c1qxkav+9XSrgBSJHTU9aBujEnR+FcdoJAPFEDgnagsNROJFRr+6LBK3
         bsU7WYtndhfG5yPUHZPn9zPKAY+dHmUeM7bIagckiVTptaf6UVkk1qxNvDcmnGMwoV2e
         Kuyr6ShexfFegP51KQNGkYyQ0PFInNp4VG22SNib59rp/Y+BGhD7s6IEsLOqFQa68Dc0
         cC+PqZrYOVZ1xb6/eVSoWcwaR3WrKIWllRy/xHSI+oS+YKi0c1YTnN2pb3UtwClurB+t
         LAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=KzWzb3hZrQFEQ0Rr65DWDq+RHVqeUt74LUhgKPrHSTM=;
        b=K3C5kl6tl7WIjixc5VUQrsqgojli5vuzhO3u+ioT7h/2xSf0mx076ncNQBU/qCjG2w
         8rBcXOvzxMNvjbKAFIE1UpCZUKH6uzsVRJ9Dz66Itb/zgDVCSjBy1w5k2jUq74JMEoeX
         SB3+urYai+lAK/9i6NXIKBwJeaYR+PdRcOI+AIXM+ZBhyo6lK2R5IfKg1Svu/ojVm1kg
         ZPWbsRYGpX/VH5PRJugSV105UbRWvaqUM6bQg4qxsu0vNoe7dqmSO23thquS4jobihb2
         kY+yGGkgeuLqomA1jY9qCIoUcsweZU8ZgpETniCN61QOhe0UiKbPZAOoBcFFzVh8t/JE
         r3iA==
X-Gm-Message-State: ACrzQf3NEHU0adGX84oiWtn3QacsJM9BBb32Qo9dGTw25VoJ2ZjbhnN8
        61B7kuVOxEdiVT6NQ1nGdkWmNA==
X-Google-Smtp-Source: AMsMyM4nqPq7cboF8SSXawT3xALdyQXIQ3wwuiV91S6EyNIsbWNNKXYAKfC2J5jejaV/U2J/ttEUaw==
X-Received: by 2002:a05:6512:12c2:b0:4a2:71c2:a7f4 with SMTP id p2-20020a05651212c200b004a271c2a7f4mr1293656lfg.3.1665060445855;
        Thu, 06 Oct 2022 05:47:25 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:25 -0700 (PDT)
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
Subject: [PATCH v4 21/34] dt-bindings: pinctrl: qcom,msm8953: fix matching pin config
Date:   Thu,  6 Oct 2022 14:46:46 +0200
Message-Id: <20221006124659.217540-22-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
References: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/qcom,msm8953-pinctrl.yaml     | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
index d4da558cde54..c162796ab604 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
@@ -44,9 +44,17 @@ properties:
   gpio-ranges:
     maxItems: 1
 
-#PIN CONFIGURATION NODES
 patternProperties:
-  '-pins$':
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-msm8953-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-msm8953-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-msm8953-tlmm-state:
     type: object
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
@@ -163,7 +171,7 @@ examples:
               #gpio-cells = <2>;
               gpio-ranges = <&tlmm 0 0 142>;
 
-              serial_default: serial-pins {
+              serial_default: serial-state {
                     pins = "gpio4", "gpio5";
                     function = "blsp_uart2";
                     drive-strength = <2>;
-- 
2.34.1

