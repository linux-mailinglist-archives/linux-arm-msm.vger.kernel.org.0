Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23D0F316824
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 14:38:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbhBJNhi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 08:37:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbhBJNhf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 08:37:35 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D18F2C061788
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 05:36:49 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id f8so2866098ljk.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 05:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aK1zZXBJUAesiTcZ2DdzeHPqINgLI3zWwLdAC92qVXs=;
        b=KTF5zhmcXC+u7osPF4gL6tC+difgIzOS6ivNlP0vnlzryyP6e9S/LX/cC2hMQrUAoS
         4xCncqO7WvpMOITDojVvQJH5Q8j64lpszJxR1DENYvLK9Y8QPauziyHLe1/uJV8WyWdT
         5kq68rMeBhs1KXmzzL3V4ouN46Vdynd9dCIe2m67S2MU04H68puWDQ5v4Dl/BvRNvAGB
         AxR5iBwZHeV7Zy0GzTi/cX++JXeMBGFuD8VFEaFA/IcqCWipob8qiLSuICDjz9t9TnIj
         mKctACrLG7xDigYNmkj1pRmxc2bjyrTXj0UcJf3C6qa3tg5X+uw+m1YQrsqj9xO8JQW1
         YOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aK1zZXBJUAesiTcZ2DdzeHPqINgLI3zWwLdAC92qVXs=;
        b=KKaC3ZYGzK97i5G0swzzbphR9hg5/JJuUaUFgxkpvKsIPxd4iDV+QYQgp0l6pgTgM4
         zElVFlGMlRPc7jgp5/BsHgIeUk2S6uUj269zdCKidnX5H/U9Cp5buu6qFEfdPIHpJp/z
         wgjTELe9M/6PurHwBlu+yC+9bPjmbim0kEgKI0NAaVbhbMzoamE+HpSs5qZE2lpw5AR7
         BY2KNQXRPuQOgK5hMNgYIumsT8jX4SRf0+EoCa+qX+PRaXc59ux6Zp7nYDwYcDY9U0QN
         bjoDAcZoMkrUAirlXNu1mH0Q9WqE+fHJQ2x1nq3W4O7e4ThYMDSxCdnPsF2BeHALUzCI
         1xaQ==
X-Gm-Message-State: AOAM532vmaXNltcbKEiAVRYg5obw84JUQ+I8W1xXJDlScDJ/4XrKqMvi
        C6m/gdtRRN3bmveA4fSgqW6/bWgj8jr+no96
X-Google-Smtp-Source: ABdhPJyh6Q3adIcheQPIN4EE9hdDIa2LeuVrwNH5AZynEcGSZS1E49y9NO2JF3KGR2P2wj0GXZQDsg==
X-Received: by 2002:a2e:ba18:: with SMTP id p24mr1910103lja.488.1612964208422;
        Wed, 10 Feb 2021 05:36:48 -0800 (PST)
Received: from eriador.lan ([94.25.229.138])
        by smtp.gmail.com with ESMTPSA id c8sm332629lfb.168.2021.02.10.05.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 05:36:47 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 4/4] arm64: dts: qcom: qrb5165-rb5: switch into using GPIO for SPI0 CS
Date:   Wed, 10 Feb 2021 16:34:58 +0300
Message-Id: <20210210133458.1201066-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210210133458.1201066-1-dmitry.baryshkov@linaro.org>
References: <20210210133458.1201066-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On the GENI SPI controller is is not very efficient if the chip select
line is controlled by the QUP itself (see 37dd4b777942 ("arm64: dts:
qcom: sc7180: Provide pinconf for SPI to use GPIO for CS") for the
details). Configure SPI0 CS pin as a GPIO.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 638231f48388..f18c703d024a 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -953,7 +953,8 @@ codec {
 &spi0 {
 	status = "okay";
 	pinctrl-names = "default";
-	pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
+	pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs_gpio>;
+	cs-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
 
 	can@0 {
 		compatible = "microchip,mcp2518fd";
@@ -1356,7 +1357,7 @@ &vamacro {
 };
 
 /* PINCTRL - additions to nodes defined in sm8250.dtsi */
-&qup_spi0_cs {
+&qup_spi0_cs_gpio {
 	drive-strength = <6>;
 	bias-disable;
 };
-- 
2.30.0

