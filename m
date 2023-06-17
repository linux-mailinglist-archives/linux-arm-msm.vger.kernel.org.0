Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C838B73426B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jun 2023 19:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233664AbjFQRP7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Jun 2023 13:15:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234574AbjFQRPx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Jun 2023 13:15:53 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 613B71BD6
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jun 2023 10:15:49 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-978863fb00fso294011566b.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jun 2023 10:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687022148; x=1689614148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCJbJ016qYNTOXUy/U/7OZXPXguoAT6ZFzPeAim4998=;
        b=k0TKxnMm8XJVSseSGIMdtGLS4JdpAgaZt7gFChBkuYM0YEbKWy1dxWzc2hrBU79Ctx
         Rvccn/AuoREwGz1uxNEvRWiZAyRBmpUZvKWk2chIMgKzsbPkWX9Yqh4dycQ2HBoja7T0
         mEwxECJ2UUeWe8RQ5cDO2ubckysO11VqUvPcFYOtXSkb+OjbNkOwUJYiqowwIniUmK69
         BlyDZj9elpKcAgX/NC5cM292X80yMVrIqtnjFoJyvBD3zEQoaFeZr9ovF8Y24BMUN7aF
         usdw7krXxAB7dumhY9+Bwy/jVcqpf95x99eM2rDuPma36iKE/RrGenN6swI6yyaqQ2jE
         Flpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687022148; x=1689614148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCJbJ016qYNTOXUy/U/7OZXPXguoAT6ZFzPeAim4998=;
        b=VrxJoqsgsJ6aTXlluysnqT13pY6zBUVkSPRdVQVwottbj7NhVDIdHfrnitR2y9MZRn
         FykfxI/WDpzZtVmkuyBjoLbYL6vLwKGq7iNNJ5eXi/rBqDEHokzO2Y+ScgFFXi2bOS6X
         cu/oH6amUOADxg8SOv6MoswboLIjlqXWKg6tfyDp3oecPVxkZXj8z3pyLMwiSQb+UjT0
         vatG7XdavejdPxeS+k+sZNu0XgRXpBMQy4rUpNqs9PrxoeNr3dAlUQyKB8iCYJiXXg+J
         dJInS71laWHwNr5ESRMyW4aid9eaEvvT6C+JpRdl/JjXZY1ob/ZR5IWRv/orQjam605K
         2Ftw==
X-Gm-Message-State: AC+VfDyq34tqAhsYnidyMbE58PiXYHzOfhuOdACJUFPFPAdYkvM2on1J
        hT8LRnGzMG73Th87LPVA8VHXHg==
X-Google-Smtp-Source: ACHHUZ7gwFYXSv8CDJFaOOlsdhsNiF9HHreFqVvs1/2ausGfe40jsqXlYKjLbSbIPoy0HRFaS7Tjgg==
X-Received: by 2002:a17:907:2cc5:b0:988:2a2f:91b9 with SMTP id hg5-20020a1709072cc500b009882a2f91b9mr904589ejc.63.1687022147583;
        Sat, 17 Jun 2023 10:15:47 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id os5-20020a170906af6500b009829dc0f2a0sm3841897ejb.111.2023.06.17.10.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 10:15:47 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Nikita Travkin <nikita@trvn.ru>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 03/15] arm64: dts: qcom: apq8016-sbc: drop label from I2C and SPI
Date:   Sat, 17 Jun 2023 19:15:29 +0200
Message-Id: <20230617171541.286957-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230617171541.286957-1-krzysztof.kozlowski@linaro.org>
References: <20230617171541.286957-1-krzysztof.kozlowski@linaro.org>
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

I2C and SPI controller bindings do not allow label property:

  apq8016-sbc.dtb: spi@78b7000: Unevaluated properties are not allowed ('label' was unexpected)
  apq8016-sbc.dtb: i2c@78b6000: Unevaluated properties are not allowed ('label' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index f3d65a606194..e0993e32ee38 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -172,15 +172,13 @@ led@6 {
 };
 
 &blsp_i2c2 {
-	/* On Low speed expansion */
+	/* On Low speed expansion: LS-I2C0 */
 	status = "okay";
-	label = "LS-I2C0";
 };
 
 &blsp_i2c4 {
-	/* On High speed expansion */
+	/* On High speed expansion: HS-I2C2 */
 	status = "okay";
-	label = "HS-I2C2";
 
 	adv_bridge: bridge@39 {
 		status = "okay";
@@ -228,21 +226,18 @@ adv7533_out: endpoint {
 };
 
 &blsp_i2c6 {
-	/* On Low speed expansion */
+	/* On Low speed expansion: LS-I2C1 */
 	status = "okay";
-	label = "LS-I2C1";
 };
 
 &blsp_spi3 {
-	/* On High speed expansion */
+	/* On High speed expansion: HS-SPI1 */
 	status = "okay";
-	label = "HS-SPI1";
 };
 
 &blsp_spi5 {
-	/* On Low speed expansion */
+	/* On Low speed expansion: LS-SPI0 */
 	status = "okay";
-	label = "LS-SPI0";
 };
 
 &blsp_uart1 {
-- 
2.34.1

