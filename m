Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBBD164A4CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 17:35:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232019AbiLLQfn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 11:35:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbiLLQfl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 11:35:41 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1E263B0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 08:35:38 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id x28so313689lfn.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 08:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ai7DRTu5Ju7JecvhYYJbDduggLKq/Lu2jurxO6GnUFo=;
        b=zuHTLfNgNkL/2WjnKIW6VFbXHeTdI3po8GZXAGyluCsuBn8wc6GpZWDjsLWeCR7IgP
         GiaskF05b2d5f1vVUdckQf+Hf/5ioH31m79t/P3jgaR8vONwqForTqvKpArM1xIP5hkI
         V5zQIg0InlwTTSkuzFVX+Cb3t0brxupL1qrDicJL5yLYZbRNRhZl35RLW7A99yQVcRiw
         K2esMbruw5sD5Bz5QCltb+k74TOArbIEL+vbvkg44DCdbQJK2AqZnq2x9Vh2CeM8R0ZV
         Rufww3h0LdPbSa13xdQilEoWdG5pQXR/Rto++7GFW859jUwUKoxspkQ1s0m7a7I2CJnr
         DDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ai7DRTu5Ju7JecvhYYJbDduggLKq/Lu2jurxO6GnUFo=;
        b=NfO2ELm2SGxhowHSOxdvuM0v8q6F8nyr3eh716mQ4jaZl79rx14g5pPcnk8uvASskX
         8D3FgSFxNKT8qqQdN/p7eCt54oVIvFqgAKXOlBl78QD9tpIWM8NX5sZQj6Sfh0AMz9Zu
         nMzvmRxcLan9LLSBKD/4bHY62nQfZ7SBJ85lI54W+pg2hpHjoqQgfaSlF+cLTvBN4QG3
         sRVvg5K/aSH/8O8zrgztOoboioszwRb2e1UlMTc0N+tttfHREMhItxvGVqKhmLFDX+j3
         qp0zGVYOIaN6JXmC6lIwPyg/6+aNBGSZfGDe13UEb33C+uDX51Jp9vIS9YGFR0imbsBe
         0IHQ==
X-Gm-Message-State: ANoB5pnyOdQ0uiaz1jbDy2ew8Ie7vFli/PaGG30wGjnOBX6hl21VVi8S
        LgkWAaWgHj4zkTHdLN3pNNxAZw==
X-Google-Smtp-Source: AA0mqf5uJxoaapU1bf9LXRq5Fh8Reo57NvF4j+JDtO4HpTstx2QxBTh+ICLXxlu0Dej51ORVBguwSw==
X-Received: by 2002:ac2:5594:0:b0:4a4:68b7:f889 with SMTP id v20-20020ac25594000000b004a468b7f889mr6767309lfg.45.1670862937080;
        Mon, 12 Dec 2022 08:35:37 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v16-20020ac25b10000000b004acff58a951sm29209lfn.133.2022.12.12.08.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 08:35:36 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/12] dt-bindings: watchdog: qcom-wdt: require fallback for IPQ4019
Date:   Mon, 12 Dec 2022 17:35:21 +0100
Message-Id: <20221212163532.142533-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The device specific compatibles ("qcom,kpss-wdt-ipq4019") should be
follwed by fallback "qcom,kpss-wdt", which is actually used by Linux
driver for binding.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index a1f17c9e02db..e76364c52fc7 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -17,6 +17,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,kpss-wdt-ipq4019
               - qcom,apss-wdt-msm8994
               - qcom,apss-wdt-qcs404
               - qcom,apss-wdt-sc7180
@@ -35,7 +36,6 @@ properties:
               - qcom,kpss-wdt
               - qcom,kpss-timer
               - qcom,kpss-wdt-apq8064
-              - qcom,kpss-wdt-ipq4019
               - qcom,kpss-wdt-ipq8064
               - qcom,kpss-wdt-msm8960
               - qcom,scss-timer
-- 
2.34.1

