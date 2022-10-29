Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F35B761206F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 07:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbiJ2FQX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Oct 2022 01:16:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbiJ2FPv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Oct 2022 01:15:51 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B567C1D2F45
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 22:15:45 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id l2so6514399pld.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 22:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHFiT+TZb5B1WGujexyeyAlYCgIQjWunzDzNjtB/Zig=;
        b=JdUNhwrzxVYK2G8LaQKWsqiOd9eEsYUrt0x1ktLfZpKvzCgHclt6lcmdXuATw5K0Zr
         9scTUH5/Ya9g5YMYXYw6eQ9N0uBcOb57RsYe09tsJrUXse1Q6Wcg1DNu8aKclocM7pnt
         OXVL04hgbc5mqCeHoJHcwUp3RfQiVrbacJLQiXgiDS0GkUsJcsYExZ6bq2vKO8gui9nx
         DjTk3Vtw1Ok3N2K7xDkVTGTCtIEhbFTrfuNCLtI1Qmda4a2+/ngjkOH41FXdhVQ6F3am
         Dk9PUMUZBfrfaeyML7WtavBCfvU5KTdXMxkEfdKSlAc6jdZSb0LjKFEo16QSG6L4q/h3
         w7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHFiT+TZb5B1WGujexyeyAlYCgIQjWunzDzNjtB/Zig=;
        b=mhOFMZcgGJakMycQ76RMH12P83HY76o6EPB1jqBE/gwyyA72EyZAQDKKvn9uRDvxDA
         cPo/U+0RbTRaA11AvH1ZNm65U70FIj21LFoDt3G5uBmiNRsuMDEn/NoJoSGyLIMMGsKN
         gdENhdoZ6M6OXJqfrs7V8tH5MnHZ9dZiuIYthnE5RmmY+G030IeSWpn51tenDCk/WgQY
         h2lPWKuZz/F7JeWW+vvUc2nIN9GvcE75Mn6tNC/PQSYYaSDpcflcNCIQSfgsTsU12Rnz
         fFY9u3yRCTvNjR17ygejGaVpOsNMB6+KLhi6Oio2KB9bA60ryOVdm4OqGrYs9VsnwzSc
         a71w==
X-Gm-Message-State: ACrzQf1ePg2yoviC1JwjvbiC30qdfObPv498b39nXpL7+pPih9zbcJFI
        vHCb0P3J6Xw/fXV9wVh6otPp
X-Google-Smtp-Source: AMsMyM5kQRU46HsVC2D8IYv1AbzOgD3X2Kpm9vKnInBbk6MHkqH2frQT/bbTFNnywZFkOl+M6QQvhQ==
X-Received: by 2002:a17:90b:4d0d:b0:20d:6fc0:51 with SMTP id mw13-20020a17090b4d0d00b0020d6fc00051mr19854994pjb.10.1667020545210;
        Fri, 28 Oct 2022 22:15:45 -0700 (PDT)
Received: from localhost.localdomain ([59.92.103.167])
        by smtp.gmail.com with ESMTPSA id f5-20020a170902ce8500b0017e9b820a1asm363150plg.100.2022.10.28.22.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 22:15:44 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 08/12] arm64: dts: qcom: sc8280xp-x13s: Add PMK8280 VADC channels
Date:   Sat, 29 Oct 2022 10:44:45 +0530
Message-Id: <20221029051449.30678-9-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221029051449.30678-1-manivannan.sadhasivam@linaro.org>
References: <20221029051449.30678-1-manivannan.sadhasivam@linaro.org>
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

Add VADC channels for measuring the on-chip die temperature and external
crystal osciallator temperature of PMK8280.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 6aa8cf6d9776..18315743313b 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "sc8280xp.dtsi"
@@ -173,6 +174,23 @@ &pmk8280_pon_resin {
 	status = "okay";
 };
 
+&pmk8280_vadc {
+	status = "okay";
+
+	pmic-die-temp@3 {
+		reg = <PMK8350_ADC7_DIE_TEMP>;
+		label = "pmk8280_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	xo-therm@44 {
+		reg = <PMK8350_ADC7_AMUX_THM1_100K_PU>;
+		label = "pmk8280_xo_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+	};
+};
+
 &qup0 {
 	status = "okay";
 };
-- 
2.25.1

