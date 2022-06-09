Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88C71544ABF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jun 2022 13:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243289AbiFILmE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jun 2022 07:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243899AbiFILlH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jun 2022 07:41:07 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6C381DD4E4
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jun 2022 04:40:32 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id h23so35837688ejj.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jun 2022 04:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XMCBqJLXl1yZV+e3LQN80RorsyQqGZTi99dCXoJkMfc=;
        b=qk/KaHJFHCh8zCxlBYjxy8QY41cdfTArL+3znQJN/TBpcY+XRFYhIa3pSN1DbdHJAS
         JE+niEp5QhXkayHgVZzXji2p+WiOv9dvVnaFKM/sfdO4rLPUZLoHuc5QAl7XGuRCTlE4
         VwirU2W4+XNrX5wUiY4EGD1Oi77DdpS7TUYSzxI6q3PBZET1BfLVLBBp/ijS/38zXFZU
         VP585XlgQ0My+qMK96iw7j61hKFKew4eL9XUNWaLH4doNxIC3MmRuJILlupANb00T4ez
         r5Nj6wKiYIi/hjPBUmCcGZcZEKFJxsWnvQJNGAsglybndLadj/hBLcWz9jaNu4t+ELwP
         7pyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XMCBqJLXl1yZV+e3LQN80RorsyQqGZTi99dCXoJkMfc=;
        b=8DpztM7nnIfy8qToTlIq39niLZNgDMo0hCk9J8d1gQg9bH429RjNMmgilLEjHKsF2H
         DU0079QaTeTLKsuhY5DGmsY/KlrTrzHdSfONkeRgllX+lnpeQE7/buhmPBpJ8kxPvs7I
         LJeHSOdv3k4Yt7Kwa1LgOldrBBarywosttnIGLv7HV1oOdYJ6JTWqndniZTRbHdwr8Bv
         GO6jc8GeJNvYwi2JO7r9nzQ2pVDFhQp9wd3PfaLIqgTHNGRZN3QVt7scwOjtfQcGBHNY
         t3rl4Xo/mLZHEmVfeBLwvSpAmuJm8AQqQmUUSTm/PN36cPFtOSvileO7vNWvqCNLKZAw
         kwbg==
X-Gm-Message-State: AOAM532EAVkkBp4prmrksjZixAmjWsQvVmL403qpP0Xgj1tL5TCYv1YH
        tzAj68e779GuT27ewdB2D6ckBg==
X-Google-Smtp-Source: ABdhPJxbd78BBuGPzfZgPbl7ytPLqMtFXPkhThO5phsGGLXyk/qipWs1Qn0F5ngNlRDlUT0xX8BSzg==
X-Received: by 2002:a17:907:2b05:b0:710:dabf:fde2 with SMTP id gc5-20020a1709072b0500b00710dabffde2mr23714513ejc.114.1654774831427;
        Thu, 09 Jun 2022 04:40:31 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906058a00b007101f6f0720sm7760844ejn.120.2022.06.09.04.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:40:31 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        arm@kernel.org, soc@kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 30/48] arm64: dts: qcom: align led node names with dtschema
Date:   Thu,  9 Jun 2022 13:40:17 +0200
Message-Id: <20220609114026.380682-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
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

The node names should be generic and DT schema expects certain pattern
with 'led'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts | 4 ++--
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts      | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
index 6a200f37c035..0a5b4617a8e6 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
@@ -133,7 +133,7 @@ button-camera-focus {
 	keyboard-leds {
 		compatible = "gpio-leds";
 
-		backlight {
+		led-0 {
 			color = <LED_COLOR_ID_WHITE>;
 			default-state = "off";
 			function = LED_FUNCTION_KBD_BACKLIGHT;
@@ -142,7 +142,7 @@ backlight {
 			retain-state-suspended;
 		};
 
-		caps-lock {
+		led-1 {
 			color = <LED_COLOR_ID_YELLOW>;
 			default-state = "off";
 			function = LED_FUNCTION_CAPSLOCK;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index a6986f95a80a..72b234ad9fab 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -60,21 +60,21 @@ key-vol-up {
 	leds {
 		compatible = "gpio-leds";
 
-		user4 {
+		led-0 {
 			label = "green:user4";
 			gpios = <&pm8998_gpio 13 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "panic-indicator";
 			default-state = "off";
 		};
 
-		wlan {
+		led-1 {
 			label = "yellow:wlan";
 			gpios = <&pm8998_gpio 9 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "phy0tx";
 			default-state = "off";
 		};
 
-		bt {
+		led-2 {
 			label = "blue:bt";
 			gpios = <&pm8998_gpio 5 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "bluetooth-power";
-- 
2.34.1

