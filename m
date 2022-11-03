Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E41B9617736
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 08:10:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbiKCHJ7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Nov 2022 03:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230387AbiKCHJu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Nov 2022 03:09:50 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 548C1B1C7
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Nov 2022 00:09:47 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id b29so817235pfp.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Nov 2022 00:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtTSpSbfumSkzodKqVV1fmVK+FiEe5+Z9JKtf5BK8+4=;
        b=wKzByP+Yy0l5kz/xLzh4XJ/LnUCChNU3MarJzDTcDJrXNkW9XTw+OqT/ZezjJeTE2t
         P1uEl6O+ECIE5pvBpiWgaub3JlWpd3PiGvKMVIIrAHdpBKNzivoHR+m65oKQK6N9gge/
         xK3BtQ3MEF0Mba/ktuZJykfkFFfvlsSOB2bU00suBM7ClgL//n9rFUdPafYokI9P+4ju
         WSpi4l8GFZJ/Ytm5QUN29ouMf/g+wnix9Sl12hFHPXsII8fNy97LITddl+xWxjjcHeAB
         7C5BQbC3rGZ5jeh+Jt+/YSjoON/Nj6oGteiTx5hg++Q0s2Hn5XkY9bgXICLc/nEa6LLW
         +LAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtTSpSbfumSkzodKqVV1fmVK+FiEe5+Z9JKtf5BK8+4=;
        b=6gdH4JbPS3MNMERUzqUBb1IElXG0mZiXBiApWNbNbzgs9iVcX+4r/AAAdFMp9bpm0B
         OwvqbR4K6MCEFQOblRRlInvvw987SJo/0LvWtAzASC2Pil9LSINXOvirgGgXHaAAbWQH
         /LtswqHnYEV3nIFNyDbt+R4vFNzaiaAD5WIr5HoL5ahTiY4dLlwIX4zOEFU0Hf1iYWVE
         nYNYXrSgNlGUXhycN4Bza1Y1hZTWrAW2wJJE+30erGYK39hT7g6iR9yK4jK8uIS8Hgi1
         WkKyUAeoqmu6XHhAthz1NEkgl7bkLN0hqN4Y4dM6Qkh9MNR15rpYpCEmxe4Hyji+3U7p
         lVHw==
X-Gm-Message-State: ACrzQf0yVdD+qHbG97SiSjOgdmlXpLbeEqxBqBWFT75Mkwl3HcxwD5+9
        g6cd8Bd4u0QFvtMgn5WIX1rD
X-Google-Smtp-Source: AMsMyM6DuYxF8np6A8GEqCOjPNuPMJe+voD7BLrX8PJGiwMWRjK12iB2oygJ89zASk7SOlC0291G5Q==
X-Received: by 2002:a63:1a45:0:b0:439:49b4:9672 with SMTP id a5-20020a631a45000000b0043949b49672mr24643996pgm.551.1667459386844;
        Thu, 03 Nov 2022 00:09:46 -0700 (PDT)
Received: from localhost.localdomain ([117.193.208.64])
        by smtp.gmail.com with ESMTPSA id s9-20020a170903214900b00186748fe6ccsm9451244ple.214.2022.11.03.00.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 00:09:46 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 03/12] arm64: dts: qcom: sc8280xp-pmics: Add thermal zones for PM8280_{1/2} PMICs
Date:   Thu,  3 Nov 2022 12:39:02 +0530
Message-Id: <20221103070911.20019-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221103070911.20019-1-manivannan.sadhasivam@linaro.org>
References: <20221103070911.20019-1-manivannan.sadhasivam@linaro.org>
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

Add thermal zones for the PM8280_{1/2} PMICs by using the temperature
alarm blocks as the thermal sensors. Temperature trip points are
inherited from PM8350 PMIC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi | 44 ++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
index 5de47b1434a4..397ff4995003 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
@@ -7,6 +7,50 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
+/ {
+	thermal-zones {
+		pm8280_1_thermal: pm8280-1-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+			thermal-sensors = <&pm8280_1_temp_alarm>;
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
+					type = "critical";
+				};
+			};
+		};
+
+		pm8280_2_thermal: pm8280-2-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+			thermal-sensors = <&pm8280_2_temp_alarm>;
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
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pmk8280: pmic@0 {
 		compatible = "qcom,pmk8350", "qcom,spmi-pmic";
-- 
2.25.1

