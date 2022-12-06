Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD4D6443A1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 13:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234914AbiLFM5O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 07:57:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234823AbiLFM45 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 07:56:57 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F11762CC
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 04:56:44 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id ud5so5976506ejc.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 04:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhLdyy64MSy62j2GfoCPYL31V7FQmGy5yzQrHHdIKxE=;
        b=g6HBJJPsPgFds3XaK3M7z/BvudPRUcwGtnL+oGDlDvXOtEkoMuNAqHl3OMAzl4fuFe
         TFqtqcUHNJqrvW0ZA42/LTF/SV0ohoD7HOMyLWBwm6XocA19Vm6l25myvfDRxNZoKoNa
         9WDR/piOmCw7M1LLk08FMGO3Uo+ZvUZJutsmGw434YVhQcm2FglR3oNHQ9TEKJvahZZf
         dP44i+6tzmLQ/BCxGD+TBocovqirmlrTmW0+C/7EOacWibFe/K/jOelXVFa3ruLNhKCL
         tbgfDobKu9xi/qtChY3A2RiBWKdNl52/0ldEvKFk8oBsCtUK/4U1hhcWZ036wI//F0UH
         8FEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BhLdyy64MSy62j2GfoCPYL31V7FQmGy5yzQrHHdIKxE=;
        b=prWC8FuuW3Twkqc2PCjyPgHoJ2donH+/lQqDR/nPkJLt53eGJiRdfqMZqqqtMK4kI8
         eM2UXreNSMh+toTNZRM0jOnOBnelQ4wEEhhVppSmRRfFhvs1N+wbgo2p7cWvxxbI143a
         Zd6hYUA4a7c+/ons+a7zzsT6MJ7c3j+v15ukTN8cDWdHhh/Jyp7MJ99LfyRYPhadBa4B
         xMdCtzmCv3MfZ5sISE0VvNbgqcKZfdf9WlJ5mBJhTieLWmQycMDhNF1MAGyLyqHr0QY9
         5+YkmbGv9M0zlaidyTmIApWFQreYO8URRoHT7gXOmZ975ogO46LKCGTUW8+g/KlEnGat
         sjtQ==
X-Gm-Message-State: ANoB5pnwWKz7sgBrpdMhRbBaPgtaavbsnVWWwqkDkjvFNkMDFgSkcdT9
        zFXja4uOf/5DIJ4RVf1NTMXM5Q==
X-Google-Smtp-Source: AA0mqf784LtVQVhnatJbwdOS+3gZ3Qlr9+4yvGwMeDmOskexJXEozG/+Iq3YbBEwyWqDF7HqnySd+w==
X-Received: by 2002:a17:906:2cd3:b0:7bf:b675:ffdd with SMTP id r19-20020a1709062cd300b007bfb675ffddmr33116400ejr.610.1670331403050;
        Tue, 06 Dec 2022 04:56:43 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v15-20020aa7cd4f000000b0046150ee13besm932991edw.65.2022.12.06.04.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 04:56:42 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 2/5] dt-bindings: clock: Add RPMHCC for SM8550
Date:   Tue,  6 Dec 2022 14:56:32 +0200
Message-Id: <20221206125635.952114-3-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206125635.952114-1-abel.vesa@linaro.org>
References: <20221206125635.952114-1-abel.vesa@linaro.org>
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

Add bindings and update documentation for clock rpmh driver on SM8550.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index fccb91e78e49..b405da7700be 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -31,6 +31,7 @@ properties:
       - qcom,sm8250-rpmh-clk
       - qcom,sm8350-rpmh-clk
       - qcom,sm8450-rpmh-clk
+      - qcom,sm8550-rpmh-clk
 
   clocks:
     maxItems: 1
-- 
2.34.1

