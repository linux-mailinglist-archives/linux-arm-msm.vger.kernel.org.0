Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFEF76C54F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 20:31:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231268AbjCVTbG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 15:31:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230503AbjCVTa6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 15:30:58 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 928A362DB3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 12:30:56 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id o12so77375151edb.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 12:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679513454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9x1PwiUD4PUFjaVQWHWZ2kBLiECk6niT366SMAu8e64=;
        b=m3nvSoUnbPCIgaSJib9udRBvVFJOO7aU51z6/ZlFbh1P6s2zgj1wsYsB1rkXT0Boax
         o+M0JyN47OTKSJEV0FMYXbOQ7WrhL9KLsSyseExt/hGvKSw1Zr88YM0uQhfw4we2cqic
         +Vm4yLK8M4Rk+D7DhGo+w/bcxWMDaLGjRm0Sct9cXBDm70Wln9MYD3gsARPwzmZms2hi
         WlFKv9M3A/QdXMVZ4FCMdyirkXmGS+V7+XgJ0+b0NStkqTEtyPZLsaKfLjp5XrEb8Yr+
         N7XudGUcMq4hhkwR9Uk4q06BlaQpZEF1pQkQ3gM9kWFnnkfA2vRo2KbuM8JnR+VCZ9Kt
         ua9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679513454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9x1PwiUD4PUFjaVQWHWZ2kBLiECk6niT366SMAu8e64=;
        b=M3Q/ziNAFjzLAhc6BArHMYod3wwpvuUKZOU4fcHvC0UmOS4J6zor+oFJ8nxco8CkbZ
         3/mCG/lZIN0ANK6IQD8fshqVl2/LCmfw8NEeQMKSuwlz1TNZUKo92GNC7SC48zfJIbGI
         rbpihCFctvFO79He7LUx1YmskyHB4HNMOnn/ooSs38/drbz83SL++yB46KMP6dZhnDZG
         RCKlqWUgFzuxbbHIDBy8HIgtGJT/3Y7Y6fdzqUNBoUye6JpxZc5zUkBIYTQ8XEWqZs5e
         rdKP/NwHdhb2VACTpFHU8Ax7nQZD42NTURhecggvBSU7KAj9VBHt88nO8MXtIunRoH2u
         TgvA==
X-Gm-Message-State: AO0yUKVx5hvMV5lhNFvCDcWbii9mMqA2WPNIrEhMlTRDhX1QNSDI8G6+
        qYD7Ar9y890xS9U1EeyRm6eRtg==
X-Google-Smtp-Source: AK7set+mMZPwDLFIVTxI8GHBjUq6j/Eqc3Mejz4uZKAOuyE0SzIX9iEAaS4SSep54sfGN/6uEHUdAQ==
X-Received: by 2002:a17:906:229a:b0:932:9d28:9668 with SMTP id p26-20020a170906229a00b009329d289668mr7992759eja.6.1679513454603;
        Wed, 22 Mar 2023 12:30:54 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id n25-20020a1709061d1900b008e9c79ff14csm7660309ejh.96.2023.03.22.12.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 12:30:54 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH 1/4] arm64: dts: qcom: sdm850-lenovo-yoga-c630: Use proper WSA881x shutdown GPIO polarity
Date:   Wed, 22 Mar 2023 20:30:48 +0100
Message-Id: <20230322193051.826167-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322193051.826167-1-krzysztof.kozlowski@linaro.org>
References: <20230322193051.826167-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The WSA881x shutdown GPIO is active low (SD_N), but Linux driver assumed
DTS always comes with active high.  Since Linux drivers were updated to
handle proper flag, correct the DTS.

The change is not backwards compatible with older Linux kernel.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 67d2a663ce75..5c688cb6a7ce 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -753,7 +753,7 @@ swm: swm@c85 {
 		left_spkr: speaker@0,3 {
 			compatible = "sdw10217211000";
 			reg = <0 3>;
-			powerdown-gpios = <&wcdgpio 1 GPIO_ACTIVE_HIGH>;
+			powerdown-gpios = <&wcdgpio 1 GPIO_ACTIVE_LOW>;
 			#thermal-sensor-cells = <0>;
 			sound-name-prefix = "SpkrLeft";
 			#sound-dai-cells = <0>;
@@ -761,7 +761,7 @@ left_spkr: speaker@0,3 {
 
 		right_spkr: speaker@0,4 {
 			compatible = "sdw10217211000";
-			powerdown-gpios = <&wcdgpio 2 GPIO_ACTIVE_HIGH>;
+			powerdown-gpios = <&wcdgpio 2 GPIO_ACTIVE_LOW>;
 			reg = <0 4>;
 			#thermal-sensor-cells = <0>;
 			sound-name-prefix = "SpkrRight";
-- 
2.34.1

