Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3EF5F6675
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 14:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbiJFMrf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 08:47:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbiJFMr3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 08:47:29 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53312A286C
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 05:47:12 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id a12so2090131ljr.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 05:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=X0qog3y6/pjQRMdLgI2wTjHB+zwmYy9wpugBMuJA3qs=;
        b=ckmbHXLFJI4cwWenO5NuntW3jM2fKKkk7KB8uy3qSZmUQT/TZiWEzbZ61g23Rbb00+
         JJGmY4K/J+GdT/3iahp0AJ9GS7Exh7XPluXfXR7bIULRpop2NhW7KV4NC7Z6Je5yCxsr
         XZqQFpljOtGWElEfAgvrIoqh+EY7fqYWDPJXp9lGS+rmbQtwBWXZ68oIBmDAGbgGz5RE
         9wXzToPcdcqpde12JgyM7ujNdgAFLfygOMMg25Z7axsLf+7A1CbGonhVIWyqQNxF+9H2
         6aNvNl37hiYdzWyfHPWDEXjTZxO7qJQYc/XSvrifRLGMtqoJR9BcngbHuh3xCRFHSJdY
         Po7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=X0qog3y6/pjQRMdLgI2wTjHB+zwmYy9wpugBMuJA3qs=;
        b=paMqiZ9EY2LF2dvYvySLmj4FGSU4e1G0ay8Em36wpzw9WzIzHaMINHJFtAouuiCy7C
         q/2zFj62CjbEeoC0uVWIX+lQHIKW6Oi8QOrOzv7XlSHF0UKik4h8PdaxnCATRrTyND5Q
         ToPRBei0u9t6pMFFbKHTaDbG8eSpcle/YCk6C4gij9yyw5CPV7rNALB5I6QzerQOO0wM
         XuUn9XY54/BytRg7SW5oh0qI4h98Ry/Ila5y/HMn5ipiENjSlNPb3B3ao5tVy7kT+RPq
         jPC1yq499nunzeT8oFrg+0jkdvB8JD4GY5kJqG9KPCAj03GGYtOXc6gxv3ZkoD3dZISv
         zgAQ==
X-Gm-Message-State: ACrzQf00YkKOn8qk/nX/fPvERxk+HiAxHxy5k/tHEo9XyiC226BgZY6k
        CC7ZIkr+3Gn6Rc8b7FA6Ogu3aQ==
X-Google-Smtp-Source: AMsMyM642mzyFfLaVBo9AnLR3/VtDKQhs34wBxygcCv64ZzSW/x2hzif2n/cFRSAqP5VdliQ6KIsYw==
X-Received: by 2002:a05:651c:897:b0:26a:c213:f0cf with SMTP id d23-20020a05651c089700b0026ac213f0cfmr1759181ljq.216.1665060430100;
        Thu, 06 Oct 2022 05:47:10 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:09 -0700 (PDT)
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
Subject: [PATCH v4 07/34] dt-bindings: pinctrl: qcom,tlmm-common: add common check for function
Date:   Thu,  6 Oct 2022 14:46:32 +0200
Message-Id: <20221006124659.217540-8-krzysztof.kozlowski@linaro.org>
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

Certain pins, like SDcard related, do not have functions and such should
not be required.  Add a check for this in common Qualcomm TLMM pin
controller schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Stephan Gerhold <stephan@gerhold.net>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/qcom,tlmm-common.yaml    | 20 +++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
index c88c8dcb69d9..e1354f0c64f8 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
@@ -65,10 +65,6 @@ additionalProperties: true
 
 $defs:
   qcom-tlmm-state:
-    allOf:
-      - $ref: pincfg-node.yaml#
-      - $ref: pinmux-node.yaml#
-
     properties:
       drive-strength:
         enum: [2, 4, 6, 8, 10, 12, 14, 16]
@@ -82,5 +78,21 @@ $defs:
       output-high: true
       output-low: true
 
+    allOf:
+      - $ref: pincfg-node.yaml#
+      - $ref: pinmux-node.yaml#
+
+      - if:
+          properties:
+            pins:
+              items:
+                pattern: "^gpio"
+        then:
+          required:
+            - function
+        else:
+          properties:
+            function: false
+
     additionalProperties: true
 ...
-- 
2.34.1

