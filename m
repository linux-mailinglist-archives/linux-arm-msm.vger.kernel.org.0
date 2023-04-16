Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9DD96E3816
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Apr 2023 14:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbjDPMh4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Apr 2023 08:37:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbjDPMhy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Apr 2023 08:37:54 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB01E183
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Apr 2023 05:37:52 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-504ecfdf6b6so3989922a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Apr 2023 05:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681648671; x=1684240671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqbmQdhJxWShIT6akuz9LXzlxn5HqqoJaw3hlWbg/iY=;
        b=EFvyuzKxl0kHq2XbFzDmattULuYHz0mBq9eLyxIEG7S6iI6q1xok67hX9AYRHnrPPm
         xCZDMscwtHDRK1zmfkumGn5w3h86oQYBKn4ylJm6YwsRhxhtL4tP5D0CFgfxx/GYP0rh
         MGkdJ0oZo62M//ahiHTy7bMhqg+uainGSoMf1qrMGjNU6biMg7c20P6Mt/9vX8YWFR4s
         K2Rh4bczwZSFfaRSSppzGtNQn2ON+dobxaZAC5ST1pLsN+ivyXB8mjy15Qek/D7eYpDw
         KREvIausXWyY9FeTHpmQOQTz8K0hHMZiD+wAdpb79rjVvsLYxzM2h15eGjmfbF4/kCk7
         Uitw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681648671; x=1684240671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqbmQdhJxWShIT6akuz9LXzlxn5HqqoJaw3hlWbg/iY=;
        b=F4RZqm/7aL51MStB7WE3+g8Hue1Dz23RSRkb+BojqkTqcWOpGWwhNtJRcZkHjeK+mu
         0vJgBwiUth1tA4wVjzBX/j82QAolL3XRFAUhPRMn6xwhjAznJc472efMBtlFn3Z4xAtM
         2rkbKNtZYg5ZzSRknPLzAQvnUckKlzranX24dIcBVqvypH24wUjF7m884DEBgSF7L5YD
         aP3W57ddjYloJ/XjIpfmTJTp8GkgDTAorOiyPKgtYUCx8oteN4y/K+4iEthCGhiVZsSc
         Yxu2kqBnyxW7U882PmHGIckRZK1EpaIRQ0nxaftgfoSK//8DGd/ZoZBC7lX3NJ4/hCHV
         R6AA==
X-Gm-Message-State: AAQBX9ctTRWZboqrKGqjt9djt73XZGy9o8UbXdZqFHULJ1Uisq/XY0Vw
        1HB44n2MI8OFYBesEV5skpDRUQ==
X-Google-Smtp-Source: AKy350Y33ooqVfTSbbB9wXNyBjLH9Nmm/rMWbJQ/NzT0SlG+fLHp3mC/NX2N6vdmEK8Y46BFdXUkSw==
X-Received: by 2002:a05:6402:1489:b0:506:8dba:bd71 with SMTP id e9-20020a056402148900b005068dbabd71mr5051894edv.27.1681648671363;
        Sun, 16 Apr 2023 05:37:51 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:29dd:ded4:3ccc:83db])
        by smtp.gmail.com with ESMTPSA id j23-20020aa7de97000000b0050432d2b443sm4556889edv.48.2023.04.16.05.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 05:37:51 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/6] arm64: dts: qcom: ipq8074: drop incorrect SPI bus spi-max-frequency
Date:   Sun, 16 Apr 2023 14:37:26 +0200
Message-Id: <20230416123730.300863-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230416123730.300863-1-krzysztof.kozlowski@linaro.org>
References: <20230416123730.300863-1-krzysztof.kozlowski@linaro.org>
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

The spi-max-frequency property belongs to SPI devices, not SPI
controller:

  ipq8074-hk01.dtb: spi@78b5000: Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 5b2c1986c8f4..3b801c4d7eb3 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -476,7 +476,6 @@ blsp1_spi1: spi@78b5000 {
 			#size-cells = <0>;
 			reg = <0x078b5000 0x600>;
 			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
-			spi-max-frequency = <50000000>;
 			clocks = <&gcc GCC_BLSP1_QUP1_SPI_APPS_CLK>,
 				<&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
-- 
2.34.1

