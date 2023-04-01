Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D14D6D348A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Apr 2023 00:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbjDAWIT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Apr 2023 18:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230192AbjDAWIQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Apr 2023 18:08:16 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF45426275
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Apr 2023 15:08:14 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id s20so6332582ljp.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Apr 2023 15:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680386893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFzU/RoZm6eZTzjO9SylWYXHFKUfHNnvYIBQnLL1hz4=;
        b=OLQ5z9ab/AYzJPGYpJPW7PIEuthr4UqQQJOmecbXz44JAr6M6SwvXp4Nbeg234uusD
         BuACEu2ROamWJ7A7MSxbbY1go87El2ldsV9FqlA3O7XC1UkkuboJDaTrNQDs24lCg2Fe
         QKf9n2XPz12uVt7M0I2EnuF8HL6S19d9TiJklJcUoWPlF2zaNwDjALejNJfQwlMWWS47
         ukxKt1qXSQ4jnNwn14IcNN/dlUyWGxl9elncOgv0/iTVq/1zlh1/9h9qwCgDn4sDY0rJ
         pGdLl9LTAxetb9FOnIVzcHNUeZ+nqq6tgC6pb221ml+MvbllmiDa00opuzpvVSs12fxa
         /rkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680386893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFzU/RoZm6eZTzjO9SylWYXHFKUfHNnvYIBQnLL1hz4=;
        b=H46Scpbt2zwrs17H9/a3BKD4ilebrgwXs4cu2kTXBab33qG3pYSy8X7mAK11Ir1Klz
         FUGHCEy3U0cP3x8jUZEknYOk5JVD8hKkD01HhcXBpTHLQs46XTDNQge15a/mo2JpbBJy
         bbaHPZw2qjj/r/uUt8rm62/s5K22RhlpT0WlzX1X7XJXqX0/C2ZkjAXtVkNQyddHzF79
         E76/AWCs7KIGlsu1AjnMU+s2XKKDjdaruu6BImYVgmX7PZZmnj849r/iIyCDAYUGVmQ1
         nMPmWVNZ2KPFTvVyUGixcdr7yhq2H0QSULHaNrgSok/fWiupylbMkhVboS3Xn43bB4Su
         o9nw==
X-Gm-Message-State: AAQBX9ceOyw+jiaiCip+U+MCvB4MHsccd0XR45dHPLwNDFlifXFFySdA
        q8wXJdmQC99tgrd0CztRy0nDTg==
X-Google-Smtp-Source: AKy350YfduvZUjFyAhN1cJuc78kmuFkWFASvlJSIoiIOn9AjnzwJB5UoUNwosWtAYG0ORgrgazhgTQ==
X-Received: by 2002:a2e:82d5:0:b0:2a6:16b5:c656 with SMTP id n21-20020a2e82d5000000b002a616b5c656mr3094350ljh.46.1680386893213;
        Sat, 01 Apr 2023 15:08:13 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k17-20020a2e9211000000b0029bd4d0d3f2sm997590ljg.33.2023.04.01.15.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 15:08:12 -0700 (PDT)
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
Subject: [PATCH v2 03/22] arm64: dts: qcom: sc8280xp-pmics: use pmk8350 specifics for pon device
Date:   Sun,  2 Apr 2023 01:07:51 +0300
Message-Id: <20230401220810.3563708-4-dmitry.baryshkov@linaro.org>
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

Following the commit c0ee8e0ba5cc ("arm64: dts: qcom: pmk8350: Use the
correct PON compatible") and commit f46ef374e0dc ("arm64: dts: qcom:
pmk8350: Specify PBS register for PON") use "qcom,pmk8350-pon" compat
string and add RBS region to the PON device.

Fixes: ccd3517faf18 ("arm64: dts: qcom: sc8280xp: Add reference device")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
index c35e7f6bd657..a3c7369f9594 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
@@ -59,8 +59,8 @@ pmk8280: pmic@0 {
 		#size-cells = <0>;
 
 		pmk8280_pon: pon@1300 {
-			compatible = "qcom,pm8998-pon";
-			reg = <0x1300>;
+			compatible = "qcom,pmk8350-pon";
+			reg = <0x1300>, <0x800>;
 
 			pmk8280_pon_pwrkey: pwrkey {
 				compatible = "qcom,pmk8350-pwrkey";
-- 
2.30.2

