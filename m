Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAC5478F9C7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Sep 2023 10:18:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237599AbjIAISX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Sep 2023 04:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235376AbjIAISW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Sep 2023 04:18:22 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CB7310E0
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Sep 2023 01:18:19 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99bc9e3cbf1so351641466b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Sep 2023 01:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693556298; x=1694161098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hPnBKmoj2QhKcVODKMBJIDW9pFuru0q8Pgaqmd29Dcs=;
        b=rw+AMRkAJFgA/VorALwUfMcCqUmj63UDHZI8qhKF1EBe+Frc2uQEXOF/mEdTZBz6m/
         lqsCCQQTffg0ygmAeXeJAQzo+70fsIkG4qFUBeCJtEm3qy7QoX13isHUPDIMeczLRV93
         e65z+FecMQT7ugN/ZLZpq4MaOjhXzRDT9cuSJmRwJL10TNurvskYGwc/zD3pwz8vMaZc
         eu1Q3wV78DYeI/lGjCpUqnIJnQw4mLzjWUvDY6oBBmQCrvV5tT0nevdd0unJnTPjqeXu
         0QckxDcyFJdrSrIV4V4d7R7kjuWN7tVPM95NkryU0/s1uYvDE7qkp+jj0fkLcE3EFx0L
         LO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693556298; x=1694161098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hPnBKmoj2QhKcVODKMBJIDW9pFuru0q8Pgaqmd29Dcs=;
        b=HUFsT/g5A6FNroRZZPW3/85cZLZjaymY5lpDdd7dU6j4n0Hpl3HcIIP7o1nOvxmunb
         X+z7BY7DIwysz7gtgvbSu3ka6LenOv7afakqIDSyRH3grAW9+GBJ9OrQWL6/tMtQRKuz
         AeDWcQl1rHHP8J2GNEg+jUTKudOg0dUzex+zMvkpHxvW+Cw9pdWgn7HbKAYKO8TIVYja
         vlg2K6Z6lN6vQdLHmoeLJRsW8n6NcrPQ+yHEdvJxDEyN5XCTlkywpOPGYfoF67JNe4cQ
         NlsLxV2Fcr6tbkKPivdCkcrKYxHMIL3A0tj961JlLpwC1N31PhXzq9yoNadpbluX9SZV
         D7Kg==
X-Gm-Message-State: AOJu0YwKNM+wKQYX8UOmD1NaLa3QeVplB2C2woVS1FlXbKUWz2j4WB6I
        JvqscW8clsdgHfEOxiu9VzcK52sF8syTq8M1MYo=
X-Google-Smtp-Source: AGHT+IGHY/GfuZiBDwDoGN9ntKm58k7HJCv8+cMHykyj8S7fvdlAdcHLP0T8RRNwTlmAdDeJoiikOQ==
X-Received: by 2002:a17:907:6e20:b0:9a1:e5bf:c907 with SMTP id sd32-20020a1709076e2000b009a1e5bfc907mr5623717ejc.2.1693556297840;
        Fri, 01 Sep 2023 01:18:17 -0700 (PDT)
Received: from krzk-bin.. (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id b6-20020a170906d10600b009a57d30df89sm1676657ejz.132.2023.09.01.01.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 01:18:17 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        stable@vger.kernel.org
Subject: [RFT PATCH 1/2] arm64: dts: qcom: apq8096-db820c: fix missing clock populate
Date:   Fri,  1 Sep 2023 10:18:11 +0200
Message-Id: <20230901081812.19121-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Commit 704e26678c8d ("arm64: dts: qcom: apq8096-db820c: drop simple-bus
from clocks") removed "simple-bus" compatible from "clocks" node, but
one of the clocks - divclk1 - is a gpio-gate-clock, which does not have
CLK_OF_DECLARE.  This means it will not be instantiated if placed in
some subnode.  Move the clocks to the root node, so regular devices will
be populated.

Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Closes: https://lore.kernel.org/all/CAA8EJprF==p87oN+RiwAiNeURF1JcHGfL2Ez5zxqYPRRbN-hhg@mail.gmail.com/
Cc: <stable@vger.kernel.org>
Fixes: 704e26678c8d ("arm64: dts: qcom: apq8096-db820c: drop simple-bus from clocks")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts | 32 ++++++++++-----------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
index 385b178314db..3067a4091a7a 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
@@ -62,25 +62,23 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	clocks {
-		divclk4: divclk4 {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-			clock-output-names = "divclk4";
+	div1_mclk: divclk1 {
+		compatible = "gpio-gate-clock";
+		pinctrl-0 = <&audio_mclk>;
+		pinctrl-names = "default";
+		clocks = <&rpmcc RPM_SMD_DIV_CLK1>;
+		#clock-cells = <0>;
+		enable-gpios = <&pm8994_gpios 15 0>;
+	};
 
-			pinctrl-names = "default";
-			pinctrl-0 = <&divclk4_pin_a>;
-		};
+	divclk4: divclk4 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "divclk4";
 
-		div1_mclk: divclk1 {
-			compatible = "gpio-gate-clock";
-			pinctrl-0 = <&audio_mclk>;
-			pinctrl-names = "default";
-			clocks = <&rpmcc RPM_SMD_DIV_CLK1>;
-			#clock-cells = <0>;
-			enable-gpios = <&pm8994_gpios 15 0>;
-		};
+		pinctrl-names = "default";
+		pinctrl-0 = <&divclk4_pin_a>;
 	};
 
 	gpio-keys {
-- 
2.34.1

