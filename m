Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 627E75E9B21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 09:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233383AbiIZHs4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 03:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234116AbiIZHsA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 03:48:00 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72062AE6E
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:45:29 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id a14so6432948ljj.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=tiszVZ3U+sZrmN+IVbNNI+6tb1bLHF50MwuU9g23DF8=;
        b=xyIVUuKOVU2ZpHNkNgyounLujMhGA91TAod9uhTeZ4mvlZzIgujT9n0QkR58NOE/UY
         klDlYRC5qPsT+uqeSjXOhjyftoh1GSURXzwTJCuAUcmy5ormLr5/88p+h5Z9fTpo+Tfi
         4UBUzmU9a8EbUxejQZGcUu5SoG2LjseJMjUEauBWBUIX15Zdd3AJ9/FJ57q/DQSA8T9o
         0wsLqcICA5Dh7Ke4d5RnQk7py8p7NjcieTbgkQgDRpuXyn+FRVtVAZWCbxEr3Qq2hNPF
         uh4wPUwoegvdniSCGH89q371BzaN9Mk0WHGQeZyWG4y6EcnJXrpNlqstSU0fv5DFM7E/
         ihjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=tiszVZ3U+sZrmN+IVbNNI+6tb1bLHF50MwuU9g23DF8=;
        b=D/lvo55mh0nGOvCnyqeYcGtFIzjVl8dKga7ITX4zSiI4wtYvIhIX27Gu9ERws2Hz1o
         qaNTtle4tf3CJaxVD1R89lh/PN1zTo6tnAYxkR5BVngNL9ZL1k7OxxmAnjInILAYCPS+
         JYQc8TXRjuRINUEE2mWSISmMx0QTpRjNSXF7qVAzf7RF3qMjNdHgxoFflxm1wbIiVVSF
         YYXaH41C8CyIrrKdRTNNHyBJIdFbofl3u8tJbCHSc6m66QUxh61IblgnIC4EG8l6FcaJ
         85mN9b9LB6YMk/ru28N9LVAeTH2zDauObDt24UfiKcLcdjoY/kMF1nbCcRbVSqQ6sJQK
         dbhQ==
X-Gm-Message-State: ACrzQf33sCHOYDFZpgUapLYRX7OpAjTyS0qRi+rKV8uHUOzT2Gzr5fuC
        pyC7OC7uE8W1KGf1oHr/gjCj+w==
X-Google-Smtp-Source: AMsMyM5R6qhIiL0bGczSL52FiNyrrh35Rq6RB8M0PjiOc/WRWqbtNRt/J9omJ+XS8QB3cqM+4lm2GQ==
X-Received: by 2002:a2e:3206:0:b0:26c:814e:a7d5 with SMTP id y6-20020a2e3206000000b0026c814ea7d5mr3976802ljy.522.1664178319273;
        Mon, 26 Sep 2022 00:45:19 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g6-20020a19e046000000b004978e51b691sm2453298lfj.266.2022.09.26.00.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 00:45:18 -0700 (PDT)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 28/33] dt-bindings: pinctrl: qcom,sdx55: use common TLMM schema
Date:   Mon, 26 Sep 2022 09:44:10 +0200
Message-Id: <20220926074415.53100-29-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
References: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
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

Reference common Qualcomm TLMM pin controller schema, to bring other
regular schemas and additional checks, like function required only for
GPIOs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml      | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
index fff57abf4fbc..52b7a557f452 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
@@ -60,7 +60,7 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "/schemas/pinctrl/pincfg-node.yaml"
+    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
 
     properties:
       pins:
@@ -122,12 +122,11 @@ $defs:
 
     required:
       - pins
-      - function
 
     additionalProperties: false
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 required:
   - compatible
-- 
2.34.1

