Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 832A5734273
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jun 2023 19:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238513AbjFQRQD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Jun 2023 13:16:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232783AbjFQRP5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Jun 2023 13:15:57 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5965719A9
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jun 2023 10:15:56 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-977d7bdde43so385802466b.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jun 2023 10:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687022155; x=1689614155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhLpA0bxGouYBguVcte9AL2IENZphar7chhyNxF0ifM=;
        b=Hh9QzNbv2xu30g0ehY/3sESKiu93qmIT6SlNmmk5PxrzCYEHsa9lScWKvasU8BsMLO
         9fa5ee+vWcDBEJhFLH28qfPBdJtK/7y9ipWgG79WAjDuhSbvSmaP6CcRTcQGFgdjuRu+
         rYf7agx5HDXXLMvxRGFKDCDwG7SEVqj/jFRIROFKW4v5Icqjc3kz/1TmaR0cp+6MiDs9
         Z6gtukakwdfP+uMUQrk3aQkWzIX13S+Dudk7EviFHvq8QerMo9noYlrR6I0ofmg0HpHr
         hM6WWo2dAKlGMjdZd2gXcVnNOPG/zEBNiHpvBoSYx0+OD5D0Tn90neIflRHE4JfRqhhv
         fLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687022155; x=1689614155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhLpA0bxGouYBguVcte9AL2IENZphar7chhyNxF0ifM=;
        b=EKB2BkZyu/C0V7R0oPwuqCq86+frj7w6CgD5snWQ00C5P2x68Krm5k2Q/UpsJBzMfs
         S5VT33KVZmBseByCR1waQX5SJtGflCM+7YOS0xmfnNB9kuH1uWV5bx9+hgcfT78jCuOQ
         oOdsIcl8UI1c9fvpLJimtkWcOeagNRXIcjM1iWUEr4rJarCb6UonN+AQOu5DyKxv7O2A
         82nwXu54ll0zLzMvRIAFaAt7/WgOjz6IehkRoEU7YtQVVBltc9gc6qZXkxYkVMsftStC
         ecWbpB0eTpdnm4oo/WwgYOH/TN8TPu3T/Ukt4xppMkpRItcuV5HIdtFrSjynrSHiDksC
         ozBg==
X-Gm-Message-State: AC+VfDx3hThDl04LncKn1Mr1U+eysde6D2O99qfm4bTXJuoIFnqfTMSS
        3p7rSoJOeer3rLkbFVX1zESevaydPWBAxUYHNrk=
X-Google-Smtp-Source: ACHHUZ54LtkrjalIw0YC443P7C4klcIqGF9SJOxQOCbX51pSyN04jR6IxLuDGhKJ6dPLiVH8s+EG9w==
X-Received: by 2002:a17:907:1607:b0:982:b253:dc20 with SMTP id hb7-20020a170907160700b00982b253dc20mr4485747ejc.27.1687022154871;
        Sat, 17 Jun 2023 10:15:54 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id os5-20020a170906af6500b009829dc0f2a0sm3841897ejb.111.2023.06.17.10.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 10:15:54 -0700 (PDT)
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
Subject: [PATCH 08/15] arm64: dts: qcom: sc7180-aspire1: use generic ADC channel node names
Date:   Sat, 17 Jun 2023 19:15:34 +0200
Message-Id: <20230617171541.286957-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230617171541.286957-1-krzysztof.kozlowski@linaro.org>
References: <20230617171541.286957-1-krzysztof.kozlowski@linaro.org>
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

ADC channel node names were changed to require generic 'channel'.  The
user-visible part is defined via label.

  sc7180-acer-aspire1.dtb: adc@3100: 'charger-thermistor@4f', 'thermistor@4e' do not match any of the regexes: '^channel@[0-9a-f]+$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
index b637b4270f88..dbb48934d499 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
@@ -314,16 +314,18 @@ &mdss_dsi0_phy {
 };
 
 &pm6150_adc {
-	thermistor@4e {
+	channel@4e {
 		reg = <ADC5_AMUX_THM2_100K_PU>;
 		qcom,ratiometric;
 		qcom,hw-settle-time = <200>;
+		label = "thermistor";
 	};
 
-	charger-thermistor@4f {
+	channel@4f {
 		reg = <ADC5_AMUX_THM3_100K_PU>;
 		qcom,ratiometric;
 		qcom,hw-settle-time = <200>;
+		label = "charger_thermistor";
 	};
 };
 
-- 
2.34.1

