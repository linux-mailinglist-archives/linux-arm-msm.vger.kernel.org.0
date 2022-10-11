Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D84A95FB994
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Oct 2022 19:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbiJKR36 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Oct 2022 13:29:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230351AbiJKR2s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Oct 2022 13:28:48 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47F0632ABF
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 10:27:05 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id d13so2603794qko.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 10:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJqm8MsGkAbRd2i0J7XjABuAjaRO4uM6eWixa1qbFic=;
        b=CTOmXAui2hgRqYMq9Sa6mTISz4uJ/h3/nBQ9z7LIYOGcIqAwBijdaZsNTtPTflfXx+
         fWGfTU+kU51iFlgybiSbE3dPi3JtdH84w/pQy349tVxPD4RXNZ6FgNrRC0flEt9n/Kal
         1rl0hjkYI2Gp1y8MgTEmiuxg7ZvHN4TPF/cN6wHRxDoi7X0Jb44BawTQkRSdYYB5zmrA
         Oohu2wwGcw9MGrMAL1qQFZBV2zjlqgFjBlaECgRAxqYBmJ1k5t9BP7trxlUA1p46O62U
         +AmiqU89l+RHILUHj4ViRRN5HEh0Q2C3/gGX96z0nP4c4gjkvVTs93uVyBYXXPEAlO1l
         8agg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJqm8MsGkAbRd2i0J7XjABuAjaRO4uM6eWixa1qbFic=;
        b=FH593bAgp2l8uBb41Tp3QTvfMGpR89E8FWtLkgI2l0eJQJa+E405553uvaGpd68yJy
         3ZlfDSJtfnZV65Qcj5VeiJaF/r95ZlxCpTfEqngtvlDdcQ/IMlSQ0Jq173BHb9905A/A
         ILui2kqMksCDHgUyhrY3paeTznxx6hbkJ8DXZLhXY1wqCWX2MlJnqWpCXXrlhvdl7yTA
         rAXVf58TGJQQcKAuGep+zZ0G4QVABRMJsUfihZqGkcBnM5wg2gMab5Kdo8pJnS9V/QQd
         ScPS0xECCdpN+a686bJk1uOBYYm0zMn8gycFdB9qxu2bVM+JE3ypSmFSiNrnIILfJkwD
         txog==
X-Gm-Message-State: ACrzQf0jrRW7OPaZ0dLzWzUeiKG+eJOXcn/KjlCSIYFb/iNjE2vesvDK
        S+2UzrlTTBH/8lpYcpCx7Y0K0lXrAr+pmg==
X-Google-Smtp-Source: AMsMyM5FoADbiTPWDF9UrxRF0t74SMfB7iVddkLyZEbA6JEYxhF2zeVk2Ujhv7ResTSLKkmKxIy5vQ==
X-Received: by 2002:a05:622a:60c:b0:395:2351:69f9 with SMTP id z12-20020a05622a060c00b00395235169f9mr20329364qta.558.1665509193613;
        Tue, 11 Oct 2022 10:26:33 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id i14-20020a05620a248e00b006bba46e5eeasm14289087qkn.37.2022.10.11.10.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 10:26:33 -0700 (PDT)
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
Subject: [PATCH v2 18/34] dt-bindings: pinctrl: qcom,msm8909-tlmm: minor style cleanups
Date:   Tue, 11 Oct 2022 13:23:42 -0400
Message-Id: <20221011172358.69043-19-krzysztof.kozlowski@linaro.org>
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
Acked-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../bindings/pinctrl/qcom,msm8909-tlmm.yaml           | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
index 9c647e24fa9a..cc6d0c9c5100 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
@@ -10,8 +10,7 @@ maintainers:
   - Stephan Gerhold <stephan@gerhold.net>
 
 description: |
-  This binding describes the Top Level Mode Multiplexer (TLMM) block found
-  in the MSM8909 platform.
+  Top Level Mode Multiplexer pin controller in Qualcomm MSM8909 SoC.
 
 allOf:
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
@@ -25,10 +24,10 @@ properties:
 
   interrupts: true
   interrupt-controller: true
-  '#interrupt-cells': true
+  "#interrupt-cells": true
   gpio-controller: true
   gpio-reserved-ranges: true
-  '#gpio-cells': true
+  "#gpio-cells": true
   gpio-ranges: true
   wakeup-parent: true
 
@@ -39,7 +38,7 @@ required:
 additionalProperties: false
 
 patternProperties:
-  '-state$':
+  "-state$":
     oneOf:
       - $ref: "#/$defs/qcom-msm8909-tlmm-state"
       - patternProperties:
@@ -53,7 +52,7 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
 
     properties:
       pins:
-- 
2.34.1

