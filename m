Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3253D7C7FA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Oct 2023 10:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbjJMIKX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Oct 2023 04:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbjJMIKU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Oct 2023 04:10:20 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3603C9
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Oct 2023 01:10:17 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-53de8fc1ad8so3150024a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Oct 2023 01:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1697184616; x=1697789416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8aB/9PUkAq81szG0QmtzVGYTtfjdGzgK8T49SbW5WY=;
        b=zf4LyoIUg5u/gOGjrLKKyHMA9J0wkQ7osfPmUC5ChFZbCOGG6nUGbqKFQZ6t5wlFl3
         PWJf79Vt36p6TF6r/GDeEf6UfX0AiUvWrliR3z3UYnIZHAGTvGawYy/eeq643yvDmNPy
         qAXUnOMNDSD8F/hh1RbhZC9t3xAzXdjB2EQ2Nt1ZkPO7/PJ51figrTvXXrnmWf4ByW85
         7Sa40hRz57fJSPHlCMOc4Is0Kgj9VrD/AFVmQkScYgZfdIBVtboLnuvGTzzsDAKD2EZn
         DlstwVfWe0adM0G8lDucjpYivJJOVce0d+8fIN0fdtosm5EhGt2P1FB7rhem9qPEe09c
         URmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697184616; x=1697789416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8aB/9PUkAq81szG0QmtzVGYTtfjdGzgK8T49SbW5WY=;
        b=lOIRUs4ZDbEzYzdTcCtLwqK0fhGo1d2hR0licHRXkBjiPFkcuBvfqAHFjcftPt0hLX
         R1MHtpt/V/qrnQK65Xtf/GO1wb7iiiiknqDrmYTPE6cenGC9c4/2ahbPcA4tMwxkG78M
         DY0GQHxSLaFwbqp9eGjVyBCZUDSySVRvrJwf+5uKQ0lyONe+1X279HOGlQQMB9gqy7nz
         Vi7qkkZx8SAHptfShzK5TNc4aLE5fICCfuHIxvP0Fk01nbHwyBzXYOQvx8xWpyXqogxe
         Sf09e8Om86IlrIqhy+eRsjPZCHgD4XD6+YOLXPMsRBbVEPKP35+a+e1JO/BdMQvp5BbQ
         6Dyg==
X-Gm-Message-State: AOJu0YzSiagChS836D8aFjeMCq8ylnRCtcwSqrLPwmL3O0X8bultNxi3
        i5GC5DyJwd8N/4gq+CyXHIqJ6JdL4qssWrsfGVOKPQ==
X-Google-Smtp-Source: AGHT+IG1nht9LrVwfoOhVo6s5sTGYri/ndzIyY/69fNJRBgpx9Hk2quyQA5gwcXiN3FQ2/e/BgJCtQ==
X-Received: by 2002:a17:906:2929:b0:9b8:df8e:cbde with SMTP id v9-20020a170906292900b009b8df8ecbdemr20789300ejd.51.1697184616056;
        Fri, 13 Oct 2023 01:10:16 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id q14-20020a170906360e00b009a5f1d1564dsm11910761ejb.126.2023.10.13.01.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 01:10:15 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 13 Oct 2023 10:09:55 +0200
Subject: [PATCH 3/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Add PMK7325
 thermals
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231013-fp5-thermals-v1-3-f14df01922e6@fairphone.com>
References: <20231013-fp5-thermals-v1-0-f14df01922e6@fairphone.com>
In-Reply-To: <20231013-fp5-thermals-v1-0-f14df01922e6@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Configure the thermals for the XO_THERM line connected to PMK7325 (named
in software PMK8350).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 7fe19b556e6a..2c01f799a6b2 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -9,6 +9,7 @@
 #define PM7250B_SID 8
 #define PM7250B_SID1 9
 
+#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
@@ -163,6 +164,20 @@ active-config0 {
 				};
 			};
 		};
+
+		xo-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&pmk8350_adc_tm 0>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
 	};
 };
 
@@ -514,10 +529,33 @@ led-0 {
 	};
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
+};
+
 &pmk8350_rtc {
 	status = "okay";
 };
 
+&pmk8350_vadc {
+	status = "okay";
+
+	channel@44 {
+		reg = <PMK8350_ADC7_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "pmk8350_xo_therm";
+	};
+};
+
 &pon_pwrkey {
 	status = "okay";
 };

-- 
2.42.0

