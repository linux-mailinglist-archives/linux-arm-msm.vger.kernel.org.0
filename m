Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31D0161207A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 07:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbiJ2FQs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Oct 2022 01:16:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbiJ2FQW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Oct 2022 01:16:22 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D4941D4608
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 22:16:05 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id c24so6529688pls.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 22:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dpyWOsS0FBSOmnylpOdwOjAVxC2jYFz7gdsUBGPUnb0=;
        b=qzoXpid0DCIWb2RKt8w0bFIHln3U61B6bnegL/kf56vwhNn+IPJnNLiX2Mubujj/P4
         /Ve39fktovVrJt9csGeFLKBuminWK8xrLY+Bfy6A0xh3jMzNAiOcNuEXF4EfQcJAQTra
         n+A1GyiXoeh4zqTLKeMQmHr1qpmGhEsAI37wq13R6RCWhYWem9t3KnVViOayMYrHjOOE
         zpnZlCxtQQtsXkJh1OfbcMp6ZWdM8xTRRNZjOeVguSEu1RUQgOFTQ69KaB1gg5BtGbpZ
         VIqbJfHz46kKTO4OkxjkVkAwdlFMP3GGzZ/UCxXOhL7go4v7LDRQP55GBa7g+spy5tu5
         kYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dpyWOsS0FBSOmnylpOdwOjAVxC2jYFz7gdsUBGPUnb0=;
        b=v246iNmCoGkY62vb2S4irLeOOT96CXuLXR0I5jhtcs5KgLHnGFDMHxI2qqWY3r2BTB
         NJj7742pKjLPXc1CHk6PPA74n8LI4bXm7TtK5UlsyesbeXwDHzRooJ4P6IWT1rsLMiKE
         HsAiYu3WkGeLPp9Ditd2mzPomH1v4Ri9HVaKPEgpLO64eFtiOW5WFN+Im4dnGJE1MuXD
         lPm3BTZON9QDyclaG8Uj2DOD4PDDIb5Db8+2ITVm3cf9qidjfazTVwgPU+W3QMPid5sW
         ryjJtihtIVY0q3mQBukX3hxHtYV4UQ32NlHURZWTCEJswdVK9M0ORXHHgAyCTiF5xmaf
         77qg==
X-Gm-Message-State: ACrzQf2Vqjp8q45sEmMU9sBsJ9LCnNc2p7GP0SUDXOMx4/51+f9kC6tE
        OfCv8tjMmnbu3pZ8FK1UTcV8
X-Google-Smtp-Source: AMsMyM4lz557/k3cVsDcvnHIuqI4qgGU+9VIzarRNzaOlvgWn7mLqPcYcpRqteRblBPbukofVqJCPQ==
X-Received: by 2002:a17:90b:38d1:b0:210:99f9:9712 with SMTP id nn17-20020a17090b38d100b0021099f99712mr20447697pjb.57.1667020565035;
        Fri, 28 Oct 2022 22:16:05 -0700 (PDT)
Received: from localhost.localdomain ([59.92.103.167])
        by smtp.gmail.com with ESMTPSA id f5-20020a170902ce8500b0017e9b820a1asm363150plg.100.2022.10.28.22.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 22:16:04 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 12/12] arm64: dts: qcom: sc8280xp-x13s: Add thermal zone support
Date:   Sat, 29 Oct 2022 10:44:49 +0530
Message-Id: <20221029051449.30678-13-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221029051449.30678-1-manivannan.sadhasivam@linaro.org>
References: <20221029051449.30678-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add thermal zone support by making use of the thermistor SYS_THERM6.
Based on experiments, this thermistor seems to reflect the actual
surface temperature of the laptop.

For the cooling device, all BIG CPU cores are throttle down to keep the
temperature at a sane level.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index ca77c19c6d0d..96e2fa72f782 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -29,6 +29,52 @@ backlight {
 		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
 	};
 
+	thermal-zones {
+		skin-temp-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <0>;
+			thermal-sensors = <&pmk8280_adc_tm 5>;
+
+			trips {
+				skin_temp_alert0: trip-point0 {
+					temperature = <55000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				skin_temp_alert1: trip-point1 {
+					temperature = <58000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				skin-temp-crit {
+					temperature = <73000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&skin_temp_alert0>;
+					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				map1 {
+					trip = <&skin_temp_alert1>;
+					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
 	vreg_edp_bl: regulator-edp-bl {
 		compatible = "regulator-fixed";
 
-- 
2.25.1

