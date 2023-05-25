Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68FD67107A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 May 2023 10:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240269AbjEYIfd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 May 2023 04:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240250AbjEYIfQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 May 2023 04:35:16 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57B30E54
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 May 2023 01:34:45 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f4d80bac38so328811e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 May 2023 01:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685003673; x=1687595673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aPiUbsAp8X/zENPhpMO+FWccJ40VFSNvpgwqJJhnT34=;
        b=LzTFXTehBMwT/jfMm6Z7FFXXpHBbNM+rdz9A2tlc6yEKS6GacVYx1Bn9Vn8bnUnnUX
         ofz31CWuFtLY2+8Q3xHgLVDcxWKJbz+EN06KVbOQ0hH5xpHqoiTujdhpj0Fp5H5MI+Ll
         wFQkX58KJUYmRY3MuTXNuI/1c5zBuFEzurBbSop3QHxn4g70cMV4rKElNS8yTvp4Gv3P
         uwK7lIc8FD1xpkBRBudcnMZZK5A+iDGAy5erG+Pofra5RMb+xTNQIRZUlxh6VRsjYFWA
         F+NjgKkRUa57m8C/7wgop/W4N9GPKpOa+7rVXJH4qyHhM5RQjxd8P/C2F9FMwcsrOmLd
         kIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685003673; x=1687595673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aPiUbsAp8X/zENPhpMO+FWccJ40VFSNvpgwqJJhnT34=;
        b=iRkBwLTA6aw7zWPqncTpoNr2J31Fd4FmFYIkN9F8Fipsv66Bg0pBz40m/DCb66oAHe
         vmsaq35+PYaz6iwygQLdoECKfayW192RF6QXwjjok0J5TIalbrx869My6j+XEZ26zt7K
         dp6CaK3qVFP1xADQIsIla+yP0zfGJkPRNP0h1yMR4iM0SAXNq6jAhq+sLRHTOQjwXqXz
         8ZtOaxS1ejja8Hedmt5q+ZAQ4Jwe9vLT67+/zwFpyHyM+yuDJeUvjJrksu4FwFC2LBrL
         c7kEBUgQMLwm1g3vktJIyMhj9Nca/BRQmdKm/c14U6d9p11S5PaPhhM/zP8NL4XZUD/X
         7Tag==
X-Gm-Message-State: AC+VfDwpLCcZzoNmt5kcUAfjTYz8+qFvvDuynIp8go88O4hWvQRWPgJ2
        Hrt0Oc4d2eMMkATJWl2E+DXqmQ==
X-Google-Smtp-Source: ACHHUZ7ctQDEQPnR21Ji/EfGSuZ6pLOajSEQfyilwaZ3OgDXUu1vlUTV2RUF3viTLJgLWUIWPJIxAw==
X-Received: by 2002:ac2:4116:0:b0:4f3:3eeb:20dc with SMTP id b22-20020ac24116000000b004f33eeb20dcmr4786616lfi.16.1685003672719;
        Thu, 25 May 2023 01:34:32 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id j28-20020ac2551c000000b004ddaea30ba6sm122242lfk.235.2023.05.25.01.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 01:34:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: pmk8350: disable ADC by default
Date:   Thu, 25 May 2023 11:34:31 +0300
Message-Id: <20230525083431.118929-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

There is no reason to keep the vADC enabled by default. Turn it off by
default and only reenable on the platforms which have some channels
configured.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmk8350.dtsi             | 1 +
 arch/arm64/boot/dts/qcom/sc7280-idp.dts           | 2 ++
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi          | 2 ++
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi        | 2 ++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 2 ++
 5 files changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmk8350.dtsi b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
index bc6297e7253e..df3e916e0171 100644
--- a/arch/arm64/boot/dts/qcom/pmk8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
@@ -56,6 +56,7 @@ pmk8350_vadc: adc@3100 {
 			#size-cells = <0>;
 			interrupts = <PMK8350_SID 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			status = "disabled";
 		};
 
 		pmk8350_adc_tm: adc-tm@3400 {
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index 15222e92e3f5..bfeeaf36546f 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -73,6 +73,8 @@ &nvme_3v3_regulator {
 };
 
 &pmk8350_vadc {
+	status = "okay";
+
 	pmr735a-die-temp@403 {
 		reg = <PMR735A_ADC7_DIE_TEMP>;
 		label = "pmr735a_die_temp";
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 21027042cf13..7c889ddf2881 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -432,6 +432,8 @@ &pcie1_phy {
 };
 
 &pmk8350_vadc {
+	status = "okay";
+
 	pmk8350-die-temp@3 {
 		reg = <PMK8350_ADC7_DIE_TEMP>;
 		label = "pmk8350_die_temp";
diff --git a/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi b/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
index 9137db066d9e..2bae0d0ccfdd 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
@@ -383,6 +383,8 @@ &pm8350c_pwm {
 };
 
 &pmk8350_vadc {
+	status = "okay";
+
 	pmk8350-die-temp@3 {
 		reg = <PMK8350_ADC7_DIE_TEMP>;
 		label = "pmk8350_die_temp";
diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 7ae6aba5d2ec..0f21bea683b7 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -515,6 +515,8 @@ &pmk8350_rtc {
 };
 
 &pmk8350_vadc {
+	status = "okay";
+
 	adc-chan@644 {
 		reg = <PMK8350_ADC7_AMUX_THM1_100K_PU>;
 		qcom,ratiometric;
-- 
2.39.2

