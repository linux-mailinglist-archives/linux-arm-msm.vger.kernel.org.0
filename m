Return-Path: <linux-arm-msm+bounces-20929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D07A08D354A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 13:18:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EA641F24EE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 11:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2149180A69;
	Wed, 29 May 2024 11:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WzayCR74"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6C417F365
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 11:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716981449; cv=none; b=J+py26PGMwacahlNW5AI5UXjKBJBPMWNw3G0PmQJB3zqkwe77xBOdxqCqFmyu4rNt8H+6l83XlEBP6yUcAL4LCC8YFQN/aD/M9Q5s7bh7oLHTqoP0r5giCNfsJ7q4CR2Pr4Q98/9hgnbZVVZrljuodO5VCKklvDyeFRrSl8pJrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716981449; c=relaxed/simple;
	bh=yRI61iA92I7OuzMyeSRuApM8Gyb9ffOZWQo8H97O2TI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tCMjcwy06eBNhUptqgPfD0TB3sICu05P4Lu4JKgdSq7RLbwb+nUn3x8EixG5uZAd5pHIJhkh0TMkEuc0BxlRfVcg1Vqw68rcUzpYjrz9+FNl3u4UKjqxr3k6xW4zVEZfo1q4kB0RuxOTEjpHYLNOrMEljF1OcMG3UG0isFP/B08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WzayCR74; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5785f861868so2472370a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 04:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716981445; x=1717586245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hL9TlzSpJxaQE/CgoZ4k6g5IocgtHF1mcOhfzwDMMRQ=;
        b=WzayCR74HPgvSxL/qKBZw+0ufogE+u3JfDf1sicJ12Gl52TTfFBfA4IsTmwXL8Nql4
         8p35D9UWxbDimq6UtwwY393KhAwS5YCeReKU1LZ+dMEelzZFbMQCo6SuNuglqfRkN/kn
         hTIRFJAky8R6TWqeM76cHYixZRPwmZryURG89rIjZ6q1PnyqX4YWQjoQj27Ysdrjy3w/
         dC8IrJFefivjSc3nEmcouJ7w4MVdNbvCWTDtVgf3lWyqBRfft3eNq+eSzl+0u16x1JVv
         KD+VexWRWm8EqY08FXPYKf5BCZ12BK3HWgQuevUrrK0DiUslpqnF//yOV7ZQ8h3QCl51
         3bmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716981445; x=1717586245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hL9TlzSpJxaQE/CgoZ4k6g5IocgtHF1mcOhfzwDMMRQ=;
        b=E1KmHDCdySctgJJjTq7LJ01GBT4ajAQlEMS6HQktxnnuNgGwOtpThagXmpIhBM1tHF
         AIhXkxkqUklNHof0acpRIsVL7EvI5I2I/NbQB2L5nyl8ZY+wxwFtYeqtcw8KL96ap3Ex
         Y9+7WowjrcD3XnL/2yG8STP6MwjrV6Fz876/wklmJ+KkLNhwRl3GOjW3jFQ2EoRZXL5/
         NX4Cdou812G7lQJw+naNknSIVDV1mYRm5yyWIv8BFFcWa9c/sSmFp7deh6R2giuylplh
         Bw/w9IjtTQTXu7SO5Q0oogN+kZnujDzGrEyAhluaw2QnsmnxxTLmRNwUP5otkMdPdPm1
         MsMA==
X-Forwarded-Encrypted: i=1; AJvYcCXPvTvtjgXYVWyeNVPh3hCbuM5VfAILv71sJCF6bbVeKDR4sqb9GVxO923tmYzbseOrQ2+ectuIzDleVxbik7Y3MNrSWp/XOChULi5jDg==
X-Gm-Message-State: AOJu0YxNrKisc43sUwioE6P3tdQwcMkoqPMJebbPOrfrhCzgOcHY4U5K
	QSUGYnnT3zqeQ559cln4NFcGC7vzl1JSMay5uiTiv8OJTU5CjvAPzocX9RanngMc50PyWYRAMpM
	TrFU=
