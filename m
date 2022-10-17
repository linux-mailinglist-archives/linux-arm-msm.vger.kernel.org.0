Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B32B3601CFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 01:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231294AbiJQXCU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 19:02:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231135AbiJQXBj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 19:01:39 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F54283073
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 16:01:22 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id m6so7667758qkm.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 16:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVlpIeK3DosLFJYRvI8e5R35sYlWCbAuX/Ps8Xg/6Kc=;
        b=marIk/KqymBULu3BIPKIRPWcDX0FpTeJdCSFKRG6UVH5fVuKrlFPlj5JEduZjOvyBV
         uQgOcF+MPjZjZ578/mh/uRNUNFyBkD8gxGnVRkRhGRuQF975hIxKr5Is7At3H3YUKr+h
         NeXNdNMhIX6ZVshQLh4RdM28jbfkl5VVgKIfomVaZPomQfZY6au7wUu8rQNBO3BrBWJB
         p/S2pUvG4WuqOIC5ZpgyQ2T/IqalzvAo7UQ45MfFvdHQmDiPqQLm/ZEkkX7Nq7vImOB5
         wi3T+rYgQ7DpPXAD3cYlPQtL7WYS2i7PNtr+UitHCTD+l1vhfCnb407dR++U+RdA/8VD
         ohxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVlpIeK3DosLFJYRvI8e5R35sYlWCbAuX/Ps8Xg/6Kc=;
        b=qWKb3cN1TGl0/ELNK996diFPOHOmWvMFTzCab4Itr6D0OUiVFcuKruF9gEbkKDEP5L
         hXy+psSuKt6xzlcjV2a4KDTgcY9D65hcMY2M8tbosCbF2jf3khqCgcyqxpSQhbIBDMN9
         ladcOdm3H92mkLMCmNUVckviwnBVSZWX2+s6WkD9HfeM8QavyyD6BV/VlVYFd9wDPKMj
         2mP/mHLPREGywPMckjGcsaPsuqE6QgDlCt1IwI/EfJ/mo+JukwiK3B4W8rnXCXQdNuN3
         JHieVYSeBrXjeorvEs1BUHMfsN7RUn8JclicJyKMpdzbA/D3hZz8NdTIfPT0AFs7RXMV
         Od/w==
X-Gm-Message-State: ACrzQf1SzZull7IXYxADuCk1YxI5Kiisl0B8upGXgblfqTbsDpbT3rCr
        m4ipZBciJEwmTngiVXvJn8Cf3w==
X-Google-Smtp-Source: AMsMyM6MOILROLw7rXp1Wi2kxRgVurEp0XCsXCKDp3+SWDDstzTgWXqVp4uTJVAca9BOK9CcX90CSQ==
X-Received: by 2002:a05:620a:bc2:b0:6cf:468e:b8ce with SMTP id s2-20020a05620a0bc200b006cf468eb8cemr9237475qki.699.1666047663441;
        Mon, 17 Oct 2022 16:01:03 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id fg11-20020a05622a580b00b0039cb9b6c390sm729670qtb.79.2022.10.17.16.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:01:02 -0700 (PDT)
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
Subject: [PATCH v3 14/33] dt-bindings: pinctrl: qcom,sm8350: drop checks used in common TLMM
Date:   Mon, 17 Oct 2022 18:59:53 -0400
Message-Id: <20221017230012.47878-15-krzysztof.kozlowski@linaro.org>
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

The common Qualcomm TLMM pin controller schema already brings
requirement of function for GPIO pins.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/qcom,sm8350-pinctrl.yaml         | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
index 1c0186050dcc..cae726b5fc79 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
@@ -53,6 +53,7 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
 
     properties:
       pins:
@@ -107,16 +108,6 @@ $defs:
     required:
       - pins
 
-    allOf:
-      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
-      - if:
-          properties:
-            pins:
-              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-3])$"
-        then:
-          required:
-            - function
-
     additionalProperties: false
 
 examples:
-- 
2.34.1

