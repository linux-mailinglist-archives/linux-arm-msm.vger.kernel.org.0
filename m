Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ADDE5F6923
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 16:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231981AbiJFOIy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 10:08:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231389AbiJFOHn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 10:07:43 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D427AE861
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 07:07:10 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id o7so2874467lfk.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 07:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=3bW1Qvg0MH0tJFxbSZFIO74dcCG5BrrzBwgdR++uom8=;
        b=gmLIS2C20+H1JiFziTdLBLcJIPxucNe1kSWljGjWDdkIevNyOF7auPg4A9u+hFzSEg
         pwLHfytyC8GNQ8CQFHdL+q+39Y01jvD6NVEl6RcQx6SjGZloXzJnpo+qSdY8vFQhbohP
         hK9d2HNuCeMO2LLs0FPgVnK9QmNmEPt/VEwdxeEcKLeN8/hsh9bn2AhRjIINrC+X2VFG
         det5mCIwGvfs6H83Ohe3r2/EIoF2SvmKdwDbj+wwvOFD4hqVormben6kmakN1+P4zMWH
         h8NuF7QDjkR2oCd5tiPgOUsI4BX8fYX76amWqmeit4Dugk6kqSdS90bpYM7iAp+KiOK4
         iefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=3bW1Qvg0MH0tJFxbSZFIO74dcCG5BrrzBwgdR++uom8=;
        b=zR88lEbfyHnZNo8v+XrGe9HyCwVpDM7kOR+r4pCgh9vkSvETyUYnCBUh13FnRFK5s1
         FhVmSgCSR8UUtO2IOm+GvThpnvEnE3lIHdfXpRdJlxgV5H7kyTKH8GXkn2oegmOrQsY7
         mt2mmmnOEi2vn7EhcBgQJceOFqeu3OIFbuHD4mNfteR2sZWg/T3/jrs5TRuByYcNyv6Z
         Vs50kwt2/VqjZSzSTK9Vb0uNL5+rWiNOoHN9jIzhLDo2CTIVag7ypXG2Tw6qM8zyiURs
         McyqlzimbAvWfzB0Hg/+Ftcsc5exwhzJzOZLz/nGTvJPsDajTPb7BtEXs0wTgIgetm0D
         c8Eg==
X-Gm-Message-State: ACrzQf0LGVQ5ylILRQ/MA6gB2jwj72JxxsxxXRdVqscgftMJfCqcXCr3
        ntS1dsdN0gXeZ6T6HZkNsxOJng==
X-Google-Smtp-Source: AMsMyM6yTLEmPvt0JA5aAERoCFQxNoFCOQ8iLNi9Gr9tLv97XjUxg753PR7O3FoNtUO/fK5FTVvA0Q==
X-Received: by 2002:a05:6512:3e23:b0:4a2:585d:7441 with SMTP id i35-20020a0565123e2300b004a2585d7441mr40270lfv.265.1665065226449;
        Thu, 06 Oct 2022 07:07:06 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z3-20020a056512370300b004a2386b8ce8sm1833929lfr.211.2022.10.06.07.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:07:06 -0700 (PDT)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 18/34] dt-bindings: pinctrl: qcom,msm8909-tlmm: minor style cleanups
Date:   Thu,  6 Oct 2022 16:06:21 +0200
Message-Id: <20221006140637.246665-19-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
References: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
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