X-Google-Smtp-Source: AGHT+IFLKgsSe4JQdtGSjIFQXszVWqqRnM6f7kzXKUuYffekZHkYFH0t+F3LtVp5PJy3fGC54Ysnxg==
X-Received: by 2002:a17:906:1991:b0:a5a:5496:3c76 with SMTP id a640c23a62f3a-a6264192fe8mr1000027066b.6.1716981445616;
        Wed, 29 May 2024 04:17:25 -0700 (PDT)
Received: from [192.168.128.35] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc8da37sm708826166b.183.2024.05.29.04.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 04:17:24 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 29 May 2024 13:17:18 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: x1e80100-pmics: Add the missing
 PMICs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-topic-x1e_pmic-v1-2-9de0506179eb@linaro.org>
References: <20240529-topic-x1e_pmic-v1-0-9de0506179eb@linaro.org>
In-Reply-To: <20240529-topic-x1e_pmic-v1-0-9de0506179eb@linaro.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716981440; l=11953;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=yRI61iA92I7OuzMyeSRuApM8Gyb9ffOZWQo8H97O2TI=;
 b=2v45S0BxCJVEOA9GMNRVgIPzpCfC9iegt98T/QG4l2SJyTHwUyqlMfHkqyqNvHqQbakBXYSgY
 oEWuUh9MxvpCC09RiZRY0aLoAa8sWMY+yhms4l9EJKngo9EuxA3OD4C
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

During the initial bringup, all of the peripherals on non-SMB PMICs
were either not used, or were not necessary to accomplish certain
goals. This however, left a hole in the hardware description.

Add the missing ones.

Note that the PM8010 errors out on reads on the CRD (works fine on the
QCP) for reasons unknown, but that shall be ironed out in the future..

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi | 480 +++++++++++++++++++++++++++
 1 file changed, 480 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
