Return-Path: <linux-arm-msm+bounces-25378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 467319288D3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 14:40:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EECFE2823FB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 12:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEBB514B09E;
	Fri,  5 Jul 2024 12:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="qngMOQ17"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC74214A627
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jul 2024 12:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720183217; cv=none; b=dapksm1sAj8Y9brQ0fcRH6d5Or41mVBl5J/e/B+/lnGAZ0R2aRzbhhiaLR7QfzIb3YM9BwRYnfLpvHnA7JqP3wZTa4w9R73vOD8IPORiVyU7inlSJ5H28jO0N1tkWYM7yng3FoYMw0YYf5VBCJM5FPSKwmDKjJE3UhG6IWY3Gjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720183217; c=relaxed/simple;
	bh=Nt2iq+qg5boCRZ0EqNaZFVPjBYGDaMf+7TTr358t9AI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jBX1e3FHsKdNEO9RReNySOU64Cgs5CAThsLUINKm3Bml87m4uFHJmYSCK0qqm46PBILDE0vLnO8WpgaJT4C7AAnEG8OURaR7TE2f6FdeMmZNily8SzYgH1K84pDKReb0HhB8aQbu11AaXQHNFem+NoxJOzTJ2k/MeplohcYez8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=qngMOQ17; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a77b60cafecso174197066b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jul 2024 05:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1720183214; x=1720788014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2TKJxxFdbT1m75EyS915frE7gzWvL0YWMkfBTtcQJ9Y=;
        b=qngMOQ17999F/az0hully1iuiZASro24Y+zVDlyBw/PoAf7C9daUwsC1weCJ2r/BKX
         4ORKss41ukmZWFvhme5Z5kefjhwTiToK6UY0/sQxQ2GnZQYlpTqMgjEPhAW+clh/9YFj
         sn5UvV9wK4ze+XVOcpKSo73XjMX3MbdyJdjihrH/zuhXrcYuKP4mngAdcu7UFlrGXxEO
         z5NOPsYKBcsjQt0n5gx2AEBDqR7a95slTfV94BvVBu7Hmvj0B/qbu5FEZKo7/ddCBjIk
         kv8GaeVqNSYcFxuW8WoPwXu5eT5h+3IEWXs5OlKqv6fm4jFi9xn/050jXbRLkT0l7wb6
         QfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720183214; x=1720788014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2TKJxxFdbT1m75EyS915frE7gzWvL0YWMkfBTtcQJ9Y=;
        b=nI+EOXjx1X2+DQoOAbpxMhbp5OVGFjK89Nnvl+lK3UNeAKFhiShqw0v4787YrrZi2f
         5RH01SIpwGOkuxb05t7CePPi+rmHjFKb4zT2ZsJDopHhxhKD6CiExnpvLLM2z/Z8a1Zc
         CArmZ+1OmW6/N9W3to/SDnAnJNl2tptZ0uOt2FTNeDjg5IC63gfM/dfrl/HOqfm/sb+R
         rqOc3vdKOyQm4MvlnkxDKVYpoFez6shcJWrLsYsZfhUflY/2vdOv+BNdAxPYDynUWGtq
         SPdFJxbA5xf9lf6o19rHvA7RWDSxa9gTEiDufLNkbZ0Pp621D2+YTVJi9SNb4Cawz056
         XHKA==
X-Forwarded-Encrypted: i=1; AJvYcCV1xSYm94sZsvI3mm7wyljGg6OJcXXoDgDoxSiba0DkU91R17rfFbH/6N87R4Z/5M6B3i4m8RCLPuoFHdBvTe6JRAbHkVUh7amOcFmUPg==
X-Gm-Message-State: AOJu0Ywtgb2PD3vS48rormdR8pWJU1k5Qkdo82WVDMQzXBDUJ35KYX1E
	b2K1IDKhwgP+moc5bt+TjyO2e70EOuiL6iZ3OzYFA5/Glny5vd0rJV77byHP/HHDZuelPBij51S
	T
X-Google-Smtp-Source: AGHT+IEtMbYTsd0gdLTiMY5AKurmr9zYWlPVFpAKFjwrVCKaLJfv2RWnXz+ziKcQ5XLpvY6+6z055A==
X-Received: by 2002:a17:906:5acd:b0:a77:b81a:2471 with SMTP id a640c23a62f3a-a77ba7115d5mr317894266b.49.1720183214164;
        Fri, 05 Jul 2024 05:40:14 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77d0908f51sm40930666b.125.2024.07.05.05.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 05:40:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 05 Jul 2024 14:40:10 +0200
Subject: [PATCH v2 2/2] arm64: dts: qcom: sm7225-fairphone-fp4: Add PM6150L
 thermals
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-fp4-thermals-v2-2-a4870a8d084f@fairphone.com>
References: <20240705-fp4-thermals-v2-0-a4870a8d084f@fairphone.com>
In-Reply-To: <20240705-fp4-thermals-v2-0-a4870a8d084f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.0

