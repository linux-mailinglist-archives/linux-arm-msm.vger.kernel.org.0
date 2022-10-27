Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4998B60F04D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 08:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234417AbiJ0Gbo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 02:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234595AbiJ0GbR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 02:31:17 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7056B164BFD
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 23:31:09 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id p3so438384pld.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 23:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=henhCPd8lraNCdDJWnoPIO23RxmIlqkGqlJr0QeoFWY=;
        b=WE/Xq3QwBPWoeDATpRNcL8M/G3ZKU2pYBLzvWJrmuGUvxW0GUAe1AmVjKmfKMgSzLb
         PUSSfPAITJLPvPEgGfkFysS0VwoZe9bMHVTM/0n+Hs36qUa6lJVsNBu7SP8MaR27ujgA
         WccP0bqYy2igcJ7O0h6IquokzIsz/GUepMurdUx6TzHcvD1nTkZ1F7RhOILXqM9oiSVl
         k4kCu4S2qzetpkIh4iVSMzzbQz8ZfmRwr2e3eCDtkDPNLFJUpzJdE1BWXkHx8UZjFAxg
         E7ghOFIcBGZX8rXlWcg9bEG8c4h5vM7jLsHQTrKjHwfpD+Q/ZUBUQcRpcycoB2Nvs22F
         eSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=henhCPd8lraNCdDJWnoPIO23RxmIlqkGqlJr0QeoFWY=;
        b=zKiKJD+ToQw0PcNWIeV60335lhbkVzl3PZY/UwFHE3vvUVL8gk/3e7VM0CmkO2MZyN
         Ja8ezfd8cchOMPj4Srh/8zkKjjwJJLHVaGM+egjmMltT/cJmyIkD6+3C4ViFcZSpU+ZO
         JFTHKoj4pUOQc0pKYvSBTmCY3//zEdxov2UOIoVswzg/QfA9MbqzVEd2eATdB8g/4LUu
         VEMK4J7NpKEIJmMGS2COQHCcrJD0W0QaV4P/oJGsMSgziTCNpdAid6qE3Kr0GEYSA9fj
         m1mcONxyIayjgxsWgd8op0zUKQcnWLyPoqScBqMWR3OYM68uy+fA27dkrpwRydPZS79d
         xsbA==
X-Gm-Message-State: ACrzQf1fgeuzri5kF0tmzSWyr4tHr2K+JdVjzLCRIPPCLED4c/B5pQBf
        BSM7Xt17TP9ib2FEXKmin3q7
X-Google-Smtp-Source: AMsMyM6r5m8xHEeOyHEYSqVROVYNLWpCgVzv+sw9X1/TV9wpB2SPnM0rPpLNuEnIbWYMni4dN3ycNg==
X-Received: by 2002:a17:902:8bc3:b0:178:8563:8e42 with SMTP id r3-20020a1709028bc300b0017885638e42mr47814600plo.0.1666852268489;
        Wed, 26 Oct 2022 23:31:08 -0700 (PDT)
Received: from localhost.localdomain ([117.193.208.123])
        by smtp.gmail.com with ESMTPSA id i126-20020a626d84000000b00561d79f1064sm446041pfc.57.2022.10.26.23.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 23:31:07 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 11/11] arm64: dts: qcom: sc8280xp-x13s: Add PM8280_{1/2} ADC_TM5 channels
Date:   Thu, 27 Oct 2022 12:00:06 +0530
Message-Id: <20221027063006.9056-12-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221027063006.9056-1-manivannan.sadhasivam@linaro.org>
References: <20221027063006.9056-1-manivannan.sadhasivam@linaro.org>
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

Add ADC_TM5 channels of PM8280_{1/2} for monitoring the temperatures from
external thermistors connected to AMUX pins. The temperture measurements
are collected from the PMK8280's VADC channels that expose the
mesasurements from slave PMICs PM8280_{1/2}.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index babf594384f2..fe6b75551ab9 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -259,6 +259,74 @@ pmr735a-die-temp@403 {
 	};
 };
 
+&pmk8280_adc_tm {
+	status = "okay";
+
+	sys-therm1@0 {
+		reg = <0>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM1_100K_PU(1)>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	sys-therm2@1 {
+		reg = <1>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM2_100K_PU(1)>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	sys-therm3@2 {
+		reg = <2>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM3_100K_PU(1)>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	sys-therm4@3 {
+		reg = <3>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM4_100K_PU(1)>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	sys-therm5@4 {
+		reg = <4>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM1_100K_PU(3)>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	sys-therm6@5 {
+		reg = <5>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM2_100K_PU(3)>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	sys-therm7@6 {
+		reg = <6>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM3_100K_PU(3)>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	sys-therm8@7 {
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

