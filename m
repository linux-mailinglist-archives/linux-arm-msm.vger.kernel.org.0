Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1C6D64A4D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 17:36:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232611AbiLLQfx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 11:35:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232210AbiLLQfu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 11:35:50 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5956FB7D8
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 08:35:46 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id p8so274284lfu.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 08:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30srUlHmhvQinDZRA9pL483REIcldChcDPXez08Oy6s=;
        b=E2nfHZA0p+2VNGqauJAYaxYL4pmJ3SXRjpKX/nRAolMGfmQ5fG9It1B7GDwF7+/gM2
         8GKDIysTwDCiPlJdYeGFDC1SqXlSNwfhPfacMEBFaKUM614RsjerSyEhgwDs+0INeMDP
         vVISLZqd1mvKVVgnFyxq/tOUNK9ih9XY/6rERT524W7trAeLON9z8F5N11/B4pwKjrlz
         uuj5+SEoQ8kdDG1mNPszDU3fd1Otp2TICvQceAzR1g+Tp37/RgamPz0zdyi1rU1RdyXO
         2l6Kazgof5pk5zTI9qKmjn2YZVfug70X1WQxmOtLfXl60pgf5Yc8LfUxvuufazazWERs
         QRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30srUlHmhvQinDZRA9pL483REIcldChcDPXez08Oy6s=;
        b=zfcWBxReLrHs3rNT6ZKd/oV9nOO+lvKUekaWNeruMaKsOSytxXCCyJuB17ffwR5FmR
         via43OJwSVCI/T8EqSikJwPpl4B/JDKkamaizQ1QZVgLdD29xxQ27tGfg3Vtb8lNCwdF
         9GJJuoLET0HTlVAknlB9+3KqgrwBOEckXJDXZQ74gs9epBuEVoOhb4BkZECSyRZJg+VS
         B42uYCWDC5WmEILQomm6RCbPxdGDPKfINwFnGqApmwmMzoaMLDN4yPlOounWiz/MQU93
         3f+s67fw+lQFZQgs3AoyGgsDHL1IVfwzbqkjqAFpUfge78jiI5l5fIdLCwvrdy8VEaYt
         WrNw==
X-Gm-Message-State: ANoB5pl4cZT5KgN25J8moiNtnLKtWY5CZh9S+Zn0q2S1uIPSWYeFYZ7F
        IHohFM/OMIIgs2lhmosSngj+3Q==
X-Google-Smtp-Source: AA0mqf6gmS1/I5so6sE4ZfleyxNiIyI4maHqbGV1XPNzJSOZSbIkWXW/HKcnoLXhQebDt6HyKUWnfQ==
X-Received: by 2002:a05:6512:3452:b0:4b5:83ba:11ad with SMTP id j18-20020a056512345200b004b583ba11admr4092764lfr.35.1670862939703;
        Mon, 12 Dec 2022 08:35:39 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v16-20020ac25b10000000b004acff58a951sm29209lfn.133.2022.12.12.08.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 08:35:39 -0800 (PST)
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
Subject: [PATCH 03/12] dt-bindings: watchdog: qcom-wdt: fix list of MSM timer compatibles
Date:   Mon, 12 Dec 2022 17:35:23 +0100
Message-Id: <20221212163532.142533-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221212163532.142533-1-krzysztof.kozlowski@linaro.org>
References: <20221212163532.142533-1-krzysztof.kozlowski@linaro.org>
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

The MSM timer ("qcom,msm-timer") is a bit different timer and watchdog
device than KPSS watchdog.  It has its own generic and specific
compatibles, so fix the list to reflect this.  Adjust the example to
show the newer KPSS watchdog.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/watchdog/qcom-wdt.yaml    | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 3e0b30a817d6..93e4381067dd 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -33,13 +33,16 @@ properties:
           - const: qcom,kpss-wdt
       - const: qcom,kpss-wdt
         deprecated: true
+      - items:
+          - const: qcom,scss-timer
+          - const: qcom,msm-timer
       - items:
           - enum:
-              - qcom,kpss-timer
               - qcom,kpss-wdt-apq8064
               - qcom,kpss-wdt-ipq8064
               - qcom,kpss-wdt-msm8960
-              - qcom,scss-timer
+          - const: qcom,kpss-timer
+          - const: qcom,msm-timer
 
   reg:
     maxItems: 1
@@ -56,9 +59,11 @@ unevaluatedProperties: false
 
 examples:
   - |
-    watchdog@208a038 {
-      compatible = "qcom,kpss-wdt-ipq8064";
-      reg = <0x0208a038 0x40>;
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    watchdog@17c10000 {
+      compatible = "qcom,apss-wdt-sm8150", "qcom,kpss-wdt";
+      reg = <0x17c10000 0x1000>;
       clocks = <&sleep_clk>;
       timeout-sec = <10>;
     };
-- 
2.34.1

