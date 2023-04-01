Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 185E36D34A8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Apr 2023 00:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbjDAWI1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Apr 2023 18:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230244AbjDAWIX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Apr 2023 18:08:23 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 768242658A
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Apr 2023 15:08:21 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id z42so26613788ljq.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Apr 2023 15:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680386901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYGHiV1R/+Oqzp8BCM7u0HdJIZFvTeY8mPEGVCR3FyQ=;
        b=kHI2t57u7p0BpVvemoRzS/NGuVuUORCogJwJ/7g/qJHlL0UX3gRr38f6cmYu8THEMC
         x8kfEFOQZy8KeEsmoyoBZCppVAEmDCwolrjfI1gq97w0zuBFT/ewBCiFNEF5qAfH4fer
         wV1swBCcCp3rt4AUBFfLd/tuN5U5Q+b88+igCUAmIGXAgRshwFYNoirTg06Fhgze2dws
         UElfNDkTXA2MPjnuYDHGO3pgraScZGNBmqg1YJRaqL9z0tA7J1gjdogOEuzA9++nyRqq
         PrwcV6maJ5cOwFsEKAJpHbExp0VSobl8ZhnsB5H3QRMGOp5ohDORZDJJYMK4u1fCtYXS
         jaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680386901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vYGHiV1R/+Oqzp8BCM7u0HdJIZFvTeY8mPEGVCR3FyQ=;
        b=QaMgSee5h9y4fCmmVSFE9KIBsmStO8LX7vHbcN5nxdw7m0vVqwKeG0caiWJa52PvFd
         /F0gL64LZ/xWajh/CX+UTleN//Y/OIaTGS7QMU1NzAQMuvC9uIESrZnBwWZxu5QAd3s+
         y+fMJUWjC5G8qmRkYokR29czap8f0B8HUA8fUdinXuuRfHfbQfrJ9/V5Y0J2IObmA7yW
         Q7Yt5DNCLb0xsOweANcc3e5XNqJceTvyoYkbggvRbjH5hTl8GjcKuG0DUeywga8IQOfD
         NHQWfB05ZWsDRMKkh9f3mNlqLoFG6XedAaHjBKTHw4S0+RG/pUtspG1F4v77FCGjSPhP
         0yZA==
X-Gm-Message-State: AAQBX9czf8KBnm99OMgRNH4HLSGHxBmKlSzHucnddTrAAFivAUqDMoOZ
        wJann+VRrbG/24YpryPkLQw7DiPfihVgiAt1jZpZew==
X-Google-Smtp-Source: AKy350abCZAwgc2ptKlDUYnZiI0LSIlKkFQZRJs3PmEPliroMxlWrUW4so3U1mtaLRe0CJfI8jwSYA==
X-Received: by 2002:a2e:7215:0:b0:2a3:3b80:509f with SMTP id n21-20020a2e7215000000b002a33b80509fmr9198775ljc.34.1680386900928;
        Sat, 01 Apr 2023 15:08:20 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k17-20020a2e9211000000b0029bd4d0d3f2sm997590ljg.33.2023.04.01.15.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 15:08:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org
Subject: [PATCH v2 15/22] arm64: dts: qcom: pm8350c: move thermal zone declaration to the top
Date:   Sun,  2 Apr 2023 01:08:03 +0300
Message-Id: <20230401220810.3563708-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230401220810.3563708-1-dmitry.baryshkov@linaro.org>
References: <20230401220810.3563708-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Other PMIC files have thermal zone at the top of the file. Move the
pm8350c's thermal zone to the top. While we are at it, drop unused
labels.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8350c.dtsi | 48 +++++++++++++--------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
index f28e71487d5c..ee25c07ce31d 100644
--- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
@@ -6,6 +6,30 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
+/ {
+	thermal-zones {
+		pm8350c-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+			thermal-sensors = <&pm8350c_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pm8350c-crit {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pm8350c: pmic@2 {
 		compatible = "qcom,pm8350c", "qcom,spmi-pmic";
@@ -37,27 +61,3 @@ pm8350c_pwm: pwm {
 		};
 	};
 };
-
-/ {
-	thermal-zones {
-		pm8350c_thermal: pm8350c-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
-			thermal-sensors = <&pm8350c_temp_alarm>;
-
-			trips {
-				pm8350c_trip0: trip0 {
-					temperature = <95000>;
-					hysteresis = <0>;
-					type = "passive";
-				};
-
-				pm8350c_crit: pm8350c-crit {
-					temperature = <115000>;
-					hysteresis = <0>;
-					type = "critical";
-				};
-			};
-		};
-	};
-};
-- 
2.30.2

