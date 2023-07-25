Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F241B761F75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jul 2023 18:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231893AbjGYQuK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jul 2023 12:50:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbjGYQuC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jul 2023 12:50:02 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F6AC26BC
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 09:49:23 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so111706a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 09:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690303760; x=1690908560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LzDnwBHcCNYgqCk2X/jo3Kq9KdDwUHbWe6RB2ZMyEY4=;
        b=TCeibtGzLYGEID9kWxkcEtw7CfPkAoacYLEFrpGofFAW/cwxJNvuVRO7xOrtRnhnBu
         /6NAx3fyvPUOBZlewhv6OBQ48SEh5bTvfrSwhafPAz85kLpjgqJY/zPt5xKjeHUJ9YYU
         h2uOvAw6xEXpLAFpLOG8lpr26WPuV+18888K43zo9y4ud6YsXkNfVpshAIHZo+qq5dnR
         gisfnSAWAPILtaY+i7iJ3iI0jPwWmMcCcODWFy6Di7HXvPre5aOXBA6hB3qpq5M1y3t1
         sDV9axljxmhYHgUq/7MiU9KMswKdhM0sfI4KA2ytYabpK20zG7VKLPHSlZ4QTadM+moV
         ae5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690303760; x=1690908560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzDnwBHcCNYgqCk2X/jo3Kq9KdDwUHbWe6RB2ZMyEY4=;
        b=FQYp400mf0KVaRWr/gIUaBCR2ahOL5pegQHzKsK3dEYsyeca4oVXJMoOlKr5Af9CBQ
         B+MkoVxf6hRDt6nZ6QTvYYvW7fh/vR5tknFe6a4aVpHfO0L+dOAuowHPSlaUMiaMDIDS
         OsuTqyxEY9b7zQWRpj9HyMefsnSDp/VSOk6wWyxAeyB0jCqqd1UQVKCKE/0Lr0XbmINa
         xJy1uIehhneHC3Xt0QKllmJspuOVB18fwI8YPU9i9qUx6rqspdRGh0xkz9iMTZnn6ZAt
         eWbPryqLbxo8qKgHT6PVhsbeXzO8towrsX9JPDXZ46iHK28Wl3eVZy3gryTY30opGQf6
         AwJQ==
X-Gm-Message-State: ABy/qLb8NtcHFV1aepie7Wpwmdz4K+p/L3Z5Dh/jz1l8eEF9OyRONG3o
        QqZFk2rzRQLxdD3IsTJiRSra1w==
X-Google-Smtp-Source: APBJJlFOAdT8ihjLNFzNTm1qELLYzD+sgpFi/cCe33I18hmaJCMJ2jFnwf9gzGqteNMJbgb69iFOWg==
X-Received: by 2002:a17:907:7daa:b0:986:38ab:ef99 with SMTP id oz42-20020a1709077daa00b0098638abef99mr3300571ejc.9.1690303760401;
        Tue, 25 Jul 2023 09:49:20 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id a5-20020a170906274500b009932337747esm8379401ejd.86.2023.07.25.09.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 09:49:19 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ARM: dts: qcom: apq8064: drop incorrect regulator-type
Date:   Tue, 25 Jul 2023 18:49:16 +0200
Message-Id: <20230725164917.371714-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

regulator-fixed does not have a "regulator-type" property:

  qcom-apq8064-ifc6410.dtb: regulator-ext-3p3v: Unevaluated properties are not allowed ('regulator-type' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts | 1 -
 arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts         | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
index c57c27cd8a20..c0dd6399f597 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
@@ -36,7 +36,6 @@ ext_3p3v: regulator-ext-3p3v {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-name = "ext_3p3v";
-		regulator-type = "voltage";
 		startup-delay-us = <0>;
 		gpio = <&tlmm_pinmux 77 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
index 96307550523a..b0c5e7bd5e74 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
@@ -58,7 +58,6 @@ ext_3p3v: regulator-ext-3p3v {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-name = "ext_3p3v";
-		regulator-type = "voltage";
 		startup-delay-us = <0>;
 		gpio = <&tlmm_pinmux 77 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
-- 
2.34.1

