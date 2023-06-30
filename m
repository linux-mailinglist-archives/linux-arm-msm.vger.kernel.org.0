Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F20A47434CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 08:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232155AbjF3GN2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 02:13:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232195AbjF3GN0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 02:13:26 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA7FE3583
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 23:13:23 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b6afc1ceffso24351571fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 23:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688105602; x=1690697602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmRBKeVeea62c2bZpDux4kOiFgp+qlH+WdaHONOtng4=;
        b=ArvOrPGLCUveWnENdH2/CtKADsTkNJ58cKJKg/UqxyUJAMJp7d5tpgC6nrYBAQpiKq
         lNuVpxYxOnV+BTeOtffPjNxewq52RVGdq5k89poPwcRKbIIRAt2ISfmuX/NaWbF5Vd4b
         dLpooHhB1F5s4M54rkuuJ6mnJU/XKWc4k9AuzvrTYjoL27Dzl8ZLcu4aftz9C7WPLiT3
         IcFVG0lMAQ+0DZbd6hP11swNF4iXPldoLnjfm60f+wT85WdPxVOY2jhDCBaZzyX+jHDy
         llVI5lxpfGBZR30UJ14/uDjRuZ7lHJEsAPB8iu/XOGSmrUmVJmdW3xOnECWe5217KSTr
         vN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688105602; x=1690697602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmRBKeVeea62c2bZpDux4kOiFgp+qlH+WdaHONOtng4=;
        b=lb/9fFOpzDrHw+RlF3RKTZAPwVe5cNM5UFB5oxV/LxyyYSKzi4ESec/YZOAhlGTMhj
         a6MSk/j2u6vuZOvFY2TYhpDJBtzvZLzyy9yAJtDEvHGzKLDFsK/92y1o896MoHOcKzmn
         m5k+nNxlKwR9toBMnkvmnwtYXnXhPb12f7isMsuraAHgh7Aamn1OWlAB4dcU3jL7BaXC
         2swqgxg6VRTgLMObCGQBd0xwXWRtxtfemFNJ/pTiJgjABxzdzAB4dNABNl/AU92pNqkq
         cDL9hZtoDBLVRGI3o59x1HGsZVPnDt/jCKC78Qc75mWOgM5k4Q3A55hsymHdlbVRYz1m
         ae7Q==
X-Gm-Message-State: ABy/qLa+S8GWvNQpKFHgJyKy4vLNenenelRPxVLkDWpbi79E3cjD9LZL
        2KiPn4UHba1Qa44gLKobvuKJQA==
X-Google-Smtp-Source: APBJJlFV8Ho/y7QvuxHG3bC2rIlk0zjFmgaefZLeP/CyvUi2XqKLCkKacx7mMYNE9Miz3iIAEbZYDg==
X-Received: by 2002:a05:651c:105b:b0:2b5:9efc:827d with SMTP id x27-20020a05651c105b00b002b59efc827dmr1230907ljm.29.1688105602271;
        Thu, 29 Jun 2023 23:13:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g22-20020a2eb0d6000000b002b6caeb4b41sm505582ljl.27.2023.06.29.23.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 23:13:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 7/7] arm64: dts: qcom: sm8450-hdk: add ADC-TM thermal zones
Date:   Fri, 30 Jun 2023 09:13:15 +0300
Message-Id: <20230630061315.4027453-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630061315.4027453-1-dmitry.baryshkov@linaro.org>
References: <20230630061315.4027453-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add thermal zones controlled through the ADC-TM (ADC thermal monitoring)
PMIC interface. This includes several onboard sensors and the XO thermal
sensor.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 244 ++++++++++++++++++++++++
 1 file changed, 244 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index d07e402eaba3..4dfc964a4bb1 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -133,6 +133,120 @@ pmic_glink_sbu: endpoint {
 		};
 	};
 
