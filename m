Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3EFE5FB9A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Oct 2022 19:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbiJKRaf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Oct 2022 13:30:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230340AbiJKR3n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Oct 2022 13:29:43 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C65DB77561
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 10:27:25 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id o22so8536790qkl.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 10:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hGWVea2Q1JaZ/Dedm9+8nbJvnK1pk/GRHSmb3bzcTM=;
        b=d/6Dw++TWoCfkEXcDLf4NN9pvhNxy3QrJtju6UEgotMx/R2t1/P4MD/X7jYXOoRMdM
         MrrAs4ig9fma8wecWQLyEKY9GTvQ9ssY+nlY+vRoQPdavJ7iCjauVbTvGqY95ax+Y9JP
         F4zdU/2ZK6xC+3AwyYZZ04iB/WAuWPe02hLGUOLPXF4C2oYDxsyNOmyfV6soxOta1E0i
         9Lkxz+8S/cKTQmdhQ6QSF/H1jIS68FibgjQUsgKh+fP+FTZsynkt9SsJ0sIYjW3JeI2o
         YzAsrXHkHulTau4bDxx0sjKkyYlcBjwLXs0Y1nACjvHyRD9f6EzymBvJR/VPuXwJOzIZ
         t13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8hGWVea2Q1JaZ/Dedm9+8nbJvnK1pk/GRHSmb3bzcTM=;
        b=rJH6SvW4/05kV0TZt86tuTP6WOsZCeSX19P62PO5v6hOMoLAYjjjwBjALAkJsIeDC7
         ot0nL5yw2ZryAWY73MZpBQ4occLNE9Lx4LpVb3v+SJyHxCX92308wzhjUdAl87GtBeDG
         v2dMzFvoWd5dtSY9wEMXMZEdLRAbrDJTsm4Lj7a8BFhlWB9eQVpIc7iz+Z9u//0QaVG5
         mBZSS868yhjpM/COLasIRQbUSwcTMCn3GGTvctiAlSvGZrGjmWrib6SL+B8tb2neeI0K
         PIcKMmA9uOlWOyRKAd2dWc1SnFRSm/tx46rN1/CdLA/R5yzpZmf9/z9er83BFzs8K697
         E5qQ==
X-Gm-Message-State: ACrzQf1JIegVJq2zuZ4lfovInYMoMqT6FatQbJzWy7zuh0hmWuGhQEmk
        XlRK+65bw3ZWLUTq3Ejz/48xTg==
X-Google-Smtp-Source: AMsMyM7oHwbAdAliJB1+Ahghp4xegSiLBbrPQbRr8zG0DnrqpbdAZGtXCNlNw7DUAgmXtAoG7M2nsw==
X-Received: by 2002:a05:620a:2189:b0:6e9:856f:944a with SMTP id g9-20020a05620a218900b006e9856f944amr14314901qka.322.1665509217197;
        Tue, 11 Oct 2022 10:26:57 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id i14-20020a05620a248e00b006bba46e5eeasm14289087qkn.37.2022.10.11.10.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 10:26:56 -0700 (PDT)
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
Subject: [PATCH v2 33/34] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi: minor style cleanups
Date:   Tue, 11 Oct 2022 13:23:57 -0400
Message-Id: <20221011172358.69043-34-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
References: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
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
pinctrl bindings), use double quotes consistently and drop redundant
quotes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml      | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
index c81fd74cde1a..01a0a4a40ba5 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
@@ -4,15 +4,14 @@
 $id: http://devicetree.org/schemas/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Technologies, Inc. Low Power Audio SubSystem (LPASS)
-  Low Power Island (LPI) TLMM block
+title: Qualcomm SM8450 SoC LPASS LPI TLMM
 
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
-description: |
-  This binding describes the Top Level Mode Multiplexer block found in the
-  LPASS LPI IP on most Qualcomm SoCs
+description:
+  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
+  (LPASS) Low Power Island (LPI) of Qualcomm SM8450 SoC.
 
 properties:
   compatible:
@@ -35,7 +34,7 @@ properties:
 
   gpio-controller: true
 
-  '#gpio-cells':
+  "#gpio-cells":
     description: Specifying the pin number and flags, as defined in
       include/dt-bindings/gpio/gpio.h
     const: 2
@@ -122,7 +121,7 @@ required:
   - clocks
   - clock-names
   - gpio-controller
-  - '#gpio-cells'
+  - "#gpio-cells"
   - gpio-ranges
 
 additionalProperties: false
-- 
2.34.1

