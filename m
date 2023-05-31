Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50C4B717327
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 03:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233739AbjEaB0f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 21:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231558AbjEaB0d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 21:26:33 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 841CBC7
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 18:26:32 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f3b39cea1eso5803282e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 18:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685496391; x=1688088391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJ77JQ84u6R8CdSqTgpdo03aapu8iCwsPXjmB//BWxM=;
        b=njvZ6Osuk/d53GjsqiyDeMKjNWFGGPiVgfj7tg6FDF4JtqU5P72bDkT+CHNDhI7qF8
         cGIvbyDvMEmi/WK+jEKeCx19MgFk73j33oJNV5/uvVrnJ1oR/L6Ul54kMRZC0Xctj9F1
         hXLvsO3Zkbq23A9INGFGCuwq5Ql8wbQS3BNABwjAsAy3HKzdngeLKv2Wo9kAJ3qAyqAy
         8+PxYwcGcCGOGRcqImH9wh3mFdOiQKeI6JlVyHFZrDDWSIhmL2otK5RzD2eA/O5/0dlQ
         VhOovgFDBcOYwvCwslg8VOpWEPc1pMnuCeCj6TobFvXcK5un3k6mTej0mr2r/8/NPzyJ
         nYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685496391; x=1688088391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJ77JQ84u6R8CdSqTgpdo03aapu8iCwsPXjmB//BWxM=;
        b=SheawAgpFkieE455bkWNlb4YGW84+KUTq8qr41QbcD8/mtmXkzpj5XZO4OHmj9xHMN
         AILl/FbzRjgZV02M2bBTKyic1l1jClGeFdL9/2yW2Z3NQgUOLcB6XWqyDo4FPBUlttz+
         iOJM5NsqcK4FFyGzSEWUXVUaIcW61SmMBFif+B748B/wG1o/Ba12kXk+b+XYdeZcPpYZ
         Cc+fvH8gJY0qLluG1vMkd+2GaCtL8DiYd4Jvm50a+wzy15smadUg5rsZhK2mitlWq6Et
         JQH9t9GDXgyfvGJ4hSDPTlNRTxUblGZ2T1CaSFnTvCNaRcG5Yfxv57qh4nLQOkq4oaaX
         /qBA==
X-Gm-Message-State: AC+VfDxfboRENt40TltEbgF0Dl9xc5bZKcKeCeaKT//NZKNii0phXk7a
        gMfIEht5zxdSbm9P+dBkstuxGA==
X-Google-Smtp-Source: ACHHUZ47MqwWgBhbFOGGPIJlTQtYcm/gPE2dotjs6ngtS60B6QArTcHnL4LmSjEdtfPKz9ELGCPSzQ==
X-Received: by 2002:a19:f80a:0:b0:4f0:81c:73eb with SMTP id a10-20020a19f80a000000b004f0081c73ebmr1655192lff.42.1685496390941;
        Tue, 30 May 2023 18:26:30 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id q3-20020ac24a63000000b004f27471e0aesm509992lfp.79.2023.05.30.18.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 18:26:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: qcom: apq8074-dragonboard: add gpio keys
Date:   Wed, 31 May 2023 04:26:27 +0300
Message-Id: <20230531012627.3813060-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531012627.3813060-1-dmitry.baryshkov@linaro.org>
References: <20230531012627.3813060-1-dmitry.baryshkov@linaro.org>
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

Add device nodes for gpio-keys (volume-up, general key) device nodes.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
index dc8667ad1b54..7f759b00524b 100644
--- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include "qcom-msm8974.dtsi"
 #include "qcom-pm8841.dtsi"
 #include "qcom-pm8941.dtsi"
@@ -21,6 +23,26 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+
+		pinctrl-0 = <&msm_keys_default>;
+		pinctrl-names = "default";
+
+		button-volup {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pm8941_gpios 5 GPIO_ACTIVE_LOW>;
+		};
+
+		button-general {
+			label = "General";
+			linux,code = <KEY_PROG1>;
+			gpios = <&pm8941_gpios 23 GPIO_ACTIVE_LOW>;
+		};
+	};
+
 	reserved-memory {
 		mpss_region: mpss@ac00000 {
 			reg = <0x0ac00000 0x2500000>;
@@ -91,6 +113,18 @@ &mdss_dsi0_phy {
 	vddio-supply = <&pm8941_l12>;
 };
 
+&pm8941_gpios {
+        msm_keys_default: pm8941-gpio-keys-state {
+		pins = "gpio5", "gpio23";
+		function = "normal";
+		input-enable;
+		drive-push-pull;
+		bias-pull-up;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+		power-source = <PM8941_GPIO_S3>; /* 1.8V */
+        };
+};
+
 &pm8941_lpg {
 	qcom,power-source = <1>;
 	status = "okay";
-- 
2.39.2

