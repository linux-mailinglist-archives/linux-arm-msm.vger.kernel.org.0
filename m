Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A786D5F694B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 16:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231876AbiJFOJi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 10:09:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231582AbiJFOHp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 10:07:45 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDB27B0B08
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 07:07:18 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id a10so2414305ljq.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 07:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ffrZlWhWALv9ZHVXm4CUthNCnfvzTcP8RIEkQS+jo/U=;
        b=REXPOF9FG/8vG8rVapuNbr8392SSdHtdNdVqlR2F/N+qHHlS2huWvI2uR5kvwgTvDo
         mZ5Mfu21oXW+ePky2iZ1me4WViLeYtqqUMhCRHFkL+Sp7z6luhQXg9yOjwwX5cBZcBRI
         SDKjc6LbpzAnThyjjT3dXKhchURw3Jl6fUGCjQp5DB7e7AAg8rD0A6u4KzqfXPQ6HWbN
         aa4fVaDdH9aXik9A0hqYE2MQ0BuRpx64J22poQj8CeaZWDYfcCytyGbIfOELsDUZ/TXl
         jBK/DhSAziqyEkPr+ReVMA+EnUDXsn2KWytDcGb+8aWLkCQgZdfPLvUdbUNWUCj2jskS
         5Ynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ffrZlWhWALv9ZHVXm4CUthNCnfvzTcP8RIEkQS+jo/U=;
        b=OSGuNHMxhUnKMZCHiO+2HX1oHrVf6qltIrZ5hDYtGSv0nUsOFUYQlvCNBlPOvXUlFS
         cWDzYs6ajPh9FoCXw+i9TY6nXzakVq8pWQHNkbi/S58o+0AZcdZePq2j+ZpJL1XTFxfq
         ubzCtbO8GAdollETHRIEuQldsPTfBiEJQ7ALqHj/XzsLk1qGCTwCJ34egOEvsX21DIEy
         W9WQAC2EYTDPh+Uzl/omOiqkGhg7B46H539218DwTY0gae/2rkMD1g8OJ2WFOQU31c8m
         QtD1RB8gG+Q5NTq79qipc/WFj4i6uJl7NaFz3LN0jZMmoLnj2jCAImCRNE+Q/clyegIS
         YmeQ==
X-Gm-Message-State: ACrzQf0yN000DqPI7KbcOxtM0WHheVj+YdNHnniUrBfTrX7hxG0HqNhO
        NcFIb4AAi1Jlns+QESrP1tPEAg==
X-Google-Smtp-Source: AMsMyM7GTYiWGaCGuSoacfgHkmwnlfJD8dzjrEChyOQ7/TT1tOknx19Wa1eDghFxLB7ega+Yt+yhXQ==
X-Received: by 2002:a2e:8181:0:b0:25f:e028:a67 with SMTP id e1-20020a2e8181000000b0025fe0280a67mr1908562ljg.89.1665065231721;
        Thu, 06 Oct 2022 07:07:11 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z3-20020a056512370300b004a2386b8ce8sm1833929lfr.211.2022.10.06.07.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:07:11 -0700 (PDT)
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
Subject: [PATCH 22/34] dt-bindings: pinctrl: qcom,sc8280xp: minor style cleanups
Date:   Thu,  6 Oct 2022 16:06:25 +0200
Message-Id: <20221006140637.246665-23-krzysztof.kozlowski@linaro.org>
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
 .../bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml       | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
index 886d4e76af44..ec0e4bf9e0af 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
@@ -10,8 +10,7 @@ maintainers:
   - Bjorn Andersson <bjorn.andersson@linaro.org>
 
 description: |
-  This binding describes the Top Level Mode Multiplexer block found in the
-  SC8280XP platform.
+  Top Level Mode Multiplexer pin controller in Qualcomm SC8280XP SoC.
 
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
       - $ref: "#/$defs/qcom-sc8280xp-tlmm-state"
       - patternProperties:
@@ -47,7 +46,7 @@ patternProperties:
             $ref: "#/$defs/qcom-sc8280xp-tlmm-state"
         additionalProperties: false
 
-'$defs':
+$defs:
   qcom-sc8280xp-tlmm-state:
     type: object
     description:
-- 
2.34.1

