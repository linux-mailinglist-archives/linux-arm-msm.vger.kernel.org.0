Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25422612077
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 07:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbiJ2FQo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Oct 2022 01:16:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbiJ2FQK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Oct 2022 01:16:10 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB4751D4423
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 22:16:00 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id h14so6285156pjv.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 22:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzuhQnk+/5ipgdw10iW10n80y2XME509RyIjOUqWTgg=;
        b=Q/BIg5COsaTyRa/nKSpieFWtqi2CwAglz87e5KBzp9qRXtyTKyg8+dl8LNWihwEYc+
         jrKl+BxcFx6OIc/HEEI1dbn3Ggs6/EmR+rcKqcFvC1PCMpI9aZ+y/I60xbOrKnfxj2gY
         C5AVyekl5RFExSQEwX+5sU7wyp2054ZOZm+/7LNHL/iE+FZU7pRiGDjn9Y+WF69O99Vw
         4tZLGzVabUT2RxmynSt+d4d+fhtuJaKkjyloHQjYAH0KdutGr0yY61ZHx2uZGRL3okch
         Xh+9b6xpmtbhp93lPg+9AVTcic6T7iaYynAh+20VrZtywIHNOAF6OK8xhjsOkkv4N+vG
         B9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TzuhQnk+/5ipgdw10iW10n80y2XME509RyIjOUqWTgg=;
        b=HkmVPF8MclVgPTzIcp+kQSqkX3Bcc3mS0ftDIEXtHOwLl10J9R1Rvj8xsQBtVUIWVM
         vXqS9l5OxWRDf/pYrJNzWHwkABHFmzoq1NhFGhz3b4CfphZ7z+eodKfLZ5V5uOAmEKmC
         jJ8k3AjRQ2UwRYsehHMkEjCfxOk4ThTqa+QdrdNPElWqyHZCbI/kWBi+vMfwk9ct2Ere
         fPtMPW6kv4Pjt10sbhdyoaPkWO37rDs9oV49SE49erA5bKBw+mVxrp9EtCMRFekEVFZg
         XZn+E0RsJaYVrGKvPlifEqSNhHtVb60xu13Esr3OeIQeKn9NzT4S/BYohH/DeP6SkPWl
         hAqQ==
X-Gm-Message-State: ACrzQf1+BiFqNEqznEXXPccWXPI8TzlgAiMGlL6XUUsNMBYN6BnkE3Mp
        jlB8pGZwbQqrof09XUqyMMd8
X-Google-Smtp-Source: AMsMyM51EcnSu8SmAU5H22tbZyUpDOrpoB/bA5eyczaarbEF042GxN62w11JJMiPx/29rH6Z/zdi0Q==
X-Received: by 2002:a17:90a:1150:b0:213:a42b:a734 with SMTP id d16-20020a17090a115000b00213a42ba734mr3010837pje.163.1667020560232;
        Fri, 28 Oct 2022 22:16:00 -0700 (PDT)
Received: from localhost.localdomain ([59.92.103.167])
        by smtp.gmail.com with ESMTPSA id f5-20020a170902ce8500b0017e9b820a1asm363150plg.100.2022.10.28.22.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 22:15:59 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 11/12] arm64: dts: qcom: sc8280xp-x13s: Add PM8280_{1/2} ADC_TM5 channels
Date:   Sat, 29 Oct 2022 10:44:48 +0530
Message-Id: <20221029051449.30678-12-manivannan.sadhasivam@linaro.org>
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

Add ADC_TM5 channels of PM8280_{1/2} for monitoring the temperature from
external thermistors connected to AMUX pins. The temperture measurements
are collected from the PMK8280's VADC channels that expose the
measurements from secondary PMICs PM8280_{1/2}.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 9545b471c2fa..ca77c19c6d0d 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -259,6 +259,74 @@ pmic-die-temp@403 {
 	};
 };
 
+&pmk8280_adc_tm {
+	status = "okay";
+
+	sys-therm@0 {
+		reg = <0>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM1_100K_PU(1)>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	sys-therm@1 {
+		reg = <1>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM2_100K_PU(1)>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	sys-therm@2 {
+		reg = <2>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM3_100K_PU(1)>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	sys-therm@3 {
+		reg = <3>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM4_100K_PU(1)>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	sys-therm@4 {
+		reg = <4>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM1_100K_PU(3)>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	sys-therm@5 {
+		reg = <5>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM2_100K_PU(3)>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	sys-therm@6 {
+		reg = <6>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM3_100K_PU(3)>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	sys-therm@7 {
+		reg = <7>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM4_100K_PU(3)>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+};
+
 &qup0 {
 	status = "okay";
 };
-- 
2.25.1

