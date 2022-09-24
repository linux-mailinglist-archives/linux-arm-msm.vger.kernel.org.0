Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB485E89A9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 10:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233339AbiIXIGv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 04:06:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233721AbiIXIGF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 04:06:05 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61C25122058
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:05:34 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id a2so3528139lfb.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=OXB1JJnvpREkopChp5a3jHnCV18ZCMCVb3LDYC85iAk=;
        b=Qw0XMyxq9XhsGSV8rSRc8Cn/Z578WiwrCcAe5Ew7wb1vPGFEkf6wsUcmKenupTszy8
         0JZXNSLc91S5vWT+vw4Z8GHN8Ecqhsf96VSoKvaZuIDzHDpLxIpnW368ZiXAGTjttYrO
         Zwu979JfhNp1KibG+6cG+HAvtZc1xU/6hka/9YL2usT9ALUzig330awETosq4WJaJVqs
         T/434vtC6U/yyB3BSCyDYlPd0jsYZcbV7WCl61yNTljCJs8shUw2JEJKzsFfOijy8Je2
         fOipT0ijYLM0SZ6Z0S2ZDKdO93U9ECBsPm5C+waEa8gKYfQGtKhh+hqA/oZ+XYcQKJ7d
         Gsvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=OXB1JJnvpREkopChp5a3jHnCV18ZCMCVb3LDYC85iAk=;
        b=HEUdpOvSC+HyAnfSssHARkSpKJEyDJsUkz5vcjEkw792/LdnoQLmNbohKP/mOSMBKt
         Hjh3YKWwmQTnJoKBHZrVxLEYmgPAGw0cpA+fGu5wlUL7XaVkSGg5WwcPXPah7fGvdO4t
         /8dR2Hv/QBqP6VR0Bv6f+CZNqVONpM7qtz/joREdUq3WF5SKVp0lmv50pt9ngmXXpnhX
         DJXj0IzxrqZJ5Opew8GB1uF1bd29XoL4QnqaBzeRlnnLrRlwzP1AC/fZjkycy8zIdmad
         nFgIV3yF/tXh5XqXR6sOKh/U7OG/HIljyQaV8sEoYmvbkJp7Id4E38ilU3Wx1VojVQt+
         xRTQ==
X-Gm-Message-State: ACrzQf2ttkIn1qDwBqhF9Po19cTGyRpt+d/sey5jDTHfFOaBfjHd4xHb
        UwulFmXOtTzX5grT1L7cDc0puw==
X-Google-Smtp-Source: AMsMyM6/dvw76Ol2pCwL8Hm50D4bo1Ci0W33LWDkwe6Vi9rDoTeyhqOjp6PAm6oiZ1o/ddijQlPiOA==
X-Received: by 2002:a05:6512:3128:b0:499:3c1d:f9e with SMTP id p8-20020a056512312800b004993c1d0f9emr4770567lfd.634.1664006733589;
        Sat, 24 Sep 2022 01:05:33 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y2-20020a2e5442000000b0026c41574790sm1696668ljd.30.2022.09.24.01.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 01:05:33 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sricharan R <sricharan@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 20/32] dt-bindings: pinctrl: qcom,msm8953: do not require function on non-GPIOs
Date:   Sat, 24 Sep 2022 10:04:47 +0200
Message-Id: <20220924080459.13084-21-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
References: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
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

Certain pins, like SDcard related, do not have functions and such should
not be required.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,msm8953-pinctrl.yaml       | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
index c162796ab604..67d3d90839ad 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
@@ -59,7 +59,6 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "/schemas/pinctrl/pincfg-node.yaml"
 
     properties:
       pins:
@@ -139,7 +138,16 @@ $defs:
 
     required:
       - pins
-      - function
+
+    allOf:
+      - $ref: /schemas/pinctrl/pincfg-node.yaml
+      - if:
+          properties:
+            pins:
+              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-7][0-9])$"
+        then:
+          required:
+            - function
 
     additionalProperties: false
 
-- 
2.34.1

