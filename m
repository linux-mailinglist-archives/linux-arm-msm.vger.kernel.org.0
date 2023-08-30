Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4D8778D93C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Aug 2023 20:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232883AbjH3Sci (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 14:32:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242933AbjH3J6y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 05:58:54 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE12FCEC
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 02:58:49 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99357737980so700716766b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 02:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1693389528; x=1693994328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4SsQzTd0CcGfAzL3R0FFK9QV29mUojsRfNBPae88g8g=;
        b=3ta6vgSsXwkmzI3uHIXBPxgvz+aQDqvKU/wSlAgyCa6Hue0ctHwgySamfODNyhogSz
         C4mM4SXirs5yj/6Opt5MYnZEbNj5PqTMtIIs1v3QWWW6tVhfRsovsrGi7OcbA02O/jWS
         OoJJX7bHw5TRXPubti2XPQP9WNsdF/anBGWHfAOowEENRyZse3hmkOBWxGjfz9qUw5n6
         NoCBzMtMucjvMTBkQY+BLrkk6nP/y67WlHJC0egwyDocoZ2ONe7U3Cx7bDjLRIrJou9i
         74qacRNoRjZTlU1SJ5HVltLe7+jFJQdQC8WlH5+U902bmH1U2SD1/ql5/KZg95cL0EOS
         vy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693389528; x=1693994328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SsQzTd0CcGfAzL3R0FFK9QV29mUojsRfNBPae88g8g=;
        b=k5SVe3rFIFEfvfhWKd4S/83hd4CsJs5CVoMqaIDsrZqMW46r2Sbs7cFiOXL8rKJ0wK
         Jmvft0vh9CF4lGyUfyrZpfC+KRd50VZdbcQKoy6R6ZA+V99Hza7oRjrNlBv0j3xxj6/t
         3AytP5WxeS128nEL97n8Uw+Y/c16/4a9n/gqpwy+cS6nXHseThzAxKlJfBu50ROKASxt
         ++FB9kkqGmsY4CYYL45mc6u+3G8rjbZR/zZldFGPnsf5N1Gca0v2HeLxlIfmnz0/I08b
         LLr2P5OCZo0s3nvSJqbbQEQxDdWxkBgTnwNnYjvfC7b8S/oQKrEQem7sry1iYjnCF4Pf
         99QQ==
X-Gm-Message-State: AOJu0Yyqxs2eJnYWqE9yq9ue+5BI7SyfvtS8m4gWgEEQRAbtYgip0agV
        OPN9+K+fIo7XkMB9u8FlUkPnhg==
X-Google-Smtp-Source: AGHT+IHvz39PhmZIwcIdO4tR0KRRtnyNlpxtI0fCwMzAk3lT5hLYxMJ+5ixn1nlE8yBoNrh2IR3eKA==
X-Received: by 2002:a17:906:ef8c:b0:9a1:b85d:c95a with SMTP id ze12-20020a170906ef8c00b009a1b85dc95amr1190547ejb.62.1693389528268;
        Wed, 30 Aug 2023 02:58:48 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (5073ED84.static.ziggozakelijk.nl. [80.115.237.132])
        by smtp.gmail.com with ESMTPSA id i15-20020a1709064ecf00b009a2202bfce5sm6957130ejv.118.2023.08.30.02.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 02:58:47 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Wed, 30 Aug 2023 11:58:29 +0200
Subject: [PATCH 04/11] arm64: dts: qcom: pm7250b: make SID configurable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230830-fp5-initial-v1-4-5a954519bbad@fairphone.com>
References: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
In-Reply-To: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
To:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Like other Qualcomm PMICs the PM7250B can be used on different addresses
on the SPMI bus. Use similar defines like the PMK8350 to make this
possible.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index e8540c36bd99..3514de536baa 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -7,6 +7,15 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
+/* This PMIC can be configured to be at different SIDs */
+#ifndef PM7250B_SID
+	#define PM7250B_SID 2
+#endif
+
+#ifndef PM7250B_SID1
+	#define PM7250B_SID1 3
+#endif
+
 / {
 	thermal-zones {
 		pm7250b-thermal {
@@ -39,16 +48,16 @@ trip2 {
 };
 
 &spmi_bus {
-	pmic@2 {
+	pmic@PM7250B_SID {
 		compatible = "qcom,pm7250b", "qcom,spmi-pmic";
-		reg = <0x2 SPMI_USID>;
+		reg = <PM7250B_SID SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 
 		pm7250b_temp: temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;
-			interrupts = <0x2 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			interrupts = <PM7250B_SID 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
 			io-channels = <&pm7250b_adc ADC5_DIE_TEMP>;
 			io-channel-names = "thermal";
 			#thermal-sensor-cells = <0>;
@@ -60,7 +69,7 @@ pm7250b_adc: adc@3100 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			#io-channel-cells = <1>;
-			interrupts = <0x2 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <PM7250B_SID 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
 
 			channel@0 {
 				reg = <ADC5_REF_GND>;
@@ -141,7 +150,7 @@ channel@99 {
 		pm7250b_adc_tm: adc-tm@3500 {
 			compatible = "qcom,spmi-adc-tm5";
 			reg = <0x3500>;
-			interrupts = <0x2 0x35 0x0 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <PM7250B_SID 0x35 0x0 IRQ_TYPE_EDGE_RISING>;
 			#thermal-sensor-cells = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -159,9 +168,9 @@ pm7250b_gpios: pinctrl@c000 {
 		};
 	};
 
-	pmic@3 {
+	pmic@PM7250B_SID1 {
 		compatible = "qcom,pm7250b", "qcom,spmi-pmic";
-		reg = <0x3 SPMI_USID>;
+		reg = <PM7250B_SID1 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};

-- 
2.42.0

