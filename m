Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF6D63D30D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 11:18:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235758AbiK3KS4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 05:18:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235665AbiK3KSu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 05:18:50 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3989B2A940
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 02:18:48 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id ud5so40160794ejc.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 02:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSQin7QU7m3wea+By9/0m4C67OFHqy7bfbLiJ+YSrfk=;
        b=sbQG9NetJxA1tW9+reryqbw/YSRCTH/j1617V6HYFABlbvVg03j80I8+OoRLOJElSN
         +g0BFhDJBu0Zrya6IsRAawrI+Hg8m/JFlqcgwPcdOV6u68RCt+iOM0KW+3o1RRo0yko3
         Cl+xAiv6TORn1Rg+cL0TS6QO/PKWn4j2rT15/gFwhADf87Ftiu3fawq+pNreFzWZ7x/d
         qp831Z+BiRfC9ewVKUWhf8pqqhH0ga1Pw3zXvHPUPkHavYpF/XZ6ttPMMCG9PLKjV4df
         Rpe/OnFI1mmok5J8xxd7Im+tyBYNb5dWcrj5gIh6eYK0/GgS31/1ewW8PayPWBUMz5y/
         1p4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nSQin7QU7m3wea+By9/0m4C67OFHqy7bfbLiJ+YSrfk=;
        b=H9jmjINoJlTn/f9PcUPpy05Adzc2Ov+K0EjDeqq5SKU1OFhNAKJLd6+kKaR3cE13tq
         qWNOHAr7IudOgC/irCcz/jji3Vhayiylx2v1YhEy/Rp6xq438XjkLxL+I0zUXttglKR0
         w5o/C5AQhfe8MfDLEWWh/+7bPxL9ka7sXrm7BE70pa2OMjgENqh0S4EDlBuFUlbHg7xo
         qFafUgymIhLUV4ElZV/rgo28VhATdfaYKHEUi33FtRRfgfXSwJaAOGOI5IilCc9UyFyL
         VtSKslC0Ywbdvdqv0NrNiCSzzdkesX38Q3Jaqph8T+dwd4Yt0KmjSl9z2ws2vhUNyBQW
         l1YQ==
X-Gm-Message-State: ANoB5plXMVLiJpezOQhN9I35e98uT0q41CZ6Z2cecHbxCyB0gWkTwur+
        nmXjYFfpttg4r9rkO/Sx8lfjgQ==
X-Google-Smtp-Source: AA0mqf5enEd7pHTAknHmAHrK3tjOFgGd8XoZ8Hop2BlEF+7KWh1o4MhtbgHwj0+rjhA5DBeaUL93qw==
X-Received: by 2002:a17:907:6d12:b0:7b2:bb8c:5398 with SMTP id sa18-20020a1709076d1200b007b2bb8c5398mr39647859ejc.573.1669803527352;
        Wed, 30 Nov 2022 02:18:47 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id l4-20020aa7c304000000b00458dc7e8ecasm449462edq.72.2022.11.30.02.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 02:18:46 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 01/10] dt-bindings: arm: qcom: Document SM8550 SoC and boards
Date:   Wed, 30 Nov 2022 12:17:35 +0200
Message-Id: <20221130101744.2849294-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221130101744.2849294-1-abel.vesa@linaro.org>
References: <20221130101744.2849294-1-abel.vesa@linaro.org>
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

Document the SM8550 SoC binding and the MTP board.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7637cf27d799..a586a38c3461 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -68,6 +68,7 @@ description: |
         sm8250
         sm8350
         sm8450
+        sm8550
 
   The 'board' element must be one of the following strings:
 
@@ -818,6 +819,11 @@ properties:
               - sony,pdx223
           - const: qcom,sm8450
 
+      - items:
+          - enum:
+              - qcom,sm8550-mtp
+          - const: qcom,sm8550
+
   # Board compatibles go above
 
   qcom,msm-id:
-- 
2.34.1

