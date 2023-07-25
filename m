Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F10A8761F78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jul 2023 18:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232056AbjGYQuL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jul 2023 12:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbjGYQuC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jul 2023 12:50:02 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68C902700
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 09:49:25 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5222bc916acso3274489a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 09:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690303762; x=1690908562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6+KlmxDDLwiObK04L7eIkif60/hmbr4y7H5N43zkSQ=;
        b=Ec8fAc2F2R2VjwOoOSvGKsIP9TUvH6qoejGJ/NjJFD+wpt3MU9l2Jv3xpbf33kS5RJ
         u163xdCrB8iPqdOh7tR7AA9sI1pzC6FwmUSdPPCAbsD24kuk5qrBui0xAWUfLRWSjIV+
         dZmu0TzZlqkFbL+C81em53kV+m2+MR73PdVJc1C8eFUe+TYQvsI34LYLOxAwjWqnjLb/
         mTH6Yx2vu6rmF0KsSCoMNWJBYB4rRf5M5QB5ENkQp4Cuqht+NPO/kip646TJOeRrxUKk
         K1Cds56lcDuYdipFMK2FZGxLcQofodlF90h08jJA4WV3m9bhAlJnreg3fu3/04rQOl0f
         eqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690303762; x=1690908562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6+KlmxDDLwiObK04L7eIkif60/hmbr4y7H5N43zkSQ=;
        b=Yzx+xOpFcvkoZM1Og4sGAMIPVjEXqGfLaxksahFadvzFLqkILLVESNZD3jZku8/uvp
         3AxAdxClBy8BhK2IL7sJWzLyvvxd/cJDbWMt0LUfJPc9KrQ9X78A6+BVPwcrpXtbtbf0
         ILlxgzCjp9y8myxkgROeI991DSJ3elaF2QS9uLCWqLJJX19gas6PvS8lKcHTiqdlD8g8
         DD9VVUNKYXZTeFa78pRZNSpKL+ffahBRx9ka8PgBmlmc0bprUW/jXupGd9FBBH2+BxXq
         BLQGLqvyHmygELscz9ihW8SoJFCwSQzXVF3Ny2E6KWt4YxBAxE+WGWbAPDdbMB9/Ca8S
         7J8w==
X-Gm-Message-State: ABy/qLaZ7siTOSvuoX+DDCvaUXluJ+g6DyMOJ7Dcy2yAnf0xpW3WoEoV
        PBjabaMCu9uNsD0cyohv//tZig==
X-Google-Smtp-Source: APBJJlHsHWD2p7W1JW2oUWbXR0/kQ8G9r1fFfG9/qxiqymE8cUtKcqOD8jUhQqP5+iEj1idpkGVLVQ==
X-Received: by 2002:a17:907:763b:b0:98e:933:28fe with SMTP id jy27-20020a170907763b00b0098e093328femr12138908ejc.66.1690303762097;
        Tue, 25 Jul 2023 09:49:22 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id a5-20020a170906274500b009932337747esm8379401ejd.86.2023.07.25.09.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 09:49:21 -0700 (PDT)
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
Subject: [PATCH 2/2] ARM: dts: qcom: apq8060: drop incorrect regulator-type
Date:   Tue, 25 Jul 2023 18:49:17 +0200
Message-Id: <20230725164917.371714-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230725164917.371714-1-krzysztof.kozlowski@linaro.org>
References: <20230725164917.371714-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

regulator-fixed does not have a "regulator-type" property:

  qcom-apq8060-dragonboard.dtb: regulator-fixed: Unevaluated properties are not allowed ('regulator-type' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
index db4c791b2e2f..569cbf0d8df8 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
@@ -24,7 +24,6 @@ vph: regulator-fixed {
 		regulator-min-microvolt = <3700000>;
 		regulator-max-microvolt = <3700000>;
 		regulator-name = "VPH";
-		regulator-type = "voltage";
 		regulator-always-on;
 		regulator-boot-on;
 	};
-- 
2.34.1

