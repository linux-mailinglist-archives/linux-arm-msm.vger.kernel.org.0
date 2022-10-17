Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 506BA601D30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 01:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbiJQXEA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 19:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231443AbiJQXDg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 19:03:36 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 482E58304C
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 16:02:26 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id o2so7649174qkk.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 16:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4dRbN0aLfj9QfEIbf0upluuPumPiiqVQlBvgF4rrF4=;
        b=yZrOA0jBC3VOJYe40KTHHM++pBagoQddCIWdUyKUhevKlK/6NI4wlfSV6AqpUR9ihd
         hDRf3pfOj7e/K2E74xTYGUne6HHwrKrJcdNL/d6fN/yzdu1TzLD4/QiE7Ug8S/Hn7JG2
         Ql5roF8awgdnu5ME6jVu+nzEd1gZI0VDoQng4O9/qJ+8jdNsDQiDiIOpvvQkVPQY2F6s
         bgDyWZ/ZsLKfIvi9j0BfaQLDaq59B1kFQSIWFjT+9FFFPCKhhWldqlklnChneBkcCa94
         Ly77QPH33B1Zh8+hhcB4GHnVubr8WBYZAhI3fYza0lq9+1eX4y4LXPI6pTPnikCGTLZ7
         2qDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g4dRbN0aLfj9QfEIbf0upluuPumPiiqVQlBvgF4rrF4=;
        b=VtTbdpJfaa8MR5YNwFdkQ9by6ItxHjCVQv/DNyorPjuYh3ixvpH44pZnIbdjbsVJFa
         /dU0z+VRhPkb7DjnpoqJBVozFYKPCPXz6Sl6pjCIsXKTg++RLYc/h3zcgo0VJiwNQGd+
         l0x3cALnz62G1G/yDSpx/2dsebEdrtn+qdq2egqv3dE0snuefsmLSvrcO100pxb1D6sf
         kVOKtC2REF3COiK+CQWSP6Duu0KxvU2VySDg3OzhEpfFSRgns/Ib9rBe78sXTRTx5C1P
         9xcW5JXxU7Bj4Qm1LbiRxv/GF0x/vxuWg4omnDPqqoWrkod3ndzOSyGLuM92ukEFgO3u
         wFxg==
X-Gm-Message-State: ACrzQf2wUy3nK8ciHmmnzXxWQPy1igzXUv9LDaqruJTo3C0l9jQZbF8b
        9HEbDqvrTZhNSin2kNSKNMR/wg==
X-Google-Smtp-Source: AMsMyM4xeILJ2TvlGI4mmjCkzb/+FpZvZPT/Xgy//MhrRcl13mKgpnnIu0Z3XYk9ikGDdNn5S5nixA==
X-Received: by 2002:a05:620a:1293:b0:6ee:dfb8:d448 with SMTP id w19-20020a05620a129300b006eedfb8d448mr6713360qki.510.1666047682014;
        Mon, 17 Oct 2022 16:01:22 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id fg11-20020a05622a580b00b0039cb9b6c390sm729670qtb.79.2022.10.17.16.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:01:20 -0700 (PDT)
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
Subject: [PATCH v3 24/33] dt-bindings: pinctrl: qcom,sm6350-tlmm: minor style cleanups
Date:   Mon, 17 Oct 2022 19:00:03 -0400
Message-Id: <20221017230012.47878-25-krzysztof.kozlowski@linaro.org>
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
pinctrl bindings), use double quotes consistently, drop redundant
quotes and rename file to match compatible (to match coding convention).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 ...om,sm6350-pinctrl.yaml => qcom,sm6350-tlmm.yaml} | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)
 rename Documentation/devicetree/bindings/pinctrl/{qcom,sm6350-pinctrl.yaml => qcom,sm6350-tlmm.yaml} (95%)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-tlmm.yaml
similarity index 95%
rename from Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
rename to Documentation/devicetree/bindings/pinctrl/qcom,sm6350-tlmm.yaml
index 894e59caa735..41e3e0afc9a8 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-tlmm.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/qcom,sm6350-pinctrl.yaml#
+$id: http://devicetree.org/schemas/pinctrl/qcom,sm6350-tlmm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Technologies, Inc. SM6350 TLMM block
@@ -9,9 +9,8 @@ title: Qualcomm Technologies, Inc. SM6350 TLMM block
 maintainers:
   - Konrad Dybcio <konrad.dybcio@somainline.org>
 
-description: |
-  This binding describes the Top Level Mode Multiplexer (TLMM) block found
-  in the SM6350 platform.
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm SM6350 SoC.
 
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
       - $ref: "#/$defs/qcom-sm6350-tlmm-state"
       - patternProperties:
-- 
2.34.1

