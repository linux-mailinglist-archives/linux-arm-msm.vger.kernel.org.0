Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7CEC617744
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 08:10:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231272AbiKCHKk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Nov 2022 03:10:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230497AbiKCHKR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Nov 2022 03:10:17 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA7C3D61
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Nov 2022 00:10:14 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id 64so920819pgc.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Nov 2022 00:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5R9xZuZbY/XGHJi8KmbLI1THL0sZLR4+LZJSp8iZfo=;
        b=bA2sspvLerepZQqeJC8DXv9+AoK6QpZ17X0J0n2MTOWqMdDgWVIW+kUsfdh7OdO+nm
         XTY4ieqgvYb85arBe0P67vKSYgULeLCn0g7m6DxZbn92S4wOQAPiYWJMXasAkCDbdTOv
         YX8OoUnZamoFvnKDm6WPdM34vht0JYjNcy0H6jqeupQszC3K/cV1Eilly/F4BLSqFmhq
         50NeKgfdWkNu2fk0J0wqlKSzvnj7kbHDPb/d5YxPhIPD1QboO6uDWJc7u/DMCEaEpyf0
         iw2Ynuf9Kwm23rSGcaCDdj3Uj3jsccl9GMGI1HmWoBeyBCuXVMedXslR7P53wIJtMGmf
         xRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p5R9xZuZbY/XGHJi8KmbLI1THL0sZLR4+LZJSp8iZfo=;
        b=8DR3CWHLLqn1GSUmhaEN3AFaMP4+EmWP12a6j6ItHo1X4NDqOinZDZ/1QoM3O2Mpch
         JoW+3Edqw2oi7+tvBNRgHDTFefLHC6fSPk43vzbfoPxU82LOpnCyceTXgt0cL3Qy0Jj2
         QMrBi0cxBrbCGAK2GjqHjwbT6mT3Beh1GXhOCMoS14u+aivBha5UfD7u7ERXuTnO3Rcs
         KdBlPpjKl5abSF96X851jMxojAXmzGI/irLy8Hw1EtP9N570VaQvwVwe7FR21LXVVsUS
         soFb0cOxpw+adi5qsKtx3saH70QmqFMCeuSMhExhCKL/mllSlVPSTXCinueBhq0SS7sr
         u9Lw==
X-Gm-Message-State: ACrzQf3cvGaVKKZGP3bWWzbsxbxiGXM0uNk5d2TCP+AFBaKfN/BkHvjT
        eEPONWh+JGxFDd3ZAxiT0ynfps0NNPuF
X-Google-Smtp-Source: AMsMyM5DPwKdObP5xKIO4NyXX3G8rEjDfz5BQI1doZU0JU9V2+0L72bQfauMLXw2Pjkbk5U0dgz2vQ==
X-Received: by 2002:a65:458a:0:b0:46f:33df:46b0 with SMTP id o10-20020a65458a000000b0046f33df46b0mr24516191pgq.564.1667459413946;
        Thu, 03 Nov 2022 00:10:13 -0700 (PDT)
Received: from localhost.localdomain ([117.193.208.64])
        by smtp.gmail.com with ESMTPSA id s9-20020a170903214900b00186748fe6ccsm9451244ple.214.2022.11.03.00.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 00:10:12 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 08/12] arm64: dts: qcom: sc8280xp-x13s: Add PMK8280 VADC channels
Date:   Thu,  3 Nov 2022 12:39:07 +0530
Message-Id: <20221103070911.20019-9-manivannan.sadhasivam@linaro.org>
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

Add VADC channels for measuring the on-chip die temperature and external
crystal osciallator temperature of PMK8280.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 6aa8cf6d9776..cc51739e7dc5 100644
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
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+	};
+};
+
 &qup0 {
 	status = "okay";
 };
-- 
2.25.1

