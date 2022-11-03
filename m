Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98D02617A78
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 11:00:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231400AbiKCJ7o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Nov 2022 05:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231479AbiKCJ7V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Nov 2022 05:59:21 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61F8010B43
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Nov 2022 02:59:20 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d24so1433426pls.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Nov 2022 02:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovGmWGEFek9qXG4TFGL3Y1HZ+FQHWFsyzBtE4ZTGMB8=;
        b=ukcoVkO49m8jT3BkxxfryDEtJyfySYuJTObNq/6Fc/9gDVl9a88sUpnp8lBaEPMIVw
         PtCzUgPoCKmVHqEZ0UQyPE7U5Qns0SyKoxFCZBJl/8H6EGZinTO0p6KD4AkljZhEnW1V
         9vkzR6FTYUtfJQyeVCaFu7cDWnuRDsmAGRxiXMjaMXJh0C7PxKrEWL9Ji1g6ioMG0bLf
         GgVLrRdyVygHSmW7+wgE8qihCyB9y78Tu35zBx/p83QhWkDGpa4siz+CACuOjU9HBA60
         /TLco39BVsLKeNtZ+7HisA+GuVy9CUHt/UYjeAI5TtKomfMDNIlP5XvFtJxyGz4WIlg0
         4fCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ovGmWGEFek9qXG4TFGL3Y1HZ+FQHWFsyzBtE4ZTGMB8=;
        b=oB7F3tE/5c7gQfZsF3cBfOc6+dyyLZRUDWJGqQWBR2dL+MV6gwqXDFUXyf6gSm3tN4
         sO4paxx+FftCkggS2puDOX9lUTPhzW9Wt8J9ufqg38e1488hfHnFMfuc2tT2pCpEjLXk
         0mFiiRIA7xyOAV4tueTZGPhb6qBvrcoTLelbV4kpxz6aFfFY4T+Cx3wBaalvgvw1yTYe
         OiF3eLEeIBxl2nfef7e+z/VeMwtgltMI9+ogwcpB6Fnw4CzJkbWq6SMYl6AnDcSGBDVB
         tM63elejB6c0xqikZTGC5RY0N759xqIQNbaRRuDoDGHUwfVxVApmwujrNk9vMOB4PGUp
         sn9A==
X-Gm-Message-State: ACrzQf1+LkzWz/CsgRWigrrTwbA4/pcDm5vJYqpkcTtJy76005YKstvk
        hbpLdjeU3vr6kQ0fBaTCInze
X-Google-Smtp-Source: AMsMyM4+ZcFem6YMG2LayJ6HHCMEDcPdyx7nPLDmVxDdMLqY39AfHpMg7v4gLwmVrb4doYj56aBaQw==
X-Received: by 2002:a17:903:2285:b0:188:505b:25f with SMTP id b5-20020a170903228500b00188505b025fmr4005750plh.71.1667469559849;
        Thu, 03 Nov 2022 02:59:19 -0700 (PDT)
Received: from localhost.localdomain ([117.193.208.64])
        by smtp.gmail.com with ESMTPSA id n6-20020a170902e54600b00186c54188b4sm161670plf.240.2022.11.03.02.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 02:59:18 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 10/12] arm64: dts: qcom: sc8280xp-x13s: Add PMR735A VADC channel
Date:   Thu,  3 Nov 2022 15:28:08 +0530
Message-Id: <20221103095810.64606-11-manivannan.sadhasivam@linaro.org>
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

Add VADC channel of PMR735A for measuring the on-chip die temperature.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 807d74026fab..7677fe5cf28e 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pmr735a.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "sc8280xp.dtsi"
@@ -246,6 +247,11 @@ sys-therm@347 {
 		qcom,hw-settle-time = <200>;
 		qcom,ratiometric;
 	};
+
+	pmic-die-temp@403 {
+		reg = <PMR735A_ADC7_DIE_TEMP>;
+		qcom,pre-scaling = <1 1>;
+	};
 };
 
 &qup0 {
-- 
2.25.1

