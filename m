Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1932056104A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 06:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231991AbiF3Efo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 00:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231889AbiF3Efn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 00:35:43 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F6F7237CA
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 21:35:42 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id h14-20020a1ccc0e000000b0039eff745c53so852155wmb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 21:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BQ46+pOhZTFefew1tiZRWsO4BNjx2zvjnV8M5Lkucns=;
        b=RlB2bh1l6+zPu1sazqQ6+SRgW1D7AbPpk3yUuf6BBud9GRORUw+F8NqPBPJf8mKQ3O
         cIZS5U4ChjnGeJyRMG5JbgOpe3SAjUbTWrlouOuHgzZEZ78Ss4Td4dEXt3VpB1zfRnaj
         Ogn56vjLctHWw8UHZejux+z1veykw0CT53xq8rdUpUcDn/1GT0/+iy7L5Gzq7/AjIJoq
         1YQE2ss7qfFpu3FyQXFu6Cd6bSAalbrDergkPZ5mzq3qaBIzuzZ8mPJpx4R2/BQgh0jI
         FqcFr5irC1dgOv0xQ1So1JgAuiaphPKAVsQopR49QUknwTdrsdfIR4rTaPZvqGaKJbzN
         qP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BQ46+pOhZTFefew1tiZRWsO4BNjx2zvjnV8M5Lkucns=;
        b=lSqrRPKHOGrZPLIY3nkfjvSuPgUZ+nUUT0v979hGdrXij6TKcgVDMVRzOL47H72pDD
         g7BU+dBW5xh+DfWUCuXa3QZhVdBXiOMxctm/Dky3/AVIk9sm6FQeLja/ftt4VNE6PxBt
         CtVlUMH+yCrxOQoHXbFs+ByPUXSHwehZASQSna9om7Dnsf9jlWxxOAb5xd0Zp6LTM8U9
         lt3jCwnOHnKNr/FPwmgpHuPzKtEeqk6onggxlPuVE2PkdJFXVuKvEoC1ABOKvFImTaH1
         GAp1PrVNHLyP8p8vFPwZrz8ux769U+c3+Aga3uGT6/0UpemB+iK5FLQB38sAopxfKIb+
         oG4w==
X-Gm-Message-State: AJIora9EwI1mNovwQwWklvJl228vWLdWx6g6odW1c3+wP/pELgOZndba
        qidyB9ov6i2IX46EGPsc2YBqLQ==
X-Google-Smtp-Source: AGRyM1veQojEOF45s7FSVAqneUmBYirS6DMUFY6brEmg89K33NIfKvgXfcqJ9ekAH4rbHiqDNJBpHA==
X-Received: by 2002:a05:600c:1e2a:b0:39c:51f8:80d4 with SMTP id ay42-20020a05600c1e2a00b0039c51f880d4mr7913013wmb.192.1656563740712;
        Wed, 29 Jun 2022 21:35:40 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k1-20020a5d6281000000b0021b9e360523sm18642335wru.8.2022.06.29.21.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 21:35:40 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        jassisinghbrar@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH 1/2] dt-bindings: mailbox: qcom: Add syscon const for relevant entries
Date:   Thu, 30 Jun 2022 05:35:35 +0100
Message-Id: <20220630043536.3308546-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630043536.3308546-1-bryan.odonoghue@linaro.org>
References: <20220630043536.3308546-1-bryan.odonoghue@linaro.org>
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

msm8916, msm8939, msm8953, msm8994 and qcs404 already declare or should
declare syscon as they have drivers that use syscon inside of the apcs-kpss
block.

grep apcs arch/arm64/boot/dts/qcom/* | grep syscon

Add in the additional syscon in the documentation for the above mentioned
parts.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../mailbox/qcom,apcs-kpss-global.yaml        | 44 ++++++++++---------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 3b5ba7ecc19d9..f342494fd6108 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -15,26 +15,30 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - qcom,ipq6018-apcs-apps-global
-      - qcom,ipq8074-apcs-apps-global
-      - qcom,msm8916-apcs-kpss-global
-      - qcom,msm8939-apcs-kpss-global
-      - qcom,msm8953-apcs-kpss-global
-      - qcom,msm8976-apcs-kpss-global
-      - qcom,msm8994-apcs-kpss-global
-      - qcom,msm8996-apcs-hmss-global
-      - qcom,msm8998-apcs-hmss-global
-      - qcom,qcm2290-apcs-hmss-global
-      - qcom,qcs404-apcs-apps-global
-      - qcom,sc7180-apss-shared
-      - qcom,sc8180x-apss-shared
-      - qcom,sdm660-apcs-hmss-global
-      - qcom,sdm845-apss-shared
-      - qcom,sm6125-apcs-hmss-global
-      - qcom,sm6115-apcs-hmss-global
-      - qcom,sm8150-apss-shared
-
+    oneOf:
+      - items:
+          - enum:
+              - qcom,ipq6018-apcs-apps-global
+              - qcom,ipq8074-apcs-apps-global
+              - qcom,msm8976-apcs-kpss-global
+              - qcom,msm8996-apcs-hmss-global
+              - qcom,msm8998-apcs-hmss-global
+              - qcom,qcm2290-apcs-hmss-global
+              - qcom,sc7180-apss-shared
+              - qcom,sc8180x-apss-shared
+              - qcom,sdm660-apcs-hmss-global
+              - qcom,sdm845-apss-shared
+              - qcom,sm6125-apcs-hmss-global
+              - qcom,sm6115-apcs-hmss-global
+              - qcom,sm8150-apss-shared
+      - items:
+          - enum:
+              - qcom,msm8916-apcs-kpss-global
+              - qcom,msm8939-apcs-kpss-global
+              - qcom,msm8953-apcs-kpss-global
+              - qcom,msm8994-apcs-kpss-global
+              - qcom,qcs404-apcs-apps-global
+          - const: syscon
   reg:
     maxItems: 1
 
-- 
2.36.1

