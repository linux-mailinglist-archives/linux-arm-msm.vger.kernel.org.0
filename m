Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE078617A76
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 11:00:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231571AbiKCKAA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Nov 2022 06:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbiKCJ73 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Nov 2022 05:59:29 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5118D1098
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Nov 2022 02:59:26 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id 4so1474795pli.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Nov 2022 02:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GG1lGFZlW12z0E7EjoO28XPdhPu8bfYpc89EkhncBPQ=;
        b=AvSVp1tTk9nmbMjrBtWu6mzCoUgTZu+OsLV+mm4Dc6NdAPsjtq1lZMi2EWcWMUo0WS
         /uqUQFVCtWSY+0pCKoQExYfAmiLcbfCPx43Xnru5lLrUriGDjNXA6b0Pe83/2z2RUd9A
         hDYpFMttqKDWDUezmkvHsYRGWm2PwKgZFd093mSR25BtfHXNF+wYUBbKYQKeIWQFOpfI
         5fAir1UL9IKYApGFPI/MA6r6tqbNyzKBYtDzDkw9bPLvWgukEpz8w3iHlIi0B27Ij2m6
         +8sFWBP/HpdajoXNRIX9g0UsLjtRCuTGLcWK0SvyaEvGKvjmxGY9OisKhUQ+a012s02v
         Wsng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GG1lGFZlW12z0E7EjoO28XPdhPu8bfYpc89EkhncBPQ=;
        b=3kCrv/C6aZQERA8j5ZdMfm8I8W6WUsPqdrjGhzBDgDJvP3C+tpjWwXRdb+fsVabmg8
         Lbff8wKk6YTVhXx05msO9uEpmb9EJDtuwEAr5LDDD+SaBO4Wv1Yju4kfNcwO27p6sePs
         gRq6gXHlbtdE9criBrkxnqDy4k0ElQWphcDF8PKflF78uHvEfIzeaXLa2bsJWdWtAaiH
         FuLpTPjOt3gYxLwAAQm0OUAyn2FnVQYdOfIG3+2u/rzvuYFuHQMYW8OLsYtf3uQyMeUe
         WvQizG+h0quoTwzLkRR1d4xKnih8FuZ3pYcjfJ29TOZVnw7dO+pkh2CqjXhiLR105fIo
         1cOA==
X-Gm-Message-State: ACrzQf2BwliMpkMPIQ5XAvY4EUAn8fMN6SCezLSEIwilZC+Ir0T3kpxu
        VfXPoVL4sJZFj67/rcWch76O
X-Google-Smtp-Source: AMsMyM7KIVvt6KX6gWV3+5hPzF6RgLUbZg8Vz08JLkio8pX/IrJF2g+WAAIsks1JqYoJHIrSiPB5cw==
X-Received: by 2002:a17:902:e803:b0:187:3a52:d262 with SMTP id u3-20020a170902e80300b001873a52d262mr12016427plg.85.1667469565624;
        Thu, 03 Nov 2022 02:59:25 -0700 (PDT)
Received: from localhost.localdomain ([117.193.208.64])
        by smtp.gmail.com with ESMTPSA id n6-20020a170902e54600b00186c54188b4sm161670plf.240.2022.11.03.02.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 02:59:24 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 11/12] arm64: dts: qcom: sc8280xp-x13s: Add PM8280_{1/2} ADC_TM5 channels
Date:   Thu,  3 Nov 2022 15:28:09 +0530
Message-Id: <20221103095810.64606-12-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221103095810.64606-1-manivannan.sadhasivam@linaro.org>
References: <20221103095810.64606-1-manivannan.sadhasivam@linaro.org>
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

Add ADC_TM5 channels of PM8280_{1/2} for monitoring the temperature from
external thermistors connected to AMUX pins. The temperature measurements
are collected from the PMK8280's VADC channels that expose the
measurements from secondary PMICs PM8280_{1/2}.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 7677fe5cf28e..bdaacf1abf9f 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -254,6 +254,74 @@ pmic-die-temp@403 {
 	};
 };
 
+&pmk8280_adc_tm {
+	status = "okay";
+
+	sys-therm@0 {
+		reg = <0>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM1_100K_PU(1)>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+	};
+
+	sys-therm@1 {
+		reg = <1>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM2_100K_PU(1)>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+	};
+
+	sys-therm@2 {
+		reg = <2>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM3_100K_PU(1)>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+	};
+
+	sys-therm@3 {
+		reg = <3>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM4_100K_PU(1)>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+	};
+
+	sys-therm@4 {
+		reg = <4>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM1_100K_PU(3)>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+	};
+
+	sys-therm@5 {
+		reg = <5>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM2_100K_PU(3)>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+	};
+
+	sys-therm@6 {
+		reg = <6>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM3_100K_PU(3)>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+	};
+
+	sys-therm@7 {
+		reg = <7>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM4_100K_PU(3)>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+	};
+};
+
 &qup0 {
 	status = "okay";
 };
-- 
2.25.1

