Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E56A686A5A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 16:31:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232505AbjBAPa7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 10:30:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232507AbjBAPaz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 10:30:55 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F2577266E
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Feb 2023 07:30:44 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so1680224wma.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Feb 2023 07:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tair4mz+a4obQdG879OvEbNq99uoHpxmQ0gKuRSjXG4=;
        b=wrJhR22MXiWoNeZoWSVyjKX5RKH40pbhYc5+N/XWhrl+SQ5JNwFMCcGbFOWzokOKJp
         +cxuf6NBw4IzUmNaeAQHFmAAHLfjEXl6F3ztGRtor8h9YKWbtO1MkN98nQ+ReWVSaV2G
         ZLjghbtbZNPlP0Nq/56NIi2YgQ+WYrUd6uTZpOfmpK8BglPJwiJJK2GgSzV9hGI55HtL
         0kEHKAy2u6qD5PbIZ5fmp/T7xFqCPfsRhNEK9nJZciIk983g/8rEvpDiNIl9Sb1rsgGK
         b4gPQRIpW54sIrpxfksnOOYzKpkJNMsrKxLi+eWE1WuheLzjVUzykhEx2CLTM+rkDtZ3
         6M7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tair4mz+a4obQdG879OvEbNq99uoHpxmQ0gKuRSjXG4=;
        b=Vz3PuI+1KIHyqTVlbCjEhqzmRA6OOrE5F/ykd4NXdM6Q2/3o0vhvagGlMZXmqvkAgK
         RziPMJDic6qTQ/aCF8HGR/LAWkOcmAdejL0nBknxhfmdcl5shViXk+PALdwXCgihs90T
         BgUTP/GFFcDZOz5Pu7csDks7ojLIhokxULLhe779zhBqwEpWoT9a2p7eAq2+rzxGeEu4
         MdAvutXSLP+77c0kV+Y2FoUZDyHMr5O7urYhkM0XnbTCbU3wofbs0gumUbrfb62ocHX8
         NTt9YcQoenavvN6CI0MRtGzRjxsYaJaK1blRp+x2OY/n3bOWsVzhKAazswGeRdIAgvUs
         daig==
X-Gm-Message-State: AO0yUKUsmvULLU7h4e3JO6p7edpFqdO3r+ZdZhcfKpYNS283ksxR+2ev
        SuGwoIvhXX1w8ZxmRyi4O2iZdA==
X-Google-Smtp-Source: AK7set8Nde1TKvNlkHeEPjSMdS16HphYD8A2MWZqeOn5RGH1GDGedKkWh3M5yuMLgTI/xoO2Qa6b+A==
X-Received: by 2002:a7b:cb85:0:b0:3da:1357:4ca2 with SMTP id m5-20020a7bcb85000000b003da13574ca2mr2709227wmi.11.1675265442761;
        Wed, 01 Feb 2023 07:30:42 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p11-20020a1c544b000000b003dc4fd6e624sm2168032wmi.19.2023.02.01.07.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 07:30:42 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Richard Acayan <mailingradian@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Martin Botka <martin.botka@somainline.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 6/7] dt-bindings: pinctrl: qcom,msm8994: correct number of GPIOs
Date:   Wed,  1 Feb 2023 16:30:18 +0100
Message-Id: <20230201153019.269718-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201153019.269718-1-krzysztof.kozlowski@linaro.org>
References: <20230201153019.269718-1-krzysztof.kozlowski@linaro.org>
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

The MSM8994 TLMM pin controller has GPIOs 0-145, so narrow the pattern
and reduce sizes of arrays with pins.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,msm8994-pinctrl.yaml   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8994-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8994-pinctrl.yaml
index f4a8180f5959..0c4936fc35ef 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8994-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8994-pinctrl.yaml
@@ -34,10 +34,10 @@ properties:
 
   gpio-reserved-ranges:
     minItems: 1
-    maxItems: 75
+    maxItems: 73
 
   gpio-line-names:
-    maxItems: 150
+    maxItems: 146
 
 patternProperties:
   "-state$":
@@ -63,7 +63,7 @@ $defs:
           subnode.
         items:
           oneOf:
-            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-4][0-9])$"
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-3][0-9]|14[0-5])$"
             - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc1_rclk, sdc2_clk,
                       sdc2_cmd, sdc2_data, sdc3_clk, sdc3_cmd, sdc3_data ]
         minItems: 1
-- 
2.34.1

