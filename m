Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3701A6AA984
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Mar 2023 13:34:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbjCDMe0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Mar 2023 07:34:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbjCDMeX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Mar 2023 07:34:23 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A998F1C59A
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Mar 2023 04:34:09 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id u9so20605723edd.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Mar 2023 04:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677933248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REAd1euaAKYCn6kSfqAb/p+PZ0MMh9VT/R7/9FFRhes=;
        b=qPfmadEWozlCoWLtgVL92sZEZm+jEXtCFgcB0//BAE73+3rVo3+4X2Vjzey/18XQj1
         alWKHFui9B2wgY33wPCLuDZN79bTblN1cPtA7Gfqp6vNtDJdkzQrtcw73jIWeOw5fpmw
         LhMZbbY0yrwgL1c1TezVinL3hMGPAwE8Cxgm9wWFxsT4f+eBXjo1JofhpaNKt2z3Ldbb
         VX4zrVUK4Pmj1oVkOwWmSGT4MSi9vmO1/yBsIBpf0xlboL/Wk8ED+Tp+kuQQoMqZrOTv
         tyOqwBTFFrJaQH8HtrfbTqAaPGTgZPq8MCHBXhcFnqmqzgA+hIED54StNh5riKD72z+N
         UvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677933248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=REAd1euaAKYCn6kSfqAb/p+PZ0MMh9VT/R7/9FFRhes=;
        b=3ngJoh6FrEjZiyqHwYIJ0h4oRFVxp3ulQAlNZEf10Ubvc7OrwTxaf0WC5DzAtENMFd
         xiipnafwIVcJm/fedQzsSkRYm563qsspuOh/RNEw7gefDVDaBnwopc74IB+tHsu/WUys
         mAplk7LESYmHMMT7fludxz4XLGg2O28LsZUK5WT2Tgv4s1a8Io47zVQlQxshNwFkuaAV
         fGm/nL31c1uaZqrjHhAc9LaH7sP2ZuxRxisj2dR81oMrqL3oMbFOkE/zLru2Zz/yC7T4
         N7IPuWw7kc/x149jNPNOvs3D54JYrP536M87LoNVBu17x6eyoeA3sAT0crxNIdn8jor1
         Q0Uw==
X-Gm-Message-State: AO0yUKUUz1Mhen1kaLeUpJx05+T3fxrw3QJhJbvHnp7wO4cauhux0YgL
        6EmsmvnHKcFFm5orn3DMVyhR+Q==
X-Google-Smtp-Source: AK7set9yZQY9nuIHFTIhVqj2syBEKzKxSLQz/mLS4LlARlF3g0vXjGRX6Kw0GPTixWSrdjMmVY0Iog==
X-Received: by 2002:a17:906:fe43:b0:88f:9c29:d232 with SMTP id wz3-20020a170906fe4300b0088f9c29d232mr6925443ejb.57.1677933248270;
        Sat, 04 Mar 2023 04:34:08 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:b758:6326:1292:e2aa])
        by smtp.gmail.com with ESMTPSA id q27-20020a17090622db00b008b1787ce722sm2017087eja.152.2023.03.04.04.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 04:34:07 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 7/8] arm64: dts: qcom: sm8250-sony-xperia: correct GPIO keys wakeup
Date:   Sat,  4 Mar 2023 13:33:57 +0100
Message-Id: <20230304123358.34274-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230304123358.34274-1-krzysztof.kozlowski@linaro.org>
References: <20230304123358.34274-1-krzysztof.kozlowski@linaro.org>
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

gpio-keys,wakeup is a deprecated property:

  sm8250-sony-xperia-edo-pdx206.dtb: gpio-keys: key-vol-down: Unevaluated properties are not allowed ('gpio-key,wakeup' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dts | 2 +-
 arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dts b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dts
index 5ecf7dafb2ec..01fe3974ee72 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dts
@@ -26,7 +26,7 @@ g-assist-key {
 		gpios = <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
 		debounce-interval = <15>;
 		linux,can-disable;
-		gpio-key,wakeup;
+		wakeup-source;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
index b9c982a059df..c96cc9c90a5f 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
@@ -63,7 +63,7 @@ key-vol-down {
 			gpios = <&pm8150_gpios 1 GPIO_ACTIVE_LOW>;
 			debounce-interval = <15>;
 			linux,can-disable;
-			gpio-key,wakeup;
+			wakeup-source;
 		};
 	};
 
-- 
2.34.1

