Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1501B421CED
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 05:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231978AbhJEDZt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 23:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231752AbhJEDZn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 23:25:43 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D2D9C061755
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 20:23:53 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id g62-20020a9d2dc4000000b0054752cfbc59so24243687otb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 20:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M3NkAo4ipnsswFd7+bb6gh6i4/0zZCNYqzmzcXc1S2E=;
        b=uFy5Lbzdcs1mvU8Xy0XTdLp0Vm6MJS1W8fN46g+3N9sR6JBS1O6wgZNF265dwpgeMm
         Xhd1eXFIcB4DI6zxgCWu8tT8j94Wmb21RQRERzKkALcOYUWZGILlORlmaTwedRBnXNEZ
         TGpWSckGdau3g5uhG//nK1g43jjvFmkjFCT8w44SALnvsr+Wt+lQXaC7QQ6raaArEG1J
         vWrKYe9fP7DpjErgZM8KtNPWC3ldmYFXXNqSn3gt7Zg1ZLGHRuyylwYcOUEO5kCNywzx
         g48mwjcAsb19mV3yOwRIJMkLJSim79LDlDQydu84ALS3DScY8VQ4gEjKxIqQnmZmoOnF
         uO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M3NkAo4ipnsswFd7+bb6gh6i4/0zZCNYqzmzcXc1S2E=;
        b=YxTNQmXHBQA/ItjDZXOfaOsS5H+GzfSATR3VU+F8qeHQ7bCofjugFlYh0C0TVZb1R+
         1dYpTP5kc2Tmgd+uVoCFd2lIRBb3F4oIeWzQybz+NDfpm03PYrQTxRFKrantgFHtBBWw
         nUnuAIR0t8YNTaB7uvL6QYH+HYsyHdxYg48/QjgMWTmS+KBnciolKLC2wtjcFXruetLI
         3NIfISnxJY+iKNEAj6pF2hkLllsy+mQWgCK1Z2CDxYjC4LOvDVDOIEbfGUgwbMzzdtfM
         yJD8ukBackw5gaB+J80FYV2Py8ijTdhCLfFNACqLudtSD4JyrlBc9bI/R2tNAX1ZmWPb
         kjSQ==
X-Gm-Message-State: AOAM532i2y7/x+PEu8jhEMqFTQiQluGIrbtp0LfcVRW25yQWQoQ4tE3Y
        AHJhce+ykymUyzz6D1LVinaItw==
X-Google-Smtp-Source: ABdhPJxuDS9IV4ItxFNGGCcxhc3uf20xc9kw5e45MlPkQsi0Y/yMX84fwjbn7f0aE4U+5x0m7VqOuA==
X-Received: by 2002:a9d:6a50:: with SMTP id h16mr12335629otn.314.1633404232776;
        Mon, 04 Oct 2021 20:23:52 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id j4sm3111955oia.56.2021.10.04.20.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 20:23:52 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] arm64: dts: qcom: sdm845: mtp: Add vadc channels and thermal zones
Date:   Mon,  4 Oct 2021 20:25:31 -0700
Message-Id: <20211005032531.2251928-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211005032531.2251928-1-bjorn.andersson@linaro.org>
References: <20211005032531.2251928-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Downstream defines four ADC channels related to thermal sensors external
to the PM8998 and two channels for internal voltage measurements.

Add these to the upstream SDM845 MTP, describe the thermal monitor
channels and add thermal_zones for these.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- Added missing qcom,ratiometric and qcom,hw-settle-time-us from the ADC channels

 arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 140 ++++++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 52dd7a858231..9aa21399b7ee 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -10,6 +10,8 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sdm845.dtsi"
+#include "pm8998.dtsi"
+#include "pmi8998.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. SDM845 MTP";
@@ -46,6 +48,68 @@ vreg_s4a_1p8: pm8998-smps4 {
 
 		vin-supply = <&vph_pwr>;
 	};
+
+	thermal-zones {
+		xo_thermal: xo-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pm8998_adc_tm 1>;
+
+			trips {
+				trip-point {
+					temperature = <125000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+			};
+		};
+
+		msm_thermal: msm-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pm8998_adc_tm 2>;
+
+			trips {
+				trip-point {
+					temperature = <125000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+			};
+		};
+
+		pa_thermal: pa-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pm8998_adc_tm 3>;
+
+			trips {
+				trip-point {
+					temperature = <125000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+			};
+		};
+
+		quiet_thermal: quiet-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pm8998_adc_tm 4>;
+
+			trips {
+				trip-point {
+					temperature = <125000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+			};
+		};
+	};
 };
 
 &adsp_pas {
@@ -469,6 +533,82 @@ &mss_pil {
 	firmware-name = "qcom/sdm845/mba.mbn", "qcom/sdm845/modem.mbn";
 };
 
+&pm8998_adc {
+	adc-chan@4c {
+		reg = <ADC5_XO_THERM_100K_PU>;
+		label = "xo_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	adc-chan@4d {
+		reg = <ADC5_AMUX_THM1_100K_PU>;
+		label = "msm_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	adc-chan@4f {
+		reg = <ADC5_AMUX_THM3_100K_PU>;
+		label = "pa_therm1";
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	adc-chan@51 {
+		reg = <ADC5_AMUX_THM5_100K_PU>;
+		label = "quiet_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	adc-chan@83 {
+		reg = <ADC5_VPH_PWR>;
+		label = "vph_pwr";
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	adc-chan@85 {
+		reg = <ADC5_VCOIN>;
+		label = "vcoin";
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+};
+
+&pm8998_adc_tm {
+	status = "okay";
+
+	xo-thermistor@1 {
+		reg = <1>;
+		io-channels = <&pm8998_adc ADC5_XO_THERM_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	msm-thermistor@2 {
+		reg = <2>;
+		io-channels = <&pm8998_adc ADC5_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	pa-thermistor@3 {
+		reg = <3>;
+		io-channels = <&pm8998_adc ADC5_AMUX_THM3_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	quiet-thermistor@4 {
+		reg = <4>;
+		io-channels = <&pm8998_adc ADC5_AMUX_THM5_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
-- 
2.29.2