index 04301f772fbd..a5662d39fdff 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
@@ -3,10 +3,477 @@
  * Copyright (c) 2024, Linaro Limited
  */
 
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
 / {
+	thermal-zones {
+		pm8550-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pm8550_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pm8550ve-2-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pm8550ve_2_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pmc8380-3-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmc8380_3_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pmc8380-4-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmc8380_4_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pmc8380-5-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmc8380_5_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pmc8380-6-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmc8380_6_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pm8550ve-8-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pm8550ve_8_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pm8550ve-9-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pm8550ve_9_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pm8010-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pm8010_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus0 {
+	/* PMK8380 */
+	pmk8550: pmic@0 {
+		compatible = "qcom,pm8550", "qcom,spmi-pmic";
+		reg = <0x0 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmk8550_pon: pon@1300 {
+			compatible = "qcom,pmk8350-pon";
+			reg = <0x1300>, <0x800>;
+			reg-names = "hlos", "pbs";
+
+			pon_pwrkey: pwrkey {
+				compatible = "qcom,pmk8350-pwrkey";
+				interrupts = <0x0 0x13 0x7 IRQ_TYPE_EDGE_BOTH>;
+				linux,code = <KEY_POWER>;
+			};
+
+			pon_resin: resin {
+				compatible = "qcom,pmk8350-resin";
+				interrupts = <0x0 0x13 0x6 IRQ_TYPE_EDGE_BOTH>;
+				status = "disabled";
+			};
+		};
+
+		pmk8550_rtc: rtc@6100 {
+			compatible = "qcom,pmk8350-rtc";
+			reg = <0x6100>, <0x6200>;
+			reg-names = "rtc", "alarm";
+			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
+			/* Not yet sure what blocks access */
+			status = "reserved";
+		};
+
+		pmk8550_sdam_2: nvram@7100 {
+			compatible = "qcom,spmi-sdam";
+			reg = <0x7100>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x7100 0x100>;
+
+			reboot_reason: reboot-reason@48 {
+				reg = <0x48 0x1>;
+				bits = <1 7>;
+			};
+		};
+
+		pmk8550_gpios: gpio@8800 {
+			compatible = "qcom,pmk8550-gpio", "qcom,spmi-gpio";
+			reg = <0xb800>;
+			gpio-controller;
+			gpio-ranges = <&pmk8550_gpios 0 0 6>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	/* PMC8380C */
+	pm8550: pmic@1 {
+		compatible = "qcom,pm8550", "qcom,spmi-pmic";
+		reg = <0x1 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8550_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm8550_gpios: gpio@8800 {
+			compatible = "qcom,pm8550-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm8550_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		pm8550_flash: led-controller@ee00 {
+			compatible = "qcom,pm8550-flash-led", "qcom,spmi-flash-led";
+			reg = <0xee00>;
+			status = "disabled";
+		};
+
+		pm8550_pwm: pwm {
+			compatible = "qcom,pm8550-pwm", "qcom,pm8350c-pwm";
+			#pwm-cells = <2>;
+
+			status = "disabled";
+		};
+	};
+
+	/* PMC8380VE */
+	pm8550ve_2: pmic@2 {
+		compatible = "qcom,pm8550", "qcom,spmi-pmic";
+		reg = <0x2 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8550ve_2_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm8550ve_2_gpios: gpio@8800 {
+			compatible = "qcom,pm8550ve-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm8550ve_2_gpios 0 0 8>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	/* PMC8380 is actually not a PM8550 series rebrand */
+	pmc8380_3: pmic@3 {
+		compatible = "qcom,pmc8380", "qcom,spmi-pmic";
+		reg = <0x3 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmc8380_3_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x3 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmc8380_3_gpios: gpio@8800 {
+			compatible = "qcom,pmc8380-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmc8380_3_gpios 0 0 10>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmc8380_4: pmic@4 {
+		compatible = "qcom,pmc8380", "qcom,spmi-pmic";
+		reg = <0x4 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmc8380_4_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmc8380_4_gpios: gpio@8800 {
+			compatible = "qcom,pmc8380-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmc8380_4_gpios 0 0 10>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmc8380_5: pmic@5 {
+		compatible = "qcom,pmc8380", "qcom,spmi-pmic";
+		reg = <0x5 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmc8380_5_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x5 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmc8380_5_gpios: gpio@8800 {
+			compatible = "qcom,pmc8380-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmc8380_5_gpios 0 0 10>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmc8380_6: pmic@6 {
+		compatible = "qcom,pmc8380", "qcom,spmi-pmic";
+		reg = <0x6 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmc8380_6_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x6 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmc8380_6_gpios: gpio@8800 {
+			compatible = "qcom,pmc8380-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmc8380_6_gpios 0 0 10>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	/* PMC8380VE */
+	pm8550ve_8: pmic@8 {
+		compatible = "qcom,pm8550", "qcom,spmi-pmic";
+		reg = <0x8 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8550ve_8_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x8 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm8550ve_8_gpios: gpio@8800 {
+			compatible = "qcom,pm8550ve-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm8550ve_8_gpios 0 0 8>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	/* PMC8380VE */
+	pm8550ve_9: pmic@9 {
+		compatible = "qcom,pm8550", "qcom,spmi-pmic";
+		reg = <0x9 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8550ve_9_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x9 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm8550ve_9_gpios: gpio@8800 {
+			compatible = "qcom,pm8550ve-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm8550ve_9_gpios 0 0 8>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pm8010: pmic@c {
+		compatible = "qcom,pm8010", "qcom,spmi-pmic";
+		reg = <0xc SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8010_temp_alarm: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0xc 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+	};
 };
 
 &spmi_bus1 {
@@ -48,4 +515,17 @@ smb2360_2_eusb2_repeater: phy@fd00 {
 			#phy-cells = <0>;
 		};
 	};
+
+	smb2360_3: pmic@c {
+		compatible = "qcom,smb2360", "qcom,spmi-pmic";
+		reg = <0xc SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		smb2360_3_eusb2_repeater: phy@fd00 {
+			compatible = "qcom,smb2360-eusb2-repeater";
+			reg = <0xfd00>;
+			#phy-cells = <0>;
+		};
+	};
 };

-- 
2.45.1


