Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F17D647710
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Dec 2022 21:14:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbiLHUOg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Dec 2022 15:14:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbiLHUOd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Dec 2022 15:14:33 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37DEA78BBA
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Dec 2022 12:14:20 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id a7so2752018ljq.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Dec 2022 12:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFihLnj80m7OVKSWSB5T98Aozczh+fP/nRP+nyh9qbw=;
        b=N1vZRVEWp7OiQYpbLVbxQ6MtT0y1iNJ3rWlaLStig87V51jPA6+y/GJN596x2urdS6
         5ZhO0hp7S4elMpM360X/O9IsZrGOfn51PmOtNerjgtlKZhKoosHZxi3BsPJu1IJAbsAf
         mDfu8sjSL2i2Zw7WoBsCzZCV8arnQwHdFDkZjopTlAPND+8WqiDyOEiMKISGakt2nbfG
         nAI/Vc7ccAdiegSVp9mcij/gOsyBj1Nuf/fuA9w9qyoMu3CJK7mMRL9pXBePqeMKMdcF
         0YyRuNp77RrWDBMm88IWZlWwXeqX8MK19ueiGX92G5qM2Q/JpvF8YmqwFuDVK3rjSrgU
         9dIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tFihLnj80m7OVKSWSB5T98Aozczh+fP/nRP+nyh9qbw=;
        b=jYettNZZle6Q+SMN3rn00lwjsdN1pVJvOxHeYRnHIuvwvcBWl1eCH+l42ipQdoc76x
         oQl8Kqrm9zojH8HjhycATJKlzo22veAAYKSPmANSiVZsYkGWHwDy5Q6C5W/y9qvuPEgo
         F6NVaATKlHzlGa626wrOSf+R7aYZ4KGRT2GPZ0cuP2QZT1mhy72oUAdkDIxDkbgv6+Si
         6YVIKiwLKg093tbpjs7kUCAYjmqOdn90S5bfWHa/gEnc2Tl/gDv+PcmgIlX6yZbvOZqA
         7v1OpAAKeAsK011jm3Ia1uPI2q6BWpZc3lDaCA3LxltaFdDQbFCtm0OG9cBNGxxi/Zew
         TbEQ==
X-Gm-Message-State: ANoB5plWKy298OgolYscfm7/gxiN66u/0126ni8Dv9F6pMkOCIlLI62j
        iI61W7OgAYql9mLhJWGvvXRTNgIvUINroGbb
X-Google-Smtp-Source: AA0mqf5ov88nSuV4nZumDXZBRHYLGXsBPPELYbfgxKn9V7i6FANM0SwUPcScEdQ9W2U9qoCSV9c8fg==
X-Received: by 2002:a2e:b5d9:0:b0:279:e30a:d14a with SMTP id g25-20020a2eb5d9000000b00279e30ad14amr7593162ljn.50.1670530458361;
        Thu, 08 Dec 2022 12:14:18 -0800 (PST)
Received: from localhost.localdomain (95.49.125.53.neoplus.adsl.tpnet.pl. [95.49.125.53])
        by smtp.gmail.com with ESMTPSA id bi35-20020a0565120ea300b004ac6a444b26sm3466428lfb.141.2022.12.08.12.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 12:14:18 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <me@iskren.info>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] dt-bindings: arm: qcom: Add SM6115(P) and Lenovo Tab P11
Date:   Thu,  8 Dec 2022 21:14:00 +0100
Message-Id: <20221208201401.530555-4-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221208201401.530555-1-konrad.dybcio@linaro.org>
References: <20221208201401.530555-1-konrad.dybcio@linaro.org>
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

Document SM6115P, an APQ version of SM6115, which in turn is more or
less a beefier version of SM4250.

Document Lenovo Tab P11 (J606F) as a SM6115P device.

Add SM6115 to the msm-id list of shame.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 27063a045bd0..0c7ad00586fa 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -62,6 +62,7 @@ description: |
         sdx65
         sm4250
         sm6115
+        sm6115p
         sm6125
         sm6350
         sm6375
@@ -790,6 +791,12 @@ properties:
               - oneplus,billie2
           - const: qcom,sm4250
 
+      - items:
+          - enum:
+              - lenovo,j606f
+          - const: qcom,sm6115p
+          - const: qcom,sm6115
+
       - items:
           - enum:
               - sony,pdx201
@@ -931,6 +938,7 @@ allOf:
               - qcom,sdm845
               - qcom,sdx55
               - qcom,sdx65
+              - qcom,sm6115
               - qcom,sm6125
               - qcom,sm6350
               - qcom,sm7225
-- 
2.38.1

