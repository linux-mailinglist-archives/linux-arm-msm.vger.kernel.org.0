Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58C41617A74
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 11:00:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbiKCJ7k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Nov 2022 05:59:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231334AbiKCJ7P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Nov 2022 05:59:15 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90DE310565
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Nov 2022 02:59:14 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d10so1128250pfh.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Nov 2022 02:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YII9cg1fVVnSoFc32Vc9IXlnm9vxUa2VGvtzY01BHFI=;
        b=MOLANO4HdTBe1eA8p/H2RLLJZ5QH3mr7wlyCfto2l6A66EUNRQQ3w692pZymsiSIG+
         gup6aAMDGeXKW9ZS1uTuTeVTUB/dAOoCm+po2SO6us2x3OkguvUNAOhHHlFTxg6eb7Gq
         jrB3CqvOs+25k2/Nv2StH/HrcZ0oOLR3Fmsw01qJZz3xgKkyVfxiOzIKs2yAYCMFT82N
         1mCCe5Jbx5Tq7+3Z/H6hlAMNwiEJJntssv5D+Jeg9No7MSavd+mWsaemyhKWDz5m0lLc
         9skiGN2yFQWsoDQY0h8pptXyJbyL4fvH8lZBGxAmOE/x+DdYnLu8M35vONZ8q2F1KvYb
         Dp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YII9cg1fVVnSoFc32Vc9IXlnm9vxUa2VGvtzY01BHFI=;
        b=57eTCYFT17mstsez9VBFXjzHdkituGmhDzRsc+zFKsxJHx16GZD6wLRF4r9DKh21Aj
         V323nyvrxrGQX2oACRgIx/UEnY4WVWMs90BIoxxzNAhClc9GorgwuRoDRNyxJ3gBjDY/
         YoOkGIqt+dUGEkPDtLE7snvP4mnVbd5eDtMQnq3Z3SdDk3DPUiJvKQdj5NTj5/OiD/st
         Wf6t5zwTdoX5LoXqRUxBIeZ6z9twQgtGggJSlrsF+ZP8AWdiLhq4xss4sI0dJBZJjgu0
         beJ8GAI5+GyJ05hizXMOvdt3T8oiARGisGMzmE6n5KepXWsHVZjU7xRnwACYjdRqi0zw
         0FPA==
X-Gm-Message-State: ACrzQf260B/rNb7CX/ugzLtqDYbT2jTzF+Y3wk8KkfDPjo2qR8H6opeK
        kKEK01m9s/KSv6dH7lbCWB19
X-Google-Smtp-Source: AMsMyM6Yk9IXmeCCltSBM5lj46sC8OOZOjS+7TwyuByxvOT0Vn7TEQFc0lYMPbMla8bSjgVurJ18kg==
X-Received: by 2002:aa7:8d12:0:b0:56d:5de0:100b with SMTP id j18-20020aa78d12000000b0056d5de0100bmr21659092pfe.18.1667469554210;
        Thu, 03 Nov 2022 02:59:14 -0700 (PDT)
Received: from localhost.localdomain ([117.193.208.64])
        by smtp.gmail.com with ESMTPSA id n6-20020a170902e54600b00186c54188b4sm161670plf.240.2022.11.03.02.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 02:59:12 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 09/12] arm64: dts: qcom: sc8280xp-x13s: Add PM8280_{1/2} VADC channels
Date:   Thu,  3 Nov 2022 15:28:07 +0530
Message-Id: <20221103095810.64606-10-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221103095810.64606-1-manivannan.sadhasivam@linaro.org>
References: <20221103095810.64606-1-manivannan.sadhasivam@linaro.org>
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

Add VADC channels of PM8280_{1/2} PMICs for measuring the on-chip die
temperature and external thermistors connected to the AMUX pins.

The measurements are collected by the primary PMIC PMK8280 from the
secondary PMICs PM8280_{1/2} and exposed over the PMK8280's VADC channels.

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 9e1180b468d4..807d74026fab 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -187,6 +188,64 @@ xo-therm@44 {
 		qcom,hw-settle-time = <200>;
 		qcom,ratiometric;
 	};
+
+	pmic-die-temp@103 {
+		reg = <PM8350_ADC7_DIE_TEMP(1)>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	sys-therm@144 {
+		reg = <PM8350_ADC7_AMUX_THM1_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+	};
+
+	sys-therm@145 {
+		reg = <PM8350_ADC7_AMUX_THM2_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+	};
+
+	sys-therm@146 {
+		reg = <PM8350_ADC7_AMUX_THM3_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+	};
+
+	sys-therm@147 {
+		reg = <PM8350_ADC7_AMUX_THM4_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+	};
+
+	pmic-die-temp@303 {
+		reg = <PM8350_ADC7_DIE_TEMP(3)>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	sys-therm@344 {
+		reg = <PM8350_ADC7_AMUX_THM1_100K_PU(3)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+	};
+
+	sys-therm@345 {
+		reg = <PM8350_ADC7_AMUX_THM2_100K_PU(3)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+	};
+
+	sys-therm@346 {
+		reg = <PM8350_ADC7_AMUX_THM3_100K_PU(3)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+	};
+
+	sys-therm@347 {
+		reg = <PM8350_ADC7_AMUX_THM4_100K_PU(3)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+	};
 };
 
 &qup0 {
-- 
2.25.1

