Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D96F617A7C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 11:00:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbiKCKAC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Nov 2022 06:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231318AbiKCJ7c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Nov 2022 05:59:32 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3970510FC8
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Nov 2022 02:59:31 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id p15-20020a17090a348f00b002141615576dso4683965pjb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Nov 2022 02:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zLxFJEASSU3tUrFfThzdsPS2NuaYzvPoadCkKwT1l8=;
        b=koW3fgyiskpJg315ThqxKVECKYwUmEhPRt72Yf0apXAI1QAGbKgenxyI5dHW/b5E/8
         vIQJR0tsx5hsTRYHEQ5LAavp9JzPf5uCdNfMmBmU3jhDa/LpKJgjwFNcAvRuOmWh6/xe
         qm1v5GUayZiJrhloYiID0z3RlTIMMwYGyZOJk3oMPn2nN1eyp3g4C7XSdMmWj/fFyCvE
         l4bWZpUQiDcmb9DFqChYVBTwweowx6GMNzqZxqoXL98HYJG9eSBfOqAEKe1L3I+0I3H8
         jDqn4Bg93y8EkxOEcZlaN7elVfNr433JO5E5YnQPR7cqaTUMjcydFcmvpZx/h2ZDeIm2
         lWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9zLxFJEASSU3tUrFfThzdsPS2NuaYzvPoadCkKwT1l8=;
        b=QpGlD9N6yY0rn1zsuxd0XqOoCyob2r9usbW6Q9KWmdgGVwBCYKojNaw6CE6m599np3
         /ecn/qb1cewR+j1NO4RCCtb9sh6olo30L177x2JevvADanPlv3E5UoZ2w9Z6sSIQaico
         +stBJs+iTsem1K9GJ0vOjfkKLQTU7MjEP/5CRKP5m+lcTQM0841fgaKGcKEbBDoeRaCs
         apo8lXTO6wKgd3sWOTKSSHDB/yChNvWcgNz7xduc1ydTmYDOCra9kMHS08WkE2j/0TUr
         J+2yPYmUCefJoU/YcWUYU1L7Qd7sqrdhS4m0YGAqXj+iwDCzVRCPAWRkm2Dx77sFTg3Z
         i1zw==
X-Gm-Message-State: ACrzQf04YGpkcjBnVl9+ZrmFG5P4T0UlbMg3aDcBz/7tBdbX4q3YjbJw
        pyjlTIVBf12YZDwx0QzzKvfW
X-Google-Smtp-Source: AMsMyM4HiYKwRQ6GoEQbmXFqlpxyrE58hUnvlciw6ItSGxPFLPnEhOQM4IF03UISktY3zxI/uYvdgQ==
X-Received: by 2002:a17:90b:1bd2:b0:212:cf30:3d53 with SMTP id oa18-20020a17090b1bd200b00212cf303d53mr47015471pjb.18.1667469570616;
        Thu, 03 Nov 2022 02:59:30 -0700 (PDT)
Received: from localhost.localdomain ([117.193.208.64])
        by smtp.gmail.com with ESMTPSA id n6-20020a170902e54600b00186c54188b4sm161670plf.240.2022.11.03.02.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 02:59:29 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 12/12] arm64: dts: qcom: sc8280xp-x13s: Add thermal zone support
Date:   Thu,  3 Nov 2022 15:28:10 +0530
Message-Id: <20221103095810.64606-13-manivannan.sadhasivam@linaro.org>
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

Add thermal zone support by making use of the thermistor SYS_THERM6.
Based on experiments, this thermistor seems to reflect the actual
surface temperature of the laptop.

For the cooling device, all BIG CPU cores are throttled down to keep the
temperature at a sane level.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index bdaacf1abf9f..60dbc736f4d7 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -29,6 +29,52 @@ backlight {
 		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
 	};
 
+	thermal-zones {
+		skin-temp-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <0>;
+			thermal-sensors = <&pmk8280_adc_tm 5>;
+
+			trips {
+				skin_temp_alert0: trip-point0 {
+					temperature = <55000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				skin_temp_alert1: trip-point1 {
+					temperature = <58000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				skin-temp-crit {
+					temperature = <73000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&skin_temp_alert0>;
+					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				map1 {
+					trip = <&skin_temp_alert1>;
+					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
 	vreg_edp_bl: regulator-edp-bl {
 		compatible = "regulator-fixed";
 
-- 
2.25.1