+	thermal-zones {
+		camera-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <0>;
+			thermal-sensors = <&pmk8350_adc_tm 2>;
+
+			trips {
+				active-config0 {
+					temperature = <75000>;
+					hysteresis = <4000>;
+					type = "passive";
+				};
+			};
+		};
+
+		rear-tof-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <0>;
+			thermal-sensors = <&pmk8350_adc_tm 5>;
+
+			trips {
+				active-config0 {
+					temperature = <75000>;
+					hysteresis = <4000>;
+					type = "passive";
+				};
+			};
+		};
+
+		skin-msm-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <0>;
+			thermal-sensors = <&pmk8350_adc_tm 1>;
+
+			trips {
+				active-config0 {
+					temperature = <75000>;
+					hysteresis = <4000>;
+					type = "passive";
+				};
+			};
+		};
+
+		therm1-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <0>;
+			thermal-sensors = <&pmk8350_adc_tm 3>;
+
+			trips {
+				active-config0 {
+					temperature = <75000>;
+					hysteresis = <4000>;
+					type = "passive";
+				};
+			};
+		};
+
+		therm2-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <0>;
+			thermal-sensors = <&pmk8350_adc_tm 6>;
+
+			trips {
+				active-config0 {
+					temperature = <75000>;
+					hysteresis = <4000>;
+					type = "passive";
+				};
+			};
+		};
+
+		usb-conn-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <0>;
+			thermal-sensors = <&pmk8350_adc_tm 7>;
+
+			trips {
+				active-config0 {
+					temperature = <75000>;
+					hysteresis = <4000>;
+					type = "passive";
+				};
+			};
+		};
+
+		wide-rfc-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <0>;
+			thermal-sensors = <&pmk8350_adc_tm 4>;
+
+			trips {
+				active-config0 {
+					temperature = <75000>;
+					hysteresis = <4000>;
+					type = "passive";
+				};
+			};
+		};
+
+		xo-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&pmk8350_adc_tm 0>;
+
+			trips {
+				active-config0 {
+					temperature = <50000>;
+					hysteresis = <4000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -607,6 +721,66 @@ &pmr735a_temp_alarm {
 	io-channel-names = "thermal";
 };
 
+&pmk8350_adc_tm {
+	status = "okay";
+
+	xo-therm@0 {
+		reg = <0>;
+		io-channels = <&pmk8350_vadc PMK8350_ADC7_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	skin-msm-therm@1 {
+		reg = <1>;
+		io-channels = <&pmk8350_vadc PM8350_ADC7_AMUX_THM1_100K_PU(1)>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	camera-therm@2 {
+		reg = <2>;
+		io-channels = <&pmk8350_vadc PM8350_ADC7_AMUX_THM2_100K_PU(1)>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	therm1-therm@3 {
+		reg = <3>;
+		io-channels = <&pmk8350_vadc PM8350_ADC7_AMUX_THM3_100K_PU(1)>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	wide-rfc-therm@4 {
+		reg = <4>;
+		io-channels = <&pmk8350_vadc PM8350_ADC7_AMUX_THM4_100K_PU(1)>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	rear-tof-therm@5 {
+		reg = <5>;
+		io-channels = <&pmk8350_vadc PM8350_ADC7_AMUX_THM5_100K_PU(1)>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	therm2-therm@6 {
+		reg = <6>;
+		io-channels = <&pmk8350_vadc PM8350_ADC7_GPIO3_100K_PU(1)>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	usb-conn-therm@7 {
+		reg = <7>;
+		io-channels = <&pmk8350_vadc PM8350B_ADC7_AMUX_THM5_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+};
+
 &pmk8350_vadc {
 	status = "okay";
 
@@ -615,20 +789,90 @@ channel@3 {
 		label = "pmk8350_die_temp";
 	};
 
+	channel@44 {
+		reg = <PMK8350_ADC7_AMUX_THM1_100K_PU>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "pmk8350_xo_therm";
+	};
+
 	channel@103 {
 		reg = <PM8350_ADC7_DIE_TEMP(1)>;
 		label = "pm8350_die_temp";
 	};
 
+	channel@144 {
+		reg = <PM8350_ADC7_AMUX_THM1_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "skin_msm_temp";
+	};
+
+	channel@145 {
+		reg = <PM8350_ADC7_AMUX_THM2_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "camera_temp";
+	};
+
+	channel@146 {
+		reg = <PM8350_ADC7_AMUX_THM3_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "therm1_temp";
+	};
+
+	channel@147 {
+		reg = <PM8350_ADC7_AMUX_THM4_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "wide_rfc_temp";
+	};
+
+	channel@148 {
+		reg = <PM8350_ADC7_AMUX_THM5_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "rear_tof_temp";
+	};
+
+	channel@14c {
+		reg = <PM8350_ADC7_GPIO3_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "therm2_temp";
+	};
+
 	channel@303 {
 		reg = <PM8350B_ADC7_DIE_TEMP>;
 		label = "pm8350b_die_temp";
 	};
 
+	channel@348 {
+		reg = <PM8350B_ADC7_AMUX_THM5_100K_PU>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "usb_conn_temp";
+	};
+
 	channel@403 {
 		reg = <PMR735A_ADC7_DIE_TEMP>;
 		label = "pmr735a_die_temp";
 	};
+
+	channel@44a {
+		reg = <PMR735A_ADC7_GPIO1_100K_PU>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "qtm_w_temp";
+	};
+
+	channel@44b {
+		reg = <PMR735A_ADC7_GPIO2_100K_PU>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "qtm_n_temp";
+	};
 };
 
 &remoteproc_adsp {
-- 
2.39.2