Configure the thermals for the PA_THERM1, MSM_THERM, PA_THERM0,
RFC_CAM_THERM, CAM_FLASH_THERM and QUIET_THERM thermistors connected to
PM6150L.

Due to hardware constraints we can only register 4 zones with
pm6150l_adc_tm, the other 2 we can register via generic-adc-thermal.

The trip points can really only be considered as placeholders, more
configuration with cooling etc. can be added later.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 189 ++++++++++++++++++++++
 1 file changed, 189 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index e263010c348c..2ee2561b57b1 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -93,6 +93,20 @@ memory@efe01000 {
 		};
 	};
 
+	msm_therm_sensor: thermal-sensor-msm {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+		io-channels = <&pm6150l_adc ADC5_AMUX_THM2_100K_PU>;
+		io-channel-names = "sensor-channel";
+	};
+
+	rear_cam_sensor: thermal-sensor-rear-cam {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+		io-channels = <&pm6150l_adc ADC5_GPIO2_100K_PU>;
+		io-channel-names = "sensor-channel";
+	};
+
 	thermal-zones {
 		chg-skin-thermal {
 			thermal-sensors = <&pm7250b_adc_tm 0>;
@@ -118,6 +132,30 @@ active-config0 {
 			};
 		};
 
+		pa0-thermal {
+			thermal-sensors = <&pm6150l_adc_tm 1>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		pa1-thermal {
+			thermal-sensors = <&pm6150l_adc_tm 0>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
 		pm8008-thermal {
 			polling-delay-passive = <100>;
 			thermal-sensors = <&pm8008>;
@@ -137,6 +175,64 @@ trip1 {
 			};
 		};
 
+		quiet-thermal {
+			thermal-sensors = <&pm6150l_adc_tm 3>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		rear-cam-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <5000>;
+			thermal-sensors = <&rear_cam_sensor>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		rfc-flash-thermal {
+			thermal-sensors = <&pm6150l_adc_tm 2>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		sdm-skin-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <5000>;
+			thermal-sensors = <&msm_therm_sensor>;
+
+			trips {
+				trip0 {
+					temperature = <45000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <55000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
 		xo-thermal {
 			thermal-sensors = <&pmk8350_adc_tm 0>;
 
@@ -596,6 +692,91 @@ &mpss {
 	status = "okay";
 };
 
+&pm6150l_adc {
+	pinctrl-0 = <&pm6150l_adc_default>;
+	pinctrl-names = "default";
+
+	channel@4d {
+		reg = <ADC5_AMUX_THM1_100K_PU>;
+		label = "pa_therm1";
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,ratiometric;
+	};
+
+	channel@4e {
+		reg = <ADC5_AMUX_THM2_100K_PU>;
+		label = "msm_therm";
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,ratiometric;
+	};
+
+	channel@4f {
+		reg = <ADC5_AMUX_THM3_100K_PU>;
+		label = "pa_therm0";
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,ratiometric;
+	};
+
+	channel@53 {
+		reg = <ADC5_GPIO2_100K_PU>;
+		label = "rear_cam_therm";
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,ratiometric;
+	};
+
+	channel@54 {
+		reg = <ADC5_GPIO3_100K_PU>;
+		label = "rear_cam_flash_therm";
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,ratiometric;
+	};
+
+	channel@55 {
+		reg = <ADC5_GPIO4_100K_PU>;
+		label = "quiet_therm";
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,ratiometric;
+	};
+};
+
+&pm6150l_adc_tm {
+	status = "okay";
+
+	pa-therm1@0 {
+		reg = <0>;
+		io-channels = <&pm6150l_adc ADC5_AMUX_THM1_100K_PU>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,ratiometric;
+	};
+
+	pa-therm0@1 {
+		reg = <1>;
+		io-channels = <&pm6150l_adc ADC5_AMUX_THM3_100K_PU>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,ratiometric;
+	};
+
+	rear-cam-flash-therm@2 {
+		reg = <2>;
+		io-channels = <&pm6150l_adc ADC5_GPIO3_100K_PU>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,ratiometric;
+	};
+
+	quiet-therm@3 {
+		reg = <3>;
+		io-channels = <&pm6150l_adc ADC5_GPIO4_100K_PU>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,ratiometric;
+	};
+};
+
 &pm6150l_flash {
 	status = "okay";
 
@@ -618,6 +799,14 @@ led-1 {
 	};
 };
 
+&pm6150l_gpios {
+	pm6150l_adc_default: adc-default-state {
+		pins = "gpio6", "gpio7", "gpio10";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+};
+
 &pm6150l_wled {
 	qcom,switching-freq = <800>;
 	qcom,current-limit-microamp = <20000>;

-- 
2.45.2


