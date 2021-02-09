Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B11543157F1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 21:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233277AbhBIUrV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 15:47:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233823AbhBIUjm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 15:39:42 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBFA5C0698D2
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 12:29:01 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id f1so30423362lfu.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 12:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6OxpCi4/ew0z4JtIeTxbcNZX4otnbAgHcS0KslAEtyg=;
        b=AjJtABr2CUrHE5SzrGNhAZLssHLpD3gFc11wcoYbY+Fzgmv0H5HrcUsWY+Sd8j6+6m
         OdxLy/hQx1oAi8rnlywCpVwrKx75CBjPk1PiAOhUHmWEQxWaEiJCRnIFEXBQ1+KKhUMp
         ugfBUDB2Bbj+WHdl7PcN41t/2oqN6bmV9LQA8yMXhcsOk/R4Ra6nGoH8gbib31GdZhxo
         wZjpQNcpduT34Y6l0T2z1vTlu8HpWaA2iO1PFkbXflddCrqW5xf9aG5xZb0FFJ+92ZnO
         PDRlVvCuBzJwWdEkjw5x7tO5gCGcTBEilwOEB8cfabqdntHf32Wwn5pUoKudA3/O3kWB
         BXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6OxpCi4/ew0z4JtIeTxbcNZX4otnbAgHcS0KslAEtyg=;
        b=o+Vu8xrNNZS1QogJ+MApipoFI2RfCTVETPmUs1CUhhuRFovacD6P9P0hQT+aoSsNyx
         3Cp5rJtobCYdngZLMU32QRTJZw4sgam/CujWpXBm1u1QnVQ9nqzFH2jhwmo7Jmr6BIPn
         FQWqPH/BqPpyEQGIa7ynfK1qvzwC5mIURiPwkAJZbwThMmmaaJ25LspDUGBjeTQgD8Pd
         xX7jaHASog3vufW+0818FMUieDzOdEm5ZU1ooFBSeiFkDZ97mUz3qKQCDVQhzum0Euyp
         iv+r3VxDEOpJBFn4gA3vI8ChHZSjhYaKPs4d/wcsrXzSWP/8GSLshr6uXuG2D/bI5tXE
         15UA==
X-Gm-Message-State: AOAM531D0k3DMnd8Gq8ba82uf2znjc6zwlmPszX7n/NhUqb6dIyC8MfI
        nEuMr62KfmYAOxY1iNdS+g+gmA==
X-Google-Smtp-Source: ABdhPJw+ejMsm190iix0E46MoZBDuSoo/sM8mSoP+ownqrINa4TeoBUi5YswFFH+mFuFdo7+S+g8lg==
X-Received: by 2002:a19:ad0a:: with SMTP id t10mr14502263lfc.471.1612902540296;
        Tue, 09 Feb 2021 12:29:00 -0800 (PST)
Received: from eriador.lan ([94.25.229.138])
        by smtp.gmail.com with ESMTPSA id o19sm2680449lfu.182.2021.02.09.12.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 12:28:59 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 4/4] arm64: dts: qcom: qrb5165-rb5: switch into using GPIO for SPI0 CS
Date:   Tue,  9 Feb 2021 23:28:49 +0300
Message-Id: <20210209202849.1148569-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209202849.1148569-1-dmitry.baryshkov@linaro.org>
References: <20210209202849.1148569-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

GENI SPI controller shows several issues if it manages the CS on its own
(see 37dd4b777942 ("arm64: dts: qcom: sc7180: Provide pinconf for SPI to
use GPIO for CS")) for the details. Configure SPI0 CS pin as a GPIO.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 922f329d623a..d329829c61fa 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -815,7 +815,7 @@ &pm8150_rtc {
 	status = "okay";
 };
 
-&qup_spi0_cs {
+&qup_spi0_cs_gpio {
 	drive-strength = <6>;
 	bias-disable;
 };
@@ -963,7 +963,8 @@ codec {
 &spi0 {
 	status = "okay";
 	pinctrl-names = "default";
-	pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
+	pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs_gpio>;
+	cs-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
 
 	can@0 {
 		compatible = "microchip,mcp2518fd";
-- 
2.30.0

