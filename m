Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 794DA60F045
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 08:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234656AbiJ0Gbd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 02:31:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234560AbiJ0GbL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 02:31:11 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7CAA162505
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 23:30:59 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id c2so434149plz.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 23:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfwc4myKYMtHNH9EOVfJXOc2pPSqLuFVcY0vj1LaWVI=;
        b=kT1Ch47IE6GzgbikpG5NTRCq9tr5aq0ETpQ1NP6+DTG2i1N7FEpM4kPIPndtmkVzoV
         aJj24u5XC1996OrZO5aL9he0XEcIlScnvz4tkwF84BkMQVbg59Hdx+CzPZoi14NT0hox
         s3rorrQOjMD8KtBstHltLWtet9A87qyq52zbdrBisv0HA6EfS9Sqk/oBftg/XEZ6h5QN
         YPCFF2+p2tkhq3tiv27/zAR1b3wyCKi8jWJc3GAmJ0UzMBN23/r+hMlrHHxE9Gs43E2M
         8DJ82cewnQu47yhXoI239xSXpDJ+FO6sRJ+JsvMU6B7cgp+gBUG0t7yexaGA8AelbWFR
         qCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pfwc4myKYMtHNH9EOVfJXOc2pPSqLuFVcY0vj1LaWVI=;
        b=W+vgyTFATDPc4mQoFx1nlBeQfd+jxek3uIhrj+W/GPjRW6OMpYZlN/QNLq2vseq56E
         RsUhTdb+H9TrCFS1Un9pEPUShrkUfGtp+LIIQCellac9uyx8kZq+hcnqUgV7ZW10exKQ
         1ne64Mh4gF3KKE3XC4PxBZa2ENXO14+y7owLsXLW3XZqSqpRm4/8lYcfK1GyO0DSKwUq
         gkkVXLszKTtAGOmlDjj7k7+DKHrdyWhrgV11O10HwRA+MC1+xQbHSTTCKTsK0TKDzqkc
         hEJDPGK/+8fNFQbTg3SpFCQltsIlVdgG+b35hM590aYgM8Z3mjc3cg9D6kEGA1lAu8ue
         WqWg==
X-Gm-Message-State: ACrzQf1ARAVqTa12jIV0Z9PcIuqnwXt7NtSxoy14mMFBH+QlrpbtUSiT
        MQCK9na2XHT104Cea9k8o+vZ
X-Google-Smtp-Source: AMsMyM4ttK2oCFksp82uIH038JpsHoT9q+QPqBKt3gIzAo+/Fwgg/2f4lF92183txAgWI2DxyZKyNQ==
X-Received: by 2002:a17:90b:1c02:b0:213:17f1:50a7 with SMTP id oc2-20020a17090b1c0200b0021317f150a7mr8267703pjb.138.1666852259377;
        Wed, 26 Oct 2022 23:30:59 -0700 (PDT)
Received: from localhost.localdomain ([117.193.208.123])
        by smtp.gmail.com with ESMTPSA id i126-20020a626d84000000b00561d79f1064sm446041pfc.57.2022.10.26.23.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 23:30:58 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 09/11] arm64: dts: qcom: sc8280xp-x13s: Add PM8280_{1/2} VADC channels
Date:   Thu, 27 Oct 2022 12:00:04 +0530
Message-Id: <20221027063006.9056-10-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221027063006.9056-1-manivannan.sadhasivam@linaro.org>
References: <20221027063006.9056-1-manivannan.sadhasivam@linaro.org>
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

Add VADC channels of PM8280_{1/2} PMICs for measuring the on-chip die
temperature and external thermistors connected to the AMUX pins.

The measurements are collected by the primary PMIC PMK8280 from the
slave PMICs PM8280_{1/2} and exposed them over the PMK8280's VADC
channels.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 9ac5d5c22832..d300d217fdc6 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -189,6 +190,66 @@ pmk8280-xo-therm@44 {
 		qcom,ratiometric;
 		qcom,hw-settle-time = <200>;
 	};
+
+	pm8280-1-die-temp@103 {
+		reg = <PM8350_ADC7_DIE_TEMP(1)>;
+		label = "pm8280_1_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	sys-therm1@144 {
+		reg = <PM8350_ADC7_AMUX_THM1_100K_PU(1)>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+	};
+
+	sys-therm2@145 {
+		reg = <PM8350_ADC7_AMUX_THM2_100K_PU(1)>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+	};
+
+	sys-therm3@146 {
+		reg = <PM8350_ADC7_AMUX_THM3_100K_PU(1)>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+	};
+
+	sys-therm4@147 {
+		reg = <PM8350_ADC7_AMUX_THM4_100K_PU(1)>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+	};
+
+	pm8280-2-die-temp@303 {
+		reg = <PM8350_ADC7_DIE_TEMP(3)>;
+		label = "pm8250_2_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	sys-therm5@344 {
+		reg = <PM8350_ADC7_AMUX_THM1_100K_PU(3)>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+	};
+
+	sys-therm6@345 {
+		reg = <PM8350_ADC7_AMUX_THM2_100K_PU(3)>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+	};
+
+	sys-therm7@346 {
+		reg = <PM8350_ADC7_AMUX_THM3_100K_PU(3)>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+	};
+
+	sys-therm8@347 {
+		reg = <PM8350_ADC7_AMUX_THM4_100K_PU(3)>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+	};
 };
 
 &qup0 {
-- 
2.25.1

