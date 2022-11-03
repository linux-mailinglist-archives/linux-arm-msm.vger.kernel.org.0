Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2DEB617748
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 08:10:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231290AbiKCHKt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Nov 2022 03:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231219AbiKCHKX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Nov 2022 03:10:23 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 441041261D
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Nov 2022 00:10:19 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id 130so836479pfu.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Nov 2022 00:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnwKnhoKUlY7xET1bNEuzraf9yho7HItYeI5FvzEIfw=;
        b=WrYcgJGWt1T9PEyXIgOyGmnFkUA9lXikNQrOQAnFWENMCETUd6AdNPDplYEoYAYWvk
         uruuAvIc359dmswBwGj5WCVCSp2obW5D8eZKm2g5IRBIySpclIZugyYTX4wIkYBmFkb7
         TY+1kXvpQ+CzCTL+PhOBiPqEIhXQOqauSJFLJBzhHT2GB01yaoMoSwO9uA9RnO++EMvb
         RvfgxukVNeNTRDpIVJ5bGwzWPjF26nk9nA+/OehSOcf/UQJhmW96qH/Aru7mxxDUKdRI
         gwHzsTf8Xd/PCN3w6zyMVTtej7rj/2QxAgcoQvJBKNE3/W8PNpijqKsNR+bZK3IrLcXI
         yiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gnwKnhoKUlY7xET1bNEuzraf9yho7HItYeI5FvzEIfw=;
        b=Os6T9GNpphNNFhafi4PWFQkX8m0Lg/KwdWHoyjx5b/TSr4ZhbNy3nE8WFLbHx4lwM0
         uTtN+8liXDU1rG2tfTk5njPIdwGOfZ6GjaFgp6ntRs44LDxhpbiKEluXCxqj6RS7AlRc
         YHUa+MYPGolV5PFO34AamoscZzBXDtXPUakMWx79j1sXciPO9U3QM47YDNfAUU8djAvL
         GgbCmRuXW2VlZoeZT30iMrbJLf8peuEojuq0SJSLqB0P4smXXmwtIPfdvz6WVVc7SJvr
         KtHRAeCCc+s9TtARlqmnW2M96/n94pDwOoAPnn2oloZd7yo4WuRMSha3swNzuI1BJoFq
         bs7w==
X-Gm-Message-State: ACrzQf2I6JrZWD1sRRixmgGib2B9M1SjOWjX6i0iQ07kN64YmWEWqSi3
        HciQwPGY1Z1ujkSogKSUFsSy
X-Google-Smtp-Source: AMsMyM40mVo0CltvJT60fFeyvKfdSMWET/rabM/OzqjFocKP0BVjgUw0qY9gdkbDIy9HHAQ52OjVkg==
X-Received: by 2002:aa7:8887:0:b0:56d:41a9:dbb7 with SMTP id z7-20020aa78887000000b0056d41a9dbb7mr23712407pfe.82.1667459419375;
        Thu, 03 Nov 2022 00:10:19 -0700 (PDT)
Received: from localhost.localdomain ([117.193.208.64])
        by smtp.gmail.com with ESMTPSA id s9-20020a170903214900b00186748fe6ccsm9451244ple.214.2022.11.03.00.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 00:10:18 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 09/12] arm64: dts: qcom: sc8280xp-x13s: Add PM8280_{1/2} VADC channels
Date:   Thu,  3 Nov 2022 12:39:08 +0530
Message-Id: <20221103070911.20019-10-manivannan.sadhasivam@linaro.org>
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

Add VADC channels of PM8280_{1/2} PMICs for measuring the on-chip die
temperature and external thermistors connected to the AMUX pins.

The measurements are collected by the primary PMIC PMK8280 from the
secondary PMICs PM8280_{1/2} and exposed over the PMK8280's VADC channels.

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index cc51739e7dc5..bb96c350eb09 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -189,6 +190,66 @@ xo-therm@44 {
 		qcom,hw-settle-time = <200>;
 		qcom,ratiometric;
 	};
+
+	pmic-die-temp@103 {
+		reg = <PM8350_ADC7_DIE_TEMP(1)>;
+		label = "pm8280_1_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	sys-therm1@144 {
+		reg = <PM8350_ADC7_AMUX_THM1_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+	};
+
+	sys-therm2@145 {
+		reg = <PM8350_ADC7_AMUX_THM2_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+	};
+
+	sys-therm3@146 {
+		reg = <PM8350_ADC7_AMUX_THM3_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+	};
+
+	sys-therm4@147 {
+		reg = <PM8350_ADC7_AMUX_THM4_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+	};
+
+	pmic-die-temp@303 {
+		reg = <PM8350_ADC7_DIE_TEMP(3)>;
+		label = "pm8250_2_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	sys-therm5@344 {
+		reg = <PM8350_ADC7_AMUX_THM1_100K_PU(3)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+	};
+
+	sys-therm6@345 {
+		reg = <PM8350_ADC7_AMUX_THM2_100K_PU(3)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+	};
+
+	sys-therm7@346 {
+		reg = <PM8350_ADC7_AMUX_THM3_100K_PU(3)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+	};
+
+	sys-therm8@347 {
+		reg = <PM8350_ADC7_AMUX_THM4_100K_PU(3)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+	};
 };
 
 &qup0 {
-- 
2.25.1

