Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9CD617A60
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 10:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbiKCJ67 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Nov 2022 05:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231302AbiKCJ6o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Nov 2022 05:58:44 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E5022667
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Nov 2022 02:58:40 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id o7so1153139pjj.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Nov 2022 02:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtTSpSbfumSkzodKqVV1fmVK+FiEe5+Z9JKtf5BK8+4=;
        b=aCZoUBB/X3p+4jRdTA1UDeSZXi70clp+Uq6wKKcvxQgfd3iiflBaJdPrfGWZnvQBQ8
         ayziIcAIfzMgk9CEqxHpPuVjOmzY84M58Jj/0G4JFOSTQ77xXMFi5Bv7DY2FiBK9zJ4r
         aXP4ooaylqOTT1gzZhtgebq/IbZkU1273nS4ThfBnCXOzZa4ODskUbBQOqbACJQUM1gt
         gn73qU4zrBnHg1G3CjYSHI9tz+Yc1rcHBmhJnSnS6BADPt6x+X/PKi61gaoD43vw50Y4
         6aMJy2XZ6aXDjeaR1bVPEfHnw4OEgpZgVYAltZuqrgxM4W6QSa9ozhi2zJH9cbQB9HL7
         3toA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtTSpSbfumSkzodKqVV1fmVK+FiEe5+Z9JKtf5BK8+4=;
        b=McPRAknaEFL9NZ3hFwGsxmIK6yypL044l/yY/jxu+/PplVsJQuP23sMmCMSusiSTmJ
         0queKW9JDVEomQ68cZlPy7zklcCfdke4+5iL/idb9QRy0DmFJ3tynoiJMwpWvKM4ODgN
         5kjEGCzqs9Uo8h/UyJDRinb07r5MM3H1xoUzYhaOyF0t6aY0nmhy2rmHwajl4guALOaZ
         3VWlpKhNpC6/BrWU6Omc8FQx8ry9S36jSiKIYeUWl1ABRxErGfPwG3Ah1igR10OLg+Zq
         pB938/GEX9alBFPW4GE9omzwZYFnyagGQ8n/50MjFweax3lp3JVa+nGWeEOk1M95bt5u
         XssQ==
X-Gm-Message-State: ACrzQf3TsKtPc8CemLNP3pWY+QOJ9DpcSNJ5/9VwgwKzK7XJDr0EE55+
        rD7R8h09uO89hB26yxo3U7JW
X-Google-Smtp-Source: AMsMyM4ovyezYvXHVM7+ea6/FUng8bG0R8bS4eHm9/JtohfoRv21FKWVAdr8L5/SJYk72MVBb1NUhw==
X-Received: by 2002:a17:90b:278b:b0:213:c2f2:6ca1 with SMTP id pw11-20020a17090b278b00b00213c2f26ca1mr25396473pjb.103.1667469519966;
        Thu, 03 Nov 2022 02:58:39 -0700 (PDT)
Received: from localhost.localdomain ([117.193.208.64])
        by smtp.gmail.com with ESMTPSA id n6-20020a170902e54600b00186c54188b4sm161670plf.240.2022.11.03.02.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 02:58:39 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 03/12] arm64: dts: qcom: sc8280xp-pmics: Add thermal zones for PM8280_{1/2} PMICs
Date:   Thu,  3 Nov 2022 15:28:01 +0530
Message-Id: <20221103095810.64606-4-manivannan.sadhasivam@linaro.org>
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

