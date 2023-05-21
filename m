Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B578570AFF9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 21:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbjEUTgn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 15:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbjEUTgm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 15:36:42 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A2C1DD
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 12:36:41 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2af29b37bd7so25230861fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 12:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684697799; x=1687289799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EiroO27hS4AZF+snBjK2iCZGd/3jX9bw1tCwVqyDokg=;
        b=MYSK0F1An91HeWwlzUzrReL9xdStCHQ9UZ92xXj1srFDH9KnUnDPH87zTEkhXAPZ3M
         CEvfms3WCgO/Fe6fXJk6AWCT8Q38EIOlijS5r7VKB0EcTP0On59NGxOCOsYieVMCGhfW
         LTyyxxSB+mcjNsbJpMTnKdiHStfM3cbgzzaXWDDb0ZoxDhVARxVJuoP+WmnXDfyan1BL
         A+wthRBe55gc5/Mwfg/OBjGN/KBBLYsC89MK2Mx9W7pCHuUNAWAbdbIrJ22fqZ9R7Pyb
         3W+aftCy6HsNGOP2lh1hbNZqaR9Eqbk9GyMeN+K0yG4V9jFWC6rCrlttpfywmeA5+zuF
         53MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684697799; x=1687289799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EiroO27hS4AZF+snBjK2iCZGd/3jX9bw1tCwVqyDokg=;
        b=TdZiSqYcV1E85yJ4XwqhBRVKfku8+18Eh1OjxpAzbFOZIzxRsllLTvKoBgN/5tclIt
         h06cwvvicsKgFvbfEwyCR8u2vThOCjCZIaQCWWVoO6NXrrJQQpWM17AIyU1XN1377iAu
         SAa3RtkinXdkZyek8RnEHRS66q/0mmv4esOjh/LtO2akn4V2Z7vkI7uJiTDck2GwpiUE
         f10Pp9Gmg3pcz1J5QdfHX0G7o4O6YZXajUpMZ03UBw8tl/MJkAJo8NSVMnrllg55VVf+
         z/oAZKMp63VN8Yne174IPEx784woj66y8c/byVfaB3hZGzDR17AsX9DQa05mBvtRsB78
         5e6A==
X-Gm-Message-State: AC+VfDx/onKT4N4du5GP5bP/0PIi3h0jkBCCXrqPzbYwhCggpj4fExxw
        mImh0Qg5SLlKfSDbb1EvKWNlsJ+V7kiPDPfeouM=
X-Google-Smtp-Source: ACHHUZ5yXUMlfGUwiVeR7W+1FZlgHbq9Jw6x3gUo+jQyw48gcl0t4R2mQWz4fhPLaVrJxR7pJKutXA==
X-Received: by 2002:a2e:7e02:0:b0:2af:a696:3691 with SMTP id z2-20020a2e7e02000000b002afa6963691mr750983ljc.40.1684697799658;
        Sun, 21 May 2023 12:36:39 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id q4-20020a2e8744000000b002adb98fdf81sm830009ljj.7.2023.05.21.12.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 12:36:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 4/5] dt-bindings: phy: qcom,msm8996-qmp-usb3-phy: drop legacy bindings
Date:   Sun, 21 May 2023 22:36:34 +0300
Message-Id: <20230521193635.3078983-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521193635.3078983-1-dmitry.baryshkov@linaro.org>
References: <20230521193635.3078983-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The qcom,msm8996-qmp-usb3-phy.yaml defines bindings for several PHYs
which predate USB -> USB+DP migration. Now as sm8150 has been migrated,
drop the legacy bindings completely. No device trees use them anymore.
Newer USB+DP bindings should use combo bindings from the beginning.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../phy/qcom,msm8996-qmp-usb3-phy.yaml        | 80 -------------------
 1 file changed, 80 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
index 4c96dab5b9e3..827109d37041 100644
--- a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
@@ -23,25 +23,16 @@ properties:
       - qcom,ipq8074-qmp-usb3-phy
       - qcom,msm8996-qmp-usb3-phy
       - qcom,msm8998-qmp-usb3-phy
-      - qcom,sc7180-qmp-usb3-phy
-      - qcom,sc8180x-qmp-usb3-phy
-      - qcom,sdm845-qmp-usb3-phy
       - qcom,sdm845-qmp-usb3-uni-phy
       - qcom,sdx55-qmp-usb3-uni-phy
       - qcom,sdx65-qmp-usb3-uni-phy
-      - qcom,sm8150-qmp-usb3-phy
       - qcom,sm8150-qmp-usb3-uni-phy
-      - qcom,sm8250-qmp-usb3-phy
       - qcom,sm8250-qmp-usb3-uni-phy
-      - qcom,sm8350-qmp-usb3-phy
       - qcom,sm8350-qmp-usb3-uni-phy
-      - qcom,sm8450-qmp-usb3-phy
 
   reg:
-    minItems: 1
     items:
       - description: serdes
-      - description: DP_COM
 
   "#address-cells":
     enum: [ 1, 2 ]
@@ -126,28 +117,6 @@ required:
 additionalProperties: false
 
 allOf:
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,sc7180-qmp-usb3-phy
-    then:
-      properties:
-        clocks:
-          maxItems: 4
-        clock-names:
-          items:
-            - const: aux
-            - const: cfg_ahb
-            - const: ref
-            - const: com_aux
-        resets:
-          maxItems: 1
-        reset-names:
-          items:
-            - const: phy
-
   - if:
       properties:
         compatible:
@@ -202,7 +171,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,sm8150-qmp-usb3-phy
               - qcom,sm8150-qmp-usb3-uni-phy
               - qcom,sm8250-qmp-usb3-uni-phy
               - qcom,sm8350-qmp-usb3-uni-phy
@@ -223,51 +191,6 @@ allOf:
             - const: phy
             - const: common
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,sm8250-qmp-usb3-phy
-              - qcom,sm8350-qmp-usb3-phy
-    then:
-      properties:
-        clocks:
-          maxItems: 3
-        clock-names:
-          items:
-            - const: aux
-            - const: ref_clk_src
-            - const: com_aux
-        resets:
-          maxItems: 2
-        reset-names:
-          items:
-            - const: phy
-            - const: common
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,sdm845-qmp-usb3-phy
-              - qcom,sm8150-qmp-usb3-phy
-              - qcom,sm8350-qmp-usb3-phy
-              - qcom,sm8450-qmp-usb3-phy
-    then:
-      patternProperties:
-        "^phy@[0-9a-f]+$":
-          properties:
-            reg:
-              items:
-                - description: TX lane 1
-                - description: RX lane 1
-                - description: PCS
-                - description: TX lane 2
-                - description: RX lane 2
-                - description: PCS_MISC
-
   - if:
       properties:
         compatible:
@@ -293,12 +216,9 @@ allOf:
             enum:
               - qcom,ipq6018-qmp-usb3-phy
               - qcom,ipq8074-qmp-usb3-phy
-              - qcom,sc7180-qmp-usb3-phy
-              - qcom,sc8180x-qmp-usb3-phy
               - qcom,sdx55-qmp-usb3-uni-phy
               - qcom,sdx65-qmp-usb3-uni-phy
               - qcom,sm8150-qmp-usb3-uni-phy
-              - qcom,sm8250-qmp-usb3-phy
     then:
       patternProperties:
         "^phy@[0-9a-f]+$":
-- 
2.39.2

